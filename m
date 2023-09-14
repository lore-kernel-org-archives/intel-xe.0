Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE2EEAA5E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 17:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5FC10E2A1;
	Thu, 14 Sep 2023 17:43:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BD8D10E2A1;
 Thu, 14 Sep 2023 17:43:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41633AADDC;
 Thu, 14 Sep 2023 17:43:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1698407550207348329=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Thu, 14 Sep 2023 17:43:35 -0000
Message-ID: <169471341523.29166.10487231921821458895@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914151240.163434-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230914151240.163434-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Remove_HA?=
 =?utf-8?q?S=5FDISPLAY=28=29_check_from_intel=5Fhpd=5Fpoll=5Ffini?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1698407550207348329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove HAS_DISPLAY() check from intel_hpd_poll_fini
URL   : https://patchwork.freedesktop.org/series/123703/
State : success

== Summary ==

CI Bug Log - changes from xe-373-aeac46cfaebff413254ac07837b97370c7ed3957_BAT -> xe-pw-123703v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-123703v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7487 -> IGT_7488
  * Linux: xe-373-aeac46cfaebff413254ac07837b97370c7ed3957 -> xe-pw-123703v1

  IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-373-aeac46cfaebff413254ac07837b97370c7ed3957: aeac46cfaebff413254ac07837b97370c7ed3957
  xe-pw-123703v1: 123703v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123703v1/index.html

--===============1698407550207348329==
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
<tr><td><b>Series:</b></td><td>Remove HAS_DISPLAY() check from intel_hpd_poll_fini</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123703/">https://patchwork.freedesktop.org/series/123703/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123703v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123703v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-373-aeac46cfaebff413254ac07837b97370c7ed3957_BAT -&gt; xe-pw-123703v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123703v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7487 -&gt; IGT_7488</li>
<li>Linux: xe-373-aeac46cfaebff413254ac07837b97370c7ed3957 -&gt; xe-pw-123703v1</li>
</ul>
<p>IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-373-aeac46cfaebff413254ac07837b97370c7ed3957: aeac46cfaebff413254ac07837b97370c7ed3957<br />
  xe-pw-123703v1: 123703v1</p>

</body>
</html>

--===============1698407550207348329==--
