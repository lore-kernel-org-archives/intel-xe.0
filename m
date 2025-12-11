Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF031D41C1F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 10:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D393410E7DD;
	Thu, 11 Dec 2025 10:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPFxG8qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED71B10E7DD
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765450718; x=1796986718;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=8ZQrtuuduB0ox1oqT4q+fVzsh4KNBvDl7tsHgpFS9Bc=;
 b=jPFxG8qMM2yxvnHLE6X4dbdZQsHGeiUv1hjYABRSCQJnfwt1OTiSg8Oa
 WlZ69t6TS3SJ7rGp2TGE4auphQnNk6VNAVwe5GeKFzGb2YbaxFXAoJDLu
 olRo34hncHHXOaK5yqO0fu+M/8FAXaFRf5KdJj3HK5sfIY7OJCgxT+Zx1
 lDKcCPkxFaP9bAl78WKvy5PZKvGYDw9O746QMbC6Jgl3dMnS0La4Imfo6
 w6+4PdijSxlsi/gRNT7EPpdNN0/LR3Fb4BlocfuDTcvOHPGzoFt/Tdb2V
 8FOpzrKZPUJbFaApb8YTzWmMVE6RoJ552WpgU2ZChqAEP1Hsc/j4hGXlP w==;
X-CSE-ConnectionGUID: 4gDLN633SGiPqgYrlXvlqg==
X-CSE-MsgGUID: SMAQ2DqrSWykus4S/Nzuzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71296217"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71296217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 02:58:37 -0800
X-CSE-ConnectionGUID: oYLv+Y6TR8OUGL8lMDF7Ag==
X-CSE-MsgGUID: iFWzsCOWSpm3LkGTs7t+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="197051157"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.197])
 ([10.245.244.197])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 02:58:36 -0800
Message-ID: <c844590b8d99c6b03536ba131a93236dddbd11ae.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe/bo: Don't
 include the CCS metadata in the dma-buf sg-table
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 11:58:34 +0100
In-Reply-To: <176539910346.74583.18284524558154580583@a3b018990fe9>
References: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
 <176539910346.74583.18284524558154580583@a3b018990fe9>
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

On Wed, 2025-12-10 at 20:38 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-
> table
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/158721/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-4215-
> 2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL -> xe-pw-158721v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-158721v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-158721v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (2 -> 2)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-158721v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [FAIL][2] +6 other tests fail
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2=
.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_flip@flip-vs-rmfb-interruptible@a-dp2.html


Not related.

/Thomas

>=20
> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-4215-
> 2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL and xe-pw-
> 158721v1_FULL:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@kms_chamelium_frames:
> =C2=A0=C2=A0=C2=A0 - Statuses :
> =C2=A0=C2=A0=C2=A0 - Exec time: [None] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-158721v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][3] -> [SKIP][4] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays=
-2560x1440p.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][5] ([Intel XE#2887])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@=
kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][6] ([Intel XE#309])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_dp_link_training@non-uhbr-sst:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][7] -> [FAIL][8] ([Intel XE#6816])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_dp_link_training@non-uhbr-sst.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi=
-
> a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][9] -> [FAIL][10] ([Intel XE#3321])
> +1 other test fail
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interr=
uptible@bd-dp2-hdmi-a3.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][11] -> [FAIL][12] ([Intel XE#3098])
> +1 other test fail
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@=
kms_flip@2x-plain-flip-ts-check.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][13] -> [FAIL][14] ([Intel XE#3650])
> +3 other tests fail
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_flip@flip-vs-rmfb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][15] -> [INCOMPLETE][16] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_flip@flip-vs-suspend@b-hdmi-a3.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#656])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][18] ([Intel XE#6740])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@=
kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1406] /
> [Intel XE#2893])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@=
kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
>=20
> =C2=A0 * igt@testdisplay:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][20] -> [ABORT][21] ([Intel XE#6740])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@testdisplay.html
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@=
testdisplay.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#1392])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@=
xe_exec_basic@multigpu-once-rebind.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@threads-many-execqueues-new:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][23] -> [ABORT][24] ([Intel XE#3970])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-exe=
cqueues-new.html
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
xe_exec_system_allocator@threads-many-execqueues-new.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][25] -> [DMESG-WARN][26] ([Intel
> XE#4504])
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
xe_pm@s2idle-vm-bind-userptr.html
>=20
> =C2=A0 * igt@xe_pmu@engine-activity-accuracy-50@engine-
> drm_xe_engine_class_video_decode0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][27] -> [FAIL][28] ([Intel XE#6251])
> +1 other test fail
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine=
-drm_xe_engine_class_video_decode0.html
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-4/igt@=
xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0=
.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@core_hotunplug@unplug-rescan:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][29] -> [PASS][30]
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
core_hotunplug@unplug-rescan.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][31] ([Intel XE#367]) -> [PASS][32]
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays=
-3840x2160p.html
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@=
kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_flip@2x-busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][33] ([Intel XE#6557] / [Intel
> XE#6703]) -> [PASS][34]
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-busy-flip.html
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
kms_flip@2x-busy-flip.html
>=20
> =C2=A0 * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][35] ([Intel XE#6740]) -> [PASS][36]
> +1 other test pass
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_hdr@bpc-switch@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][37] ([Intel XE#6703]) -> [PASS][38]
> +1 other test pass
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execq=
ueues-mmap-remap.html
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
xe_exec_system_allocator@many-large-execqueues-mmap-remap.html
>=20
> =C2=A0 * igt@xe_pmu@engine-activity-accuracy-90@engine-
> drm_xe_engine_class_video_decode0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][39] ([Intel XE#6251]) -> [PASS][40]
> +1 other test pass
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine=
-drm_xe_engine_class_video_decode0.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-1/igt@=
xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0=
.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-sst:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][41] ([Intel XE#6793]) -> [SKIP][42]
> ([Intel XE#4354])
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@=
kms_dp_link_training@uhbr-sst.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][43] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][44] ([Intel XE#3544])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][45] ([Intel XE#1503]) -> [ABORT][46]
> ([Intel XE#6740])
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][47] ([Intel XE#1729]) -> [SKIP][48]
> ([Intel XE#2426])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][49] ([Intel XE#6703]) -> [SKIP][50]
> ([Intel XE#4943])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f=
10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-=
new-huge.html
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@=
xe_exec_system_allocator@many-large-mmap-new-huge.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3098]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3970]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4504]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#6251]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
> =C2=A0 [Intel XE#6557]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#6703]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
> =C2=A0 [Intel XE#6740]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
> =C2=A0 [Intel XE#6793]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
> =C2=A0 [Intel XE#6816]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6816
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985 -> xe-pw=
-
> 158721v1
>=20
> =C2=A0 IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985:
> 2a9deeb5c3fd4dddbed361f10b26ce567072a985
> =C2=A0 xe-pw-158721v1: 158721v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/index.html

