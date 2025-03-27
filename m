Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6125FC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 10:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E8110E2CB;
	Thu, 27 Mar 2025 10:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpPByjJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBED310E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743072153; x=1774608153;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=NkZBFdOzBYALixDo+sIlNYLPLuXginJnAXuqO8A7qSw=;
 b=NpPByjJY6tIf7FT9kB6uC1TO7JOTnm3vJy3f999LdiREitCZhYibGSWM
 e/MGg13DA67/RosMIjLVKYVSCTcQaewHqEd0tcrpdG6YzpScktFkQ96pC
 kExG9raHrCEsl7Oz4G6fGS8PXQrR7NNiFYdlOtK2CNFTdLum2EPBk58pW
 h6/LVk+OocJE94XvlT9SfGdETCUbDjzyNVvxg7TM239Qr2s97xQJIvzR7
 zHWyVS47duWF3UlL7zfJKfh7lcLL0GUPjwsQk8T7CpjzngeqhX+2Vrnig
 wis06CTyaWMxKrzh/nRWSUo0RquEa/yGt0SWkDkpOTMDoe5BGzsfBfbc7 g==;
X-CSE-ConnectionGUID: YY9OLA6jQwKexBAIPzSPgA==
X-CSE-MsgGUID: 9feW/FkASLS49MRvvY5sIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55055245"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55055245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:42:32 -0700
X-CSE-ConnectionGUID: GqrTEAaVSWyV24aGkTde0w==
X-CSE-MsgGUID: z0CWwCaoTDK34YSUg+tJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125927574"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.40])
 ([10.245.246.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:42:32 -0700
Message-ID: <fb1968bc51791c41c30c52e02ee8b58f0943e893.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe: Fix an
 out-of-bounds shift when invalidating TLB (rev2)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 11:42:28 +0100
In-Reply-To: <174306975203.11097.15217068831052952204@e6b6f09ec485>
References: <20250326151634.36916-1-thomas.hellstrom@linux.intel.com>
 <174306975203.11097.15217068831052952204@e6b6f09ec485>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-03-27 at 10:02 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Fix an out-of-bounds shift when invalidating TLB
> (rev2)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/146797/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2854-
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8_FULL -> xe-pw-146797v2_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-146797v2_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-146797v2_FULL, please notify your bug team
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
> pw-146797v2_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][1]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][2] +5 other tests skip
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_plane_multiple@2x-tiling-none.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_plane_multiple@2x-tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][4] +4 other tests skip
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_plane_multiple@2x-tiling-yf.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][5] +1 other test skip
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0 * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs (NEW)=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][6]
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][7]
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][8]
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][9]
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
>=20
> =C2=A0=20

These failures are not related.
Thanks,
Thomas


> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-2854-
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8_FULL and xe-pw-
> 146797v2_FULL:
>=20
> ### New IGT tests (121) ###
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.80] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.83] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-b-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.79] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-b-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-c-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-c-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-d-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-d-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-2-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-2-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-2-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.79] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-a-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.75] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-a-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.83] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-c-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-c-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-d-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-d-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-2-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.75] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-2-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-2-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-a-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.75] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-a-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.81] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-b-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-b-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-d-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-d-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-2-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-2-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-2-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.73] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-d-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-a-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-a-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-b-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-b-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-c-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-c-hdmi-a-
> 3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-2-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-2-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-2-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-a-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-b-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-c-dp-
> 2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.82] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.80] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.81] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.73] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
> =C2=A0=C2=A0=C2=A0 - Statuses : 4 fail(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.01] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-146797v2_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][10] ([Intel XE#3719] /
> [Intel XE#911]) +3 other tests fail
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
kms_async_flips@async-flip-with-page-flip-events-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe=
-
> b-hdmi-a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][11] ([Intel
> XE#4543]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.=
html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-all-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#3279])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
kms_atomic_transition@plane-all-modeset-transition.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3
> other tests skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_big_fb@4-tiled-16bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#2327]) +3
> other tests skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_big_fb@x-tiled-32bpp-rotate-90.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][15] ([Intel XE#316])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1407])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#316]) +1
> other test skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_big_fb@y-tiled-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#1124])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-3/igt@=
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][19] ([Intel XE#1124]) +4
> other tests skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1124]) +12
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][21] -> [SKIP][22] ([Intel XE#2314] /
> [Intel XE#2894]) +1 other test skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][23] -=
> [SKIP][24] ([Intel XE#2191])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2160x1440p.html
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#2314] /
> [Intel XE#2894]) +1 other test skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#367])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][27] ([Intel XE#367])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_bw@linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_bw@linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][29] ([Intel XE#787]) +152
> other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][30] ([Intel XE#455] /
> [Intel XE#787]) +7 other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#2887]) +2
> other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#787]) +11
> other tests skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#3432]) +1
> other test skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][34] -> [DMESG-WARN][35] ([Intel
> XE#2932]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-c=
cs@pipe-a-edp-1.html
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][36] ([Intel
> XE#4345])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#2887]) +13
> other tests skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][38] ([Intel XE#455] /
> [Intel XE#787]) +34 other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][39] -=
> [INCOMPLETE][40] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#4522])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc@pipe-a-dp-4.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#2652] /
> [Intel XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-75:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][42] ([Intel XE#306])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_chamelium_color@ctm-0-75.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-max:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#306])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
kms_chamelium_color@ctm-max.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#306])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_chamelium_color@ctm-max.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#2325])
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#373]) +8
> other tests skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_chamelium_edid@dp-edid-change-during-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2252]) +10
> other tests skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#373])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#3278])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
kms_content_protection@atomic.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][51] ([Intel XE#1178])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-435/ig=
t@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#307])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_content_protection@dp-mst-type-1.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#307])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-2/igt@=
kms_content_protection@dp-mst-type-1.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][54] ([Intel XE#455]) +6
> other tests skip
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_content_protection@lic-type-1.html
>=20
> =C2=A0 * igt@kms_content_protection@srm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][55] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_content_protection@srm.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][56] ([Intel XE#1188])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_content_protection@uevent@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][57] ([Intel XE#1188])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_content_protection@uevent@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#2321]) +3
> other tests skip
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_cursor_crc@cursor-random-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-32x32:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#1424]) +1
> other test skip
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
kms_cursor_crc@cursor-sliding-32x32.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][60] ([Intel XE#308])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][61] -=
> [SKIP][62] ([Intel XE#309])
> +1 other test skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-leg=
acy.html
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#2291])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][64] -> [SKIP][65] ([Intel XE#2291])
> +5 other tests skip
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy=
.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#309]) +2
> other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#309])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#323])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#323])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#1508])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-7/igt@=
kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dp_aux_dev:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#3009])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_dp_aux_dev.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#2244])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_dsc@dsc-basic.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#2244])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
kms_dsc@dsc-fractional-bpp.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#4422])
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#702])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#702])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#2374])
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_flip@2x-busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#1421])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
kms_flip@2x-busy-flip.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
> dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][79] ([Intel XE#301]) +3
> other tests fail
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][80] -> [FAIL][81] ([Intel XE#3321])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][82] -=
> [FAIL][83] ([Intel XE#301])
> +7 other tests fail
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-h=
dmi-a6-dp4.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#310]) +1
> other test skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@kms_flip@2x-flip-vs-panning.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][85] ([Intel XE#2316]) +1
> other test skip
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-panning-vs-hang.html
>=20
> =C2=A0 * igt@kms_flip@2x-modeset-vs-vblank-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][86] ([Intel XE#310]) +1
> other test skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_flip@2x-modeset-vs-vblank-race.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][87] -> [SKIP][88] ([Intel XE#2316])
> +5 other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interrupt=
ible.html
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_flip@2x-plain-flip-ts-check-interruptible.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][89] -=
> [SKIP][90] ([Intel XE#310])
> +2 other tests skip
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_flip@2x-plain-flip-ts-check-interru=
ptible.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_flip@2x-plain-flip-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][91] -> [FAIL][92] ([Intel XE#301])
> +1 other test fail
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-4/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][93] -> [FAIL][94] ([Intel XE#301] /
> [Intel XE#3149]) +1 other test fail
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.ht=
ml
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-4/igt@=
kms_flip@flip-vs-expired-vblank@c-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][95] -=
> [FAIL][96] ([Intel XE#301] /
> [Intel XE#3321])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.h=
tml
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_flip@flip-vs-expired-vblank@d-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][97] -=
> [INCOMPLETE][98] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.=
html
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#455]) +13
> other tests skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#1401] /
> [Intel XE#1745]) +1 other test skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][101] ([Intel XE#1401]) +1
> other test skip
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-d=
efault-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#2293]) +5
> other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#2293] /
> [Intel XE#2380]) +5 other tests skip
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][104] -> [DMESG-FAIL][105] ([Intel
> XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytile-downscaling.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#651])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#2312]) +17
> other tests skip
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][108] -> [DMESG-FAIL][109] ([Intel
> XE#4543]) +5 other tests dmesg-fail
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][110] ([Intel
> XE#4543])
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][111] =
-> [SKIP][112] ([Intel XE#656])
> +7 other tests skip
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#4141]) +13
> other tests skip
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][114] ([Intel XE#2311]) +22
> other tests skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][115] ([Intel XE#651]) +15
> other tests skip
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#651]) +5
> other tests skip
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#656]) +12
> other tests skip
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][118] ([Intel XE#656]) +2
> other tests skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#656]) +9
> other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][120] ([Intel XE#2352])
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#653]) +1
> other test skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][122] ([Intel XE#653]) +6
> other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#2313]) +23
> other tests skip
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_hdmi_inject@inject-audio:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#1470] /
> [Intel XE#2853])
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
kms_hdmi_inject@inject-audio.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#3374] /
> [Intel XE#3544])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-2/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][126] =
-> [SKIP][127] ([Intel XE#455])
> +1 other test skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][128] -> [SKIP][129] ([Intel
> XE#1503])
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][130] -> [SKIP][131] ([Intel
> XE#3012])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_joiner@basic-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@basic-max-non-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#4298])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_joiner@basic-max-non-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#3012]) +1
> other test skip
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_joiner@invalid-modeset-force-big-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][134] =
-> [SKIP][135] ([Intel
> XE#4328])
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-jo=
iner.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_joiner@invalid-modeset-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_panel_fitting@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][136] ([Intel XE#2486])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_panel_fitting@legacy.html
>=20
> =C2=A0 * igt@kms_plane_cursor@viewport:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][137] -> [FAIL][138] ([Intel
> XE#1471]) +1 other test fail
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@kms_plane_cursor@viewport.html
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@kms_plane_cursor@viewport.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][139] =
-> [FAIL][140] ([Intel XE#616])
> +1 other test fail
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_plane_cursor@viewport.html
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_plane_cursor@viewport.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#2393]) +1
> other test skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_plane_lowres@tiling-yf.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][142] ([Intel XE#2763] /
> [Intel XE#455]) +3 other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-433/ig=
t@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe
> -b:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][143] ([Intel XE#2763]) +5
> other tests skip
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-433/ig=
t@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-
> b:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#2763]) +24
> other tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-7/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#870])
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][146] ([Intel XE#2392]) +1
> other test skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][147] ([Intel XE#1129])
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][148] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#836])
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_pm_rpm@modeset-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][149] =
-> [SKIP][150] ([Intel XE#836])
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_pm_rpm@modeset-non-lpsp.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][151] ([Intel XE#1489]) +3
> other tests skip
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][152] ([Intel XE#1489]) +1
> other test skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-
> b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][153] ([Intel XE#4570]) +3
> other tests fail
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.ht=
ml
>=20
> =C2=A0 * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][154] ([Intel XE#1489]) +7
> other tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#2387])
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_psr2_su@page_flip-xrgb8888.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][156] ([Intel XE#1122]) +1
> other test skip
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-433/ig=
t@kms_psr2_su@page_flip-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-primary-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][157] ([Intel XE#1406])
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
kms_psr@fbc-pr-primary-render.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-sprite-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][158] ([Intel XE#2850] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_psr@fbc-psr-sprite-render.html
>=20
> =C2=A0 * igt@kms_psr@pr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][159] ([Intel XE#2850] /
> [Intel XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@kms_psr@pr-suspend.html
>=20
> =C2=A0 * igt@kms_psr@psr-sprite-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#2234] /
> [Intel XE#2850]) +16 other tests skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_psr@psr-sprite-plane-move.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#2939])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][162] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_rotation_crc@bad-pixel-format.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][163] ([Intel XE#3414] /
> [Intel XE#3904]) +1 other test skip
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#2330])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][165] ([Intel XE#3414])
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][166] ([Intel XE#3414] /
> [Intel XE#3904]) +1 other test skip
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>=20
> =C2=A0 * igt@kms_setmode@basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][167] -> [FAIL][168] ([Intel
> XE#2883]) +2 other tests fail
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_setmode@basic.html
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_setmode@basic.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][169] -> [FAIL][170] ([Intel
> XE#2883]) +2 other tests fail
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@kms_setmode@basic.html
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@kms_setmode@basic.html
>=20
> =C2=A0 * igt@kms_setmode@basic-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][171] ([Intel XE#1435]) +1
> other test skip
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_setmode@basic-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][172] =
-> [FAIL][173] ([Intel
> XE#2883]) +2 other tests fail
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_setmode@basic@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_setmode@basic@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][174] -> [FAIL][175] ([Intel
> XE#2883]) +2 other tests fail
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_setmode@basic@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][176] ([Intel XE#1499])
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_vrr@flipline.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][177] ([Intel XE#1499])
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_vrr@seamless-rr-switch-drrs.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-check-output:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][178] ([Intel XE#756])
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@kms_writeback@writeback-check-output.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-invalid-parameters:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][179] ([Intel XE#756])
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_writeback@writeback-invalid-parameters.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][180] ([Intel XE#1123])
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-433/ig=
t@xe_copy_basic@mem-copy-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][181] ([Intel XE#1126])
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@xe_copy_basic@mem-set-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][182] ([Intel XE#1126])
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][183] ([Intel XE#2905] /
> [Intel XE#3889])
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
xe_eudebug@basic-vm-bind-ufence-sigint-client.html
>=20
> =C2=A0 * igt@xe_eudebug@discovery-empty:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][184] ([Intel XE#2905]) +9
> other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
xe_eudebug@discovery-empty.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][185] ([Intel XE#2905]) +5
> other tests skip
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@xe_eudebug@discovery-empty.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step-one:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][186] ([Intel XE#2905])
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_eudebug_online@single-step-one.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][187] ([Intel XE#2905])
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
xe_eudebug_online@single-step-one.html
>=20
> =C2=A0 * igt@xe_evict@evict-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][188] ([Intel XE#261] /
> [Intel XE#688]) +1 other test skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@xe_evict@evict-large-multi-vm.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][189] ([Intel XE#688])
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_evict@evict-large-multi-vm.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][190] ([Intel XE#2322]) +9
> other tests skip
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][191] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][192] =
-> [SKIP][193] ([Intel
> XE#1392]) +1 other test skip
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-rebind.h=
tml
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-rebind.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][194] ([Intel XE#1392]) +1
> other test skip
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-r=
ace-imm
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][195] ([Intel XE#288]) +8
> other tests skip
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-i=
mm.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][196] ([Intel XE#288]) +14
> other tests skip
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@xe_exec_fault_mode@once-bindexecqueue-rebind.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][197] ([Intel XE#2360])
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][198] -> [DMESG-WARN][199] ([Intel
> XE#4173]) +6 other tests dmesg-warn
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_gt_freq@freq_suspend.html
>=20
> =C2=A0 * igt@xe_media_fill@media-fill:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][200] ([Intel XE#560])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_media_fill@media-fill.html
>=20
> =C2=A0 * igt@xe_oa@buffer-size@ccs-0-256k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][201] ([Intel XE#4541])
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_oa@buffer-size@ccs-0-256k.html
>=20
> =C2=A0 * igt@xe_oa@invalid-create-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][202] ([Intel XE#2541] /
> [Intel XE#3573]) +2 other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@xe_oa@invalid-create-userspace-config.html
>=20
> =C2=A0 * igt@xe_oa@invalid-oa-format-id:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][203] ([Intel XE#2541] /
> [Intel XE#3573]) +3 other tests skip
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_oa@invalid-oa-format-id.html
>=20
> =C2=A0 * igt@xe_oa@oa-tlb-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][204] ([Intel XE#2248])
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
xe_oa@oa-tlb-invalidate.html
>=20
> =C2=A0 * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][205] ([Intel XE#1173])
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][206] ([Intel XE#2284]) +1
> other test skip
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
xe_pm@d3cold-mocs.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][207] ([Intel XE#1948])
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_pm@d3hot-mmap-vram.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][208] ([Intel XE#1948])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_pm@d3hot-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][209] -> [DMESG-WARN][210] ([Intel
> XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_pm@s2idle-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][211] -> [ABORT][212] ([Intel
> XE#1794])
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][213] -> [ABORT][214] ([Intel
> XE#1794])
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-2/igt@=
xe_pm@s4-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][215] ([Intel XE#579])
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_pm@vram-d3cold-threshold.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][216] ([Intel XE#579])
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-config:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][217] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_query@multigpu-query-config.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][218] ([Intel XE#944])
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_query@multigpu-query-config.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-mem-usage:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][219] ([Intel XE#944]) +3
> other tests skip
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
xe_query@multigpu-query-mem-usage.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][220] ([Intel XE#944])
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@xe_query@multigpu-query-mem-usage.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][221] ([Intel XE#4130])
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-7/igt@=
xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][222] ([Intel XE#4130])
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-vfs-parallel:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][223] ([Intel XE#4273]) +1
> other test skip
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
xe_sriov_flr@flr-vfs-parallel.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][224] ([Intel XE#4273]) +1
> other test skip
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@xe_sriov_flr@flr-vfs-parallel.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@test-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][225] ([Intel XE#664]) -> [PASS][226]
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-3/igt@=
kms_async_flips@test-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][227] ([Intel XE#4543]) ->
> [PASS][228] +11 other tests pass
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip.html
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[229] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][230]
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[231] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124]) -> [PASS][232]
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][233] ([Intel XE#4173]) ->
> [PASS][234] +12 other tests pass
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.h=
tml
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@kms_cursor_crc@cursor-offscreen-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][235] ([Intel XE#2291]) ->
> [PASS][236]
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy=
.html
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][237] =
([Intel XE#4331]) ->
> [PASS][238]
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.h=
tml
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-432/ig=
t@kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][239] =
([Intel XE#310]) -> [PASS][240]
> +7 other tests pass
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interrup=
tible.html
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_flip@2x-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][241] ([Intel XE#3321]) ->
> [PASS][242] +2 other tests pass
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][243] ([Intel XE#2316]) ->
> [PASS][244] +6 other tests pass
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][245] ([Intel XE#2882]) ->
> [PASS][246] +1 other test pass
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interr=
uptible.html
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-
> dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][247] =
([Intel XE#2882]) ->
> [PASS][248] +3 other tests pass
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-inte=
rruptible@ac-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[249] ([Intel XE#2049]) ->
> [PASS][250] +1 other test pass
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-d=
p4.html
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][251] ([Intel XE#886]) -> [PASS][252]
> +1 other test pass
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp=
1.html
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][253] ([Intel XE#301]) -> [PASS][254]
> +1 other test pass
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@b-edp1.html
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][255] =
([Intel XE#301]) -> [PASS][256]
> +2 other tests pass
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@b-hdmi-a6.html
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][257] ([Intel XE#324] / [Intel
> XE#4543]) -> [PASS][258] +3 other tests pass
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
16bpp-ytile-downscaling@pipe-a-valid-mode.html
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-val=
id-mode.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][259] =
([Intel XE#656]) -> [PASS][260]
> +6 other tests pass
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][261] ([Intel XE#1471]) ->
> [PASS][262] +1 other test pass
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1=
-size-64.html
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][263] =
([Intel XE#616]) -> [PASS][264]
> +1 other test pass
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-=
6-size-64.html
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[265] -> [PASS][266] +1 other
> test pass
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_plane_lowres@tiling-4.html
>=20
> =C2=A0 * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][267] ([Intel XE#2571]) ->
> [PASS][268]
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.ht=
ml
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_plane_scaling@2x-scaler-multi-pipe.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][269] =
([Intel XE#309]) -> [PASS][270]
> +3 other tests pass
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.=
html
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][271] ([Intel XE#718]) -> [PASS][272]
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][273] ([Intel XE#1435]) ->
> [PASS][274]
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.htm=
l
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][275] =
([Intel XE#455]) -> [PASS][276]
> +1 other test pass
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-s=
tealing.html
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_setmode@invalid-clone-single-crtc-stealing.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][277] ([Intel XE#771] / [Intel
> XE#899]) -> [PASS][278]
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][279] ([Intel XE#899]) -> [PASS][280]
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c=
-edp-1.html
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][281] ([Intel XE#899]) -> [PASS][282]
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-=
c-hdmi-a-1.html
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][283] ([Intel XE#4459]) ->
> [PASS][284] +1 other test pass
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
kms_vrr@cmrr@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][285] =
([Intel XE#1392]) ->
> [PASS][286] +6 other tests pass
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexec=
queue-userptr-rebind.html
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-433/ig=
t@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ([PASS][287], [PASS][288], [PASS][289],
> [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294],
> [PASS][295], [PASS][296], [SKIP][297], [PASS][298], [PASS][299],
> [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304],
> [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309],
> [PASS][310], [PASS][311], [PASS][312]) ([Intel XE#378]) ->
> ([PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317],
> [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322],
> [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327],
> [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332],
> [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337])
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [294]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [295]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [296]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [297]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [298]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [299]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [300]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [301]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [302]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [303]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [304]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [305]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [306]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [307]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [308]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [309]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [310]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [311]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [312]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [313]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [314]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [315]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [316]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [317]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [318]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [319]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [320]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [321]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [322]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [323]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [324]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [325]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [326]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [327]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [328]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [329]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [330]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [331]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [332]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [333]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [334]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [335]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [336]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [337]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ([PASS][338], [PASS][339], [SKIP][340],
> [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345],
> [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350],
> [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355],
> [PASS][356], [PASS][357], [PASS][358], [PASS][359]) ([Intel XE#2457])
> -> ([PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364],
> [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369],
> [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374],
> [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379],
> [PASS][380])
> =C2=A0=C2=A0 [338]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [339]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [340]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [341]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [342]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [343]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [344]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [345]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [346]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [347]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [348]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [349]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [350]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [351]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [352]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [353]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [354]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [355]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [356]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [357]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [358]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [359]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [360]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [361]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [362]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [363]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [364]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [365]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [366]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [367]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [368]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [369]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [370]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [371]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [372]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [373]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [374]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [375]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [376]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [377]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [378]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [379]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [380]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ([PASS][381], [PASS][382], [PASS][383],
> [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388],
> [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393],
> [PASS][394], [PASS][395], [SKIP][396], [PASS][397], [PASS][398],
> [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403],
> [PASS][404], [PASS][405], [PASS][406]) ([Intel XE#378]) ->
> ([PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411],
> [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416],
> [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421],
> [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426],
> [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431])
> =C2=A0=C2=A0 [381]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [382]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [383]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [384]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [385]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [386]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [387]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [388]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [389]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [390]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [391]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [392]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [393]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [394]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [395]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [396]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [397]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [398]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [399]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [400]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [401]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [402]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [403]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [404]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [405]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [406]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [407]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [408]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [409]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [410]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [411]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [412]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [413]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [414]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [415]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [416]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [417]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [418]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [419]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [420]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [421]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [422]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [423]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [424]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [425]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [426]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [427]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [428]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [429]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [430]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [431]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-6/igt=
@xe_module_load@load.html
>=20
> =C2=A0 * igt@xe_module_load@many-reload:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][432] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][433]
> =C2=A0=C2=A0 [432]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@many-reload.html
> =C2=A0=C2=A0 [433]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_module_load@many-reload.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][434] ([Intel XE#1794]) ->
> [PASS][435]
> =C2=A0=C2=A0 [434]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> =C2=A0=C2=A0 [435]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-adlp-4/igt=
@xe_pm@s4-exec-after.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-
> a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][436] =
([Intel XE#787]) -> [SKIP][437]
> ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
> =C2=A0=C2=A0 [436]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-r=
c-ccs-cc@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [437]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[438] ([Intel XE#2705]) ->
> [INCOMPLETE][439] ([Intel XE#1727] / [Intel XE#2705] / [Intel
> XE#3113] / [Intel XE#4522])
> =C2=A0=C2=A0 [438]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [439]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-
> a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][440] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][441] ([Intel XE#787]) +6 other tests skip
> =C2=A0=C2=A0 [440]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-r=
c-ccs-cc@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [441]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][442] ([Intel XE#1178]) ->
> [SKIP][443] ([Intel XE#2341]) +1 other test skip
> =C2=A0=C2=A0 [442]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
> =C2=A0=C2=A0 [443]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_content_protection@lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][444] =
([Intel XE#455]) -> [FAIL][445]
> ([Intel XE#1188])
> =C2=A0=C2=A0 [444]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [445]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-436/ig=
t@kms_content_protection@uevent.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][446] ([Intel XE#2341]) ->
> [FAIL][447] ([Intel XE#1188])
> =C2=A0=C2=A0 [446]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [447]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][448] =
([i915#3804]) -> [SKIP][449]
> ([Intel XE#455] / [i915#3804])
> =C2=A0=C2=A0 [448]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a=
-hdmi-a-6.html
> =C2=A0=C2=A0 [449]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][450] ([Intel XE#3321]) ->
> [SKIP][451] ([Intel XE#2316])
> =C2=A0=C2=A0 [450]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interr=
uptible.html
> =C2=A0=C2=A0 [451]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][452] ([Intel XE#2311]) ->
> [SKIP][453] ([Intel XE#2312]) +13 other tests skip
> =C2=A0=C2=A0 [452]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-cur-indfb-draw-render.html
> =C2=A0=C2=A0 [453]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][454] =
([Intel XE#651]) -> [SKIP][455]
> ([Intel XE#656]) +14 other tests skip
> =C2=A0=C2=A0 [454]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-cur-indfb-onoff.html
> =C2=A0=C2=A0 [455]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][456] =
([Intel XE#656]) -> [SKIP][457]
> ([Intel XE#651]) +14 other tests skip
> =C2=A0=C2=A0 [456]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [457]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][458] ([Intel XE#4141]) ->
> [SKIP][459] ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [458]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [459]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][460] ([Intel XE#2312]) ->
> [SKIP][461] ([Intel XE#4141]) +6 other tests skip
> =C2=A0=C2=A0 [460]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [461]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][462] ([Intel XE#2312]) ->
> [SKIP][463] ([Intel XE#2311]) +10 other tests skip
> =C2=A0=C2=A0 [462]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prims=
crn-cur-indfb-move.html
> =C2=A0=C2=A0 [463]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][464] ([Intel XE#2312]) ->
> [SKIP][465] ([Intel XE#2313]) +11 other tests skip
> =C2=A0=C2=A0 [464]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-blt.html
> =C2=A0=C2=A0 [465]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][466] ([Intel XE#2313]) ->
> [SKIP][467] ([Intel XE#2312]) +11 other tests skip
> =C2=A0=C2=A0 [466]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [467]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][468] =
([Intel XE#653]) -> [SKIP][469]
> ([Intel XE#656]) +11 other tests skip
> =C2=A0=C2=A0 [468]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [469]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][470] =
([Intel XE#656]) -> [SKIP][471]
> ([Intel XE#653]) +11 other tests skip
> =C2=A0=C2=A0 [470]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-shrfb-msflip-blt.html
> =C2=A0=C2=A0 [471]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][472] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][473] ([Intel XE#3544])
> =C2=A0=C2=A0 [472]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [473]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-bmg-4/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][474] =
([Intel XE#362]) -> [SKIP][475]
> ([Intel XE#1500])
> =C2=A0=C2=A0 [474]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [475]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-432/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][476] =
([Intel XE#1061]) ->
> [FAIL][477] ([Intel XE#1173])
> =C2=A0=C2=A0 [476]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@xe_peer2peer@read.html
> =C2=A0=C2=A0 [477]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/shard-dg2-466/ig=
t@xe_peer2peer@read.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1470]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
> =C2=A0 [Intel XE#1471]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1508]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2248]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2293]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
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
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> =C2=A0 [Intel XE#2392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2457]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
> =C2=A0 [Intel XE#2486]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2571]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2853]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2882]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> =C2=A0 [Intel XE#2883]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> =C2=A0 [Intel XE#2932]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
> =C2=A0 [Intel XE#2939]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#3009]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3012]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#3278]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
> =C2=A0 [Intel XE#3279]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3719]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3889]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4273]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> =C2=A0 [Intel XE#4298]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> =C2=A0 [Intel XE#4328]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
> =C2=A0 [Intel XE#4331]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#4459]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> =C2=A0 [Intel XE#4522]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> =C2=A0 [Intel XE#4541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4570]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
> =C2=A0 [Intel XE#560]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#664]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [i915#3804]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_8284 -> IGT_8288
> =C2=A0 * Linux: xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 -> xe-pw=
-
> 146797v2
>=20
> =C2=A0 IGT_8284: 8284
> =C2=A0 IGT_8288: 8288
> =C2=A0 xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8:
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8
> =C2=A0 xe-pw-146797v2: 146797v2
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146797v2/index.html

