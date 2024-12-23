Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEC7E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 17:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4C10E589;
	Mon, 23 Dec 2024 17:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jg0ho7T2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FEE10E589
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734973696; x=1766509696;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=f56kQZ5h/rjtUGPS2EVPLXkcHLnmtjSHu8Um/4r2GCY=;
 b=Jg0ho7T25z/q/lGauWWsn19Zia5EL4pSMnlhaIhhK2oXsx9FGwm/FkoM
 rkXlhNGC8rEC/pfbwrMbsYdExHf0lS/rNV+jWZ5Hb0XsZ45cGGmICXLP3
 9fVZNsSqCqaDlz/NaL/BHK9LS+mrdbjecPHEkIZPqC4mxviiAD5Z6ytIH
 fPNXuXl2U3bzGwkRgf0sQpXeN7VQQRYVUUUdkuFMOzHacd7RGM9iFoEuK
 k5vp127hCLqYBufyysYTkoRZCVRZD/m6UoTU/WO6kgIF8YDdA7KH6vzeY
 LlCiJKctczMDg4rJ6el096HQONK7OsnW6PFKpjmEbgZffnOj4iDd/iAH4 w==;
X-CSE-ConnectionGUID: lJPh5S9PTU6K1+6dw7qNwg==
X-CSE-MsgGUID: PLnylZsxQL+xXvFlO2Ydyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46862735"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="46862735"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:08:15 -0800
X-CSE-ConnectionGUID: dg2DVbaxSaKAXlAIVxq12Q==
X-CSE-MsgGUID: h+DQPxx0RqmaQ/vO/7CmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104243910"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:08:14 -0800
Message-ID: <ac2560fcdca6fc7026b3d97ca056978679137776.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe/tracing:
 Fix a potential TP_printk UAF
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Dec 2024 18:08:11 +0100
In-Reply-To: <173497174615.2161631.4388720805849421008@b555e5b46a47>
References: <20241223134250.14345-1-thomas.hellstrom@linux.intel.com>
 <173497174615.2161631.4388720805849421008@b555e5b46a47>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Mon, 2024-12-23 at 16:35 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/tracing: Fix a potential TP_printk UAF
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/142919/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2418-
> 57cbd7d762d4dccb8784836a6a12bbb4122c1695_full -> xe-pw-142919v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-142919v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-142919v1_full, please notify your bug team
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
> pw-142919v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@core_hotunplug@hotreplug:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [ABORT][1] +2 other tests abort
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@core_hotunplug@hotreplug.html
>=20
> =C2=A0 * igt@core_hotunplug@hotunplug-rescan:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][2] +2 other tests abort
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
core_hotunplug@hotunplug-rescan.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [DMESG-WARN][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][4] +1 other test fail
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-256:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][5] +3 other tests
> incomplete
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-256.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [DMESG-FAIL][6]
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][7]
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][8] +2 other tests
> incomplete
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_pm_residency@gt-c6-freeze@gt1.html

Although the core_hotunplug failures seem pretty severe, none of the
failures above seem related to this patch.

/Thomas







