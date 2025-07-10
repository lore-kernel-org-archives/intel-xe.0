Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6839C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 13:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D10810E217;
	Thu, 10 Jul 2025 13:41:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A17710E217;
 Thu, 10 Jul 2025 13:41:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1521778684404970728=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Clamp_power?=
 =?utf-8?q?1=5Fcrit_to_GPU_firmware_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 13:41:57 -0000
Message-ID: <175215491729.150864.549322406968587452@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710125306.295478-1-karthik.poosa@intel.com>
In-Reply-To: <20250710125306.295478-1-karthik.poosa@intel.com>
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

--===============1521778684404970728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Clamp power1_crit to GPU firmware default
URL   : https://patchwork.freedesktop.org/series/151440/
State : success

== Summary ==

CI Bug Log - changes from xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c_BAT -> xe-pw-151440v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151440v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#5369])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - bat-lnl-2:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#4966]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html

  
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966
  [Intel XE#5369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5369


Build changes
-------------

  * Linux: xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c -> xe-pw-151440v1

  IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c: fe737942dfd4a1451f169f4fc781b685ff624e2c
  xe-pw-151440v1: 151440v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/index.html

--===============1521778684404970728==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Clamp power1_crit to GPU firmware default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151440/">https://patchwork.freedesktop.org/series/151440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c_BAT -&gt; xe-pw-151440v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151440v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5369">Intel XE#5369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151440v1/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c -&gt; xe-pw-151440v1</li>
</ul>
<p>IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3386-fe737942dfd4a1451f169f4fc781b685ff624e2c: fe737942dfd4a1451f169f4fc781b685ff624e2c<br />
  xe-pw-151440v1: 151440v1</p>

</body>
</html>

--===============1521778684404970728==--
