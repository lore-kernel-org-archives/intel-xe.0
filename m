Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA7CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 23:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACCD10EABD;
	Thu, 16 Oct 2025 23:29:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26710EABD;
 Thu, 16 Oct 2025 23:29:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4100067888898341500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_Xe3p_support?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 23:29:12 -0000
Message-ID: <176065735244.24656.1243822019806469932@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4100067888898341500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: drm/xe: Add Xe3p support (rev2)
URL   : https://patchwork.freedesktop.org/series/155866/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8_=
FULL -> xe-pw-155866v2_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155866v2_FULL absolutely need t=
o be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155866v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in C=
I.

 =20

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-15586=
6v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PAS=
S][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], =
[PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PA=
SS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS]=
[24], [PASS][25], [PASS][26]) -> ([DMESG-FAIL][27], [DMESG-FAIL][28], [DMES=
G-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-F=
AIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL=
][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][4=
1], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45],=
 [DMESG-FAIL][46])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-1/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-6/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-6/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-6/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-9/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-9/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-9/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-9/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-8/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-8/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-2/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-2/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adl=
p-1/igt@xe_module_load@load.html

 =20
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][47], [PASS][48], [PASS][49], [PASS][50], =
[PASS][51], [PASS][52], [PASS][53], [SKIP][54], [PASS][55], [PASS][56], [PA=
SS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS]=
[63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69=
], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], =
[PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PA=
SS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS]=
[88], [PASS][89], [PASS][90], [PASS][91]) ([Intel XE#378]) -> ([DMESG-FAIL]=
[92], [DMESG-FAIL][93], [DMESG-FAIL][94], [DMESG-FAIL][95], [DMESG-FAIL][96=
], [DMESG-FAIL][97], [DMESG-FAIL][98], [DMESG-FAIL][99], [DMESG-FAIL][100],=
 [DMESG-FAIL][101], [DMESG-FAIL][102], [DMESG-FAIL][103], [DMESG-FAIL][104]=
, [DMESG-FAIL][105], [DMESG-FAIL][106], [DMESG-FAIL][107], [DMESG-FAIL][108=
], [DMESG-FAIL][109], [DMESG-FAIL][110], [DMESG-FAIL][111], [DMESG-FAIL][11=
2], [DMESG-FAIL][113], [DMESG-FAIL][114], [DMESG-FAIL][115], [DMESG-FAIL][1=
16])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-1/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-8/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-8/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-8/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl=
-4/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][117], [PASS][118], [PASS][119], [PASS][12=
0], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS]=
[126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PA=
SS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], =
[PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143=
], [SKIP][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][=
149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PAS=
S][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [=
PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166]=
, [PASS][167]) ([Intel XE#2457]) -> ([DMESG-FAIL][168], [DMESG-FAIL][169], =
[DMESG-FAIL][170], [DMESG-FAIL][171], [DMESG-FAIL][172], [DMESG-FAIL][173],=
 [DMESG-FAIL][174], [DMESG-FAIL][175], [DMESG-FAIL][176], [DMESG-FAIL][177]=
, [DMESG-FAIL][178], [DMESG-FAIL][179], [DMESG-FAIL][180], [DMESG-FAIL][181=
], [DMESG-FAIL][182], [DMESG-FAIL][183], [DMESG-FAIL][184], [DMESG-FAIL][18=
5], [DMESG-FAIL][186], [DMESG-FAIL][187], [DMESG-FAIL][188], [DMESG-FAIL][1=
89], [DMESG-FAIL][190], [DMESG-FAIL][191])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-6/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-5/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][192], [PASS][193], [PASS][194], [PASS][19=
5], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS]=
[201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PA=
SS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], =
[PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218=
], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [SKIP][223], [PASS][=
224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PAS=
S][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [=
PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [SKIP][241]=
, [PASS][242], [PASS][243], [PASS][244]) ([Intel XE#378]) -> ([DMESG-FAIL][=
245], [DMESG-FAIL][246], [DMESG-FAIL][247], [DMESG-FAIL][248], [DMESG-FAIL]=
[249], [DMESG-FAIL][250], [DMESG-FAIL][251], [DMESG-FAIL][252], [DMESG-FAIL=
][253], [DMESG-FAIL][254], [DMESG-FAIL][255], [DMESG-FAIL][256], [DMESG-FAI=
L][257], [DMESG-FAIL][258], [DMESG-FAIL][259], [DMESG-FAIL][260], [DMESG-FA=
IL][261], [DMESG-FAIL][262], [DMESG-FAIL][263], [DMESG-FAIL][264], [DMESG-F=
AIL][265], [DMESG-FAIL][266], [DMESG-FAIL][267], [DMESG-FAIL][268], [DMESG-=
FAIL][269])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-434/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-434/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-434/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-464/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-464/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-464/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-433/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-433/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-433/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-433/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-436/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-436/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-436/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-463/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-463/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-463/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-466/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-466/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-466/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-435/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-435/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-435/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-432/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-432/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg=
2-432/igt@xe_module_load@load.html

 =20
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * Linux: xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8 -> xe-pw-155866=
v2

  IGT_8587: 8587
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28=
b3b3bea6673bfc6c8
  xe-pw-155866v2: 155866v2

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15586=
6v2/index.html

--===============4100067888898341500==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Add Xe3p support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155866/">https://patchwork.freedesktop.org/series/155866/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155866v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155866v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3929-7ba235d0e0cf055008e2f28b3b3bea667=
3bfc6c8_FULL -&gt; xe-pw-155866v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155866v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155866v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1558=
66v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c=
8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673=
bfc6c8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3be=
a6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e=
2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05=
5008e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e=
0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba2=
35d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929=
-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c=
8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673=
bfc6c8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3be=
a6673bfc6c8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e=
2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05=
5008e2f28b3b3bea6673bfc6c8/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1558=
66v2/shard-adlp-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-6/igt@x=
e_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-6/igt@xe_module_load@load.html=
">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155866v2/shard-adlp-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-9=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-9/igt@xe_module_load@loa=
d.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155866v2/shard-adlp-9/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-=
adlp-9/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-8/igt@xe_module_lo=
ad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155866v2/shard-adlp-8/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/=
shard-adlp-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-8/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155866v2/shard-adlp-2/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
866v2/shard-adlp-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-2/igt@=
xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-2/igt@xe_module_load@load.htm=
l">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155866v2/shard-adlp-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-=
1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-adlp-1/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-155866v2/shard-adlp-1/igt@xe_module_load@load.html">DMESG-FAIL</a>=
)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea66=
73bfc6c8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3b=
ea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2=
f28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf=
055008e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0=
e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba2=
35d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-=
7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c=
8/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673b=
fc6c8/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6=
673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3=
bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f=
28b3b3bea6673bfc6c8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0=
55008e2f28b3b3bea6673bfc6c8/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e=
0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba23=
5d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7=
ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-39=
29-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-=
lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-1/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155866v2/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/sha=
rd-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-8/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155866v2/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/=
shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155866v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866=
v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-4/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155866v2/shard-lnl-3/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
866v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-3/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155866v2/shard-lnl-2/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155866v2/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-2/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-2/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155866v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-7=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-7/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155866v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-ln=
l-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-lnl-5/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155866v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>=
)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea66=
73bfc6c8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3b=
ea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2=
f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf=
055008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0=
e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba2=
35d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-=
7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c=
8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673b=
fc6c8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6=
673bfc6c8/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3=
bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f=
28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf05500=
8e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0=
55008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e=
0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba23=
5d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7=
ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-39=
29-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea66=
73bfc6c8/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3b=
ea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2=
f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf0550=
08e2f28b3b3bea6673bfc6c8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf=
055008e2f28b3b3bea6673bfc6c8/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457"=
>Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155866v2/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shar=
d-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-4/igt@xe_module_lo=
ad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155866v2/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/s=
hard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-8/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155866v2/shard-bmg-1/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v=
2/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-7/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155866v2/shard-bmg-7/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1558=
66v2/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-2/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155866v2/shard-bmg-2/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55866v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-6/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-6/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155866v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-6=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-3/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155866v2/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bm=
g-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-bmg-3/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155866v2/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard=
-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673=
bfc6c8/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3b=
ea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f=
28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e=
0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba=
235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-39=
29-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea=
6673bfc6c8/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008=
e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf=
055008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235=
d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-=
7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-464/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c=
8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea667=
3bfc6c8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3=
bea6673bfc6c8/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f=
28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055=
008e2f28b3b3bea6673bfc6c8/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e=
0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba=
235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-39=
29-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bf=
c6c8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea=
6673bfc6c8/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b=
3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008=
e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf=
055008e2f28b3b3bea6673bfc6c8/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235=
d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-=
7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-435/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-434/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-434/igt@x=
e_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-434/igt@xe_module_load@load.htm=
l">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155866v2/shard-dg2-434/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-=
464/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-464/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155866v2/shard-dg2-464/igt@xe_module_load@load.html">DMESG-FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/s=
hard-dg2-433/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-433/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155866v2/shard-dg2-433/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55866v2/shard-dg2-433/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-436/=
igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-436/igt@xe_module_load@loa=
d.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155866v2/shard-dg2-436/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard=
-dg2-463/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-463/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155866v2/shard-dg2-463/igt@xe_module_load@load.html">DMESG=
-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15586=
6v2/shard-dg2-466/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-466/igt@=
xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-466/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155866v2/shard-dg2-435/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2=
-435/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-435/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-155866v2/shard-dg2-432/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/=
shard-dg2-432/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/shard-dg2-432/igt@xe_m=
odule_load@load.html">DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8 -&gt; xe-pw-155=
866v2</li>
</ul>
<p>IGT_8587: 8587<br />
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28=
b3b3bea6673bfc6c8<br />
  xe-pw-155866v2: 155866v2</p>

</body>
</html>

--===============4100067888898341500==--
