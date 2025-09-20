Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69ACCAC5A7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Sep 2025 23:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888AE10E294;
	Sat, 20 Sep 2025 23:56:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910F910E044;
 Sat, 20 Sep 2025 23:56:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3122630362530517660=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_mei=3A_late=5Fbind=3A_Fix_-?=
 =?utf-8?q?Wincompatible-function-pointer-types-strict?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Sep 2025 23:56:39 -0000
Message-ID: <175841259948.351229.10705488601266287607@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
In-Reply-To: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
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

--===============3122630362530517660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mei: late_bind: Fix -Wincompatible-function-pointer-types-strict
URL   : https://patchwork.freedesktop.org/series/154808/
State : success

== Summary ==

CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_BAT -> xe-pw-154808v1_BAT
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

  Here are the changes found in xe-pw-154808v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -> xe-pw-154808v1

  IGT_8546: 8546
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142
  xe-pw-154808v1: 154808v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html

--===============3122630362530517660==
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
<tr><td><b>Series:</b></td><td>mei: late_bind: Fix -Wincompatible-function-pointer-types-strict</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154808/">https://patchwork.freedesktop.org/series/154808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_BAT -&gt; xe-pw-154808v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154808v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -&gt; xe-pw-154808v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142<br />
  xe-pw-154808v1: 154808v1</p>

</body>
</html>

--===============3122630362530517660==--
