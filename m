Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC5C5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 14:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344310E8A9;
	Mon, 10 Aug 2026 14:14:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D323910E8A5;
 Mon, 10 Aug 2026 14:14:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8697992389616593657=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/drm=5Fras=3A_Move_ha?=
 =?utf-8?q?s=5Fdrm=5Fras_check_to_drm=5Fras_layer_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 14:14:11 -0000
Message-ID: <178637125185.35122.5809268087096717533@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810124101.105832-1-raag.jadav@intel.com>
In-Reply-To: <20260810124101.105832-1-raag.jadav@intel.com>
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

--===============8697992389616593657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer (rev3)
URL   : https://patchwork.freedesktop.org/series/171492/
State : success

== Summary ==

CI Bug Log - changes from xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79_BAT -> xe-pw-171492v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79 -> xe-pw-171492v3

  IGT_9047: 9047
  xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79: b241fb2563d63b4781896701a88b25cbc21c6c79
  xe-pw-171492v3: 171492v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/index.html

--===============8697992389616593657==
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
<tr><td><b>Series:</b></td><td>drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171492/">https://patchwork.freedesktop.org/series/171492/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79_BAT -&gt; xe-pw-171492v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79 -&gt; xe-pw-171492v3</li>
</ul>
<p>IGT_9047: 9047<br />
  xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79: b241fb2563d63b4781896701a88b25cbc21c6c79<br />
  xe-pw-171492v3: 171492v3</p>

</body>
</html>

--===============8697992389616593657==--
