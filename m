Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E3D5E136
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 11:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF33C10E70A;
	Tue, 16 Dec 2025 11:34:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6185210E70A;
 Tue, 16 Dec 2025 11:34:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4261529802199976690=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=3A_Use_the_con?=
 =?utf-8?q?solidated_HDMI_tables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 11:34:08 -0000
Message-ID: <176588484839.93218.16245687902465951070@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216082732.1384018-1-suraj.kandpal@intel.com>
In-Reply-To: <20251216082732.1384018-1-suraj.kandpal@intel.com>
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

--===============4261529802199976690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: Use the consolidated HDMI tables
URL   : https://patchwork.freedesktop.org/series/159083/
State : success

== Summary ==

CI Bug Log - changes from xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c_BAT -> xe-pw-159083v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159083v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c -> xe-pw-159083v1

  IGT_8666: 8666
  xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c: 301c90aee06999676070d16b9f508541f7d5bf5c
  xe-pw-159083v1: 159083v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/index.html

--===============4261529802199976690==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: Use the consolidated HDMI tables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159083/">https://patchwork.freedesktop.org/series/159083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c_BAT -&gt; xe-pw-159083v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159083v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159083v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c -&gt; xe-pw-159083v1</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4251-301c90aee06999676070d16b9f508541f7d5bf5c: 301c90aee06999676070d16b9f508541f7d5bf5c<br />
  xe-pw-159083v1: 159083v1</p>

</body>
</html>

--===============4261529802199976690==--
