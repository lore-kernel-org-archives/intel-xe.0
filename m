Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A0EE77188
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 00:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6610E491;
	Wed, 15 Jan 2025 00:40:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F6710E491;
 Wed, 15 Jan 2025 00:40:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2784697449865805968=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3=3A_Generate_and_?=
 =?utf-8?q?store_the_L3_bank_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 00:40:18 -0000
Message-ID: <173690161880.3753213.13313835583491750045@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250114203853.35055-1-matthew.s.atwood@intel.com>
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

--===============2784697449865805968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Generate and store the L3 bank mask
URL   : https://patchwork.freedesktop.org/series/143531/
State : success

== Summary ==

CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6_BAT -> xe-pw-143531v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-143531v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3958]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [DMESG-WARN][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958


Build changes
-------------

  * Linux: xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6 -> xe-pw-143531v1

  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6: 61e0f64bde73d48e3dc204c129c25e0a15f0d4e6
  xe-pw-143531v1: 143531v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/index.html

--===============2784697449865805968==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Generate and store the L3 bank mask</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143531/">https://patchwork.freedesktop.org/series/143531/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6_BAT -&gt; xe-pw-143531v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143531v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@bb-with-allocator:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6 -&gt; xe-pw-143531v1</li>
</ul>
<p>IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6: 61e0f64bde73d48e3dc204c129c25e0a15f0d4e6<br />
  xe-pw-143531v1: 143531v1</p>

</body>
</html>

--===============2784697449865805968==--
