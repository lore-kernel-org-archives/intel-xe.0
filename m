Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856EFC3ABBF
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 08:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3D310E1E1;
	Tue,  6 May 2025 08:36:31 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE66210E1E1;
 Tue,  6 May 2025 08:36:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8242535183393246103=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_BMG_PCIe_link_downgrade_att?=
 =?utf-8?q?ributes_and_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 08:36:29 -0000
Message-ID: <174652058996.50382.771488606354510096@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502183739.3308069-1-raag.jadav@intel.com>
In-Reply-To: <20250502183739.3308069-1-raag.jadav@intel.com>
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

--===============8242535183393246103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: BMG PCIe link downgrade attributes and usage (rev2)
URL   : https://patchwork.freedesktop.org/series/148460/
State : success

== Summary ==

CI Bug Log - changes from xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e_BAT -> xe-pw-148460v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-148460v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2464]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#1008])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        NOTRUN -> [ABORT][3] ([Intel XE#3970]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#2468])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#3342])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][6] ([Intel XE#3970]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e -> xe-pw-148460v2

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e: 0135b020716c4986b53b735e41753ebb8ed43c3e
  xe-pw-148460v2: 148460v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/index.html

--===============8242535183393246103==
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
<tr><td><b>Series:</b></td><td>BMG PCIe link downgrade attributes and usage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148460/">https://patchwork.freedesktop.org/series/148460/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e_BAT -&gt; xe-pw-148460v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148460v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148460v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e -&gt; xe-pw-148460v2</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3027-0135b020716c4986b53b735e41753ebb8ed43c3e: 0135b020716c4986b53b735e41753ebb8ed43c3e<br />
  xe-pw-148460v2: 148460v2</p>

</body>
</html>

--===============8242535183393246103==--
