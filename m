Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C566CCF45CF
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 21:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133D10E17B;
	Mon, 12 Jan 2026 21:12:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21C10E086;
 Mon, 12 Jan 2026 21:12:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6141223432343747054=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Expose_new_?=
 =?utf-8?q?temperature_attributes_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jan 2026 21:12:18 -0000
Message-ID: <176825233864.147209.6255167268843479811@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
In-Reply-To: <20260112203521.1014388-1-karthik.poosa@intel.com>
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

--===============6141223432343747054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Expose new temperature attributes (rev9)
URL   : https://patchwork.freedesktop.org/series/158384/
State : success

== Summary ==

CI Bug Log - changes from xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9_BAT -> xe-pw-158384v9_BAT
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

  * Linux: xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9 -> xe-pw-158384v9

  IGT_8697: 8697
  xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9: fb2e525015f1b65b83809995601ea7827ee08ab9
  xe-pw-158384v9: 158384v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v9/index.html

--===============6141223432343747054==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Expose new temperature attributes (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158384/">https://patchwork.freedesktop.org/series/158384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9_BAT -&gt; xe-pw-158384v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9 -&gt; xe-pw-158384v9</li>
</ul>
<p>IGT_8697: 8697<br />
  xe-4370-fb2e525015f1b65b83809995601ea7827ee08ab9: fb2e525015f1b65b83809995601ea7827ee08ab9<br />
  xe-pw-158384v9: 158384v9</p>

</body>
</html>

--===============6141223432343747054==--
