Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E345C61CE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 01:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744310E004;
	Fri, 13 Jun 2025 01:02:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA1F10E004;
 Fri, 13 Jun 2025 01:02:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8089020709625577597=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Tweak_default_GuC?=
 =?utf-8?q?_log_level?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 01:02:25 -0000
Message-ID: <174977654547.74490.3966202213258198332@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
In-Reply-To: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
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

--===============8089020709625577597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Tweak default GuC log level
URL   : https://patchwork.freedesktop.org/series/150183/
State : success

== Summary ==

CI Bug Log - changes from xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2_BAT -> xe-pw-150183v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8408 -> IGT_8409
  * Linux: xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2 -> xe-pw-150183v1

  IGT_8408: c034847bfe3d48c1d0d361dd44a0bc7cb276a31c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2: aca8df1835568921d5f108fe9fd16b1d282a74b2
  xe-pw-150183v1: 150183v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v1/index.html

--===============8089020709625577597==
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
<tr><td><b>Series:</b></td><td>drm/xe: Tweak default GuC log level</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150183/">https://patchwork.freedesktop.org/series/150183/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2_BAT -&gt; xe-pw-150183v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8408 -&gt; IGT_8409</li>
<li>Linux: xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2 -&gt; xe-pw-150183v1</li>
</ul>
<p>IGT_8408: c034847bfe3d48c1d0d361dd44a0bc7cb276a31c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2: aca8df1835568921d5f108fe9fd16b1d282a74b2<br />
  xe-pw-150183v1: 150183v1</p>

</body>
</html>

--===============8089020709625577597==--
