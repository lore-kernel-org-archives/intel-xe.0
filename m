Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A436CAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 13:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46D010E94F;
	Thu, 25 Sep 2025 13:56:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497E310E956;
 Thu, 25 Sep 2025 13:56:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2218442551150046665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_dma-buf_private_interconnec?=
 =?utf-8?q?t_POC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Sep 2025 13:56:06 -0000
Message-ID: <175880856629.366817.832161599456020826@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
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

--===============2218442551150046665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dma-buf private interconnect POC
URL   : https://patchwork.freedesktop.org/series/155043/
State : failure

== Summary ==

CI Bug Log - changes from xe-3829-7644974e648c270a56954b0344b1d0330698e1fa_BAT -> xe-pw-155043v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155043v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155043v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155043v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
    - bat-adlp-vm:        [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-adlp-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-adlp-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-ptl-vm}:       [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html
    - {bat-ptl-2}:        [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - {bat-ptl-1}:        [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-155043v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][15] -> [FAIL][16] ([Intel XE#2909]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-1:          [PASS][17] -> [FAIL][18] ([Intel XE#2909]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
    - bat-lnl-2:          [PASS][19] -> [FAIL][20] ([Intel XE#2909]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-lnl-1:          [PASS][21] -> [FAIL][22] ([Intel XE#2909]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909


Build changes
-------------

  * Linux: xe-3829-7644974e648c270a56954b0344b1d0330698e1fa -> xe-pw-155043v1

  IGT_8552: 8552
  xe-3829-7644974e648c270a56954b0344b1d0330698e1fa: 7644974e648c270a56954b0344b1d0330698e1fa
  xe-pw-155043v1: 155043v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/index.html

--===============2218442551150046665==
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
<tr><td><b>Series:</b></td><td>dma-buf private interconnect POC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155043/">https://patchwork.freedesktop.org/series/155043/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3829-7644974e648c270a56954b0344b1d0330698e1fa_BAT -&gt; xe-pw-155043v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155043v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155043v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155043v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-adlp-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-adlp-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155043v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3829-7644974e648c270a56954b0344b1d0330698e1fa/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155043v1/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3829-7644974e648c270a56954b0344b1d0330698e1fa -&gt; xe-pw-155043v1</li>
</ul>
<p>IGT_8552: 8552<br />
  xe-3829-7644974e648c270a56954b0344b1d0330698e1fa: 7644974e648c270a56954b0344b1d0330698e1fa<br />
  xe-pw-155043v1: 155043v1</p>

</body>
</html>

--===============2218442551150046665==--
