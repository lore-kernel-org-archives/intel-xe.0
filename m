Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF36C44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 19:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9D810E139;
	Mon, 20 Jul 2026 19:14:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF12510E139;
 Mon, 20 Jul 2026 19:14:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6721975601862999258=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Split_GuC_ID_space_into_usa?=
 =?utf-8?q?ble_and_shareable_pools?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 19:14:30 -0000
Message-ID: <178457487084.208864.5196670645031096262@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
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

--===============6721975601862999258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Split GuC ID space into usable and shareable pools
URL   : https://patchwork.freedesktop.org/series/170767/
State : success

== Summary ==

CI Bug Log - changes from xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4_BAT -> xe-pw-170767v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4 -> xe-pw-170767v1

  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4: 93386cf5c4870594860636dafd4307fd5cf388e4
  xe-pw-170767v1: 170767v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170767v1/index.html

--===============6721975601862999258==
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
<tr><td><b>Series:</b></td><td>Split GuC ID space into usable and shareable pools</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170767/">https://patchwork.freedesktop.org/series/170767/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170767v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170767v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4_BAT -&gt; xe-pw-170767v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4 -&gt; xe-pw-170767v1</li>
</ul>
<p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5441-93386cf5c4870594860636dafd4307fd5cf388e4: 93386cf5c4870594860636dafd4307fd5cf388e4<br />
  xe-pw-170767v1: 170767v1</p>

</body>
</html>

--===============6721975601862999258==--
