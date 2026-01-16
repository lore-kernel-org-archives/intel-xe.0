Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A2D4899A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 12:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678510E880;
	Fri, 16 Jan 2026 12:39:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDBD10E880;
 Fri, 16 Jan 2026 12:39:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2082060869520001581=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add_Wa=5F1402?=
 =?utf-8?q?5883347_for_GuC_DMA_failure_on_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 12:39:25 -0000
Message-ID: <176856716511.161648.2816206898933875732@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260116103451.304716-4-sk.anirban@intel.com>
In-Reply-To: <20260116103451.304716-4-sk.anirban@intel.com>
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

--===============2082060869520001581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset (rev2)
URL   : https://patchwork.freedesktop.org/series/160091/
State : failure

== Summary ==

CI Bug Log - changes from xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a_BAT -> xe-pw-160091v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160091v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160091v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160091v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-2:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-ptl-2:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_module_load@load:
    - bat-ptl-vm:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-vm/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-vm/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a -> xe-pw-160091v2

  IGT_8704: 8704
  xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a: 278a33d3977124821c19b51fb88d9d651b4fe40a
  xe-pw-160091v2: 160091v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/index.html

--===============2082060869520001581==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160091/">https://patchwork.freedesktop.org/series/160091/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a_BAT -&gt; xe-pw-160091v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160091v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160091v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160091v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v2/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a -&gt; xe-pw-160091v2</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a: 278a33d3977124821c19b51fb88d9d651b4fe40a<br />
  xe-pw-160091v2: 160091v2</p>

</body>
</html>

--===============2082060869520001581==--
