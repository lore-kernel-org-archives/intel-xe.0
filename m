Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC0DCAC5A7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 12:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A01C10E1B3;
	Mon, 22 Sep 2025 12:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9fXUB34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B510E464
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758544036; x=1790080036;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ppE95/kVOK/9R/KLqjRkk4KCVo1HAA0VdAEIKT7sNsQ=;
 b=a9fXUB34iTsm+TV4LsKiF1cwhntqw+CgLs+VASh9AgCcs8n0omg1ihLy
 iuoLu8Ba9UBehfDWoEY8SBwTZflrR92iXlHqtsq974CmuAl8s3Ur9A6YQ
 KbWc5kZAQnGgt+sXCeGuDh5OE1viUt+Ao5WX95uTHO3SLy+MyLP737b8U
 3a7426u7ELCRcpeML19kC/4L8Fk60MLciz7ReZ2tGOiMeCMiQuxJgxjJ4
 /Ce1ALXI6X6/UiFuZ2wcMOsIxsEDl7a2Fezf4EmflCLAv5T6irknoWg/Y
 VnR6NjPWS37L18ngNFU29CamzBxcND5gFXo1WuL9ycvcIL1Pp+1zmgVZp A==;
X-CSE-ConnectionGUID: etF8AMnCQsanr8nNCVCjBw==
X-CSE-MsgGUID: JBIPdC2GTQ2n4ZcCWFi4tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60020522"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60020522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:27:16 -0700
X-CSE-ConnectionGUID: DQRteH4KTZ+UYtnht6GXlA==
X-CSE-MsgGUID: XHIVIUmUTM2SgZ2FJSPhhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="200180087"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:27:15 -0700
Message-ID: <f6ef6065a78eba9ffdf37445af3244fc44b63b82.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe: Allow
 pinning of VRAM dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 14:27:12 +0200
