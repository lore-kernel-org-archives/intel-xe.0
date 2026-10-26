Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90944606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5299210E07E;
	Mon, 26 Oct 2026 14:12:04 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49410E07E;
 Mon, 26 Oct 2026 14:12:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0918200089474465193=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_xe=3A_select_configf?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 14:12:02 -0000
Message-ID: <179302392289.71286.9260953408368903446@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026102603.2045493-1-arnd@kernel.org>
In-Reply-To: <20261026102603.2045493-1-arnd@kernel.org>
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

--===============0918200089474465193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: xe: select configfs
URL   : https://patchwork.freedesktop.org/series/176848/
State : success

== Summary ==

CI Bug Log - changes from xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3_BAT -> xe-pw-176848v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 15)
------------------------------

  Additional (2): bat-bmg-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-176848v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][1] ([Intel XE#5764]) +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][2] ([Intel XE#7482]) +17 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - bat-ptl-vm:         NOTRUN -> [SKIP][3] ([Intel XE#8364]) +13 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-bmg-vm:         NOTRUN -> [SKIP][4] ([Intel XE#8364]) +13 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][5] ([Intel XE#5775]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-vm:         NOTRUN -> [SKIP][6] ([Intel XE#2229])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][7] ([Intel XE#9657])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] ([Intel XE#5776])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][9] ([Intel XE#5777] / [Intel XE#7590])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][10] ([Intel XE#1420] / [Intel XE#7590])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][11] ([Intel XE#5771] / [Intel XE#7590])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][12] ([Intel XE#2245] / [Intel XE#7590])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][13] ([Intel XE#5780] / [Intel XE#7590])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][14] ([Intel XE#2236] / [Intel XE#7590])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * Linux: xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 -> xe-pw-176848v1

  IGT_9164: 9164
  xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3: 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3
  xe-pw-176848v1: 176848v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/index.html

--===============0918200089474465193==
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
<tr><td><b>Series:</b></td><td>drm: xe: select configfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176848/">https://patchwork.freedesktop.org/series/176848/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3_BAT -&gt; xe-pw-176848v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 15)</h2>
<p>Additional (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176848v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176848v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 -&gt; xe-pw-176848v1</li>
</ul>
<p>IGT_9164: 9164<br />
  xe-6011-8e30a30c4948a9b30b9af31ebfaaa951630ae8a3: 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3<br />
  xe-pw-176848v1: 176848v1</p>

</body>
</html>

--===============0918200089474465193==--
