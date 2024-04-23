Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D21C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 16:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19081134B3;
	Tue, 23 Apr 2024 16:44:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBE51134B3;
 Tue, 23 Apr 2024 16:44:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2887158082092801608=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_R?=
 =?utf-8?q?evert_=22drm/xe/vm=3A_drop_vm-=3Edestroy=5Fwork=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 16:44:33 -0000
Message-ID: <171389067324.1608578.17089427296189304656@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423074721.119633-3-matthew.auld@intel.com>
In-Reply-To: <20240423074721.119633-3-matthew.auld@intel.com>
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

--===============2887158082092801608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] Revert "drm/xe/vm: drop vm->destroy_work" (rev2)
URL   : https://patchwork.freedesktop.org/series/132756/
State : success

== Summary ==

CI Bug Log - changes from xe-1160-22610da92b8883caee927eb63c57249972979d68_BAT -> xe-pw-132756v2_BAT
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

  Here are the changes found in xe-pw-132756v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-basic:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#1256]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1160-22610da92b8883caee927eb63c57249972979d68/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v2/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256


Build changes
-------------

  * Linux: xe-1160-22610da92b8883caee927eb63c57249972979d68 -> xe-pw-132756v2

  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1160-22610da92b8883caee927eb63c57249972979d68: 22610da92b8883caee927eb63c57249972979d68
  xe-pw-132756v2: 132756v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v2/index.html

--===============2887158082092801608==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] Revert &quot;drm/xe/vm: drop vm-&gt;destroy_work&quot; (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132756/">https://patchwork.freedesktop.org/series/132756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1160-22610da92b8883caee927eb63c57249972979d68_BAT -&gt; xe-pw-132756v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132756v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1160-22610da92b8883caee927eb63c57249972979d68/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v2/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1160-22610da92b8883caee927eb63c57249972979d68 -&gt; xe-pw-132756v2</li>
</ul>
<p>IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1160-22610da92b8883caee927eb63c57249972979d68: 22610da92b8883caee927eb63c57249972979d68<br />
  xe-pw-132756v2: 132756v2</p>

</body>
</html>

--===============2887158082092801608==--
