Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BD606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLG0f9xF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA010E302;
	Thu, 26 Nov 2026 09:02:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BAC10E302
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:02:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D2DF40AE7;
 Thu, 26 Nov 2026 09:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF601F000CF;
 Thu, 26 Nov 2026 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795683732;
 bh=nm1oZ6XmtfnPpK7F4Hwr1WMF8G9uKIwe0iRAucSY+As=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WLG0f9xFOAn1KMSIOthWHv8Gsw/PJluJxWEsJMuXQCmsapQ/MflvicRD+Sm9nzRAs
 RNl3Vg2OmyzZAKlcWyL19aOdGMUOMQwSqnwcf+ybBzTjpWFHiEwwLioz9PMRnZHOa1
 i8124unz34hdAcDFUvnJzPGRNPwz7hBR+1reGnUP0ZdLYEIj61krXtP8WiMTa7nSYt
 Pl9MB2QXa04VljdXonzUfwpZmG2AKOwqQa114fp0M1zEIjF2BxGRTmjBs1sVaUZYCV
 D69IAKOkN63ktV5w8+utNkggDgAKK4VcT4DeWt9pJVlgTs7zzzbqIwmH7izyyyaD4l
 2JUcp33uietDw==
Message-ID: <sashiko-outbox-235070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] drm/xe/ras: Wedge the device on page offline
 failure in all callers
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126083516.1932195-6-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-6-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:02:11 +0000
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
- [High] drm/xe/ras: early wedge in handle_page_offline() aborts
  xe_device_probe()
--

commit f2101da39ac6227266b370d84f804f3c854b3469
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/ras: Wedge the device on page offline failure in all callers

This commit moves the xe_wedge_declare() call for page offline failures
from handle_device_memory_errors() into handle_page_offline() so that all
callers declare the device wedged on -EIO and -ENOMEM.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 9b04be3405ca7..c30cea4901cbd 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -347,7 +347,7 @@ static int handle_page_offline(struct xe_device *xe, =
u64 page_address, bool noti
>  		break;
>  	case -EIO:
>  		xe_err(xe, "[RAS]: Page address 0x%llx belongs to critical BO\n", page=
_address);
> -		return ret;
> +		break;
>  	case -EEXIST:
>  		xe_dbg(xe, "[RAS]: Repeated error on already soft-offlined page addres=
s 0x%llx\n",
>  		       page_address);
> @@ -355,15 +355,24 @@ static int handle_page_offline(struct xe_device *xe=
, u64 page_address, bool noti
>  			action =3D XE_RAS_PAGE_ACTION_REMOVE;
>  		else
>  			action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> -		break;
> +		goto notify;
>  	case -ENOMEM:
> +		break;
>  	default:
>  		xe_err(xe, "[RAS]: Failed to offline page address 0x%llx: %d\n", page_=
address, ret);
> -		/* Only allocation failure is propagated, other errors are not actiona=
ble */
> -		return ret =3D=3D -ENOMEM ? ret : 0;
> +		return 0;
>  	}
> =20
> - notify:
> +	/*
> +	 * Wedge the device with a bus reset for critical BO's and memory unava=
ilability.
> +	 * TODO: Trigger SBR using pci_reset_bus
> +	 */
> +	if (ret) {
> +		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
> +		return ret;
> +	}

[Severity: High]
Can calling xe_wedge_declare() here during xe_ras_init() abort
xe_device_probe() instead of leaving the device bound in a wedged state?

xe_device_probe() calls xe_ras_init() -> get_offline_list() /
get_offline_queue() -> process_offline_pages() -> handle_page_offline()
before xe_gt_init() and drm_dev_register().  If firmware reports a page in
the stolen/GSM/CCS region (-EIO) or allocation fails (-ENOMEM),
xe_wedge_declare() sets xe->wedged.perm =3D 1.  When xe_device_probe() later
runs xe_gt_init() -> xe_uc_load_hw(), __guc_ct_send_locked() checks
xe_wedged_permanent() and fails with -ENOTRECOVERABLE, tearing down the
device before the DRM device is registered to deliver the wedged uevent.

In addition, process_offline_pages() ignores the return value of
handle_page_offline() and still records the failed address as
XE_RAS_PAGE_OFFLINED in state->offlined_pages when notify_fw is false:

drivers/gpu/drm/xe/xe_ras.c:process_offline_pages() {
    ...
		for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++) {
			handle_page_offline(xe, common->page_addresses[i], notify_fw);
			/* The pages are already offlined by firmware */
			if (!notify_fw) {
				index =3D common->page_addresses[i] >> XE_PTE_SHIFT;
				ret =3D xa_err(xa_store(&state->offlined_pages, index,
						      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126083516.1932=
195-5-riana.tauro@intel.com?part=3D1
