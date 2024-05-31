Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ABAC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 22:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8710E056;
	Fri, 31 May 2024 22:27:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136710E056;
 Fri, 31 May 2024 22:27:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4292866783472197289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Request_max_GT_fre?=
 =?utf-8?q?q_during_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 22:27:53 -0000
Message-ID: <171719447319.2243384.4725930746556030786@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
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

--===============4292866783472197289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Request max GT freq during resume
URL   : https://patchwork.freedesktop.org/series/134329/
State : success

== Summary ==

CI Bug Log - changes from xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62_BAT -> xe-pw-134329v1_BAT
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

  Here are the changes found in xe-pw-134329v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +32 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [INCOMPLETE][2] ([Intel XE#1972]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#1972]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1972
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -> xe-pw-134329v1

  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62
  xe-pw-134329v1: 134329v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/index.html

--===============4292866783472197289==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Request max GT freq during resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134329/">https://patchwork.freedesktop.org/series/134329/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62_BAT -&gt; xe-pw-134329v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134329v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1972">Intel XE#1972</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134329v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -&gt; xe-pw-134329v1</li>
</ul>
<p>IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62<br />
  xe-pw-134329v1: 134329v1</p>

</body>
</html>

--===============4292866783472197289==--
