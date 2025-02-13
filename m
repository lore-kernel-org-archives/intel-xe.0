Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739A6C021A8
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 06:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFB110E1BF;
	Thu, 13 Feb 2025 06:08:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A66110E1BF;
 Thu, 13 Feb 2025 06:08:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0049636289666480404=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Remove_hp?=
 =?utf-8?q?d_cancel_work_sync_from_runtime_pm_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 06:08:15 -0000
Message-ID: <173942689562.1562216.10090737881608333071@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212192447.402715-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250212192447.402715-1-rodrigo.vivi@intel.com>
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

--===============0049636289666480404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Remove hpd cancel work sync from runtime pm path
URL   : https://patchwork.freedesktop.org/series/144754/
State : success

== Summary ==

CI Bug Log - changes from xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd_BAT -> xe-pw-144754v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd -> xe-pw-144754v1

  IGT_8228: 8228
  xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd: b9696aa14a67620661572e94f4141df2a4b6b5cd
  xe-pw-144754v1: 144754v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144754v1/index.html

--===============0049636289666480404==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Remove hpd cancel work sync from runtime pm path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144754/">https://patchwork.freedesktop.org/series/144754/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144754v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144754v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd_BAT -&gt; xe-pw-144754v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd -&gt; xe-pw-144754v1</li>
</ul>
<p>IGT_8228: 8228<br />
  xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd: b9696aa14a67620661572e94f4141df2a4b6b5cd<br />
  xe-pw-144754v1: 144754v1</p>

</body>
</html>

--===============0049636289666480404==--
