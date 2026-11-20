Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4672606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD210E1D5;
	Fri, 20 Nov 2026 07:15:25 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3798610E226;
 Fri, 20 Nov 2026 07:15:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2834755372035792548=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Hold_a_fence_refe?=
 =?utf-8?q?rence_while_waiting_for_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 07:15:23 -0000
Message-ID: <179515892322.57546.5151775680845847686@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120050530.3808036-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20261120050530.3808036-1-krishnaiah.bommu@intel.com>
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

--===============2834755372035792548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Hold a fence reference while waiting for migration
URL   : https://patchwork.freedesktop.org/series/179167/
State : success

== Summary ==

CI Bug Log - changes from xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420_BAT -> xe-pw-179167v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 12)
------------------------------

  Missing    (3): bat-bmg-1 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420 -> xe-pw-179167v1

  IGT_9200: 9200
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420
  xe-pw-179167v1: 179167v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179167v1/index.html

--===============2834755372035792548==
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
<tr><td><b>Series:</b></td><td>drm/xe: Hold a fence reference while waiting for migration</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179167/">https://patchwork.freedesktop.org/series/179167/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179167v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179167v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420_BAT -&gt; xe-pw-179167v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 12)</h2>
<p>Missing    (3): bat-bmg-1 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420 -&gt; xe-pw-179167v1</li>
</ul>
<p>IGT_9200: 9200<br />
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420<br />
  xe-pw-179167v1: 179167v1</p>

</body>
</html>

--===============2834755372035792548==--
