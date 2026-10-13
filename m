Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7855CCA9ED2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 11:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367DE10F788;
	Tue, 13 Oct 2026 11:20:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD8310F78B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 11:20:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 03B24600D1;
 Tue, 13 Oct 2026 11:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC2F1F000FF;
 Tue, 13 Oct 2026 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791890430;
 bh=KCUcYbvCmArABMXTLaYX5O+Lke8MaYI1WXf0yLKBpKY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=gjUSgLhOFS17gVrRdGti1eMgoTmv0jGFj0itbfnaIY6s1XjGjcyYU2bvIkaZCOiHm
 pL3eoH3iJ6L+kxEaXjg/M3EhgXwl1BtUbJb+74kSwPxWV59r+FGKBkv+ZCAj68Rbfd
 gRxF/AuXyzYrj9pXpl7psYjWi45bEcH0Jd9mjJIPsUZi3VtVDGQf/PPkDismI6OLIq
 BLfOZKD3f6hse+cFoLSZEtCGUy3RU+BopR2TDsUJvmeMko44ciwrJ2h8YgSNzyq4ei
 JkZyqZOhll+fNsXSMolqSZYGXiDiAuI1/NWi0efg657PLwlFcMXapBjA8l+rXkUkwG
 GJZEpTFJHFYVA==
Message-ID: <sashiko-outbox-169608@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] drm/xe: Drop xe_device_set_wedged_method()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013110439.181447-3-raag.jadav@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:20:30 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe: sleeping in atomic context in xe_mert_irq_handler
- [Low] drm/xe: Stale kernel-doc for xe_device_declare_wedged()
--

commit 92170b825df41bc94e7e282489a7558acba677d1
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Drop xe_device_set_wedged_method()

Commit 60439ac3f235 ("drm/xe: Add a helper function to set recovery
method") introduced xe_device_set_wedged_method() helper to allow setting
preferred recovery method before wedging the device, but also introduced
a flaw where the previously set method can be overwritten by concurrent
racing wedge call. This can result in unintended recovery method to be
sent to userspace and possibly failed recovery.

Drop xe_device_set_wedged_method() entirely and pass the recovery method
as part of xe_device_declare_wedged() argument, which places the preferred
recovery method on stack and avoids this issue.

Fixes: 60439ac3f235 ("drm/xe: Add a helper function to set recovery method")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 014bc5b0216dd..5b98b35cdbe8a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1371,24 +1371,13 @@ u64 xe_device_uncanonicalize_addr(struct xe_devic=
e *xe, u64 address)
>   *   firmware and restore device to normal operation.
>   */
> =20
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long met=
hod)
> -{
> -	xe->wedged.method =3D method;
> -}
> -
>  #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wed=
ging"
>  #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
new"
> =20
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
> + * @method: method(s) to be used for recovery
>   *
>   * This is a final state that can only be cleared with the recovery meth=
od
>   * specified in the drm wedged uevent. The method can be set using

[Severity: Low]
Does this kernel-doc need to be updated to match the new behavior?

The documentation block for xe_device_declare_wedged() still instructs
developers to use the deleted xe_device_set_wedged_method() function and
describes a removed fallback behavior.

> @@ -1404,7 +1393,7 @@ void xe_device_set_wedged_method(struct xe_device *=
xe, unsigned long method)
>   * snapshot capture. In this mode, GT reset won't be attempted so the st=
ate of
>   * the issue is preserved for further debugging.
>   */
> -void xe_device_declare_wedged(struct xe_device *xe)
> +void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
>  {
>  	struct xe_gt *gt;
>  	u8 id;

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 32700c19a1df3..934be933d57f7 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -74,7 +74,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	case CATERR_UNMAPPED_GGTT:
>  		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
> -		xe_device_declare_wedged(xe);
> +		xe_device_declare_wedged(xe,
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);

[Severity: High]
Does this code sleep in an atomic context?

The mert_handle_cat_error() function is executed from the top-half hard IRQ
handler xe_mert_irq_handler() (via dg1_irq_handler()).

When a CATERR_UNMAPPED_GGTT or unexpected error code is detected, it calls
xe_device_declare_wedged(). This function performs synchronous wait
operations by calling xe_gt_declare_wedged(), which blocks on
flush_work(&gt->wedge.worker). It also allocates memory with GFP_KERNEL via
drm_dev_wedged_event() -> kobject_uevent_env().

Executing these blocking operations in a hardirq context triggers a
BUG: scheduling while atomic panic.

>  		break;
>  	case CATERR_LMTT_FAULT:
>  		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid=
);
> @@ -82,7 +83,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	default:
>  		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=3D%#x!\n", code);
> -		xe_device_declare_wedged(xe);
> +		xe_device_declare_wedged(xe,
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		break;
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013110439.1814=
47-1-raag.jadav@intel.com?part=3D2
