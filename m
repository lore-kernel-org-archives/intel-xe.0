Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DBBCDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 21:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A265C10ECC6;
	Tue, 23 Jun 2026 21:08:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA5C10ECC6;
 Tue, 23 Jun 2026 21:08:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1564494223294733214=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Refactor_generic?=
 =?utf-8?q?=5Fhandle=5Firq=5Fsafe=28=29_error_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 21:08:17 -0000
Message-ID: <178224889776.108058.1022632751711986683@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
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

--===============1564494223294733214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Refactor generic_handle_irq_safe() error messages
URL   : https://patchwork.freedesktop.org/series/169050/
State : success

== Summary ==

CI Bug Log - changes from xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd_BAT -> xe-pw-169050v1_BAT
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

  * Linux: xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd -> xe-pw-169050v1

  IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd: e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd
  xe-pw-169050v1: 169050v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169050v1/index.html

--===============1564494223294733214==
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
<tr><td><b>Series:</b></td><td>drm/xe: Refactor generic_handle_irq_safe() error messages</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169050/">https://patchwork.freedesktop.org/series/169050/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169050v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169050v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd_BAT -&gt; xe-pw-169050v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd -&gt; xe-pw-169050v1</li>
</ul>
<p>IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5291-e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd: e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd<br />
  xe-pw-169050v1: 169050v1</p>

</body>
</html>

--===============1564494223294733214==--
