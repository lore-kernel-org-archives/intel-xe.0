Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1146DFF885A
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 21:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C342D10E49E;
	Sat, 25 Apr 2026 21:50:10 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D6610E49E;
 Sat, 25 Apr 2026 21:50:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2053424835577072442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Fix_CDCLK_and_s?=
 =?utf-8?q?caler_prefill_calculations_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Apr 2026 21:50:09 -0000
Message-ID: <177715380901.11421.2574039472159377069@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
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

--===============2053424835577072442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Fix CDCLK and scaler prefill calculations (rev6)
URL   : https://patchwork.freedesktop.org/series/156138/
State : success

== Summary ==

CI Bug Log - changes from xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_BAT -> xe-pw-156138v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_BAT and xe-pw-156138v6_BAT:

### New IGT tests (5) ###

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in xe-pw-156138v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/bat-bmg-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156138v6/bat-bmg-2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f -> xe-pw-156138v6

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f: 6784fa94a98ae6fceef9c2c171c3e9fb8be6585f
  xe-pw-156138v6: 156138v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156138v6/index.html

--===============2053424835577072442==
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
<tr><td><b>Series:</b></td><td>drm/i915: Fix CDCLK and scaler prefill calculations (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156138/">https://patchwork.freedesktop.org/series/156138/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156138v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156138v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_BAT -&gt; xe-pw-156138v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_BAT and xe-pw-156138v6_BAT:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156138v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156138v6/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f -&gt; xe-pw-156138v6</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f: 6784fa94a98ae6fceef9c2c171c3e9fb8be6585f<br />
  xe-pw-156138v6: 156138v6</p>

</body>
</html>

--===============2053424835577072442==--
