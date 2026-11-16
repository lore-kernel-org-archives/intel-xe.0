Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E4606A886
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765D10F29E;
	Mon, 16 Nov 2026 15:52:29 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5432D10F28B;
 Mon, 16 Nov 2026 15:52:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5098319888785068830=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/atomic=3A_Simplify_vbla?=
 =?utf-8?q?nk_event_lifetime/ownership?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 15:52:28 -0000
Message-ID: <179484434833.33262.8858766757542587724@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116125649.15742-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116125649.15742-1-ville.syrjala@linux.intel.com>
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

--===============5098319888785068830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Simplify vblank event lifetime/ownership
URL   : https://patchwork.freedesktop.org/series/178686/
State : success

== Summary ==

CI Bug Log - changes from xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42_BAT -> xe-pw-178686v1_BAT
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

  * IGT: IGT_9192 -> IGT_9193
  * Linux: xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42 -> xe-pw-178686v1

  IGT_9192: 9192
  IGT_9193: 9193
  xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42: 038b4cc7dba91006374b26c220bdad77c5d6bb42
  xe-pw-178686v1: 178686v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178686v1/index.html

--===============5098319888785068830==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Simplify vblank event lifetime/ownership</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178686/">https://patchwork.freedesktop.org/series/178686/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178686v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178686v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42_BAT -&gt; xe-pw-178686v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9192 -&gt; IGT_9193</li>
<li>Linux: xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42 -&gt; xe-pw-178686v1</li>
</ul>
<p>IGT_9192: 9192<br />
  IGT_9193: 9193<br />
  xe-6151-038b4cc7dba91006374b26c220bdad77c5d6bb42: 038b4cc7dba91006374b26c220bdad77c5d6bb42<br />
  xe-pw-178686v1: 178686v1</p>

</body>
</html>

--===============5098319888785068830==--
