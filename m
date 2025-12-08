Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE2DD3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D872D10E123;
	Mon,  8 Dec 2025 19:20:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB9210E0E6;
 Mon,  8 Dec 2025 19:20:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1199028816011864258=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_ggtt_fb_align?=
 =?utf-8?q?ment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Dec 2025 19:20:24 -0000
Message-ID: <176522162495.67164.11100971103620664935@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251208181550.6618-1-tursulin@igalia.com>
In-Reply-To: <20251208181550.6618-1-tursulin@igalia.com>
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

--===============1199028816011864258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix ggtt fb alignment
URL   : https://patchwork.freedesktop.org/series/158649/
State : success

== Summary ==

CI Bug Log - changes from xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732_BAT -> xe-pw-158649v1_BAT
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

  Here are the changes found in xe-pw-158649v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#6610])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158649v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#6610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6610


Build changes
-------------

  * IGT: IGT_8658 -> IGT_8659
  * Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -> xe-pw-158649v1

  IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8659: 8659
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7fca330da8b2806732
  xe-pw-158649v1: 158649v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158649v1/index.html

--===============1199028816011864258==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix ggtt fb alignment</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158649/">https://patchwork.freedesktop.org/series/158649/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158649v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158649v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732_BAT -&gt; xe-pw-158649v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158649v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158649v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6610">Intel XE#6610</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8658 -&gt; IGT_8659</li>
<li>Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -&gt; xe-pw-158649v1</li>
</ul>
<p>IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8659: 8659<br />
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7fca330da8b2806732<br />
  xe-pw-158649v1: 158649v1</p>

</body>
</html>

--===============1199028816011864258==--
