Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F8CC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 06:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E71910E73C;
	Wed,  9 Jul 2025 06:49:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115A110E73A;
 Wed,  9 Jul 2025 06:49:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3117367870466038631=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_patch_to_reject_HBR3?=
 =?utf-8?q?_for_all_eDP_panels_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Jul 2025 06:49:45 -0000
Message-ID: <175204378506.146341.17428269941839279318@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250709055144.879393-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250709055144.879393-1-ankit.k.nautiyal@intel.com>
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

--===============3117367870466038631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert patch to reject HBR3 for all eDP panels (rev5)
URL   : https://patchwork.freedesktop.org/series/150568/
State : success

== Summary ==

CI Bug Log - changes from xe-3377-b56a996bf200253fd2df3518cb46613e37090e48_BAT -> xe-pw-150568v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3377-b56a996bf200253fd2df3518cb46613e37090e48 -> xe-pw-150568v5

  IGT_8447: 8447
  xe-3377-b56a996bf200253fd2df3518cb46613e37090e48: b56a996bf200253fd2df3518cb46613e37090e48
  xe-pw-150568v5: 150568v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v5/index.html

--===============3117367870466038631==
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
<tr><td><b>Series:</b></td><td>Revert patch to reject HBR3 for all eDP panels (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150568/">https://patchwork.freedesktop.org/series/150568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3377-b56a996bf200253fd2df3518cb46613e37090e48_BAT -&gt; xe-pw-150568v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3377-b56a996bf200253fd2df3518cb46613e37090e48 -&gt; xe-pw-150568v5</li>
</ul>
<p>IGT_8447: 8447<br />
  xe-3377-b56a996bf200253fd2df3518cb46613e37090e48: b56a996bf200253fd2df3518cb46613e37090e48<br />
  xe-pw-150568v5: 150568v5</p>

</body>
</html>

--===============3117367870466038631==--
