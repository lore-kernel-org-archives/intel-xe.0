Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DAC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 12:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA610E90D;
	Thu,  8 May 2025 12:12:39 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DE810E8FD;
 Thu,  8 May 2025 12:12:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6255304398523654026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_the_gem_shrin?=
 =?utf-8?q?ker_name?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 12:12:37 -0000
Message-ID: <174670635715.59073.6769355786672100109@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
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

--===============6255304398523654026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix the gem shrinker name
URL   : https://patchwork.freedesktop.org/series/148756/
State : success

== Summary ==

CI Bug Log - changes from xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3_BAT -> xe-pw-148756v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-148756v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2464]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        NOTRUN -> [ABORT][4] ([Intel XE#3970])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * IGT: IGT_8356 -> IGT_8357
  * Linux: xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3 -> xe-pw-148756v1

  IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8357: 8357
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891b96226af17571b2a3
  xe-pw-148756v1: 148756v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/index.html

--===============6255304398523654026==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix the gem shrinker name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148756/">https://patchwork.freedesktop.org/series/148756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3_BAT -&gt; xe-pw-148756v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148756v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148756v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8356 -&gt; IGT_8357</li>
<li>Linux: xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3 -&gt; xe-pw-148756v1</li>
</ul>
<p>IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8357: 8357<br />
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891b96226af17571b2a3<br />
  xe-pw-148756v1: 148756v1</p>

</body>
</html>

--===============6255304398523654026==--
