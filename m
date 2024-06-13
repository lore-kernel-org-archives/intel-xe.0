Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325AEC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 14:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96FF10EAB5;
	Thu, 13 Jun 2024 14:42:46 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C010EAB4;
 Thu, 13 Jun 2024 14:42:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7803893595819053808=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_fixed_CCS_mode_whe?=
 =?utf-8?q?n_running_in_SR-IOV_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 14:42:43 -0000
Message-ID: <171828976386.73458.18248957421050741388@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613135445.2076-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240613135445.2076-1-michal.wajdeczko@intel.com>
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

--===============7803893595819053808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use fixed CCS mode when running in SR-IOV mode
URL   : https://patchwork.freedesktop.org/series/134824/
State : success

== Summary ==

CI Bug Log - changes from xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048_BAT -> xe-pw-134824v1_BAT
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

  Here are the changes found in xe-pw-134824v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7885 -> IGT_7886
  * Linux: xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048 -> xe-pw-134824v1

  IGT_7885: 76189d25da1d0b245f288b75ebe44986f8a75b0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048: 9f3ced27c8deae54c79db1743e37d2935558e048
  xe-pw-134824v1: 134824v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134824v1/index.html

--===============7803893595819053808==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use fixed CCS mode when running in SR-IOV mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134824/">https://patchwork.freedesktop.org/series/134824/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134824v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134824v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048_BAT -&gt; xe-pw-134824v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134824v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7885 -&gt; IGT_7886</li>
<li>Linux: xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048 -&gt; xe-pw-134824v1</li>
</ul>
<p>IGT_7885: 76189d25da1d0b245f288b75ebe44986f8a75b0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048: 9f3ced27c8deae54c79db1743e37d2935558e048<br />
  xe-pw-134824v1: 134824v1</p>

</body>
</html>

--===============7803893595819053808==--
