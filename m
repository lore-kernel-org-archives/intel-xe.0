Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00F606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPrnILrC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09A410E0A9;
	Thu, 26 Nov 2026 13:04:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F6810E0A9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:04:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3331D61267;
 Thu, 26 Nov 2026 13:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADA81F000CA;
 Thu, 26 Nov 2026 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795698270;
 bh=nYUobBcT5lnS37UeGnjCC4mil9tWijZ2Ibkyo7XqUaY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FPrnILrCb+jcSEaixtCSPiRtXwz7C8taeNctOY35Q/VTfvbzAb1Vsp103RtpCC0rX
 1+JyuDd97NLE/ICkoQy5gmTavVJXV5VAvtcOGo17muBGLJuccVSy6V2Y6nzprym1O8
 3fNCoovr02MTKRIEn4Xm8WZgYTMgoRpHY9Y4I/2Ugenc40S9S33kPTIqHwiOBk10lR
 lyl6f7OxKdNNgaT8tIbJBdQhvMo4iyNXW5B82brdIq7WV2wUhKHZcj3KXjOhKZiy0e
 uiGkF0Ev200tGgeI2CS8uxupJoOxWLmeLKtCLC/yjBSMrJE0dohfVl89m1ce08xZ4z
 W+rtgIfCf9aqQ==
Message-ID: <sashiko-outbox-235555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/ras: Wedge device if page offline list is
 full at probe
To: "Soham Purkait" <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126124310.2187015-6-soham.purkait@intel.com>
References: <20261126124310.2187015-4-soham.purkait@intel.com>
 <20261126124310.2187015-6-soham.purkait@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:04:30 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe/ras: failing xe_ras_init() when wedged breaks uevent and
  survivability
- [High] drm/xe/ras: xe_ras_init() drains firmware queues after
  get_offline_list() wedges
- [Medium] drm/xe/ras: process_offline_pages() wedges when page
  offlining is disabled
--

commit 5b8e982f9fdf2b8f109d3d2ea5883f110981be63
Author: Soham Purkait <soham.purkait@intel.com>

drm/xe/ras: Wedge device if page offline list is full at probe

This commit declares the device wedged in process_offline_pages() when the
firmware page offline list has reached its maximum capacity, and fails
xe_ras_init() with -ECANCELED if the device is wedged.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7545144126941..1bb4d53db3d88 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -487,6 +487,11 @@ static void process_offline_pages(struct xe_device *=
xe, u32 cmd, void *req, size
>  			return;
>  		}
>  	} while (common->additional_data);
> +
> +	if (!xe_wedged(xe) && list_req && state->max_pages && total_pages >=3D =
state->max_pages) {
> +		xe_err(xe, "[RAS]: page offline list is full\n");
> +		xe_wedge_declare(xe, 0);
> +	}
>  }
> =20
>  /*

[Severity: Medium]
Should this check skip wedging when xe_ras_get_disable_vram_page_offline(xe)
is true?

When disable_vram_page_offline is enabled in configfs, handle_page_offline()
bypasses page offlining and sends XE_RAS_PAGE_ACTION_REMOVE instead of
offlining additional pages in firmware.  Wedging here still fails probe on a
device whose firmware offline list is already full, even though page
offlining has been disabled by user policy.

> @@ -1361,5 +1366,8 @@ int xe_ras_init(struct xe_device *xe)
>  	if (ret)
>  		return ret;
> =20
> +	if (xe_wedged(xe))
> +		return -ECANCELED;
> +
>  	return xe_cper_sysfs_init(xe);
>  }

[Severity: High]
Does returning -ECANCELED from xe_ras_init() when xe_wedged(xe) is true
break runtime survivability mode and the wedged uevent?

xe_ras_init() runs in xe_device_probe() before drm_dev_register().  Because
this check is placed after xe_ras_process_errors(), any error handler that
wedges the device during probe now aborts probe and triggers devres teardow=
n:

drivers/gpu/drm/xe/xe_ras.c:handle_soc_internal_errors() {
    ...
		if (csc_error->hec_fw_error) {
			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
					  "CSC error detected: 0x%08x\n", csc_error->hec_fw_error);
			xe_survivability_mode_runtime_enable(xe);
			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
		}
    ...
}

Unlike boot survivability, __xe_pci_probe() does not intercept probe failure
for runtime survivability, so returning -ECANCELED immediately removes the
survivability sysfs files via xe_survivability_mode_fini() and runs a
Driver-FLR via xe_driver_flr_fini().  In addition, xe->wedged.work scheduled
by xe_wedge_declare() either gets canceled by disable_work_sync() in
xe_wedge_fini() before notifying userspace, or runs drm_dev_wedged_event()
on an unregistered drm_minor kdev before device_add().

[Severity: High]
When get_offline_list() wedges the device in xe_ras_init(), does continuing
through get_offline_queue() and xe_ras_process_errors() before checking
xe_wedged(xe) lose pending poison pages and error records?

In xe_ras_init(), get_offline_queue() soft-offlines queued pages in the
driver's volatile TTM VRAM manager and sends XE_RAS_PAGE_ACTION_REMOVE to
remove first-occurrence poison pages from the firmware's SRAM queue, and
xe_ras_process_errors() drains pending SoC error records via
XE_SYSCTRL_CMD_GET_SOC_ERROR.  Returning -ECANCELED afterward tears down the
TTM VRAM manager's soft-offlined page reservations after those entries have
already been consumed from firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126124310.2187=
015-4-soham.purkait@intel.com?part=3D2
