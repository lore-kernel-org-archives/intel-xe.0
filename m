Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA0C282CD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 10:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0910EC58;
	Fri, 28 Feb 2025 10:21:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740CD10EC58;
 Fri, 28 Feb 2025 10:21:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6252881252484166210=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_userptr_races?=
 =?utf-8?q?_and_missed_validations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 10:21:46 -0000
Message-ID: <174073810646.3175296.2989325930782353508@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
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

--===============6252881252484166210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix userptr races and missed validations (rev2)
URL   : https://patchwork.freedesktop.org/series/145498/
State : success

== Summary ==

CI Bug Log - changes from xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0_BAT -> xe-pw-145498v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-145498v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [SKIP][2] ([Intel XE#4322]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#4322])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8251 -> IGT_8252
  * Linux: xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0 -> xe-pw-145498v2

  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8252: e266af0feec344315b07d8af186226e467d02ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0: 873b1a50bb4394e95332cfa611aa6463de6b7cb0
  xe-pw-145498v2: 145498v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/index.html

--===============6252881252484166210==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Fix userptr races and missed validations (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145498/">https://patchwork.freedesktop.org/series/145498/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0_BAT -&gt; xe-pw-145498v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145498v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8251 -&gt; IGT_8252</li>
<li>Linux: xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0 -&gt; xe-pw-145498v2</li>
</ul>
<p>IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8252: e266af0feec344315b07d8af186226e467d02ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0: 873b1a50bb4394e95332cfa611aa6463de6b7cb0<br />
  xe-pw-145498v2: 145498v2</p>

</body>
</html>

--===============6252881252484166210==--