>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-142919v1_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@core_setmaster_vs_auth:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][9] ([Intel XE#2423])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@core_setmaster_vs_auth.html
>=20
> =C2=A0 * igt@fbdev@eof:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#2134])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
fbdev@eof.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][11] ([Intel XE#2134])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@fbdev@eof.html
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-read:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1125]) +1
> other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
intel_hwmon@hwmon-read.html
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-write:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#1125]) +1
> other test skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@intel_hwmon@hwmon-write.html
>=20
> =C2=A0 * igt@kms_3d:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#1465])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_3d.html
>=20
> =C2=A0 * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#2233])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][16] ([Intel XE#623])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1466])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>=20
> =C2=A0 * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#3157])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#3157])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_addfb_basic@invalid-smem-bo-on-discrete.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][20] ([Intel XE#3719]) +3
> other tests fail
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_async_flips@async-flip-with-page-flip-events-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe=
-
> b-hdmi-a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][21] ([Intel
> XE#1033]) +8 other tests dmesg-warn
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.=
html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe=
-
> b-hdmi-a-6-4-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][22] ([Intel XE#3767]) +23
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4=
-mc-ccs.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-
> 1-linear:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][23] ([Intel XE#911]) +3
> other tests fail
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-6-4-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#2550]) +23
> other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs=
.html
>=20
> =C2=A0 * igt@kms_async_flips@crc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [WARN][25] ([Intel XE#3819]) +1
> other test warn
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_async_flips@crc.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][26] ([Intel
> XE#3781]) +3 other tests incomplete
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_async_flips@crc.html
>=20
> =C2=A0 * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][27] ([Intel
> XE#3781]) +3 other tests incomplete
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [CRASH][28] ([Intel XE#3819]) +7
> other tests crash
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_async_flips@crc@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#873])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_async_flips@invalid-async-flip.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#873])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_async_flips@invalid-async-flip.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#873])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_async_flips@invalid-async-flip.html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][32] ([Intel XE#3768])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_async_flips@invalid-async-flip-atomic.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#3768])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_async_flips@invalid-async-flip-atomic.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#3768])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_async_flips@invalid-async-flip-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@test-cursor:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#664]) +1
> other test skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_async_flips@test-cursor.html
>=20
> =C2=A0 * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#3279]) +2
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_atomic@plane-primary-overlay-mutable-zpos.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#2385])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_atomic@plane-primary-overlay-mutable-zpos.html
>=20
> =C2=A0 *
> igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#2370])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#2327]) +16
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_big_fb@4-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][40] ([Intel XE#316]) +19
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_big_fb@4-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#619]) +1
> other test skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_big_fb@4-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#1124]) +59
> other tests skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#1407]) +25
> other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#3658]) +3
> other tests skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#316]) +22
> other tests skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_big_fb@linear-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [DMESG-WARN][46] ([Intel
> XE#1725]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_big_fb@linear-64bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#610]) +1
> other test skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_big_fb@y-tiled-addfb-size-overflow.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][48] ([Intel XE#610]) +1
> other test skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#1124]) +51
> other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][50] ([Intel XE#1124]) +54
> other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#2328]) +1
> other test skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_big_fb@yf-tiled-addfb.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][52] ([Intel XE#619]) +1
> other test skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_big_fb@yf-tiled-addfb.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#1467]) +1
> other test skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_big_fb@yf-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#607])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#607]) +1
> other test skip
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][56] ([Intel XE#607]) +1
> other test skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1477]) +1
> other test skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#610]) +1
> other test skip
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_big_fb@yf-tiled-addfb-size-overflow.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#1428])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_big_fb@yf-tiled-addfb-size-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#1124]) +61
> other tests skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#2191]) +7
> other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#2191]) +10
> other tests skip
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][63] ([Intel XE#2191]) +7
> other tests skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#1512]) +6
> other tests skip
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#2314] /
> [Intel XE#2894]) +6 other tests skip
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][66] ([Intel XE#367]) +19
> other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#367]) +10
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_bw@linear-tiling-1-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#367]) +7
> other tests skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_bw@linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#367]) +15
> other tests skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_bw@linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2887]) +77
> other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][71] ([Intel XE#787]) +510
> other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][72] ([Intel XE#455] /
> [Intel XE#787]) +145 other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#2887]) +82
> other tests skip
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#2669]) +19
> other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-
> d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#455] /
> [Intel XE#787]) +183 other tests skip
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.htm=
l
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#3442]) +1
> other test skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][77] ([Intel
> XE#3862]) +1 other test incomplete
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][78] ([Intel XE#3442]) +1
> other test skip
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#3433]) +3
> other tests skip
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#3432]) +9
> other tests skip
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#3432]) +10
> other tests skip
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#787]) +275
> other tests skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#2136] /
> [Intel XE#2231]) +37 other tests skip
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][84] ([Intel
> XE#1727])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][85] ([Intel XE#1727]
> / [Intel XE#3113])
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#2907]) +8
> other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][87] ([Intel XE#2907]) +7
> other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#2652] /
> [Intel XE#787]) +44 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#314]) +3
> other tests skip
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_cdclk@mode-transition-all-outputs.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#2724]) +2
> other tests skip
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#314]) +4
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_cdclk@mode-transition@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-dp-5:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][92] ([Intel XE#314]) +4
> other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_cdclk@mode-transition@pipe-d-dp-5.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#314] /
> [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#1152]) +3
> other tests skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_cdclk@plane-scaling.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#1152] /
> [Intel XE#455])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_cdclk@plane-scaling.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#1152]) +2
> other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-dp-5:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][97] ([Intel XE#1152]) +3
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_cdclk@plane-scaling@pipe-b-dp-5.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-50:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#306]) +9
> other tests skip
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_chamelium_color@ctm-0-50.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#2325]) +9
> other tests skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_chamelium_color@ctm-0-50.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-blue-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#306]) +9
> other tests skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_chamelium_color@ctm-blue-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_color@gamma:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][101] ([Intel XE#306]) +9
> other tests skip
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_chamelium_color@gamma.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-resolution-list:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#373]) +53
> other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_chamelium_edid@dp-edid-resolution-list.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#2252]) +48
> other tests skip
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_chamelium_hpd@common-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@vga-hpd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][104] ([Intel XE#373]) +52
> other tests skip
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_chamelium_hpd@vga-hpd.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][105] ([Intel XE#373]) +55
> other tests skip
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
>=20
> =C2=A0 * igt@kms_content_protection@content-type-change:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#2341]) +3
> other tests skip
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_content_protection@content-type-change.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][107] ([Intel XE#307]) +2
> other tests skip
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_content_protection@dp-mst-lic-type-0.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][108] ([Intel XE#307]) +4
> other tests skip
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_content_protection@dp-mst-lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][109] ([Intel XE#2390]) +2
> other tests skip
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_content_protection@dp-mst-type-1.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][110] ([Intel XE#307]) +4
> other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_content_protection@dp-mst-type-1.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][111] ([Intel XE#1178]) +7
> other tests fail
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][112] ([Intel XE#3304])
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@mei-interface:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#1468])
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_content_protection@mei-interface.html
>=20
> =C2=A0 * igt@kms_content_protection@srm@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][114] ([Intel XE#1178]) +8
> other tests fail
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_content_protection@srm@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][115] ([Intel XE#1188]) +1
> other test fail
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_content_protection@uevent.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#3278]) +8
> other tests skip
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_content_protection@uevent.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][117] ([Intel XE#1188]) +1
> other test fail
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#2320]) +26
> other tests skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_cursor_crc@cursor-offscreen-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#2321]) +8
> other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_cursor_crc@cursor-offscreen-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][120] ([Intel XE#308]) +8
> other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-64x64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][121] ([Intel XE#2423] /
> [i915#2575]) +28 other tests skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_cursor_crc@cursor-onscreen-64x64.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#1424]) +27
> other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#308]) +7
> other tests skip
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_cursor_crc@cursor-sliding-512x512.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#2321]) +7
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#309]) +24
> other tests skip
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][126] ([Intel XE#323]) +5
> other tests skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][127] ([Intel XE#323]) +5
> other tests skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#323]) +5
> other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#2286]) +5
> other tests skip
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#309]) +24
> other tests skip
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [DMESG-WARN][131] ([Intel
> XE#877]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#1508])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_dirtyfb@drrs-dirtyfb-ioctl.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#1508])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][134] ([Intel XE#2141]) +2
> other tests fail
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_dirtyfb@fbc-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_display_modes@extended-mode-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#3383])
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_display_modes@extended-mode-basic.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][136] ([Intel XE#1340])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][137] ([i915#3804])
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_dp_aux_dev:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][138] ([Intel XE#3009])
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_dp_aux_dev.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][139] ([Intel XE#3070])
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_dp_linktrain_fallback@dp-fallback.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#3070])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#2244]) +6
> other tests skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_dsc@dsc-fractional-bpp.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-bpc-formats:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][142] ([Intel XE#2244]) +6
> other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_dsc@dsc-with-bpc-formats.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][143] ([Intel XE#1695]) +1
> other test fail
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_fbcon_fbt@fbc-suspend.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#776]) +1
> other test skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_fbcon_fbt@psr-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#776]) +1
> other test skip
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_fbcon_fbt@psr-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][146] ([Intel XE#776]) +1
> other test skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_fbcon_fbt@psr-suspend.html
>=20
> =C2=A0 * igt@kms_feature_discovery@chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][147] ([Intel XE#2372])
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_feature_discovery@chamelium.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][148] ([Intel XE#701])
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_feature_discovery@chamelium.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][149] ([Intel XE#701])
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_feature_discovery@chamelium.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][150] ([Intel XE#701])
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_feature_discovery@chamelium.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][151] ([Intel XE#702])
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][152] ([Intel XE#702])
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-3x:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][153] ([Intel XE#703])
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_feature_discovery@display-3x.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][154] ([Intel XE#703])
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_feature_discovery@display-3x.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#2373])
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_feature_discovery@display-3x.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][156] ([Intel XE#703])
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_feature_discovery@display-3x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-4x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][157] ([Intel XE#1138])
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_feature_discovery@display-4x.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][158] ([Intel XE#1138])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_feature_discovery@display-4x.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][159] ([Intel XE#1138])
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_feature_discovery@display-4x.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#1138])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_feature_discovery@display-4x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@dp-mst:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#1137])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_feature_discovery@dp-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][162] ([Intel XE#2375])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_feature_discovery@dp-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][163] ([Intel XE#1137])
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_feature_discovery@dp-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#1137])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_feature_discovery@dp-mst.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][165] ([Intel XE#1135]) +1
> other test skip
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_feature_discovery@psr1.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][166] ([Intel XE#1135]) +1
> other test skip
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][167] ([Intel XE#2374])
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_feature_discovery@psr2.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][168] ([Intel XE#301]) +16
> other tests fail
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][169] ([Intel XE#3321]) +1
> other test fail
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][170] ([Intel XE#1421]) +40
> other tests skip
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_flip@2x-flip-vs-rmfb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][171] ([Intel XE#310]) +39
> other tests skip
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_flip@2x-nonexisting-fb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@bo-too-big-interruptible@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][172] ([Intel
> XE#1504]) +1 other test incomplete
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_flip@bo-too-big-interruptible@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][173] ([Intel XE#3321])
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank@a-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][174] ([Intel XE#301] /
> [Intel XE#3321])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank@c-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][175] ([Intel
> XE#2953]) +5 other tests dmesg-warn
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend-interruptible.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][176] ([Intel
> XE#2597]) +2 other tests incomplete
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_flip@flip-vs-suspend-interruptible.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][177] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][178] ([Intel
> XE#2049])
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_flip@flip-vs-suspend@d-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][179] ([Intel
> XE#2597] / [Intel XE#2635])
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_flip@flip-vs-suspend@d-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][180] ([Intel XE#2882]) +1
> other test fail
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_flip@plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@wf_vblank-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][181] ([Intel XE#2882]) +3
> other tests fail
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_flip@wf_vblank-ts-check.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][182] ([Intel XE#1401]) +26
> other tests skip
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pip=
e-a-default-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@p
> ipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][183] ([Intel XE#1397]) +7
> other tests skip
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-defa=
ult-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscali=
ng
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][184] ([Intel XE#2380]) +1
> other test skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.htm=
l
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][185] ([Intel XE#1397] /
> [Intel XE#1745]) +7 other tests skip
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][186] ([Intel XE#2293] /
> [Intel XE#2380]) +21 other tests skip
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][187] ([Intel
> XE#1033] / [Intel XE#324]) +3 other tests dmesg-fail
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-val=
id-mode.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][188] ([Intel XE#2293]) +21
> other tests skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][189] ([Intel XE#2136] /
> [Intel XE#2351]) +8 other tests skip
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][190] ([Intel XE#1401] /
> [Intel XE#1745]) +26 other tests skip
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 * igt@kms_force_connector_basic@prune-stale-modes:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][191] ([i915#5274])
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_force_connector_basic@prune-stale-modes.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][192] ([Intel XE#352]) +1
> other test skip
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_force_connector_basic@prune-stale-modes.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][193] ([Intel XE#2311])
> +150 other tests skip
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][194] ([Intel XE#651]) +79
> other tests skip
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][195] ([Intel XE#656]) +219
> other tests skip
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][196] ([Intel XE#651]) +164
> other tests skip
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@drrs-suspend.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][197] ([Intel
> XE#1033]) +18 other tests dmesg-fail
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][198] ([Intel XE#2333]) +75
> other tests fail
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][199] ([Intel XE#2136]) +28
> other tests skip
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][200] ([Intel XE#1151]) +2
> other tests skip
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_frontbuffer_tracking@fbc-tiling-4.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][201] ([Intel XE#651]) +80
> other tests skip
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][202] ([Intel XE#658]) +2
> other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][203] ([Intel XE#1469]) +2
> other tests skip
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][204] ([Intel XE#653]) +167
> other tests skip
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][205] ([Intel XE#653]) +77
> other tests skip
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][206] ([Intel XE#2352]) +1
> other test skip
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][207] ([Intel XE#1158])
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][208] ([Intel XE#1158])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_frontbuffer_tracking@plane-fbc-rte.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][209] ([Intel XE#2350])
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_frontbuffer_tracking@plane-fbc-rte.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][210] ([Intel XE#2313])
> +151 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][211] ([Intel XE#656]) +227
> other tests skip
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_getfb@getfb-reject-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][212] ([Intel XE#2502])
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_getfb@getfb-reject-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][213] ([Intel XE#1341])
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_getfb@getfb-reject-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][214] ([Intel XE#605])
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_getfb@getfb-reject-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][215] ([Intel XE#605])
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_getfb@getfb-reject-ccs.html
>=20
> =C2=A0 * igt@kms_getfb@getfb2-accept-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][216] ([Intel XE#2340])
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_getfb@getfb2-accept-ccs.html
>=20
> =C2=A0 * igt@kms_hdmi_inject@inject-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][217] ([Intel XE#1470])
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_hdmi_inject@inject-4k.html
>=20
> =C2=A0 * igt@kms_hdmi_inject@inject-audio:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][218] ([Intel XE#1470] /
> [Intel XE#2853])
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_hdmi_inject@inject-audio.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][219] ([Intel XE#3374] /
> [Intel XE#3544])
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][220] ([Intel XE#3374] /
> [Intel XE#3544])
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-metadata-sizes:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][221] ([Intel XE#1503]) +3
> other tests skip
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_hdr@invalid-metadata-sizes.html
>=20
> =C2=A0 * igt@kms_histogram@algo-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][222] ([Intel XE#3897]) +1
> other test skip
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_histogram@algo-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][223] ([Intel XE#3897]) +1
> other test skip
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_histogram@algo-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][224] ([Intel XE#3897]) +1
> other test skip
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_histogram@algo-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][225] ([Intel XE#3897]) +1
> other test skip
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_histogram@algo-basic.html
>=20
> =C2=A0 * igt@kms_histogram@global-color:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][226] ([Intel XE#3898]) +1
> other test skip
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_histogram@global-color.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][227] ([Intel XE#3898])
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_histogram@global-color.html
>=20
> =C2=A0 * igt@kms_invalid_mode@clock-too-high:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][228] ([Intel XE#1450] /
> [Intel XE#2568])
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_invalid_mode@clock-too-high.html
>=20
> =C2=A0 * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][229] ([Intel XE#1450]) +2
> other tests skip
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_joiner@basic-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][230] ([Intel XE#346])
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_joiner@basic-big-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][231] ([Intel XE#346]) +1
> other test skip
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_joiner@basic-big-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][232] ([Intel XE#2925]) +1
> other test skip
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_joiner@basic-force-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][233] ([Intel XE#2934]) +1
> other test skip
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_joiner@basic-force-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][234] ([Intel XE#2925]) +1
> other test skip
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_joiner@basic-force-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][235] ([Intel XE#2934]) +1
> other test skip
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_joiner@basic-force-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@basic-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][236] ([Intel XE#2927]) +1
> other test skip
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_joiner@basic-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][237] ([Intel XE#2927]) +1
> other test skip
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_joiner@basic-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][238] ([Intel XE#346])
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_joiner@invalid-modeset-big-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][239] ([Intel XE#346])
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_joiner@invalid-modeset-big-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][240] ([Intel XE#3012]) +1
> other test skip
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_joiner@invalid-modeset-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][241] ([Intel XE#2927]) +1
> other test skip
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][242] ([Intel XE#2927]) +1
> other test skip
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_joiner@invalid-modeset-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][243] ([Intel XE#356])
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][244] ([Intel XE#2501])
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_multipipe_modeset@basic-max-pipe-crc-check.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][245] ([Intel XE#356])
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][246] ([Intel XE#356])
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_panel_fitting@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][247] ([Intel XE#2486]) +1
> other test skip
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_panel_fitting@legacy.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [INCOMPLETE][248] ([Intel
> XE#1035]) +1 other test incomplete
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_plane@pixel-format.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [WARN][249] ([Intel XE#2078]) +3
> other tests warn
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
>=20
> =C2=A0 * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][250] ([Intel XE#616]) +3
> other tests fail
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][251] ([Intel XE#599]) +13
> other tests skip
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_plane_lowres@tiling-x@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][252] ([Intel XE#2393])
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_plane_lowres@tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_multiple@tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][253] ([Intel XE#2493]) +1
> other test skip
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_plane_multiple@tiling-yf.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][254] ([Intel XE#2493]) +1
> other test skip
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_plane_multiple@tiling-yf.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][255] ([Intel XE#361]) +1
> other test fail
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_plane_scaling@intel-max-src-size.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][256] ([Intel XE#3307])
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_plane_scaling@intel-max-src-size.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][257] ([Intel XE#2763] /
> [Intel XE#455]) +15 other tests skip
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pi
> pe-c:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][258] ([Intel XE#2763]) +85
> other tests skip
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][259] ([Intel XE#2763] /
> [Intel XE#455]) +19 other tests skip
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe
> -b:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][260] ([Intel XE#2763]) +23
> other tests skip
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe
> -b:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][261] ([Intel XE#2763]) +29
> other tests skip
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][262] ([Intel XE#2763]) +69
> other tests skip
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>=20
> =C2=A0 * igt@kms_pm_backlight@brightness-with-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][263] ([Intel XE#2938])
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_pm_backlight@brightness-with-dpms.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][264] ([Intel XE#2938])
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_pm_backlight@brightness-with-dpms.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][265] ([Intel XE#2938])
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_pm_backlight@brightness-with-dpms.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][266] ([Intel XE#870]) +3
> other tests skip
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_pm_backlight@fade.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][267] ([Intel XE#870]) +3
> other tests skip
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_pm_backlight@fade.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][268] ([Intel XE#870]) +3
> other tests skip
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_pm_backlight@fade.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-vpb-simulation:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][269] ([Intel XE#2391])
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_pm_dc@dc3co-vpb-simulation.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][270] ([Intel XE#736])
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_pm_dc@dc3co-vpb-simulation.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-dpms-negative:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][271] ([Intel XE#1131])
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_pm_dc@dc5-dpms-negative.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][272] ([Intel XE#2392]) +1
> other test skip
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][273] ([Intel XE#1129]) +1
> other test skip
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][274] ([Intel XE#1129]) +1
> other test skip
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][275] ([Intel XE#718])
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-retention-flops:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][276] ([Intel XE#3309])
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_pm_dc@dc5-retention-flops.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][277] ([Intel XE#3309])
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_pm_dc@dc5-retention-flops.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][278] ([Intel XE#3309])
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_pm_dc@dc5-retention-flops.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][279] ([Intel XE#718])
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-psr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][280] ([Intel XE#1430]) +1
> other test fail
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
kms_pm_dc@dc6-psr.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][281] ([Intel XE#734])
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][282] ([Intel XE#2505])
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_pm_dc@deep-pkgc.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][283] ([Intel XE#908])
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_pm_dc@deep-pkgc.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][284] ([Intel XE#2029])
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 * igt@kms_pm_lpsp@kms-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][285] ([Intel XE#2499])
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_pm_lpsp@kms-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@cursor-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][286] ([Intel XE#2446])
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_pm_rpm@cursor-dpms.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][287] ([Intel XE#2446])
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_pm_rpm@cursor-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][288] ([Intel XE#1439] /
> [Intel XE#836])
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_pm_rpm@dpms-mode-unset-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][289] ([Intel XE#1439] /
> [Intel XE#836])
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][290] ([Intel XE#836]) +4
> other tests skip
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_pm_rpm@dpms-non-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][291] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#836]) +2 other tests skip
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_pm_rpm@modeset-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][292] ([Intel XE#1439] /
> [Intel XE#3141]) +3 other tests skip
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_pm_rpm@modeset-non-lpsp.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][293] ([Intel XE#1489]) +41
> other tests skip
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][294] ([Intel XE#1489]) +45
> other tests skip
> =C2=A0=C2=A0 [294]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][295] ([Intel XE#1489]) +44
> other tests skip
> =C2=A0=C2=A0 [295]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][296] ([Intel XE#2893]) +21
> other tests skip
> =C2=A0=C2=A0 [296]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@frontbuffer-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][297] ([Intel XE#1128]) +2
> other tests skip
> =C2=A0=C2=A0 [297]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_psr2_su@frontbuffer-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-nv12:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][298] ([Intel XE#1122]) +3
> other tests skip
> =C2=A0=C2=A0 [298]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_psr2_su@page_flip-nv12.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][299] ([Intel XE#1122]) +3
> other tests skip
> =C2=A0=C2=A0 [299]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_psr2_su@page_flip-p010.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][300] ([Intel XE#2387]) +2
> other tests skip
> =C2=A0=C2=A0 [300]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-cursor-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][301] ([Intel XE#2234] /
> [Intel XE#2850]) +74 other tests skip
> =C2=A0=C2=A0 [301]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_psr@fbc-pr-cursor-blt.html
>=20
> =C2=A0 * igt@kms_psr@pr-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][302] ([Intel XE#1406]) +28
> other tests skip
> =C2=A0=C2=A0 [302]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_psr@pr-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr@psr-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][303] ([Intel XE#2850] /
> [Intel XE#929]) +79 other tests skip
> =C2=A0=C2=A0 [303]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@kms_psr@psr-basic.html
>=20
> =C2=A0 * igt@kms_psr@psr-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][304] ([Intel XE#2850] /
> [Intel XE#929]) +79 other tests skip
> =C2=A0=C2=A0 [304]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_psr@psr-dpms.html
>=20
> =C2=A0 * igt@kms_psr@psr2-primary-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][305] ([Intel XE#2234])
> =C2=A0=C2=A0 [305]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_psr@psr2-primary-render.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][306] ([Intel XE#2939])
> =C2=A0=C2=A0 [306]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][307] ([Intel XE#2414])
> =C2=A0=C2=A0 [307]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_psr_stress_test@invalidate-primary-flip-overlay.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][308] ([Intel XE#2939])
> =C2=A0=C2=A0 [308]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][309] ([Intel XE#3414]) +8
> other tests skip
> =C2=A0=C2=A0 [309]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-tiling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][310] ([Intel XE#3414]) +9
> other tests skip
> =C2=A0=C2=A0 [310]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@kms_rotation_crc@bad-tiling.html
>=20
> =C2=A0 * igt@kms_rotation_crc@multiplane-rotation:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][311] ([Intel XE#1874]) +6
> other tests fail
> =C2=A0=C2=A0 [311]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_rotation_crc@multiplane-rotation.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][312] ([Intel XE#2330]) +1
> other test skip
> =C2=A0=C2=A0 [312]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][313] ([Intel XE#1127]) +1
> other test skip
> =C2=A0=C2=A0 [313]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][314] ([Intel XE#3414]) +12
> other tests skip
> =C2=A0=C2=A0 [314]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][315] ([Intel XE#1127]) +3
> other tests skip
> =C2=A0=C2=A0 [315]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][316] ([Intel XE#1127]) +2
> other tests skip
> =C2=A0=C2=A0 [316]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][317] ([Intel XE#3414]) +10
> other tests skip
> =C2=A0=C2=A0 [317]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_rotation_crc@sprite-rotation-270.html
>=20
> =C2=A0 * igt@kms_scaling_modes@scaling-mode-center:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][318] ([Intel XE#2413]) +3
> other tests skip
> =C2=A0=C2=A0 [318]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
kms_scaling_modes@scaling-mode-center.html
>=20
> =C2=A0 * igt@kms_scaling_modes@scaling-mode-none:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][319] ([Intel XE#2413] /
> [Intel XE#374])
> =C2=A0=C2=A0 [319]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_scaling_modes@scaling-mode-none.html
>=20
> =C2=A0 * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][320] ([Intel XE#374]) +2
> other tests skip
> =C2=A0=C2=A0 [320]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_sequence@get-busy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][321] ([Intel XE#3007]) +29
> other tests skip
> =C2=A0=C2=A0 [321]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
kms_sequence@get-busy.html
>=20
> =C2=A0 * igt@kms_setmode@basic-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][322] ([Intel XE#1435]) +1
> other test skip
> =C2=A0=C2=A0 [322]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_setmode@basic-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][323] ([Intel XE#1435]) +4
> other tests skip
> =C2=A0=C2=A0 [323]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_sysfs_edid_timing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][324] ([Intel XE#1174])
> =C2=A0=C2=A0 [324]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@kms_sysfs_edid_timing.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][325] ([Intel XE#362]) +1
> other test skip
> =C2=A0=C2=A0 [325]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][326] ([Intel XE#2426]) +1
> other test skip
> =C2=A0=C2=A0 [326]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][327] ([Intel XE#362])
> =C2=A0=C2=A0 [327]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][328] ([Intel XE#362]) +1
> other test skip
> =C2=A0=C2=A0 [328]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][329] ([Intel XE#1500])
> =C2=A0=C2=A0 [329]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][330] ([Intel XE#330])
> =C2=A0=C2=A0 [330]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_tv_load_detect@load-detect.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][331] ([Intel XE#330])
> =C2=A0=C2=A0 [331]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][332] ([Intel XE#899]) +1
> other test fail
> =C2=A0=C2=A0 [332]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][333] ([Intel XE#2168])
> =C2=A0=C2=A0 [333]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
kms_vrr@cmrr.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][334] ([Intel XE#2168])
> =C2=A0=C2=A0 [334]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_vrr@cmrr.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][335] ([Intel XE#2159]) +1
> other test fail
> =C2=A0=C2=A0 [335]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
kms_vrr@cmrr@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@flip-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][336] ([Intel XE#455]) +131
> other tests skip
> =C2=A0=C2=A0 [336]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@kms_vrr@flip-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][337] ([Intel XE#1499]) +7
> other tests skip
> =C2=A0=C2=A0 [337]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
kms_vrr@flip-suspend.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][338] ([Intel XE#455]) +94
> other tests skip
> =C2=A0=C2=A0 [338]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@kms_vrr@flipline.html
>=20
> =C2=A0 * igt@kms_vrr@lobf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][339] ([Intel XE#2168]) +1
> other test skip
> =C2=A0=C2=A0 [339]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@kms_vrr@lobf.html
>=20
> =C2=A0 * igt@kms_vrr@negative-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][340] ([Intel XE#1499]) +3
> other tests skip
> =C2=A0=C2=A0 [340]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
kms_vrr@negative-basic.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][341] ([Intel XE#2142]) +1
> other test fail
> =C2=A0=C2=A0 [341]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-fb-id:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][342] ([Intel XE#756]) +2
> other tests skip
> =C2=A0=C2=A0 [342]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@kms_writeback@writeback-fb-id.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][343] ([Intel XE#756]) +5
> other tests skip
> =C2=A0=C2=A0 [343]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
kms_writeback@writeback-fb-id.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-invalid-parameters:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][344] ([Intel XE#756]) +5
> other tests skip
> =C2=A0=C2=A0 [344]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@kms_writeback@writeback-invalid-parameters.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][345] ([Intel XE#756]) +4
> other tests skip
> =C2=A0=C2=A0 [345]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
kms_writeback@writeback-invalid-parameters.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-autoprobe-off:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][346] ([Intel XE#1091] /
> [Intel XE#2849]) +1 other test skip
> =C2=A0=C2=A0 [346]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
sriov_basic@enable-vfs-autoprobe-off.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][347] ([Intel XE#1091] /
> [Intel XE#2849]) +1 other test skip
> =C2=A0=C2=A0 [347]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][348] ([Intel XE#1091] /
> [Intel XE#2849]) +1 other test skip
> =C2=A0=C2=A0 [348]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>=20
> =C2=A0 * igt@xe_ccs@ctrl-surf-copy-new-ctx:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][349] ([Intel XE#1130]) +50
> other tests skip
> =C2=A0=C2=A0 [349]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_ccs@ctrl-surf-copy-new-ctx.html
>=20
> =C2=A0 * igt@xe_ccs@large-ctrl-surf-copy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][350] ([Intel XE#3576])
> =C2=A0=C2=A0 [350]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_ccs@large-ctrl-surf-copy.html
>=20
> =C2=A0 * igt@xe_ccs@suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][351] ([Intel XE#455] /
> [Intel XE#488]) +5 other tests skip
> =C2=A0=C2=A0 [351]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@xe_ccs@suspend-resume.html
>=20
> =C2=A0 * igt@xe_compute@ccs-mode-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][352] ([Intel XE#1447]) +1
> other test skip
> =C2=A0=C2=A0 [352]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_compute@ccs-mode-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][353] ([Intel XE#1447]) +1
> other test skip
> =C2=A0=C2=A0 [353]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_compute@ccs-mode-basic.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][354] ([Intel XE#1280] /
> [Intel XE#455]) +5 other tests skip
> =C2=A0=C2=A0 [354]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_compute_preempt@compute-preempt-many.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][355] ([Intel XE#1123]) +3
> other tests skip
> =C2=A0=C2=A0 [355]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_copy_basic@mem-copy-linear-0x369.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][356] ([Intel XE#1123]) +3
> other tests skip
> =C2=A0=C2=A0 [356]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_copy_basic@mem-copy-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][357] ([Intel XE#1126]) +3
> other tests skip
> =C2=A0=C2=A0 [357]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_copy_basic@mem-set-linear-0x369.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][358] ([Intel XE#1126]) +2
> other tests skip
> =C2=A0=C2=A0 [358]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_create@create-big-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][359] ([Intel XE#1062])
> =C2=A0=C2=A0 [359]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_create@create-big-vram.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][360] ([Intel XE#1062])
> =C2=A0=C2=A0 [360]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_create@create-big-vram.html
>=20
> =C2=A0 * igt@xe_create@multigpu-create-massive-size:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][361] ([Intel XE#2504])
> =C2=A0=C2=A0 [361]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_create@multigpu-create-massive-size.html
>=20
> =C2=A0 * igt@xe_drm_fdinfo@utilization-all-full-load:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][362] ([Intel XE#3869]) +1
> other test fail
> =C2=A0=C2=A0 [362]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_drm_fdinfo@utilization-all-full-load.html
>=20
> =C2=A0 * igt@xe_drm_fdinfo@utilization-others-full-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][363] ([Intel XE#3869])
> =C2=A0=C2=A0 [363]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_drm_fdinfo@utilization-others-full-load.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][364] ([Intel XE#3869])
> =C2=A0=C2=A0 [364]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_drm_fdinfo@utilization-others-full-load.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-close:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][365] ([Intel XE#2905]) +55
> other tests skip
> =C2=A0=C2=A0 [365]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_eudebug@basic-close.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-connect:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][366] ([Intel XE#2905]) +61
> other tests skip
> =C2=A0=C2=A0 [366]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_eudebug@basic-connect.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][367] ([Intel XE#3889]) +2
> other tests skip
> =C2=A0=C2=A0 [367]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][368] ([Intel XE#3889]) +2
> other tests skip
> =C2=A0=C2=A0 [368]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][369] ([Intel XE#3889]) +2
> other tests skip
> =C2=A0=C2=A0 [369]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_eudebug@basic-vm-bind-ufence-reconnect.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][370] ([Intel XE#3889]) +1
> other test skip
> =C2=A0=C2=A0 [370]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][371] ([Intel XE#2905]) +52
> other tests skip
> =C2=A0=C2=A0 [371]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_eudebug_online@single-step.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step-one:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][372] ([Intel XE#2905]) +59
> other tests skip
> =C2=A0=C2=A0 [372]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_eudebug_online@single-step-one.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-multi-vm-cm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][373] ([Intel XE#2364]) +1
> other test fail
> =C2=A0=C2=A0 [373]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_evict@evict-beng-large-multi-vm-cm.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][374] ([Intel XE#1600]) +1
> other test fail
> =C2=A0=C2=A0 [374]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_evict@evict-beng-large-multi-vm-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [T=
IMEOUT][375] ([Intel XE#1473])
> +1 other test timeout
> =C2=A0=C2=A0 [375]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_evict@evict-beng-mixed-many-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [T=
IMEOUT][376] ([Intel XE#1473] /
> [Intel XE#402])
> =C2=A0=C2=A0 [376]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_evict@evict-beng-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-threads-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][377] ([Intel XE#688]) +58
> other tests skip
> =C2=A0=C2=A0 [377]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_evict@evict-beng-threads-large-multi-vm.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [TIMEOUT][378] ([Intel XE#1473])
> +2 other tests timeout
> =C2=A0=C2=A0 [378]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
xe_evict@evict-mixed-many-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-external-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][379] ([Intel XE#261] /
> [Intel XE#688]) +47 other tests skip
> =C2=A0=C2=A0 [379]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_evict@evict-small-external-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [TIMEOUT][380] ([Intel XE#1473] /
> [Intel XE#2472]) +1 other test timeout
> =C2=A0=C2=A0 [380]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_evict@evict-threads-large.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][381] ([Intel XE#688]) +8
> other tests skip
> =C2=A0=C2=A0 [381]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][382] ([Intel XE#2322]) +44
> other tests skip
> =C2=A0=C2=A0 [382]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][383] ([Intel XE#1392]) +50
> other tests skip
> =C2=A0=C2=A0 [383]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_exec_basic@multigpu-no-exec-userptr.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][384] ([Intel XE#1392]) +49
> other tests skip
> =C2=A0=C2=A0 [384]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][385] ([Intel XE#288]) +135
> other tests skip
> =C2=A0=C2=A0 [385]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][386] ([Intel XE#288]) +133
> other tests skip
> =C2=A0=C2=A0 [386]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][387] ([Intel XE#2360]) +2
> other tests skip
> =C2=A0=C2=A0 [387]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][388] ([Intel XE#2360]) +3
> other tests skip
> =C2=A0=C2=A0 [388]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>=20
> =C2=A0 * igt@xe_exec_reset@cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][389] ([Intel
> XE#3868])
> =C2=A0=C2=A0 [389]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_exec_reset@cat-error.html
>=20
> =C2=A0 * igt@xe_exec_reset@cm-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][390] ([Intel
> XE#3868])
> =C2=A0=C2=A0 [390]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_exec_reset@cm-cat-error.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-rebind-err:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][391] ([Intel
> XE#3876])
> =C2=A0=C2=A0 [391]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_exec_threads@threads-hang-rebind-err.html
>=20
> =C2=A0 * igt@xe_huc_copy@huc_copy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][392] ([Intel XE#255])
> =C2=A0=C2=A0 [392]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_huc_copy@huc_copy.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][393] ([Intel XE#2229] /
> [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [393]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][394] ([Intel XE#2229] /
> [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [394]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_live_ktest@xe_bo.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][395] ([Intel XE#3099]) +2
> other tests fail
> =C2=A0=C2=A0 [395]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][396] ([Intel XE#2229]) +1
> other test skip
> =C2=A0=C2=A0 [396]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_eudebug:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][397] ([Intel XE#2833])
> =C2=A0=C2=A0 [397]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_live_ktest@xe_eudebug.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][398] ([Intel XE#1192] /
> [Intel XE#3026])
> =C2=A0=C2=A0 [398]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_live_ktest@xe_eudebug.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_migrate:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][399] ([Intel XE#1192]) +3
> other tests skip
> =C2=A0=C2=A0 [399]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_live_ktest@xe_migrate.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][400] ([Intel XE#2229]) +1
> other test skip
> =C2=A0=C2=A0 [400]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][401] ([Intel XE#1999]) +2
> other tests fail
> =C2=A0=C2=A0 [401]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][402] ([Intel XE#1999]) +2
> other tests fail
> =C2=A0=C2=A0 [402]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>=20
> =C2=A0 * igt@xe_media_fill@media-fill:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][403] ([Intel XE#2459] /
> [Intel XE#2596])
> =C2=A0=C2=A0 [403]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_media_fill@media-fill.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][404] ([Intel XE#560])
> =C2=A0=C2=A0 [404]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_media_fill@media-fill.html
>=20
> =C2=A0 * igt@xe_mmap@small-bar:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][405] ([Intel XE#512])
> =C2=A0=C2=A0 [405]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_mmap@small-bar.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][406] ([Intel XE#586])
> =C2=A0=C2=A0 [406]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_mmap@small-bar.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][407] ([Intel XE#512])
> =C2=A0=C2=A0 [407]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_mmap@small-bar.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][408] ([Intel XE#512])
> =C2=A0=C2=A0 [408]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_mmap@small-bar.html
>=20
> =C2=A0 * igt@xe_module_load@force-load:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][409] ([Intel XE#2457])
> =C2=A0=C2=A0 [409]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_module_load@force-load.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][410] ([Intel XE#378])
> =C2=A0=C2=A0 [410]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@force-load.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][411] ([Intel XE#378])
> =C2=A0=C2=A0 [411]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@force-load.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][412] ([Intel XE#378])
> =C2=A0=C2=A0 [412]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_module_load@force-load.html
>=20
> =C2=A0 * igt@xe_module_load@reload:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][413] ([Intel XE#3546])
> =C2=A0=C2=A0 [413]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@reload.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][414] ([Intel XE#3546])
> =C2=A0=C2=A0 [414]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@reload.html
>=20
> =C2=A0 * igt@xe_noexec_ping_pong:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][415] ([Intel XE#379])
> =C2=A0=C2=A0 [415]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_noexec_ping_pong.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][416] ([Intel XE#379])
> =C2=A0=C2=A0 [416]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_noexec_ping_pong.html
>=20
> =C2=A0 * igt@xe_oa@oa-tlb-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][417] ([Intel XE#2248]) +1
> other test skip
> =C2=A0=C2=A0 [417]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_oa@oa-tlb-invalidate.html
>=20
> =C2=A0 * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][418] ([Intel XE#2541] /
> [Intel XE#3573]) +37 other tests skip
> =C2=A0=C2=A0 [418]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>=20
> =C2=A0 * igt@xe_oa@privileged-forked-access-vaddr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][419] ([Intel XE#2541] /
> [Intel XE#3573]) +39 other tests skip
> =C2=A0=C2=A0 [419]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@xe_oa@privileged-forked-access-vaddr.html
>=20
> =C2=A0 * igt@xe_oa@unprivileged-single-ctx-counters:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][420] ([Intel XE#2248]) +1
> other test skip
> =C2=A0=C2=A0 [420]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_oa@unprivileged-single-ctx-counters.html
>=20
> =C2=A0 * igt@xe_pat@display-vs-wb-transient:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][421] ([Intel XE#1337])
> =C2=A0=C2=A0 [421]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_pat@display-vs-wb-transient.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][422] ([Intel XE#1337])
> =C2=A0=C2=A0 [422]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_pat@display-vs-wb-transient.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xe2:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][423] ([Intel XE#977])
> =C2=A0=C2=A0 [423]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_pat@pat-index-xe2.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][424] ([Intel XE#977])
> =C2=A0=C2=A0 [424]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_pat@pat-index-xe2.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xehpc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][425] ([Intel XE#2838] /
> [Intel XE#979])
> =C2=A0=C2=A0 [425]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_pat@pat-index-xehpc.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][426] ([Intel XE#1420])
> =C2=A0=C2=A0 [426]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_pat@pat-index-xehpc.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][427] ([Intel XE#2838] /
> [Intel XE#979])
> =C2=A0=C2=A0 [427]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_pat@pat-index-xehpc.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][428] ([Intel XE#1420] /
> [Intel XE#2838])
> =C2=A0=C2=A0 [428]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_pat@pat-index-xehpc.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][429] ([Intel XE#977])
> =C2=A0=C2=A0 [429]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_pat@pat-index-xelp.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][430] ([Intel XE#2245])
> =C2=A0=C2=A0 [430]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
xe_pat@pat-index-xelp.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][431] ([Intel XE#979])
> =C2=A0=C2=A0 [431]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_pat@pat-index-xelpg.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][432] ([Intel XE#2236])
> =C2=A0=C2=A0 [432]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_pat@pat-index-xelpg.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][433] ([Intel XE#979])
> =C2=A0=C2=A0 [433]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_pat@pat-index-xelpg.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][434] ([Intel XE#979])
> =C2=A0=C2=A0 [434]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][435] ([Intel XE#1061]) +1
> other test skip
> =C2=A0=C2=A0 [435]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_peer2peer@read.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][436] ([Intel XE#2427]) +1
> other test skip
> =C2=A0=C2=A0 [436]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_peer2peer@read.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][437] ([Intel XE#1061]) +1
> other test skip
> =C2=A0=C2=A0 [437]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_peer2peer@read.html
>=20
> =C2=A0 * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][438] ([Intel XE#1173]) +3
> other tests fail
> =C2=A0=C2=A0 [438]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][439] ([Intel XE#2284] /
> [Intel XE#366]) +7 other tests skip
> =C2=A0=C2=A0 [439]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_pm@d3cold-basic.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-system:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][440] ([Intel XE#2284]) +3
> other tests skip
> =C2=A0=C2=A0 [440]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_pm@d3cold-mmap-system.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][441] ([Intel XE#2284] /
> [Intel XE#366]) +5 other tests skip
> =C2=A0=C2=A0 [441]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_pm@d3cold-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][442] ([Intel XE#2284])
> =C2=A0=C2=A0 [442]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_pm@d3cold-mocs.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][443] ([Intel XE#2284])
> =C2=A0=C2=A0 [443]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_pm@d3cold-mocs.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][444] ([Intel XE#1948])
> =C2=A0=C2=A0 [444]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_pm@d3hot-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][445] ([Intel XE#2284] /
> [Intel XE#366]) +7 other tests skip
> =C2=A0=C2=A0 [445]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_pm@s2idle-d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s3-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][446] ([Intel XE#584]) +9
> other tests skip
> =C2=A0=C2=A0 [446]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_pm@s3-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s4-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][447] ([Intel XE#1358] /
> [Intel XE#1607] / [Intel XE#1794])
> =C2=A0=C2=A0 [447]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_pm@s4-multiple-execs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [ABORT][448] ([Intel XE#1607] /
> [Intel XE#1794])
> =C2=A0=C2=A0 [448]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][449] ([Intel XE#579])
> =C2=A0=C2=A0 [449]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_pm@vram-d3cold-threshold.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][450] ([Intel XE#579])
> =C2=A0=C2=A0 [450]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_pm_residency@toggle-gt-c6:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][451] ([Intel XE#958])
> =C2=A0=C2=A0 [451]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_pm_residency@toggle-gt-c6.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-engines:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][452] ([Intel XE#944]) +16
> other tests skip
> =C2=A0=C2=A0 [452]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_query@multigpu-query-engines.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-cs-cycles:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][453] ([Intel XE#944]) +14
> other tests skip
> =C2=A0=C2=A0 [453]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_query@multigpu-query-invalid-cs-cycles.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-extension:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][454] ([Intel XE#944]) +14
> other tests skip
> =C2=A0=C2=A0 [454]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@xe_query@multigpu-query-invalid-extension.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][455] ([Intel XE#944]) +15
> other tests skip
> =C2=A0=C2=A0 [455]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_query@multigpu-query-invalid-size.html
>=20
> =C2=A0 * igt@xe_query@query-gt-list:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][456] ([Intel XE#1130]) +50
> other tests skip
> =C2=A0=C2=A0 [456]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_query@query-gt-list.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-vf1-clear:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][457] ([Intel XE#3342]) +1
> other test skip
> =C2=A0=C2=A0 [457]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_sriov_flr@flr-vf1-clear.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][458] ([Intel XE#3342]) +1
> other test skip
> =C2=A0=C2=A0 [458]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_sriov_flr@flr-vf1-clear.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-mode-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [A=
BORT][459] ([Intel XE#3075] /
> [Intel XE#3084])
> =C2=A0=C2=A0 [459]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_wedged@wedged-mode-toggle.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ([DMESG-WARN][460], [DMESG-WARN][461],
> [DMESG-WARN][462], [DMESG-WARN][463], [DMESG-WARN][464], [DMESG-
> WARN][465], [DMESG-WARN][466], [DMESG-WARN][467], [DMESG-WARN][468],
> [DMESG-WARN][469], [DMESG-WARN][470], [DMESG-WARN][471], [DMESG-
> WARN][472], [DMESG-WARN][473], [DMESG-WARN][474], [DMESG-WARN][475],
> [DMESG-WARN][476], [DMESG-WARN][477], [DMESG-WARN][478], [DMESG-
> WARN][479], [DMESG-WARN][480], [DMESG-WARN][481], [DMESG-WARN][482],
> [DMESG-WARN][483]) ([Intel XE#3899]) -> ([PASS][484], [PASS][485],
> [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490],
> [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495],
> [PASS][496], [SKIP][497], [PASS][498], [PASS][499], [PASS][500],
> [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505],
> [PASS][506], [PASS][507], [PASS][508], [PASS][509]) ([Intel XE#378])
> =C2=A0=C2=A0 [460]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [461]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [462]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [463]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [464]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [465]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [466]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [467]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [468]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [469]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [470]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [471]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [472]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [473]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [474]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [475]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [476]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [477]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [478]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [479]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [480]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [481]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [482]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [483]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-lnl-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [484]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [485]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [486]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [487]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [488]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [489]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [490]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [491]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [492]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [493]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [494]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [495]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [496]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [497]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-6/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [498]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [499]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [500]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [501]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [502]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [503]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [504]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [505]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [506]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [507]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-2/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [508]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [509]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-lnl-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ([DMESG-WARN][510], [DMESG-WARN][511],
> [DMESG-WARN][512], [DMESG-WARN][513], [DMESG-WARN][514], [DMESG-
> WARN][515], [DMESG-WARN][516], [DMESG-WARN][517], [DMESG-WARN][518],
> [DMESG-WARN][519], [DMESG-WARN][520], [DMESG-WARN][521], [DMESG-
> WARN][522], [DMESG-WARN][523], [DMESG-WARN][524], [DMESG-WARN][525],
> [DMESG-WARN][526], [DMESG-WARN][527], [DMESG-WARN][528], [DMESG-
> WARN][529], [DMESG-WARN][530], [DMESG-WARN][531], [DMESG-WARN][532],
> [DMESG-WARN][533], [DMESG-WARN][534]) ([Intel XE#3899]) ->
> ([PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539],
> [PASS][540], [SKIP][541], [PASS][542], [PASS][543], [PASS][544],
> [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549],
> [PASS][550], [PASS][551], [PASS][552], [PASS][553], [PASS][554],
> [PASS][555], [PASS][556], [PASS][557], [PASS][558], [PASS][559])
> ([Intel XE#2457])
> =C2=A0=C2=A0 [510]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [511]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [512]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [513]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [514]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [515]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [516]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [517]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [518]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [519]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [520]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [521]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [522]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [523]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-7/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [524]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [525]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [526]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [527]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [528]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [529]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [530]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-5/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [531]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [532]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [533]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [534]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-bmg-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [535]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [536]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [537]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [538]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [539]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [540]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [541]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [542]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [543]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [544]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [545]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [546]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [547]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [548]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [549]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-4/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [550]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [551]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-3/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [552]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [553]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [554]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [555]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [556]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-8/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [557]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-7/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [558]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-1/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0 [559]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-bmg-5/igt@=
xe_module_load@load.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ([DMESG-WARN][560], [DMESG-WARN][561],
> [DMESG-WARN][562], [DMESG-WARN][563], [DMESG-WARN][564], [DMESG-
> WARN][565], [DMESG-WARN][566], [DMESG-WARN][567], [DMESG-WARN][568],
> [DMESG-WARN][569], [DMESG-WARN][570], [DMESG-WARN][571], [DMESG-
> WARN][572], [DMESG-WARN][573], [DMESG-WARN][574], [DMESG-WARN][575],
> [DMESG-WARN][576], [DMESG-WARN][577], [DMESG-WARN][578], [DMESG-
> WARN][579], [DMESG-WARN][580], [DMESG-WARN][581], [DMESG-WARN][582],
> [DMESG-WARN][583], [DMESG-WARN][584]) ([Intel XE#3899]) ->
> ([PASS][585], [PASS][586], [PASS][587], [PASS][588], [PASS][589],
> [PASS][590], [PASS][591], [PASS][592], [PASS][593], [PASS][594],
> [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599],
> [PASS][600], [PASS][601], [PASS][602], [SKIP][603], [PASS][604],
> [PASS][605], [PASS][606], [PASS][607], [PASS][608], [PASS][609],
> [PASS][610]) ([Intel XE#378])
> =C2=A0=C2=A0 [560]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [561]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [562]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [563]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [564]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [565]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [566]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [567]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [568]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [569]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [570]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [571]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [572]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [573]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [574]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [575]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [576]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [577]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [578]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [579]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [580]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [581]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [582]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [583]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [584]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [585]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [586]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [587]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [588]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [589]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [590]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [591]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [592]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [593]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [594]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [595]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [596]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [597]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [598]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [599]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [600]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [601]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [602]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [603]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [604]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [605]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [606]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [607]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [608]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [609]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [610]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 ([DMESG-WARN=
][611], [DMESG-WARN][612],
> [DMESG-WARN][613], [DMESG-WARN][614], [DMESG-WARN][615], [DMESG-
> WARN][616], [DMESG-WARN][617], [DMESG-WARN][618], [DMESG-WARN][619],
> [DMESG-WARN][620], [DMESG-WARN][621], [DMESG-WARN][622], [DMESG-
> WARN][623], [DMESG-WARN][624], [DMESG-WARN][625], [DMESG-WARN][626],
> [DMESG-WARN][627], [DMESG-WARN][628], [DMESG-WARN][629], [DMESG-
> WARN][630], [DMESG-WARN][631], [DMESG-WARN][632], [DMESG-WARN][633],
> [DMESG-WARN][634], [DMESG-WARN][635]) ([Intel XE#3899]) ->
> ([PASS][636], [PASS][637], [PASS][638], [PASS][639], [PASS][640],
> [PASS][641], [PASS][642], [PASS][643], [PASS][644], [PASS][645],
> [PASS][646], [PASS][647], [PASS][648], [PASS][649], [PASS][650],
> [PASS][651], [SKIP][652], [PASS][653], [PASS][654], [PASS][655],
> [PASS][656], [PASS][657], [PASS][658], [PASS][659], [PASS][660],
> [PASS][661]) ([Intel XE#378])
> =C2=A0=C2=A0 [611]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [612]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [613]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [614]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [615]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [616]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [617]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [618]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [619]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [620]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [621]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [622]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [623]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [624]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [625]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [626]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [627]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [628]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [629]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [630]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [631]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [632]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [633]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [634]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [635]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2418-57cbd7d762d4dccb8784836=
a6a12bbb4122c1695/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [636]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [637]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [638]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [639]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [640]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [641]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [642]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [643]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [644]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [645]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [646]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [647]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [648]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [649]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [650]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [651]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [652]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [653]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [654]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [655]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [656]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [657]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [658]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [659]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [660]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [661]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/shard-dg2-435/ig=
t@xe_module_load@load.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1033]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> =C2=A0 [Intel XE#1035]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1062]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1125]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1128]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> =C2=A0 [Intel XE#1131]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1137]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
> =C2=A0 [Intel XE#1138]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> =C2=A0 [Intel XE#1151]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
> =C2=A0 [Intel XE#1152]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
> =C2=A0 [Intel XE#1158]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1174]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1192]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
> =C2=A0 [Intel XE#1280]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> =C2=A0 [Intel XE#1337]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
> =C2=A0 [Intel XE#1340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
> =C2=A0 [Intel XE#1341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1397]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1420]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1428]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
> =C2=A0 [Intel XE#1430]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1447]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
> =C2=A0 [Intel XE#1450]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
> =C2=A0 [Intel XE#1465]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
> =C2=A0 [Intel XE#1466]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
> =C2=A0 [Intel XE#1467]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
> =C2=A0 [Intel XE#1468]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
> =C2=A0 [Intel XE#1469]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
> =C2=A0 [Intel XE#1470]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1477]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1504]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
> =C2=A0 [Intel XE#1508]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> =C2=A0 [Intel XE#1512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> =C2=A0 [Intel XE#1600]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
> =C2=A0 [Intel XE#1607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> =C2=A0 [Intel XE#1695]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
> =C2=A0 [Intel XE#1725]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#1948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
> =C2=A0 [Intel XE#1999]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
> =C2=A0 [Intel XE#2029]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2078]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
> =C2=A0 [Intel XE#2134]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> =C2=A0 [Intel XE#2136]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> =C2=A0 [Intel XE#2141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
> =C2=A0 [Intel XE#2142]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
> =C2=A0 [Intel XE#2159]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
> =C2=A0 [Intel XE#2168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#2231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
> =C2=A0 [Intel XE#2233]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2236]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2245]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
> =C2=A0 [Intel XE#2248]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2286]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> =C2=A0 [Intel XE#2293]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2328]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> =C2=A0 [Intel XE#2330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> =C2=A0 [Intel XE#2333]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
> =C2=A0 [Intel XE#2340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2350]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
> =C2=A0 [Intel XE#2351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> =C2=A0 [Intel XE#2352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2364]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
> =C2=A0 [Intel XE#2370]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
> =C2=A0 [Intel XE#2372]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
> =C2=A0 [Intel XE#2375]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2385]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
> =C2=A0 [Intel XE#2387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> =C2=A0 [Intel XE#2390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> =C2=A0 [Intel XE#2391]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
> =C2=A0 [Intel XE#2392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2413]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
> =C2=A0 [Intel XE#2414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
> =C2=A0 [Intel XE#2423]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2427]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> =C2=A0 [Intel XE#2446]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
> =C2=A0 [Intel XE#2457]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
> =C2=A0 [Intel XE#2459]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
> =C2=A0 [Intel XE#2472]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
> =C2=A0 [Intel XE#2486]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
> =C2=A0 [Intel XE#2493]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
> =C2=A0 [Intel XE#2499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
> =C2=A0 [Intel XE#2501]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
> =C2=A0 [Intel XE#2502]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
> =C2=A0 [Intel XE#2504]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
> =C2=A0 [Intel XE#2505]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#255]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
> =C2=A0 [Intel XE#2550]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
> =C2=A0 [Intel XE#2568]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
> =C2=A0 [Intel XE#2596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2635]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2669]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
> =C2=A0 [Intel XE#2724]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2833]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
> =C2=A0 [Intel XE#2838]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
> =C2=A0 [Intel XE#2849]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2853]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2882]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2925]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
> =C2=A0 [Intel XE#2927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> =C2=A0 [Intel XE#2934]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
> =C2=A0 [Intel XE#2938]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
> =C2=A0 [Intel XE#2939]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#3007]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
> =C2=A0 [Intel XE#3009]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3012]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> =C2=A0 [Intel XE#3026]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> =C2=A0 [Intel XE#3070]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
> =C2=A0 [Intel XE#3075]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#3084]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3099]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3157]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
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
> =C2=A0 [Intel XE#330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> =C2=A0 [Intel XE#3304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> =C2=A0 [Intel XE#3307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
> =C2=A0 [Intel XE#3309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3342]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3383]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3433]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
> =C2=A0 [Intel XE#3442]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
> =C2=A0 [Intel XE#346]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> =C2=A0 [Intel XE#352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3546]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
> =C2=A0 [Intel XE#356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#3576]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
> =C2=A0 [Intel XE#361]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#3658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3719]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
> =C2=A0 [Intel XE#3767]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
> =C2=A0 [Intel XE#3768]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3781]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
> =C2=A0 [Intel XE#379]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
> =C2=A0 [Intel XE#3819]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3819
> =C2=A0 [Intel XE#3862]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3869]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3869
> =C2=A0 [Intel XE#3876]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> =C2=A0 [Intel XE#3889]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
> =C2=A0 [Intel XE#3897]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
> =C2=A0 [Intel XE#3898]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898
> =C2=A0 [Intel XE#3899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899
> =C2=A0 [Intel XE#402]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
> =C2=A0 [Intel XE#560]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#584]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
> =C2=A0 [Intel XE#586]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
> =C2=A0 [Intel XE#599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> =C2=A0 [Intel XE#605]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#610]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#619]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> =C2=A0 [Intel XE#623]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
> =C2=A0 [Intel XE#664]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#703]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#736]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#873]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
> =C2=A0 [Intel XE#877]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
> =C2=A0 [Intel XE#911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#958]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> =C2=A0 [Intel XE#977]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> =C2=A0 [i915#2575]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> =C2=A0 [i915#3804]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> =C2=A0 [i915#5274]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-2418-57cbd7d762d4dccb8784836a6a12bbb4122c1695 -> xe-pw=
-
> 142919v1
>=20
> =C2=A0 IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-2418-57cbd7d762d4dccb8784836a6a12bbb4122c1695:
> 57cbd7d762d4dccb8784836a6a12bbb4122c1695
> =C2=A0 xe-pw-142919v1: 142919v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142919v1/index.html

