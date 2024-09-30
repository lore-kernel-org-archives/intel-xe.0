Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB769CF6499
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 12:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A310E423;
	Mon, 30 Sep 2024 12:31:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0AD10E415;
 Mon, 30 Sep 2024 12:31:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4221827419813930309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Workaround_f?=
 =?utf-8?q?or_odd_panning_for_planar_yuv_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 12:31:11 -0000
Message-ID: <172769947162.1134761.3936526600738444205@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
In-Reply-To: <20240930112146.2673086-1-nemesa.garg@intel.com>
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

--===============4221827419813930309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Workaround for odd panning for planar yuv (rev5)
URL   : https://patchwork.freedesktop.org/series/136422/
State : success

== Summary ==

CI Bug Log - changes from xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af_BAT -> xe-pw-136422v5_BAT
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

  Here are the changes found in xe-pw-136422v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2874]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {bat-bmg-2}:        [INCOMPLETE][7] ([Intel XE#2874]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][9] ([Intel XE#2849]) -> [SKIP][10] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-1:          [SKIP][11] ([Intel XE#2849]) -> [SKIP][12] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-2:          [SKIP][13] ([Intel XE#2849]) -> [SKIP][14] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#2849]) -> [SKIP][16] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8038 -> IGT_8040
  * Linux: xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af -> xe-pw-136422v5

  IGT_8038: 8038
  IGT_8040: a216acf3882fd1aee8fab2c2903711052399ee6d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af: c21a1be90c1d1952cbeebe2f66ba80a72cba59af
  xe-pw-136422v5: 136422v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/index.html

--===============4221827419813930309==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Workaround for odd panning for planar yuv (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136422/">https://patchwork.freedesktop.org/series/136422/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af_BAT -&gt; xe-pw-136422v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136422v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-off:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v5/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8038 -&gt; IGT_8040</li>
<li>Linux: xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af -&gt; xe-pw-136422v5</li>
</ul>
<p>IGT_8038: 8038<br />
  IGT_8040: a216acf3882fd1aee8fab2c2903711052399ee6d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1989-c21a1be90c1d1952cbeebe2f66ba80a72cba59af: c21a1be90c1d1952cbeebe2f66ba80a72cba59af<br />
  xe-pw-136422v5: 136422v5</p>

</body>
</html>

--===============4221827419813930309==--
