Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6587C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 20:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125310E4EB;
	Wed, 22 Jul 2026 20:35:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AAD10EE9A;
 Wed, 22 Jul 2026 20:35:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5673336345163978516=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_add_page_size_all?=
 =?utf-8?q?ocation_mode_control_and_coverage_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 20:35:01 -0000
Message-ID: <178475250165.218011.10556275587199655687@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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

--===============5673336345163978516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add page size allocation mode control and coverage (rev6)
URL   : https://patchwork.freedesktop.org/series/168905/
State : success

== Summary ==

CI Bug Log - changes from xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0_BAT -> xe-pw-168905v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9019 -> IGT_9020
  * Linux: xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0 -> xe-pw-168905v6

  IGT_9019: 9019
  IGT_9020: 9020
  xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0: 64683393c9d48d6a596d4b13c2583c54b554b7d0
  xe-pw-168905v6: 168905v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v6/index.html

--===============5673336345163978516==
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
<tr><td><b>Series:</b></td><td>drm/xe: add page size allocation mode control and coverage (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168905/">https://patchwork.freedesktop.org/series/168905/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0_BAT -&gt; xe-pw-168905v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9019 -&gt; IGT_9020</li>
<li>Linux: xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0 -&gt; xe-pw-168905v6</li>
</ul>
<p>IGT_9019: 9019<br />
  IGT_9020: 9020<br />
  xe-5461-64683393c9d48d6a596d4b13c2583c54b554b7d0: 64683393c9d48d6a596d4b13c2583c54b554b7d0<br />
  xe-pw-168905v6: 168905v6</p>

</body>
</html>

--===============5673336345163978516==--
