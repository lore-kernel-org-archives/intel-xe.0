Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E416606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 21:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121E110E05C;
	Tue, 10 Nov 2026 21:25:22 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7C10E05C;
 Tue, 10 Nov 2026 21:25:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5519542731476970778=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/xe3p=5Flpd=3A_Redu?=
 =?utf-8?q?ce_lowest_CDCLK_PLL_ratio_to_18_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 21:25:21 -0000
Message-ID: <179434592113.5399.4809866947289155190@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
In-Reply-To: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
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

--===============5519542731476970778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18 (rev3)
URL   : https://patchwork.freedesktop.org/series/175565/
State : success

== Summary ==

CI Bug Log - changes from xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232_BAT -> xe-pw-175565v3_BAT
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

  * IGT: IGT_9184 -> IGT_9185
  * Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -> xe-pw-175565v3

  IGT_9184: 9184
  IGT_9185: 9185
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232
  xe-pw-175565v3: 175565v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175565v3/index.html

--===============5519542731476970778==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175565/">https://patchwork.freedesktop.org/series/175565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175565v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175565v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232_BAT -&gt; xe-pw-175565v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9184 -&gt; IGT_9185</li>
<li>Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -&gt; xe-pw-175565v3</li>
</ul>
<p>IGT_9184: 9184<br />
  IGT_9185: 9185<br />
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232<br />
  xe-pw-175565v3: 175565v3</p>

</body>
</html>

--===============5519542731476970778==--
