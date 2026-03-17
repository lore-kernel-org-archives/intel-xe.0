Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA32F3383D
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 14:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D52710E395;
	Tue, 17 Mar 2026 14:41:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA4310E69B;
 Tue, 17 Mar 2026 14:41:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4456897219340112703=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_MEI_interrupt_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 14:41:54 -0000
Message-ID: <177375851461.366776.6605597398075494300@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317134741.3420-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260317134741.3420-1-Simon.Richter@hogyros.de>
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

--===============4456897219340112703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: MEI interrupt fixes
URL   : https://patchwork.freedesktop.org/series/163380/
State : failure

== Summary ==

CI Bug Log - changes from xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0_BAT -> xe-pw-163380v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163380v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163380v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 4)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-163380v1_BAT prevented too many machines from booting.

  Missing    (10): bat-bmg-1 bat-lnl-2 bat-ptl-vm bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0 -> xe-pw-163380v1

  IGT_8806: 8806
  xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0: b65472ae36d2a21ac0a1991618db1e9b09b1dcd0
  xe-pw-163380v1: 163380v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163380v1/index.html

--===============4456897219340112703==
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
<tr><td><b>Series:</b></td><td>MEI interrupt fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163380/">https://patchwork.freedesktop.org/series/163380/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163380v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163380v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0_BAT -&gt; xe-pw-163380v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163380v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163380v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 4)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-163380v1_BAT prevented too many machines from booting.</p>
<p>Missing    (10): bat-bmg-1 bat-lnl-2 bat-ptl-vm bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0 -&gt; xe-pw-163380v1</li>
</ul>
<p>IGT_8806: 8806<br />
  xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0: b65472ae36d2a21ac0a1991618db1e9b09b1dcd0<br />
  xe-pw-163380v1: 163380v1</p>

</body>
</html>

--===============4456897219340112703==--
