Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE54C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2304410EA3C;
	Fri,  9 Aug 2024 23:55:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D610EA3A;
 Fri,  9 Aug 2024 23:55:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5383679962643614966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Use_user-defined_workqueue_lockd?=
 =?utf-8?q?ep_map_for_drm_sched_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 23:55:27 -0000
Message-ID: <172324772767.558587.5756582746061616255@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809222827.3211998-1-matthew.brost@intel.com>
In-Reply-To: <20240809222827.3211998-1-matthew.brost@intel.com>
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

--===============5383679962643614966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use user-defined workqueue lockdep map for drm sched (rev3)
URL   : https://patchwork.freedesktop.org/series/136701/
State : failure

== Summary ==

CI Bug Log - changes from xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808_BAT -> xe-pw-136701v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136701v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136701v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 4)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-136701v3_BAT prevented too many machines from booting.

  Missing    (5): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-136701v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136701v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808 -> xe-pw-136701v3

  IGT_7965: 965de1e69e91e331eee9d9f53e46b4652ba157c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808: 2ff5a7c32f9dca872aa50bc52dbb2bde6001c808
  xe-pw-136701v3: 136701v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136701v3/index.html

--===============5383679962643614966==
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
<tr><td><b>Series:</b></td><td>Use user-defined workqueue lockdep map for drm sched (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136701/">https://patchwork.freedesktop.org/series/136701/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136701v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136701v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808_BAT -&gt; xe-pw-136701v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136701v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136701v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 4)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-136701v3_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136701v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136701v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808 -&gt; xe-pw-136701v3</li>
</ul>
<p>IGT_7965: 965de1e69e91e331eee9d9f53e46b4652ba157c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1744-2ff5a7c32f9dca872aa50bc52dbb2bde6001c808: 2ff5a7c32f9dca872aa50bc52dbb2bde6001c808<br />
  xe-pw-136701v3: 136701v3</p>

</body>
</html>

--===============5383679962643614966==--
