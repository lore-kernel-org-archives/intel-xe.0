Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1363606A33A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6930710E308;
	Thu,  5 Nov 2026 18:12:27 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5E10E2BD;
 Thu,  5 Nov 2026 18:12:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5400254550576700812=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fras=3A_Use_xe?=
 =?utf-8?q?=5Flog=5Finfo_to_avoid_passing_zero_as_error_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 18:12:27 -0000
Message-ID: <179390234718.128088.5325982729215446983@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261101225252.556741-1-ethantidmore06@gmail.com>
In-Reply-To: <20261101225252.556741-1-ethantidmore06@gmail.com>
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

--===============5400254550576700812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_ras: Use xe_log_info to avoid passing zero as error code (rev2)
URL   : https://patchwork.freedesktop.org/series/177448/
State : success

== Summary ==

CI Bug Log - changes from xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4_BAT -> xe-pw-177448v2_BAT
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

  * IGT: IGT_9177 -> IGT_9179
  * Linux: xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 -> xe-pw-177448v2

  IGT_9177: 9177
  IGT_9179: 9179
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4
  xe-pw-177448v2: 177448v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177448v2/index.html

--===============5400254550576700812==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_ras: Use xe_log_info to avoid passing zero as error code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177448/">https://patchwork.freedesktop.org/series/177448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177448v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177448v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4_BAT -&gt; xe-pw-177448v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9177 -&gt; IGT_9179</li>
<li>Linux: xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 -&gt; xe-pw-177448v2</li>
</ul>
<p>IGT_9177: 9177<br />
  IGT_9179: 9179<br />
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4<br />
  xe-pw-177448v2: 177448v2</p>

</body>
</html>

--===============5400254550576700812==--
