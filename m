Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EC4C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 00:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBA510E0A7;
	Fri, 14 Aug 2026 00:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mD/h+tDp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE98E10E0C5
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 23:59:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F09A600C3;
 Thu, 13 Aug 2026 23:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB131F00A3A;
 Thu, 13 Aug 2026 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786665597;
 bh=R6fC+4OidaFo04RC5nCOrpj8CStMvst4Nu/n5GyhH7g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mD/h+tDpGfpwJHoOkBpTXC2YZrNO1JtDtnIbdvR69IWE7NyP01aO9FckvbUY4x/Z5
 1luCIWlOCmaErfXptI+2f2eqYZkZ+GyrCTyTHrSLnS+3xFtkgX2phRnjC35yM8hiWr
 CpOuC3o1XqavJp0XsWVc5gpbPYbzZ6Uy2UoL9cT50XV1DLTE6FbwNN7RKOxmiEihzP
 nxKsAVaxUPUr9s36GBWLHrWF4hdzJcOgfwuArwo7GiKvzn74LLEs0jKA1NG4mGg3mV
 TdNsFi61Mq7EKZ3/Ml4NJXN6JuK6VYinVVklQGKz/KEUn667nLV2f2mww+RVCOeyZg
 3zdWBlE2LxeSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] drm/xe/oa: Stop whitelisting OAM registers on
 non Xe2/Xe3
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-3-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-3-db4a06aae8b0@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:59:57 +0000
Message-Id: <20260813235957.AFB131F00A3A@smtp.kernel.org>
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
- [High] Removing media version 13.00 from the software whitelist silently =
revokes necessary Read/Write (RW) access to the OAM SAG MMIO trigger and ac=
cess to SAG registers on VCS/VECS engines, breaking OA functionality.
--

--- Patch [3]: [PATCH v2 03/10] drm/xe/oa: Stop whitelisting OAM registers =
on non Xe2/Xe3 ---
commit 3ab34d9500af1c2740344cccab6db3fb8ba384d6
Author: Matt Roper <matthew.d.roper@intel.com>

drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3

This commit updates the media version range for OAM register whitelisting
on VCS and VECS engines, changing the start version from 1300 to 1301. The
commit relies on the hardware's built-in whitelist to automatically grant
read-only access for media version 13.00.

> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/x=
e_reg_whitelist.c
> index b0ad89a5ad4fc..457702de53e45 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
[ ... ]
> @@ -128,14 +128,14 @@ static const struct xe_rtp_entry_sr register_whitel=
ist[] =3D {
>  				   RING_FORCE_TO_NONPRIV_RANGE_4))
>  	},
>  	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
>  	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW),

[Severity: High]
Does removing media version 13.00 from the software whitelist break userspa=
ce
write access to the OAM SAG MMIO trigger?

The commit message notes that the hardware's built-in whitelist grants
read-only access automatically. However, the software whitelist explicitly
grants Read/Write (RW) access to OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ) via
RING_FORCE_TO_NONPRIV_ACCESS_RW, which is required to write to the trigger.

Additionally, because the SAG registers physically belong to the GSC engine,
will the VCS/VECS hardware built-in whitelist actually cover them? If not,
dropping version 13.00 from the software whitelist might cause privilege
violations when userspace tools monitor performance on Xe_LPM (13.00) platf=
orms.

>  			 WHITELIST_OAM_MMIO_TRG)
>  	},
>  	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
>  		       ENGINE_CLASS(VIDEO_ENHANCE)),
>  	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408-oa-whiteli=
st-cleanup-v2-0-db4a06aae8b0@intel.com?part=3D3
