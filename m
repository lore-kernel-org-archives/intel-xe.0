Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7420AC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 20:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D910E6AB;
	Tue,  4 Mar 2025 20:11:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014B210E6AB;
 Tue,  4 Mar 2025 20:11:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1715110948283055010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_userptr_races?=
 =?utf-8?q?_and_missed_validations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 20:11:56 -0000
Message-ID: <174111911699.709723.5379599312918428386@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
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

--===============1715110948283055010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix userptr races and missed validations (rev3)
URL   : https://patchwork.freedesktop.org/series/145498/
State : success

== Summary ==

CI Bug Log - changes from xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26_BAT -> xe-pw-145498v3_BAT
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

  * IGT: IGT_8258 -> IGT_8259
  * Linux: xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26 -> xe-pw-145498v3

  IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8259: 4252087362da9aa06b1a2280f7439bbb0af03aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26: ff2d693d88726e29a1d87291105135c31c21fa26
  xe-pw-145498v3: 145498v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v3/index.html

--===============1715110948283055010==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix userptr races and missed validations (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145498/">https://patchwork.freedesktop.org/series/145498/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145498v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26_BAT -&gt; xe-pw-145498v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8258 -&gt; IGT_8259</li>
<li>Linux: xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26 -&gt; xe-pw-145498v3</li>
</ul>
<p>IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8259: 4252087362da9aa06b1a2280f7439bbb0af03aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26: ff2d693d88726e29a1d87291105135c31c21fa26<br />
  xe-pw-145498v3: 145498v3</p>

</body>
</html>

--===============1715110948283055010==--
