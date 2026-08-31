Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D734C61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0B10E258;
	Mon, 31 Aug 2026 04:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h/oVvULJ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E5410E258
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:35:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3ECCC60120;
 Mon, 31 Aug 2026 04:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9B81F000E9;
 Mon, 31 Aug 2026 04:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788150924;
 bh=W03JnxhONodOGXV9U+mU4D3FqNUdiQVOHIz3UotXgwQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h/oVvULJdVSzTcHw9Zym2t4Ac6YNzm1l+VIP5qYQqbq1kO5u4C9n8yYCcd09VR/8t
 GfzjDqy9c996YaoYNGVw230eZJ9o5ok/4PUG6evGGD+hgUH12KTCpLk5Sn6S/2RhcS
 H7QDNgnCnb8PCHld0Eu/N9F3OSmI6/CA0kLrlTetcOvWNzlXgkqws2jGQSPi7CE7jy
 ZeeblRJhKzztwqZYpe5L8F86nB+Dud5Qiy9f2eIR3PVFSi40h3+HctqqVUO6mjfdGy
 DulN4cf3ePBfAazLNUpk3LjDcgNDEZkBIsGyXPRY7Z3KVAZJxOM27oy27Ov4b1eZvj
 SUskLqiqOdFAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] drm/xe/wedge: Update naming to match with xe_wedge
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831042633.1760474-6-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 04:35:23 +0000
Message-Id: <20260831043523.CC9B81F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The function `xe_device_wedged` was renamed to `xe_wedged` across t=
he codebase, but the call sites in `drivers/gpu/drm/xe/xe_guc_pc.c` were mi=
ssed. This will cause an implicit function declaration error and break the =
build.
--

commit 0a6019f57c4cdf740c1b6783f7839f86d0fd9f5c
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/wedge: Update naming to match with xe_wedge
   =20
Now that we have a dedicated xe_wedge component, update all its function
names accordingly.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 04d8c5666be14..5982ea7e0f573 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
[ ... ]
> @@ -54,24 +54,24 @@
>   */
> =20
>  /**
> - * xe_device_set_wedged_method() - Set wedge recovery method
> + * xe_wedge_set_method() - Set wedge recovery method
>   * @xe: xe device instance
>   * @method: recovery method to set
>   *
>   * Set wedge recovery method to be sent in drm wedged uevent.
>   */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long met=
hod)
> +void xe_wedge_set_method(struct xe_device *xe, unsigned long method)
>  {
>  	xe->wedged.method =3D method;
>  }
> =20
>  /**
> - * xe_device_wedged() - Check for wedged device
> + * xe_wedged() - Check for wedged device
>   * @xe: xe device instance
>   *
>   * Returns: %true if device is wedged, %false otherwise.
>   */
> -bool xe_device_wedged(struct xe_device *xe)
> +bool xe_wedged(struct xe_device *xe)
>  {
>  	return atomic_read(&xe->wedged.flag);
>  }

[Severity: Low]
Does this rename break the build by missing call sites in
drivers/gpu/drm/xe/xe_guc_pc.c?

Looking at xe_guc_pc.c, it seems xe_device_wedged() is still being called in
several places:

drivers/gpu/drm/xe/xe_guc_pc.c:pc_action_reset() {
	...
	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret =3D=3D -ECANCELED))
		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
			  ERR_PTR(ret));
	...
}

Similar missed renames exist in pc_action_query_task_state(),
pc_action_set_param(), pc_action_unset_param(), and xe_guc_pc_fini_hw().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831042633.1760=
474-1-raag.jadav@intel.com?part=3D5
