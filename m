Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A6606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 10:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7251010E959;
	Sat, 21 Nov 2026 10:58:26 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1805F10E959;
 Sat, 21 Nov 2026 10:58:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1639240487847235781=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Don=27t_warn_on_?=
 =?utf-8?q?oversized_page_directory_allocations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Nov 2026 10:58:25 -0000
Message-ID: <179525870509.63826.2721348587955011404@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121095703.1571697-2-shuicheng.lin@intel.com>
In-Reply-To: <20261121095703.1571697-2-shuicheng.lin@intel.com>
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

--===============1639240487847235781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Don't warn on oversized page directory allocations (rev2)
URL   : https://patchwork.freedesktop.org/series/179273/
State : success

== Summary ==

CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_BAT -> xe-pw-179273v2_BAT
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

  * Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -> xe-pw-179273v2

  IGT_9201: 9201
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0
  xe-pw-179273v2: 179273v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html

--===============1639240487847235781==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Don&#x27;t warn on oversized page directory allocations (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179273/">https://patchwork.freedesktop.org/series/179273/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_BAT -&gt; xe-pw-179273v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -&gt; xe-pw-179273v2</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0<br />
  xe-pw-179273v2: 179273v2</p>

</body>
</html>

--===============1639240487847235781==--
