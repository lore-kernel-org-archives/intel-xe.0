Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C66CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 20:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3854410E9D6;
	Wed, 27 May 2026 20:31:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC4510E9D6;
 Wed, 27 May 2026 20:31:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2207910714292981683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/mmio=3A_Assert_MMIO_?=
 =?utf-8?q?is_available?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 20:31:42 -0000
Message-ID: <177991390216.17309.2814774102691696262@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260527175437.22585-1-michal.wajdeczko@intel.com>
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

--===============2207910714292981683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Assert MMIO is available
URL   : https://patchwork.freedesktop.org/series/167403/
State : failure

== Summary ==

CI Bug Log - changes from xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb_BAT -> xe-pw-167403v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167403v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167403v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167403v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-vm:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-wcl-2:          [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-2:          [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-adlp-7:         [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-bmg-1:          [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-ptl-2:          [PASS][19] -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-atsm-2:         [PASS][21] -> [ABORT][22] +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-wcl-1:          [PASS][23] -> [ABORT][24] +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  


Build changes
-------------

  * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -> xe-pw-167403v1

  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb
  xe-pw-167403v1: 167403v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/index.html

--===============2207910714292981683==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Assert MMIO is available</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167403/">https://patchwork.freedesktop.org/series/167403/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb_BAT -&gt; xe-pw-167403v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167403v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167403v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167403v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -&gt; xe-pw-167403v1</li>
</ul>
<p>IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb<br />
  xe-pw-167403v1: 167403v1</p>

</body>
</html>

--===============2207910714292981683==--
