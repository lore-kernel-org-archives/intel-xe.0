Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA2C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 18:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7AF10E09D;
	Mon, 25 Mar 2024 18:43:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B830C10E09D;
 Mon, 25 Mar 2024 18:43:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4155136891530730538=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_enum_instead_of_ha?=
 =?utf-8?q?rd_coding_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 18:43:29 -0000
Message-ID: <171139220975.1038098.17697344840717965187@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
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

--===============4155136891530730538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use enum instead of hard coding (rev2)
URL   : https://patchwork.freedesktop.org/series/131460/
State : success

== Summary ==

CI Bug Log - changes from xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14_BAT -> xe-pw-131460v2_BAT
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

  Here are the changes found in xe-pw-131460v2_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [DMESG-WARN][1] ([Intel XE#1373]) -> [DMESG-WARN][2] ([Intel XE#1088] / [Intel XE#1373])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][3] ([Intel XE#1044] / [Intel XE#1376]) -> [INCOMPLETE][4] ([Intel XE#1044])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376


Build changes
-------------

  * IGT: IGT_7781 -> IGT_7782
  * Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -> xe-pw-131460v2

  IGT_7781: 7781
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14
  xe-pw-131460v2: 131460v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/index.html

--===============4155136891530730538==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use enum instead of hard coding (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131460/">https://patchwork.freedesktop.org/series/131460/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14_BAT -&gt; xe-pw-131460v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131460v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131460v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7781 -&gt; IGT_7782</li>
<li>Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -&gt; xe-pw-131460v2</li>
</ul>
<p>IGT_7781: 7781<br />
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14<br />
  xe-pw-131460v2: 131460v2</p>

</body>
</html>

--===============4155136891530730538==--
