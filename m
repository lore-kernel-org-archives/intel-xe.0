Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8996CCA465
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 21:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807910E56E;
	Thu, 15 Oct 2026 21:01:52 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6810E322;
 Thu, 15 Oct 2026 21:01:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2421225623418681090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_fan_control_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 21:01:51 -0000
Message-ID: <179209811111.32237.16250378430472523893@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
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

--===============2421225623418681090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add fan control support
URL   : https://patchwork.freedesktop.org/series/176241/
State : failure

== Summary ==

CI Bug Log - changes from xe-5955-551605da81c33c1a2352b6a6116360609798f171_BAT -> xe-pw-176241v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176241v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176241v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176241v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +17 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3.html

  * igt@xe_evict@evict-small:
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4] +9 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-2/igt@xe_evict@evict-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-2/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  


Build changes
-------------

  * IGT: IGT_9149 -> IGT_9150
  * Linux: xe-5955-551605da81c33c1a2352b6a6116360609798f171 -> xe-pw-176241v1

  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5955-551605da81c33c1a2352b6a6116360609798f171: 551605da81c33c1a2352b6a6116360609798f171
  xe-pw-176241v1: 176241v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/index.html

--===============2421225623418681090==
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
<tr><td><b>Series:</b></td><td>Add fan control support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176241/">https://patchwork.freedesktop.org/series/176241/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5955-551605da81c33c1a2352b6a6116360609798f171_BAT -&gt; xe-pw-176241v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176241v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176241v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176241v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-2/igt@xe_evict@evict-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-2/igt@xe_evict@evict-small.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5955-551605da81c33c1a2352b6a6116360609798f171/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176241v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9149 -&gt; IGT_9150</li>
<li>Linux: xe-5955-551605da81c33c1a2352b6a6116360609798f171 -&gt; xe-pw-176241v1</li>
</ul>
<p>IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5955-551605da81c33c1a2352b6a6116360609798f171: 551605da81c33c1a2352b6a6116360609798f171<br />
  xe-pw-176241v1: 176241v1</p>

</body>
</html>

--===============2421225623418681090==--
