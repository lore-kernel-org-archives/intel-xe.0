Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B026ACA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 04:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E9710E958;
	Fri, 15 Aug 2025 04:06:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53E610E958;
 Fri, 15 Aug 2025 04:06:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2609018475526545559=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Core_Xe_changes_preparing_f?=
 =?utf-8?q?or_VF_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Aug 2025 04:06:18 -0000
Message-ID: <175523077859.238346.260605478332708570@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250815025605.2387080-1-matthew.brost@intel.com>
In-Reply-To: <20250815025605.2387080-1-matthew.brost@intel.com>
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

--===============2609018475526545559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Core Xe changes preparing for VF resume
URL   : https://patchwork.freedesktop.org/series/152965/
State : success

== Summary ==

CI Bug Log - changes from xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20_BAT -> xe-pw-152965v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-152965v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20 -> xe-pw-152965v1

  IGT_8494: 8494
  xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20: 915a96ac57901b60657509dfe5bfb3477e2ede20
  xe-pw-152965v1: 152965v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/index.html

--===============2609018475526545559==
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
<tr><td><b>Series:</b></td><td>Core Xe changes preparing for VF resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152965/">https://patchwork.freedesktop.org/series/152965/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20_BAT -&gt; xe-pw-152965v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152965v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20 -&gt; xe-pw-152965v1</li>
</ul>
<p>IGT_8494: 8494<br />
  xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20: 915a96ac57901b60657509dfe5bfb3477e2ede20<br />
  xe-pw-152965v1: 152965v1</p>

</body>
</html>

--===============2609018475526545559==--
