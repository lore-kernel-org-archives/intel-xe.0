Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE06F10F2871
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 22:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896E210EF06;
	Fri, 27 Mar 2026 22:44:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2976310EE5E;
 Fri, 27 Mar 2026 22:44:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7986885549841041104=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dmc=3A_Update_PIP?=
 =?utf-8?q?EDMC_interrupt_mask_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 22:44:20 -0000
Message-ID: <177465146014.407613.14599564299822830078@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327064453.2241523-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260327064453.2241523-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============7986885549841041104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Update PIPEDMC interrupt mask (rev5)
URL   : https://patchwork.freedesktop.org/series/162933/
State : success

== Summary ==

CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_FULL -> xe-pw-162933v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-162933v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][3] ([Intel XE#301]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][5] ([Intel XE#7340]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -> xe-pw-162933v5

  IGT_8834: 8834
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b
  xe-pw-162933v5: 162933v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/index.html

--===============7986885549841041104==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Update PIPEDMC interrupt mask (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162933/">https://patchwork.freedesktop.org/series/162933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_FULL -&gt; xe-pw-162933v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162933v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162933v5/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -&gt; xe-pw-162933v5</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b<br />
  xe-pw-162933v5: 162933v5</p>

</body>
</html>

--===============7986885549841041104==--
