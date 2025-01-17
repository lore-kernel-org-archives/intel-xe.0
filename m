Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A7C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 04:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657810E2EE;
	Fri, 17 Jan 2025 04:59:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0B10E2EE;
 Fri, 17 Jan 2025 04:59:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6229567958711567962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/oa=3A_Preserve_oa=5F?=
 =?utf-8?q?ctrl_unused_bits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 04:59:12 -0000
Message-ID: <173708995222.576735.5109311732208703343@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
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

--===============6229567958711567962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Preserve oa_ctrl unused bits
URL   : https://patchwork.freedesktop.org/series/143643/
State : success

== Summary ==

CI Bug Log - changes from xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e_BAT -> xe-pw-143643v1_BAT
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

  Here are the changes found in xe-pw-143643v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4078]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  * igt@xe_vm@shared-pde2-page:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970] / [Intel XE#4078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html

  
#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#4078]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * Linux: xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e -> xe-pw-143643v1

  IGT_8195: 8195
  xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e: 58078c97cb752a5ea9ae2f2e3ab898945153d39e
  xe-pw-143643v1: 143643v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/index.html

--===============6229567958711567962==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Preserve oa_ctrl unused bits</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143643/">https://patchwork.freedesktop.org/series/143643/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e_BAT -&gt; xe-pw-143643v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143643v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143643v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e -&gt; xe-pw-143643v1</li>
</ul>
<p>IGT_8195: 8195<br />
  xe-2502-58078c97cb752a5ea9ae2f2e3ab898945153d39e: 58078c97cb752a5ea9ae2f2e3ab898945153d39e<br />
  xe-pw-143643v1: 143643v1</p>

</body>
</html>

--===============6229567958711567962==--
