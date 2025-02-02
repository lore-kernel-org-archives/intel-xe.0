Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136E3C0218F
	for <intel-xe@archiver.kernel.org>; Sun,  2 Feb 2025 17:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B3610E0E4;
	Sun,  2 Feb 2025 17:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="mgvhqf8/";
	dkim-atps=neutral
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9796E10E0E4
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Feb 2025 17:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E4029425EB;
 Sun,  2 Feb 2025 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738518559;
 bh=62sTXugafb1UpBrq+xF9vrnl9xiUI9QX/H3d8kDCmgg=;
 h=Date:From:To:Subject:In-Reply-To:References;
 b=mgvhqf8/PkMOEVCnkU1p7I6ebTtO7P25eFUTYdaG9dCre9qKI1s2kFREwDBRxt/Yk
 S6qUph1JardbS7djWZ5H7f0YK7HnCKeS6WqXgB+Uycn8p5Cju04IAYjZzElLafrTtX
 +QJkz4Wicgb6ecVBdwwBvKgbimXYOPCBww2aWNVJV9x1a7akCJuDpZL6OASXPzVp+Y
 vlVtJkGGlEltcdDOd8O7/cKz+ROSQ759D5vtvVPeiu87OVj2P4npaVRsjDcQPS/7IX
 WYbd5K2SdXqEYksOwZsG/HNNMwq8SwTyICqKWT8vH4lwrvhiFYzvRsFLtFoHp7PNlh
 7I/42odzHfrww==
Date: Sun, 02 Feb 2025 18:49:17 +0100
From: Asahi Lina <lina@asahilina.net>
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>, 
 I915-ci-infra@lists.freedesktop.org
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/gpuvm=3A_A?=
 =?UTF-8?Q?dd_support_for_single-page-filled_mappings?=
User-Agent: K-9 Mail for Android
In-Reply-To: <173851273782.4060279.11841456184308754730@b555e5b46a47>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
 <173851273782.4060279.11841456184308754730@b555e5b46a47>
Message-ID: <08D48571-668E-436B-8CB6-AD8906E9A89B@asahilina.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----YRFGTWRIA7Z16RUYW3UF2P7WKRGEGM
Content-Transfer-Encoding: 7bit
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

------YRFGTWRIA7Z16RUYW3UF2P7WKRGEGM
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

I don't think these failures have anything to do with the series=2E They se=
em to be related to sound support=2E

~~ Lina

On February 2, 2025 5:12:17 PM GMT+01:00, Patchwork <patchwork@emeril=2Efr=
eedesktop=2Eorg> wrote:
>=3D=3D Series Details =3D=3D
>
>Series: drm/gpuvm: Add support for single-page-filled mappings
>URL   : https://patchwork=2Efreedesktop=2Eorg/series/144229/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2584-01f54d1da1ffffff78047186f62b5916dfd4393=
9_full -> xe-pw-144229v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144229v1_full absolutely need=
 to be
>  verified manually=2E
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144229v1_full, please notify your bug team (I915-ci=
-infra@lists=2Efreedesktop=2Eorg) to allow them
>  to document this new failure mode, which will reduce false positives in=
 CI=2E
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-144=
229v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@core_hotunplug@hotunplug-rescan:
>    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>   [1]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1f=
fffff78047186f62b5916dfd43939/shard-dg2-434/igt@core_hotunplug@hotunplug-re=
scan=2Ehtml
>   [2]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shar=
d-dg2-434/igt@core_hotunplug@hotunplug-rescan=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +1 other test inco=
mplete
>   [3]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1f=
fffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-edp-1=2Ehtml
>   [4]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shar=
d-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1=2Ehtml
>
>  * igt@kms_pm_rpm@basic-pci-d3-state:
>    - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>   [5]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1f=
fffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-sta=
te=2Ehtml
>   [6]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shar=
d-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state=2Ehtml
>
> =20
>#### Warnings ####
>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>    - shard-dg2-set2:     [DMESG-WARN][7] ([Intel XE#1033]) -> [DMESG-WAR=
N][8]
>   [7]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1f=
fffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs=2Ehtml
>   [8]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shar=
d-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=2Ehtml
>
> =20
>Known issues
>------------
>
>  Here are the changes found in xe-pw-144229v1_full that come from known =
issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +2 other =
tests skip
>   [9]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shar=
d-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270=2Ehtml
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-fli=
p:
>    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3658])
>   [10]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-=
flip=2Ehtml
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124]) +6 other=
 tests skip
>   [11]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0=2Ehtml
>
>  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other =
test skip
>   [12]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90=2Ehtml
>
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#610])
>   [13]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow=2Ehtml
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#1033]=
) +7 other tests dmesg-fail
>   [14]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-async-flip=2Ehtml
>   [15]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip=2E=
html
>
>  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +9 other=
 tests skip
>   [16]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180=2Ehtml
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +5 other=
 tests skip
>   [17]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip=2E=
html
>
>  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2191])
>   [18]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p=2Ehtml
>
>  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191]) +1 other=
 test skip
>   [19]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512]) +2 other=
 tests skip
>   [20]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p=2Ehtml
>
>  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#2191]) +2 other=
 tests skip
>   [21]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p=2Ehtml
>
>  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367]) +2 other =
tests skip
>   [22]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#367]) +1 other =
test skip
>   [23]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p=2Ehtml
>
>  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#367])
>   [24]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p=2Ehtml
>
>  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +6 other=
 tests skip
>   [25]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc=2Ehtml
>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#3442])
>   [26]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs=2Ehtml
>
>  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3432])
>   [27]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc=2Ehtml
>
>  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a=
-1:
>    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +17 other=
 tests skip
>   [28]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hd=
mi-a-1=2Ehtml
>
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2907])
>   [29]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs=2Ehtml
>
>  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-=
a-6:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#787]) +139 othe=
r tests skip
>   [30]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-=
hdmi-a-6=2Ehtml
>
>  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel X=
E#787]) +11 other tests skip
>   [31]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1=
=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [=
Intel XE#3124] / [Intel XE#4010])
>   [32]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1727]=
 / [Intel XE#3124] / [Intel XE#4010])
>   [33]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc=2Ehtml
>   [34]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#3124]=
 / [Intel XE#4010])
>   [35]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-b-dp-4=2Ehtml
>   [36]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4=2E=
html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1727]=
 / [Intel XE#3113])
>   [37]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6=2Ehtml
>   [38]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-=
6=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][39] ([Intel XE#3124] / [=
Intel XE#4010])
>   [39]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4=2Ehtm=
l
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][40] ([Intel XE#1727])
>   [40]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6=
=2Ehtml
>
>  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel X=
E#787]) +27 other tests skip
>   [41]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4=2Ehtml
>
>  * igt@kms_chamelium_color@ctm-limited-range:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306])
>   [42]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_chamelium_color@ctm-limited-range=2Ehtml
>
>  * igt@kms_chamelium_hpd@vga-hpd:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +5 other =
tests skip
>   [43]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_chamelium_hpd@vga-hpd=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +5 other =
tests skip
>   [44]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_chamelium_hpd@vga-hpd=2Ehtml
>
>  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +4 other =
tests skip
>   [45]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend=2Ehtml
>
>  * igt@kms_content_protection@atomic@pipe-a-dp-2:
>    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178])
>   [46]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2=2Ehtml
>
>  * igt@kms_content_protection@dp-mst-lic-type-1:
>    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#307])
>   [47]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#307])
>   [48]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1=2Ehtml
>
>  * igt@kms_content_protection@srm:
>    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#3278])
>   [49]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-3/igt@kms_content_protection@srm=2Ehtml
>
>  * igt@kms_content_protection@srm@pipe-a-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1178]) +3 other=
 tests fail
>   [50]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4=2Ehtml
>
>  * igt@kms_cursor_crc@cursor-offscreen-max-size:
>    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455]) +9 other =
tests skip
>   [51]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-2/igt@kms_cursor_crc@cursor-offscreen-max-size=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424]) +2 other=
 tests skip
>   [52]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-7/igt@kms_cursor_crc@cursor-offscreen-max-size=2Ehtml
>
>  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][53] ([Intel XE#1033]) +1=
7 other tests dmesg-warn
>   [53]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-d-hdmi-a-6=2Ehtml
>
>  * igt@kms_cursor_crc@cursor-onscreen-512x512:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308]) +2 other =
tests skip
>   [54]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2321])
>   [55]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512=2Ehtml
>    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#308])
>   [56]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512=2Ehtml
>
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
>   [57]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size=
=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#323])
>   [58]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size=
=2Ehtml
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#309]) +1 other =
test skip
>   [59]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions=2Ehtml
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#309]) +1 other =
test skip
>   [60]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy=2Ehtml
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-siz=
e:
>    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2291]) +3 o=
ther tests skip
>   [61]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size=2Ehtml
>   [62]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-=
size=2Ehtml
>
>  * igt@kms_dp_linktrain_fallback@dp-fallback:
>    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#3070])
>   [63]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3070])
>   [64]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback=2Ehtml
>
>  * igt@kms_feature_discovery@chamelium:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#701])
>   [65]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_feature_discovery@chamelium=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#701])
>   [66]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_feature_discovery@chamelium=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-dpms:
>    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#310]) +3 other =
tests skip
>   [67]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-4/igt@kms_flip@2x-flip-vs-dpms=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1421]) +5 other=
 tests skip
