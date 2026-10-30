Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BE5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBA010E404;
	Fri, 30 Oct 2026 15:52:34 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2502A10E257;
 Fri, 30 Oct 2026 15:52:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0137228367220462783=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_ocode_late_binding_supp?=
 =?utf-8?q?ort_for_CRI_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 15:52:34 -0000
Message-ID: <179337555414.95051.10077491417888204978@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
In-Reply-To: <20261030144547.2532309-8-badal.nilawar@intel.com>
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

--===============0137228367220462783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add ocode late binding support for CRI (rev6)
URL   : https://patchwork.freedesktop.org/series/162657/
State : success

== Summary ==

CI Bug Log - changes from xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9_BAT -> xe-pw-162657v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-nvls-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9171 -> IGT_9172
  * Linux: xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9 -> xe-pw-162657v6

  IGT_9171: 9171
  IGT_9172: 9172
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9
  xe-pw-162657v6: 162657v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162657v6/index.html

--===============0137228367220462783==
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
<tr><td><b>Series:</b></td><td>Add ocode late binding support for CRI (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162657/">https://patchwork.freedesktop.org/series/162657/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162657v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162657v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9_BAT -&gt; xe-pw-162657v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9171 -&gt; IGT_9172</li>
<li>Linux: xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9 -&gt; xe-pw-162657v6</li>
</ul>
<p>IGT_9171: 9171<br />
  IGT_9172: 9172<br />
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9<br />
  xe-pw-162657v6: 162657v6</p>

</body>
</html>

--===============0137228367220462783==--
