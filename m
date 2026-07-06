Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51058C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 03:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205810E724;
	Mon,  6 Jul 2026 03:30:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2257D10E71E;
 Mon,  6 Jul 2026 03:30:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5447834006202542390=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_fix_IOVA/DMA_?=
 =?utf-8?q?unmap_leaks_in_=5F=5Fdrm=5Fgpusvm=5Funmap=5Fpages=28=29_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 03:30:49 -0000
Message-ID: <178330864913.152625.8323295790721547330@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260706024642.614238-1-honghuan@amd.com>
In-Reply-To: <20260706024642.614238-1-honghuan@amd.com>
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

--===============5447834006202542390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: fix IOVA/DMA unmap leaks in __drm_gpusvm_unmap_pages() (rev5)
URL   : https://patchwork.freedesktop.org/series/169467/
State : success

== Summary ==

CI Bug Log - changes from xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99_BAT -> xe-pw-169467v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99_BAT and xe-pw-169467v5_BAT:

### New IGT tests (8) ###

  * igt@xe_exec_store@basic-store:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.22] s

  * igt@xe_sysfs_defaults@engine-defaults:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.43] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.39] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-min-max:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.44] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.42] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.45] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.43] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-min-max:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.44] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99 -> xe-pw-169467v5

  IGT_8990: 8990
  xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99: 7f15fa27122a00a78e7bc2722748bb303adbbb99
  xe-pw-169467v5: 169467v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v5/index.html

--===============5447834006202542390==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: fix IOVA/DMA unmap leaks in __drm_gpusvm_unmap_pages() (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169467/">https://patchwork.freedesktop.org/series/169467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99_BAT -&gt; xe-pw-169467v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99_BAT and xe-pw-169467v5_BAT:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-min-max:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-min-max:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.44] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99 -&gt; xe-pw-169467v5</li>
</ul>
<p>IGT_8990: 8990<br />
  xe-5343-7f15fa27122a00a78e7bc2722748bb303adbbb99: 7f15fa27122a00a78e7bc2722748bb303adbbb99<br />
  xe-pw-169467v5: 169467v5</p>

</body>
</html>

--===============5447834006202542390==--
