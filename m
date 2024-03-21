Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E31FCD11BF
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 03:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6FE10EDD6;
	Thu, 21 Mar 2024 03:12:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C7A10E066;
 Thu, 21 Mar 2024 03:12:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4595079666380209062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Change_userptr_so_it_can_be_unif?=
 =?utf-8?q?ied_with_hmmptr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 03:12:35 -0000
Message-ID: <171099075522.938557.3559885778381917916@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321022939.2279979-1-oak.zeng@intel.com>
In-Reply-To: <20240321022939.2279979-1-oak.zeng@intel.com>
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

--===============4595079666380209062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Change userptr so it can be unified with hmmptr
URL   : https://patchwork.freedesktop.org/series/131398/
State : failure

== Summary ==

CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -> xe-pw-131398v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131398v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131398v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131398v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
    - bat-pvc-2:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
    - bat-atsm-2:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@twice-userptr-invalidate:
    - bat-adlp-7:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-adlp-7/igt@xe_exec_basic@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-adlp-7/igt@xe_exec_basic@twice-userptr-invalidate.html

  


Build changes
-------------

  * IGT: IGT_7772 -> IGT_7773
  * Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -> xe-pw-131398v1

  IGT_7772: 7772
  IGT_7773: 7773
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c
  xe-pw-131398v1: 131398v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/index.html

--===============4595079666380209062==
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
<tr><td><b>Series:</b></td><td>Change userptr so it can be unified with hmmptr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131398/">https://patchwork.freedesktop.org/series/131398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -&gt; xe-pw-131398v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131398v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131398v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131398v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-968-b8290992108644cb99d7d9db2921bb25369ead3c/bat-adlp-7/igt@xe_exec_basic@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131398v1/bat-adlp-7/igt@xe_exec_basic@twice-userptr-invalidate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7772 -&gt; IGT_7773</li>
<li>Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -&gt; xe-pw-131398v1</li>
</ul>
<p>IGT_7772: 7772<br />
  IGT_7773: 7773<br />
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c<br />
  xe-pw-131398v1: 131398v1</p>

</body>
</html>

--===============4595079666380209062==--
