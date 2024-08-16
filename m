Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD3C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 05:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ECA10E57A;
	Fri, 16 Aug 2024 05:10:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E22910E57A;
 Fri, 16 Aug 2024 05:10:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6031633804659682710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_reserved_copy_engi?=
 =?utf-8?q?ne_for_user_binds_on_faulting_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 05:10:43 -0000
Message-ID: <172378504322.653293.11831437889099304149@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816034033.53837-1-matthew.brost@intel.com>
In-Reply-To: <20240816034033.53837-1-matthew.brost@intel.com>
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

--===============6031633804659682710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use reserved copy engine for user binds on faulting devices
URL   : https://patchwork.freedesktop.org/series/137365/
State : success

== Summary ==

CI Bug Log - changes from xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e_BAT -> xe-pw-137365v1_BAT
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

  Here are the changes found in xe-pw-137365v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_spin_batch@spin-batch:
    - {bat-bmg-2}:        [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e/bat-bmg-2/igt@xe_spin_batch@spin-batch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137365v1/bat-bmg-2/igt@xe_spin_batch@spin-batch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e -> xe-pw-137365v1

  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e: f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e
  xe-pw-137365v1: 137365v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137365v1/index.html

--===============6031633804659682710==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use reserved copy engine for user binds on faulting devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137365/">https://patchwork.freedesktop.org/series/137365/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137365v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137365v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e_BAT -&gt; xe-pw-137365v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137365v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_spin_batch@spin-batch:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e/bat-bmg-2/igt@xe_spin_batch@spin-batch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137365v1/bat-bmg-2/igt@xe_spin_batch@spin-batch.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e -&gt; xe-pw-137365v1</li>
</ul>
<p>IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1776-f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e: f38cd8f756af19bf5a0ce59ee974fd84f9e0c54e<br />
  xe-pw-137365v1: 137365v1</p>

</body>
</html>

--===============6031633804659682710==--
