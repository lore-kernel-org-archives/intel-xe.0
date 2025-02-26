Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D60AC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 17:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9910E985;
	Wed, 26 Feb 2025 17:50:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF47D10E973;
 Wed, 26 Feb 2025 17:50:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4571756071996539345=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_uninitialized?=
 =?utf-8?q?_pointer_def?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 17:50:12 -0000
Message-ID: <174059221297.2408428.14543095987808016272@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226160524.566074-1-colin.i.king@gmail.com>
In-Reply-To: <20250226160524.566074-1-colin.i.king@gmail.com>
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

--===============4571756071996539345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix uninitialized pointer def
URL   : https://patchwork.freedesktop.org/series/145504/
State : success

== Summary ==

CI Bug Log - changes from xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d_BAT -> xe-pw-145504v1_BAT
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

  Here are the changes found in xe-pw-145504v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d -> xe-pw-145504v1

  IGT_8248: 8248
  xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d: 5bcb67a2a4c61034f5a25c024631c5fbf351ee8d
  xe-pw-145504v1: 145504v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/index.html

--===============4571756071996539345==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix uninitialized pointer def</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145504/">https://patchwork.freedesktop.org/series/145504/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d_BAT -&gt; xe-pw-145504v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145504v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145504v1/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d -&gt; xe-pw-145504v1</li>
</ul>
<p>IGT_8248: 8248<br />
  xe-2714-5bcb67a2a4c61034f5a25c024631c5fbf351ee8d: 5bcb67a2a4c61034f5a25c024631c5fbf351ee8d<br />
  xe-pw-145504v1: 145504v1</p>

</body>
</html>

--===============4571756071996539345==--
