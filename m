Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABDB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3810F1AC;
	Mon, 26 Oct 2026 22:51:28 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF310F1B4;
 Mon, 26 Oct 2026 22:51:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0519701659474903522=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Update_Wa=5F14026?=
 =?utf-8?q?539277?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 22:51:26 -0000
Message-ID: <179305508697.73708.13536632376390873298@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
In-Reply-To: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0519701659474903522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Update Wa_14026539277
URL   : https://patchwork.freedesktop.org/series/176895/
State : success

== Summary ==

CI Bug Log - changes from xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f_BAT -> xe-pw-176895v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9164 -> IGT_9166
  * Linux: xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f -> xe-pw-176895v1

  IGT_9164: 9164
  IGT_9166: 9166
  xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f: 3543fd9d737a3f30b44d036b5de64c379d1c376f
  xe-pw-176895v1: 176895v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176895v1/index.html

--===============0519701659474903522==
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
<tr><td><b>Series:</b></td><td>drm/xe: Update Wa_14026539277</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176895/">https://patchwork.freedesktop.org/series/176895/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176895v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176895v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f_BAT -&gt; xe-pw-176895v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9164 -&gt; IGT_9166</li>
<li>Linux: xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f -&gt; xe-pw-176895v1</li>
</ul>
<p>IGT_9164: 9164<br />
  IGT_9166: 9166<br />
  xe-6012-3543fd9d737a3f30b44d036b5de64c379d1c376f: 3543fd9d737a3f30b44d036b5de64c379d1c376f<br />
  xe-pw-176895v1: 176895v1</p>

</body>
</html>

--===============0519701659474903522==--
