Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE64BD3C92D
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 20:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7B10E3BC;
	Sat, 19 Oct 2024 20:07:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346DA10E3BC;
 Sat, 19 Oct 2024 20:07:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3726878369613539738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Fix_non-contiguous_VRAM_BO_acces?=
 =?utf-8?q?s_in_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Oct 2024 20:07:00 -0000
Message-ID: <172936842020.1302481.9524614737885853998@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241019192030.1505020-1-matthew.brost@intel.com>
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
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

--===============3726878369613539738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix non-contiguous VRAM BO access in Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/140200/
State : success

== Summary ==

CI Bug Log - changes from xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124_BAT -> xe-pw-140200v3_BAT
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

  Here are the changes found in xe-pw-140200v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2496]) +31 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2874]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998


Build changes
-------------

  * Linux: xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124 -> xe-pw-140200v3

  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124: 38b97dc95877282bd4ddd58864f2b5f29c6cd124
  xe-pw-140200v3: 140200v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html

--===============3726878369613539738==
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
<tr><td><b>Series:</b></td><td>Fix non-contiguous VRAM BO access in Xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140200/">https://patchwork.freedesktop.org/series/140200/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124_BAT -&gt; xe-pw-140200v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140200v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124 -&gt; xe-pw-140200v3</li>
</ul>
<p>IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124: 38b97dc95877282bd4ddd58864f2b5f29c6cd124<br />
  xe-pw-140200v3: 140200v3</p>

</body>
</html>

--===============3726878369613539738==--
