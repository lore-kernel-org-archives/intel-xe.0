Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDC606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE4610E28E;
	Thu, 12 Nov 2026 14:57:24 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4410E28E;
 Thu, 12 Nov 2026 14:57:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7268683226756269949=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/cper=3A_Software_=28?=
 =?utf-8?q?driver-detected=29_CPER_error_reporting_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 14:57:24 -0000
Message-ID: <179449544411.16318.6299189665043498058@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
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

--===============7268683226756269949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cper: Software (driver-detected) CPER error reporting (rev4)
URL   : https://patchwork.freedesktop.org/series/176576/
State : success

== Summary ==

CI Bug Log - changes from xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7_BAT -> xe-pw-176576v4_BAT
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

  * Linux: xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7 -> xe-pw-176576v4

  IGT_9187: 9187
  xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7: 5eba64bd2f0a88e164db4c98f101fba936da41c7
  xe-pw-176576v4: 176576v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v4/index.html

--===============7268683226756269949==
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
<tr><td><b>Series:</b></td><td>drm/xe/cper: Software (driver-detected) CPER error reporting (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176576/">https://patchwork.freedesktop.org/series/176576/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7_BAT -&gt; xe-pw-176576v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7 -&gt; xe-pw-176576v4</li>
</ul>
<p>IGT_9187: 9187<br />
  xe-6123-5eba64bd2f0a88e164db4c98f101fba936da41c7: 5eba64bd2f0a88e164db4c98f101fba936da41c7<br />
  xe-pw-176576v4: 176576v4</p>

</body>
</html>

--===============7268683226756269949==--
