Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7BCC5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 15:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48989CFA;
	Tue, 27 Aug 2024 15:06:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CA910E346;
 Tue, 27 Aug 2024 15:06:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2857328079217281712=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Revert_=22drm/i915=3A_?=
 =?utf-8?q?Disable_DSB_in_Xe_KMD=22_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 15:06:53 -0000
Message-ID: <172477121392.806684.16768449016251506669@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708055630.4058818-1-animesh.manna@intel.com>
In-Reply-To: <20240708055630.4058818-1-animesh.manna@intel.com>
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

--===============2857328079217281712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD" (rev6)
URL   : https://patchwork.freedesktop.org/series/131488/
State : success

== Summary ==

CI Bug Log - changes from xe-1836-27592570393fbdca50a8767bf7b53ff88147e701_BAT -> xe-pw-131488v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1836-27592570393fbdca50a8767bf7b53ff88147e701 -> xe-pw-131488v6

  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1836-27592570393fbdca50a8767bf7b53ff88147e701: 27592570393fbdca50a8767bf7b53ff88147e701
  xe-pw-131488v6: 131488v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html

--===============2857328079217281712==
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
<tr><td><b>Series:</b></td><td>drm/xe: Revert &quot;drm/i915: Disable DSB in Xe KMD&quot; (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131488/">https://patchwork.freedesktop.org/series/131488/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1836-27592570393fbdca50a8767bf7b53ff88147e701_BAT -&gt; xe-pw-131488v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1836-27592570393fbdca50a8767bf7b53ff88147e701 -&gt; xe-pw-131488v6</li>
</ul>
<p>IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1836-27592570393fbdca50a8767bf7b53ff88147e701: 27592570393fbdca50a8767bf7b53ff88147e701<br />
  xe-pw-131488v6: 131488v6</p>

</body>
</html>

--===============2857328079217281712==--
