Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9BBC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 13:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBF010E0EE;
	Wed, 22 Jan 2025 13:22:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A7810E0EE;
 Wed, 22 Jan 2025 13:22:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3336555703916322185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_drm/i915/display=3A_Move_shutdown_sequences_under_display_dri?=
 =?utf-8?q?ver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 13:22:34 -0000
Message-ID: <173755215408.3073812.466508136342657596@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122104049.388340-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250122104049.388340-1-rodrigo.vivi@intel.com>
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

--===============3336555703916322185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915/display: Move shutdown sequences under display driver
URL   : https://patchwork.freedesktop.org/series/143843/
State : success

== Summary ==

CI Bug Log - changes from xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7_BAT -> xe-pw-143843v1_BAT
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

  * Linux: xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7 -> xe-pw-143843v1

  IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7: 9f946e94bec6e5e488407c5ff6a638850e0418a7
  xe-pw-143843v1: 143843v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143843v1/index.html

--===============3336555703916322185==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915/display: Move shutdown sequences under display driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143843/">https://patchwork.freedesktop.org/series/143843/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143843v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143843v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7_BAT -&gt; xe-pw-143843v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7 -&gt; xe-pw-143843v1</li>
</ul>
<p>IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2531-9f946e94bec6e5e488407c5ff6a638850e0418a7: 9f946e94bec6e5e488407c5ff6a638850e0418a7<br />
  xe-pw-143843v1: 143843v1</p>

</body>
</html>

--===============3336555703916322185==--
