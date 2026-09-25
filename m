Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DB3C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 21:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2910E24E;
	Fri, 25 Sep 2026 21:20:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB4210E10B;
 Fri, 25 Sep 2026 21:20:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5713985013958081553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_i2c=3A_designware=3A_Add_TI?=
 =?utf-8?q?_TDA54_I2C_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 21:20:09 -0000
Message-ID: <179037120951.208907.16931367000183159558@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925-tda54-upstream-i2c-v3-0-544d74e992ff@ti.com>
In-Reply-To: <20260925-tda54-upstream-i2c-v3-0-544d74e992ff@ti.com>
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

--===============5713985013958081553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i2c: designware: Add TI TDA54 I2C support (rev2)
URL   : https://patchwork.freedesktop.org/series/175011/
State : success

== Summary ==

CI Bug Log - changes from xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74_BAT -> xe-pw-175011v2_BAT
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

  Here are the changes found in xe-pw-175011v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [TIMEOUT][3] ([Intel XE#9152]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-ptl-2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-ptl-2/igt@xe_waitfence@abstime.html
    - bat-wcl-1:          [TIMEOUT][5] ([Intel XE#9226]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-wcl-1/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-wcl-1/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-wcl-1:          [FAIL][7] ([Intel XE#9103]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-wcl-1/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-wcl-1/igt@xe_waitfence@engine.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152
  [Intel XE#9226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9226


Build changes
-------------

  * Linux: xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74 -> xe-pw-175011v2

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74: d3e3b787ba0daa01200907e0efeaa3f7da201a74
  xe-pw-175011v2: 175011v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/index.html

--===============5713985013958081553==
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
<tr><td><b>Series:</b></td><td>i2c: designware: Add TI TDA54 I2C support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175011/">https://patchwork.freedesktop.org/series/175011/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74_BAT -&gt; xe-pw-175011v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175011v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-wcl-1/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9226">Intel XE#9226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-wcl-1/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74 -&gt; xe-pw-175011v2</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74: d3e3b787ba0daa01200907e0efeaa3f7da201a74<br />
  xe-pw-175011v2: 175011v2</p>

</body>
</html>

--===============5713985013958081553==--
