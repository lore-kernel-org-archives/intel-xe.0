Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB0EC54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 23:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37D10F4DD;
	Tue, 26 Mar 2024 23:30:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822DA10F4DD;
 Tue, 26 Mar 2024 23:30:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2800234987500039688=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gsc=3A_Implement_WA_14018?=
 =?utf-8?q?094691_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Mar 2024 23:30:36 -0000
Message-ID: <171149583653.1054669.11592759200879726384@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326224456.518548-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240326224456.518548-1-daniele.ceraolospurio@intel.com>
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

--===============2800234987500039688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: Implement WA 14018094691 (rev2)
URL   : https://patchwork.freedesktop.org/series/131390/
State : success

== Summary ==

CI Bug Log - changes from xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f_BAT -> xe-pw-131390v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131390v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1373])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][3] ([Intel XE#804])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [FAIL][4] ([Intel XE#1259]) -> [TIMEOUT][5] ([Intel XE#1027] / [Intel XE#1088])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [INCOMPLETE][6] ([Intel XE#804]) -> [INCOMPLETE][7] ([Intel XE#1027] / [Intel XE#804])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * Linux: xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f -> xe-pw-131390v2

  IGT_7785: 7785
  xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f: 1750e10841917cd6fb9cb84bec2c0e134cca212f
  xe-pw-131390v2: 131390v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/index.html

--===============2800234987500039688==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: Implement WA 14018094691 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131390/">https://patchwork.freedesktop.org/series/131390/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f_BAT -&gt; xe-pw-131390v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131390v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131390v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f -&gt; xe-pw-131390v2</li>
</ul>
<p>IGT_7785: 7785<br />
  xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f: 1750e10841917cd6fb9cb84bec2c0e134cca212f<br />
  xe-pw-131390v2: 131390v2</p>

</body>
</html>

--===============2800234987500039688==--
