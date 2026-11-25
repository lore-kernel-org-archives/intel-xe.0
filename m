Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35A606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zf49t/em
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5217510E08B;
	Wed, 25 Nov 2026 09:33:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801EE10E08B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795599229; x=1827135229;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Yf7uvZqLdmhOm6/Y1hcklHeC4yGIZp0BVxXUOwbd/dA=;
 b=Zf49t/emx0w5N92/AIUJMtNkZytoyop3iYgk7NfQa44lZ7VZQ8FV81D6
 1QgJU3Xfr1F7wq4rewy06d2X8qJiEXV3Eg/+IkMtM/ivYdUR0rR6NGlZi
 gFwUExF83OdbtQGXyxJMkFDx0u+UDueH1/8tymSRLlh6muHkGVh8z+h8k
 woiYgz0q2ULwac9lbYHfVNqPJfWxJzplYYtoWhmP7CEdMUNDJg9PfUasg
 xlF5JFbBLBStWm1NbQBfdjmWR5fbTJAHWfmwknLmP1u1DPP9JqoljnIuk
 0gfOb9uCKgfvghIqs+MJ9K7WkxrX9qBVkqAysXT/5Pj4dNpzhuyIeMa/I g==;
X-CSE-ConnectionGUID: j95uqqHpTqK35fYCbNrh0g==
X-CSE-MsgGUID: UdsdaqO0T/+RKKLqhA4MnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4372501"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4372501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:33:48 -0800
X-CSE-ConnectionGUID: w3SQpLfjTIerhMBZoRHcTQ==
X-CSE-MsgGUID: LPq7cRPfT3yF6mlej3mq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12025594"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.62])
 ([10.245.244.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:33:47 -0800
Message-ID: <d6dccd294a95d820d62f8227321cf70638b66a1e.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/ttm: Destroy
 the ttm_tt in ttm_bo_move_null() when it's no longer needed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 10:33:44 +0100
In-Reply-To: <179555819378.80843.2595773065581805165@9ac1b63fe3ea>
References: <20261124190954.47690-1-thomas.hellstrom@linux.intel.com>
 <179555819378.80843.2595773065581805165@9ac1b63fe3ea>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-24 at 22:09 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it's
> no longer needed
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/179550/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-6225-
> 0136c4319eff88f24494b8d1655e247a935dda57_FULL -> xe-pw-179550v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-179550v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-179550v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (3 -> 3)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-179550v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [ABORT][2] +1 other test abort
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend.h=
tml
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@=
kms_vblank@ts-continuation-dpms-suspend.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][3] -> [ABORT][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@p=
ipe-a-edp-1.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@=
kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][5] -> [DMESG-WARN][6]
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend@p=
ipe-d-edp-1.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@=
kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1.html
>=20
>=20

These are unrelated.

/Thomas


> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-179550v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][7] -> [FAIL][8] ([Intel XE#6078]) +1
> other test fail
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip=
.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@=
kms_async_flips@alternate-sync-async-flip.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][9] -> [FAIL][10] ([Intel XE#3718] /
> [Intel XE#7265]) +1 other test fail
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip=
.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@=
kms_async_flips@alternate-sync-async-flip.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][11] -> [FAIL][12] ([Intel XE#7265])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip=
@pipe-c-edp-1.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][13] -> [FAIL][14] ([Intel XE#3718] /
> [Intel XE#6078])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip=
@pipe-d-dp-2.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][15] -> [FAIL][16] ([Intel XE#6078])
> +2 other tests fail
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip=
@pipe-d-hdmi-a-3.html
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#2327]) +2
> other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@=
kms_big_fb@4-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#5901]) +2
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_big_fb@linear-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#7085])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1124])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@=
kms_big_fb@y-tiled-64bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#5850])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_big_fb@y-tiled-addfb.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#5808]) +8
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1124]) +9
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#7679])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#7679]) +2
> other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#8365])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@=
kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#367])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@=
kms_bw@linear-tiling-3-displays-target-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#367]) +2
> other tests skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#5822]) +6
> other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][30] -> [INCOMPLETE][31] ([Intel
> XE#7084] / [Intel XE#8150])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-c=
cs.html
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][32] ([Intel XE#7084]
> / [Intel XE#8150])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#3432]) +1
> other test skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#2887]) +14
> other tests skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_chamelium_audio@dp-audio-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#2252]) +3
> other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_chamelium_audio@dp-audio-after-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_color@degamma:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#2325] /
> [Intel XE#7358]) +1 other test skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_chamelium_color@degamma.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#5824])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@=
kms_chamelium_color@degamma.html
>=20
> =C2=A0 *
> igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#8391])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#7358])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#2252]) +6
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
kms_chamelium_edid@dp-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#373])
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-3/igt@=
kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#6969]) +7
> other tests skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#6969]) +7
> other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-hdcp14:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][44] ([Intel XE#1178] /
> [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_content_protection@atomic-hdcp14.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#6974])
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
kms_content_protection@dp-mst-type-0-hdcp14.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy@pipe-a-dp-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][46] ([Intel XE#3304]) +1
> other test fail
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
kms_content_protection@legacy@pipe-a-dp-1.html
>=20
> =C2=A0 * igt@kms_content_protection@mei-interface:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#5845])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_content_protection@mei-interface.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#5846])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-64x21:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#2320]) +3
> other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
kms_cursor_crc@cursor-onscreen-64x21.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#5900]) +1
> other test skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#5962]) +1
> other test skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@=
kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#2286] /
> [Intel XE#6035]) +1 other test skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#9533])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_dp_link_training@uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst-direct-train:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#9527])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_dp_link_training@uhbr-mst-direct-train.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#9527])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@=
kms_dp_link_training@uhbr-mst-direct-train.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#8265]) +4
> other tests skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
kms_dsc@dsc-fractional-bpp-bigjoiner.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#5907]) +3
> other tests skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@=
kms_dsc@dsc-with-bpc-ultrajoiner.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#4156] /
> [Intel XE#7425])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@kms_fbcon_fbt@fbc.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#2316]) +1
> other test skip
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#7178] /
> [Intel XE#7351]) +5 other tests skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#7178]) +4
> other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#5800] /
> [Intel XE#6312]) +4 other tests skip
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#2311]) +43
> other tests skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#4141]) +10
> other tests skip
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#7061] /
> [Intel XE#7356]) +5 other tests skip
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@=
kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#7061] /
> [Intel XE#7356]) +5 other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#6312]) +9
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#7905]) +2
> other tests skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#656] /
> [Intel XE#7905])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#7865]) +2
> other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#5812]) +44
> other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#7061]) +4
> other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#7865]) +16
> other tests skip
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#2313]) +46
> other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#7061]) +1
> other test skip
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][76] -> [SKIP][77] ([Intel XE#1503])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_joiner@basic-max-non-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#4298] /
> [Intel XE#5873])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_joiner@basic-max-non-joiner.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#7591])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 *
> igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#7283])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#7283]) +2
> other tests skip
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#5844]) +4
> other tests skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@=
kms_plane_lowres@tiling-none@pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#5946])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_plane_lowres@tiling-y.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#2393])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_plane_lowres@tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][85] -> [FAIL][86] ([Intel XE#9780])
> +4 other tests fail
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-r=
otation-180-x-tiled.html
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#9779]) +1
> other test skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-dpms-negative:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#1131])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
kms_pm_dc@dc5-dpms-negative.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][89] -> [FAIL][90] ([Intel XE#8399])
> +2 other tests fail
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@=
kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_pm_lpsp@kms-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#2499])
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_pm_lpsp@kms-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#2893] /
> [Intel XE#4608] / [Intel XE#7304])
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf
> @pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#4608])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-e=
dp-1.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf
> @pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#4608] /
> [Intel XE#7304])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-e=
dp-1.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#5858] /
> [Intel XE#7304]) +5 other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a=
-
> edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#5858]) +2
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1489]) +8
> other tests skip
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#1406] /
> [Intel XE#5835]) +1 other test skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_psr@fbc-psr2-dpms.html
>=20
> =C2=A0 * igt@kms_psr@pr-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#1406]) +1
> other test skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
kms_psr@pr-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr@pr-sprite-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][101] ([Intel XE#1406])
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
kms_psr@pr-sprite-plane-move.html
>=20
> =C2=A0 * igt@kms_psr@psr-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#2234] /
> [Intel XE#2850]) +8 other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
kms_psr@psr-basic.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#5821])
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][104] ([Intel XE#3904] /
> [Intel XE#7342])
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
kms_rotation_crc@sprite-rotation-90.html
>=20
> =C2=A0 * igt@kms_sharpness_filter@invalid-plane-with-filter:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][105] ([Intel XE#6503])
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_sharpness_filter@invalid-plane-with-filter.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#5857])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
kms_tv_load_detect@load-detect.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#2450] /
> [Intel XE#5857])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][108] -> [ABORT][109] ([Intel
> XE#1727] / [Intel XE#9422])
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.h=
tml
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@=
kms_vblank@ts-continuation-dpms-suspend.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][110] -> [INCOMPLETE][111] ([Intel
> XE#1727])
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@p=
ipe-c-edp-1.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@=
kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@max-min:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#1499] /
> [Intel XE#9271])
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_vrr@max-min.html
>=20
> =C2=A0 * igt@sriov_basic@pf-unbind-with-vf-probed:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][113] ([Intel XE#8868])
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
sriov_basic@pf-unbind-with-vf-probed.html
>=20
> =C2=A0 * igt@xe_compute@eu-busy-10s:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][114] ([Intel XE#6599])
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
xe_compute@eu-busy-10s.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many-vram:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][115] ([Intel XE#5191])
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
xe_compute_preempt@compute-preempt-many-vram.html
>=20
> =C2=A0 *
> igt@xe_err_injection@inject_core_compute_corr_error_threshold_default
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#9769])
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
xe_err_injection@inject_core_compute_corr_error_threshold_default.html
>=20
> =C2=A0 * igt@xe_evict@evict-cm-threads-small-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#5764]) +5
> other tests skip
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
xe_evict@evict-cm-threads-small-multi-vm.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-external-multi-queue-cm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#8370])
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
xe_evict@evict-small-external-multi-queue-cm.html
>=20
> =C2=A0 * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race=
:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#7482]) +11
> other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@=
xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][120] ([Intel XE#1392])
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
invalida
> te:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#2322] /
> [Intel XE#7372]) +7 other tests skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inval=
idate.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
rebind
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#5575] /
> [Intel XE#7484]) +3 other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind=
.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#8374]) +7
> other tests skip
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
xe_exec_fault_mode@many-execqueues-multi-queue-imm.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#8374]) +2
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#8364]) +24
> other tests skip
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#8364]) +3
> other tests skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@=
xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][127] ([Intel XE#8364]) +20
> other tests skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
xe_exec_multi_queue@one-queue-preempt-mode-userptr.html
>=20
> =C2=A0 * igt@xe_exec_reset@cm-multi-queue-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#8369]) +2
> other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
xe_exec_reset@cm-multi-queue-cat-error.html
>=20
> =C2=A0 * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#8369])
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
xe_exec_reset@multi-queue-long-spin-many-queue-switch.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#8369])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@=
xe_exec_reset@multi-queue-long-spin-many-queue-switch.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][131] ([Intel XE#8378]) +6
> other tests skip
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#8378]) +4
> other tests skip
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
xe_exec_threads@threads-multi-queue-cm-userptr.html
>=20
> =C2=A0 *
> igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#6281] /
> [Intel XE#7426])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
>=20
> =C2=A0 * igt@xe_mmap@pci-membarrier:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][134] ([Intel XE#5100] /
> [Intel XE#7408])
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
xe_mmap@pci-membarrier.html
>=20
> =C2=A0 * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#6964]) +2
> other tests skip
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
xe_multigpu_svm@mgpu-coherency-prefetch.html
>=20
> =C2=A0 * igt@xe_multigpu_svm@mgpu-migration-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][136] ([Intel XE#6964]) +2
> other tests skip
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
xe_multigpu_svm@mgpu-migration-prefetch.html
>=20
> =C2=A0 * igt@xe_page_reclaim@binds-large-split:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#7793]) +1
> other test skip
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
xe_page_reclaim@binds-large-split.html
>=20
> =C2=A0 * igt@xe_page_reclaim@pat-index-xd:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][138] ([Intel XE#7793]) +1
> other test skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
xe_page_reclaim@pat-index-xd.html
>=20
> =C2=A0 * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][139] ([Intel XE#7590])
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@=
xe_pat@l2-flush-opt-svm-pat-restrict.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#7590])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
xe_pat@l2-flush-opt-svm-pat-restrict.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#2236] /
> [Intel XE#7590])
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_pat@pt-caching-single-object:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][142] -> [DMESG-WARN][143] ([Intel
> XE#9513])
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-6/igt@xe_pat@pt-caching-single-object.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@=
xe_pat@pt-caching-single-object.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-i2c:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#5694] /
> [Intel XE#7370])
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
xe_pm@d3cold-i2c.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][145] -> [ABORT][146] ([Intel
> XE#9476])
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-5/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@=
xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][147] -> [ABORT][148] ([Intel
> XE#9362])
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-1/igt@xe_pm@s4-mocs.html
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@=
xe_pm@s4-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][149] -> [ABORT][150] ([Intel
> XE#9399])
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][151] -> [FAIL][152] ([Intel
> XE#9254])
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
xe_pm_residency@gt-c6-freeze@gt0.html
>=20
> =C2=A0 * igt@xe_prefetch_fault@prefetch-fault:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][153] ([Intel XE#7599])
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
xe_prefetch_fault@prefetch-fault.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][154] ([Intel XE#4733] /
> [Intel XE#7417])
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@=
xe_pxp@pxp-stale-queue-post-termination-irq.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-extension:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
xe_query@multigpu-query-invalid-extension.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-twice:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][156] -> [FAIL][157] ([Intel
> XE#6569])
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
xe_sriov_flr@flr-twice.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-vf1-clear:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][158] ([Intel XE#6569])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
xe_sriov_flr@flr-vf1-clear.html
>=20
> =C2=A0 * igt@xe_sriov_vram@vf-access-after-resize-down:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][159] ([Intel XE#6376] /
> [Intel XE#7422])
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
xe_sriov_vram@vf-access-after-resize-down.html
>=20
> =C2=A0 * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#9597])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
xe_vm@overcommit-fault-vram-lr-no-overcommit.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-at-any-timeout:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [DMESG-WARN][161] ([Intel
> XE#8963])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@=
xe_wedged@wedged-at-any-timeout.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-mode-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][162] -> [DMESG-WARN][163] ([Intel
> XE#9825])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-1/igt@xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@=
xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][164] -> [DMESG-WARN][165] ([Intel
> XE#9825])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@=
xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][166] -> [ABORT][167] ([Intel
> XE#9781])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
xe_wedged@wedged-mode-toggle.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][168] ([Intel XE#6078]) ->
> [PASS][169]
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip=
@pipe-a-dp-2.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][170] ([Intel XE#367]) -> [PASS][171]
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-25=
60x1440p.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@=
kms_bw@linear-tiling-1-displays-target-2560x1440p.html
>=20
> =C2=A0 * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][172] ([Intel XE#9721]) ->
> [PASS][173] +1 other test pass
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-5/igt@kms_flip@blocking-absolute-wf_vblank-inte=
rruptible@d-edp1.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@=
kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][174] ([Intel XE#301] / [Intel
> XE#3149]) -> [PASS][175] +1 other test pass
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.ht=
ml
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@=
kms_flip@flip-vs-expired-vblank@c-edp1.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pi
> pe-b-dp-2-xrgb2101010:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][176] ([Intel XE#9793]) ->
> [PASS][177] +1 other test pass
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-max-crc=
-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@=
kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-=
xrgb2101010.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-
> 2-p010:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][178] ([Intel XE#9780]) ->
> [PASS][179] +5 other tests pass
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc=
-x-tiled@pipe-a-dp-2-p010.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@=
kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-psr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][180] ([Intel XE#8399]) ->
> [PASS][181]
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@=
kms_pm_dc@dc6-psr.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][182] ([Intel XE#9362]) ->
> [PASS][183] +1 other test pass
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-basic.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@=
xe_pm@s4-basic.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][184] ([Intel XE#7727]) ->
> [PASS][185]
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-exec-after.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@=
xe_pm@s4-exec-after.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][186] ([Intel XE#9362]) ->
> [PASS][187]
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@=
xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][188] ([Intel XE#9254]) ->
> [PASS][189]
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@=
xe_pm_residency@gt-c6-freeze@gt1.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-each-isolation:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][190] ([Intel XE#6569]) ->
> [PASS][191]
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@=
xe_sriov_flr@flr-each-isolation.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][192] ([Intel XE#3544]) ->
> [SKIP][193] ([Intel XE#3374] / [Intel XE#3544])
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][194] ([Intel XE#2426] / [Intel
> XE#5848]) -> [FAIL][195] ([Intel XE#1729] / [Intel XE#7424])
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt=
@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][196] ([Intel XE#2426] / [Intel
> XE#5848]) -> [SKIP][197] ([Intel XE#2509] / [Intel XE#7437])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d=
1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with=
-chamelium.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1131]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2236]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2286]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
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
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2450]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
> =C2=A0 [Intel XE#2499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
> =C2=A0 [Intel XE#2509]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#3304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4156]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> =C2=A0 [Intel XE#4298]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> =C2=A0 [Intel XE#4608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#5100]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
> =C2=A0 [Intel XE#5191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
> =C2=A0 [Intel XE#5575]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> =C2=A0 [Intel XE#5694]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
> =C2=A0 [Intel XE#5764]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
> =C2=A0 [Intel XE#5800]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
> =C2=A0 [Intel XE#5808]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
> =C2=A0 [Intel XE#5812]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
> =C2=A0 [Intel XE#5821]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
> =C2=A0 [Intel XE#5822]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
> =C2=A0 [Intel XE#5824]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
> =C2=A0 [Intel XE#5835]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
> =C2=A0 [Intel XE#5844]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
> =C2=A0 [Intel XE#5845]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845
> =C2=A0 [Intel XE#5846]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
> =C2=A0 [Intel XE#5848]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
> =C2=A0 [Intel XE#5850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
> =C2=A0 [Intel XE#5857]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
> =C2=A0 [Intel XE#5858]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
> =C2=A0 [Intel XE#5873]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
> =C2=A0 [Intel XE#5900]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
> =C2=A0 [Intel XE#5901]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
> =C2=A0 [Intel XE#5907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
> =C2=A0 [Intel XE#5946]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
> =C2=A0 [Intel XE#5962]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
> =C2=A0 [Intel XE#6035]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
> =C2=A0 [Intel XE#6078]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
> =C2=A0 [Intel XE#6281]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
> =C2=A0 [Intel XE#6312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
> =C2=A0 [Intel XE#6376]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
> =C2=A0 [Intel XE#6503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#6569]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
> =C2=A0 [Intel XE#6599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
> =C2=A0 [Intel XE#6964]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
> =C2=A0 [Intel XE#6969]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
> =C2=A0 [Intel XE#6974]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
> =C2=A0 [Intel XE#7061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
> =C2=A0 [Intel XE#7084]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
> =C2=A0 [Intel XE#7085]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
> =C2=A0 [Intel XE#7178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
> =C2=A0 [Intel XE#7265]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
> =C2=A0 [Intel XE#7283]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
> =C2=A0 [Intel XE#7304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
> =C2=A0 [Intel XE#7342]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
> =C2=A0 [Intel XE#7351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
> =C2=A0 [Intel XE#7356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
> =C2=A0 [Intel XE#7358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
> =C2=A0 [Intel XE#7370]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
> =C2=A0 [Intel XE#7372]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
> =C2=A0 [Intel XE#7374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
> =C2=A0 [Intel XE#7383]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
> =C2=A0 [Intel XE#7408]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
> =C2=A0 [Intel XE#7417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
> =C2=A0 [Intel XE#7422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
> =C2=A0 [Intel XE#7424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
> =C2=A0 [Intel XE#7425]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
> =C2=A0 [Intel XE#7426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
> =C2=A0 [Intel XE#7437]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
> =C2=A0 [Intel XE#7482]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
> =C2=A0 [Intel XE#7484]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
> =C2=A0 [Intel XE#7590]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
> =C2=A0 [Intel XE#7591]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
> =C2=A0 [Intel XE#7599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
> =C2=A0 [Intel XE#7679]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
> =C2=A0 [Intel XE#7727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
> =C2=A0 [Intel XE#7793]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
> =C2=A0 [Intel XE#7865]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
> =C2=A0 [Intel XE#7905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
> =C2=A0 [Intel XE#8150]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
> =C2=A0 [Intel XE#8265]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#8364]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
> =C2=A0 [Intel XE#8365]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
> =C2=A0 [Intel XE#8369]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
> =C2=A0 [Intel XE#8370]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
> =C2=A0 [Intel XE#8374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
> =C2=A0 [Intel XE#8378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
> =C2=A0 [Intel XE#8391]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
> =C2=A0 [Intel XE#8399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
> =C2=A0 [Intel XE#8868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
> =C2=A0 [Intel XE#8963]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
> =C2=A0 [Intel XE#9254]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
> =C2=A0 [Intel XE#9271]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
> =C2=A0 [Intel XE#9362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
> =C2=A0 [Intel XE#9399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
> =C2=A0 [Intel XE#9422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#9476]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
> =C2=A0 [Intel XE#9513]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9513
> =C2=A0 [Intel XE#9527]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
> =C2=A0 [Intel XE#9533]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
> =C2=A0 [Intel XE#9597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
> =C2=A0 [Intel XE#9721]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9721
> =C2=A0 [Intel XE#9769]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
> =C2=A0 [Intel XE#9779]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
> =C2=A0 [Intel XE#9780]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
> =C2=A0 [Intel XE#9781]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781
> =C2=A0 [Intel XE#9793]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9793
> =C2=A0 [Intel XE#9825]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9825
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_9202 -> IGT_9203
> =C2=A0 * Linux: xe-6225-0136c4319eff88f24494b8d1655e247a935dda57 -> xe-pw=
-
> 179550v1
>=20
> =C2=A0 IGT_9202: 9202
> =C2=A0 IGT_9203: 9203
> =C2=A0 xe-6225-0136c4319eff88f24494b8d1655e247a935dda57:
> 0136c4319eff88f24494b8d1655e247a935dda57
> =C2=A0 xe-pw-179550v1: 179550v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html
