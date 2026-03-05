Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B519F47CA9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 18:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD76D10EC70;
	Thu,  5 Mar 2026 18:32:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED07D10EC70;
 Thu,  5 Mar 2026 18:32:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6005950091930435005=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Refactor_LT_PHY_PLL_handlin?=
 =?utf-8?q?g_to_use_DPLL_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 18:32:39 -0000
Message-ID: <177273555995.322779.7111824613626312841@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304131423.1017821-1-mika.kahola@intel.com>
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
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

--===============6005950091930435005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor LT PHY PLL handling to use DPLL framework (rev2)
URL   : https://patchwork.freedesktop.org/series/161586/
State : failure

== Summary ==

CI Bug Log - changes from xe-4661-1242b36e0da950a66f2267e1c15395962dad569c_BAT -> xe-pw-161586v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161586v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161586v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161586v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-wcl-1:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:
    - bat-bmg-1:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - bat-ptl-2:          [PASS][11] -> [DMESG-WARN][12] +2 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
    - bat-wcl-1:          [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [PASS][15] -> [DMESG-WARN][16] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3:
    - bat-bmg-1:          [PASS][17] -> [DMESG-WARN][18] +2 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][19] ([Intel XE#7483]) -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * Linux: xe-4661-1242b36e0da950a66f2267e1c15395962dad569c -> xe-pw-161586v2

  IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4661-1242b36e0da950a66f2267e1c15395962dad569c: 1242b36e0da950a66f2267e1c15395962dad569c
  xe-pw-161586v2: 161586v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/index.html

--===============6005950091930435005==
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
<tr><td><b>Series:</b></td><td>Refactor LT PHY PLL handling to use DPLL framework (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161586/">https://patchwork.freedesktop.org/series/161586/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4661-1242b36e0da950a66f2267e1c15395962dad569c_BAT -&gt; xe-pw-161586v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161586v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161586v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161586v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-wcl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a3.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4661-1242b36e0da950a66f2267e1c15395962dad569c -&gt; xe-pw-161586v2</li>
</ul>
<p>IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4661-1242b36e0da950a66f2267e1c15395962dad569c: 1242b36e0da950a66f2267e1c15395962dad569c<br />
  xe-pw-161586v2: 161586v2</p>

</body>
</html>

--===============6005950091930435005==--
