Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D93CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 07:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE40710EB34;
	Fri, 17 Oct 2025 07:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7QH9uZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174A10EB34
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760686683; x=1792222683;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=WqoQaHNEBtYOTDdF7gkWNNGIMy/ZWXxwVWbqflz4HEA=;
 b=d7QH9uZEVLII96AKeKotJxyynKWu9iI8O1+OgZfM3dwkT8GqNdPDoNC0
 LdDJ9wswwI18heXRLoKa3gUTSo9fiLYoLdqvd0LdS4Fbvs/A+JVHa7pL4
 m0LtCYbIX6aQ0Aq3sHrbzXrKStYNWhTgUDNsrumEB32++QRG7mmKZZL/T
 wgeByBl+3uQZEft4yN9I/vGlD7hoFC5OROcZVhPYwNLjVz0QMcvF414RX
 KgHgoMSfwHVzDUIFxPO759EAr3XSj9XGiIteYv+dd86uv0vvHB4UVfLXR
 s6+uIiUOFhc67DTcbkoxgzovow1Mv18c10r7pDMP7M+VPkxNnkQa0TCe6 g==;
X-CSE-ConnectionGUID: Q/B4cI4ZRLqvACctquS/ww==
X-CSE-MsgGUID: lTVzG2kpSLmpYF0D0yOjNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50459711"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="50459711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:38:02 -0700
X-CSE-ConnectionGUID: 7lEWptjYQGOaBT7lvLYzTw==
X-CSE-MsgGUID: jH7YtawgRumccMO3yTTxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187757850"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.90])
 ([10.245.244.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:38:01 -0700
Message-ID: <484617fdb6216c6690c1134deeefd9200b80a767.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/gpusvm,
 drm/xe: Allow mixed mappings for userptr
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 09:37:29 +0200
In-Reply-To: <176060612818.21516.6126428291699808441@97596180aaec>
References: <20251015120320.176338-1-thomas.hellstrom@linux.intel.com>
 <176060612818.21516.6126428291699808441@97596180aaec>
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

On Thu, 2025-10-16 at 09:15 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/gpusvm, drm/xe: Allow mixed mappings for userptr
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/155987/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3927-
> 69ca30df000b382e7657f300148be505083377f2_FULL -> xe-pw-155987v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-155987v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-155987v1_FULL, please notify your bug team
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
> pw-155987v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [INCOMPLETE][1]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_fbcon_fbt@fbc-suspend.html

Not related.

>=20
> =C2=A0 * igt@xe_pm@s3-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][2] ->=
 [INCOMPLETE][3]
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-466/ig=
t@xe_pm@s3-vm-bind-prefetch.html

Not related and fails also elsewhere.

>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * {igt@xe_sriov_vram@vf-access-after-resize-up}:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][4]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_sriov_vram@vf-access-after-resize-up.html
>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-155987v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-write:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][5] ([Intel XE#1125] /
> [Intel XE#5574])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@intel_hwmon@hwmon-write.html
>=20
> =C2=A0 *
> igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pip
> e-d-hdmi-a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][6] ([Intel XE#4543])
> +7 other tests dmesg-warn
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-=
a-1-y.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#607])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#610])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_big_fb@4-tiled-addfb-size-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#1124]) +16
> other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#2327]) +2
> other tests skip
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-7/igt@=
kms_big_fb@linear-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#316]) +5
> other tests skip
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4
> other tests skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][13] ([Intel
> XE#4543]) +9 other tests dmesg-fail
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#1124])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#2191])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#2191])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-433/ig=
t@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_bw@linear-tiling-1-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][19] ([Intel XE#367])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-434/ig=
t@kms_bw@linear-tiling-1-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#367])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-3/igt@=
kms_bw@linear-tiling-3-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#367]) +3
> other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_bw@linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#2887]) +8
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][23] ([Intel XE#787]) +27
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-
> d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#455] /
> [Intel XE#787]) +45 other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.htm=
l
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#2652] /
> [Intel XE#787]) +3 other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#2887]) +4
> other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#3432])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#787]) +68
> other tests skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#2907]) +4
> other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#455] /
> [Intel XE#787]) +7 other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#4417] /
> [Intel XE#455])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_cdclk@mode-transition.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#2724])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-7/igt@=
kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#4417]) +2
> other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#4417]) +3
> other tests skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
kms_cdclk@mode-transition@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_chamelium_audio@dp-audio:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
kms_chamelium_audio@dp-audio.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-25:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#306]) +1
> other test skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_chamelium_color@ctm-0-25.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-green-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#2325])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-7/igt@=
kms_chamelium_color@ctm-green-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][38] ([Intel XE#306])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-432/ig=
t@kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#373]) +13
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][40] ([Intel XE#373]) +1
> other test skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#2252]) +7
> other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_chamelium_hpd@dp-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_content_protection@content-type-change:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#2341])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_content_protection@content-type-change.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][43] ([Intel XE#307])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-436/ig=
t@kms_content_protection@dp-mst-lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#455]) +21
> other tests skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_content_protection@legacy.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_content_protection@legacy.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][46] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_content_protection@legacy.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#3278]) +1
> other test skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][48] ([Intel XE#1188]) +1
> other test fail
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-5/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][49] ([Intel XE#308]) +1
> other test skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-434/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#2321]) +1
> other test skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
kms_cursor_crc@cursor-offscreen-512x170.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#2321])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-1/igt@=
kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#308]) +3
> other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_cursor_crc@cursor-random-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#2320]) +3
> other tests skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-5/igt@=
kms_cursor_crc@cursor-rapid-movement-32x10.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#1424])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-4/igt@=
kms_cursor_crc@cursor-rapid-movement-32x10.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-max-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][55] ([Intel XE#455]) +6
> other tests skip
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-466/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][56] -> [SKIP][57] ([Intel XE#2291])
> +3 other tests skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy=
.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_cursor_legacy@cursora-vs-flipb-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#309])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
kms_cursor_legacy@cursora-vs-flipb-toggle.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][59] -> [FAIL][60] ([Intel XE#1475])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-t=
ransitions.html
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-va=
rying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#2286])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-=
size.html
>=20
> =C2=A0 * igt@kms_dp_link_training@non-uhbr-sst:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#4354])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_dp_link_training@non-uhbr-sst.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#4354])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
kms_dp_link_training@non-uhbr-sst.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-sst:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#4356])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@kms_dp_link_training@uhbr-sst.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][65] -> [SKIP][66] ([Intel XE#4294])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.htm=
l
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-formats:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#2244])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-4/igt@=
kms_dsc@dsc-with-formats.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#5425]) +1
> other test skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_fbcon_fbt@fbc-suspend.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#776])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_fbcon_fbt@psr-suspend.html
>=20
> =C2=A0 * igt@kms_feature_discovery@chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#701])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_feature_discovery@chamelium.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-4x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#1138])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_feature_discovery@display-4x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#1135]) +1
> other test skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_flip@2x-modeset-vs-vblank-race:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#2316])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_flip@2x-modeset-vs-vblank-race.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][74] -> [SKIP][75] ([Intel XE#2316])
> +3 other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_flip@2x-nonexisting-fb.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#310]) +7
> other tests skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_flip@2x-nonexisting-fb-interruptible.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#1421]) +1
> other test skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
kms_flip@2x-nonexisting-fb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [TIMEOUT][78] ([Intel XE#4543])
> +1 other test timeout
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][79] -> [DMESG-WARN][80] ([Intel
> XE#4543]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b=
-hdmi-a1.html
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsca=
ling
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#1401] /
> [Intel XE#1745]) +1 other test skip
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.h=
tml
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsca=
ling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#1401]) +1
> other test skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@p=
ipe-a-default-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#2293] /
> [Intel XE#2380])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#2293])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][85] ([Intel XE#4543]
> / [Intel XE#4921]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-val=
id-mode.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#651]) +18
> other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#2311]) +9
> other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#656]) +64
> other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#651]) +3
> other tests skip
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
kms_frontbuffer_tracking@drrs-slowdraw.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#5390]) +9
> other tests skip
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#2312]) +4
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][92] ([Intel XE#651]) +7
> other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#653]) +17
> other tests skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][94] ([Intel XE#653]) +12
> other tests skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#5672])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@pipe-fbc-rte.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#2313]) +15
> other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-7/igt@=
kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#656]) +9
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1503])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#2925])
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_joiner@basic-force-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@basic-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#2927])
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_joiner@basic-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][101] ([Intel XE#4596])
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_plane_multiple@2x-tiling-none.html
>=20
> =C2=A0 * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#309]) +6
> other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_plane_scaling@2x-scaler-multi-pipe.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-
> a:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#2763]) +3
> other tests skip
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-3/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-
> b:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][104] ([Intel XE#2763]) +4
> other tests skip
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
>=20
> =C2=A0 * igt@kms_pm_backlight@basic-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][105] ([Intel XE#870])
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@kms_pm_backlight@basic-brightness.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-vpb-simulation:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#1122])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_pm_dc@dc3co-vpb-simulation.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][107] ([Intel XE#718])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
kms_pm_dc@dc5-dpms.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-retention-flops:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][108] ([Intel XE#3309])
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_pm_dc@dc5-retention-flops.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][109] ([Intel XE#734])
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][110] ([Intel XE#836]) +1
> other test skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@kms_pm_rpm@dpms-non-lpsp.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][111] ([Intel XE#1439] /
> [Intel XE#3141]) +1 other test skip
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
kms_pm_rpm@dpms-non-lpsp.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#1406] /
> [Intel XE#2893]) +1 other test skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#1406] /
> [Intel XE#1489]) +7 other tests skip
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][114] ([Intel XE#1406] /
> [Intel XE#1489])
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][115] ([Intel XE#1406] /
> [Intel XE#1489]) +1 other test skip
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#1122] /
> [Intel XE#1406] / [Intel XE#5580])
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@kms_psr2_su@page_flip-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-sprite-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#1406])
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-3/igt@=
kms_psr@fbc-pr-sprite-render.html
>=20
> =C2=A0 * igt@kms_psr@psr-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929]) +20 other tests skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@kms_psr@psr-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#1406] /
> [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_psr@psr-basic.html
>=20
> =C2=A0 * igt@kms_psr@psr-sprite-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][120] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@kms_psr@psr-sprite-blt.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#3414] /
> [Intel XE#3904]) +1 other test skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][124] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][125] -> [SKIP][126] ([Intel
> XE#1435])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.htm=
l
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][127] ([Intel XE#2426])
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#330])
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][129] -> [FAIL][130] ([Intel
> XE#5937])
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-n=
umvfs-all.html
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-1/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>=20
> =C2=A0 * igt@xe_ccs@ctrl-surf-copy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][131] ([Intel XE#455] /
> [Intel XE#488] / [Intel XE#5607])
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_ccs@ctrl-surf-copy.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#6360])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@xe_compute_preempt@compute-preempt-many.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#1123]) +1
> other test skip
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_copy_basic@mem-copy-linear-0x369.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][134] ([Intel XE#1126]) +2
> other tests skip
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@xe_copy_basic@mem-set-linear-0x369.html
>=20
> =C2=A0 * igt@xe_eu_stall@blocking-read:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#5626]) +2
> other tests skip
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_eu_stall@blocking-read.html
>=20
> =C2=A0 * igt@xe_eudebug@vma-ufence-faultable:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][136] ([Intel XE#4837]) +4
> other tests skip
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-433/ig=
t@xe_eudebug@vma-ufence-faultable.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step-one:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#4837] /
> [Intel XE#5565]) +21 other tests skip
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_eudebug_online@single-step-one.html
>=20
> =C2=A0 * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][138] ([Intel XE#4837]) +2
> other tests skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
>=20
> =C2=A0 * igt@xe_eudebug_sriov@deny-eudebug:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][139] ([Intel XE#5793])
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-1/igt@=
xe_eudebug_sriov@deny-eudebug.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#261] /
> [Intel XE#5564])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_evict@evict-beng-large-multi-vm.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#261]) +5
> other tests skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_evict@evict-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-external-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][142] ([Intel XE#261] /
> [Intel XE#5564] / [Intel XE#688]) +1 other test skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@xe_evict@evict-small-external-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][143] ([Intel XE#688]) +3
> other tests skip
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
xe_evict@evict-threads-large-multi-vm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#261] /
> [Intel XE#688]) +4 other tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_evict@evict-threads-small.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#1392])
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-4/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][146] ([Intel XE#2322]) +4
> other tests skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][147] =
-> [SKIP][148] ([Intel
> XE#1392])
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer=
-mmap.html
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-466/ig=
t@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][149] ([Intel XE#1392] /
> [Intel XE#5575]) +10 other tests skip
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][150] ([Intel XE#288]) +8
> other tests skip
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-435/ig=
t@xe_exec_fault_mode@many-basic.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-r=
ace-imm
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][151] ([Intel XE#288] /
> [Intel XE#5561]) +34 other tests skip
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-i=
mm.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][152] ([Intel XE#2360]) +1
> other test skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>=20
> =C2=A0 * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][153] ([Intel XE#4837]) +3
> other tests skip
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
xe_exec_sip_eudebug@breakpoint-writesip-twice.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][154] ([Intel XE#4943]) +7
> other tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
xe_exec_system_allocator@many-stride-mmap-huge-nomemset.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@process-many-execqueues-free:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#4915])
> +373 other tests skip
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_exec_system_allocator@process-many-execqueues-free.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunm=
ap-eocheck
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][156] ([Intel XE#4915]) +70
> other tests skip
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-432/ig=
t@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-e=
ocheck.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][157] ([Intel XE#4943]) +13
> other tests skip
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][158] =
-> [DMESG-WARN][159] ([Intel
> XE#5893])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_mmio_send_recv.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-466/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][160] ([Intel XE#3099]) +2
> other tests fail
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>=20
> =C2=A0 * igt@xe_mmap@pci-membarrier-bad-object:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#5100]) +1
> other test skip
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_mmap@pci-membarrier-bad-object.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][162] ([Intel XE#5100])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
xe_mmap@pci-membarrier-bad-object.html
>=20
> =C2=A0 * igt@xe_mmap@small-bar:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][163] ([Intel XE#512])
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_mmap@small-bar.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#586])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-1/igt@=
xe_mmap@small-bar.html
>=20
> =C2=A0 * igt@xe_module_load@force-load:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][165] ([Intel XE#2457])
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
xe_module_load@force-load.html
>=20
> =C2=A0 * igt@xe_oa@privileged-forked-access-vaddr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][166] ([Intel XE#3573]) +11
> other tests skip
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_oa@privileged-forked-access-vaddr.html
>=20
> =C2=A0 * igt@xe_oa@whitelisted-registers-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][167] ([Intel XE#3573]) +3
> other tests skip
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-435/ig=
t@xe_oa@whitelisted-registers-userspace-config.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xe2:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][168] ([Intel XE#977])
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_pat@pat-index-xe2.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][169] ([Intel XE#979])
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][170] ([Intel XE#2284] /
> [Intel XE#366])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_pm@d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-i2c:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][171] ([Intel XE#5742])
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@xe_pm@d3hot-i2c.html
>=20
> =C2=A0 * igt@xe_pm@s4-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][172] =
-> [FAIL][173] ([Intel
> XE#6339])
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-436/ig=
t@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][174] -> [FAIL][175] ([Intel
> XE#6339])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-1/igt@=
xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][176] -> [FAIL][177] ([Intel
> XE#6339])
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-2/igt=
@xe_pm@s4-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][178] ([Intel XE#6339])
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-3/igt@=
xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][179] ([Intel XE#5611] /
> [Intel XE#579])
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_pm@vram-d3cold-threshold.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][180] ([Intel XE#579])
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-4/igt@=
xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][181] ([Intel XE#4733])
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-464/ig=
t@xe_pxp@pxp-stale-bo-exec-post-suspend.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][182] ([Intel XE#4733] /
> [Intel XE#5594]) +2 other tests skip
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_pxp@pxp-termination-key-update-post-termination-irq.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-extension:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][183] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-4/igt@=
xe_query@multigpu-query-invalid-extension.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][184] ([Intel XE#944]) +1
> other test skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
xe_query@multigpu-query-invalid-size.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][185] ([Intel XE#944]) +3
> other tests skip
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-9/igt=
@xe_query@multigpu-query-invalid-size.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][186] ([Intel XE#944])
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@xe_query@multigpu-query-invalid-size.html
>=20
> =C2=A0 * igt@xe_render_copy@render-stress-1-copies:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][187] ([Intel XE#4814])
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-435/ig=
t@xe_render_copy@render-stress-1-copies.html
>=20
> =C2=A0 * igt@xe_sriov_scheduling@equal-throughput:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][188] ([Intel
> XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-
> fail
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_sriov_scheduling@equal-throughput.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 *
> igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pi
> pe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][189] ([Intel XE#6054]) ->
> [PASS][190] +3 other tests pass
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip=
-events-linear-atomic@pipe-c-edp-1.html
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-2/igt@=
kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1=
.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][191] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][192]
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][193] ([Intel XE#2291]) ->
> [PASS][194] +1 other test pass
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-=
legacy.html
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][195] ([Intel XE#5299]) ->
> [PASS][196]
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.h=
tml
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_cursor_legacy@flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][197] ([Intel XE#2316]) ->
> [PASS][198] +4 other tests pass
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-8/igt@=
kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][199] ([Intel XE#301]) -> [PASS][200]
> +1 other test pass
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-5/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][201] ([Intel XE#4543] / [Intel
> XE#5208]) -> [PASS][202]
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_flip@flip-vs-rmfb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][203] ([Intel XE#4543]) ->
> [PASS][204] +4 other tests pass
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hd=
mi-a1.html
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-6/igt=
@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][205] =
([Intel XE#455]) -> [PASS][206]
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][207] ([Intel XE#4596]) ->
> [PASS][208]
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_plane_multiple@2x-tiling-none.html
>=20
> =C2=A0 * igt@kms_setmode@basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][209] ([Intel XE#6361]) ->
> [PASS][210] +6 other tests pass
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-3/igt@kms_setmode@basic.html
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-1/igt@=
kms_setmode@basic.html
>=20
> =C2=A0 * igt@kms_setmode@basic@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][211] ([i915#15106]) -> [PASS][212]
> +2 other tests pass
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-7/igt@=
kms_setmode@basic@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@xe_exec_capture@reset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][213] =
([Intel XE#6367]) ->
> [PASS][214]
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-435/igt@xe_exec_capture@reset.html
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-432/ig=
t@xe_exec_capture@reset.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [ABORT][215]=
 -> [PASS][216]
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-fd-us=
erptr-invalidate.html
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-435/ig=
t@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][217] ([Intel XE#6339]) ->
> [PASS][218] +1 other test pass
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-1/igt=
@xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][219] ([Intel XE#6339]) ->
> [PASS][220] +3 other tests pass
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][221] ([Intel XE#4543]) ->
> [DMESG-WARN][222] ([Intel XE#2953] / [Intel XE#4173] / [Intel
> XE#4543])
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.h=
tml
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][223] ([Intel XE#4543]) ->
> [DMESG-WARN][224] ([Intel XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c=
-hdmi-a1.html
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][225] ([Intel XE#5390]) ->
> [SKIP][226] ([Intel XE#2312]) +3 other tests skip
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][227] ([Intel XE#2312]) ->
> [SKIP][228] ([Intel XE#5390]) +4 other tests skip
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][229] ([Intel XE#2312]) ->
> [SKIP][230] ([Intel XE#2311]) +5 other tests skip
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prims=
crn-cur-indfb-move.html
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][231] ([Intel XE#2311]) ->
> [SKIP][232] ([Intel XE#2312]) +4 other tests skip
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnds=
crn-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][233] ([Intel XE#2313]) ->
> [SKIP][234] ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-pri-indfb-draw-render.html
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][235] ([Intel XE#2312]) ->
> [SKIP][236] ([Intel XE#2313]) +5 other tests skip
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][237] =
([Intel XE#1729]) ->
> [SKIP][238] ([Intel XE#362])
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@xe_pm@s4-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][239] -> [FAIL][240] ([Intel
> XE#6339])
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3927-69ca30df000b382e7657f30=
0148be505083377f2/shard-lnl-8/igt@xe_pm@s4-mocs.html
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/shard-lnl-8/igt@=
xe_pm@s4-mocs.html
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
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1125]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1138]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
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
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1475]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2457]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2724]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
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
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2925]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
> =C2=A0 [Intel XE#2927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3099]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3278]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
> =C2=A0 [Intel XE#330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> =C2=A0 [Intel XE#3309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
> =C2=A0 [Intel XE#4417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4814]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4921]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#5007]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
> =C2=A0 [Intel XE#5100]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
> =C2=A0 [Intel XE#512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
> =C2=A0 [Intel XE#5191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
> =C2=A0 [Intel XE#5208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
> =C2=A0 [Intel XE#5213]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> =C2=A0 [Intel XE#5299]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
> =C2=A0 [Intel XE#5300]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#5425]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
> =C2=A0 [Intel XE#5545]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
> =C2=A0 [Intel XE#5561]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
> =C2=A0 [Intel XE#5564]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
> =C2=A0 [Intel XE#5565]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
> =C2=A0 [Intel XE#5574]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
> =C2=A0 [Intel XE#5575]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> =C2=A0 [Intel XE#5580]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
> =C2=A0 [Intel XE#5594]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
> =C2=A0 [Intel XE#5607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
> =C2=A0 [Intel XE#5611]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
> =C2=A0 [Intel XE#5624]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
> =C2=A0 [Intel XE#5626]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> =C2=A0 [Intel XE#5672]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
> =C2=A0 [Intel XE#5742]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
> =C2=A0 [Intel XE#5786]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#5793]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
> =C2=A0 [Intel XE#586]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
> =C2=A0 [Intel XE#5893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
> =C2=A0 [Intel XE#5937]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
> =C2=A0 [Intel XE#6054]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#610]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> =C2=A0 [Intel XE#6259]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
> =C2=A0 [Intel XE#6312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
> =C2=A0 [Intel XE#6313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
> =C2=A0 [Intel XE#6339]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339
> =C2=A0 [Intel XE#6360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
> =C2=A0 [Intel XE#6361]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
> =C2=A0 [Intel XE#6367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6367
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#977]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> =C2=A0 [i915#15106]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_8586 -> IGT_8587
> =C2=A0 * Linux: xe-3927-69ca30df000b382e7657f300148be505083377f2 -> xe-pw=
-
> 155987v1
>=20
> =C2=A0 IGT_8586: dbda1336c5c99d0faa88397d5c312be72301cd94 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 IGT_8587: 8587
> =C2=A0 xe-3927-69ca30df000b382e7657f300148be505083377f2:
> 69ca30df000b382e7657f300148be505083377f2
> =C2=A0 xe-pw-155987v1: 155987v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155987v1/index.html

