Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FAEC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F351910ED8F;
	Mon, 22 Jan 2024 18:41:43 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEF910EC96;
 Mon, 22 Jan 2024 18:41:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1025525970410541685=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_kunit=3A_Mark_filter*_params_as_?=
 =?utf-8?q?rw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 22 Jan 2024 18:41:43 -0000
Message-ID: <170594890363.664962.15046677345286814004@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122171408.3328510-1-lucas.demarchi@intel.com>
In-Reply-To: <20240122171408.3328510-1-lucas.demarchi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1025525970410541685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kunit: Mark filter* params as rw
URL   : https://patchwork.freedesktop.org/series/129043/
State : success

== Summary ==

CI Bug Log - changes from xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f_BAT -> xe-pw-129043v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7683 -> IGT_7685
  * Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -> xe-pw-129043v1

  IGT_7683: 7683
  IGT_7685: 7685
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f
  xe-pw-129043v1: 129043v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129043v1/index.html

--===============1025525970410541685==
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
<tr><td><b>Series:</b></td><td>kunit: Mark filter* params as rw</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129043/">https://patchwork.freedesktop.org/series/129043/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129043v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129043v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f_BAT -&gt; xe-pw-129043v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGT_7685</li>
<li>Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -&gt; xe-pw-129043v1</li>
</ul>
<p>IGT_7683: 7683<br />
  IGT_7685: 7685<br />
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f<br />
  xe-pw-129043v1: 129043v1</p>

</body>
</html>

--===============1025525970410541685==--
