Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4604CCDB475
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 19:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C9410E7FB;
	Mon, 22 Jun 2026 19:33:24 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02C10E7E4;
 Mon, 22 Jun 2026 19:33:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3431140822867945929=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_All_pat?=
 =?utf-8?q?ches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev17=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 19:33:24 -0000
Message-ID: <178215680431.102902.16610601155877063006@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622181044.39335-1-dev@lankhorst.se>
In-Reply-To: <20260622181044.39335-1-dev@lankhorst.se>
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

--===============3431140822867945929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev17)
URL   : https://patchwork.freedesktop.org/series/159034/
State : success

== Summary ==

CI Bug Log - changes from xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798_BAT -> xe-pw-159034v17_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159034v17_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#5408]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v17/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408


Build changes
-------------

  * IGT: IGT_8976 -> IGT_8977
  * Linux: xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798 -> xe-pw-159034v17

  IGT_8976: 8976
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798: 6583dd200482a34bb17e5dc54551f91f53b79798
  xe-pw-159034v17: 159034v17

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v17/index.html

--===============3431140822867945929==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev17)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v17/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v17/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798_BAT -&gt; xe-pw-159034v17_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159034v17_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v17/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8976 -&gt; IGT_8977</li>
<li>Linux: xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798 -&gt; xe-pw-159034v17</li>
</ul>
<p>IGT_8976: 8976<br />
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798: 6583dd200482a34bb17e5dc54551f91f53b79798<br />
  xe-pw-159034v17: 159034v17</p>

</body>
</html>

--===============3431140822867945929==--
