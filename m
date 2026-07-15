Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7916C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 00:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8A610E0FE;
	Wed, 15 Jul 2026 00:37:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3256D10E0E8;
 Wed, 15 Jul 2026 00:37:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7696472647716600789=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_More_BIOS_FB_tak?=
 =?utf-8?q?eover_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jul 2026 00:37:53 -0000
Message-ID: <178407587319.190128.13360877024051140552@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714162824.2063637-1-dev@lankhorst.se>
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
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

--===============7696472647716600789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: More BIOS FB takeover fixes
URL   : https://patchwork.freedesktop.org/series/170430/
State : failure

== Summary ==

CI Bug Log - changes from xe-5399-45c0f0c41055eb52626f68070e895739d22531a6_FULL -> xe-pw-170430v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-170430v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170430v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170430v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [SKIP][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#2457] / [Intel XE#7405]) -> ([DMESG-FAIL][27], [DMESG-FAIL][28], [DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50], [DMESG-FAIL][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-5/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-1/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-8/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-6/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-3/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-10/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-10/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-9/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-7/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-4/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-3/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-3/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-8/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-8/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-9/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-5/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-5/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-5/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-5/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-5/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-4/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-4/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-2/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-10/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-10/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-170430v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-lnl:          [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#1727]) +1 other test dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#7334]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-1/igt@xe_oa@non-zero-reason-all.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-7/igt@xe_oa@non-zero-reason-all.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][56] ([Intel XE#301]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][58] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][60] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][61] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935


Build changes
-------------

  * Linux: xe-5399-45c0f0c41055eb52626f68070e895739d22531a6 -> xe-pw-170430v1

  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5399-45c0f0c41055eb52626f68070e895739d22531a6: 45c0f0c41055eb52626f68070e895739d22531a6
  xe-pw-170430v1: 170430v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/index.html

--===============7696472647716600789==
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
<tr><td><b>Series:</b></td><td>drm/xe: More BIOS FB takeover fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170430/">https://patchwork.freedesktop.org/series/170430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-170430v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-170430v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5399-45c0f0c41055eb52626f68070e895739d=
22531a6_FULL -&gt; xe-pw-170430v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-170430v1_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-170430v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1704=
30v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-b=
mg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d225=
31a6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739=
d22531a6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e89=
5739d22531a6/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f6=
8070e895739d22531a6/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52=
626f68070e895739d22531a6/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055=
eb52626f68070e895739d22531a6/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c4=
1055eb52626f68070e895739d22531a6/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0=
f0c41055eb52626f68070e895739d22531a6/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-=
45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a=
6/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22=
531a6/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-170430v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-5/i=
gt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-170430v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-=
4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@loa=
d.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-b=
mg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-6/igt@xe_module_load@=
load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-170430v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shar=
d-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_lo=
ad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/s=
hard-bmg-9/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-9/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v=
1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-170430v1/shard-bmg-7/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1704=
30v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-170430v1/shard-bmg-1/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
70430v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-10/i=
gt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-170430v1/shard-bmg-10/igt@xe_module_load@load.=
html">DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170430v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-4/igt@kms_async_f=
lips@async-flip-suspend-resume.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other =
test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-1/igt@xe_oa@no=
n-zero-reason-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-170430v1/shard-lnl-7/igt@xe_oa@non-zero-reason-all.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shard-lnl-3/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/shar=
d-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/shard-lnl-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-170430v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5399-45c0f0c41055eb52626f68070e895739d22531a6 -&gt; xe-pw-170=
430v1</li>
</ul>
<p>IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5399-45c0f0c41055eb52626f68070e895739d22531a6: 45c0f0c41055eb52626f680=
70e895739d22531a6<br />
  xe-pw-170430v1: 170430v1</p>

</body>
</html>

--===============7696472647716600789==--
