Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC11D10F58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 15:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B0210E453;
	Mon, 18 Nov 2024 15:52:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8110E453;
 Mon, 18 Nov 2024 15:52:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6381145615023142993=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_MST_and_DDI_cleanups?=
 =?utf-8?q?_and_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 15:52:16 -0000
Message-ID: <173194513622.1264219.15635298202994019075@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731941270.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731941270.git.jani.nikula@intel.com>
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

--===============6381145615023142993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: MST and DDI cleanups and refactoring
URL   : https://patchwork.freedesktop.org/series/141501/
State : success

== Summary ==

CI Bug Log - changes from xe-2246-90014f8026e31874d368834834253debd131268b_BAT -> xe-pw-141501v1_BAT
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

  Here are the changes found in xe-pw-141501v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3466]) +32 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3466]) +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-lnl-2:          NOTRUN -> [DMESG-FAIL][5] ([Intel XE#3466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [DMESG-WARN][6] ([Intel XE#3466]) -> [PASS][7] +2 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [DMESG-WARN][8] -> [PASS][9] +103 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-lnl-1:          [INCOMPLETE][10] -> [DMESG-FAIL][11] ([Intel XE#3466])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html

  
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466


Build changes
-------------

  * Linux: xe-2246-90014f8026e31874d368834834253debd131268b -> xe-pw-141501v1

  IGT_8114: 8114
  xe-2246-90014f8026e31874d368834834253debd131268b: 90014f8026e31874d368834834253debd131268b
  xe-pw-141501v1: 141501v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/index.html

--===============6381145615023142993==
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
<tr><td><b>Series:</b></td><td>drm/i915: MST and DDI cleanups and refactoring</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141501/">https://patchwork.freedesktop.org/series/141501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2246-90014f8026e31874d368834834253debd131268b_BAT -&gt; xe-pw-141501v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141501v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +32 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> +103 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@many-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2246-90014f8026e31874d368834834253debd131268b/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v1/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2246-90014f8026e31874d368834834253debd131268b -&gt; xe-pw-141501v1</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2246-90014f8026e31874d368834834253debd131268b: 90014f8026e31874d368834834253debd131268b<br />
  xe-pw-141501v1: 141501v1</p>

</body>
</html>

--===============6381145615023142993==--
