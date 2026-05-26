Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B409FCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 18:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7250F10E1B1;
	Tue, 26 May 2026 18:40:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6610E1B1;
 Tue, 26 May 2026 18:40:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2074710170601221810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/display=3A_do_intel?=
 =?utf-8?q?=5Fdisplay=5Fpower=5F=7Bsuspend=2C_resume=7D=28=29_on_runtime_sus?=
 =?utf-8?q?pend/resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 18:40:52 -0000
Message-ID: <177982085230.11680.1290109574178961212@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526144937.1199524-1-jani.nikula@intel.com>
In-Reply-To: <20260526144937.1199524-1-jani.nikula@intel.com>
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

--===============2074710170601221810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: do intel_display_power_{suspend, resume}() on runtime suspend/resume
URL   : https://patchwork.freedesktop.org/series/167299/
State : failure

== Summary ==

CI Bug Log - changes from xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c_BAT -> xe-pw-167299v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167299v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167299v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167299v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_query@multigpu-query-topology:
    - bat-bmg-3:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/bat-bmg-3/igt@xe_query@multigpu-query-topology.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/bat-bmg-3/igt@xe_query@multigpu-query-topology.html

  


Build changes
-------------

  * Linux: xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c -> xe-pw-167299v1

  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c
  xe-pw-167299v1: 167299v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/index.html

--===============2074710170601221810==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: do intel_display_power_{suspend, resume}() on runtime suspend/resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167299/">https://patchwork.freedesktop.org/series/167299/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c_BAT -&gt; xe-pw-167299v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167299v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167299v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167299v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_query@multigpu-query-topology:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/bat-bmg-3/igt@xe_query@multigpu-query-topology.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/bat-bmg-3/igt@xe_query@multigpu-query-topology.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c -&gt; xe-pw-167299v1</li>
</ul>
<p>IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c<br />
  xe-pw-167299v1: 167299v1</p>

</body>
</html>

--===============2074710170601221810==--
