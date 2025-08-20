Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA8CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 14:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11910E75C;
	Wed, 20 Aug 2025 14:27:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C4110E75C;
 Wed, 20 Aug 2025 14:27:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6000001292528407975=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fsync=3A_avoid_r?=
 =?utf-8?q?ace_during_ufence_signaling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Aug 2025 14:27:48 -0000
Message-ID: <175570006821.252754.7173780450168493177@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250820083903.2109891-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250820083903.2109891-2-zbigniew.kempczynski@intel.com>
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

--===============6000001292528407975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sync: avoid race during ufence signaling
URL   : https://patchwork.freedesktop.org/series/153197/
State : success

== Summary ==

CI Bug Log - changes from xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f_BAT -> xe-pw-153197v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-153197v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f -> xe-pw-153197v1

  IGT_8499: e5e236fad9e36c3a868bc851262ee34ca57f9e5c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f: 7566d2cb0eb389084c208a764ce4ca287ec2242f
  xe-pw-153197v1: 153197v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153197v1/index.html

--===============6000001292528407975==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sync: avoid race during ufence signaling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153197/">https://patchwork.freedesktop.org/series/153197/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153197v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153197v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f_BAT -&gt; xe-pw-153197v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153197v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f -&gt; xe-pw-153197v1</li>
</ul>
<p>IGT_8499: e5e236fad9e36c3a868bc851262ee34ca57f9e5c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3586-7566d2cb0eb389084c208a764ce4ca287ec2242f: 7566d2cb0eb389084c208a764ce4ca287ec2242f<br />
  xe-pw-153197v1: 153197v1</p>

</body>
</html>

--===============6000001292528407975==--
