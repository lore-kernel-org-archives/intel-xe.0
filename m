Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBD7D262A2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED089DA5;
	Tue, 20 Jan 2026 20:57:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5510E674;
 Tue, 20 Jan 2026 20:56:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0334143864917909684=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Attempt_to_fixup_reset=2C_w?=
 =?utf-8?q?edge=2C_unload_corner_cases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jan 2026 20:56:59 -0000
Message-ID: <176894261924.173698.1113655705212242296@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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

--===============0334143864917909684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Attempt to fixup reset, wedge, unload corner cases
URL   : https://patchwork.freedesktop.org/series/160378/
State : success

== Summary ==

CI Bug Log - changes from xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1_BAT -> xe-pw-160378v1_BAT
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

  * IGT: IGT_8708 -> IGT_8709
  * Linux: xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1 -> xe-pw-160378v1

  IGT_8708: 8708
  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1: fa2241b92adb500a9c016188d338aa3f6f8a95a1
  xe-pw-160378v1: 160378v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160378v1/index.html

--===============0334143864917909684==
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
<tr><td><b>Series:</b></td><td>Attempt to fixup reset, wedge, unload corner cases</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160378/">https://patchwork.freedesktop.org/series/160378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160378v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160378v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1_BAT -&gt; xe-pw-160378v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8708 -&gt; IGT_8709</li>
<li>Linux: xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1 -&gt; xe-pw-160378v1</li>
</ul>
<p>IGT_8708: 8708<br />
  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1: fa2241b92adb500a9c016188d338aa3f6f8a95a1<br />
  xe-pw-160378v1: 160378v1</p>

</body>
</html>

--===============0334143864917909684==--
