Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA6CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8A310E91E;
	Thu, 23 Oct 2025 15:43:08 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172A410E91E;
 Thu, 23 Oct 2025 15:43:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5450817507381308450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_DP2=2E1_alpm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 15:43:07 -0000
Message-ID: <176123418708.47935.6667234095518286953@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023084147.572535-1-animesh.manna@intel.com>
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
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

--===============5450817507381308450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable DP2.1 alpm
URL   : https://patchwork.freedesktop.org/series/156416/
State : success

== Summary ==

CI Bug Log - changes from xe-3972-2d884504f47b972c124197c8380c5533324c96d0_BAT -> xe-pw-156416v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156416v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-ptl-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#6287])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3972-2d884504f47b972c124197c8380c5533324c96d0/bat-ptl-vm/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156416v1/bat-ptl-vm/igt@xe_module_load@load.html

  
  [Intel XE#6287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6287


Build changes
-------------

  * Linux: xe-3972-2d884504f47b972c124197c8380c5533324c96d0 -> xe-pw-156416v1

  IGT_8595: 8595
  xe-3972-2d884504f47b972c124197c8380c5533324c96d0: 2d884504f47b972c124197c8380c5533324c96d0
  xe-pw-156416v1: 156416v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156416v1/index.html

--===============5450817507381308450==
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
<tr><td><b>Series:</b></td><td>Enable DP2.1 alpm</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156416/">https://patchwork.freedesktop.org/series/156416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156416v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156416v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3972-2d884504f47b972c124197c8380c5533324c96d0_BAT -&gt; xe-pw-156416v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156416v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3972-2d884504f47b972c124197c8380c5533324c96d0/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156416v1/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6287">Intel XE#6287</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3972-2d884504f47b972c124197c8380c5533324c96d0 -&gt; xe-pw-156416v1</li>
</ul>
<p>IGT_8595: 8595<br />
  xe-3972-2d884504f47b972c124197c8380c5533324c96d0: 2d884504f47b972c124197c8380c5533324c96d0<br />
  xe-pw-156416v1: 156416v1</p>

</body>
</html>

--===============5450817507381308450==--
