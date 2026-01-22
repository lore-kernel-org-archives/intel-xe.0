Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A01C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 10:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD910E05D;
	Thu, 22 Jan 2026 10:21:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915A610E05D;
 Thu, 22 Jan 2026 10:21:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2772588611368026497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_Xe_Uncorrectable_?=
 =?utf-8?q?Error_Handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jan 2026 10:21:55 -0000
Message-ID: <176907731559.182891.7488743928992460707@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122100613.3631582-10-riana.tauro@intel.com>
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
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

--===============2772588611368026497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce Xe Uncorrectable Error Handling
URL   : https://patchwork.freedesktop.org/series/160482/
State : success

== Summary ==

CI Bug Log - changes from xe-4433-40800011414446888105f6beae6dd3fac56516aa_BAT -> xe-pw-160482v1_BAT
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

  Here are the changes found in xe-pw-160482v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][1] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][2] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][3] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][4] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        [SKIP][5] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][6] ([Intel XE#288]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][7] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][8] ([Intel XE#288]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8711 -> IGT_8712
  * Linux: xe-4433-40800011414446888105f6beae6dd3fac56516aa -> xe-pw-160482v1

  IGT_8711: 38428617bae65b39b306f79217ac922ebee3b477 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8712: 8712
  xe-4433-40800011414446888105f6beae6dd3fac56516aa: 40800011414446888105f6beae6dd3fac56516aa
  xe-pw-160482v1: 160482v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/index.html

--===============2772588611368026497==
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
<tr><td><b>Series:</b></td><td>Introduce Xe Uncorrectable Error Handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160482/">https://patchwork.freedesktop.org/series/160482/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4433-40800011414446888105f6beae6dd3fac56516aa_BAT -&gt; xe-pw-160482v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160482v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4433-40800011414446888105f6beae6dd3fac56516aa/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160482v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8711 -&gt; IGT_8712</li>
<li>Linux: xe-4433-40800011414446888105f6beae6dd3fac56516aa -&gt; xe-pw-160482v1</li>
</ul>
<p>IGT_8711: 38428617bae65b39b306f79217ac922ebee3b477 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8712: 8712<br />
  xe-4433-40800011414446888105f6beae6dd3fac56516aa: 40800011414446888105f6beae6dd3fac56516aa<br />
  xe-pw-160482v1: 160482v1</p>

</body>
</html>

--===============2772588611368026497==--
