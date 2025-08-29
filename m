Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A46CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 13:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361810EBB5;
	Fri, 29 Aug 2025 13:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0CGOZxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53810EBB5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756474021; x=1788010021;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=rc3lhIeM3W5GILeHurExz6PYVnLQLv4AXcErISK7WIY=;
 b=O0CGOZxKKnw6SyYOxjC6ihNkbNb7s6MMJqKUjpF7dwqFQuYmDvvRp2Eb
 IVkC5Iqrb1mnAeSUO6/AmUlbprnGhhlmd/Yz7lvantUXJAAij7LbYdNEZ
 fQS5cifFoA+GcC1DO3E1P9je63ODeDBu56ESdbucOh/RbeIbRixQEwxZ4
 e3Ld0yI7OY9NtI06Evan2QxHdkiYdE6d9SFWJ05RO3LJEwQkInEkBpok5
 My+YURPNhkDRk0QdOkSVysVlbN+5BkCczbfw3YgUqyu4GjwLT0QHcZUCQ
 nDGe9YK4RUfgl0320oIRpI1lunsXZybbhE8ZhRfm/8q3mVBFl+TkGuGiz w==;
X-CSE-ConnectionGUID: Ek8Gks9LQUuMbtvh4l79Xw==
X-CSE-MsgGUID: hpHP8UMsRFWUrzWDi2ObVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58860434"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58860434"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:27:00 -0700
X-CSE-ConnectionGUID: 1kqYcoPpQJie792MAl8SEw==
X-CSE-MsgGUID: ApiA41arSHGWBFfeynpoCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174751918"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.245])
 ([10.245.245.245])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:26:59 -0700
Message-ID: <3b0dbc05dfcfa1fed4893f6fba11ebbaae241290.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe: Fix
 incorrect migration of backed-up object to VRAM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 15:26:56 +0200
In-Reply-To: <175641732874.280646.14225907464085674677@1538d3639d33>
References: <20250828134837.5709-1-thomas.hellstrom@linux.intel.com>
 <175641732874.280646.14225907464085674677@1538d3639d33>
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

