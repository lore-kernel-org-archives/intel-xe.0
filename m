Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E5EC04EBA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC6A10FB21;
	Tue, 19 Mar 2024 14:37:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E9010E733;
 Tue, 19 Mar 2024 14:36:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0048815885702519619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_a_NULL_check_in_xe?=
 =?utf-8?q?=5Fttm=5Fstolen=5Fmgr=5Finit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 14:36:56 -0000
Message-ID: <171085901662.901865.15922110849450146464@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319130925.22399-1-nirmoy.das@intel.com>
In-Reply-To: <20240319130925.22399-1-nirmoy.das@intel.com>
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

--===============0048815885702519619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init
URL   : https://patchwork.freedesktop.org/series/131328/
State : success

== Summary ==

CI Bug Log - changes from xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85_BAT -> xe-pw-131328v1_BAT
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

  * Linux: xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85 -> xe-pw-131328v1

  IGT_7769: 7769
  xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85: 8bce3f2c9e8b3c23a242b11e32c62e662e722d85
  xe-pw-131328v1: 131328v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131328v1/index.html

--===============0048815885702519619==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131328/">https://patchwork.freedesktop.org/series/131328/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131328v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131328v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85_BAT -&gt; xe-pw-131328v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85 -&gt; xe-pw-131328v1</li>
</ul>
<p>IGT_7769: 7769<br />
  xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85: 8bce3f2c9e8b3c23a242b11e32c62e662e722d85<br />
  xe-pw-131328v1: 131328v1</p>

</body>
</html>

--===============0048815885702519619==--
