Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536EBC47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 12:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A1610F6CE;
	Mon, 29 Jan 2024 12:50:40 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF3A10F6CE;
 Mon, 29 Jan 2024 12:50:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0520386117804483289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Introduce_and_update_c?=
 =?utf-8?q?ounter_for_low_level_driver_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 29 Jan 2024 12:50:39 -0000
Message-ID: <170653263983.806401.15059791841697928027@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129115924.2016519-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240129115924.2016519-1-tejas.upadhyay@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0520386117804483289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Introduce and update counter for low level driver errors
URL   : https://patchwork.freedesktop.org/series/129266/
State : success

== Summary ==

CI Bug Log - changes from xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82_BAT -> xe-pw-129266v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129266v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#1130]) -> [SKIP][2] ([Intel XE#288])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129266v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * Linux: xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82 -> xe-pw-129266v1

  IGT_7697: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82: a0325b172ae7077c52b074d9b531f4e3aa585d82
  xe-pw-129266v1: 129266v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129266v1/index.html

--===============0520386117804483289==
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
<tr><td><b>Series:</b></td><td>drm/xe: Introduce and update counter for low level driver errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129266/">https://patchwork.freedesktop.org/series/129266/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129266v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129266v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82_BAT -&gt; xe-pw-129266v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129266v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129266v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82 -&gt; xe-pw-129266v1</li>
</ul>
<p>IGT_7697: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82: a0325b172ae7077c52b074d9b531f4e3aa585d82<br />
  xe-pw-129266v1: 129266v1</p>

</body>
</html>

--===============0520386117804483289==--