On Thu, 2025-08-28 at 21:42 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Fix incorrect migration of backed-up object to VRAM
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/153634/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3630-
> 12bdbc7687846f438afff8bfdc89873b3cd95945_FULL -> xe-pw-153634v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-153634v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-153634v1_FULL, please notify your bug team
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
> pw-153634v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [FAIL][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-userpt=
r-invalidate-race-prefetch.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-1/igt@=
xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
>=20
> =C2=A0=20

Not related.
Thanks,
Thomas


> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-153634v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@fbdev@unaligned-write:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][3] ->=
 [SKIP][4] ([Intel XE#2134])
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@fbdev@unaligned-write.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@fbdev@unaligned-write.html
>=20
> =C2=A0 * igt@kms_addfb_basic@bad-pitch-63:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][5] -> [DMESG-WARN][6] ([Intel
> XE#2953] / [Intel XE#4173]) +11 other tests dmesg-warn
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_addfb_basic@bad-pitch-63.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_addfb_basic@bad-pitch-63.html
>=20
> =C2=A0 *
> igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pi
> pe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][7] ([Intel XE#911]) +1
> other test fail
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1=
.html
>=20
> =C2=A0 * igt@kms_async_flips@test-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#664])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_async_flips@test-cursor-atomic.html
>=20
> =C2=A0 *
> igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][9] ([Intel XE#4208] /
> [i915#2575]) +11 other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
>=20
> =C2=A0 *
> igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#3658])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5
> other tests skip
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][12] ([Intel XE#2351] /
> [Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][13] ([Intel XE#787]) +90
> other tests skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-435/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-
> dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#455] /
> [Intel XE#787]) +12 other tests skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][15] -=
> [INCOMPLETE][16] ([Intel
> XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] /
> [Intel XE#4345] / [Intel XE#4522])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs.html
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][17] ([Intel XE#1727]
> / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel
> XE#4522])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-
> 2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][18] ([Intel XE#2705]
> / [Intel XE#4212] / [Intel XE#4522])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][19] -=
> [INCOMPLETE][20] ([Intel
> XE#2705] / [Intel XE#4212])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-b-dp-4.html
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#2887]) +3
> other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#4417]) +3
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_cdclk@mode-transition@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#373]) +2
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][24] ([Intel XE#1178])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-435/ig=
t@kms_content_protection@atomic@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][25] ([Intel XE#1178])
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_content_protection@legacy@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-256x85:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1424])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_cursor_crc@cursor-random-256x85.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][27] -> [SKIP][28] ([Intel XE#2291])
> +3 other tests skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomi=
c.html
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#309])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][30] -=
> [SKIP][31] ([Intel XE#4208] /
> [i915#2575]) +52 other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic=
-transitions.html
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][32] -> [DMESG-WARN][33] ([Intel
> XE#5354])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-5/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][34] -> [SKIP][35] ([Intel XE#2316])
> +7 other tests skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_flip@2x-nonexisting-fb.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#1421])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_flip@2x-wf_vblank-ts-check.html
>=20
> =C2=A0 * igt@kms_flip@basic-flip-vs-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][37] -> [DMESG-WARN][38] ([Intel
> XE#4543]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-3/igt@kms_flip@basic-flip-vs-dpms.html
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-2/igt=
@kms_flip@basic-flip-vs-dpms.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][39] -> [FAIL][40] ([Intel XE#301])
> +2 other tests fail
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@b-edp1.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-3/igt@=
kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#1401] /
> [Intel XE#1745]) +1 other test skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#1401]) +1
> other test skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-=
a-default-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][43] -=
> [SKIP][44] ([Intel XE#2351] /
> [Intel XE#4208]) +9 other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-t=
o-64bpp-linear-upscaling.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@
> pipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][45] ([Intel XE#455]) +1
> other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-v=
alid-mode.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][46] -> [DMESG-FAIL][47] ([Intel
> XE#4543])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-=
d-hdmi-a-1-y-to-y.html
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>=20
> =C2=A0 * igt@kms_force_connector_basic@prune-stale-modes:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][48] -> [ABORT][49] ([Intel XE#2953])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_force_connector_basic@prune-stale-mo=
des.html
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_force_connector_basic@prune-stale-modes.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#656]) +10
> other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#651]) +1
> other test skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
>=20
> =C2=A0 * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#1450]) +1
> other test skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#1450] /
> [Intel XE#2568]) +1 other test skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][54] -> [SKIP][55] ([Intel XE#4596])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_plane_multiple@2x-tiling-x.html
>=20
> =C2=A0 * igt@kms_plane_multiple@tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#5020])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_plane_multiple@tiling-yf.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe
> -a:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#2763]) +3
> other tests skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][58] -> [FAIL][59] ([Intel XE#718])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][60] ([Intel XE#1406] /
> [Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#1406] /
> [Intel XE#2893] / [Intel XE#4608])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe=
-
> a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#1406] /
> [Intel XE#4608]) +1 other test skip
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vblank@query-forked-busy-hang:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][63] -=
> [INCOMPLETE][64] ([Intel
> XE#4488]) +1 other test incomplete
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_vblank@query-forked-busy-hang.html
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-466/ig=
t@kms_vblank@query-forked-busy-hang.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt@engine-
> drm_xe_engine_class_compute:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][65] ([Intel XE#1280] /
> [Intel XE#455])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.htm=
l
>=20
> =C2=A0 * igt@xe_eudebug_sriov@deny-sriov:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#4518])
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
xe_eudebug_sriov@deny-sriov.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#688])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_evict@evict-beng-large-multi-vm.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
xe_exec_basic@multigpu-once-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_basic@no-exec-basic-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][69] ([Intel XE#4208]) +57
> other tests skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_exec_basic@no-exec-basic-defer-bind.html
>=20
> =C2=A0 * igt@xe_exec_basic@once-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][70] -=
> [SKIP][71] ([Intel XE#4208])
> +125 other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_exec_basic@once-userptr-invalidate-r=
ace.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_exec_basic@once-userptr-invalidate-race.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#4943]) +5
> other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_eudebug:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#2833])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
xe_live_ktest@xe_eudebug.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][74] ([Intel XE#2229])
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#2229])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>=20
> =C2=A0 * igt@xe_module_load@many-reload:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][76] -> [DMESG-WARN][77] ([Intel
> XE#2953] / [Intel XE#4173] / [Intel XE#5244])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@xe_module_load@many-reload.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-4/igt=
@xe_module_load@many-reload.html
>=20
> =C2=A0 * igt@xe_module_load@reload-no-display:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][78] -=
> [FAIL][79] ([Intel XE#4208])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_module_load@reload-no-display.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@reload-no-display.html
>=20
> =C2=A0 * igt@xe_noexec_ping_pong:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#379])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
xe_noexec_ping_pong.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#2284] /
> [Intel XE#366])
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_pm@d3cold-basic.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#1948])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_pm@d3hot-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s3-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#584])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_pm@s3-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#944])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
xe_query@multigpu-query-invalid-size.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@core_setmaster@master-drop-set-root:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][85] (=
[Intel XE#4208]) -> [PASS][86]
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@core_setmaster@master-drop-set-root.htm=
l
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@core_setmaster@master-drop-set-root.html
>=20
> =C2=A0 * igt@kms_atomic@plane-invalid-params-fence:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][87] (=
[Intel XE#4208] / [i915#2575])
> -> [PASS][88] +38 other tests pass
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.h=
tml
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_atomic@plane-invalid-params-fence.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][89] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][90] +5 other tests pass
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-180.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-1/igt=
@kms_big_fb@linear-32bpp-rotate-180.html
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][91] ([Intel XE#4543]) ->
> [PASS][92] +1 other test pass
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][93] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][94]
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays=
-2160x1440p.html
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][95] (=
[Intel XE#2351] / [Intel
> XE#4208]) -> [PASS][96] +3 other tests pass
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-r=
c-ccs.html
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][97] ([Intel XE#5354]) ->
> [PASS][98]
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][99] ([Intel XE#2291]) -> [PASS][100]
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varyin=
g-size.html
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][101] ([Intel XE#2373]) ->
> [PASS][102]
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_flip@2x-busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][103] ([Intel XE#2316]) ->
> [PASS][104] +1 other test pass
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_flip@2x-busy-flip.html
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_flip@2x-busy-flip.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][105] ([Intel XE#4543]) ->
> [PASS][106] +6 other tests pass
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hd=
mi-a1.html
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-2/igt=
@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][107] ([Intel XE#301]) -> [PASS][108]
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][109] ([Intel XE#1874]) ->
> [PASS][110] +1 other test pass
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-x-to-x.html
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-3/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][111] ([Intel XE#1503]) ->
> [PASS][112] +1 other test pass
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][113] ([Intel XE#2142]) ->
> [PASS][114] +1 other test pass
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a=
-edp-1.html
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-lnl-4/igt@=
kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@xe_exec_basic@many-execqueues-many-vm-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][115] =
([Intel XE#4208]) ->
> [PASS][116] +79 other tests pass
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-b=
asic.html
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_exec_basic@many-execqueues-many-vm-basic.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][117] =
([Intel XE#1392]) ->
> [PASS][118] +3 other tests pass
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecque=
ue-userptr-invalidate-race.html
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][119] -> [PASS][120]
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-=
mmap-remap-dontunmap-eocheck.html
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-1/igt@=
xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 ([PASS][121]=
, [PASS][122], [PASS][123],
> [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128],
> [SKIP][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133],
> [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138],
> [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143],
> [PASS][144], [PASS][145], [PASS][146]) ([Intel XE#378]) ->
> ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151],
> [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156],
> [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161],
> [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166],
> [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171])
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-466/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-433/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-432/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-436/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-463/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-466/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-464/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-433/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-433/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-435/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-463/ig=
t@xe_module_load@load.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-466/ig=
t@xe_module_load@load.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][172] ([Intel XE#2953] / [Intel
> XE#4173] / [Intel XE#4504]) -> [PASS][173]
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-2/igt@xe_pm@s2idle-basic.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-1/igt=
@xe_pm@s2idle-basic.html
>=20
> =C2=A0 * igt@xe_pmu@engine-activity-idle:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][174] ([Intel XE#5213]) ->
> [PASS][175] +1 other test pass
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-3/igt@xe_pmu@engine-activity-idle.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-1/igt@=
xe_pmu@engine-activity-idle.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][176] =
([Intel XE#2351] / [Intel
> XE#4208]) -> [SKIP][177] ([Intel XE#316])
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_big_fb@4-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][178] =
([Intel XE#4208]) ->
> [SKIP][179] ([Intel XE#316]) +1 other test skip
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][180] =
([Intel XE#316]) -> [SKIP][181]
> ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][182] ([Intel XE#4543]) ->
> [DMESG-FAIL][183] ([Intel XE#2953] / [Intel XE#4173] / [Intel
> XE#4543])
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-180-async-flip.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-adlp-4/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][184] =
([Intel XE#4208]) ->
> [SKIP][185] ([Intel XE#1124]) +3 other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_big_fb@y-tiled-16bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#607]) -> [SKIP][187]
> ([Intel XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-ov=
erflow.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][188] =
([Intel XE#1124]) ->
> [SKIP][189] ([Intel XE#4208]) +4 other tests skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_big_fb@yf-tiled-16bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][190] =
([Intel XE#2351] / [Intel
> XE#4208]) -> [SKIP][191] ([Intel XE#1124]) +1 other test skip
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][192] =
([Intel XE#619]) -> [SKIP][193]
> ([Intel XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_big_fb@yf-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][194] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][195] ([Intel XE#2191])
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displa=
ys-1920x1080p.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][196] =
([Intel XE#2191]) ->
> [SKIP][197] ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displa=
ys-3840x2160p.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][198] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][199] ([Intel XE#367])
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x21=
60p.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_bw@linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][200] =
([Intel XE#367]) -> [SKIP][201]
> ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x10=
80p.html
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_bw@linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][202] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][203] ([Intel XE#4208]) +8 other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.h=
tml
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][204] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][205] ([Intel XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-m=
c-ccs.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][206] =
([Intel XE#3442]) ->
> [SKIP][207] ([Intel XE#4208])
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl=
-ccs.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#4208]) ->
> [SKIP][209] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen=
12-rc-ccs.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][210] =
([Intel XE#2351] / [Intel
> XE#4208]) -> [SKIP][211] ([Intel XE#455] / [Intel XE#787])
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.=
html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[212] ([Intel XE#1727] / [Intel
> XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] /
> [Intel XE#4522]) -> [INCOMPLETE][213] ([Intel XE#2705] / [Intel
> XE#4212] / [Intel XE#4345])
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][214] =
([Intel XE#4208]) ->
> [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#2705] / [Intel
> XE#4212] / [Intel XE#4522])
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-blue-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][216] =
([Intel XE#306]) -> [SKIP][217]
> ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.htm=
l
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_chamelium_color@ctm-blue-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][218] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][219] ([Intel XE#306])
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.htm=
l
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][221] ([Intel XE#373]) +4 other tests skip
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-durin=
g-hibernate.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-mode-timings:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][222] =
([Intel XE#373]) -> [SKIP][223]
> ([Intel XE#4208] / [i915#2575]) +4 other tests skip
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.ht=
ml
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_chamelium_edid@hdmi-mode-timings.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][224] ([Intel XE#2341]) ->
> [FAIL][225] ([Intel XE#1178])
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_content_protection@legacy.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][226] =
([Intel XE#1188]) ->
> [SKIP][227] ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-max-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][228] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][229] ([Intel XE#455]) +4 other tests skip
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.=
html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][230] =
([Intel XE#4208]) ->
> [SKIP][231] ([Intel XE#4422])
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-=
out-visible-area.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][232] =
([Intel XE#455]) -> [SKIP][233]
> ([Intel XE#4208])
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-t=
o-32bpp-yftileccs-upscaling.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
([Intel XE#4208]) ->
> [SKIP][235] ([Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to=
-32bpp-ytileccs-upscaling.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][236] ([Intel XE#2311]) ->
> [SKIP][237] ([Intel XE#2312]) +10 other tests skip
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-cur-indfb-draw-render.html
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][238] =
([Intel XE#651]) -> [SKIP][239]
> ([Intel XE#4208]) +11 other tests skip
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-cur-indfb-onoff.html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][240] ([Intel XE#2312]) ->
> [SKIP][241] ([Intel XE#2311]) +5 other tests skip
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-cur-indfb-move.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][242] =
([Intel XE#2351] / [Intel
> XE#4208]) -> [SKIP][243] ([Intel XE#651]) +5 other tests skip
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][244] ([Intel XE#2312]) ->
> [SKIP][245] ([Intel XE#5390]) +3 other tests skip
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-draw-render.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][246] ([Intel XE#5390]) ->
> [SKIP][247] ([Intel XE#2312]) +3 other tests skip
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-move.html
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][248] =
([Intel XE#4208]) ->
> [SKIP][249] ([Intel XE#651]) +5 other tests skip
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scn=
dscrn-spr-indfb-onoff.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][250] =
([Intel XE#651]) -> [SKIP][251]
> ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101=
010-draw-mmap-wc.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][252] =
([Intel XE#4208]) ->
> [SKIP][253] ([Intel XE#653]) +8 other tests skip
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-prim=
scrn-indfb-msflip-blt.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][254] ([Intel XE#2313]) ->
> [SKIP][255] ([Intel XE#2312]) +13 other tests skip
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-pri-indfb-draw-render.html
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][256] ([Intel XE#2312]) ->
> [SKIP][257] ([Intel XE#2313]) +5 other tests skip
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-pri-indfb-draw-render.html
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][258] =
([Intel XE#653]) -> [SKIP][259]
> ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-=
4.html
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][260] =
([Intel XE#653]) -> [SKIP][261]
> ([Intel XE#4208]) +11 other tests skip
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][262] =
([Intel XE#2351] / [Intel
> XE#4208]) -> [SKIP][263] ([Intel XE#653]) +3 other tests skip
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscr=
n-indfb-msflip-blt.html
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_joiner@basic-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][264] =
([Intel XE#2927]) ->
> [SKIP][265] ([Intel XE#4208])
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_joiner@basic-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][266] =
([Intel XE#4359]) ->
> [SKIP][267] ([Intel XE#4208])
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.=
html
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html
>=20
> =C2=A0 * igt@kms_pm_backlight@bad-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][268] =
([Intel XE#870]) -> [SKIP][269]
> ([Intel XE#4208])
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_pm_backlight@bad-brightness.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][270] =
([Intel XE#4208]) ->
> [SKIP][271] ([Intel XE#908])
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][272] =
([Intel XE#1406] / [Intel
> XE#1489]) -> [SKIP][273] ([Intel XE#1406] / [Intel XE#4208]) +5 other
> tests skip
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-=
sf.html
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][274] =
([Intel XE#1406] / [Intel
> XE#4208]) -> [SKIP][275] ([Intel XE#1406] / [Intel XE#1489]) +1 other
> test skip
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-con=
tinuous-exceed-fully-sf.html
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@frontbuffer-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][276] =
([Intel XE#1406] / [Intel
> XE#4208]) -> [SKIP][277] ([Intel XE#1122] / [Intel XE#1406])
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_psr2_su@frontbuffer-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr@pr-sprite-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][278] =
([Intel XE#1406] / [Intel
> XE#2850] / [Intel XE#929]) -> [SKIP][279] ([Intel XE#1406] / [Intel
> XE#4208]) +8 other tests skip
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_psr@pr-sprite-blt.html
>=20
> =C2=A0 * igt@kms_psr@psr-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][280] =
([Intel XE#1406] / [Intel
> XE#2850] / [Intel XE#929]) -> [SKIP][281] ([Intel XE#1406] / [Intel
> XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_psr@psr-dpms.html
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_psr@psr-dpms.html
>=20
> =C2=A0 * igt@kms_psr@psr-primary-page-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][282] =
([Intel XE#1406] / [Intel
> XE#2351] / [Intel XE#4208]) -> [SKIP][283] ([Intel XE#1406] / [Intel
> XE#2850] / [Intel XE#929]) +1 other test skip
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@kms_psr@psr-primary-page-flip.html
>=20
> =C2=A0 * igt@kms_psr@psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][284] =
([Intel XE#1406] / [Intel
> XE#4208]) -> [SKIP][285] ([Intel XE#1406] / [Intel XE#2850] / [Intel
> XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_psr@psr2-basic.html
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_psr@psr2-basic.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][286] =
([Intel XE#3414]) ->
> [SKIP][287] ([Intel XE#4208] / [i915#2575]) +1 other test skip
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.ht=
ml
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_rotation_crc@sprite-rotation-270.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][288] =
([Intel XE#4208] / [i915#2575])
> -> [SKIP][289] ([Intel XE#3414])
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.htm=
l
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@kms_rotation_crc@sprite-rotation-90.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][290] ([Intel XE#2426]) ->
> [FAIL][291] ([Intel XE#1729])
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-5/igt@=
kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][292] ([Intel XE#2509]) ->
> [SKIP][293] ([Intel XE#2426])
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with=
-chamelium.html
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-6/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][294] =
([Intel XE#362]) -> [SKIP][295]
> ([Intel XE#1500])
> =C2=A0=C2=A0 [294]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [295]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-464/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][296] =
([Intel XE#455]) -> [SKIP][297]
> ([Intel XE#4208] / [i915#2575]) +5 other tests skip
> =C2=A0=C2=A0 [296]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@kms_vrr@flipline.html
> =C2=A0=C2=A0 [297]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@kms_vrr@flipline.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][298] =
([Intel XE#4208]) ->
> [SKIP][299] ([Intel XE#1280] / [Intel XE#455])
> =C2=A0=C2=A0 [298]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
> =C2=A0=C2=A0 [299]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_compute_preempt@compute-preempt.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][300] =
([Intel XE#4208]) ->
> [SKIP][301] ([Intel XE#1126])
> =C2=A0=C2=A0 [300]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.htm=
l
> =C2=A0=C2=A0 [301]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_copy_basic@mem-set-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][302] =
([Intel XE#1126]) ->
> [SKIP][303] ([Intel XE#4208])
> =C2=A0=C2=A0 [302]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
> =C2=A0=C2=A0 [303]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_copy_basic@mem-set-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_eu_stall@blocking-re-enable:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][304] =
([Intel XE#4208]) ->
> [SKIP][305] ([Intel XE#5626])
> =C2=A0=C2=A0 [304]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html
> =C2=A0=C2=A0 [305]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_eu_stall@blocking-re-enable.html
>=20
> =C2=A0 * igt@xe_eu_stall@invalid-event-report-count:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][306] =
([Intel XE#5626]) ->
> [SKIP][307] ([Intel XE#4208])
> =C2=A0=C2=A0 [306]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.=
html
> =C2=A0=C2=A0 [307]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_eu_stall@invalid-event-report-count.html
>=20
> =C2=A0 * igt@xe_eudebug_online@interrupt-other-debuggable:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][308] =
([Intel XE#4837]) ->
> [SKIP][309] ([Intel XE#4208]) +8 other tests skip
> =C2=A0=C2=A0 [308]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_eudebug_online@interrupt-other-debug=
gable.html
> =C2=A0=C2=A0 [309]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_eudebug_online@interrupt-other-debuggable.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][310] =
([Intel XE#4208]) ->
> [SKIP][311] ([Intel XE#1392]) +1 other test skip
> =C2=A0=C2=A0 [310]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-defer-=
bind.html
> =C2=A0=C2=A0 [311]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-null-defer-bind.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][312] =
([Intel XE#288]) -> [SKIP][313]
> ([Intel XE#4208]) +14 other tests skip
> =C2=A0=C2=A0 [312]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-=
userptr-rebind-prefetch.html
> =C2=A0=C2=A0 [313]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][314] =
([Intel XE#4208]) ->
> [SKIP][315] ([Intel XE#288]) +9 other tests skip
> =C2=A0=C2=A0 [314]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invali=
date-race.html
> =C2=A0=C2=A0 [315]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_sip_eudebug@breakpoint-writesip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][316] =
([Intel XE#4208]) ->
> [SKIP][317] ([Intel XE#4837]) +6 other tests skip
> =C2=A0=C2=A0 [316]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip=
.html
> =C2=A0=C2=A0 [317]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_exec_sip_eudebug@breakpoint-writesip.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-n=
omemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][318] =
([Intel XE#4915]) ->
> [SKIP][319] ([Intel XE#4208]) +158 other tests skip
> =C2=A0=C2=A0 [318]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-l=
arge-execqueues-malloc-mlock-nomemset.html
> =C2=A0=C2=A0 [319]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomem=
set.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][320] =
([Intel XE#4208]) ->
> [SKIP][321] ([Intel XE#4915]) +110 other tests skip
> =C2=A0=C2=A0 [320]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared=
-vm-many-malloc-multi-fault.html
> =C2=A0=C2=A0 [321]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault.html
>=20
> =C2=A0 * igt@xe_huc_copy@huc_copy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][322] =
([Intel XE#4208]) ->
> [SKIP][323] ([Intel XE#255])
> =C2=A0=C2=A0 [322]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> =C2=A0=C2=A0 [323]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_huc_copy@huc_copy.html
>=20
> =C2=A0 * igt@xe_oa@buffer-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][324] =
([Intel XE#5103]) ->
> [SKIP][325] ([Intel XE#4208])
> =C2=A0=C2=A0 [324]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_oa@buffer-size.html
> =C2=A0=C2=A0 [325]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_oa@buffer-size.html
>=20
> =C2=A0 * igt@xe_oa@invalid-create-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][326] =
([Intel XE#3573]) ->
> [SKIP][327] ([Intel XE#4208]) +2 other tests skip
> =C2=A0=C2=A0 [326]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.h=
tml
> =C2=A0=C2=A0 [327]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_oa@invalid-create-userspace-config.html
>=20
> =C2=A0 * igt@xe_oa@missing-sample-flags:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][328] =
([Intel XE#4208]) ->
> [SKIP][329] ([Intel XE#3573]) +3 other tests skip
> =C2=A0=C2=A0 [328]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_oa@missing-sample-flags.html
> =C2=A0=C2=A0 [329]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_oa@missing-sample-flags.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-i2c:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][330] =
([Intel XE#4208]) ->
> [SKIP][331] ([Intel XE#5694])
> =C2=A0=C2=A0 [330]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_pm@d3cold-i2c.html
> =C2=A0=C2=A0 [331]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-432/ig=
t@xe_pm@d3cold-i2c.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][332] =
([Intel XE#4208]) ->
> [SKIP][333] ([Intel XE#2284] / [Intel XE#366])
> =C2=A0=C2=A0 [332]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> =C2=A0=C2=A0 [333]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_pm@d3cold-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][334] ([Intel XE#3876]) ->
> [ABORT][335] ([Intel XE#3970])
> =C2=A0=C2=A0 [334]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.h=
tml
> =C2=A0=C2=A0 [335]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-bmg-8/igt@=
xe_pmu@fn-engine-activity-sched-if-idle.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][336] =
([Intel XE#4650]) ->
> [SKIP][337] ([Intel XE#4208])
> =C2=A0=C2=A0 [336]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle=
.html
> =C2=A0=C2=A0 [337]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html
>=20
> =C2=A0 * igt@xe_pxp@display-pxp-fb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][338] =
([Intel XE#4208]) ->
> [SKIP][339] ([Intel XE#4733])
> =C2=A0=C2=A0 [338]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html
> =C2=A0=C2=A0 [339]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_pxp@display-pxp-fb.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-queue-post-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][340] =
([Intel XE#4733]) ->
> [SKIP][341] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [340]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_pxp@pxp-stale-queue-post-suspend.htm=
l
> =C2=A0=C2=A0 [341]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_pxp@pxp-stale-queue-post-suspend.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-hwconfig:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][342] =
([Intel XE#4208]) ->
> [SKIP][343] ([Intel XE#944])
> =C2=A0=C2=A0 [342]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html
> =C2=A0=C2=A0 [343]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_query@multigpu-query-hwconfig.html
>=20
> =C2=A0 * igt@xe_render_copy@render-stress-2-copies:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][344] =
([Intel XE#4814]) ->
> [SKIP][345] ([Intel XE#4208])
> =C2=A0=C2=A0 [344]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.h=
tml
> =C2=A0=C2=A0 [345]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_render_copy@render-stress-2-copies.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][346] =
([Intel XE#4208]) ->
> [SKIP][347] ([Intel XE#4130]) +1 other test skip
> =C2=A0=C2=A0 [346]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-r=
eprovision-reduce-numvfs.html
> =C2=A0=C2=A0 [347]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-436/ig=
t@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>=20
> =C2=A0 * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][348] =
([Intel XE#4351]) ->
> [SKIP][349] ([Intel XE#4208])
> =C2=A0=C2=A0 [348]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3630-12bdbc7687846f438afff8b=
fdc89873b3cd95945/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-r=
esets.html
> =C2=A0=C2=A0 [349]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/shard-dg2-434/ig=
t@xe_sriov_scheduling@nonpreempt-engine-resets.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1280]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1450]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#1948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
> =C2=A0 [Intel XE#2134]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> =C2=A0 [Intel XE#2142]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2509]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> =C2=A0 [Intel XE#255]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
> =C2=A0 [Intel XE#2568]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2833]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3442]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#3658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#379]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
> =C2=A0 [Intel XE#3876]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> =C2=A0 [Intel XE#3970]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
> =C2=A0 [Intel XE#4359]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
> =C2=A0 [Intel XE#4417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#4488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
> =C2=A0 [Intel XE#4504]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
> =C2=A0 [Intel XE#4518]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
> =C2=A0 [Intel XE#4522]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
> =C2=A0 [Intel XE#4650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4814]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#5020]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> =C2=A0 [Intel XE#5103]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
> =C2=A0 [Intel XE#5213]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> =C2=A0 [Intel XE#5244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
> =C2=A0 [Intel XE#5354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#5626]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> =C2=A0 [Intel XE#5694]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
> =C2=A0 [Intel XE#5786]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
> =C2=A0 [Intel XE#584]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
> =C2=A0 [Intel XE#5890]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#619]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
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
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
> =C2=A0 [Intel XE#911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [i915#2575]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-3630-12bdbc7687846f438afff8bfdc89873b3cd95945 -> xe-pw=
-
> 153634v1
>=20
> =C2=A0 IGT_8512: 8512
> =C2=A0 xe-3630-12bdbc7687846f438afff8bfdc89873b3cd95945:
> 12bdbc7687846f438afff8bfdc89873b3cd95945
> =C2=A0 xe-pw-153634v1: 153634v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153634v1/index.html

