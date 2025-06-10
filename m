Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F242EC5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 08:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50A710E485;
	Tue, 10 Jun 2025 08:19:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF2110E485;
 Tue, 10 Jun 2025 08:19:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3161399423079117955=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Make_struct_xe=5F?=
 =?utf-8?q?ggtt_private=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 08:19:17 -0000
Message-ID: <174954355784.62603.1742941558104045306@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610070241.875636-1-dev@lankhorst.se>
In-Reply-To: <20250610070241.875636-1-dev@lankhorst.se>
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

--===============3161399423079117955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Make struct xe_ggtt private. (rev2)
URL   : https://patchwork.freedesktop.org/series/139778/
State : failure

== Summary ==

CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -> xe-pw-139778v2_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-139778v2_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139778v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139778v2_BAT:

### IGT changes ###

#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [ABORT][1] ([Intel XE#5214]) -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3225-52ecbb6a68785860c776b29f58792d9807243979/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214


Build changes
-------------

  * IGT: IGT_8401 -> IGT_8402
  * Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -> xe-pw-139778v2

  IGT_8401: 8401
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979
  xe-pw-139778v2: 139778v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v2/index.html

--===============3161399423079117955==
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
<tr><td><b>Series:</b></td><td>drm/xe: Make struct xe_ggtt private. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139778/">https://patchwork.freedesktop.org/series/139778/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -&gt; xe-pw-139778v2_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-139778v2_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139778v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139778v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3225-52ecbb6a68785860c776b29f58792d9807243979/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8401 -&gt; IGT_8402</li>
<li>Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -&gt; xe-pw-139778v2</li>
</ul>
<p>IGT_8401: 8401<br />
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979<br />
  xe-pw-139778v2: 139778v2</p>

</body>
</html>

--===============3161399423079117955==--
