Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19070CEACEF
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 00:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928710ED54;
	Sat, 15 Nov 2025 00:14:43 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80A110ED59;
 Sat, 15 Nov 2025 00:14:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6952083015148554720=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Scope-based_forcewake_and_r?=
 =?utf-8?q?untime_PM_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Nov 2025 00:14:42 -0000
Message-ID: <176316568274.55609.2521696956660746826@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

--===============6952083015148554720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Scope-based forcewake and runtime PM (rev4)
URL   : https://patchwork.freedesktop.org/series/157253/
State : success

== Summary ==

CI Bug Log - changes from xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61_BAT -> xe-pw-157253v4_BAT
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

  Here are the changes found in xe-pw-157253v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v4/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61 -> xe-pw-157253v4

  IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61: 5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61
  xe-pw-157253v4: 157253v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v4/index.html

--===============6952083015148554720==
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
<tr><td><b>Series:</b></td><td>Scope-based forcewake and runtime PM (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157253/">https://patchwork.freedesktop.org/series/157253/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61_BAT -&gt; xe-pw-157253v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157253v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v4/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61 -&gt; xe-pw-157253v4</li>
</ul>
<p>IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61: 5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61<br />
  xe-pw-157253v4: 157253v4</p>

</body>
</html>

--===============6952083015148554720==--
