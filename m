Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F73D41C03
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 06:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5410E34C;
	Wed, 13 Nov 2024 06:22:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465CE10E261;
 Wed, 13 Nov 2024 06:22:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9220623434153684236=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Pcode_sets_t?=
 =?utf-8?q?he_CD_clock_frequency_voltage_levels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 06:22:22 -0000
Message-ID: <173147894226.3402359.15273122461799385406@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112132411.491540-1-mika.kahola@intel.com>
In-Reply-To: <20241112132411.491540-1-mika.kahola@intel.com>
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

--===============9220623434153684236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Pcode sets the CD clock frequency voltage levels (rev2)
URL   : https://patchwork.freedesktop.org/series/141013/
State : success

== Summary ==

CI Bug Log - changes from xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_BAT -> xe-pw-141013v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141013v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8104 -> IGT_8105
  * Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b -> xe-pw-141013v2

  IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8105: 8105
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b
  xe-pw-141013v2: 141013v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/index.html

--===============9220623434153684236==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Pcode sets the CD clock frequency voltage levels (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141013/">https://patchwork.freedesktop.org/series/141013/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_BAT -&gt; xe-pw-141013v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141013v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141013v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8104 -&gt; IGT_8105</li>
<li>Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b -&gt; xe-pw-141013v2</li>
</ul>
<p>IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8105: 8105<br />
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b<br />
  xe-pw-141013v2: 141013v2</p>

</body>
</html>

--===============9220623434153684236==--
