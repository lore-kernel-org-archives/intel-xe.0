Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9CCC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 21:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DB710E107;
	Tue,  4 Aug 2026 21:33:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562210E04B;
 Tue,  4 Aug 2026 21:33:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5630003291794106813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_DONOT-Review=3A_Pin_vram_li?=
 =?utf-8?q?mit_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 21:33:35 -0000
Message-ID: <178587921573.19127.13084968686943408301@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804203343.1381637-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260804203343.1381637-2-himal.prasad.ghimiray@intel.com>
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

--===============5630003291794106813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONOT-Review: Pin vram limit (rev5)
URL   : https://patchwork.freedesktop.org/series/171544/
State : failure

== Summary ==

CI Bug Log - changes from xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT -> xe-pw-171544v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171544v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171544v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171544v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-vm:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  * {igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit} (NEW):
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-bmg-vm:         NOTRUN -> [DMESG-WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-wcl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-1:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-atsm-2:         NOTRUN -> [DMESG-WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-wcl-2:          NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html

  
New tests
---------

  New tests have been introduced between xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT and xe-pw-171544v5_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit:
    - Statuses : 4 dmesg-warn(s) 8 skip(s)
    - Exec time: [0.02, 0.16] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_9037 -> IGT_9038
  * Linux: xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b -> xe-pw-171544v5

  IGT_9037: 9037
  IGT_9038: 9038
  xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b: 814bd7de7f09446c4b9401eecb8b30c3285af78b
  xe-pw-171544v5: 171544v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/index.html

--===============5630003291794106813==
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
<tr><td><b>Series:</b></td><td>DONOT-Review: Pin vram limit (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171544/">https://patchwork.freedesktop.org/series/171544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT -&gt; xe-pw-171544v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171544v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171544v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171544v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-wcl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v5/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT and xe-pw-171544v5_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit:<ul>
<li>Statuses : 4 dmesg-warn(s) 8 skip(s)</li>
<li>Exec time: [0.02, 0.16] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9037 -&gt; IGT_9038</li>
<li>Linux: xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b -&gt; xe-pw-171544v5</li>
</ul>
<p>IGT_9037: 9037<br />
  IGT_9038: 9038<br />
  xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b: 814bd7de7f09446c4b9401eecb8b30c3285af78b<br />
  xe-pw-171544v5: 171544v5</p>

</body>
</html>

--===============5630003291794106813==--
