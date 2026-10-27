Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC6606D93D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2210F68A;
	Tue, 27 Oct 2026 15:37:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77F10F67D;
 Tue, 27 Oct 2026 15:37:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6203811515570121933=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Update_Wa=5F14026?=
 =?utf-8?q?539277?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 15:37:52 -0000
Message-ID: <179311547237.77490.2939902578065474865@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027-wa_14026539277-v5-0-541941b1c032@intel.com>
In-Reply-To: <20261027-wa_14026539277-v5-0-541941b1c032@intel.com>
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

--===============6203811515570121933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Update Wa_14026539277
URL   : https://patchwork.freedesktop.org/series/176958/
State : success

== Summary ==

CI Bug Log - changes from xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e_BAT -> xe-pw-176958v1_BAT
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

  * IGT: IGT_9166 -> IGT_9167
  * Linux: xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e -> xe-pw-176958v1

  IGT_9166: 9166
  IGT_9167: 9167
  xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e: d645db52a6b60d0f0d921077f0233085b41b3a1e
  xe-pw-176958v1: 176958v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176958v1/index.html

--===============6203811515570121933==
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
<tr><td><b>Series:</b></td><td>drm/xe: Update Wa_14026539277</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176958/">https://patchwork.freedesktop.org/series/176958/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176958v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176958v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e_BAT -&gt; xe-pw-176958v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9166 -&gt; IGT_9167</li>
<li>Linux: xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e -&gt; xe-pw-176958v1</li>
</ul>
<p>IGT_9166: 9166<br />
  IGT_9167: 9167<br />
  xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e: d645db52a6b60d0f0d921077f0233085b41b3a1e<br />
  xe-pw-176958v1: 176958v1</p>

</body>
</html>

--===============6203811515570121933==--
