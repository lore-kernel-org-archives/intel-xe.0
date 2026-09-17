Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779D6C982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2176810E027;
	Thu, 17 Sep 2026 23:21:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA710E027;
 Thu, 17 Sep 2026 23:21:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7618402188862222868=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Keep_walking_on_S?=
 =?utf-8?q?VM_eviction_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Sep 2026 23:21:42 -0000
Message-ID: <178968730220.177999.14243992759000620707@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917203158.292823-1-matthew.brost@intel.com>
In-Reply-To: <20260917203158.292823-1-matthew.brost@intel.com>
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

--===============7618402188862222868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Keep walking on SVM eviction failure (rev2)
URL   : https://patchwork.freedesktop.org/series/173621/
State : success

== Summary ==

CI Bug Log - changes from xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0_BAT -> xe-pw-173621v2_BAT
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

  Here are the changes found in xe-pw-173621v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9109])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-ptl-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][5] ([Intel XE#9115]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-ptl-2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0 -> xe-pw-173621v2

  IGT_9099: 9099
  xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0: 9f5620af941fb134c8ab86d91625ce699fff2bd0
  xe-pw-173621v2: 173621v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/index.html

--===============7618402188862222868==
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
<tr><td><b>Series:</b></td><td>drm/xe: Keep walking on SVM eviction failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173621/">https://patchwork.freedesktop.org/series/173621/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0_BAT -&gt; xe-pw-173621v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173621v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v2/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0 -&gt; xe-pw-173621v2</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5770-9f5620af941fb134c8ab86d91625ce699fff2bd0: 9f5620af941fb134c8ab86d91625ce699fff2bd0<br />
  xe-pw-173621v2: 173621v2</p>

</body>
</html>

--===============7618402188862222868==--
