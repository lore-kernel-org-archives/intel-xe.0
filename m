Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD8CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 05:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9BB10E08F;
	Tue,  9 Jun 2026 05:28:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94610E08F;
 Tue,  9 Jun 2026 05:28:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1536928750655395056=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Force_fasts?=
 =?utf-8?q?et_on_debugfs_write_for_each_connector_supporting_PSR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 05:28:07 -0000
Message-ID: <178098288725.57588.9886020682999392640@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609044149.274249-1-jouni.hogander@intel.com>
In-Reply-To: <20260609044149.274249-1-jouni.hogander@intel.com>
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

--===============1536928750655395056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Force fastset on debugfs write for each connector supporting PSR
URL   : https://patchwork.freedesktop.org/series/168147/
State : success

== Summary ==

CI Bug Log - changes from xe-5222-cc6ecad1583df42f635269218c08a63e79218177_BAT -> xe-pw-168147v1_BAT
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
  * Linux: xe-5222-cc6ecad1583df42f635269218c08a63e79218177 -> xe-pw-168147v1

  IGT_8953: 8953
  IGT_8954: 8954
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177
  xe-pw-168147v1: 168147v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168147v1/index.html

--===============1536928750655395056==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Force fastset on debugfs write for each connector supporting PSR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168147/">https://patchwork.freedesktop.org/series/168147/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168147v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168147v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5222-cc6ecad1583df42f635269218c08a63e79218177_BAT -&gt; xe-pw-168147v1_BAT</h1>
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
<li>Linux: xe-5222-cc6ecad1583df42f635269218c08a63e79218177 -&gt; xe-pw-168147v1</li>
</ul>
<p>IGT_8953: 8953<br />
  IGT_8954: 8954<br />
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177<br />
  xe-pw-168147v1: 168147v1</p>

</body>
</html>

--===============1536928750655395056==--
