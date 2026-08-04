Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051CFC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88EF10EB19;
	Tue,  4 Aug 2026 16:17:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613B10EB15;
 Tue,  4 Aug 2026 16:17:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1765442535971715727=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_DONOT-Review=3A_Pin_vram_li?=
 =?utf-8?q?mit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 16:17:18 -0000
Message-ID: <178586023840.18879.14171198985329435414@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804150444.1304980-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260804150444.1304980-2-himal.prasad.ghimiray@intel.com>
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

--===============1765442535971715727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONOT-Review: Pin vram limit (rev3)
URL   : https://patchwork.freedesktop.org/series/171544/
State : failure

== Summary ==

CI Bug Log - changes from xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64_BAT -> xe-pw-171544v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171544v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171544v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171544v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-vm:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  * {igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit} (NEW):
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-bmg-vm:         NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-wcl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-1:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-atsm-2:         NOTRUN -> [DMESG-WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html
    - bat-wcl-2:          NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html

  
New tests
---------

  New tests have been introduced between xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64_BAT and xe-pw-171544v3_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit:
    - Statuses : 3 dmesg-warn(s) 8 skip(s)
    - Exec time: [0.02, 0.15] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64 -> xe-pw-171544v3

  IGT_9037: 9037
  xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64: 0377b35cbeef071dfeed06ccadc0d7607eccaa64
  xe-pw-171544v3: 171544v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/index.html

--===============1765442535971715727==
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
<tr><td><b>Series:</b></td><td>DONOT-Review: Pin vram limit (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171544/">https://patchwork.freedesktop.org/series/171544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64_BAT -&gt; xe-pw-171544v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171544v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171544v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171544v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-lnl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-wcl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-ptl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171544v3/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64_BAT and xe-pw-171544v3_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_pin_limit_kunit:<ul>
<li>Statuses : 3 dmesg-warn(s) 8 skip(s)</li>
<li>Exec time: [0.02, 0.15] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64 -&gt; xe-pw-171544v3</li>
</ul>
<p>IGT_9037: 9037<br />
  xe-5540-0377b35cbeef071dfeed06ccadc0d7607eccaa64: 0377b35cbeef071dfeed06ccadc0d7607eccaa64<br />
  xe-pw-171544v3: 171544v3</p>

</body>
</html>

--===============1765442535971715727==--
