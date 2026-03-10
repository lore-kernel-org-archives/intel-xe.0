Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D87AFD4F23
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 19:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2710E167;
	Tue, 10 Mar 2026 19:08:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DBC10E167;
 Tue, 10 Mar 2026 19:08:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0217428633985884231=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Add_syste?=
 =?utf-8?q?m_controller_component_for_Xe3p_dGPU_platforms_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 19:08:46 -0000
Message-ID: <177316972647.340892.14359216150512590957@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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

--===============0217428633985884231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev10)
URL   : https://patchwork.freedesktop.org/series/159554/
State : success

== Summary ==

CI Bug Log - changes from xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7_BAT -> xe-pw-159554v10_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159554v10_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8791 -> IGT_8792
  * Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -> xe-pw-159554v10

  IGT_8791: b319fd1815d426b3f24094113d614d08dee374d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8792: 8792
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb59323357535a459eb64f02d94f7
  xe-pw-159554v10: 159554v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/index.html

--===============0217428633985884231==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159554/">https://patchwork.freedesktop.org/series/159554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7_BAT -&gt; xe-pw-159554v10_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159554v10_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8791 -&gt; IGT_8792</li>
<li>Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -&gt; xe-pw-159554v10</li>
</ul>
<p>IGT_8791: b319fd1815d426b3f24094113d614d08dee374d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8792: 8792<br />
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb59323357535a459eb64f02d94f7<br />
  xe-pw-159554v10: 159554v10</p>

</body>
</html>

--===============0217428633985884231==--
