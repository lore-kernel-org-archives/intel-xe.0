Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE4AD6C285
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 18:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C081D10E094;
	Tue, 19 Nov 2024 18:10:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDC210E094;
 Tue, 19 Nov 2024 18:10:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2964839672511174389=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Don=27t_allo?=
 =?utf-8?q?w_odd_ypan_or_ysize_with_semiplanar_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 18:10:35 -0000
Message-ID: <173203983500.373309.16649986889844272293@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119172544.861424-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241119172544.861424-1-juhapekka.heikkila@gmail.com>
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

--===============2964839672511174389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Don't allow odd ypan or ysize with semiplanar format
URL   : https://patchwork.freedesktop.org/series/141561/
State : success

== Summary ==

CI Bug Log - changes from xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de_BAT -> xe-pw-141561v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141561v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#1033]) -> [DMESG-FAIL][2] ([Intel XE#1033])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-lnl-1:          [DMESG-FAIL][3] ([Intel XE#3466]) -> [INCOMPLETE][4] ([Intel XE#3466])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html
    - bat-lnl-2:          [INCOMPLETE][5] ([Intel XE#3466]) -> [DMESG-FAIL][6] ([Intel XE#3466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-lnl-2:          [DMESG-FAIL][7] ([Intel XE#3466]) -> [DMESG-WARN][8] ([Intel XE#3466])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466


Build changes
-------------

  * Linux: xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de -> xe-pw-141561v1

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de: c2bd638d71d621e6887e15ae2e7bf1571b9599de
  xe-pw-141561v1: 141561v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/index.html

--===============2964839672511174389==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Don&#x27;t allow odd ypan or ysize with semiplanar format</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141561/">https://patchwork.freedesktop.org/series/141561/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de_BAT -&gt; xe-pw-141561v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141561v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141561v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de -&gt; xe-pw-141561v1</li>
</ul>
<p>IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de: c2bd638d71d621e6887e15ae2e7bf1571b9599de<br />
  xe-pw-141561v1: 141561v1</p>

</body>
</html>

--===============2964839672511174389==--
