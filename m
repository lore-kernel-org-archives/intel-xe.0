Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4CAC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006010E034;
	Tue, 24 Jun 2025 09:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJ48wOZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD4E10E034
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750758849; x=1782294849;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zdFYc3PvCm3IynLjqjREmcXwF+gYcERFq+rTZESWkXI=;
 b=bJ48wOZ/AB73nT9uLpRvmQCtgLvNFUzGg8FpaoGK+bQSjVtqGvtSa4Av
 W6Q9lEmpBM+BGSinNTPB47DnEoeMWf3X3CyZOn6iIDLL79GtPJBJ1n6Xk
 5Ra3rZPrAl/FOer94S1ouLdTiLnwVdxk2VuAhaia4EirmPuEyIjBLATWh
 RinE+J9Jr0fyjOv1BcTPYbtMSysc/c+xx92gIWpBsljO4851zw5uL7sKN
 XSbuutP1OWvUmkXR8F0bjvYV8p7+cG1bSWAv3hPHJby1uuxTjQ5Io1+na
 6JBrBxaq8i5yZVdtwnZjrc2QeVchH0YikiSQc+3uMkr5bn+m+a8+JxdT7 Q==;
X-CSE-ConnectionGUID: 8SnYcn7QRCyX3z4xFQsJqA==
X-CSE-MsgGUID: M7K0L0UySauRwKNksfuOtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63255536"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="63255536"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:54:09 -0700
X-CSE-ConnectionGUID: 2FsNY7gES3GtCsot0icvNw==
X-CSE-MsgGUID: gNrXJ1cCSfuvwlVSiVQ6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151353682"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:54:08 -0700
Message-ID: <e9860d530ea828696310e112b99e7258870065f8.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/ttm, drm/xe:
 Consolidate the Buffer Object LRU walks (rev3)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 11:54:05 +0200
In-Reply-To: <175075664761.103805.9203563532414318769@1538d3639d33>
References: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
 <175075664761.103805.9203563532414318769@1538d3639d33>
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

