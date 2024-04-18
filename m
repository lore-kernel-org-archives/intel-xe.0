Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139DDC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 16:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2891113DF4;
	Thu, 18 Apr 2024 16:49:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B074113DF5;
 Thu, 18 Apr 2024 16:49:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1622481483756769638=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIENJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBLaWxsIHhlX2RldmljZV9t?=
 =?utf-8?b?ZW1fYWNjZXNzX3tnZXQqLHB1dH0gKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 16:49:10 -0000
Message-ID: <171345895030.1501116.9291449636001013461@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418125307.39579-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240418125307.39579-1-rodrigo.vivi@intel.com>
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

--===============1622481483756769638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Kill xe_device_mem_access_{get*,put} (rev2)
URL   : https://patchwork.freedesktop.org/series/132601/
State : success

== Summary ==

CI Bug Log - changes from xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba_BAT -> xe-pw-132601v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132601v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +22 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#288]) +22 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#255])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#1008])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#977])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#977])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#979]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#979]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - bat-atsm-2:         [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - bat-adlp-7:         [INCOMPLETE][12] ([Intel XE#1044]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba -> xe-pw-132601v2

  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba: 15a5d7875da5807b5bf0e5bd3ca9678f64335bba
  xe-pw-132601v2: 132601v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/index.html

--===============1622481483756769638==
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
<tr><td><b>Series:</b></td><td>drm/xe: Kill xe_device_mem_access_{get*,put} (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132601/">https://patchwork.freedesktop.org/series/132601/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba_BAT -&gt; xe-pw-132601v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132601v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132601v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba -&gt; xe-pw-132601v2</li>
</ul>
<p>IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba: 15a5d7875da5807b5bf0e5bd3ca9678f64335bba<br />
  xe-pw-132601v2: 132601v2</p>

</body>
</html>

--===============1622481483756769638==--