>   [68]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
>    - shard-bmg:          NOTRUN -> [DMESG-WARN][69] ([Intel XE#4172])
>   [69]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3=2Ehtm=
l
>
>  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a6-dp4:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][70] ([Intel XE#2049]) +1=
 other test incomplete
>   [70]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a6-dp4=2Ehtml
>
>  * igt@kms_flip@2x-nonexisting-fb:
>    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2316]) +7 o=
ther tests skip
>   [71]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb=
=2Ehtml
>   [72]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-6/igt@kms_flip@2x-nonexisting-fb=2Ehtml
>
>  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a6:
>    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#2049]=
)
>   [73]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_flip@blocking-absolute=
-wf_vblank-interruptible@a-hdmi-a6=2Ehtml
>   [74]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a6=
=2Ehtml
>
>  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2:
>    - shard-bmg:          [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2049]=
)
>   [75]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms_flip@blocking-absolute-w=
f_vblank-interruptible@c-dp2=2Ehtml
>   [76]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2=2Ehtm=
l
>
>  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>    - shard-lnl:          NOTRUN -> [INCOMPLETE][77] ([Intel XE#1504]) +1=
 other test incomplete
>   [77]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1=2Ehtml
>
>  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#301] / [Intel X=
E#3321]) +1 other test fail
>   [78]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4=2Ehtml
>
>  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#301]) +2 other =
tests fail
>   [79]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6=2Ehtml
>
>  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
>    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3321]) +3 o=
ther tests fail
>   [80]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_flip@flip-vs-expired-vbl=
ank@d-hdmi-a3=2Ehtml
>   [81]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3=2Ehtml
>
>  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2953]=
) +2 other tests dmesg-warn
>   [82]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-=
hdmi-a1=2Ehtml
>   [83]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1=2Ehtml
>
>  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#886]) +1 ot=
her test fail
>   [84]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@=
a-edp1=2Ehtml
>   [85]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1=2Ehtml
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling:
>    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401] / [Intel =
XE#1745]) +1 other test skip
>   [86]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-do=
wnscaling=2Ehtml
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling@pipe-a-default-mode:
>    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401]) +1 other=
 test skip
>   [87]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-do=
wnscaling@pipe-a-default-mode=2Ehtml
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>    - shard-dg2-set2:     [PASS][88] -> [DMESG-WARN][89] ([Intel XE#1033]=
) +59 other tests dmesg-warn
>   [88]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@kms_flip_scaled_crc@flip-3=
2bpp-linear-to-64bpp-linear-upscaling=2Ehtml
>   [89]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscal=
ing=2Ehtml
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p=
ipe-a-valid-mode:
>    - shard-adlp:         [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#1033]=
 / [Intel XE#324]) +5 other tests dmesg-fail
>   [90]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da1=
ffffff78047186f62b5916dfd43939/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode=2Ehtml
>   [91]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscali=
ng@pipe-a-valid-mode=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#651]) +18 other=
 tests skip
>   [92]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff=2E=
html
>
>  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#651]) +5 other =
tests skip
>   [93]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt=2Eh=
tml
>    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#651]) +2 other =
tests skip
>   [94]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt=2E=
html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#656]) +17 other=
 tests skip
>   [95]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>    - shard-adlp:         NOTRUN -> [DMESG-FAIL][96] ([Intel XE#1033])
>   [96]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt=
=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +21 other=
 tests skip
>   [97]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-w=
c=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-stridechange:
>    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4141])
>   [98]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-bmg-7/igt@kms_frontbuffer_tracking@fbc-stridechange=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#658])
>   [99]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sha=
rd-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1469])
>   [100]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-=
wc:
>    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2312])
>   [101]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-m=
map-wc=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
>    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2311]) +1 othe=
r test skip
>   [102]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#653]) +7 other=
 tests skip
>   [103]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1158])
>   [104]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#653]) +25 othe=
r tests skip
>   [105]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt=
=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2313]) +1 othe=
r test skip
>   [106]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move=2Ehtm=
l
>
>  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
>    - shard-dg2-set2:     NOTRUN -> [ABORT][107] ([Intel XE#2625] / [Inte=
l XE#4048])
>   [107]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2=2Ehtml
>
>  * igt@kms_joiner@basic-big-joiner:
>    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#346])
>   [108]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_joiner@basic-big-joiner=2Ehtml
>    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#346])
>   [109]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_joiner@basic-big-joiner=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#346])
>   [110]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-7/igt@kms_joiner@basic-big-joiner=2Ehtml
>
>  * igt@kms_joiner@basic-force-ultra-joiner:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2925])
>   [111]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner=2Ehtml
>
>  * igt@kms_joiner@invalid-modeset-force-big-joiner:
>    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#3012])
>   [112]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-7/igt@kms_joiner@invalid-modeset-=
force-big-joiner=2Ehtml
>   [113]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner=2Ehtml
>
>  * igt@kms_panel_fitting@atomic-fastset:
>    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2486])
>   [114]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@kms_panel_fitting@atomic-fastset=2Ehtml
>
>  * igt@kms_pipe_crc_basic@suspend-read-crc:
>    - shard-dg2-set2:     [PASS][115] -> [ABORT][116] ([Intel XE#2625] / =
[Intel XE#4080])
>   [115]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_pipe_crc_basic@suspen=
d-read-crc=2Ehtml
>   [116]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc=2Ehtml
>
>  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
>    - shard-dg2-set2:     NOTRUN -> [ABORT][117] ([Intel XE#2625] / [Inte=
l XE#4080])
>   [117]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2=2Ehtml
>
>  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:
>    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#417=
2]) +41 other tests dmesg-warn
>   [118]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_plane_alpha_blend@const=
ant-alpha-max@pipe-d-dp-2=2Ehtml
>   [119]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2=2Ehtml
>
>  * igt@kms_plane_cursor@viewport:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#616]) +1 other=
 test fail
>   [120]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@kms_plane_cursor@viewport=2Ehtml
>
>  * igt@kms_plane_lowres@tiling-y:
>    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#599])
>   [121]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-5/igt@kms_plane_lowres@tiling-y=2Ehtml
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe=
-a:
>    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2763]) +9 othe=
r tests skip
>   [122]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@=
pipe-a=2Ehtml
>
>  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe=
-d:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2763] / [Intel=
 XE#455]) +5 other tests skip
>   [123]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-2=
5@pipe-d=2Ehtml
>
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe=
-b:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2763]) +8 othe=
r tests skip
>   [124]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-2=
5@pipe-b=2Ehtml
>
>  * igt@kms_pm_backlight@fade-with-suspend:
>    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#870])
>   [125]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_pm_backlight@fade-with-suspend=2Ehtml
>
>  * igt@kms_pm_dc@deep-pkgc:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#908])
>   [126]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_pm_dc@deep-pkgc=2Ehtml
>
>  * igt@kms_pm_rpm@system-suspend-modeset:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][127] ([Intel XE#1033] / =
[Intel XE#2042])
>   [127]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset=2Ehtml
>
>  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1489]) +4 othe=
r tests skip
>   [128]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf=2Ehtm=
l
>
>  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1489])
>   [129]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf=2Ehtml
>
>  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1489]) +3 othe=
r tests skip
>   [130]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area=2Ehtml
>
>  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893])
>   [131]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area=2Ehtml
>
>  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2850] / [Intel=
 XE#929]) +6 other tests skip
>   [132]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_psr@fbc-pr-sprite-plane-onoff=2Ehtml
>
>  * igt@kms_psr@pr-basic:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2850] / [Intel=
 XE#929]) +9 other tests skip
>   [133]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_psr@pr-basic=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1406]) +4 othe=
r tests skip
>   [134]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-7/igt@kms_psr@pr-basic=2Ehtml
>
>  * igt@kms_psr@psr2-sprite-blt:
>    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2234] / [Intel=
 XE#2850])
>   [135]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_psr@psr2-sprite-blt=2Ehtml
>
>  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2939])
>   [136]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay=2Ehtml
>    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2939])
>   [137]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay=2Ehtml
>
>  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#3414] / [Intel=
 XE#3904])
