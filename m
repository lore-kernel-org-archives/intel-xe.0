Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE2C531CA
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 11:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B9110E32E;
	Thu, 23 Jul 2026 11:54:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75EA10E32E;
 Thu, 23 Jul 2026 11:54:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1804768824707024182=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_make_CTX=5FTIMEST?=
 =?utf-8?q?AMP_TOCTOU-safe_and_handle_sentinels_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jul 2026 11:54:24 -0000
Message-ID: <178480766494.221139.17375345297837692363@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
In-Reply-To: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
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

--===============1804768824707024182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev6)
URL   : https://patchwork.freedesktop.org/series/168394/
State : success

== Summary ==

CI Bug Log - changes from xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831_BAT -> xe-pw-168394v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831 -> xe-pw-168394v6

  IGT_9020: 9020
  xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831
  xe-pw-168394v6: 168394v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v6/index.html

--===============1804768824707024182==
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
<tr><td><b>Series:</b></td><td>drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168394/">https://patchwork.freedesktop.org/series/168394/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831_BAT -&gt; xe-pw-168394v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831 -&gt; xe-pw-168394v6</li>
</ul>
<p>IGT_9020: 9020<br />
  xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831<br />
  xe-pw-168394v6: 168394v6</p>

</body>
</html>

--===============1804768824707024182==--
