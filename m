Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B019C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C063C10E0C0;
	Fri, 21 Mar 2025 16:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXyeQqEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA22110E0C0
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742573015; x=1774109015;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Tpwa7ykW0nPbw3Ioni5Y+WyDHG/G9EB8a1dIjCFvkvk=;
 b=nXyeQqEXlh0fJcVoIIHZ5KA0X45QwWp7bj/mBjyjvUqeKYyBDaq3pMpC
 WygSqNhk5SobgtY1Zc6z/zhOVXzgFtfpIa+nAKwyalk/OJSoIMn2n34hJ
 A/y1vTIMmqyfSsMhxQZmlE6LbGg0wz7srGUSjneaQ89OAtbiZ/4orjAjM
 tWVqjJEh8ut/o+caYpiPGZMgwqDKAaEqUE/OB6s7HXzl64EsYZY4SxYrZ
 G1/WOH8eu2YjMJrap2Kr8SskGRGB11Eau7YISEVMZ3nTStRrSM1b+e4Av
 lTmNS8MostSRmcP3s9eef+NPJqWBrXxTa5os8/sjD8UALymRVnNX9I0Ng w==;
X-CSE-ConnectionGUID: zeQWQr/YQ5S6O+k76WDFow==
X-CSE-MsgGUID: 1M29Q74UTKmnvHLZjt3d6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54838404"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="54838404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:03:34 -0700
X-CSE-ConnectionGUID: BWezhrflQSaH649Jir9OQw==
X-CSE-MsgGUID: LinUZw8QQi65mYSPtBW4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123897160"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.196])
 ([10.245.246.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:03:32 -0700
Message-ID: <46148d247fedde43b92a503efe61c69b5e28d29f.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe: Simplify
 pinned bo iteration (rev2)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 17:03:30 +0100
In-Reply-To: <174257258265.65138.6001448777445797600@18a75f3d1eae>
References: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
 <174257258265.65138.6001448777445797600@18a75f3d1eae>
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

On Fri, 2025-03-21 at 15:56 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Simplify pinned bo iteration (rev2)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/146586/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2832-
> b15a87713d14b1c2986f47a622c5a8c5458e2396_full -> xe-pw-146586v2_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-146586v2_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-146586v2_full, please notify your bug team
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
> pw-146586v2_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_eu_stall@blocking-read:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [INCOMPLETE][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-lnl-2/igt@xe_eu_stall@blocking-read.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-6/igt@=
xe_eu_stall@blocking-read.html
>=20
> =C2=A0 * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_eudebug_online@set-breakpoint-sigint-debugger.html
>=20
>=20

These failures are not related.
Thanks,
Thomas


> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-146586v2_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][4] -> [FAIL][5] ([Intel XE#3701] /
> [Intel XE#3718] / [Intel XE#827])
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip=
-atomic.html
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-2/igt@=
kms_async_flips@alternate-sync-async-flip-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][6] -> [FAIL][7] ([Intel XE#3746] /
> [Intel XE#827])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-d-dp-2.html
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-2/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe=
-
> b-hdmi-a-6-4-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][8] ([Intel XE#3767]) +15
> other tests skip
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4=
-mc-ccs.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2=
-
> 4-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][9] ([Intel XE#2550] /
> [Intel XE#3767]) +15 other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.=
html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#873])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_async_flips@invalid-async-flip.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][11] -> [FAIL][12] ([Intel XE#3908])
> +1 other test fail
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modes=
et-transition.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-6/igt=
@kms_atomic_transition@plane-toggle-modeset-transition.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#2327]) +2
> other tests skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_big_fb@linear-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#316])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_big_fb@linear-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][15] -> [DMESG-FAIL][16] ([Intel
> XE#4543])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-0-async-flip.html
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-1/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#607])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#1124]) +6
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][19] ([Intel XE#1124])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#367])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][21] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_bw@linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#2887]) +13
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][23] ([Intel XE#787]) +137
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-
> d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#455] /
> [Intel XE#787]) +25 other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#2652] /
> [Intel XE#787]) +7 other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#3432])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][27] -=
> [INCOMPLETE][28] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][29] -=
> [INCOMPLETE][30] ([Intel
> XE#3124])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-b-dp-4.html
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][31] -=
> [DMESG-WARN][32] ([Intel
> XE#1727] / [Intel XE#3113])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-b-hdmi-a-6.html
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][33] ([Intel XE#4416]) +3
> other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#2325]) +1
> other test skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#2252]) +6
> other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][36] ([Intel XE#373]) +2
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_chamelium_frames@hdmi-cmp-planes-random.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][37] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/ig=
t@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-lic-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#2390])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_content_protection@dp-mst-lic-type-1.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#2320]) +5
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_cursor_crc@cursor-offscreen-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#2286]) +2
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][41] -> [SKIP][42] ([Intel XE#2291])
> +3 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy=
.html
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@=
kms_cursor_legacy@cursora-vs-flipb-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][43] -=
> [SKIP][44] ([Intel XE#309])
> +2 other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-togg=
le.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][45] -> [SKIP][46] ([Intel XE#1340])
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@=
kms_dither@fb-8bpc-vs-panel-6bpc.html
>=20
> =C2=A0 * igt@kms_dp_link_training@non-uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][47] ([Intel XE#4354])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_dp_link_training@non-uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#2244])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_dsc@dsc-fractional-bpp-with-bpc.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#4422])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#4156])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_fbcon_fbt@fbc-suspend.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#776])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_fbcon_fbt@psr.html
>=20
> =C2=A0 * igt@kms_feature_discovery@chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#2372])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_feature_discovery@chamelium.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#2374])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_feature_discovery@psr2.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][54] -> [SKIP][55] ([Intel XE#2316])
> +6 other tests skip
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.ht=
ml
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-blocking-wf-vblank.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][56] -=
> [SKIP][57] ([Intel XE#310])
> +3 other tests skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@kms_flip@2x-flip-vs-dpms.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_flip@2x-flip-vs-dpms.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi=
-
> a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][58] ([Intel XE#3321]) +4
> other tests fail
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][59] -> [FAIL][60] ([Intel XE#3321])
> +1 other test fail
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@=
kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][61] -> [FAIL][62] ([Intel XE#886])
> +1 other test fail
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-3/igt@=
kms_flip@flip-vs-absolute-wf_vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][63] -> [FAIL][64] ([Intel XE#886])
> +2 other tests fail
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-9/igt=
@kms_flip@flip-vs-blocking-wf-vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][65] -=
> [FAIL][66] ([Intel XE#301])
> +3 other tests fail
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@a-hdmi-a6.html
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#2293] /
> [Intel XE#2380]) +2 other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#2293]) +2
> other tests skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][69] ([Intel XE#455]) +5
> other tests skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-va=
lid-mode.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2311]) +20
> other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][71] -=
> [SKIP][72] ([Intel XE#656])
> +3 other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#4141]) +10
> other tests skip
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbc-tiling-linear.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][74] ([Intel XE#651]) +12
> other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][75] ([Intel XE#658])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][76] ([Intel XE#653]) +10
> other tests skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#2352])
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#2313]) +22
> other tests skip
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#346])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_joiner@invalid-modeset-big-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#2934])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_joiner@invalid-modeset-force-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#2393])
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_plane_lowres@tiling-yf.html
>=20
> =C2=A0 * igt@kms_pm_backlight@bad-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][82] ([Intel XE#870])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_pm_backlight@bad-brightness.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#2505])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp-stress:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#836])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_pm_rpm@modeset-lpsp-stress.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][85] ([Intel XE#1489]) +3
> other tests skip
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][86] ([Intel XE#1489]) +1
> other test skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#2387]) +1
> other test skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_psr2_su@page_flip-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#2234] /
> [Intel XE#2850]) +9 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_psr@fbc-psr2-basic.html
>=20
> =C2=A0 * igt@kms_psr@psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][89] ([Intel XE#2850] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_psr@psr2-basic.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#2414])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][91] ([Intel XE#3414])
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_rotation_crc@sprite-rotation-270.html
>=20
> =C2=A0 * igt@kms_scaling_modes@scaling-mode-full-aspect:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#2413])
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_scaling_modes@scaling-mode-full-aspect.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#2450])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#2168])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_vrr@cmrr.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][96] -> [FAIL][97] ([Intel XE#4459])
> +1 other test fail
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-7/igt@=
kms_vrr@cmrr@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1091] /
> [Intel XE#2849])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-close:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][99] ([Intel XE#2905]) +2
> other tests skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_eudebug@basic-close.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#2905]) +7
> other tests skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
xe_eudebug_online@single-step.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][101] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#2322]) +6
> other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
xe_exec_basic@multigpu-once-null-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][103] =
-> [SKIP][104] ([Intel
> XE#1392]) +5 other tests skip
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][105] ([Intel XE#288]) +8
> other tests skip
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_eudebug:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#2833])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
xe_live_ktest@xe_eudebug.html
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 ([PASS][107]=
, [PASS][108], [PASS][109],
> [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114],
> [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119],
> [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124],
> [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129],
> [PASS][130], [PASS][131]) -> ([PASS][132], [PASS][133], [PASS][134],
> [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139],
> [SKIP][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144],
> [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149],
> [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154],
> [PASS][155], [PASS][156], [PASS][157]) ([Intel XE#378])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/ig=
t@xe_module_load@load.html
>=20
> =C2=A0 * igt@xe_oa@missing-sample-flags:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][158] ([Intel XE#2541] /
> [Intel XE#3573]) +1 other test skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_oa@missing-sample-flags.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][159] ([Intel XE#2245])
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
xe_pat@pat-index-xelp.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#2284])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
xe_pm@d3cold-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][161] -> [DMESG-WARN][162] ([Intel
> XE#4173])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-1/igt=
@xe_pm@s2idle-vm-bind-userptr.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][163] ([Intel XE#579])
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@=
xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-gt-list:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
xe_query@multigpu-query-gt-list.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-extension:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][165] ([Intel XE#944])
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/ig=
t@xe_query@multigpu-query-invalid-extension.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][166] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][167]
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays=
-3840x2160p.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][168] ([Intel XE#2291]) ->
> [PASS][169] +3 other tests pass
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-mod=
eset-vs-cursor-atomic.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@=
kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([Intel XE#309]) -> [PASS][171]
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atom=
ic-transitions.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-
> dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][172] =
([Intel XE#301] / [Intel
> XE#3321]) -> [PASS][173]
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-inte=
rruptible@ab-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-
> dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][174] =
([Intel XE#301]) -> [PASS][175]
> +2 other tests pass
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-inte=
rruptible@ac-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][176] ([Intel XE#3321]) ->
> [PASS][177]
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@=
kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][178] =
([Intel XE#310]) -> [PASS][179]
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_flip@2x-nonexisting-fb.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][180] ([Intel XE#2316]) ->
> [PASS][181] +4 other tests pass
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@=
kms_flip@2x-plain-flip-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][182] ([Intel XE#886]) -> [PASS][183]
> +1 other test pass
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp=
1.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-8/igt@=
kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][184] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][185] +2 other tests pass
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-4/igt=
@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#656]) -> [PASS][187]
> +1 other test pass
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[188] -> [PASS][189] +3 other
> tests pass
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@kms_joiner@basic-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][190] ([Intel XE#1435]) ->
> [PASS][191]
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.htm=
l
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][192] =
([Intel XE#1392]) ->
> [PASS][193] +5 other tests pass
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-def=
er-bind.html
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/ig=
t@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a=
-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][194] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][195] ([Intel XE#787]) +3 other tests skip
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12=
-rc-ccs@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-
> a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][196] =
([Intel XE#787]) -> [SKIP][197]
> ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen1=
2-rc-ccs@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][198] =
([Intel XE#4418]) ->
> [SKIP][199] ([Intel XE#4440])
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.h=
tml
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][200] =
([Intel XE#1188]) ->
> [SKIP][201] ([Intel XE#455])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][202] ([Intel XE#2312]) ->
> [SKIP][203] ([Intel XE#2311]) +11 other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][204] =
([Intel XE#651]) -> [SKIP][205]
> ([Intel XE#656]) +10 other tests skip
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-cur-indfb-onoff.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][206] ([Intel XE#4141]) ->
> [SKIP][207] ([Intel XE#2312]) +7 other tests skip
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][208] ([Intel XE#2312]) ->
> [SKIP][209] ([Intel XE#4141]) +4 other tests skip
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][210] ([Intel XE#2311]) ->
> [SKIP][211] ([Intel XE#2312]) +10 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prims=
crn-cur-indfb-draw-blt.html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][212] =
([Intel XE#656]) -> [SKIP][213]
> ([Intel XE#651]) +2 other tests skip
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri=
mscrn-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][214] ([Intel XE#2313]) ->
> [SKIP][215] ([Intel XE#2312]) +12 other tests skip
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-pri-indfb-draw-render.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][216] ([Intel XE#2312]) ->
> [SKIP][217] ([Intel XE#2313]) +14 other tests skip
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-spr-indfb-draw-blt.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][218] =
([Intel XE#656]) -> [SKIP][219]
> ([Intel XE#653]) +3 other tests skip
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-cur-indfb-onoff.html
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#653]) -> [SKIP][221]
> ([Intel XE#656]) +12 other tests skip
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][222] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][223] ([Intel XE#3544])
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][224] =
([Intel XE#1729]) ->
> [SKIP][225] ([Intel XE#362])
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][226] =
([Intel XE#1500]) ->
> [SKIP][227] ([Intel XE#362])
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@xe_peer2peer@write:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][228] =
([Intel XE#1173]) ->
> [SKIP][229] ([Intel XE#1061])
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a=
622c5a8c5458e2396/shard-dg2-435/igt@xe_peer2peer@write.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/ig=
t@xe_peer2peer@write.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2245]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2286]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
> =C2=A0 [Intel XE#2372]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
> =C2=A0 [Intel XE#2374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> =C2=A0 [Intel XE#2390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2413]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
> =C2=A0 [Intel XE#2414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
> =C2=A0 [Intel XE#2450]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
> =C2=A0 [Intel XE#2505]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2550]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2833]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
> =C2=A0 [Intel XE#2849]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> =C2=A0 [Intel XE#2934]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#346]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
> =C2=A0 [Intel XE#3718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3746]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
> =C2=A0 [Intel XE#3767]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#3908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4156]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4416]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> =C2=A0 [Intel XE#4418]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#4440]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
> =C2=A0 [Intel XE#4459]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#827]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#873]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -> xe-pw=
-
> 146586v2
>=20
> =C2=A0 IGT_8277: 8277
> =C2=A0 xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396:
> b15a87713d14b1c2986f47a622c5a8c5458e2396
> =C2=A0 xe-pw-146586v2: 146586v2
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/index.html

