Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0361606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yig0j6XX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAA011283F;
	Fri, 20 Nov 2026 02:29:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817411283F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:29:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B3EE40AF2;
 Fri, 20 Nov 2026 02:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DCE1F000C6;
 Fri, 20 Nov 2026 02:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795141777;
 bh=ozFfyHjNtOmyQndDeICNupverT6foKPQG19+Xy3cV5E=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Yig0j6XXF3LDUlXMfayEDOKbEqUqcOaS/182ektwrtFuA8Fn/K6Cy2c8yG0ERpYkj
 zHMtx31BDH+QRhg7P2AOwzwnMYcHd7cgAfSxa8IMGQyeUeJJ1FdurywzTMqO0SbCzB
 J8E2tDcqB8xmMH7lLf4L3gbtIFQAQQiMB/I4Oavqx8WNlVGVqfSLEQghgM4ZRwCma0
 cNRozYj7SZjxhDdtaGAEYPwo7euM58iyuMCgJ0oFNliTKMl/mt7h4SYv1tGsByV90g
 ZgCXP7wbluY3t78/R4N4v2bRcnEBZbyXOYTtEM9y6+tZxMOErUGXk63IfojZzozJBt
 VJ8Q/ZoR4OAig==
Message-ID: <sashiko-outbox-224364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/xe: Disallow freq changes while mert cap is
 active
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120021606.1360244-3-vinay.belgaumkar@intel.com>
References: <20261120021606.1360244-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:29:36 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe: xe_guc_pc_get_min/max_freq_locked() return freq instead
  of 0
- [Medium] drm/xe: mert_freq_cap_active is not cleared on GuC PC stop or
  restart
--

commit a5ffc89a51c9df2129a3327ea1a0076ff70c2a90
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Disallow freq changes while mert cap is active

This commit tracks when the Wa_22019338487 MERT frequency cap is active,
defers user min/max frequency changes until the cap is lifted, and lifts
the cap even if GSC firmware load fails.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9558d7196a51a..7e9700f16bfb6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -612,6 +613,10 @@ static int xe_guc_pc_get_min_freq_locked(struct xe_g=
uc_pc *pc, u32 *freq)
>  	if (!pc->freq_ready)
>  		return -EAGAIN;
> =20
> +	/* In the middle of a temporary freq cap, return stashed value */
> +	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active)
> +		return pc->stashed_min_freq;
> +
>  	ret =3D pc_action_query_task_state(pc);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -681,6 +695,10 @@ static int xe_guc_pc_get_max_freq_locked(struct xe_g=
uc_pc *pc, u32 *freq)
>  	if (!pc->freq_ready)
>  		return -EAGAIN;
> =20
> +	/* In the middle of a temporary freq cap, return stashed value */
> +	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active)
> +		return pc->stashed_max_freq;
> +
>  	ret =3D pc_action_query_task_state(pc);
>  	if (ret)
>  		return ret;

[Severity: High]
Should xe_guc_pc_get_min_freq_locked() and xe_guc_pc_get_max_freq_locked()
write the frequency into *freq and return 0 here instead of returning the
positive frequency value as the status code?

Callers such as min_freq_show() and max_freq_show() check if (ret) return
ret;, so returning a positive MHz value leaves *freq unassigned and causes
the sysfs show callbacks to return that positive integer as the byte count
without writing to buf.  In addition, if a user sets a new min or max
frequency while the cap is active, it is saved in pc->user_requested_min /
pc->user_requested_max rather than pc->stashed_min_freq /
pc->stashed_max_freq, so *freq should probably be assigned
pc->user_requested_min ?: pc->stashed_min_freq (and similarly for max) to
match xe_guc_pc_restore_stashed_freq().

[ ... ]

> @@ -1094,6 +1121,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *p=
c)
>  	if (!ret)
>  		ret =3D pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> =20
> +	if (!ret)
> +		pc->mert_freq_cap_active =3D true;
> +
>  	return ret;
>  }

[Severity: Medium]
What happens if GuC PC is stopped and restarted (for example during a GT
reset) while pc->mert_freq_cap_active is still true?

Neither xe_guc_pc_stop() nor pc_set_mert_freq_cap() clears
pc->mert_freq_cap_active.  When xe_guc_pc_start() calls
pc_set_mert_freq_cap() after pc_init_freqs(), its calls to
xe_guc_pc_get_min_freq_locked() and xe_guc_pc_get_max_freq_locked() will
hit the pc->mert_freq_cap_active early return instead of querying the
newly initialized SLPC state from GuC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120021606.1360=
244-3-vinay.belgaumkar@intel.com?part=3D1
