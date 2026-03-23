Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B052F483F8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 22:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6EA10E4E6;
	Mon, 23 Mar 2026 22:01:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEAD89D9A;
 Mon, 23 Mar 2026 22:01:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7953729268366491091=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Always_invalidate?=
 =?utf-8?q?_TLBs_on_userptr_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Mar 2026 22:01:00 -0000
Message-ID: <177430326030.387756.5373453689671396943@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260323211743.285064-1-stuart.summers@intel.com>
In-Reply-To: <20260323211743.285064-1-stuart.summers@intel.com>
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

--===============7953729268366491091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Always invalidate TLBs on userptr invalidation
URL   : https://patchwork.freedesktop.org/series/163735/
State : failure

== Summary ==

CI Bug Log - changes from xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db_BAT -> xe-pw-163735v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163735v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163735v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163735v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - bat-bmg-3:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@twice-userptr-invalidate:
    - bat-wcl-2:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate.html

  * igt@xe_exec_basic@twice-userptr-invalidate@bcs0:
    - bat-lnl-2:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@bcs0.html

  * igt@xe_exec_basic@twice-userptr-invalidate@ccs0:
    - bat-wcl-2:          [PASS][11] -> [DMESG-WARN][12] +2 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html
    - bat-ptl-1:          [PASS][13] -> [DMESG-WARN][14] +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html

  * igt@xe_exec_basic@twice-userptr-invalidate@rcs0:
    - bat-lnl-2:          [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html
    - bat-ptl-1:          [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html

  


Build changes
-------------

  * IGT: IGT_8819 -> IGT_8820
  * Linux: xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db -> xe-pw-163735v1

  IGT_8819: 8819
  IGT_8820: b2f96bfbce5dd7903530e7e3eb0bbeb01eaecfeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db: a5c5cfbd8c7054ac678f91dac548c0201df274db
  xe-pw-163735v1: 163735v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/index.html

--===============7953729268366491091==
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
<tr><td><b>Series:</b></td><td>drm/xe: Always invalidate TLBs on userptr invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163735/">https://patchwork.freedesktop.org/series/163735/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db_BAT -&gt; xe-pw-163735v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163735v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163735v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163735v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@bcs0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@bcs0.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@ccs0:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-wcl-2/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@ccs0.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate@rcs0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-lnl-2/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163735v1/bat-ptl-1/igt@xe_exec_basic@twice-userptr-invalidate@rcs0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8819 -&gt; IGT_8820</li>
<li>Linux: xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db -&gt; xe-pw-163735v1</li>
</ul>
<p>IGT_8819: 8819<br />
  IGT_8820: b2f96bfbce5dd7903530e7e3eb0bbeb01eaecfeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4764-a5c5cfbd8c7054ac678f91dac548c0201df274db: a5c5cfbd8c7054ac678f91dac548c0201df274db<br />
  xe-pw-163735v1: 163735v1</p>

</body>
</html>

--===============7953729268366491091==--
