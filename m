Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20963C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 17:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9B10F6DA;
	Tue,  7 May 2024 17:44:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB3910F6DE;
 Tue,  7 May 2024 17:44:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2555235323847740885=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Rename_few_xe=5Fargs?=
 =?utf-8?q?=2Eh_macros_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 17:44:10 -0000
Message-ID: <171510385084.1963160.18078191975853248811@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507152246.2791-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240507152246.2791-1-michal.wajdeczko@intel.com>
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

--===============2555235323847740885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename few xe_args.h macros (rev2)
URL   : https://patchwork.freedesktop.org/series/133258/
State : success

== Summary ==

CI Bug Log - changes from xe-1248-0acac79849c88161fcceb75fdc56a438fa158324_BAT -> xe-pw-133258v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7837 -> IGT_7838
  * Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324 -> xe-pw-133258v2

  IGT_7837: 1a77ac56d4538a5a2b9cecd59beab187248f35ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1248-0acac79849c88161fcceb75fdc56a438fa158324: 0acac79849c88161fcceb75fdc56a438fa158324
  xe-pw-133258v2: 133258v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v2/index.html

--===============2555235323847740885==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename few xe_args.h macros (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133258/">https://patchwork.freedesktop.org/series/133258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1248-0acac79849c88161fcceb75fdc56a438fa158324_BAT -&gt; xe-pw-133258v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7837 -&gt; IGT_7838</li>
<li>Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324 -&gt; xe-pw-133258v2</li>
</ul>
<p>IGT_7837: 1a77ac56d4538a5a2b9cecd59beab187248f35ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1248-0acac79849c88161fcceb75fdc56a438fa158324: 0acac79849c88161fcceb75fdc56a438fa158324<br />
  xe-pw-133258v2: 133258v2</p>

</body>
</html>

--===============2555235323847740885==--
