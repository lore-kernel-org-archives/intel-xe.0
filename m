Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14354606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZxXND2cr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0210E64C;
	Mon, 23 Nov 2026 07:30:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77F10E64C
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 07:30:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 25C3B42216;
 Mon, 23 Nov 2026 07:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D351F000CA;
 Mon, 23 Nov 2026 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795419022;
 bh=Y7xyNTRI7rRGuLs+XATFnhic1WNcCw9Im+MFl3vFok8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZxXND2crO3YReg+GccHtaRamP4/mlCeh6RmV5ZInh936eVSS+Yz6V/aqu5qcj4BnP
 P+2nh7nBci8IXx8DwcLWsX/IEoeFPHKEpnl62rljJdYwhAZ3K7i/Gjqx8d9aBqzUuD
 h/oc0tFqGEAeptfjLRCkwwFdQ2I8yYWNMZEsTG2QSwl1lN4YM461ei91s9NSOA+oyL
 RB17tloEXkSpUZ9OWzsYk14nLJ2yiYcNHynXrHHCSlPLfU6snkcGNKsglxt8ri/Zb2
 wzkVpeh/w2btosCKml+JkyMpopbSDKRcQh9I+FgcqOJUqsHxaGSjrrpyKTHyC+nRTL
 12BYioFJ1It4g==
Message-ID: <sashiko-outbox-228814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/ras: Handle SPI out of flash error
To: "Soham Purkait" <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261123070221.1611306-2-soham.purkait@intel.com>
References: <20261123070221.1611306-2-soham.purkait@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:30:22 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe/ras: premature xe_wedge_declare() in xe_ras_init()
  breaks probe
--

commit 07b9c0ad4fdd94029dc1f2b35d45d971a7d1846c
Author: Soham Purkait <soham.purkait@intel.com>

drm/xe/ras: Handle SPI out of flash error

This commit declares the device wedged when a page-offline command returns
XE_RAS_STATUS_OUT_OF_RESOURCES or when the offline page list is already
full during probe.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36a..76441858391da 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct xe_device *x=
e, u64 page_address,
>  	if (ret) {
>  		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status =
%u\n",
>  			   response.status);
> +		if (response.status =3D=3D XE_RAS_STATUS_OUT_OF_RESOURCES) {
> +			xe_log_err(xe, SYSCTRL, ret,
> +				   "No space left in SPI flash for bad pages, manual intervention re=
quired\n");
> +			xe_wedge_declare(xe, 0);
> +		}
>  		return ret;
>  	}
> =20
> @@ -504,8 +511,17 @@ static void get_offline_list(struct xe_device *xe)
>  	struct xe_ras_offline_list_response response =3D {0};
>  	struct xe_ras_offline_list_request request =3D {0};
> =20
> +	struct xe_ras_state *state =3D &xe->ras.state;
> +
>  	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, si=
zeof(request),
>  			      &response, sizeof(response), &response.common, false);
> +
> +	if (state->max_pages && response.common.total_pages >=3D state->max_pag=
es) {
> +		xe_log_err(xe, SYSCTRL, -ENOSPC,
> +			   "Offline list full (%u/%u), manual intervention required\n",
> +			   response.common.total_pages, state->max_pages);
> +		xe_wedge_declare(xe, 0);
> +	}
>  }

[Severity: High]
Does calling xe_wedge_declare() during xe_ras_init() break
xe_device_probe() instead of bringing the device up in a wedged state?

In xe_device_probe(), xe_ras_init() runs before xe_gt_init() and
drm_dev_register().  When get_offline_list() or a probe-time
send_page_offline_cmd() calls xe_wedge_declare(xe, 0), it sets
xe->wedged.perm =3D 1 while the GTs are still uninitialized:

  1. Subsequent GuC CT transfers in xe_gt_init() -> xe_uc_load_hw() are
     rejected by __guc_ct_send_locked() with -ENOTRECOVERABLE because
     xe_wedged_permanent() is now true.  xe_gt_record_default_lrcs()
     then times out in emit_job_sync() and aborts xe_device_probe().

  2. Because gt->initialized is not set yet, xe_wedge_declare() skips
     xe_gt_wedge_declare().  When xe_gt_record_default_lrcs() cleans up
     its kernel exec queue on error, __guc_exec_queue_process_msg_cleanup()
     takes the disable_scheduling_deregister() path, waits 5 seconds for
     the dropped enable H2G, and returns early without calling
     guc_exec_queue_destroy_async(), leaking the exec queue and its
     drm_dev_get() reference.

  3. wedge_work schedules drm_dev_wedged_event() before drm_dev_register()
     has registered the primary minor kdev with device_add(), so the
     wedged uevent is emitted on an unregistered kobject.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123070221.1611=
306-2-soham.purkait@intel.com?part=3D1
