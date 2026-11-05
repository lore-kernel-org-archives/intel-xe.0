Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0606606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 04:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EFC10E59F;
	Thu,  5 Nov 2026 04:33:55 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66A10E2DA;
 Thu,  5 Nov 2026 04:33:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4044165258478313767=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Exclude_imported_?=
 =?utf-8?q?dma-buf_BOs_from_the_TT_budget_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 04:33:55 -0000
Message-ID: <179385323512.122407.5410072312090733891@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104181733.779688-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261104181733.779688-2-himal.prasad.ghimiray@intel.com>
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

--===============4044165258478313767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Exclude imported dma-buf BOs from the TT budget (rev2)
URL   : https://patchwork.freedesktop.org/series/177766/
State : success

== Summary ==

CI Bug Log - changes from xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_BAT -> xe-pw-177766v2_BAT
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

  * Linux: xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d -> xe-pw-177766v2

  IGT_9177: 9177
  xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d: 3379b0f74f31bfc3746b692822a7700aeeebe15d
  xe-pw-177766v2: 177766v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177766v2/index.html

--===============4044165258478313767==
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
<tr><td><b>Series:</b></td><td>drm/xe: Exclude imported dma-buf BOs from the TT budget (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177766/">https://patchwork.freedesktop.org/series/177766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177766v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177766v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_BAT -&gt; xe-pw-177766v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d -&gt; xe-pw-177766v2</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d: 3379b0f74f31bfc3746b692822a7700aeeebe15d<br />
  xe-pw-177766v2: 177766v2</p>

</body>
</html>

--===============4044165258478313767==--
