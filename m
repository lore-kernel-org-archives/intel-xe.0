Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFABCD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 20:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2910E292;
	Thu, 11 Jun 2026 20:00:15 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12AF10E2B0;
 Thu, 11 Jun 2026 20:00:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5504062559488792308=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/debugfs=3A_Add_a_deb?=
 =?utf-8?q?ugfs_for_pcode_information_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 20:00:13 -0000
Message-ID: <178120801384.70087.14660632967959739565@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
In-Reply-To: <20260611165607.3653019-1-karthik.poosa@intel.com>
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

--===============5504062559488792308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Add a debugfs for pcode information (rev3)
URL   : https://patchwork.freedesktop.org/series/163703/
State : failure

== Summary ==

CI Bug Log - changes from xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18_BAT -> xe-pw-163703v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163703v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163703v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163703v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_debugfs@read-all-entries:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-bmg-vm/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-bmg-vm/igt@core_debugfs@read-all-entries.html
    - bat-ptl-vm:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-ptl-vm/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-ptl-vm/igt@core_debugfs@read-all-entries.html
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  


Build changes
-------------

  * Linux: xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18 -> xe-pw-163703v3

  IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18: c0a463345cc689fec0dbdea86cd5729123676e18
  xe-pw-163703v3: 163703v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/index.html

--===============5504062559488792308==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Add a debugfs for pcode information (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163703/">https://patchwork.freedesktop.org/series/163703/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18_BAT -&gt; xe-pw-163703v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163703v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163703v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163703v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-bmg-vm/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-bmg-vm/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-ptl-vm/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-ptl-vm/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163703v3/bat-atsm-2/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18 -&gt; xe-pw-163703v3</li>
</ul>
<p>IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18: c0a463345cc689fec0dbdea86cd5729123676e18<br />
  xe-pw-163703v3: 163703v3</p>

</body>
</html>

--===============5504062559488792308==--
