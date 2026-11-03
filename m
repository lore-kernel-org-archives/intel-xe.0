Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7648606A327
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 14:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4BB10F620;
	Tue,  3 Nov 2026 14:35:42 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A710E4BE;
 Tue,  3 Nov 2026 14:35:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3935389910662285416=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu/buddy=3A_restore_two-pa?=
 =?utf-8?q?ss_clear/dirty_guard_for_range-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 14:35:40 -0000
Message-ID: <179371654057.110810.1767036919950042458@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
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

--===============3935389910662285416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/177603/
State : success

== Summary ==

CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_BAT -> xe-pw-177603v1_BAT
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

  * Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -> xe-pw-177603v1

  IGT_9176: 9176
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17
  xe-pw-177603v1: 177603v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html

--===============3935389910662285416==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177603/">https://patchwork.freedesktop.org/series/177603/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_BAT -&gt; xe-pw-177603v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -&gt; xe-pw-177603v1</li>
</ul>
<p>IGT_9176: 9176<br />
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17<br />
  xe-pw-177603v1: 177603v1</p>

</body>
</html>

--===============3935389910662285416==--
