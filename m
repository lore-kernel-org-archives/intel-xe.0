Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455AAC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 09:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6E310E119;
	Fri, 18 Jul 2025 09:00:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14B910E119;
 Fri, 18 Jul 2025 09:00:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3847424651912430386=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Preliminary_support_for_sep?=
 =?utf-8?q?arate_VRAM_region_for_kernel_allocations_on_tiles?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Jul 2025 09:00:20 -0000
Message-ID: <175282922065.171566.10645009548631339333@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250718081752.630122-1-piotr.piorkowski@intel.com>
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

--===============3847424651912430386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Preliminary support for separate VRAM region for kernel allocations on tiles
URL   : https://patchwork.freedesktop.org/series/151796/
State : success

== Summary ==

CI Bug Log - changes from xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4_BAT -> xe-pw-151796v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151796v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151796v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4 -> xe-pw-151796v1

  IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4: 9bd392e02e4551dbbf1bc109640e30e0d674acd4
  xe-pw-151796v1: 151796v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151796v1/index.html

--===============3847424651912430386==
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
<tr><td><b>Series:</b></td><td>Preliminary support for separate VRAM region for kernel allocations on tiles</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151796/">https://patchwork.freedesktop.org/series/151796/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151796v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151796v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4_BAT -&gt; xe-pw-151796v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151796v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151796v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4 -&gt; xe-pw-151796v1</li>
</ul>
<p>IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3437-9bd392e02e4551dbbf1bc109640e30e0d674acd4: 9bd392e02e4551dbbf1bc109640e30e0d674acd4<br />
  xe-pw-151796v1: 151796v1</p>

</body>
</html>

--===============3847424651912430386==--