>   [138]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0=2Ehtml
>    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1127])
>   [139]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0=2Ehtml
>
>  * igt@kms_rotation_crc@primary-rotation-90:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3414]) +1 othe=
r test skip
>   [140]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-434/igt@kms_rotation_crc@primary-rotation-90=2Ehtml
>
>  * igt@kms_setmode@basic:
>    - shard-bmg:          [PASS][141] -> [FAIL][142] ([Intel XE#2883]) +1=
 other test fail
>   [141]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-5/igt@kms_setmode@basic=2Ehtml
>   [142]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@kms_setmode@basic=2Ehtml
>
>  * igt@kms_setmode@invalid-clone-single-crtc:
>    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1435])
>   [143]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc=2Ehtml
>
>  * igt@kms_sysfs_edid_timing:
>    - shard-adlp:         NOTRUN -> [FAIL][144] ([Intel XE#1174])
>   [144]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_sysfs_edid_timing=2Ehtml
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>    - shard-lnl:          [PASS][145] -> [FAIL][146] ([Intel XE#899])
>   [145]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms_universal_plane@cursor-=
fb-leak@pipe-c-edp-1=2Ehtml
>   [146]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1=2Ehtml
>
>  * igt@kms_vrr@flipline:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#455]) +13 othe=
r tests skip
>   [147]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_vrr@flipline=2Ehtml
>
>  * igt@kms_vrr@lobf:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2168])
>   [148]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_vrr@lobf=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1499])
>   [149]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-8/igt@kms_vrr@lobf=2Ehtml
>
>  * igt@kms_writeback@writeback-fb-id:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#756])
>   [150]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_writeback@writeback-fb-id=2Ehtml
>
>  * igt@xe_copy_basic@mem-set-linear-0xfd:
>    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1126])
>   [151]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd=2Ehtml
>
>  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#3889])
>   [152]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters-userptr=2Ehtml
>
>  * igt@xe_eudebug@basic-vm-bind-discovery:
>    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2905])
>   [153]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery=2Ehtml
>
>  * igt@xe_eudebug@discovery-empty-clients:
>    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2905]) +6 othe=
r tests skip
>   [154]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-1/igt@xe_eudebug@discovery-empty-clients=2Ehtml
>
>  * igt@xe_eudebug@exec-queue-placements:
>    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2905]) +5 othe=
r tests skip
>   [155]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@xe_eudebug@exec-queue-placements=2Ehtml
>
>  * igt@xe_eudebug_online@preempt-breakpoint:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2905]) +8 othe=
r tests skip
>   [156]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint=2Ehtml
>
>  * igt@xe_evict@evict-beng-large-cm:
>    - shard-bmg:          [PASS][157] -> [DMESG-WARN][158] ([Intel XE#147=
3] / [Intel XE#4172])
>   [157]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@xe_evict@evict-beng-large-c=
m=2Ehtml
>   [158]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@xe_evict@evict-beng-large-cm=2Ehtml
>
>  * igt@xe_evict@evict-large-external:
>    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#688]) +2 other=
 tests skip
>   [159]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-4/igt@xe_evict@evict-large-external=2Ehtml
>
>  * igt@xe_evict@evict-small-external:
>    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#261] / [Intel =
XE#688]) +1 other test skip
>   [160]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-4/igt@xe_evict@evict-small-external=2Ehtml
>
>  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#688])
>   [161]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd=2Ehtm=
l
>
>  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1392]) +3 othe=
r tests skip
>   [162]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mm=
ap=2Ehtml
>
>  * igt@xe_exec_basic@multigpu-no-exec-basic:
>    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322])
>   [163]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic=2Ehtml
>
>  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>    - shard-dg2-set2:     [PASS][164] -> [SKIP][165] ([Intel XE#1392]) +5=
 other tests skip
>   [164]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@xe_exec_basic@multigpu-no=
-exec-null-defer-mmap=2Ehtml
>   [165]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=2Ehtml
>
>  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1392]) +4 othe=
r tests skip
>   [166]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate=2Ehtml
>
>  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1392])
>   [167]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind=2Ehtml
>
>  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#288]) +22 othe=
r tests skip
>   [168]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind=2Ehtml
>
>  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#288]) +12 othe=
r tests skip
>   [169]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr=2Ehtml
>
>  * igt@xe_exec_reset@cat-error:
>    - shard-adlp:         NOTRUN -> [DMESG-WARN][170] ([Intel XE#3868])
>   [170]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-6/igt@xe_exec_reset@cat-error=2Ehtml
>
>  * igt@xe_gt_freq@freq_suspend:
>    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#584]) +1 other=
 test skip
>   [171]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-1/igt@xe_gt_freq@freq_suspend=2Ehtml
>
>  * igt@xe_huc_copy@huc_copy:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#255])
>   [172]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@xe_huc_copy@huc_copy=2Ehtml
>
>  * igt@xe_mmap@pci-membarrier-bad-pagesize:
>    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#4045])
>   [173]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-2/igt@xe_mmap@pci-membarrier-bad-pagesize=2Ehtml
>
>  * igt@xe_oa@create-destroy-userspace-config:
>    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#2541] / [Intel=
 XE#3573]) +2 other tests skip
>   [174]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@xe_oa@create-destroy-userspace-config=2Ehtml
>    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#2541] / [Intel=
 XE#3573]) +5 other tests skip
>   [175]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_oa@create-destroy-userspace-config=2Ehtml
>
>  * igt@xe_pat@pat-index-xe2:
>    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#977])
>   [176]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-4/igt@xe_pat@pat-index-xe2=2Ehtml
>
>  * igt@xe_peer2peer@write:
>    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#1061])
>   [177]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-2/igt@xe_peer2peer@write=2Ehtml
>    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#1061])
>   [178]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-6/igt@xe_peer2peer@write=2Ehtml
>
>  * igt@xe_pm@s2idle-basic:
>    - shard-dg2-set2:     [PASS][179] -> [ABORT][180] ([Intel XE#1358] / =
[Intel XE#1794]) +2 other tests abort
>   [179]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@xe_pm@s2idle-basic=2Ehtml
>   [180]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_pm@s2idle-basic=2Ehtml
>
>  * igt@xe_pm@s3-mocs:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][181] ([Intel XE#1033] / =
[Intel XE#569])
>   [181]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@xe_pm@s3-mocs=2Ehtml
>
>  * igt@xe_pm@s3-vm-bind-userptr:
>    - shard-bmg:          [PASS][182] -> [DMESG-WARN][183] ([Intel XE#417=
2] / [Intel XE#569])
>   [182]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr=2E=
html
>   [183]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@xe_pm@s3-vm-bind-userptr=2Ehtml
>    - shard-dg2-set2:     [PASS][184] -> [DMESG-WARN][185] ([Intel XE#103=
3] / [Intel XE#569])
>   [184]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr=
=2Ehtml
>   [185]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@xe_pm@s3-vm-bind-userptr=2Ehtml
>
>  * igt@xe_pm@s4-multiple-execs:
>    - shard-lnl:          [PASS][186] -> [ABORT][187] ([Intel XE#1358] / =
[Intel XE#1607] / [Intel XE#1794])
>   [186]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-3/igt@xe_pm@s4-multiple-execs=2Eh=
tml
>   [187]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-2/igt@xe_pm@s4-multiple-execs=2Ehtml
>
>  * igt@xe_query@multigpu-query-config:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#944]) +2 other=
 tests skip
>   [188]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@xe_query@multigpu-query-config=2Ehtml
>
>  * igt@xe_wedged@wedged-at-any-timeout:
>    - shard-adlp:         [PASS][189] -> [DMESG-WARN][190] ([Intel XE#417=
3])
>   [189]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-2/igt@xe_wedged@wedged-at-any-ti=
meout=2Ehtml
>   [190]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-4/igt@xe_wedged@wedged-at-any-timeout=2Ehtml
>
> =20
>#### Possible fixes ####
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hd=
mi-a-1-y:
>    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#1033]) -> [PASS][1=
92] +7 other tests pass
>   [191]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y=2Ehtml
>   [192]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe=
-b-hdmi-a-1-y=2Ehtml
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-lin=
ear:
>    - shard-lnl:          [FAIL][193] ([Intel XE#911]) -> [PASS][194] +3 =
other tests pass
>   [193]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-4/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear=2Ehtml
>   [194]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1=
-linear=2Ehtml
>
>  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>    - shard-adlp:         [FAIL][195] ([Intel XE#3884]) -> [PASS][196] +1=
 other test pass
>   [195]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-2/igt@kms_async_flips@crc-atomic=
@pipe-d-hdmi-a-1=2Ehtml
>   [196]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1=2Ehtml
>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>    - shard-bmg:          [INCOMPLETE][197] ([Intel XE#3862]) -> [PASS][1=
98] +1 other test pass
>   [197]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-5/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs=2Ehtml
>   [198]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs=2Ehtml
>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>    - shard-dg2-set2:     [ABORT][199] ([Intel XE#2625]) -> [PASS][200]
>   [199]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-rc-ccs-cc=2Ehtml
>   [200]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc=2Ehtml
>
>  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>    - shard-bmg:          [SKIP][201] ([Intel XE#2291]) -> [PASS][202] +3=
 other tests pass
>   [201]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_cursor_legacy@cursora-v=
s-flipb-varying-size=2Ehtml
>   [202]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>    - shard-bmg:          [FAIL][203] ([Intel XE#3321]) -> [PASS][204] +2=
 other tests pass
>   [203]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ad-dp2-hdmi-a3=2Ehtml
>   [204]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-=
a3=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
>    - shard-bmg:          [DMESG-FAIL][205] ([Intel XE#4172]) -> [PASS][2=
06]
>   [205]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired=
-vblank@cd-dp2-hdmi-a3=2Ehtml
>   [206]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3=2Ehtml
>
>  * igt@kms_flip@2x-plain-flip:
>    - shard-bmg:          [SKIP][207] ([Intel XE#2316]) -> [PASS][208] +5=
 other tests pass
>   [207]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_flip@2x-plain-flip=2Eht=
ml
>   [208]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@kms_flip@2x-plain-flip=2Ehtml
>
>  * igt@kms_flip@busy-flip:
>    - shard-dg2-set2:     [DMESG-WARN][209] ([Intel XE#1033]) -> [PASS][2=
10] +31 other tests pass
>   [209]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-436/igt@kms_flip@busy-flip=2Ehtml
>   [210]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_flip@busy-flip=2Ehtml
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
>    - shard-dg2-set2:     [FAIL][211] ([Intel XE#301]) -> [PASS][212]
>   [211]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@kms_flip@flip-vs-expired-=
vblank-interruptible@d-hdmi-a6=2Ehtml
>   [212]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6=2Eh=
tml
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>    - shard-adlp:         [DMESG-WARN][213] ([Intel XE#2953]) -> [PASS][2=
14]
>   [213]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@kms_flip@flip-vs-suspend-i=
nterruptible@c-hdmi-a1=2Ehtml
>   [214]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1=2Ehtml
>
>  * igt@kms_flip@plain-flip-fb-recreate:
>    - shard-bmg:          [FAIL][215] ([Intel XE#2882]) -> [PASS][216] +2=
 other tests pass
>   [215]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_flip@plain-flip-fb-recr=
eate=2Ehtml
>   [216]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_flip@plain-flip-fb-recreate=2Ehtml
>
>  * igt@kms_flip@plain-flip-ts-check:
>    - shard-lnl:          [FAIL][217] ([Intel XE#3149] / [Intel XE#886]) =
-> [PASS][218]
>   [217]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms_flip@plain-flip-ts-chec=
k=2Ehtml
>   [218]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-1/igt@kms_flip@plain-flip-ts-check=2Ehtml
>
>  * igt@kms_flip@plain-flip-ts-check@c-edp1:
>    - shard-lnl:          [FAIL][219] ([Intel XE#886]) -> [PASS][220] +2 =
other tests pass
>   [219]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms_flip@plain-flip-ts-chec=
k@c-edp1=2Ehtml
>   [220]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1=2Ehtml
>
>  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>    - shard-adlp:         [DMESG-FAIL][221] ([Intel XE#1033]) -> [PASS][2=
22] +9 other tests pass
>   [221]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@kms_flip_tiling@flip-chang=
e-tiling@pipe-d-hdmi-a-1-y-to-y=2Ehtml
>   [222]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y=2E=
html
>
>  * igt@kms_joiner@basic-force-big-joiner:
>    - shard-bmg:          [SKIP][223] ([Intel XE#3012]) -> [PASS][224]
>   [223]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_joiner@basic-force-big-=
joiner=2Ehtml
>   [224]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_joiner@basic-force-big-joiner=2Ehtml
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc:
>    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#4172]) -> [PASS][2=
26] +72 other tests pass
>   [225]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_pipe_crc_basic@nonblock=
ing-crc=2Ehtml
>   [226]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc=2Ehtml
>
>  * igt@kms_plane@pixel-format-source-clamping:
>    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#1033] / [Intel XE#=
2566]) -> [PASS][228]
>   [227]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_plane@pixel-format-so=
urce-clamping=2Ehtml
>   [228]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@kms_plane@pixel-format-source-clamping=2Ehtml
>    - shard-bmg:          [DMESG-WARN][229] ([Intel XE#2566] / [Intel XE#=
4172]) -> [PASS][230]
>   [229]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_plane@pixel-format-sour=
ce-clamping=2Ehtml
>   [230]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-2/igt@kms_plane@pixel-format-source-clamping=2Ehtml
>
>  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>    - shard-bmg:          [SKIP][231] ([Intel XE#2571]) -> [PASS][232]
>   [231]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_plane_scaling@2x-scaler=
-multi-pipe=2Ehtml
>   [232]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe=2Ehtml
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>    - shard-lnl:          [FAIL][233] ([Intel XE#899]) -> [PASS][234]
>   [233]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms_universal_plane@cursor-=
fb-leak@pipe-b-edp-1=2Ehtml
>   [234]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1=2Ehtml
>
>  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1392]) -> [PASS][236] +3=
 other tests pass
>   [235]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@xe_exec_basic@multigpu-on=
ce-basic-defer-mmap=2Ehtml
>   [236]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap=2Ehtml
>
>  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>    - shard-adlp:         [DMESG-WARN][237] ([Intel XE#4173]) -> [PASS][2=
38] +2 other tests pass
>   [237]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-adlp-6/igt@xe_fault_injection@inject-=
fault-probe-function-xe_guc_ads_init=2Ehtml
>   [238]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_in=
it=2Ehtml
>
>  * igt@xe_pm@s3-d3hot-basic-exec:
>    - shard-bmg:          [DMESG-WARN][239] ([Intel XE#4172] / [Intel XE#=
569]) -> [PASS][240] +2 other tests pass
>   [239]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec=
=2Ehtml
>   [240]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec=2Ehtml
>
>  * igt@xe_pm@s4-basic:
>    - shard-lnl:          [ABORT][241] ([Intel XE#1358] / [Intel XE#1607]=
) -> [PASS][242]
>   [241]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-lnl-2/igt@xe_pm@s4-basic=2Ehtml
>   [242]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-lnl-5/igt@xe_pm@s4-basic=2Ehtml
>
>  * igt@xe_pm@s4-d3hot-basic-exec:
>    - shard-dg2-set2:     [ABORT][243] ([Intel XE#1358]) -> [PASS][244]
>   [243]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec=
=2Ehtml
>   [244]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec=2Ehtml
>
> =20
>#### Warnings ####
>
>  * igt@kms_content_protection@atomic:
>    - shard-bmg:          [SKIP][245] ([Intel XE#2341]) -> [FAIL][246] ([=
Intel XE#1178])
>   [245]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_content_protection@atom=
ic=2Ehtml
>   [246]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_content_protection@atomic=2Ehtml
>
>  * igt@kms_content_protection@atomic-dpms:
>    - shard-bmg:          [FAIL][247] ([Intel XE#1178]) -> [SKIP][248] ([=
Intel XE#2341])
>   [247]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_content_protection@atom=
ic-dpms=2Ehtml
>   [248]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_content_protection@atomic-dpms=2Ehtml
>
>  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-siz=
e:
>    - shard-bmg:          [SKIP][249] ([Intel XE#2291]) -> [DMESG-WARN][2=
50] ([Intel XE#4172]) +1 other test dmesg-warn
>   [249]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_cursor_legacy@cursora-v=
s-flipb-atomic-transitions-varying-size=2Ehtml
>   [250]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size=2Ehtml
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>    - shard-bmg:          [SKIP][251] ([Intel XE#2291]) -> [DMESG-WARN][2=
52] ([Intel XE#877])
>   [251]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_cursor_legacy@cursorb-v=
s-flipa-toggle=2Ehtml
>   [252]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank:
>    - shard-bmg:          [DMESG-FAIL][253] ([Intel XE#4172]) -> [FAIL][2=
54] ([Intel XE#3321])
>   [253]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired=
-vblank=2Ehtml
>   [254]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>    - shard-dg2-set2:     [DMESG-WARN][255] ([Intel XE#1033]) -> [FAIL][2=
56] ([Intel XE#301] / [Intel XE#3321])
>   [255]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_flip@2x-flip-vs-expir=
ed-vblank-interruptible@ab-hdmi-a6-dp4=2Ehtml
>   [256]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6=
-dp4=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>    - shard-dg2-set2:     [DMESG-FAIL][257] ([Intel XE#1033]) -> [FAIL][2=
58] ([Intel XE#301]) +1 other test fail
>   [257]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_flip@2x-flip-vs-expir=
ed-vblank-interruptible@cd-hdmi-a6-dp4=2Ehtml
>   [258]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6=
-dp4=2Ehtml
>
>  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>    - shard-bmg:          [SKIP][259] ([Intel XE#2316]) -> [DMESG-WARN][2=
60] ([Intel XE#4172])
>   [259]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend=
-interruptible=2Ehtml
>   [260]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible=2Ehtml
>
>  * igt@kms_flip@2x-nonexisting-fb-interruptible:
>    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#4172]) -> [SKIP][2=
62] ([Intel XE#2316])
>   [261]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb-=
interruptible=2Ehtml
>   [262]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible=2Ehtml
>
>  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
>    - shard-bmg:          [DMESG-WARN][263] ([Intel XE#4172]) -> [INCOMPL=
ETE][264] ([Intel XE#2049])
>   [263]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms_flip@blocking-absolute-=
wf_vblank-interruptible=2Ehtml
>   [264]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible=2Ehtml
>    - shard-dg2-set2:     [DMESG-WARN][265] ([Intel XE#1033]) -> [INCOMPL=
ETE][266] ([Intel XE#2049])
>   [265]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_flip@blocking-absolut=
e-wf_vblank-interruptible=2Ehtml
>   [266]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank-interruptible=2Ehtml
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>    - shard-dg2-set2:     [FAIL][267] ([Intel XE#301]) -> [DMESG-FAIL][26=
8] ([Intel XE#1033]) +1 other test dmesg-fail
>   [267]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@kms_flip@flip-vs-expired-=
vblank-interruptible@d-dp4=2Ehtml
>   [268]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4=2Ehtml
>
>  * igt@kms_flip@flip-vs-suspend:
>    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#2049] / [Intel XE#=
2597]) -> [DMESG-WARN][270] ([Intel XE#2955])
>   [269]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_flip@flip-vs-suspend=
=2Ehtml
>   [270]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-suspend=2Ehtml
>
>  * igt@kms_flip@flip-vs-suspend@d-dp4:
>    - shard-dg2-set2:     [INCOMPLETE][271] ([Intel XE#2049] / [Intel XE#=
2597]) -> [DMESG-WARN][272] ([Intel XE#1033])
>   [271]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@kms_flip@flip-vs-suspend@=
d-dp4=2Ehtml
>   [272]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>    - shard-bmg:          [SKIP][273] ([Intel XE#2311]) -> [SKIP][274] ([=
Intel XE#2312]) +13 other tests skip
>   [273]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-draw-blt=2Ehtml
>   [274]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt=
=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>    - shard-bmg:          [SKIP][275] ([Intel XE#2312]) -> [SKIP][276] ([=
Intel XE#2311]) +10 other tests skip
>   [275]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-pri-indfb-draw-mmap-wc=2Ehtml
>   [276]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap=
-wc=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([=
Intel XE#4141]) +6 other tests skip
>   [277]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-cur-indfb-draw-render=2Ehtml
>   [278]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-rende=
r=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>    - shard-bmg:          [SKIP][279] ([Intel XE#4141]) -> [SKIP][280] ([=
Intel XE#2312]) +6 other tests skip
>   [279]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-shrfb-msflip-blt=2Ehtml
>   [280]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt=2Eh=
tml
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>    - shard-bmg:          [SKIP][281] ([Intel XE#2313]) -> [SKIP][282] ([=
Intel XE#2312]) +12 other tests skip
>   [281]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-blt=2Ehtml
>   [282]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-bl=
t=2Ehtml
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>    - shard-bmg:          [SKIP][283] ([Intel XE#2312]) -> [SKIP][284] ([=
Intel XE#2313]) +11 other tests skip
>   [283]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-shrfb-plflip-blt=2Ehtml
>   [284]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=
=2Ehtml
>
>  * igt@kms_hdr@bpc-switch-suspend:
>    - shard-dg2-set2:     [DMESG-WARN][285] ([Intel XE#1033]) -> [ABORT][=
286] ([Intel XE#2625])
>   [285]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@kms_hdr@bpc-switch-suspen=
d=2Ehtml
>   [286]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@kms_hdr@bpc-switch-suspend=2Ehtml
>
>  * igt@kms_hdr@brightness-with-hdr:
>    - shard-bmg:          [SKIP][287] ([Intel XE#3374] / [Intel XE#3544])=
 -> [SKIP][288] ([Intel XE#3544])
>   [287]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms_hdr@brightness-with-hdr=
=2Ehtml
>   [288]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-6/igt@kms_hdr@brightness-with-hdr=2Ehtml
>
>  * igt@kms_plane@plane-panning-bottom-right-suspend:
>    - shard-dg2-set2:     [ABORT][289] ([Intel XE#1033] / [Intel XE#2625]=
) -> [DMESG-WARN][290] ([Intel XE#1033]) +1 other test dmesg-warn
>   [289]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@kms_plane@plane-panning-b=
ottom-right-suspend=2Ehtml
>   [290]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend=2Ehtml
>
>  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>    - shard-bmg:          [SKIP][291] ([Intel XE#2509]) -> [SKIP][292] ([=
Intel XE#2426])
>   [291]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium=2Ehtml
>   [292]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium=2Ehtml
>
>  * igt@xe_pm@s3-basic-exec:
>    - shard-dg2-set2:     [DMESG-WARN][293] ([Intel XE#1033] / [Intel XE#=
569]) -> [ABORT][294] ([Intel XE#1033] / [Intel XE#1358])
>   [293]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-2584-01f54d1da=
1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@xe_pm@s3-basic-exec=2Ehtm=
l
>   [294]: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/sh=
ard-dg2-432/igt@xe_pm@s3-basic-exec=2Ehtml
>
> =20
>  [Intel XE#1033]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1033
>  [Intel XE#1061]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1061
>  [Intel XE#1124]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1124
>  [Intel XE#1126]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1126
>  [Intel XE#1127]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1127
>  [Intel XE#1158]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1158
>  [Intel XE#1174]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1174
>  [Intel XE#1178]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1178
>  [Intel XE#1358]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1358
>  [Intel XE#1392]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1392
>  [Intel XE#1401]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1401
>  [Intel XE#1406]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1406
>  [Intel XE#1407]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1407
>  [Intel XE#1421]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1421
>  [Intel XE#1424]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1424
>  [Intel XE#1435]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1435
>  [Intel XE#1469]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1469
>  [Intel XE#1473]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1473
>  [Intel XE#1489]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1489
>  [Intel XE#1499]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1499
>  [Intel XE#1504]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1504
>  [Intel XE#1512]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1512
>  [Intel XE#1607]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1607
>  [Intel XE#1727]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1727
>  [Intel XE#1745]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1745
>  [Intel XE#1794]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/1794
>  [Intel XE#2042]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2042
>  [Intel XE#2049]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2049
>  [Intel XE#2168]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2168
>  [Intel XE#2191]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2191
>  [Intel XE#2234]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2234
>  [Intel XE#2291]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2291
>  [Intel XE#2311]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2311
>  [Intel XE#2312]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2312
>  [Intel XE#2313]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2313
>  [Intel XE#2316]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2316
>  [Intel XE#2321]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2321
>  [Intel XE#2322]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2322
>  [Intel XE#2341]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2341
>  [Intel XE#2426]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2426
>  [Intel XE#2486]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2486
>  [Intel XE#2509]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2509
>  [Intel XE#2541]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2541
>  [Intel XE#255]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/255
>  [Intel XE#2566]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2566
>  [Intel XE#2571]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2571
>  [Intel XE#2597]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2597
>  [Intel XE#261]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/261
>  [Intel XE#2625]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2625
>  [Intel XE#2763]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2763
>  [Intel XE#2850]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2850
>  [Intel XE#288]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/288
>  [Intel XE#2882]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2882
>  [Intel XE#2883]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2883
>  [Intel XE#2887]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2887
>  [Intel XE#2893]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2893
>  [Intel XE#2905]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2905
>  [Intel XE#2907]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2907
>  [Intel XE#2925]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2925
>  [Intel XE#2939]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2939
>  [Intel XE#2953]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2953
>  [Intel XE#2955]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2955
>  [Intel XE#301]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/301
>  [Intel XE#3012]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3012
>  [Intel XE#306]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/306
>  [Intel XE#307]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/307
>  [Intel XE#3070]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3070
>  [Intel XE#308]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/308
>  [Intel XE#309]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/309
>  [Intel XE#310]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/310
>  [Intel XE#3113]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3113
>  [Intel XE#3124]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3124
>  [Intel XE#3149]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3149
>  [Intel XE#316]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/316
>  [Intel XE#323]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/323
>  [Intel XE#324]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/324
>  [Intel XE#3278]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3278
>  [Intel XE#3321]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3321
>  [Intel XE#3374]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3374
>  [Intel XE#3414]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3414
>  [Intel XE#3432]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3432
>  [Intel XE#3442]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3442
>  [Intel XE#346]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/346
>  [Intel XE#3544]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3544
>  [Intel XE#3573]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3573
>  [Intel XE#3658]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3658
>  [Intel XE#367]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/367
>  [Intel XE#373]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/373
>  [Intel XE#3862]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3862
>  [Intel XE#3868]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3868
>  [Intel XE#3884]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3884
>  [Intel XE#3889]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3889
>  [Intel XE#3904]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/3904
>  [Intel XE#4010]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4010
>  [Intel XE#4045]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4045
>  [Intel XE#4048]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4048
>  [Intel XE#4080]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4080
>  [Intel XE#4141]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4141
>  [Intel XE#4172]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4172
>  [Intel XE#4173]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4173
>  [Intel XE#455]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/455
>  [Intel XE#569]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/569
>  [Intel XE#584]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/584
>  [Intel XE#599]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/599
>  [Intel XE#610]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/610
>  [Intel XE#616]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/616
>  [Intel XE#651]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/651
>  [Intel XE#653]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/653
>  [Intel XE#656]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/656
>  [Intel XE#658]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/658
>  [Intel XE#688]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/688
>  [Intel XE#701]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/701
>  [Intel XE#756]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/756
>  [Intel XE#787]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/787
>  [Intel XE#870]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/870
>  [Intel XE#877]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/877
>  [Intel XE#886]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/886
>  [Intel XE#899]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/899
>  [Intel XE#908]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/908
>  [Intel XE#911]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/911
>  [Intel XE#929]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/929
>  [Intel XE#944]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/944
>  [Intel XE#977]: https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/977
>
>
>Build changes
>-------------
>
>  * IGT: IGT_8219 -> IGT_8220
>  * Linux: xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939 -> xe-pw-1442=
29v1
>
>  IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab=2Ef=
reedesktop=2Eorg/drm/igt-gpu-tools=2Egit
>  IGT_8220: 8220
>  xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939: 01f54d1da1ffffff78047=
186f62b5916dfd43939
>  xe-pw-144229v1: 144229v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw=
-144229v1/index=2Ehtml

------YRFGTWRIA7Z16RUYW3UF2P7WKRGEGM
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html xmlns=3D"http://www=2Ew3=2Eorg/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"=
>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body><div dir=3D"auto">I don't think these failures have anything to do w=
ith the series=2E They seem to be related to sound support=2E<br><br>~~ Lin=
a</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">On February 2, =
2025 5:12:17 PM GMT+01:00, Patchwork &lt;patchwork@emeril=2Efreedesktop=2Eo=
rg&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0=
pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">



<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>drm/gpuvm: Add support for single-pa=
ge-filled mappings</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork=2Efreedesktop=2Eo=
rg/series/144229/">https://patchwork=2Efreedesktop=2Eorg/series/144229/</a>=
</td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/index=2Ehtml">https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/index=2Ehtml</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from xe-2584-01f54d1da1ffffff78047186f62b5916=
dfd43939_full -&gt; xe-pw-144229v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144229v1_full absolutely need=
 to be<br>
  verified manually=2E</p>
<p>If you think the reported changes have nothing to do with the changes<b=
r>
  introduced in xe-pw-144229v1_full, please notify your bug team (I915-ci-=
infra@lists=2Efreedesktop=2Eorg) to allow them<br>
  to document this new failure mode, which will reduce false positives in =
CI=2E</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144=
229v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@c=
ore_hotunplug@hotunplug-rescan=2Ehtml">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-434/igt@core_h=
otunplug@hotunplug-rescan=2Ehtml">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms=
_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1=2Ehtml">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1=2Ehtml">INC=
OMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_pm_rpm@basic-pci-d3-state=2Ehtml">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_pm_r=
pm@basic-pci-d3-state=2Ehtml">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=2Ehtml">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/=
xe-pw-144229v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc=
-ccs=2Ehtml">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144229v1_full that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@kms_big_fb@4-tiled-16bp=
p-rotate-270=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eor=
g/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-=
hw-stride-32bpp-rotate-180-hflip-async-flip=2Ehtml">SKIP</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3658">Intel XE#3658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max=
-hw-stride-64bpp-rotate-0=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efre=
edesktop=2Eorg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32b=
pp-rotate-90=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eor=
g/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_big_fb@y-tiled-ad=
dfb-size-overflow=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-4/igt@km=
s_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip=2Ehtml">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v=
1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-fl=
ip=2Ehtml">DMESG-FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-3=
2bpp-rotate-180=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max=
-hw-stride-64bpp-rotate-0-async-flip=2Ehtml">SKIP</a> (<a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_bw@connected-linear=
-tiling-2-displays-2160x1440p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_bw@connected-line=
ar-tiling-4-displays-1920x1080p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other=
 test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_bw@connected-linear=
-tiling-4-displays-1920x1080p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_bw@connected-linea=
r-tiling-4-displays-3840x2160p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_bw@linear-tiling-=
3-displays-2160x1440p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedes=
ktop=2Eorg/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-=
displays-2160x1440p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskt=
op=2Eorg/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li=
>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@kms_bw@linear-tiling-3=
-displays-2560x1440p=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesk=
top=2Eorg/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@kms_ccs@crc-primary-bas=
ic-4-tiled-dg2-rc-ccs-cc=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efree=
desktop=2Eorg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_ccs@crc-primary-s=
uspend-4-tiled-lnl-ccs=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreede=
sktop=2Eorg/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_ccs@crc-primary-sus=
pend-y-tiled-gen12-rc-ccs-cc=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2E=
freedesktop=2Eorg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_ccs@crc-primary-su=
spend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1=2Ehtml">SKIP</a> (<a href=3D"=
https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_ccs@crc-sprite-pl=
anes-basic-4-tiled-lnl-ccs=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_ccs@crc-sprite-pl=
anes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=2Ehtml">SKIP</a> (<a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-2/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1=2Ehtml">SKIP</a> (<a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/787">Inte=
l XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-rc-ccs=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Ef=
reedesktop=2Eorg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3124">Intel XE#3124=
</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4=
010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=2Ehtml">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-=
463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=2Ehtml">INCOMPLETE</a=
> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab=2Efreedesk=
top=2Eorg/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4=2Ehtml">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v=
1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp=
-4=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/dr=
m/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6=2Ehtml">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144=
229v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-=
b-hdmi-a-6=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-rc-ccs@pipe-c-dp-4=2Ehtml">INCOMPLETE</a> (<a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3124">Intel XE#3124</a> /=
 <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4010">I=
ntel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6=2Ehtml">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1727">Intel XE#1727</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_ccs@random-ccs-da=
ta-yf-tiled-ccs@pipe-d-dp-4=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Ef=
reedesktop=2Eorg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/787">Intel XE#787</a>=
) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_chamelium_color@c=
tm-limited-range=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_chamelium_hpd@vga=
-hpd=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-h=
pd=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_chamelium_hpd@vga-=
hpd-after-suspend=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-8/igt@kms_content_protection@=
atomic@pipe-a-dp-2=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_content_protection=
@dp-mst-lic-type-1=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_content_protection@=
dp-mst-lic-type-1=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-3/igt@kms_content_protection@=
srm=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/=
kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_content_protectio=
n@srm@pipe-a-dp-4=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-2/igt@kms_cursor_crc@cursor-=
offscreen-max-size=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li=
>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_cursor_crc@cursor-o=
ffscreen-max-size=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_cursor_crc@cursor=
-onscreen-128x42@pipe-d-hdmi-a-6=2Ehtml">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +=
17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_cursor_crc@cursor=
-onscreen-512x512=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-1/igt@kms_cursor_crc@cursor-o=
nscreen-512x512=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_cursor_crc@cursor-=
onscreen-512x512=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_cursor_legacy@bas=
ic-busy-flip-before-cursor-varying-size=2Ehtml">SKIP</a> (<a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/323">Intel XE#323</a>)</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-varying-size=2Ehtml">SKIP</a> (<a href=3D"https://=
gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_cursor_legacy@curso=
rb-vs-flipa-atomic-transitions=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@kms_cursor_legacy@curs=
orb-vs-flipa-legacy=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskt=
op=2Eorg/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li=
>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size=2Ehtml">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-=
144229v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transiti=
ons-varying-size=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-2/igt@kms_dp_linktrain_fallb=
ack@dp-fallback=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-6/igt@kms_dp_linktrain_fallba=
ck@dp-fallback=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_feature_discovery=
@chamelium=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/=
drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_feature_discovery@c=
hamelium=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/dr=
m/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dp=
ms=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmf=
b-interruptible=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible@cd-dp2-hdmi-a3=2Ehtml">DMESG-WARN</a> (<a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-w=
f_vblank@ad-hdmi-a6-dp4=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_flip@2x-nonexisting-fb=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-6/igt@kms_flip@2x-non=
existing-fb=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a6=2Ehtml">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-1442=
29v1/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a=
-hdmi-a6=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms=
_flip@blocking-absolute-wf_vblank-interruptible@c-dp2=2Ehtml">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/s=
hard-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2=2Eh=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_flip@bo-too-big-int=
erruptible@a-edp1=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreed=
esktop=2Eorg/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-expi=
red-vblank@a-dp4=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-expi=
red-vblank@b-hdmi-a6=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedesk=
top=2Eorg/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_flip@flip-vs-expired-vblank@d-hdmi-a3=2Ehtml">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@=
kms_flip@flip-vs-expired-vblank@d-hdmi-a3=2Ehtml">FAIL</a> (<a href=3D"http=
s://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-8/igt@km=
s_flip@flip-vs-suspend@d-hdmi-a1=2Ehtml">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_f=
lip@flip-vs-suspend@d-hdmi-a1=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-8/igt@kms=
_flip@wf_vblank-ts-check@a-edp1=2Ehtml">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-1/igt@kms_fli=
p@wf_vblank-ts-check@a-edp1=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Ef=
reedesktop=2Eorg/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downsca=
ling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-6/igt@kms_flip_scaled_crc@fli=
p-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling=2Ehtml">SKIP</a> (<a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1401">Intel XE#=
1401</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issu=
es/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downsca=
ling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-6/igt@kms_flip_scaled_crc@fli=
p-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode=2Ehtml=
">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/iss=
ues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p=
>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@k=
ms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling=2Ehtml">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-1=
44229v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-li=
near-upscaling=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesk=
top=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +59 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-8/igt@km=
s_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-=
mode=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree=
/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-downscaling@pipe-a-valid-mode=2Ehtml">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel=
/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_frontbuffer_track=
ing@drrs-1p-primscrn-cur-indfb-onoff=2Ehtml">SKIP</a> (<a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_frontbuffer_trackin=
g@drrs-1p-primscrn-indfb-plflip-blt=2Ehtml">SKIP</a> (<a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 oth=
er tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_frontbuffer_tracki=
ng@drrs-1p-primscrn-indfb-plflip-blt=2Ehtml">SKIP</a> (<a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_frontbuffer_tracki=
ng@drrs-2p-pri-indfb-multidraw=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-pri-shrfb-draw-blt=2Ehtml">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p=
>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-spr-indfb-draw-mmap-wc=2Ehtml">SKIP</a> (<a href=3D"https=
://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/656">Intel XE#656</a>) +=
21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbc-stridechange=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_frontbuffer_track=
ing@fbc-tiling-y=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@kms_frontbuffer_trackin=
g@fbc-tiling-y=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc=2Ehtml">SKIP</a> (<a href=3D"h=
ttps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2312">Intel XE#2312<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcdrrs-modesetfrombusy=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efre=
edesktop=2Eorg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_frontbuffer_tracki=
ng@fbcpsr-indfb-scaledprimary=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@kms_frontbuffer_tracki=
ng@plane-fbc-rte=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-pgflip-blt=2Ehtml">SKIP</a> (<a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-cur-indfb-move=2Ehtml">SKIP</a> (<a href=3D"https://gitla=
b=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_hdr@bpc-switch-su=
spend@pipe-a-dp-2=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4048">Intel XE#4048</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_joiner@basic-big-j=
oiner=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/x=
e/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_joiner@basic-big-=
joiner=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/=
xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_joiner@basic-big-jo=
iner=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-434/igt@kms_joiner@basic-forc=
e-ultra-joiner=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-7/igt@kms=
_joiner@invalid-modeset-force-big-joiner=2Ehtml">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-6/ig=
t@kms_joiner@invalid-modeset-force-big-joiner=2Ehtml">SKIP</a> (<a href=3D"=
https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3012">Intel XE#3012=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@kms_panel_fitting@atomi=
c-fastset=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/d=
rm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_pipe_crc_basic@suspend-read-crc=2Ehtml">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@km=
s_pipe_crc_basic@suspend-read-crc=2Ehtml">ABORT</a> (<a href=3D"https://git=
lab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a h=
ref=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4080">Intel =
XE#4080</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_pipe_crc_basic@su=
spend-read-crc@pipe-d-hdmi-a-2=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4080">Intel XE#=
4080</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2=2Ehtml">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2=2Ehtml">DME=
SG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/is=
sues/4172">Intel XE#4172</a>) +41 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_plane_cursor@view=
port=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe=
/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-5/igt@kms_plane_lowres@tiling=
-y=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@kms_plane_scaling@plane=
-downscale-factor-0-25-with-modifiers@pipe-a=2Ehtml">SKIP</a> (<a href=3D"h=
ttps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2763">Intel XE#2763<=
/a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-434/igt@kms_plane_scaling@pla=
nes-unity-scaling-downscale-factor-0-25@pipe-d=2Ehtml">SKIP</a> (<a href=3D=
"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2763">Intel XE#276=
3</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-25@pipe-b=2Ehtml">SKIP</a> (<a href=3D=
"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-7/igt@kms_pm_backlight@fade-w=
ith-suspend=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc=
=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_pm_rpm@system-sus=
pend-modeset=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-ov=
erlay-plane-update-continuous-sf=2Ehtml">SKIP</a> (<a href=3D"https://gitla=
b=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cu=
rsor-plane-move-continuous-sf=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-o=
verlay-plane-update-sf-dmg-area=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-=
primary-update-sf-dmg-area=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_psr@fbc-pr-sprite-=
plane-onoff=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_psr@pr-basic=2Eht=
ml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=2Efreedesktop=2Eo=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-7/igt@kms_psr@pr-basic=2Ehtml=
">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-8/igt@kms_psr@psr2-sprite-blt=
=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@kms_psr_stress_test@in=
validate-primary-flip-overlay=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_psr_stress_test@i=
nvalidate-primary-flip-overlay=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@kms_rotation_crc@primar=
y-4-tiled-reflect-x-0=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedes=
ktop=2Eorg/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3904">Intel XE#3904</a>)<=
/li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_rotation_crc@prima=
ry-4-tiled-reflect-x-0=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreede=
sktop=2Eorg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-434/igt@kms_rotation_crc@prim=
ary-rotation-90=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li=
>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-5/igt@kms=
_setmode@basic=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@kms_setmode@basic=2Ehtm=
l">FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/is=
sues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_setmode@invalid-clo=
ne-single-crtc=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@kms_sysfs_edid_timing=
=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms=
_universal_plane@cursor-fb-leak@pipe-c-edp-1=2Ehtml">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-=
6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1=2Ehtml">FAIL</a> (<a =
href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/899">Intel =
XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@kms_vrr@flipline=2Eht=
ml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_vrr@lobf=2Ehtml">=
SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/2168">Intel XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@kms_vrr@lobf=2Ehtml">SK=
IP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/=
1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_writeback@writeba=
ck-fb-id=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@xe_copy_basic@mem-set-=
linear-0xfd=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@xe_eudebug@basic-vm-a=
ccess-parameters-userptr=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efree=
desktop=2Eorg/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bin=
d-discovery=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-1/igt@xe_eudebug@discovery-em=
pty-clients=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@exec-queue-placements:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@xe_eudebug@exec-queue-=
placements=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@xe_eudebug_online@pre=
empt-breakpoint=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@xe_=
evict@evict-beng-large-cm=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@xe_evict@evic=
t-beng-large-cm=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedes=
ktop=2Eorg/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https:=
//gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-4/igt@xe_evict@evict-large-ex=
ternal=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/=
xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@xe_evict@evict-small-e=
xternal=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm=
/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab=2Efreed=
esktop=2Eorg/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@xe_evict_ccs@evict-ove=
rcommit-standalone-nofree-samefd=2Ehtml">SKIP</a> (<a href=3D"https://gitla=
b=2Efreedesktop=2Eorg/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@xe_exec_basic@multigpu=
-many-execqueues-many-vm-null-defer-mmap=2Ehtml">SKIP</a> (<a href=3D"https=
://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-6/igt@xe_exec_basic@multigpu-=
no-exec-basic=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eo=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@x=
e_exec_basic@multigpu-no-exec-null-defer-mmap=2Ehtml">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2=
-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=2Ehtml">SKIP</a> (<=
a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1392">Int=
el XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-8/igt@xe_exec_basic@multigpu-=
no-exec-userptr-invalidate=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@xe_exec_basic@multigp=
u-once-null-defer-bind=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreede=
sktop=2Eorg/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@xe_exec_fault_mode@on=
ce-bindexecqueue-rebind=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreed=
esktop=2Eorg/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@xe_exec_fault_mode@onc=
e-bindexecqueue-userptr=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreed=
esktop=2Eorg/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-6/igt@xe_exec_reset@cat-erro=
r=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm=
/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-1/igt@xe_gt_freq@freq_suspend=
=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@xe_huc_copy@huc_copy=
=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-2/igt@xe_mmap@pci-membarrier-=
bad-pagesize=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eor=
g/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-3/igt@xe_oa@create-destroy-u=
serspace-config=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 o=
ther tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@xe_oa@create-destroy-=
userspace-config=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@xe_pat@pat-index-xe2=
=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-2/igt@xe_peer2peer@write=2Eh=
tml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-6/igt@xe_peer2peer@write=2Eht=
ml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@x=
e_pm@s2idle-basic=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=2E=
01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432/igt@xe_pm@s2idle-basic=
=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/ke=
rnel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=2Efreedeskt=
op=2Eorg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +2 other tests abort=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@xe_pm@s3-mocs=2Ehtml"=
>DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@xe_=
pm@s3-vm-bind-userptr=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-7/igt@xe_pm@s3-vm-bind-=
userptr=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eo=
rg/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@x=
e_pm@s3-vm-bind-userptr=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@xe_pm@s3-vm-b=
ind-userptr=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-3/igt@xe_=
pm@s4-multiple-execs=2Ehtml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-lnl-2/igt@xe_pm@s4-multiple-=
execs=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=2Efree=
desktop=2Eorg/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"htt=
ps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=2E01=
=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@xe_query@multigpu-que=
ry-config=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/d=
rm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-2/igt@xe=
_wedged@wedged-at-any-timeout=2Ehtml">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@xe_wedge=
d@wedged-at-any-timeout=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi=
-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@km=
s_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y=2Eh=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/k=
ernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=
=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-adlp-4/igt@kms_async_flips@a=
sync-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y=2Ehtml">PASS</a> +=
7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linea=
r:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-4/igt@kms=
_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=2Ehtml">F=
AIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/911">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tr=
ee/intel-xe/xe-pw-144229v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-a-edp-1-linear=2Ehtml">PASS</a> +3 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-2/igt@km=
s_async_flips@crc-atomic@pipe-d-hdmi-a-1=2Ehtml">FAIL</a> (<a href=3D"https=
://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3884">Intel XE#3884</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-14422=
9v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1=2Ehtml">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-5/igt@kms=
_ccs@crc-primary-suspend-4-tiled-bmg-ccs=2Ehtml">INCOMPLETE</a> (<a href=3D=
"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3862">Intel XE#386=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw=
-144229v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs=2Ehtm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@k=
ms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc=2Ehtml">ABORT</a> (<a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2625">Intel XE#=
2625</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe=
-pw-144229v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-c=
cs-cc=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_cursor_legacy@cursora-vs-flipb-varying-size=2Ehtml">SKIP</a> (<a href=3D"h=
ttps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2291">Intel XE#2291<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-1=
44229v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size=2Eh=
tml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p=
>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3=2Ehtml">FAIL</=
a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3321=
">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/=
intel-xe/xe-pw-144229v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-=
interruptible@ad-dp2-hdmi-a3=2Ehtml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3=2Ehtml">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel =
XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe=
/xe-pw-144229v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-h=
dmi-a3=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_flip@2x-plain-flip=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedeskt=
op=2Eorg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-2/igt@k=
ms_flip@2x-plain-flip=2Ehtml">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-436/igt@k=
ms_flip@busy-flip=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreed=
esktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D=
"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-432=
/igt@kms_flip@busy-flip=2Ehtml">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6=2Ehtml">FAIL</a> (<a=
 href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/301">Intel=
 XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe=
/xe-pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@d-hdmi-a6=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@km=
s_flip@flip-vs-suspend-interruptible@c-hdmi-a1=2Ehtml">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2953">Intel =
XE#2953</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe=
/xe-pw-144229v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@c-h=
dmi-a1=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_flip@plain-flip-fb-recreate=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2E=
freedesktop=2Eorg/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bm=
g-7/igt@kms_flip@plain-flip-fb-recreate=2Ehtml">PASS</a> +2 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms=
_flip@plain-flip-ts-check=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=2Efre=
edesktop=2Eorg/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/886">Intel XE#886</a>=
) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-1442=
29v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms=
_flip@plain-flip-ts-check@c-edp1=2Ehtml">FAIL</a> (<a href=3D"https://gitla=
b=2Efreedesktop=2Eorg/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a =
href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-=
lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1=2Ehtml">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-3/igt@km=
s_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y=2Ehtml">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/103=
3">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree=
/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tilin=
g@pipe-d-hdmi-a-1-y-to-y=2Ehtml">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_joiner@basic-force-big-joiner=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-bmg-7/igt@kms_joiner@basic-force-big-joiner=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_pipe_crc_basic@nonblocking-crc=2Ehtml">DMESG-WARN</a> (<a href=3D"https://=
gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&=
gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1=
/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc=2Ehtml">PASS</a> +72 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_plane@pixel-format-source-clamping=2Ehtml">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</=
a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/256=
6">Intel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree=
/intel-xe/xe-pw-144229v1/shard-dg2-436/igt@kms_plane@pixel-format-source-cl=
amping=2Ehtml">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_plane@pixel-format-source-clamping=2Ehtml">DMESG-WARN</a> (<a href=3D"http=
s://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2566">Intel XE#2566</a>=
 / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172"=
>Intel XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/i=
ntel-xe/xe-pw-144229v1/shard-bmg-2/igt@kms_plane@pixel-format-source-clampi=
ng=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_plane_scaling@2x-scaler-multi-pipe=2Ehtml">SKIP</a> (<a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt=
; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/s=
hard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-7/igt@kms=
_universal_plane@cursor-fb-leak@pipe-b-edp-1=2Ehtml">FAIL</a> (<a href=3D"h=
ttps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/899">Intel XE#899</a=
>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144=
229v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1=2Ehtm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@x=
e_exec_basic@multigpu-once-basic-defer-mmap=2Ehtml">SKIP</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1392">Intel XE#1392</=
a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-14=
4229v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap=2Ehtm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-adlp-6/igt@xe=
_fault_injection@inject-fault-probe-function-xe_guc_ads_init=2Ehtml">DMESG-=
WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg=
/tree/intel-xe/xe-pw-144229v1/shard-adlp-8/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_guc_ads_init=2Ehtml">PASS</a> +2 other tests pass</li=
>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@xe_=
pm@s3-d3hot-basic-exec=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2E=
freedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D=
"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/569">Intel XE#569<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-1=
44229v1/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec=2Ehtml">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-lnl-2/igt@xe_=
pm@s4-basic=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eor=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-lnl-5/igt@xe_pm@s4-basic=2Ehtml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@x=
e_pm@s4-d3hot-basic-exec=2Ehtml">ABORT</a> (<a href=3D"https://gitlab=2Efre=
edesktop=2Eorg/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=
=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-dg2-=
436/igt@xe_pm@s4-d3hot-basic-exec=2Ehtml">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_content_protection@atomic=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=
=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard-bmg-=
8/igt@kms_content_protection@atomic=2Ehtml">FAIL</a> (<a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_content_protection@atomic-dpms=2Ehtml">FAIL</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-bmg-6/igt@kms_content_protection@atomic-dpms=2Ehtml">SKIP</a> (<a href=3D"=
https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2341">Intel XE#2341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size=2Ehtml">SKI=
P</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tr=
ee/intel-xe/xe-pw-144229v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size=2Ehtml">DMESG-WARN</a> (<a href=3D"https=
://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_cursor_legacy@cursorb-vs-flipa-toggle=2Ehtml">SKIP</a> (<a href=3D"https:/=
/gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -=
&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v=
1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle=2Ehtml">DMESG-W=
ARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank=2Ehtml">DMESG-FAIL</a> (<a href=3D"https://=
gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&=
gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1=
/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank=2Ehtml">FAIL</a> (<a hr=
ef=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3321">Intel X=
E#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p=
>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4=2Ehtml">DMES=
G-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eo=
rg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expir=
ed-vblank-interruptible@ab-hdmi-a6-dp4=2Ehtml">FAIL</a> (<a href=3D"https:/=
/gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3321">Inte=
l XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p=
>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4=2Ehtml">DMES=
G-FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eo=
rg/tree/intel-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expir=
ed-vblank-interruptible@cd-hdmi-a6-dp4=2Ehtml">FAIL</a> (<a href=3D"https:/=
/gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_flip@2x-flip-vs-suspend-interruptible=2Ehtml">SKIP</a> (<a href=3D"https:/=
/gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -=
&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v=
1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible=2Ehtml">DMESG-W=
ARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues=
/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms=
_flip@2x-nonexisting-fb-interruptible=2Ehtml">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel XE#4172</=
a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-14=
4229v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible=2Ehtml">SKI=
P</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-4/igt@kms=
_flip@blocking-absolute-wf_vblank-interruptible=2Ehtml">DMESG-WARN</a> (<a =
href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4172">Intel=
 XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-x=
e/xe-pw-144229v1/shard-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank-inter=
ruptible=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreedesktop=2E=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_flip@blocking-absolute-wf_vblank-interruptible=2Ehtml">DMESG-WARN</a> (<=
a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Int=
el XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel=
-xe/xe-pw-144229v1/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank-i=
nterruptible=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=2Efreedeskto=
p=2Eorg/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-434/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@d-dp4=2Ehtml">FAIL</a> (<a hre=
f=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/301">Intel XE#=
301</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-=
pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@d-dp4=2Ehtml">DMESG-FAIL</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eor=
g/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_flip@flip-vs-suspend=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2597">Intel XE#=
2597</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe=
-pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend=2Ehtml">DMESG-WARN<=
/a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/295=
5">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@k=
ms_flip@flip-vs-suspend@d-dp4=2Ehtml">INCOMPLETE</a> (<a href=3D"https://gi=
tlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a =
href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2597">Intel=
 XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-x=
e/xe-pw-144229v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4=2Ehtml">D=
MESG-WARN</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/=
issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt=2Ehtml">SKIP</a> =
(<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2311">I=
ntel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/int=
el-xe/xe-pw-144229v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-prims=
crn-cur-indfb-draw-blt=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreede=
sktop=2Eorg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc=2Ehtml">SKIP<=
/a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/231=
2">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree=
/intel-xe/xe-pw-144229v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-s=
cndscrn-pri-indfb-draw-mmap-wc=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render=2Ehtml">SKIP</a=
> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/i=
ntel-xe/xe-pw-144229v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-cur-indfb-draw-render=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt=2Ehtml">SKIP</a> (<a=
 href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/4141">Inte=
l XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-=
xe/xe-pw-144229v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
shrfb-msflip-blt=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=
=2Eorg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-2/igt@kms=
_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt=2Ehtml">SKIP</a=
> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/i=
ntel-xe/xe-pw-144229v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-p=
rimscrn-spr-indfb-draw-blt=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efr=
eedesktop=2Eorg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-6/igt@kms=
_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=2Ehtml">SKIP</a> =
(<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2312">I=
ntel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/int=
el-xe/xe-pw-144229v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scn=
dscrn-shrfb-plflip-blt=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreede=
sktop=2Eorg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-466/igt@k=
ms_hdr@bpc-switch-suspend=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=
=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144229v1/shard=
-dg2-432/igt@kms_hdr@bpc-switch-suspend=2Ehtml">ABORT</a> (<a href=3D"https=
://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2625">Intel XE#2625</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-8/igt@kms=
_hdr@brightness-with-hdr=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efree=
desktop=2Eorg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"htt=
ps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3544">Intel XE#3544</a=
>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-144=
229v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr=2Ehtml">SKIP</a> (<a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/3544">Intel XE#=
3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-432/igt@k=
ms_plane@plane-panning-bottom-right-suspend=2Ehtml">ABORT</a> (<a href=3D"h=
ttps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033<=
/a> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/26=
25">Intel XE#2625</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tre=
e/intel-xe/xe-pw-144229v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-=
right-suspend=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efreedeskt=
op=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-bmg-1/igt@kms=
_tiled_display@basic-test-pattern-with-chamelium=2Ehtml">SKIP</a> (<a href=
=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/2509">Intel XE#=
2509</a>) -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe=
-pw-144229v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium=2Ehtml">SKIP</a> (<a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/x=
e/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/in=
tel-xe/xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939/shard-dg2-463/igt@x=
e_pm@s3-basic-exec=2Ehtml">DMESG-WARN</a> (<a href=3D"https://gitlab=2Efree=
desktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"htt=
ps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/569">Intel XE#569</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci=2E01=2Eorg/tree/intel-xe/xe-pw-14422=
9v1/shard-dg2-432/igt@xe_pm@s3-basic-exec=2Ehtml">ABORT</a> (<a href=3D"htt=
ps://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1033">Intel XE#1033</a=
> / <a href=3D"https://gitlab=2Efreedesktop=2Eorg/drm/xe/kernel/issues/1358=
">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8219 -&gt; IGT_8220</li>
<li>Linux: xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939 -&gt; xe-pw-14=
4229v1</li>
</ul>
<p>IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab=2Ef=
reedesktop=2Eorg/drm/igt-gpu-tools=2Egit<br>
  IGT_8220: 8220<br>
  xe-2584-01f54d1da1ffffff78047186f62b5916dfd43939: 01f54d1da1ffffff780471=
86f62b5916dfd43939<br>
  xe-pw-144229v1: 144229v1</p>

</blockquote></div></body>
</html>

------YRFGTWRIA7Z16RUYW3UF2P7WKRGEGM--
