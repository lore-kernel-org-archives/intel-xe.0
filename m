Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29430C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 20:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926510EB73;
	Thu, 27 Feb 2025 20:03:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A3710EB73;
 Thu, 27 Feb 2025 20:03:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3579449677296820848=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Test_Xe3LPD?=
 =?utf-8?q?_DMC_v2=2E20_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 20:03:16 -0000
Message-ID: <174068659606.2843203.13119344043590773001@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226202647.137052-1-gustavo.sousa@intel.com>
In-Reply-To: <20250226202647.137052-1-gustavo.sousa@intel.com>
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

--===============3579449677296820848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Test Xe3LPD DMC v2.20 (rev2)
URL   : https://patchwork.freedesktop.org/series/145522/
State : success

== Summary ==

CI Bug Log - changes from xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59_BAT -> xe-pw-145522v2_BAT
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

  Here are the changes found in xe-pw-145522v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2229])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][3] ([Intel XE#4322]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#4322]) -> [SKIP][8] ([Intel XE#2229] / [Intel XE#455])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59 -> xe-pw-145522v2

  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59: b90d2864c5d0cee9fa27ffda1a51c1b648939b59
  xe-pw-145522v2: 145522v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/index.html

--===============3579449677296820848==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Test Xe3LPD DMC v2.20 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145522/">https://patchwork.freedesktop.org/series/145522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59_BAT -&gt; xe-pw-145522v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145522v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145522v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59 -&gt; xe-pw-145522v2</li>
</ul>
<p>IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2727-b90d2864c5d0cee9fa27ffda1a51c1b648939b59: b90d2864c5d0cee9fa27ffda1a51c1b648939b59<br />
  xe-pw-145522v2: 145522v2</p>

</body>
</html>

--===============3579449677296820848==--
