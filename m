Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1A606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 23:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012EF10E47E;
	Thu, 26 Nov 2026 23:44:07 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E94C10E47B;
 Thu, 26 Nov 2026 23:44:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4048230202172400535=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cdclk=3A_Fix_2_PPC?=
 =?utf-8?q?_hscale_adjustment_for_min_CDCLK?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 23:44:06 -0000
Message-ID: <179573664657.96058.3498812500298647535@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126191032.1961148-1-uma.shankar@intel.com>
In-Reply-To: <20261126191032.1961148-1-uma.shankar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4048230202172400535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK
URL   : https://patchwork.freedesktop.org/series/179791/
State : success

== Summary ==

CI Bug Log - changes from xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c_BAT -> xe-pw-179791v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 15)
------------------------------

  Additional (2): bat-bmg-vm bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-179791v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#8265])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@xe_ccs@block-copy-compressed:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#6360]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#5563] / [Intel XE#688]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#7482]) +17 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#288] / [Intel XE#5561]) +33 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#8376]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-bmg-vm:         NOTRUN -> [SKIP][9] ([Intel XE#8364]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_multi_queue@priority:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#8364] / [Intel XE#8377]) +13 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_multi_queue@priority.html

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#4915]) +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-vm:         NOTRUN -> [SKIP][13] ([Intel XE#2229])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#9657])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][15] ([Intel XE#2229] / [Intel XE#5488])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][16] ([Intel XE#1008] / [Intel XE#5591])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-auto:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#8434])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-auto.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         NOTRUN -> [SKIP][18] ([Intel XE#977])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         NOTRUN -> [SKIP][19] ([Intel XE#2838] / [Intel XE#979])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][20] ([Intel XE#1420] / [Intel XE#7590])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-vm:         NOTRUN -> [SKIP][21] ([Intel XE#2245] / [Intel XE#7590])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-7:         NOTRUN -> [SKIP][22] ([Intel XE#979])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][23] ([Intel XE#2236] / [Intel XE#7590])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][24] ([Intel XE#9841]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * Linux: xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c -> xe-pw-179791v1

  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c: 436eec0ef1b65f139fa2f3c42aea97c29da57c8c
  xe-pw-179791v1: 179791v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/index.html

--===============4048230202172400535==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179791/">https://patchwork.freedesktop.org/series/179791/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c_BAT -&gt; xe-pw-179791v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 15)</h2>
<p>Additional (2): bat-bmg-vm bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179791v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179791v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c -&gt; xe-pw-179791v1</li>
</ul>
<p>IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6243-436eec0ef1b65f139fa2f3c42aea97c29da57c8c: 436eec0ef1b65f139fa2f3c42aea97c29da57c8c<br />
  xe-pw-179791v1: 179791v1</p>

</body>
</html>

--===============4048230202172400535==--
