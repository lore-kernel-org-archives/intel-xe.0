Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F8C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 22:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30C410E342;
	Mon, 31 Aug 2026 22:42:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D77110E342;
 Mon, 31 Aug 2026 22:42:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3015551536385574307=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_perf=3A_Fix_null_pointer_ac?=
 =?utf-8?q?cess_in_is=5Finclude=5Fguest=5Fevent=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 22:42:30 -0000
Message-ID: <178821615011.104493.8009261178601333567@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831215214.4169965-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260831215214.4169965-1-vinay.belgaumkar@intel.com>
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

--===============3015551536385574307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: perf: Fix null pointer access in is_include_guest_event() (rev3)
URL   : https://patchwork.freedesktop.org/series/172917/
State : success

== Summary ==

CI Bug Log - changes from xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f_BAT -> xe-pw-172917v3_BAT
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

  * Linux: xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f -> xe-pw-172917v3

  IGT_9078: 9078
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f
  xe-pw-172917v3: 172917v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172917v3/index.html

--===============3015551536385574307==
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
<tr><td><b>Series:</b></td><td>perf: Fix null pointer access in is_include_guest_event() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172917/">https://patchwork.freedesktop.org/series/172917/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172917v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172917v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f_BAT -&gt; xe-pw-172917v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f -&gt; xe-pw-172917v3</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f<br />
  xe-pw-172917v3: 172917v3</p>

</body>
</html>

--===============3015551536385574307==--
