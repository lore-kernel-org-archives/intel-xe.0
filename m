Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABC0C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2270A10FDAD;
	Fri, 19 Apr 2024 19:30:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208EA10EE61;
 Fri, 19 Apr 2024 19:30:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2417143304049319850=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_avoid_the_async=5Fflip?=
 =?utf-8?q?_update_in_the_initial_plane_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 19:30:37 -0000
Message-ID: <171355503711.1536675.4261766812954514309@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419140925.157924-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240419140925.157924-1-vinod.govindapillai@intel.com>
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

--===============2417143304049319850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: avoid the async_flip update in the initial plane config
URL   : https://patchwork.freedesktop.org/series/132648/
State : failure

== Summary ==

CI Bug Log - changes from xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93_BAT -> xe-pw-132648v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132648v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132648v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-132648v1_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93 -> xe-pw-132648v1

  IGT_7814: 7814
  xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93: ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93
  xe-pw-132648v1: 132648v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v1/index.html

--===============2417143304049319850==
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
<tr><td><b>Series:</b></td><td>drm/xe: avoid the async_flip update in the initial plane config</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132648/">https://patchwork.freedesktop.org/series/132648/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93_BAT -&gt; xe-pw-132648v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132648v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132648v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-132648v1_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93 -&gt; xe-pw-132648v1</li>
</ul>
<p>IGT_7814: 7814<br />
  xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93: ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93<br />
  xe-pw-132648v1: 132648v1</p>

</body>
</html>

--===============2417143304049319850==--
