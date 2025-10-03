Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD24DCAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 01:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7925E10E00A;
	Fri,  3 Oct 2025 01:55:12 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2110E00A;
 Fri,  3 Oct 2025 01:55:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8267538798231346282=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_old_VF_migration_rec?=
 =?utf-8?q?overy_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Oct 2025 01:55:10 -0000
Message-ID: <175945651054.1839.15739764429155879571@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002233824.203417-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251002233824.203417-1-michal.wajdeczko@intel.com>
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

--===============8267538798231346282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert old VF migration recovery code
URL   : https://patchwork.freedesktop.org/series/155354/
State : success

== Summary ==

CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434_BAT -> xe-pw-155354v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -> xe-pw-155354v1

  IGT_8572: 8572
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434
  xe-pw-155354v1: 155354v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155354v1/index.html

--===============8267538798231346282==
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
<tr><td><b>Series:</b></td><td>Revert old VF migration recovery code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155354/">https://patchwork.freedesktop.org/series/155354/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155354v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155354v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434_BAT -&gt; xe-pw-155354v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -&gt; xe-pw-155354v1</li>
</ul>
<p>IGT_8572: 8572<br />
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434<br />
  xe-pw-155354v1: 155354v1</p>

</body>
</html>

--===============8267538798231346282==--
