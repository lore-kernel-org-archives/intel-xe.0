Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7A606A697
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 23:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/dOV674
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0BD11293E;
	Fri, 20 Nov 2026 23:20:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4711293E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 23:20:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B8364412D;
 Fri, 20 Nov 2026 23:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3849E1F000C6;
 Fri, 20 Nov 2026 23:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795216806;
 bh=AH1mtlft+yXP0lF+nHK9NkVbaXE+3UwhCWRBDur7V4s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=e/dOV674NGbRDQ/31QwcLDRhp1EeVAyS2lgIsszkvU+wq9486kuWcrjnQlBHWxCAP
 gZZqE/vz6nkKwqGxbVFI1NQ1vk8B0VOFCfCZIMNtyT7VfGo1fJeMkHD1LwrC6qFdCs
 cINOwvq+8C94r+6NMKAm1Mrj7TywzZgcva3PnOH4NVJcLde2NhF1sjHp6fqSXQJP6x
 hbjHxmZCxlQ9PSo6c8o9wgcuPFnErPr0hMk6xs7IggLurGgFl4FRZxoYabwX5nTuYq
 hX4iuYovmlFkUqoQk8B2VwW61IQU9wfHwSOH/R01JZNE/GhJEO6Jfw/1pdNwb4H3kv
 ypvEEzftanunw==
Message-ID: <sashiko-outbox-226342@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] drm/xe: Disallow freq changes while mert cap is
 active
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
References: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:20:05 +0000
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
- [Medium] drm/xe: missing freq_ready and cap check in
  xe_guc_pc_restore_stashed_freq()
--

commit bca2b3b00f0a98b0fe250730e76fb17e35b55afd
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Disallow freq changes while mert cap is active

This commit tracks whether the Wa_22019338487 MERT frequency cap is
active, defers user min/max frequency changes while the cap is in force,
and restores the cap after GSC load completes or fails.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9558d7196a51a..7cbdb7985843d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
[ ... ]
> @@ -1112,9 +1146,13 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_p=
c *pc)
>  		return 0;
> =20
>  	mutex_lock(&pc->freq_lock);
> -	ret =3D pc_set_max_freq(pc, pc->stashed_max_freq);
> +	/* Apply any user min/max request made while the cap was active, else t=
he stash. */
> +	ret =3D pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_f=
req);
> +
> +	if (!ret)
> +		ret =3D pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_=
freq);
>  	if (!ret)
> -		ret =3D pc_set_min_freq(pc, pc->stashed_min_freq);
> +		pc->mert_freq_cap_active =3D false;
>  	mutex_unlock(&pc->freq_lock);
> =20
>  	return ret;

[Severity: Medium]
Should xe_guc_pc_restore_stashed_freq() check pc->freq_ready and
pc->mert_freq_cap_active under pc->freq_lock before calling
pc_set_max_freq() and pc_set_min_freq()?

If a GT reset runs while gsc_work() is in flight, xe_guc_pc_stop() clears
both pc->freq_ready and pc->mert_freq_cap_active while GuC CT is disabled:

kworker (gsc_work)                kworker (gt_reset_worker)
gsc_upload_and_init()
                                  do_gt_reset()
                                  xe_uc_stop_prepare()
                                    xe_guc_pc_stop()
                                      mutex_lock(&pc->freq_lock)
                                      pc->mert_freq_cap_active =3D false
                                      pc->freq_ready =3D false
                                      mutex_unlock(&pc->freq_lock)
xe_gt_sanitize_freq()
  xe_guc_pc_restore_stashed_freq()
    mutex_lock(&pc->freq_lock)
    pc_set_max_freq()             <-- sends SLPC H2G while PC is stopped

Because xe_gsc_stop_prepare() does not flush gsc->work, gsc_work() can
reach xe_guc_pc_restore_stashed_freq() while GuC PC is stopped, causing
pc_action_set_param() to fail and log false xe_gt_err() messages.

In addition, during normal probe, gsc_upload_and_init() sets the firmware
status to XE_UC_FIRMWARE_TRANSFERRED before xe_huc_auth() and
xe_gsc_proxy_start().  Because xe_uc_fw_is_loaded() returns true once the
status is XE_UC_FIRMWARE_TRANSFERRED, both xe_device_probe() and
gsc_work() can call xe_gt_sanitize_freq() ->
xe_guc_pc_restore_stashed_freq(), lifting the cap early and sending
duplicate SLPC requests if pc->mert_freq_cap_active is not checked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120225325.1460=
380-3-vinay.belgaumkar@intel.com?part=3D1
