Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B7FC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 15:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3C710E796;
	Wed,  6 Aug 2025 15:07:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5392A10E796;
 Wed,  6 Aug 2025 15:07:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1797819948920612694=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/ttm=3A_WIP_limit_the_TT?=
 =?utf-8?q?M_pool_to_32bit_CPUs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 15:07:39 -0000
Message-ID: <175449285933.216422.13273728533231823290@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806132838.1831-1-christian.koenig@amd.com>
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>
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

--===============1797819948920612694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: WIP limit the TTM pool to 32bit CPUs
URL   : https://patchwork.freedesktop.org/series/152588/
State : failure

== Summary ==

CI Bug Log - changes from xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802_BAT -> xe-pw-152588v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152588v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152588v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152588v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +26 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +26 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@xe_pat@pat-index-xe2@dw:
    - bat-lnl-2:          [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-ptl-2}:        [PASS][7] -> [FAIL][8] +15 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-ptl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-ptl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@xe_pat@pat-index-xe2@blt:
    - {bat-ptl-1}:        [PASS][9] -> [FAIL][10] +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html

  
Known issues
------------

  Here are the changes found in xe-pw-152588v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] ([Intel XE#5671])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671


Build changes
-------------

  * Linux: xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802 -> xe-pw-152588v1

  IGT_8487: 8487
  xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802: 886b8d8ef3839f604e3e7f6187ac6c46eb21b802
  xe-pw-152588v1: 152588v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/index.html

--===============1797819948920612694==
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
<tr><td><b>Series:</b></td><td>drm/ttm: WIP limit the TTM pool to 32bit CPUs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152588/">https://patchwork.freedesktop.org/series/152588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802_BAT -&gt; xe-pw-152588v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152588v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152588v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152588v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@dw:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-ptl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-ptl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@blt:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152588v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152588v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671">Intel XE#5671</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802 -&gt; xe-pw-152588v1</li>
</ul>
<p>IGT_8487: 8487<br />
  xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802: 886b8d8ef3839f604e3e7f6187ac6c46eb21b802<br />
  xe-pw-152588v1: 152588v1</p>

</body>
</html>

--===============1797819948920612694==--
