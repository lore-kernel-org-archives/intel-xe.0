Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC37C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 02:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17EB10E369;
	Fri,  3 Nov 2023 02:31:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97F2F10E369;
 Fri,  3 Nov 2023 02:31:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 862C9AADED;
 Fri,  3 Nov 2023 02:31:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4958583997899139346=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Fri, 03 Nov 2023 02:31:07 -0000
Message-ID: <169897866750.29108.3679407188102901035@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103014309.13927-1-brian.welty@intel.com>
In-Reply-To: <20231103014309.13927-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Fix_pagefault_and_access_counter_worker_functions?=
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

--===============4958583997899139346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix pagefault and access counter worker functions
URL   : https://patchwork.freedesktop.org/series/125936/
State : success

== Summary ==

CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -> xe-pw-125936v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-125936v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4] ([Intel XE#714])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/bat-atsm-2/igt@xe_module_load@load.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714


Build changes
-------------

  * IGT: IGT_7570 -> IGT_7571
  * Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -> xe-pw-125936v1

  IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7571: 9b79b510e53d913da5d23e86f3baa6c58a2feed8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2
  xe-pw-125936v1: 125936v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/index.html

--===============4958583997899139346==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix pagefault and access counter worker functions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125936/">https://patchwork.freedesktop.org/series/125936/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -&gt; xe-pw-125936v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125936v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125936v1/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7570 -&gt; IGT_7571</li>
<li>Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -&gt; xe-pw-125936v1</li>
</ul>
<p>IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7571: 9b79b510e53d913da5d23e86f3baa6c58a2feed8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2<br />
  xe-pw-125936v1: 125936v1</p>

</body>
</html>

--===============4958583997899139346==--
