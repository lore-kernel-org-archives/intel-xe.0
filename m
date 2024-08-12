Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C20EC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 12:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3644310E1C9;
	Mon, 12 Aug 2024 12:13:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E45810E1C9;
 Mon, 12 Aug 2024 12:12:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6741374658856440578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Change_HPD_to_?=
 =?utf-8?q?polling_on_runtime_suspend_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 12:12:58 -0000
Message-ID: <172346477844.594790.8613378588631731867@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812103202.3433041-1-arun.r.murthy@intel.com>
In-Reply-To: <20240812103202.3433041-1-arun.r.murthy@intel.com>
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

--===============6741374658856440578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Change HPD to polling on runtime suspend (rev3)
URL   : https://patchwork.freedesktop.org/series/137025/
State : success

== Summary ==

CI Bug Log - changes from xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6_BAT -> xe-pw-137025v3_BAT
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

  Here are the changes found in xe-pw-137025v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_module_load@load:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6/bat-bmg-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6 -> xe-pw-137025v3

  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6: 1daf2018001da75c5522669aebdb68ba9a353ea6
  xe-pw-137025v3: 137025v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/index.html

--===============6741374658856440578==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Change HPD to polling on runtime suspend (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137025/">https://patchwork.freedesktop.org/series/137025/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6_BAT -&gt; xe-pw-137025v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137025v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137025v3/bat-bmg-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6 -&gt; xe-pw-137025v3</li>
</ul>
<p>IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6: 1daf2018001da75c5522669aebdb68ba9a353ea6<br />
  xe-pw-137025v3: 137025v3</p>

</body>
</html>

--===============6741374658856440578==--
