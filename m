Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8BCC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F9F10E37B;
	Fri, 14 Feb 2025 21:43:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540A10E37B;
 Fri, 14 Feb 2025 21:43:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7285000018227592155=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe=5Fdrm=5Fclient=3A?=
 =?utf-8?q?_Add_per_drm_client_reset_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 21:43:07 -0000
Message-ID: <173956938734.2171531.11136662980250322669@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

--===============7285000018227592155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_drm_client: Add per drm client reset stats
URL   : https://patchwork.freedesktop.org/series/144903/
State : failure

== Summary ==

CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_BAT -> xe-pw-144903v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144903v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144903v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144903v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2] +5 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-bmg-2/igt@xe_evict@evict-beng-small-cm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-bmg-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-pvc-2:          [PASS][7] -> [DMESG-WARN][8] +7 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  


Build changes
-------------

  * Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -> xe-pw-144903v1

  IGT_8230: 8230
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36
  xe-pw-144903v1: 144903v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html

--===============7285000018227592155==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_drm_client: Add per drm client reset stats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144903/">https://patchwork.freedesktop.org/series/144903/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_BAT -&gt; xe-pw-144903v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144903v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144903v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144903v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-bmg-2/igt@xe_evict@evict-beng-small-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-bmg-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -&gt; xe-pw-144903v1</li>
</ul>
<p>IGT_8230: 8230<br />
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36<br />
  xe-pw-144903v1: 144903v1</p>

</body>
</html>

--===============7285000018227592155==--
