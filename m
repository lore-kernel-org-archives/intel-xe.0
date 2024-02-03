Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE25C4828D
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE8810F3FF;
	Sat,  3 Feb 2024 06:56:48 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0710F3FE;
 Sat,  3 Feb 2024 06:56:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3619172125934931471=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BRFC=2C1/?=
 =?utf-8?q?2=5D_drm/xe=3A_Add_has=5Fwmpt_GT_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 Feb 2024 06:56:47 -0000
Message-ID: <170694340779.953329.15472583542498417912@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240203060534.6839-1-nirmoy.das@intel.com>
In-Reply-To: <20240203060534.6839-1-nirmoy.das@intel.com>
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

--===============3619172125934931471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [RFC,1/2] drm/xe: Add has_wmpt GT info
URL   : https://patchwork.freedesktop.org/series/129501/
State : failure

== Summary ==

CI Bug Log - changes from xe-719-40994da55437acf620a48af39b0d8545e1595c42_BAT -> xe-pw-129501v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129501v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129501v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129501v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +7 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129501v1/bat-adlp-7/igt@xe_live_ktest@bo.html

  


Build changes
-------------

  * Linux: xe-719-40994da55437acf620a48af39b0d8545e1595c42 -> xe-pw-129501v1

  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-719-40994da55437acf620a48af39b0d8545e1595c42: 40994da55437acf620a48af39b0d8545e1595c42
  xe-pw-129501v1: 129501v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129501v1/index.html

--===============3619172125934931471==
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
<tr><td><b>Series:</b></td><td>series starting with [RFC,1/2] drm/xe: Add has_wmpt GT info</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129501/">https://patchwork.freedesktop.org/series/129501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129501v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129501v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-719-40994da55437acf620a48af39b0d8545e1595c42_BAT -&gt; xe-pw-129501v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129501v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129501v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129501v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129501v1/bat-adlp-7/igt@xe_live_ktest@bo.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-719-40994da55437acf620a48af39b0d8545e1595c42 -&gt; xe-pw-129501v1</li>
</ul>
<p>IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-719-40994da55437acf620a48af39b0d8545e1595c42: 40994da55437acf620a48af39b0d8545e1595c42<br />
  xe-pw-129501v1: 129501v1</p>

</body>
</html>

--===============3619172125934931471==--
