Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5C606A33A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 17:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65E10E3A8;
	Fri, 13 Nov 2026 17:09:42 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9710E3A8;
 Fri, 13 Nov 2026 17:09:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9010144503237700294=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgTUlfU0VNQVBI?=
 =?utf-8?b?T1JFX1dBSVRfNjQgKFdhXzE2MDI5MjgxOTEzKSAocmV2Myk=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 17:09:41 -0000
Message-ID: <179458978175.21808.5499446887638855207@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============9010144503237700294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev3)
URL   : https://patchwork.freedesktop.org/series/177436/
State : success

== Summary ==

CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_BAT -> xe-pw-177436v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9190 -> IGT_9191
  * Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -> xe-pw-177436v3

  IGT_9190: 9190
  IGT_9191: 9191
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d
  xe-pw-177436v3: 177436v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v3/index.html

--===============9010144503237700294==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177436/">https://patchwork.freedesktop.org/series/177436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_BAT -&gt; xe-pw-177436v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9190 -&gt; IGT_9191</li>
<li>Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -&gt; xe-pw-177436v3</li>
</ul>
<p>IGT_9190: 9190<br />
  IGT_9191: 9191<br />
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d<br />
  xe-pw-177436v3: 177436v3</p>

</body>
</html>

--===============9010144503237700294==--
