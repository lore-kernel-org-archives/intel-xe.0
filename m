Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67838106ACDD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 19:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7C10E255;
	Thu, 12 Mar 2026 19:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CrnXx3s2";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696310E255
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 19:00:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso1093941f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 12:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1773342052; x=1773946852; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jMyApiPBELN2rNekZuAgHgKfTOQZKrsaSgvRu07yuXQ=;
 b=CrnXx3s2JyAZu2lYTTddBE78A57XHNte1QboR6nlpk7RT7UoTDTQUtNzpbZaBZH2tw
 vNE62S7ynt5ItJn/Syrju7YZtoSEn6Tr0bh5EFxSPMa3a86rbWOI45241UySWP+suTys
 pUB4m761rNYSrbtB7VgQRRKnGj3JuNkEi9xZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773342052; x=1773946852;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMyApiPBELN2rNekZuAgHgKfTOQZKrsaSgvRu07yuXQ=;
 b=RVIz528ApV7Ysgok79jr0XMA8ktVyBtrAn99QmvjLJtUNP2lDpQP2ivcTIbn3h5Kpy
 K48p70gXmQc20VfI/Aj7IQipjEy8dpzr7VVsCtRLrFxdJmEmYhPWAcVEVwbij7meWR8S
 j/Hq7L6dvXJsZdBg6YNqiXfWyaR+/rAnbCka3PfHq/BRq9oM5Jj3YPGDoVLsfeSPgV3M
 kT7YZtJai8SKbQLKb5nN/CdVEPm8YdsOwy+XjEvK815a2v/lYTpMqGvXYO/r6m/5eO3a
 /FsFI42/Z7lEXs4Rgz8njoVPJCqTQs8dPFidsKn1+uFfrIswp/mUW4HpCOrO0W0H3La/
 fjSg==
X-Gm-Message-State: AOJu0YzytqvxNr5M/BWti3e137vTABlIpTXqYR6M86CCxtA0mX9R/xyc
 eO0Zk4t+It/y567LgXiViv0e6p6i82VBMnRTf2I5+I3mMVhrisLxuAK0PBRcJ5HLXoY=
X-Gm-Gg: ATEYQzzF/y0XDBIRuEJzwDulmO3KW71CXRp5/CQK70H58y+rfKklSfgM7ibIplsmB4i
 GoJgD0kV8v4NX8AijHjZPShL90zV0EwRFXHE8EYZXT+uchsMPeMfKxVfsInb9IKY5xMEx5044UK
 izzalY6cvYHKgz1acv14gePwy/jJNKtFJyfZtCY3+u7hVchD5nPOEb67vV/7yqVomM60Q7k4FiL
 VaRku0n1u5FapAO3xQq3INsfUUZ99f2hGoSYxo7zb+ROzNZwZFSq949QSfBBXuvBdSf7faSM5NM
 YIZoeNgRsM4BKptrS/X+UljzlhY2RvWBKYwjJn3/45aBNeFhyPPdiAvGgDddlMzvd01dheEn3Ed
 E3p0EyZ8SiJtg9czLPw7Ok0i/DAkGeBIBuYyvYssWG+kjGdZuaAXfyng0gPp+LrDq3NKgNilzih
 hN+XI3FucAiwrgxYLaEawAhp0kHoZhEr2Ws5E=
X-Received: by 2002:a05:6000:2583:b0:439:c1ca:82be with SMTP id
 ffacd0b85a97d-43a04db18cfmr1591449f8f.28.1773342051799; 
 Thu, 12 Mar 2026 12:00:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a78cesm10294833f8f.11.2026.03.12.12.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 12:00:50 -0700 (PDT)
Date: Thu, 12 Mar 2026 20:00:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/wa: Drop redundant entries for Wa_16021867713 &
 Wa_14019449301
Message-ID: <abMNYLCQ6Kf7Xid2@phenom.ffwll.local>
References: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
X-Operating-System: Linux phenom 6.18.5+deb14-amd64 
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2026 at 09:29:23AM -0700, Matt Roper wrote:
> The Xe2_HPM-specific RTP table entries for Wa_16021867713 and
> Wa_14019449301 were removed by commit 941f538b0af8 ("drm/xe: Consolidate
> workaround entries for Wa_16021867713") and commit aa0f0a678370
> ("drm/xe: Consolidate workaround entries for Wa_14019449301") in favor
> of alternate entries earlier in the table that cover a wider range of IP
> versions.  However these Xe2_HPM-specific entries were accidentally
> resurrected during a backmerge, which causes the Xe driver to complain
> on probe about two entries trying to program the same registers+bits:
> 
>   <3> [48.491155] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
>   <3> [48.491211] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
>   <3> [48.491225] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22
>   <3> [48.491238] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22
> 
> Re-drop the redundant Xe2_HPM-specific entries to eliminate the dmesg
> errors.
> 
> Fixes: 58351f46de26 ("Merge v7.0-rc3 into drm-next")
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7608
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Oops, sorry :-/

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Since there's already a backmerge I think it's best to land this directly
in drm-xe-next since it's just a warning.
-Sima

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 025ec102bf0776f0fdb408f66123fa2ff3d84103..8c55cd187a0c2f17f1d6ed0ef2f9c7a87913a840 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -263,20 +263,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  				   LSN_DIM_Z_WGT(1)))
>  	},
>  
> -	/* Xe2_HPM */
> -
> -	{ XE_RTP_NAME("16021867713"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
> -	{ XE_RTP_NAME("14019449301"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
> -
>  	/* Xe3_LPG */
>  
>  	{ XE_RTP_NAME("14021871409"),
> 
> ---
> base-commit: 3ccc0e3404591e404d0dee79406cd013f377356a
> change-id: 20260312-wa_merge_fix-3e8f83cb56b6
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
