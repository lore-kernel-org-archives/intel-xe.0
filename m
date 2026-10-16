Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116FDCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 08:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB44610E119;
	Fri, 16 Oct 2026 08:07:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8D10E119;
 Fri, 16 Oct 2026 08:07:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7488801430782697189=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Isolate_permanent?=
 =?utf-8?q?ly_wedged_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 08:07:10 -0000
Message-ID: <179213803052.34131.9545678896449097343@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016071832.222574-1-arvind.yadav@intel.com>
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
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

--===============7488801430782697189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Isolate permanently wedged devices
URL   : https://patchwork.freedesktop.org/series/176267/
State : failure

== Summary ==

CI Bug Log - changes from xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4_BAT -> xe-pw-176267v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176267v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176267v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176267v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-1:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-2:         [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-1:          [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-2:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-176267v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][23] -> [ABORT][24] ([Intel XE#9463])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4 -> xe-pw-176267v1

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4: 80c7a1d738b654b45717944325a57ff9e2ae3de4
  xe-pw-176267v1: 176267v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/index.html

--===============7488801430782697189==
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
<tr><td><b>Series:</b></td><td>drm/xe: Isolate permanently wedged devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176267/">https://patchwork.freedesktop.org/series/176267/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4_BAT -&gt; xe-pw-176267v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176267v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176267v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176267v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176267v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4 -&gt; xe-pw-176267v1</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5957-80c7a1d738b654b45717944325a57ff9e2ae3de4: 80c7a1d738b654b45717944325a57ff9e2ae3de4<br />
  xe-pw-176267v1: 176267v1</p>

</body>
</html>

--===============7488801430782697189==--
