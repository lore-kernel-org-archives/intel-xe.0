Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D13D3EE6B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 14:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE310E9C0;
	Thu, 22 Jan 2026 14:40:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC5B10E9C0;
 Thu, 22 Jan 2026 14:40:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2188557419322123836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_move_GEN7=5FERR?=
 =?utf-8?q?=5FINT_snapshot_to_display_irq_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jan 2026 14:40:00 -0000
Message-ID: <176909280096.183335.1941555758798658474@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122123759.1701492-1-jani.nikula@intel.com>
In-Reply-To: <20260122123759.1701492-1-jani.nikula@intel.com>
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

--===============2188557419322123836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: move GEN7_ERR_INT snapshot to display irq code
URL   : https://patchwork.freedesktop.org/series/160489/
State : success

== Summary ==

CI Bug Log - changes from xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6_BAT -> xe-pw-160489v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-160489v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8712 -> IGT_8713
  * Linux: xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6 -> xe-pw-160489v1

  IGT_8712: 8712
  IGT_8713: 33d772ed2d772fee329e6200cd968962f695a927 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6: a3ecd278f9a05323fab7471760a7ea10081251d6
  xe-pw-160489v1: 160489v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/index.html

--===============2188557419322123836==
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
<tr><td><b>Series:</b></td><td>drm/i915: move GEN7_ERR_INT snapshot to display irq code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160489/">https://patchwork.freedesktop.org/series/160489/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6_BAT -&gt; xe-pw-160489v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160489v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160489v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8712 -&gt; IGT_8713</li>
<li>Linux: xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6 -&gt; xe-pw-160489v1</li>
</ul>
<p>IGT_8712: 8712<br />
  IGT_8713: 33d772ed2d772fee329e6200cd968962f695a927 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4435-a3ecd278f9a05323fab7471760a7ea10081251d6: a3ecd278f9a05323fab7471760a7ea10081251d6<br />
  xe-pw-160489v1: 160489v1</p>

</body>
</html>

--===============2188557419322123836==--
