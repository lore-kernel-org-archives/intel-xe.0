Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A0FF88089
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 07:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BF910E81D;
	Thu, 16 Apr 2026 07:16:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79910E81D;
 Thu, 16 Apr 2026 07:16:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4104628203383561068=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Reject_unsafe_PAT?=
 =?utf-8?q?_indices_for_CPU_cached_memory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 07:16:18 -0000
Message-ID: <177632377888.467464.14344829257794672462@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416051957.651337-1-jia.yao@intel.com>
In-Reply-To: <20260416051957.651337-1-jia.yao@intel.com>
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

--===============4104628203383561068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reject unsafe PAT indices for CPU cached memory
URL   : https://patchwork.freedesktop.org/series/164972/
State : failure

== Summary ==

CI Bug Log - changes from xe-4909-137513b61b4f187957d0c0f44c63c8549893f970_BAT -> xe-pw-164972v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164972v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164972v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164972v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@userptr-coh-none:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-bmg-1/igt@xe_pat@userptr-coh-none.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-bmg-1/igt@xe_pat@userptr-coh-none.html
    - bat-bmg-2:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-bmg-2/igt@xe_pat@userptr-coh-none.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-bmg-2/igt@xe_pat@userptr-coh-none.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-atsm-2/igt@xe_pat@userptr-coh-none.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-atsm-2/igt@xe_pat@userptr-coh-none.html

  


Build changes
-------------

  * Linux: xe-4909-137513b61b4f187957d0c0f44c63c8549893f970 -> xe-pw-164972v1

  IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4909-137513b61b4f187957d0c0f44c63c8549893f970: 137513b61b4f187957d0c0f44c63c8549893f970
  xe-pw-164972v1: 164972v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/index.html

--===============4104628203383561068==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reject unsafe PAT indices for CPU cached memory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164972/">https://patchwork.freedesktop.org/series/164972/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4909-137513b61b4f187957d0c0f44c63c8549893f970_BAT -&gt; xe-pw-164972v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164972v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-164972v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-164972v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@userptr-coh-none:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-bmg-1/igt@xe_pat@userptr-coh-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-bmg-1/igt@xe_pat@userptr-coh-none.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-bmg-2/igt@xe_pat@userptr-coh-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-bmg-2/igt@xe_pat@userptr-coh-none.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/bat-atsm-2/igt@xe_pat@userptr-coh-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164972v1/bat-atsm-2/igt@xe_pat@userptr-coh-none.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4909-137513b61b4f187957d0c0f44c63c8549893f970 -&gt; xe-pw-164972v1</li>
</ul>
<p>IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4909-137513b61b4f187957d0c0f44c63c8549893f970: 137513b61b4f187957d0c0f44c63c8549893f970<br />
  xe-pw-164972v1: 164972v1</p>

</body>
</html>

--===============4104628203383561068==--
