Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A0AFD2D7C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 13:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0410E6D1;
	Tue, 10 Mar 2026 13:24:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180DC10E6C3;
 Tue, 10 Mar 2026 13:24:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7904731911531393870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_All_pat?=
 =?utf-8?q?ches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 13:24:50 -0000
Message-ID: <177314909007.338604.600254982659337213@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310115709.2276203-1-dev@lankhorst.se>
In-Reply-To: <20260310115709.2276203-1-dev@lankhorst.se>
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

--===============7904731911531393870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev14)
URL   : https://patchwork.freedesktop.org/series/159034/
State : success

== Summary ==

CI Bug Log - changes from xe-4686-77e176657e782bb81270c230d1cfec91f7707162_BAT -> xe-pw-159034v14_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in xe-pw-159034v14_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#7249])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4686-77e176657e782bb81270c230d1cfec91f7707162/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v14/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249


Build changes
-------------

  * IGT: IGT_8788 -> IGT_8790
  * Linux: xe-4686-77e176657e782bb81270c230d1cfec91f7707162 -> xe-pw-159034v14

  IGT_8788: 476cbad7c600b2779022bf8771b3ab4efeaa3db5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8790: 4626b8c809cf894b9f512d9a17d5ce0f8682a235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4686-77e176657e782bb81270c230d1cfec91f7707162: 77e176657e782bb81270c230d1cfec91f7707162
  xe-pw-159034v14: 159034v14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v14/index.html

--===============7904731911531393870==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v14/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v14/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4686-77e176657e782bb81270c230d1cfec91f7707162_BAT -&gt; xe-pw-159034v14_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159034v14_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4686-77e176657e782bb81270c230d1cfec91f7707162/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v14/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8788 -&gt; IGT_8790</li>
<li>Linux: xe-4686-77e176657e782bb81270c230d1cfec91f7707162 -&gt; xe-pw-159034v14</li>
</ul>
<p>IGT_8788: 476cbad7c600b2779022bf8771b3ab4efeaa3db5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8790: 4626b8c809cf894b9f512d9a17d5ce0f8682a235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4686-77e176657e782bb81270c230d1cfec91f7707162: 77e176657e782bb81270c230d1cfec91f7707162<br />
  xe-pw-159034v14: 159034v14</p>

</body>
</html>

--===============7904731911531393870==--
