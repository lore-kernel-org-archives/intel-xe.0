Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1135606A5A1
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 14:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617710EF69;
	Mon,  2 Nov 2026 14:55:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A12010EF68;
 Mon,  2 Nov 2026 14:55:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4923571090584366890=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/ttm=2C_drm/xe=3A_Per-B?=
 =?utf-8?q?O_host_NUMA_node_placement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 14:55:02 -0000
Message-ID: <179363130242.103899.15815990194603141527@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102101803.455921-9-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261102101803.455921-9-himal.prasad.ghimiray@intel.com>
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

--===============4923571090584366890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm, drm/xe: Per-BO host NUMA node placement
URL   : https://patchwork.freedesktop.org/series/177437/
State : success

== Summary ==

CI Bug Log - changes from xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee_FULL -> xe-pw-177437v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee -> xe-pw-177437v1

  IGT_9173: 9173
  xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee: 77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee
  xe-pw-177437v1: 177437v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177437v1/index.html

--===============4923571090584366890==
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
<tr><td><b>Series:</b></td><td>drm/ttm, drm/xe: Per-BO host NUMA node placement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177437/">https://patchwork.freedesktop.org/series/177437/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177437v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177437v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee_FULL -&gt; xe-pw-177437v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee -&gt; xe-pw-177437v1</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6043-77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee: 77e9b8bc2afe3ad1cff8570dcae1bf0998fcffee<br />
  xe-pw-177437v1: 177437v1</p>

</body>
</html>

--===============4923571090584366890==--
