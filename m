Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E81606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 14:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7E210FD12;
	Wed, 18 Nov 2026 14:00:43 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902CE10FCE7;
 Wed, 18 Nov 2026 14:00:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8403423303254417976=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Don=27t_zap_impor?=
 =?utf-8?q?ted_bo_page-tables_on_L2_flush_optimized_hw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 14:00:42 -0000
Message-ID: <179501044258.43628.1570288279812358352@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118122011.487537-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261118122011.487537-1-thomas.hellstrom@linux.intel.com>
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

--===============8403423303254417976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't zap imported bo page-tables on L2 flush optimized hw
URL   : https://patchwork.freedesktop.org/series/178896/
State : success

== Summary ==

CI Bug Log - changes from xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f_BAT -> xe-pw-178896v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f -> xe-pw-178896v1

  IGT_9196: 9196
  xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f: b06015536eeea9b106eccd274e6f8b7bbc180e9f
  xe-pw-178896v1: 178896v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178896v1/index.html

--===============8403423303254417976==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t zap imported bo page-tables on L2 flush optimized hw</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178896/">https://patchwork.freedesktop.org/series/178896/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178896v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178896v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f_BAT -&gt; xe-pw-178896v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f -&gt; xe-pw-178896v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f: b06015536eeea9b106eccd274e6f8b7bbc180e9f<br />
  xe-pw-178896v1: 178896v1</p>

</body>
</html>

--===============8403423303254417976==--
