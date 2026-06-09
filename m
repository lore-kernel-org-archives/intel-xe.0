Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5177CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 07:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847CE10E157;
	Tue,  9 Jun 2026 07:55:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9495710E154;
 Tue,  9 Jun 2026 07:55:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2926941063350468939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_include_all_regis?=
 =?utf-8?q?tered_queues_in_TLB_invalidation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 07:55:55 -0000
Message-ID: <178099175560.57588.18311381948830874975@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============2926941063350468939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: include all registered queues in TLB invalidation (rev2)
URL   : https://patchwork.freedesktop.org/series/168107/
State : success

== Summary ==

CI Bug Log - changes from xe-5222-cc6ecad1583df42f635269218c08a63e79218177_BAT -> xe-pw-168107v2_BAT
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

  * IGT: IGT_8953 -> IGT_8954
  * Linux: xe-5222-cc6ecad1583df42f635269218c08a63e79218177 -> xe-pw-168107v2

  IGT_8953: 8953
  IGT_8954: 8954
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177
  xe-pw-168107v2: 168107v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168107v2/index.html

--===============2926941063350468939==
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
<tr><td><b>Series:</b></td><td>drm/xe: include all registered queues in TLB invalidation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168107/">https://patchwork.freedesktop.org/series/168107/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168107v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168107v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5222-cc6ecad1583df42f635269218c08a63e79218177_BAT -&gt; xe-pw-168107v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8953 -&gt; IGT_8954</li>
<li>Linux: xe-5222-cc6ecad1583df42f635269218c08a63e79218177 -&gt; xe-pw-168107v2</li>
</ul>
<p>IGT_8953: 8953<br />
  IGT_8954: 8954<br />
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177<br />
  xe-pw-168107v2: 168107v2</p>

</body>
</html>

--===============2926941063350468939==--
