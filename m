Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9ABC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 03:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0E710EF80;
	Wed, 13 Mar 2024 03:37:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CD110EF80;
 Wed, 13 Mar 2024 03:37:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1521495658241151376=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Ftracer=3A_Align_fenc?=
 =?utf-8?q?e_output_format_in_ftrace_log_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 03:37:02 -0000
Message-ID: <171030102226.715417.13582244136845677591@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313025052.1410833-1-shuicheng.lin@intel.com>
In-Reply-To: <20240313025052.1410833-1-shuicheng.lin@intel.com>
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

--===============1521495658241151376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_tracer: Align fence output format in ftrace log (rev3)
URL   : https://patchwork.freedesktop.org/series/131005/
State : success

== Summary ==

CI Bug Log - changes from xe-932-8762453258673794e13e4d59cb9df1042b97ba01_BAT -> xe-pw-131005v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -> xe-pw-131005v3

  IGT_7757: 7757
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01
  xe-pw-131005v3: 131005v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131005v3/index.html

--===============1521495658241151376==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_tracer: Align fence output format in ftrace log (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131005/">https://patchwork.freedesktop.org/series/131005/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131005v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131005v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-932-8762453258673794e13e4d59cb9df1042b97ba01_BAT -&gt; xe-pw-131005v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -&gt; xe-pw-131005v3</li>
</ul>
<p>IGT_7757: 7757<br />
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01<br />
  xe-pw-131005v3: 131005v3</p>

</body>
</html>

--===============1521495658241151376==--
