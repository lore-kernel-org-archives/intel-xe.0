Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4428C369B5
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 09:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A925D10E6AB;
	Tue, 15 Apr 2025 09:32:21 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29E810E6AC;
 Tue, 15 Apr 2025 09:32:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1628757873647072511=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Allow_to_injec?=
 =?utf-8?q?t_VF_provisioning_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 09:32:20 -0000
Message-ID: <174470954072.4839.16245659722568596497@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
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

--===============1628757873647072511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Allow to inject VF provisioning errors
URL   : https://patchwork.freedesktop.org/series/147731/
State : success

== Summary ==

CI Bug Log - changes from xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4_BAT -> xe-pw-147731v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-147731v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#4624])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147731v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * Linux: xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4 -> xe-pw-147731v1

  IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4: 08045a4121ee058ead3c4483e6c217be20ab86d4
  xe-pw-147731v1: 147731v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147731v1/index.html

--===============1628757873647072511==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Allow to inject VF provisioning errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147731/">https://patchwork.freedesktop.org/series/147731/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147731v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147731v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4_BAT -&gt; xe-pw-147731v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147731v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147731v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4 -&gt; xe-pw-147731v1</li>
</ul>
<p>IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2952-08045a4121ee058ead3c4483e6c217be20ab86d4: 08045a4121ee058ead3c4483e6c217be20ab86d4<br />
  xe-pw-147731v1: 147731v1</p>

</body>
</html>

--===============1628757873647072511==--
