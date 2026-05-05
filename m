Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F516CD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 08:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D490710E9BC;
	Tue,  5 May 2026 08:03:28 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319CF10E9BC;
 Tue,  5 May 2026 08:03:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8513343287466763493=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Do_not_include_LRC_indirect?=
 =?utf-8?q?_ring_state_size_in_engine_state_size_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 08:03:28 -0000
Message-ID: <177796820819.38341.8937269988576068398@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
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

--===============8513343287466763493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Do not include LRC indirect ring state size in engine state size (rev3)
URL   : https://patchwork.freedesktop.org/series/165754/
State : success

== Summary ==

CI Bug Log - changes from xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c_BAT -> xe-pw-165754v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8884 -> IGT_8885
  * Linux: xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c -> xe-pw-165754v3

  IGT_8884: 2e185bca126c4d135fe7fe579d0a3a177f150813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8885: 88f8f393de9c789a5b070a602e07ba396a480d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c: 94d56a898a2db27f841b17f6966a81ba502fe63c
  xe-pw-165754v3: 165754v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v3/index.html

--===============8513343287466763493==
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
<tr><td><b>Series:</b></td><td>Do not include LRC indirect ring state size in engine state size (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165754/">https://patchwork.freedesktop.org/series/165754/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c_BAT -&gt; xe-pw-165754v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8884 -&gt; IGT_8885</li>
<li>Linux: xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c -&gt; xe-pw-165754v3</li>
</ul>
<p>IGT_8884: 2e185bca126c4d135fe7fe579d0a3a177f150813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8885: 88f8f393de9c789a5b070a602e07ba396a480d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4984-94d56a898a2db27f841b17f6966a81ba502fe63c: 94d56a898a2db27f841b17f6966a81ba502fe63c<br />
  xe-pw-165754v3: 165754v3</p>

</body>
</html>

--===============8513343287466763493==--
