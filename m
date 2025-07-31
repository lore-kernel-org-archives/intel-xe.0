Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7049DC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A90610E289;
	Thu, 31 Jul 2025 15:30:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FE10E289;
 Thu, 31 Jul 2025 15:30:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4942391946575995584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_fix_stale_comment?=
 =?utf-8?q?_about_unordered=5Fwq_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 15:30:16 -0000
Message-ID: <175397581631.202804.3201434562402400990@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731111214.1130130-1-jani.nikula@intel.com>
In-Reply-To: <20250731111214.1130130-1-jani.nikula@intel.com>
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

--===============4942391946575995584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix stale comment about unordered_wq usage
URL   : https://patchwork.freedesktop.org/series/152346/
State : success

== Summary ==

CI Bug Log - changes from xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888_BAT -> xe-pw-152346v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8481 -> IGT_8482
  * Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -> xe-pw-152346v1

  IGT_8481: 8481
  IGT_8482: 8482
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888
  xe-pw-152346v1: 152346v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152346v1/index.html

--===============4942391946575995584==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix stale comment about unordered_wq usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152346/">https://patchwork.freedesktop.org/series/152346/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152346v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152346v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888_BAT -&gt; xe-pw-152346v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8481 -&gt; IGT_8482</li>
<li>Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -&gt; xe-pw-152346v1</li>
</ul>
<p>IGT_8481: 8481<br />
  IGT_8482: 8482<br />
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888<br />
  xe-pw-152346v1: 152346v1</p>

</body>
</html>

--===============4942391946575995584==--