In-Reply-To: <175821651161.345795.4648737524663544165@1538d3639d33>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
 <175821651161.345795.4648737524663544165@1538d3639d33>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-09-18 at 17:28 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Allow pinning of VRAM dma-bufs
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/154690/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3789-
> a2488a37d0e639140f346d8fca14cc719297c47d_FULL -> xe-pw-154690v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-154690v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-154690v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (4 -> 4)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-154690v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][1] -> [DMESG-FAIL][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@=
pipe-a-hdmi-a-1.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt=
@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>=20

This issue does not appear related, and doesn't reproduce on a RIL
adlp.

/Thomas



> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-3789-
> a2488a37d0e639140f346d8fca14cc719297c47d_FULL and xe-pw-
> 154690v1_FULL:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@kms_pm_dc:
> =C2=A0=C2=A0=C2=A0 - Statuses :
> =C2=A0=C2=A0=C2=A0 - Exec time: [None] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-154690v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@core_hotunplug@hotunbind-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][3] -> [DMESG-WARN][4] ([Intel
> XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt=
@core_hotunplug@hotunbind-rebind.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][5] ([Intel XE#316])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][6] ([Intel XE#1124])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_big_fb@y-tiled-64bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#1124])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_big_fb@yf-tiled-64bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#2314] /
> [Intel XE#2894])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][9] ([Intel XE#787]) +125
> other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#2887])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][11] -=
> [INCOMPLETE][12] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#4345]) +1 other test
> incomplete
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs@pipe-b-dp-4.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][13] -=
> [INCOMPLETE][14] ([Intel
> XE#2705] / [Intel XE#4212] / [Intel XE#4345])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][15] -=
> [INCOMPLETE][16] ([Intel
> XE#2705] / [Intel XE#4212])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-c-dp-4.html
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#455] /
> [Intel XE#787]) +17 other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#4417]) +3
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/ig=
t@kms_cdclk@mode-transition@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][19] ([Intel XE#3304])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/ig=
t@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@srm@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][20] ([Intel XE#1178])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_content_protection@srm@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][21] -> [SKIP][22] ([Intel XE#2291])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legac=
y.html
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#2291])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][24] -> [FAIL][25] ([Intel XE#4633])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1508])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_dirtyfb@psr-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][27] ([Intel XE#4494] /
> [i915#3804])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][28] -> [SKIP][29] ([Intel XE#2316])
> +1 other test skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible=
.html
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-panning-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][30] -=
> [FAIL][31] ([Intel XE#301])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/ig=
t@kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][32] -> [DMESG-WARN][33] ([Intel
> XE#4543]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a=
1.html
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt=
@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][34] ([Intel XE#301])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/ig=
t@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][35] -> [INCOMPLETE][36] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@=
kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#2311])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][38] -> [SKIP][39] ([Intel XE#3012])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_joiner@basic-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][40] ([Intel XE#616]) +2
> other tests fail
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#1406] /
> [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_psr@fbc-pr-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][42] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@kms_psr@fbc-pr-suspend.html
>=20
> =C2=A0 * igt@kms_setmode@clone-exclusive-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][43] -> [SKIP][44] ([Intel XE#1435])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_setmode@clone-exclusive-crtc.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][45] -> [INCOMPLETE][46] ([Intel
> XE#4488]) +1 other test incomplete
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.=
html
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt=
@kms_vblank@ts-continuation-dpms-suspend.html
>=20
> =C2=A0 * igt@xe_eudebug@multiple-sessions:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#4837])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
xe_eudebug@multiple-sessions.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][48] -=
> [SKIP][49] ([Intel XE#1392])
> +6 other tests skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer=
-mmap.html
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][50] ([Intel XE#288])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>=20
> =C2=A0 * igt@xe_exec_reset@parallel-gt-reset:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][51] -> [DMESG-WARN][52] ([Intel
> XE#3876])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt=
@xe_exec_reset@parallel-gt-reset.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][53] ([Intel XE#4915]) +9
> other tests skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/ig=
t@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#4943]) +1
> other test skip
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html
>=20
> =C2=A0 * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][55] ([Intel XE#1173])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/ig=
t@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][56] ([Intel XE#3908]) -> [PASS][57]
> +1 other test pass
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-=
transition-fencing.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt=
@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][58] ([Intel XE#4543]) ->
> [PASS][59]
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-180-hflip-async-flip.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-4/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][60] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][61]
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@=
kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][62] ([Intel XE#2291]) -> [PASS][63]
> +1 other test pass
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][64] ([Intel XE#2316]) -> [PASS][65]
> +2 other tests pass
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@=
kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][66] ([Intel XE#4543]) ->
> [PASS][67] +1 other test pass
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-inte=
rruptible.html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-3/igt=
@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][68] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][69] +7 other tests pass
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.h=
tml
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@modeset-vs-vblank-race:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][70] ([Intel XE#2953] / [Intel
> XE#4173] / [Intel XE#5208]) -> [PASS][71]
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-adlp-2/igt@kms_flip@modeset-vs-vblank-race.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt=
@kms_flip@modeset-vs-vblank-race.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][72] ([Intel XE#1503]) -> [PASS][73]
> +1 other test pass
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-2/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][74] (=
[Intel XE#1392]) -> [PASS][75]
> +6 other tests pass
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-=
invalidate-race.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/ig=
t@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][76] ([Intel XE#2311]) -> [SKIP][77]
> ([Intel XE#2312]) +8 other tests skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-pri-shrfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][78] ([Intel XE#2312]) -> [SKIP][79]
> ([Intel XE#2311]) +8 other tests skip
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-spr-indfb-draw-render.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][80] ([Intel XE#2312]) -> [SKIP][81]
> ([Intel XE#5390]) +1 other test skip
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
indfb-msflip-blt.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][82] ([Intel XE#5390]) -> [SKIP][83]
> ([Intel XE#2312]) +1 other test skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
pri-indfb-draw-render.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][84] ([Intel XE#2313]) -> [SKIP][85]
> ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][86] ([Intel XE#2312]) -> [SKIP][87]
> ([Intel XE#2313]) +6 other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-=
indfb-msflip-blt.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][88] ([Intel XE#3544]) -> [SKIP][89]
> ([Intel XE#3374] / [Intel XE#3544])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-7/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][90] (=
[Intel XE#1729]) -> [SKIP][91]
> ([Intel XE#362])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@xe_peer2peer@write:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][92] (=
[Intel XE#1061]) -> [FAIL][93]
> ([Intel XE#1173])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8=
fca14cc719297c47d/shard-dg2-432/igt@xe_peer2peer@write.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/ig=
t@xe_peer2peer@write.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1508]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3012]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#3876]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> =C2=A0 [Intel XE#3908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> =C2=A0 [Intel XE#4488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
> =C2=A0 [Intel XE#4494]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4633]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#5208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [i915#3804]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d -> xe-pw=
-
> 154690v1
>=20
> =C2=A0 IGT_8543: 8543
> =C2=A0 xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d:
> a2488a37d0e639140f346d8fca14cc719297c47d
> =C2=A0 xe-pw-154690v1: 154690v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/index.html

