Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE72CD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696711A7ED;
	Fri,  5 Jun 2026 12:18:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65F711A7ED;
 Fri,  5 Jun 2026 12:18:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8987808739048805849=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Fix_use-after-fre?=
 =?utf-8?q?e_race_in_xe=5Fpt=5Fzap=5Fptes_and_xe=5Fpt=5Fzap=5Fptes=5Frange?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 12:18:25 -0000
Message-ID: <178066190580.47432.3348128551666716764@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605105202.1664464-1-francois.dugast@intel.com>
In-Reply-To: <20260605105202.1664464-1-francois.dugast@intel.com>
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

--===============8987808739048805849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix use-after-free race in xe_pt_zap_ptes and xe_pt_zap_ptes_range
URL   : https://patchwork.freedesktop.org/series/167948/
State : failure

== Summary ==

CI Bug Log - changes from xe-5208-e3821511385af9b3b404fe878418937eec48de9f_BAT -> xe-pw-167948v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167948v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167948v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167948v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-167948v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - bat-bmg-2:          [PASS][3] -> [ABORT][4] ([Intel XE#8007])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] ([Intel XE#8007])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html
    - bat-bmg-vm:         [PASS][7] -> [ABORT][8] ([Intel XE#8007])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - bat-bmg-3:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5208-e3821511385af9b3b404fe878418937eec48de9f -> xe-pw-167948v1

  IGT_8949: 8949
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f
  xe-pw-167948v1: 167948v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/index.html

--===============8987808739048805849==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix use-after-free race in xe_pt_zap_ptes and xe_pt_zap_ptes_range</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167948/">https://patchwork.freedesktop.org/series/167948/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5208-e3821511385af9b3b404fe878418937eec48de9f_BAT -&gt; xe-pw-167948v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167948v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167948v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167948v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-userptr:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167948v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167948v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5208-e3821511385af9b3b404fe878418937eec48de9f -&gt; xe-pw-167948v1</li>
</ul>
<p>IGT_8949: 8949<br />
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f<br />
  xe-pw-167948v1: 167948v1</p>

</body>
</html>

--===============8987808739048805849==--
