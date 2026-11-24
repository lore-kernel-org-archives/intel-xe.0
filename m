Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A74606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 16:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9BC10E7B9;
	Tue, 24 Nov 2026 16:32:30 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2D10E2AF;
 Tue, 24 Nov 2026 16:32:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4254757941652426465=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Retry_when_drm=5F?=
 =?utf-8?q?gpusvm=5Fget=5Fpages=28=29_gives_-EBUSY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 16:32:28 -0000
Message-ID: <179553794896.79401.2670881647400942673@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124152300.2450568-1-tomasz.lis@intel.com>
In-Reply-To: <20261124152300.2450568-1-tomasz.lis@intel.com>
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

--===============4254757941652426465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY
URL   : https://patchwork.freedesktop.org/series/179512/
State : success

== Summary ==

CI Bug Log - changes from xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd_BAT -> xe-pw-179512v1_BAT
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

  * IGT: IGT_9201 -> IGT_9202
  * Linux: xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd -> xe-pw-179512v1

  IGT_9201: 9201
  IGT_9202: 9202
  xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd: 1bb2c850125a082e8c33037aa8cc6780cb90e2dd
  xe-pw-179512v1: 179512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179512v1/index.html

--===============4254757941652426465==
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
<tr><td><b>Series:</b></td><td>drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179512/">https://patchwork.freedesktop.org/series/179512/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179512v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179512v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd_BAT -&gt; xe-pw-179512v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9201 -&gt; IGT_9202</li>
<li>Linux: xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd -&gt; xe-pw-179512v1</li>
</ul>
<p>IGT_9201: 9201<br />
  IGT_9202: 9202<br />
  xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd: 1bb2c850125a082e8c33037aa8cc6780cb90e2dd<br />
  xe-pw-179512v1: 179512v1</p>

</body>
</html>

--===============4254757941652426465==--
