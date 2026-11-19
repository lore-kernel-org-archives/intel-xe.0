Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93F606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85EC10F116;
	Thu, 19 Nov 2026 20:55:33 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A473010E5CE;
 Thu, 19 Nov 2026 20:55:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1263214064046123683=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Crescent_Island_PMT_support?=
 =?utf-8?q?_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 20:55:31 -0000
Message-ID: <179512173166.54497.11425035613845694327@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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

--===============1263214064046123683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev20)
URL   : https://patchwork.freedesktop.org/series/160717/
State : success

== Summary ==

CI Bug Log - changes from xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5_BAT -> xe-pw-160717v20_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5 -> xe-pw-160717v20

  IGT_9199: f28241ac1ad57574315e7bd31b174294cca2f29c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5: 859a3f2c44944276c49ab8d35f0ffd31b02b19c5
  xe-pw-160717v20: 160717v20

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v20/index.html

--===============1263214064046123683==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev20)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v20/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v20/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5_BAT -&gt; xe-pw-160717v20_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5 -&gt; xe-pw-160717v20</li>
</ul>
<p>IGT_9199: f28241ac1ad57574315e7bd31b174294cca2f29c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6189-859a3f2c44944276c49ab8d35f0ffd31b02b19c5: 859a3f2c44944276c49ab8d35f0ffd31b02b19c5<br />
  xe-pw-160717v20: 160717v20</p>

</body>
</html>

--===============1263214064046123683==--
