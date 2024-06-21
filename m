Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1388EC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 09:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37210F135;
	Fri, 21 Jun 2024 09:53:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361C010F135;
 Fri, 21 Jun 2024 09:53:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7675083518670778687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/lnl=3A_Offload_system_cle?=
 =?utf-8?q?ar_page_activity_to_GPU_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 09:53:27 -0000
Message-ID: <171896360721.131799.15932843498194692580@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621085348.23372-1-nirmoy.das@intel.com>
In-Reply-To: <20240621085348.23372-1-nirmoy.das@intel.com>
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

--===============7675083518670778687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lnl: Offload system clear page activity to GPU (rev2)
URL   : https://patchwork.freedesktop.org/series/135120/
State : failure

== Summary ==

CI Bug Log - changes from xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc_BAT -> xe-pw-135120v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135120v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135120v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135120v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +6 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +12 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][7] -> [FAIL][8] +7 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-lnl-1}:        [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-135120v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#324])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7894 -> IGT_7895
  * Linux: xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc -> xe-pw-135120v2

  IGT_7894: 7894
  IGT_7895: 7895
  xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc: 40deb379b103746ee4c9df5f0f1919bd4703c9cc
  xe-pw-135120v2: 135120v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/index.html

--===============7675083518670778687==
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
<tr><td><b>Series:</b></td><td>drm/xe/lnl: Offload system clear page activity to GPU (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135120/">https://patchwork.freedesktop.org/series/135120/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc_BAT -&gt; xe-pw-135120v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135120v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135120v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135120v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135120v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135120v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7894 -&gt; IGT_7895</li>
<li>Linux: xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc -&gt; xe-pw-135120v2</li>
</ul>
<p>IGT_7894: 7894<br />
  IGT_7895: 7895<br />
  xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc: 40deb379b103746ee4c9df5f0f1919bd4703c9cc<br />
  xe-pw-135120v2: 135120v2</p>

</body>
</html>

--===============7675083518670778687==--
