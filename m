Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F0CD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 13:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA6210E276;
	Thu,  7 May 2026 13:23:09 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDF810E276;
 Thu,  7 May 2026 13:23:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5385037336883459188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/2=5D_drm/xe/dma-buf=3A_handle_empty_bo_and_UAF_races?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 13:23:08 -0000
Message-ID: <177816018810.47681.5065954854911044718@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507115519.115309-3-matthew.auld@intel.com>
In-Reply-To: <20260507115519.115309-3-matthew.auld@intel.com>
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

--===============5385037336883459188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] drm/xe/dma-buf: handle empty bo and UAF races
URL   : https://patchwork.freedesktop.org/series/166133/
State : failure

== Summary ==

CI Bug Log - changes from xe-5011-30f8a0629f6924f24369cac9161b1a9741880259_BAT -> xe-pw-166133v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166133v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166133v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166133v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html

  


Build changes
-------------

  * Linux: xe-5011-30f8a0629f6924f24369cac9161b1a9741880259 -> xe-pw-166133v1

  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5011-30f8a0629f6924f24369cac9161b1a9741880259: 30f8a0629f6924f24369cac9161b1a9741880259
  xe-pw-166133v1: 166133v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/index.html

--===============5385037336883459188==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] drm/xe/dma-buf: handle empty bo and UAF races</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166133/">https://patchwork.freedesktop.org/series/166133/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5011-30f8a0629f6924f24369cac9161b1a9741880259_BAT -&gt; xe-pw-166133v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166133v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166133v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166133v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5011-30f8a0629f6924f24369cac9161b1a9741880259/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166133v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5011-30f8a0629f6924f24369cac9161b1a9741880259 -&gt; xe-pw-166133v1</li>
</ul>
<p>IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5011-30f8a0629f6924f24369cac9161b1a9741880259: 30f8a0629f6924f24369cac9161b1a9741880259<br />
  xe-pw-166133v1: 166133v1</p>

</body>
</html>

--===============5385037336883459188==--
