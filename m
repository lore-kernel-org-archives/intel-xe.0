Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E730CD1296
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE9410FA6A;
	Fri,  5 Apr 2024 18:51:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82B810FA6A;
 Fri,  5 Apr 2024 18:51:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6785947454237330185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Remove_debug_message_f?=
 =?utf-8?q?rom_migrate=5Fclear=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 18:51:45 -0000
Message-ID: <171234310575.1239329.13666570540218801847@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405153849.44906-1-jose.souza@intel.com>
In-Reply-To: <20240405153849.44906-1-jose.souza@intel.com>
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

--===============6785947454237330185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove debug message from migrate_clear()
URL   : https://patchwork.freedesktop.org/series/132088/
State : success

== Summary ==

CI Bug Log - changes from xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72_BAT -> xe-pw-132088v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132088v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473


Build changes
-------------

  * Linux: xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72 -> xe-pw-132088v1

  IGT_7801: 7801
  xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72: 8cb1ee178ef7e504e233814ef50c1f18f42dac72
  xe-pw-132088v1: 132088v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/index.html

--===============6785947454237330185==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove debug message from migrate_clear()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132088/">https://patchwork.freedesktop.org/series/132088/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72_BAT -&gt; xe-pw-132088v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132088v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132088v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72 -&gt; xe-pw-132088v1</li>
</ul>
<p>IGT_7801: 7801<br />
  xe-1048-8cb1ee178ef7e504e233814ef50c1f18f42dac72: 8cb1ee178ef7e504e233814ef50c1f18f42dac72<br />
  xe-pw-132088v1: 132088v1</p>

</body>
</html>

--===============6785947454237330185==--
