Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BA4FA3758
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 06:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6010E540;
	Wed, 18 Sep 2024 06:57:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCE310E543;
 Wed, 18 Sep 2024 06:57:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6168732012826419011=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_memirq_infra_changes_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 06:57:37 -0000
Message-ID: <172664265724.1024681.16436144385419461948@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918053942.1331811-1-illevi@habana.ai>
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
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

--===============6168732012826419011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: memirq infra changes (rev7)
URL   : https://patchwork.freedesktop.org/series/137643/
State : failure

== Summary ==

CI Bug Log - changes from xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df_BAT -> xe-pw-137643v7_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137643v7_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137643v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-137643v7_BAT prevented too many machines from booting.

  Missing    (7): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-bmg-2 bat-dg2-oem2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df -> xe-pw-137643v7

  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df: 911b00e59ae28dd315d10bfb6e030bbb221ba4df
  xe-pw-137643v7: 137643v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html

--===============6168732012826419011==
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
<tr><td><b>Series:</b></td><td>memirq infra changes (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137643/">https://patchwork.freedesktop.org/series/137643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df_BAT -&gt; xe-pw-137643v7_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137643v7_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137643v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-137643v7_BAT prevented too many machines from booting.</p>
<p>Missing    (7): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-bmg-2 bat-dg2-oem2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df -&gt; xe-pw-137643v7</li>
</ul>
<p>IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df: 911b00e59ae28dd315d10bfb6e030bbb221ba4df<br />
  xe-pw-137643v7: 137643v7</p>

</body>
</html>

--===============6168732012826419011==--
