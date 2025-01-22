Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4591CC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 22:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B210E081;
	Wed, 22 Jan 2025 22:55:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DDB10E081;
 Wed, 22 Jan 2025 22:55:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6600255776431294707=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_SRIOV_RPM_resume_lockde?=
 =?utf-8?q?p_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 22:55:33 -0000
Message-ID: <173758653384.3226643.14040424056572704587@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250122214955.632-1-michal.wajdeczko@intel.com>
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

--===============6600255776431294707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix SRIOV RPM resume lockdep issues
URL   : https://patchwork.freedesktop.org/series/143865/
State : failure

== Summary ==

CI Bug Log - changes from xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308_BAT -> xe-pw-143865v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143865v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143865v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143865v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143865v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  


Build changes
-------------

  * Linux: xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308 -> xe-pw-143865v1

  IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308: d577d9e67e5ac149fcd4442327210b831cddb308
  xe-pw-143865v1: 143865v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143865v1/index.html

--===============6600255776431294707==
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
<tr><td><b>Series:</b></td><td>Fix SRIOV RPM resume lockdep issues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143865/">https://patchwork.freedesktop.org/series/143865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143865v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143865v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308_BAT -&gt; xe-pw-143865v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143865v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143865v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143865v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143865v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308 -&gt; xe-pw-143865v1</li>
</ul>
<p>IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308: d577d9e67e5ac149fcd4442327210b831cddb308<br />
  xe-pw-143865v1: 143865v1</p>

</body>
</html>

--===============6600255776431294707==--
