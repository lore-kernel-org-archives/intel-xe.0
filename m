Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D257BD5D689
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 20:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AE610E20B;
	Thu,  7 Nov 2024 20:34:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BD010E20B;
 Thu,  7 Nov 2024 20:34:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2402052926012481701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Prefer_GT_oriented_logs/asserts_?=
 =?utf-8?q?in_submit_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 20:34:39 -0000
Message-ID: <173101167902.1423870.12893720658723238525@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241107194741.2167-1-michal.wajdeczko@intel.com>
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

--===============2402052926012481701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prefer GT oriented logs/asserts in submit code
URL   : https://patchwork.freedesktop.org/series/141063/
State : success

== Summary ==

CI Bug Log - changes from xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97_BAT -> xe-pw-141063v1_BAT
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

  Here are the changes found in xe-pw-141063v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#2496]) -> [PASS][4] +31 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#1861]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874


Build changes
-------------

  * Linux: xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97 -> xe-pw-141063v1

  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97: 85b1b17ed748e1f68ac83052916a95d624405c97
  xe-pw-141063v1: 141063v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/index.html

--===============2402052926012481701==
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
<tr><td><b>Series:</b></td><td>Prefer GT oriented logs/asserts in submit code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141063/">https://patchwork.freedesktop.org/series/141063/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97_BAT -&gt; xe-pw-141063v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141063v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97 -&gt; xe-pw-141063v1</li>
</ul>
<p>IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97: 85b1b17ed748e1f68ac83052916a95d624405c97<br />
  xe-pw-141063v1: 141063v1</p>

</body>
</html>

--===============2402052926012481701==--