On Tue, 2025-06-24 at 09:17 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/ttm, drm/xe: Consolidate the Buffer Object LRU walks
> (rev3)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/150242/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3295-
> c86140bb02edc8e529f095ebf15e8d466fa15738_FULL -> xe-pw-150242v3_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-150242v3_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-150242v3_FULL, please notify your bug team
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
> pw-150242v3_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [INCOMPLETE][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-0.html


This failure is not related.
/Thomas


>=20
> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-3295-
> c86140bb02edc8e529f095ebf15e8d466fa15738_FULL and xe-pw-
> 150242v3_FULL:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [1.88] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-150242v3_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][3] -> [DMESG-WARN][4] ([Intel
> XE#4543]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resum=
e.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_async_flips@async-flip-suspend-resume.html
>=20
> =C2=A0 *
> igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pip
> e-a-hdmi-a-6-4-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][5] ([Intel XE#3767]) +15
> other tests skip
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi=
-a-6-4-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][6] ([Intel XE#3768])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-434/ig=
t@kms_async_flips@invalid-async-flip-atomic.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#1124]) +3
> other tests skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#2327])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_big_fb@linear-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][9] -> [SKIP][10] ([Intel XE#4947])
> +2 other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_big_fb@x-tiled-8bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][11] ([Intel XE#316]) +1
> other test skip
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-434/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1407])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
kms_big_fb@x-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#316])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@kms_big_fb@y-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][15] ([Intel XE#607])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1124]) +3
> other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2
> other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#2191])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-3/igt@=
kms_bw@linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#367])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_bw@linear-tiling-3-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][21] ([Intel XE#367])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_bw@linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#455] /
> [Intel XE#787]) +13 other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a=
-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#787]) +20
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#787]) +146
> other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#2887]) +6
> other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#2887]) +4
> other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#3432])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#3432])
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#2907])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#2907]) +1
> other test skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][31] ([Intel XE#455] /
> [Intel XE#787]) +23 other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][32] -=
> [INCOMPLETE][33] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) +1
> other test incomplete
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs@pipe-b-hdmi-a-6.html
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][34] ([Intel XE#1727]
> / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel
> XE#4522])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#2652] /
> [Intel XE#787]) +11 other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][36] ([Intel XE#4416]) +3
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-negative:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][37] ([Intel XE#306])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_chamelium_color@ctm-negative.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
kms_chamelium_edid@dp-edid-change-during-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#2252]) +2
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][40] ([Intel XE#373]) +2
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#373])
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][42] ([Intel XE#1178]) +2
> other tests fail
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][43] ([Intel XE#307])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_content_protection@dp-mst-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#307])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-7/igt@=
kms_content_protection@dp-mst-type-1.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][45] ([Intel XE#455]) +5
> other tests skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-434/ig=
t@kms_content_protection@lic-type-1.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][46] ([Intel XE#1424])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2320])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#2321])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
kms_cursor_crc@cursor-sliding-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#2321]) +1
> other test skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][50] -> [SKIP][51] ([Intel XE#2291])
> +6 other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#309]) +1
> other test skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-3/igt@=
kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-va=
rying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#323])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-=
size.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#2286])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-=
size.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#1508])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dp_aux_dev:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][56] -> [SKIP][57] ([Intel XE#3009])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-8/igt@kms_dp_aux_dev.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_dp_aux_dev.html
>=20
> =C2=A0 * igt@kms_dp_link_training@non-uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#4354])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@kms_dp_link_training@non-uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#4354])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
kms_dp_link_training@uhbr-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#4354])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_dp_link_training@uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#2244])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_dsc@dsc-fractional-bpp.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#2244])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-1/igt@=
kms_dsc@dsc-fractional-bpp-with-bpc.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][63] -> [DMESG-WARN][64] ([Intel
> XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_fbcon_fbt@fbc-suspend.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-3x:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#703])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
kms_feature_discovery@display-3x.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#2373])
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_feature_discovery@display-3x.html
>=20
> =C2=A0 * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#1421]) +2
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_flip@2x-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][68] -=
> [FAIL][69] ([Intel XE#301])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-h=
dmi-a6-dp4.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2316])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_flip@2x-flip-vs-panning-vs-hang.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#310]) +2
> other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@kms_flip@2x-flip-vs-panning-vs-hang.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][72] -> [SKIP][73] ([Intel XE#2316])
> +6 other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interr=
uptible.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][74] ([Intel XE#2882]) +1
> other test fail
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#1397] /
> [Intel XE#1745])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#1397])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-de=
fault-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][77] ([Intel XE#4683]) +1
> other test fail
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#1401] /
> [Intel XE#1745])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.htm=
l
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#1401])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pip=
e-a-default-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][80] -> [DMESG-FAIL][81] ([Intel
> XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytile-downscaling.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> @pipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#455]) +7
> other tests skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pi=
pe-a-valid-mode.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#651]) +5
> other tests skip
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#2311]) +8
> other tests skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][85] ([Intel XE#651]) +12
> other tests skip
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@drrs-suspend.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#4141]) +3
> other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][87] ([Intel
> XE#4543]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#656]) +13
> other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-8/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][89] -> [DMESG-FAIL][90] ([Intel
> XE#4543]) +9 other tests dmesg-fail
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scale=
dprimary.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#651]) +4
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#2312]) +4
> other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#653]) +5
> other tests skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#2313]) +5
> other tests skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][95] ([Intel XE#653]) +11
> other tests skip
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#656]) +8
> other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-metadata-sizes:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#1503]) +2
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-8/igt@=
kms_hdr@invalid-metadata-sizes.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1503])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_joiner@basic-max-non-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#4298])
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_joiner@basic-max-non-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][100] -> [SKIP][101] ([Intel
> XE#3012]) +1 other test skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-join=
er.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_joiner@invalid-modeset-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#2501])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_multipipe_modeset@basic-max-pipe-crc-check.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#356])
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][104] =
-> [FAIL][105] ([Intel XE#616])
> +1 other test fail
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-=
6-size-64.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#4596]) +1
> other test skip
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_plane_multiple@2x-tiling-yf.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#4596]) +1
> other test skip
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-7/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0 * igt@kms_plane_multiple@tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][108] ([Intel XE#5020])
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_plane_multiple@tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][109] -> [SKIP][110] ([Intel
> XE#4950]) +9 other tests skip
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-sca=
ling-with-rotation.html
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][111] ([Intel XE#2763]) +35
> other tests skip
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#2763]) +29
> other tests skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][113] ([Intel XE#870])
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_pm_backlight@fade.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][114] -> [FAIL][115] ([Intel XE#718])
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#1439] /
> [Intel XE#836])
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-3/igt@=
kms_pm_rpm@dpms-mode-unset-lpsp.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#2893])
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-
> b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#4608]) +4
> other tests skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.ht=
ml
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#2893] /
> [Intel XE#4608]) +1 other test skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][120] ([Intel XE#1489]) +2
> other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#1489])
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#1489]) +1
> other test skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-nv12:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#1122])
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@kms_psr2_su@page_flip-nv12.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-cursor-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#1406]) +4
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-3/igt@=
kms_psr@fbc-pr-cursor-plane-move.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-sprite-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#2234] /
> [Intel XE#2850]) +4 other tests skip
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_psr@fbc-psr2-sprite-render.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-suspend@edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#4609]) +1
> other test skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-8/igt@=
kms_psr@fbc-psr2-suspend@edp-1.html
>=20
> =C2=A0 * igt@kms_psr@psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][127] ([Intel XE#2850] /
> [Intel XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_psr@psr2-basic.html
>=20
> =C2=A0 * igt@kms_psr@psr2-primary-page-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#2850] /
> [Intel XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@kms_psr@psr2-primary-page-flip.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#2939])
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_rotation_crc@primary-rotation-270.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][131] ([Intel XE#3414])
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][132] -> [FAIL][133] ([Intel
> XE#4459]) +1 other test fail
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-6/igt@=
kms_vrr@cmrr@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
> drm_xe_engine_class_compute:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][134] ([Intel XE#1280] /
> [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class=
_compute.html
>=20
> =C2=A0 * igt@xe_eu_stall@invalid-sampling-rate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#5308])
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_eu_stall@invalid-sampling-rate.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][136] ([Intel XE#5308])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@xe_eu_stall@invalid-sampling-rate.html
>=20
> =C2=A0 * igt@xe_eudebug@discovery-empty-clients:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#4837]) +4
> other tests skip
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-4/igt@=
xe_eudebug@discovery-empty-clients.html
>=20
> =C2=A0 * igt@xe_eudebug@multiple-sessions:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][138] ([Intel XE#4837]) +4
> other tests skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@xe_eudebug@multiple-sessions.html
>=20
> =C2=A0 * igt@xe_eudebug@read-metadata:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][139] ([Intel XE#4837]) +1
> other test skip
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_eudebug@read-metadata.html
>=20
> =C2=A0 * igt@xe_eudebug_online@stopped-thread:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#4837]) +4
> other tests skip
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
xe_eudebug_online@stopped-thread.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-cm:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#688])
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-1/igt@=
xe_evict@evict-beng-large-cm.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-simple:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][142] ([Intel XE#688])
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_evict_ccs@evict-overcommit-simple.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
invalida
> te:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][143] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inval=
idate.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#2322]) +4
> other tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#1392]) +4
> other tests skip
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-bindexecqueue:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][146] =
-> [SKIP][147] ([Intel
> XE#1392]) +6 other tests skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecque=
ue.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-bindexecqueue.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][148] ([Intel XE#288]) +7
> other tests skip
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_exec_fault_mode@many-execqueues-invalid-fault.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][149] ([Intel XE#288]) +4
> other tests skip
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap-eocheck
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][150] ([Intel XE#4915]) +81
> other tests skip
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap-eocheck.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-re=
ad-after
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][151] ([Intel XE#4915]) +71
> other tests skip
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read-af=
ter.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap=
-free-huge
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][152] ([Intel XE#4943]) +8
> other tests skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-3/igt@=
xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-=
huge.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-n=
omemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][153] ([Intel XE#4943]) +11
> other tests skip
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemse=
t.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-bal-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][154] -> [SKIP][155] ([Intel
> XE#4945]) +9 other tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_exec_threads@threads-bal-rebind.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_dma_buf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][156] -> [FAIL][157] ([Intel
> XE#3099]) +1 other test fail
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_live_ktest@xe_dma_buf.html
>=20
> =C2=A0 * igt@xe_oa@privileged-forked-access-vaddr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][158] ([Intel XE#2541] /
> [Intel XE#3573]) +2 other tests skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@xe_oa@privileged-forked-access-vaddr.html
>=20
> =C2=A0 * igt@xe_oa@syncs-userptr-wait-cfg:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][159] ([Intel XE#2541] /
> [Intel XE#3573] / [Intel XE#4501])
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@xe_oa@syncs-userptr-wait-cfg.html
>=20
> =C2=A0 * igt@xe_oa@unprivileged-single-ctx-counters:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][160] ([Intel XE#2541] /
> [Intel XE#3573])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@xe_oa@unprivileged-single-ctx-counters.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xehpc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#1420] /
> [Intel XE#2838])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
xe_pat@pat-index-xehpc.html
>=20
> =C2=A0 * igt@xe_pmu@fn-engine-activity-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][162] ([Intel XE#4650])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@xe_pmu@fn-engine-activity-load.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][163] ([Intel XE#4733]) +1
> other test skip
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-cs-cycles:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#944])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-5/igt@=
xe_query@multigpu-query-cs-cycles.html
>=20
> =C2=A0 * igt@xe_sriov_auto_provisioning@fair-allocation:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][165] ([Intel XE#4130]) +1
> other test skip
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-2/igt@=
xe_sriov_auto_provisioning@fair-allocation.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][166] ([Intel XE#4130])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
xe_sriov_auto_provisioning@fair-allocation.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][167] ([Intel XE#4130])
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@xe_sriov_auto_provisioning@fair-allocation.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-each-isolation:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][168] ([Intel XE#3342])
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-3/igt@=
xe_sriov_flr@flr-each-isolation.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][169] ([Intel XE#3342])
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-3/igt@=
xe_sriov_flr@flr-each-isolation.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_addfb_basic@unused-offsets:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([i915#6077]) -> [PASS][171]
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_addfb_basic@unused-offsets.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_addfb_basic@unused-offsets.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][172] ([Intel XE#3908]) ->
> [PASS][173] +1 other test pass
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-=
transition-fencing.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][174] ([Intel XE#4543]) ->
> [PASS][175] +11 other tests pass
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][176] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][177] +1 other test pass
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-1/igt@=
kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[178] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][179] +1 other
> test pass
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[180] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124]) -> [PASS][181]
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-64x64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][182] =
-> [PASS][183] +13 other tests
> pass
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.htm=
l
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_cursor_crc@cursor-sliding-64x64.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][184] ([Intel XE#2291]) ->
> [PASS][185] +4 other tests pass
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][186] ([Intel XE#4294]) ->
> [PASS][187]
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.htm=
l
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][188] ([Intel XE#2316]) ->
> [PASS][189] +8 other tests pass
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-dpms-on-nop.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][190] =
([Intel XE#301]) -> [PASS][191]
> +8 other tests pass
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-h=
dmi-a6-dp4.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][192] =
([Intel XE#301] / [Intel
> XE#3321]) -> [PASS][193] +3 other tests pass
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.h=
tml
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_flip@flip-vs-expired-vblank@a-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][194] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][195] +2 other tests pass
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a=
-hdmi-a1.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-rte:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][196] =
([Intel XE#783]) -> [PASS][197]
> +2 other tests pass
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-rte.htm=
l
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-1p-rte.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][198] ([Intel XE#1503]) ->
> [PASS][199]
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_hdr@static-toggle-dpms.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-x:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][200] =
([Intel XE#829]) -> [PASS][201]
> +3 other tests pass
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_plane_lowres@tiling-x.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][202] ([Intel XE#718]) -> [PASS][203]
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][204] ([Intel XE#1435]) ->
> [PASS][205]
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.htm=
l
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_universal_plane@universal-plane-functional:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][206] ([Intel XE#5213]) ->
> [PASS][207] +1 other test pass
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-7/igt@kms_universal_plane@universal-plane-funct=
ional.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_universal_plane@universal-plane-functional.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#1392]) ->
> [PASS][209] +5 other tests pass
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-de=
fer-mmap.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@threads-many-new-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][210] ([Intel XE#5058]) ->
> [PASS][211]
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-new=
-nomemset.html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
xe_exec_system_allocator@threads-many-new-nomemset.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nome=
mset
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][212] ([Intel XE#4937]) ->
> [PASS][213]
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-v=
m-many-large-new-bo-map-nomemset.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-lnl-3/igt@=
xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.h=
tml
>=20
> =C2=A0 * igt@xe_module_load@reload-no-display:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][214] =
([Intel XE#4208]) ->
> [PASS][215]
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@xe_module_load@reload-no-display.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@xe_module_load@reload-no-display.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][216] ([Intel XE#4847]) ->
> [PASS][217]
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_pm@s2idle-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][218] -> [PASS][219]
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][220] ([Intel XE#1124]) ->
> [SKIP][221] ([Intel XE#4947]) +1 other test skip
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_big_fb@4-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-16bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][222] ([Intel XE#316]) -> [SKIP][223]
> ([Intel XE#4947])
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_big_fb@linear-16bpp-rotate-270.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_big_fb@linear-16bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][224] =
([Intel XE#829]) -> [SKIP][225]
> ([Intel XE#316])
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_big_fb@linear-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][226] ([Intel XE#4543]) ->
> [DMESG-WARN][227] ([Intel XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-180-async-flip.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][228] ([Intel XE#4543]) ->
> [SKIP][229] ([Intel XE#4947])
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_big_fb@y-tiled-8bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][230] =
([Intel XE#829]) -> [SKIP][231]
> ([Intel XE#1124])
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_big_fb@yf-tiled-8bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][232] ([Intel XE#367]) -> [SKIP][233]
> ([Intel XE#4950])
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-display=
s-3840x2160p.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
-> [SKIP][235] ([Intel XE#367])
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x10=
80p.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-436/ig=
t@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][236] ([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][237] ([Intel XE#4947])
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-=
rc-ccs-cc.html
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][238] =
([Intel XE#829]) -> [SKIP][239]
> ([Intel XE#455] / [Intel XE#787]) +1 other test skip
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.=
html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][240] =
([Intel XE#829]) -> [SKIP][241]
> ([Intel XE#2907])
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled=
-bmg-ccs.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[242] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][243]
> ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel
> XE#4212] / [Intel XE#4345] / [Intel XE#4522])
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-25:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][244] ([Intel XE#306]) -> [SKIP][245]
> ([Intel XE#4950])
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_chamelium_color@ctm-0-25.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][246] =
-> [SKIP][247] ([Intel XE#373])
> +1 other test skip
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.=
html
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][248] ([Intel XE#1178]) ->
> [SKIP][249] ([Intel XE#2341])
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-8/igt@kms_content_protection@atomic.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_content_protection@atomic.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][250] ([Intel XE#1188]) ->
> [SKIP][251] ([Intel XE#2341])
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-8/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][252] ([Intel XE#309]) -> [SKIP][253]
> ([Intel XE#4950]) +1 other test skip
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor=
-legacy.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][254] ([Intel XE#776]) -> [SKIP][255]
> ([Intel XE#4947])
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@kms_fbcon_fbt@psr.html
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_fbcon_fbt@psr.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][256] ([Intel XE#310]) -> [SKIP][257]
> ([Intel XE#4950])
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.h=
tml
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][258] ([Intel XE#2316]) ->
> [FAIL][259] ([Intel XE#2882])
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-2/igt@=
kms_flip@2x-wf_vblank-ts-check.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][260] =
-> [SKIP][261] ([Intel XE#455])
> +2 other tests skip
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-t=
o-64bpp-yftile-upscaling.html
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-433/ig=
t@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][262] ([Intel XE#651]) -> [SKIP][263]
> ([Intel XE#4947]) +1 other test skip
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscr=
n-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][264] =
([Intel XE#783]) -> [SKIP][265]
> ([Intel XE#651]) +4 other tests skip
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-cur-indfb-onoff.html
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][266] ([Intel XE#2312]) ->
> [SKIP][267] ([Intel XE#2311]) +23 other tests skip
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][268] ([Intel XE#656]) -> [SKIP][269]
> ([Intel XE#2351] / [Intel XE#4947])
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][270] ([Intel XE#2311]) ->
> [SKIP][271] ([Intel XE#2312]) +21 other tests skip
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][272] ([Intel XE#2312]) ->
> [SKIP][273] ([Intel XE#4141]) +9 other tests skip
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
indfb-msflip-blt.html
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-7/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][274] ([Intel XE#656]) -> [SKIP][275]
> ([Intel XE#4947]) +3 other tests skip
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][276] ([Intel XE#4141]) ->
> [SKIP][277] ([Intel XE#2312]) +13 other tests skip
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-draw-render.html
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][278] ([Intel XE#651]) -> [SKIP][279]
> ([Intel XE#2351] / [Intel XE#4947])
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb1010=
10-draw-mmap-wc.html
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][280] ([Intel XE#2313]) ->
> [SKIP][281] ([Intel XE#2312]) +17 other tests skip
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-spr-indfb-onoff.html
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][282] ([Intel XE#653]) -> [SKIP][283]
> ([Intel XE#4947]) +1 other test skip
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-sc=
aledprimary.html
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][284] =
([Intel XE#783]) -> [SKIP][285]
> ([Intel XE#653]) +4 other tests skip
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-pri-indfb-draw-blt.html
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][286] ([Intel XE#2312]) ->
> [SKIP][287] ([Intel XE#2313]) +21 other tests skip
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-=
spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-3/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][288] =
-> [SKIP][289] ([Intel
> XE#2925])
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-=
big-joiner.html
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][290] ([Intel XE#4596]) ->
> [SKIP][291] ([Intel XE#5021])
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-bmg-8/igt@=
kms_plane_multiple@2x-tiling-y.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][292] ([Intel XE#3325]) ->
> [SKIP][293] ([Intel XE#734])
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@drm-resources-equal:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][294] ([Intel XE#5319]) ->
> [SKIP][295] ([Intel XE#4962])
> =C2=A0=C2=A0 [294]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@kms_pm_rpm@drm-resources-equal.html
> =C2=A0=C2=A0 [295]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_pm_rpm@drm-resources-equal.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][296] =
-> [SKIP][297] ([Intel
> XE#1489])
> =C2=A0=C2=A0 [296]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move=
-continuous-sf.html
> =C2=A0=C2=A0 [297]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-463/ig=
t@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][298] ([Intel XE#1489]) ->
> [SKIP][299] ([Intel XE#4947])
> =C2=A0=C2=A0 [298]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@kms_psr2_sf@psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html
> =C2=A0=C2=A0 [299]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr@pr-sprite-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][300] =
-> [SKIP][301] ([Intel XE#2850]
> / [Intel XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [300]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
> =C2=A0=C2=A0 [301]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-434/ig=
t@kms_psr@pr-sprite-blt.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][302] =
([Intel XE#362]) -> [SKIP][303]
> ([Intel XE#1500])
> =C2=A0=C2=A0 [302]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [303]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-dg2-435/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@kms_vrr@flip-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][304] ([Intel XE#455]) -> [SKIP][305]
> ([Intel XE#4950]) +1 other test skip
> =C2=A0=C2=A0 [304]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@kms_vrr@flip-basic.html
> =C2=A0=C2=A0 [305]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@kms_vrr@flip-basic.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][306] ([Intel XE#1126]) ->
> [SKIP][307] ([Intel XE#4945])
> =C2=A0=C2=A0 [306]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> =C2=A0=C2=A0 [307]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_eudebug_online@interrupt-reconnect:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][308] ([Intel XE#4837]) ->
> [SKIP][309] ([Intel XE#4945])
> =C2=A0=C2=A0 [308]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_eudebug_online@interrupt-reconnect.ht=
ml
> =C2=A0=C2=A0 [309]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_eudebug_online@interrupt-reconnect.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][310] ([Intel XE#1392]) ->
> [SKIP][311] ([Intel XE#4945])
> =C2=A0=C2=A0 [310]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-m=
any-vm-bindexecqueue-rebind.html
> =C2=A0=C2=A0 [311]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-i=
mm
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][312] ([Intel XE#288]) -> [SKIP][313]
> ([Intel XE#4945]) +1 other test skip
> =C2=A0=C2=A0 [312]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-binde=
xecqueue-userptr-invalidate-imm.html
> =C2=A0=C2=A0 [313]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.ht=
ml
>=20
> =C2=A0 * igt@xe_exec_reset@cm-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][314] ([Intel XE#3868]) ->
> [SKIP][315] ([Intel XE#4945])
> =C2=A0=C2=A0 [314]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
> =C2=A0=C2=A0 [315]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_exec_reset@cm-cat-error.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][316] ([Intel XE#4915]) ->
> [SKIP][317] ([Intel XE#4945]) +34 other tests skip
> =C2=A0=C2=A0 [316]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap=
-remap-dontunmap-eocheck.html
> =C2=A0=C2=A0 [317]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ([PASS][318], [PASS][319], [PASS][320],
> [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325],
> [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330],
> [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335],
> [PASS][336], [PASS][337], [DMESG-WARN][338], [PASS][339],
> [PASS][340], [SKIP][341], [PASS][342], [PASS][343]) ([Intel XE#2953]
> / [Intel XE#378] / [Intel XE#4173]) -> ([SKIP][344], [PASS][345],
> [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350],
> [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355],
> [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360],
> [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365],
> [PASS][366], [PASS][367], [PASS][368], [PASS][369]) ([Intel XE#378])
> =C2=A0=C2=A0 [318]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [319]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [320]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [321]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [322]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [323]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-3/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [324]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [325]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [326]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-2/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [327]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [328]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [329]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [330]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [331]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-8/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [332]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [333]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [334]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [335]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-9/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [336]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [337]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [338]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [339]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [340]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [341]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [342]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-6/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [343]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-1/igt@xe_module_load@load.html
> =C2=A0=C2=A0 [344]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [345]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [346]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [347]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [348]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [349]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [350]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [351]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [352]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [353]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [354]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [355]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [356]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [357]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-6/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [358]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [359]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-3/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [360]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [361]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [362]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [363]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-1/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [364]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-4/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [365]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [366]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-2/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [367]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [368]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@xe_module_load@load.html
> =C2=A0=C2=A0 [369]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-8/igt=
@xe_module_load@load.html
>=20
> =C2=A0 * igt@xe_oa@invalid-create-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][370] ([Intel XE#2541] / [Intel
> XE#3573]) -> [SKIP][371] ([Intel XE#4945])
> =C2=A0=C2=A0 [370]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3295-c86140bb02edc8e529f095e=
bf15e8d466fa15738/shard-adlp-4/igt@xe_oa@invalid-create-userspace-config.ht=
ml
> =C2=A0=C2=A0 [371]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/shard-adlp-9/igt=
@xe_oa@invalid-create-userspace-config.html
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
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
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
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2286]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2501]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2838]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
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
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2925]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
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
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3099]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
> =C2=A0 [Intel XE#3342]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3767]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
> =C2=A0 [Intel XE#3768]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#3908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> =C2=A0 [Intel XE#4298]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4416]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> =C2=A0 [Intel XE#4459]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> =C2=A0 [Intel XE#4501]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
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
> =C2=A0 [Intel XE#4609]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
> =C2=A0 [Intel XE#4650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> =C2=A0 [Intel XE#4683]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4847]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4921]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
> =C2=A0 [Intel XE#4937]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#4945]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
> =C2=A0 [Intel XE#4947]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
> =C2=A0 [Intel XE#4950]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
> =C2=A0 [Intel XE#4962]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
> =C2=A0 [Intel XE#5020]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> =C2=A0 [Intel XE#5021]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
> =C2=A0 [Intel XE#5058]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5058
> =C2=A0 [Intel XE#5191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
> =C2=A0 [Intel XE#5213]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> =C2=A0 [Intel XE#5300]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
> =C2=A0 [Intel XE#5308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
> =C2=A0 [Intel XE#5319]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5319
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#703]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#783]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#829]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [i915#6077]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_8422 -> IGT_8423
> =C2=A0 * Linux: xe-3295-c86140bb02edc8e529f095ebf15e8d466fa15738 -> xe-pw=
-
> 150242v3
>=20
> =C2=A0 IGT_8422: 9b9c9136b17a2ed0680fb9589d51446c03698b37 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 IGT_8423: 8423
> =C2=A0 xe-3295-c86140bb02edc8e529f095ebf15e8d466fa15738:
> c86140bb02edc8e529f095ebf15e8d466fa15738
> =C2=A0 xe-pw-150242v3: 150242v3
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150242v3/index.html

