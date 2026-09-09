Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CAAC79FBD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 17:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569F410E206;
	Wed,  9 Sep 2026 17:48:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BAC10E206;
 Wed,  9 Sep 2026 17:48:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4550234573486192907=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_wa=5F14025941?=
 =?utf-8?q?587_to_xe2=2C_xe3_and_xe3p_platforms_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 17:48:04 -0000
Message-ID: <178897608459.143971.16089571149854156672@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============4550234573486192907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev9)
URL   : https://patchwork.freedesktop.org/series/167706/
State : success

== Summary ==

CI Bug Log - changes from xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673_BAT -> xe-pw-167706v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-167706v9_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/bat-ptl-2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9115])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673/bat-ptl-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673 -> xe-pw-167706v9

  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673: 0d30bc4f35590b6353a77f23e397ab2168b69673
  xe-pw-167706v9: 167706v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/index.html

--===============4550234573486192907==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167706/">https://patchwork.freedesktop.org/series/167706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673_BAT -&gt; xe-pw-167706v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167706v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v9/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673 -&gt; xe-pw-167706v9</li>
</ul>
<p>IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673: 0d30bc4f35590b6353a77f23e397ab2168b69673<br />
  xe-pw-167706v9: 167706v9</p>

</body>
</html>

--===============4550234573486192907==--
