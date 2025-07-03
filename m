Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE59C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 00:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BD010E7C0;
	Thu,  3 Jul 2025 00:40:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B2710E7C0;
 Thu,  3 Jul 2025 00:40:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7509546873502649250=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/display=3A_Increase_DP?=
 =?utf-8?q?=5FRECEIVER=5FCAP=5FSIZE_from_15_to_16_bytes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 00:40:09 -0000
Message-ID: <175150320926.130138.17687775758991998297@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702223903.3801654-1-khaled.almahallawy@intel.com>
In-Reply-To: <20250702223903.3801654-1-khaled.almahallawy@intel.com>
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

--===============7509546873502649250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 bytes
URL   : https://patchwork.freedesktop.org/series/151096/
State : success

== Summary ==

CI Bug Log - changes from xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6_BAT -> xe-pw-151096v1_BAT
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

  Here are the changes found in xe-pw-151096v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151096v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6 -> xe-pw-151096v1

  IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6: 339a9f6176f6e176caa8e631859c73b34ffb07d6
  xe-pw-151096v1: 151096v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151096v1/index.html

--===============7509546873502649250==
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
<tr><td><b>Series:</b></td><td>drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 bytes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151096/">https://patchwork.freedesktop.org/series/151096/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151096v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151096v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6_BAT -&gt; xe-pw-151096v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151096v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151096v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6 -&gt; xe-pw-151096v1</li>
</ul>
<p>IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3338-339a9f6176f6e176caa8e631859c73b34ffb07d6: 339a9f6176f6e176caa8e631859c73b34ffb07d6<br />
  xe-pw-151096v1: 151096v1</p>

</body>
</html>

--===============7509546873502649250==--
