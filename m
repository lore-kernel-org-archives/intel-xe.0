Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09D3606A335
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 08:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C81610E3C6;
	Fri,  6 Nov 2026 08:13:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E543F10E3AE;
 Fri,  6 Nov 2026 08:13:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5334842355600757065=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Handle_non-fatal_errors_rou?=
 =?utf-8?q?ted_via_IRQ_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 08:13:10 -0000
Message-ID: <179395279093.130592.1779223101167330274@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106071944.2693854-10-riana.tauro@intel.com>
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
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

--===============5334842355600757065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle non-fatal errors routed via IRQ (rev4)
URL   : https://patchwork.freedesktop.org/series/173001/
State : success

== Summary ==

CI Bug Log - changes from xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1_BAT -> xe-pw-173001v4_BAT
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

  * Linux: xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1 -> xe-pw-173001v4

  IGT_9180: 9180
  xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1: 0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1
  xe-pw-173001v4: 173001v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173001v4/index.html

--===============5334842355600757065==
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
<tr><td><b>Series:</b></td><td>Handle non-fatal errors routed via IRQ (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173001/">https://patchwork.freedesktop.org/series/173001/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173001v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173001v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1_BAT -&gt; xe-pw-173001v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1 -&gt; xe-pw-173001v4</li>
</ul>
<p>IGT_9180: 9180<br />
  xe-6077-0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1: 0ab021ad358e391fc2f0b2f0d37d10cf3b8cf1e1<br />
  xe-pw-173001v4: 173001v4</p>

</body>
</html>

--===============5334842355600757065==--
