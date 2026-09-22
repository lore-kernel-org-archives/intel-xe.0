Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73173C982FF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337B710EC11;
	Tue, 22 Sep 2026 09:03:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC1310EC0D;
 Tue, 22 Sep 2026 09:03:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5275976330526125908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3p=5Flpg=3A_Add_su?=
 =?utf-8?q?pport_for_Wa=5F16030224309?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 09:03:50 -0000
Message-ID: <179006783049.191774.6738687163735800830@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============5275976330526125908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3p_lpg: Add support for Wa_16030224309
URL   : https://patchwork.freedesktop.org/series/174684/
State : success

== Summary ==

CI Bug Log - changes from xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04_BAT -> xe-pw-174684v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-wcl-1 bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-174684v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#9331])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#9331]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * IGT: IGT_9105 -> IGT_9106
  * Linux: xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 -> xe-pw-174684v1

  IGT_9105: 9105
  IGT_9106: b4857e533cfb35a4fe9b8adecfa1433f749d64f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04
  xe-pw-174684v1: 174684v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/index.html

--===============5275976330526125908==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3p_lpg: Add support for Wa_16030224309</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174684/">https://patchwork.freedesktop.org/series/174684/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04_BAT -&gt; xe-pw-174684v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-wcl-1 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174684v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-rebind-prefetch:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9105 -&gt; IGT_9106</li>
<li>Linux: xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 -&gt; xe-pw-174684v1</li>
</ul>
<p>IGT_9105: 9105<br />
  IGT_9106: b4857e533cfb35a4fe9b8adecfa1433f749d64f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04<br />
  xe-pw-174684v1: 174684v1</p>

</body>
</html>

--===============5275976330526125908==--
