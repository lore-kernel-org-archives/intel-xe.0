Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F61C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 01:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F6010E083;
	Sat, 18 Nov 2023 01:38:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5845010E083;
 Sat, 18 Nov 2023 01:38:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50001A02F0;
 Sat, 18 Nov 2023 01:38:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8532488213226240610=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Sat, 18 Nov 2023 01:38:50 -0000
Message-ID: <170027153029.12896.18382072451483290104@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Intel=5Ff?=
 =?utf-8?q?b=2Ec_refactoring_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8532488213226240610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel_fb.c refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/126505/
State : failure

== Summary ==

CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -> xe-pw-126505v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126505v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126505v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126505v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-adlp-7/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-bad-modifier.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#609]) -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  
Known issues
------------

  Here are the changes found in xe-pw-126505v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609


Build changes
-------------

  * Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -> xe-pw-126505v2

  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2
  xe-pw-126505v2: 126505v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/index.html

--===============8532488213226240610==
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
<tr><td><b>Series:</b></td><td>Intel_fb.c refactoring (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126505/">https://patchwork.freedesktop.org/series/126505/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -&gt; xe-pw-126505v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126505v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126505v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126505v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-adlp-7/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126505v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -&gt; xe-pw-126505v2</li>
</ul>
<p>IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2<br />
  xe-pw-126505v2: 126505v2</p>

</body>
</html>

--===============8532488213226240610==--
