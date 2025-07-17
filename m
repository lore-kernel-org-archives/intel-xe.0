Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B074C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 15:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516810E846;
	Thu, 17 Jul 2025 15:34:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9E10E846;
 Thu, 17 Jul 2025 15:34:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6705776042707093622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Prepare_GPU_SVM_for_migrati?=
 =?utf-8?q?on_of_THP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Jul 2025 15:34:11 -0000
Message-ID: <175276645146.169589.15953020007203704361@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717133928.526111-1-francois.dugast@intel.com>
In-Reply-To: <20250717133928.526111-1-francois.dugast@intel.com>
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

--===============6705776042707093622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare GPU SVM for migration of THP
URL   : https://patchwork.freedesktop.org/series/151754/
State : success

== Summary ==

CI Bug Log - changes from xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f_BAT -> xe-pw-151754v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151754v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8463 -> IGT_8465
  * Linux: xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f -> xe-pw-151754v1

  IGT_8463: 348dbef0314ccb588cbe83492444afc215965982 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f: 32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f
  xe-pw-151754v1: 151754v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v1/index.html

--===============6705776042707093622==
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
<tr><td><b>Series:</b></td><td>Prepare GPU SVM for migration of THP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151754/">https://patchwork.freedesktop.org/series/151754/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f_BAT -&gt; xe-pw-151754v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151754v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8463 -&gt; IGT_8465</li>
<li>Linux: xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f -&gt; xe-pw-151754v1</li>
</ul>
<p>IGT_8463: 348dbef0314ccb588cbe83492444afc215965982 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f: 32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f<br />
  xe-pw-151754v1: 151754v1</p>

</body>
</html>

--===============6705776042707093622==--
