Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF8ECD11DD
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 11:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA110EEC2;
	Tue, 26 Mar 2024 11:41:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46F010EEC9;
 Tue, 26 Mar 2024 11:41:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5884945552903700466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_new_PCI_IDs_to_DG2?=
 =?utf-8?q?_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Mar 2024 11:41:43 -0000
Message-ID: <171145330373.1039951.1872398660691341788@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
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

--===============5884945552903700466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add new PCI IDs to DG2 platform
URL   : https://patchwork.freedesktop.org/series/131627/
State : success

== Summary ==

CI Bug Log - changes from xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732_BAT -> xe-pw-131627v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131627v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_huc_copy@huc_copy:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1] +20 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  
New tests
---------

  New tests have been introduced between xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732_BAT and xe-pw-131627v1_BAT:

### New IGT tests (4) ###

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-131627v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][2] ([Intel XE#804])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [INCOMPLETE][3] ([Intel XE#804]) -> [INCOMPLETE][4] ([Intel XE#1027] / [Intel XE#804])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * Linux: xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732 -> xe-pw-131627v1

  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732: d652ec2b081fc8e252cc86ee84f72a3b78ee9732
  xe-pw-131627v1: 131627v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/index.html

--===============5884945552903700466==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add new PCI IDs to DG2 platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131627/">https://patchwork.freedesktop.org/series/131627/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732_BAT -&gt; xe-pw-131627v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131627v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_huc_copy@huc_copy:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732_BAT and xe-pw-131627v1_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131627v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131627v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732 -&gt; xe-pw-131627v1</li>
</ul>
<p>IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-992-d652ec2b081fc8e252cc86ee84f72a3b78ee9732: d652ec2b081fc8e252cc86ee84f72a3b78ee9732<br />
  xe-pw-131627v1: 131627v1</p>

</body>
</html>

--===============5884945552903700466==--
