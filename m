Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26DEFD5309
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 07:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDEB10EA4F;
	Fri, 27 Feb 2026 07:48:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0B710EA4F;
 Fri, 27 Feb 2026 07:48:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6014706248230880808=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gma500=3A_fix_kernel-do?=
 =?utf-8?q?c_warning_for_framebuffer_init/create_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yujie Liu" <yujie.liu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 07:48:53 -0000
Message-ID: <177217853302.294210.11263131369293887253@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260227061807.1755150-1-yujie.liu@intel.com>
In-Reply-To: <20260227061807.1755150-1-yujie.liu@intel.com>
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

--===============6014706248230880808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gma500: fix kernel-doc warning for framebuffer init/create functions
URL   : https://patchwork.freedesktop.org/series/162268/
State : success

== Summary ==

CI Bug Log - changes from xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c_BAT -> xe-pw-162268v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c -> xe-pw-162268v1

  IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c: a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c
  xe-pw-162268v1: 162268v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162268v1/index.html

--===============6014706248230880808==
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
<tr><td><b>Series:</b></td><td>drm/gma500: fix kernel-doc warning for framebuffer init/create functions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162268/">https://patchwork.freedesktop.org/series/162268/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162268v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162268v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c_BAT -&gt; xe-pw-162268v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c -&gt; xe-pw-162268v1</li>
</ul>
<p>IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4629-a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c: a4e35112f50fa0fc76a17c4c0cebdc103eb01f4c<br />
  xe-pw-162268v1: 162268v1</p>

</body>
</html>

--===============6014706248230880808==--
