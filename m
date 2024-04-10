Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D7FCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726EA10E6B9;
	Wed, 10 Apr 2024 17:59:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0210E6B9;
 Wed, 10 Apr 2024 17:59:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2800132495398315468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_PF=3A_Add_support_to_configure_G?=
 =?utf-8?q?uC_SR-IOV_policies_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 17:59:26 -0000
Message-ID: <171277196678.1338744.16993549495477549680@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240410170338.1199-1-michal.wajdeczko@intel.com>
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

--===============2800132495398315468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add support to configure GuC SR-IOV policies (rev2)
URL   : https://patchwork.freedesktop.org/series/132271/
State : success

== Summary ==

CI Bug Log - changes from xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9_BAT -> xe-pw-132271v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7803 -> IGT_7804
  * Linux: xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9 -> xe-pw-132271v2

  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7804: 7804
  xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9: bf24d40fae19bcceac3e32c4866079b4f10c70f9
  xe-pw-132271v2: 132271v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/index.html

--===============2800132495398315468==
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
<tr><td><b>Series:</b></td><td>PF: Add support to configure GuC SR-IOV policies (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132271/">https://patchwork.freedesktop.org/series/132271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9_BAT -&gt; xe-pw-132271v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7803 -&gt; IGT_7804</li>
<li>Linux: xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9 -&gt; xe-pw-132271v2</li>
</ul>
<p>IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7804: 7804<br />
  xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9: bf24d40fae19bcceac3e32c4866079b4f10c70f9<br />
  xe-pw-132271v2: 132271v2</p>

</body>
</html>

--===============2800132495398315468==--
