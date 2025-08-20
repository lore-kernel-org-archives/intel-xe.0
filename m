Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55503CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 21:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDF710E7F6;
	Wed, 20 Aug 2025 21:19:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3238410E7F6;
 Wed, 20 Aug 2025 21:19:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7094529064679709058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpuvm=3A_Rename_=27map?=
 =?utf-8?q?=27_to_=27op=27_in_drm=5Fgpuvm=5Fmap=5Freq?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Aug 2025 21:19:29 -0000
Message-ID: <175572476919.253813.11100669854147385671@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
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

--===============7094529064679709058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
URL   : https://patchwork.freedesktop.org/series/153233/
State : success

== Summary ==

CI Bug Log - changes from xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a_BAT -> xe-pw-153233v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a -> xe-pw-153233v1

  IGT_8499: e5e236fad9e36c3a868bc851262ee34ca57f9e5c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a: 67f294a52e4b22d1b5bb86dd5dd3ac33e640717a
  xe-pw-153233v1: 153233v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153233v1/index.html

--===============7094529064679709058==
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
<tr><td><b>Series:</b></td><td>drm/gpuvm: Rename &#x27;map&#x27; to &#x27;op&#x27; in drm_gpuvm_map_req</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153233/">https://patchwork.freedesktop.org/series/153233/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153233v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153233v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a_BAT -&gt; xe-pw-153233v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a -&gt; xe-pw-153233v1</li>
</ul>
<p>IGT_8499: e5e236fad9e36c3a868bc851262ee34ca57f9e5c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3588-67f294a52e4b22d1b5bb86dd5dd3ac33e640717a: 67f294a52e4b22d1b5bb86dd5dd3ac33e640717a<br />
  xe-pw-153233v1: 153233v1</p>

</body>
</html>

--===============7094529064679709058==--
