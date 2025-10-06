Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782B4CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A33F10E413;
	Mon,  6 Oct 2025 15:58:35 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47A10E413;
 Mon,  6 Oct 2025 15:58:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1740844851594430383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_=3A_Add_GPU_work_period_sup?=
 =?utf-8?q?port_for_Xe_driver_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 15:58:33 -0000
Message-ID: <175976631384.8781.4599260279203340196@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

--===============1740844851594430383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : Add GPU work period support for Xe driver (rev5)
URL   : https://patchwork.freedesktop.org/series/153341/
State : failure

== Summary ==

CI Bug Log - changes from xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc_BAT -> xe-pw-153341v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153341v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153341v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153341v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
New tests
---------

  New tests have been introduced between xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc_BAT and xe-pw-153341v5_BAT:

### New IGT tests (1) ###

  * igt@xe_waitfence:
    - Statuses :
    - Exec time: [None] s

  



Build changes
-------------

  * Linux: xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc -> xe-pw-153341v5

  IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc: 29dc3d947463e9e9756a253801e5cc4466536ecc
  xe-pw-153341v5: 153341v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/index.html

--===============1740844851594430383==
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
<tr><td><b>Series:</b></td><td>: Add GPU work period support for Xe driver (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153341/">https://patchwork.freedesktop.org/series/153341/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc_BAT -&gt; xe-pw-153341v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153341v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153341v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153341v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc_BAT and xe-pw-153341v5_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_waitfence:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc -&gt; xe-pw-153341v5</li>
</ul>
<p>IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3871-29dc3d947463e9e9756a253801e5cc4466536ecc: 29dc3d947463e9e9756a253801e5cc4466536ecc<br />
  xe-pw-153341v5: 153341v5</p>

</body>
</html>

--===============1740844851594430383==--
