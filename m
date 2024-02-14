Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EDDC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 15:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60EF10E36F;
	Wed, 14 Feb 2024 15:03:26 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977F710E395;
 Wed, 14 Feb 2024 15:03:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3088148932326808046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Expose_user_fence_from_xe=5Fsync=5Fentry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Feb 2024 15:03:25 -0000
Message-ID: <170792300562.1238604.7078893682567544631@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
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

--===============3088148932326808046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Expose user fence from xe_sync_entry
URL   : https://patchwork.freedesktop.org/series/129900/
State : failure

== Summary ==

CI Bug Log - changes from xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6_BAT -> xe-pw-129900v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129900v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129900v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129900v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-129900v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][3] ([Intel XE#1238]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7711 -> IGT_7712
  * Linux: xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6 -> xe-pw-129900v1

  IGT_7711: 7711
  IGT_7712: 0571a65a21fcfc3b5fb0e6004e0ee8bc7539cafc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6: 7b20177760d6b94898d9a9fa6c6077027daeacc6
  xe-pw-129900v1: 129900v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/index.html

--===============3088148932326808046==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Expose user fence from xe_sync_entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129900/">https://patchwork.freedesktop.org/series/129900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6_BAT -&gt; xe-pw-129900v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129900v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129900v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129900v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic-prefetch:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129900v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7711 -&gt; IGT_7712</li>
<li>Linux: xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6 -&gt; xe-pw-129900v1</li>
</ul>
<p>IGT_7711: 7711<br />
  IGT_7712: 0571a65a21fcfc3b5fb0e6004e0ee8bc7539cafc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-777-7b20177760d6b94898d9a9fa6c6077027daeacc6: 7b20177760d6b94898d9a9fa6c6077027daeacc6<br />
  xe-pw-129900v1: 129900v1</p>

</body>
</html>

--===============3088148932326808046==--
