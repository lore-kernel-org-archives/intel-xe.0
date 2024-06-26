Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8133C3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 02:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB7910E768;
	Wed, 26 Jun 2024 02:00:54 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3E310E759;
 Wed, 26 Jun 2024 02:00:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3772425426480873832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Convert_multiple_bind_ops_to_1_j?=
 =?utf-8?q?ob_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 02:00:53 -0000
Message-ID: <171936725364.158965.11887218412131871116@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626003920.4060633-1-matthew.brost@intel.com>
In-Reply-To: <20240626003920.4060633-1-matthew.brost@intel.com>
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

--===============3772425426480873832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert multiple bind ops to 1 job (rev5)
URL   : https://patchwork.freedesktop.org/series/133034/
State : success

== Summary ==

CI Bug Log - changes from xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d_BAT -> xe-pw-133034v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-pw-133034v5

  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d
  xe-pw-133034v5: 133034v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/index.html

--===============3772425426480873832==
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
<tr><td><b>Series:</b></td><td>Convert multiple bind ops to 1 job (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133034/">https://patchwork.freedesktop.org/series/133034/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d_BAT -&gt; xe-pw-133034v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -&gt; xe-pw-133034v5</li>
</ul>
<p>IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d<br />
  xe-pw-133034v5: 133034v5</p>

</body>
</html>

--===============3772425426480873832==--
