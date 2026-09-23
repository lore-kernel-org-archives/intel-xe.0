Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C4C9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78110E15E;
	Wed, 23 Sep 2026 18:46:57 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349D10E15E;
 Wed, 23 Sep 2026 18:46:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3910361451236395496=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_drm/i915/vrr=3A_Use_vrr=2Ein=5Frange_to_determine_if_we_need_?=
 =?utf-8?q?the_AS_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 18:46:55 -0000
Message-ID: <179018921553.198725.8934039734639219226@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
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

--===============3910361451236395496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915/vrr: Use vrr.in_range to determine if we need the AS SDP
URL   : https://patchwork.freedesktop.org/series/174830/
State : success

== Summary ==

CI Bug Log - changes from xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d_BAT -> xe-pw-174830v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174830v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][1] ([Intel XE#9109]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/bat-ptl-2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-bmg-2:          [FAIL][3] ([Intel XE#9115]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d/bat-bmg-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/bat-bmg-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d -> xe-pw-174830v1

  IGT_9110: 9110
  xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d: dd560c03f8fc40dbfadecfb761abce88b268be1d
  xe-pw-174830v1: 174830v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/index.html

--===============3910361451236395496==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915/vrr: Use vrr.in_range to determine if we need the AS SDP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174830/">https://patchwork.freedesktop.org/series/174830/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d_BAT -&gt; xe-pw-174830v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174830v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d/bat-bmg-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174830v1/bat-bmg-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d -&gt; xe-pw-174830v1</li>
</ul>
<p>IGT_9110: 9110<br />
  xe-5813-dd560c03f8fc40dbfadecfb761abce88b268be1d: dd560c03f8fc40dbfadecfb761abce88b268be1d<br />
  xe-pw-174830v1: 174830v1</p>

</body>
</html>

--===============3910361451236395496==--
