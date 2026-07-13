Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FA2C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CB710EA12;
	Mon, 13 Jul 2026 15:07:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC00210E5FE;
 Mon, 13 Jul 2026 15:07:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3150529741144658311=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_debugfs_knob_?=
 =?utf-8?q?to_disable_Mid-Thread_Preemption_per_GT_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 15:07:30 -0000
Message-ID: <178395525096.184234.9006311348530005924@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618042421.483657-1-varun.gupta@intel.com>
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
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

--===============3150529741144658311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev6)
URL   : https://patchwork.freedesktop.org/series/168743/
State : failure

== Summary ==

CI Bug Log - changes from xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218_BAT -> xe-pw-168743v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168743v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168743v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168743v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  


Build changes
-------------

  * IGT: IGT_9003 -> IGT_9005
  * Linux: xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218 -> xe-pw-168743v6

  IGT_9003: 9003
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218: 83d782d98f4ebb4a10b8ee107e3a389917e0b218
  xe-pw-168743v6: 168743v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/index.html

--===============3150529741144658311==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168743/">https://patchwork.freedesktop.org/series/168743/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218_BAT -&gt; xe-pw-168743v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168743v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168743v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168743v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9003 -&gt; IGT_9005</li>
<li>Linux: xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218 -&gt; xe-pw-168743v6</li>
</ul>
<p>IGT_9003: 9003<br />
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218: 83d782d98f4ebb4a10b8ee107e3a389917e0b218<br />
  xe-pw-168743v6: 168743v6</p>

</body>
</html>

--===============3150529741144658311==--
