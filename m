Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69E606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FE110E82C;
	Tue, 24 Nov 2026 23:29:31 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3194E10E82C;
 Tue, 24 Nov 2026 23:29:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0035490297755307244=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Support_PCIe_F?=
 =?utf-8?q?LR_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 23:29:30 -0000
Message-ID: <179556297019.81312.2155763333595641666@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124203604.467922-1-lukasz.laguna@intel.com>
In-Reply-To: <20261124203604.467922-1-lukasz.laguna@intel.com>
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

--===============0035490297755307244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Support PCIe FLR (rev2)
URL   : https://patchwork.freedesktop.org/series/179511/
State : success

== Summary ==

CI Bug Log - changes from xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6_BAT -> xe-pw-179511v2_BAT
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

  * Linux: xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6 -> xe-pw-179511v2

  IGT_9203: 9203
  xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6: cb6f07e3276d07538caeb25e6282c0b828d949e6
  xe-pw-179511v2: 179511v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html

--===============0035490297755307244==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Support PCIe FLR (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179511/">https://patchwork.freedesktop.org/series/179511/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6_BAT -&gt; xe-pw-179511v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6 -&gt; xe-pw-179511v2</li>
</ul>
<p>IGT_9203: 9203<br />
  xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6: cb6f07e3276d07538caeb25e6282c0b828d949e6<br />
  xe-pw-179511v2: 179511v2</p>

</body>
</html>

--===============0035490297755307244==--
