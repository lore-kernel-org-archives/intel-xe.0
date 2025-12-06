Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C6BD3ABD6
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 01:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B1510E0A8;
	Sat,  6 Dec 2025 01:52:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DBF10E0A8;
 Sat,  6 Dec 2025 01:52:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0536380007740281691=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Limit_num=5Fsyncs_to_preven?=
 =?utf-8?q?t_oversized_allocations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Dec 2025 01:52:47 -0000
Message-ID: <176498596752.62152.11003315293005111672@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205234715.2476561-4-shuicheng.lin@intel.com>
In-Reply-To: <20251205234715.2476561-4-shuicheng.lin@intel.com>
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

--===============0536380007740281691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit num_syncs to prevent oversized allocations (rev3)
URL   : https://patchwork.freedesktop.org/series/158594/
State : success

== Summary ==

CI Bug Log - changes from xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79_BAT -> xe-pw-158594v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79 -> xe-pw-158594v3

  IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79: db6505187efb9c255df1dd6e78c00d95fadfef79
  xe-pw-158594v3: 158594v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158594v3/index.html

--===============0536380007740281691==
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
<tr><td><b>Series:</b></td><td>Limit num_syncs to prevent oversized allocations (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158594/">https://patchwork.freedesktop.org/series/158594/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158594v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158594v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79_BAT -&gt; xe-pw-158594v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79 -&gt; xe-pw-158594v3</li>
</ul>
<p>IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79: db6505187efb9c255df1dd6e78c00d95fadfef79<br />
  xe-pw-158594v3: 158594v3</p>

</body>
</html>

--===============0536380007740281691==--
