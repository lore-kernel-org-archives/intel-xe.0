Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08195C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 03:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CAB10EBA8;
	Wed, 17 Apr 2024 03:07:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FAB1130A7;
 Wed, 17 Apr 2024 03:07:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3280620968796716366=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Add_workaround_140?=
 =?utf-8?q?21402888?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 03:07:24 -0000
Message-ID: <171332324464.1463549.275320035443172653@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417021840.456641-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240417021840.456641-1-krishnaiah.bommu@intel.com>
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

--===============3280620968796716366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 14021402888
URL   : https://patchwork.freedesktop.org/series/132529/
State : success

== Summary ==

CI Bug Log - changes from xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a_BAT -> xe-pw-132529v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132529v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1044])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132529v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044


Build changes
-------------

  * Linux: xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a -> xe-pw-132529v1

  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a
  xe-pw-132529v1: 132529v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132529v1/index.html

--===============3280620968796716366==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 14021402888</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132529/">https://patchwork.freedesktop.org/series/132529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132529v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132529v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a_BAT -&gt; xe-pw-132529v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132529v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132529v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a -&gt; xe-pw-132529v1</li>
</ul>
<p>IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a<br />
  xe-pw-132529v1: 132529v1</p>

</body>
</html>

--===============3280620968796716366==--
