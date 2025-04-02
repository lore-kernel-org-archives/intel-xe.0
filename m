Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3494BC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 11:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9A310E756;
	Wed,  2 Apr 2025 11:47:22 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA63510E756;
 Wed,  2 Apr 2025 11:47:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0931679682831040247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_SRIOV_VRAM_provisio?=
 =?utf-8?q?ning_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 11:47:21 -0000
Message-ID: <174359444175.26680.3900619645623800762@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402092921.79918-9-matthew.auld@intel.com>
In-Reply-To: <20250402092921.79918-9-matthew.auld@intel.com>
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

--===============0931679682831040247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve SRIOV VRAM provisioning (rev4)
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_BAT -> xe-pw-142782v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142782v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v4/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8297 -> IGT_8298
  * Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -> xe-pw-142782v4

  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8298: 8298
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c812343a27a655a57b
  xe-pw-142782v4: 142782v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v4/index.html

--===============0931679682831040247==
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
<tr><td><b>Series:</b></td><td>Improve SRIOV VRAM provisioning (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142782/">https://patchwork.freedesktop.org/series/142782/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_BAT -&gt; xe-pw-142782v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142782v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@bb-with-allocator:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v4/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGT_8298</li>
<li>Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -&gt; xe-pw-142782v4</li>
</ul>
<p>IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8298: 8298<br />
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c812343a27a655a57b<br />
  xe-pw-142782v4: 142782v4</p>

</body>
</html>

--===============0931679682831040247==--
