Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB81606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375B510E59E;
	Mon,  2 Nov 2026 09:28:47 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCEE10E330;
 Mon,  2 Nov 2026 09:28:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9008109885816899303=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Tear_down_kernel_?=
 =?utf-8?q?mappings_in_release=5Fnotify?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 09:28:46 -0000
Message-ID: <179361172676.101375.7716617607002710905@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102082626.747462-1-arvind.yadav@intel.com>
In-Reply-To: <20261102082626.747462-1-arvind.yadav@intel.com>
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

--===============9008109885816899303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Tear down kernel mappings in release_notify
URL   : https://patchwork.freedesktop.org/series/177423/
State : success

== Summary ==

CI Bug Log - changes from xe-6040-abc364961b361ab626fa5a09568b22744f1e0393_BAT -> xe-pw-177423v1_BAT
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

  * Linux: xe-6040-abc364961b361ab626fa5a09568b22744f1e0393 -> xe-pw-177423v1

  IGT_9173: 9173
  xe-6040-abc364961b361ab626fa5a09568b22744f1e0393: abc364961b361ab626fa5a09568b22744f1e0393
  xe-pw-177423v1: 177423v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177423v1/index.html

--===============9008109885816899303==
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
<tr><td><b>Series:</b></td><td>drm/xe: Tear down kernel mappings in release_notify</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177423/">https://patchwork.freedesktop.org/series/177423/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177423v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177423v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6040-abc364961b361ab626fa5a09568b22744f1e0393_BAT -&gt; xe-pw-177423v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6040-abc364961b361ab626fa5a09568b22744f1e0393 -&gt; xe-pw-177423v1</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6040-abc364961b361ab626fa5a09568b22744f1e0393: abc364961b361ab626fa5a09568b22744f1e0393<br />
  xe-pw-177423v1: 177423v1</p>

</body>
</html>

--===============9008109885816899303==--
