Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BAC53200
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828BF10E798;
	Fri, 20 Feb 2026 08:20:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D624210E798;
 Fri, 20 Feb 2026 08:20:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7517014045547203222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_PSR/PR_Selective_Fetch_Earl?=
 =?utf-8?q?y_Transport_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Feb 2026 08:20:43 -0000
Message-ID: <177157564385.269145.16356697304649929242@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219130743.1232188-1-jouni.hogander@intel.com>
In-Reply-To: <20260219130743.1232188-1-jouni.hogander@intel.com>
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

--===============7517014045547203222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PSR/PR Selective Fetch Early Transport fixes
URL   : https://patchwork.freedesktop.org/series/161835/
State : success

== Summary ==

CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_BAT -> xe-pw-161835v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-161835v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][2] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#455]) -> [SKIP][4] ([Intel XE#2244] / [Intel XE#455])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#455]) -> [SKIP][6] ([Intel XE#2244] / [Intel XE#455])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         [SKIP][7] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][8] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][9] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][10] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][11] ([i915#1836]) -> [SKIP][12] ([Intel XE#829] / [i915#1836]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#1024] / [Intel XE#1406]) -> [SKIP][14] ([Intel XE#1024] / [Intel XE#1406] / [Intel XE#947]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-wcl-2:          [SKIP][15] ([Intel XE#1406]) -> [SKIP][16] ([Intel XE#1406] / [Intel XE#2850]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][18] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-lnl-1:          [SKIP][19] ([Intel XE#688]) -> [SKIP][20] ([Intel XE#6540] / [Intel XE#688]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][21] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][22] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-lnl-2:          [SKIP][23] ([Intel XE#688]) -> [SKIP][24] ([Intel XE#6540] / [Intel XE#688]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-adlp-7:         [SKIP][25] ([Intel XE#688]) -> [SKIP][26] ([Intel XE#5563] / [Intel XE#688]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        [SKIP][27] ([Intel XE#688]) -> [SKIP][28] ([Intel XE#5563] / [Intel XE#688])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         [SKIP][29] ([Intel XE#288]) -> [SKIP][30] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        [SKIP][31] ([Intel XE#288]) -> [SKIP][32] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836


Build changes
-------------

  * Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -> xe-pw-161835v1

  IGT_8761: 8761
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f
  xe-pw-161835v1: 161835v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/index.html

--===============7517014045547203222==
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
<tr><td><b>Series:</b></td><td>PSR/PR Selective Fetch Early Transport fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161835/">https://patchwork.freedesktop.org/series/161835/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_BAT -&gt; xe-pw-161835v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161835v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161835v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -&gt; xe-pw-161835v1</li>
</ul>
<p>IGT_8761: 8761<br />
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f<br />
  xe-pw-161835v1: 161835v1</p>

</body>
</html>

--===============7517014045547203222==--
