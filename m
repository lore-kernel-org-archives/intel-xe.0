Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3966AC021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 12:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4B10EAD1;
	Thu, 27 Feb 2025 12:33:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145110EAD3;
 Thu, 27 Feb 2025 12:33:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8471323686427352902=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_fault_injecti?=
 =?utf-8?q?on_for_xe=5Foa=5Falloc=5Fregs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 12:33:24 -0000
Message-ID: <174065960426.2693003.1623316532488892705@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
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

--===============8471323686427352902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add fault injection for xe_oa_alloc_regs
URL   : https://patchwork.freedesktop.org/series/145564/
State : success

== Summary ==

CI Bug Log - changes from xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34_BAT -> xe-pw-145564v1_BAT
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

  * Linux: xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34 -> xe-pw-145564v1

  IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34: 5460e22a4f99bc3f40c96600528a0a4bc2318c34
  xe-pw-145564v1: 145564v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145564v1/index.html

--===============8471323686427352902==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add fault injection for xe_oa_alloc_regs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145564/">https://patchwork.freedesktop.org/series/145564/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145564v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145564v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34_BAT -&gt; xe-pw-145564v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34 -&gt; xe-pw-145564v1</li>
</ul>
<p>IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2723-5460e22a4f99bc3f40c96600528a0a4bc2318c34: 5460e22a4f99bc3f40c96600528a0a4bc2318c34<br />
  xe-pw-145564v1: 145564v1</p>

</body>
</html>

--===============8471323686427352902==--
