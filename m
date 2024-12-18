Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D23AE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 13:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003FF10E1A0;
	Wed, 18 Dec 2024 13:48:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBBD10E1A0;
 Wed, 18 Dec 2024 13:48:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2875143405379228981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_SRIOV_VRAM_provisio?=
 =?utf-8?q?ning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 13:48:35 -0000
Message-ID: <173452971584.62410.3035380552069393883@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218121837.226393-9-matthew.auld@intel.com>
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
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

--===============2875143405379228981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve SRIOV VRAM provisioning
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

CI Bug Log - changes from xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c_BAT -> xe-pw-142782v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142782v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#3517]) -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#3429]) -> [PASS][4] +31 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#455]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8161 -> IGT_8162
  * Linux: xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c -> xe-pw-142782v1

  IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c
  xe-pw-142782v1: 142782v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/index.html

--===============2875143405379228981==
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
<tr><td><b>Series:</b></td><td>Improve SRIOV VRAM provisioning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142782/">https://patchwork.freedesktop.org/series/142782/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c_BAT -&gt; xe-pw-142782v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142782v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8161 -&gt; IGT_8162</li>
<li>Linux: xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c -&gt; xe-pw-142782v1</li>
</ul>
<p>IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c<br />
  xe-pw-142782v1: 142782v1</p>

</body>
</html>

--===============2875143405379228981==--
