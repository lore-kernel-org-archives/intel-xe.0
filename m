Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812E606EEA6
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 16:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393C010E2B8;
	Mon,  9 Nov 2026 16:25:44 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE1D10E268;
 Mon,  9 Nov 2026 16:25:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0581988553077693829=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu/buddy=3A_find_range-bia?=
 =?utf-8?q?sed_blocks_in_the_free_trees?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Palacek, William" <william.palacek@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Nov 2026 16:25:42 -0000
Message-ID: <179424154250.140556.17942814677662121972@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261109134346.3169162-1-William.Palacek@amd.com>
In-Reply-To: <20261109134346.3169162-1-William.Palacek@amd.com>
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

--===============0581988553077693829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: find range-biased blocks in the free trees
URL   : https://patchwork.freedesktop.org/series/178108/
State : success

== Summary ==

CI Bug Log - changes from xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93_BAT -> xe-pw-178108v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 12)
------------------------------

  Missing    (3): bat-wcl-1 bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93 -> xe-pw-178108v1

  IGT_9181: 9181
  xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93: 5cd64b7b38f36620fbc117c53b4866b0590a3a93
  xe-pw-178108v1: 178108v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178108v1/index.html

--===============0581988553077693829==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: find range-biased blocks in the free trees</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178108/">https://patchwork.freedesktop.org/series/178108/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178108v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178108v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93_BAT -&gt; xe-pw-178108v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 12)</h2>
<p>Missing    (3): bat-wcl-1 bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93 -&gt; xe-pw-178108v1</li>
</ul>
<p>IGT_9181: 9181<br />
  xe-6093-5cd64b7b38f36620fbc117c53b4866b0590a3a93: 5cd64b7b38f36620fbc117c53b4866b0590a3a93<br />
  xe-pw-178108v1: 178108v1</p>

</body>
</html>

--===============0581988553077693829==--
