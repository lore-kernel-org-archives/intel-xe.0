Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39327606A332
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 16:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CB0112BDC;
	Fri, 20 Nov 2026 16:10:38 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C923112BCF;
 Fri, 20 Nov 2026 16:10:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2698012787507200350=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Unregister_?=
 =?utf-8?q?hwmon_before_the_device_is_unplugged?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 16:10:37 -0000
Message-ID: <179519103750.60905.14298619285287331665@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
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

--===============2698012787507200350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Unregister hwmon before the device is unplugged
URL   : https://patchwork.freedesktop.org/series/179219/
State : success

== Summary ==

CI Bug Log - changes from xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69_BAT -> xe-pw-179219v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69 -> xe-pw-179219v1

  IGT_9200: 9200
  xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69: 5273820504a824f0c81ed31f939599dd0da3fc69
  xe-pw-179219v1: 179219v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179219v1/index.html

--===============2698012787507200350==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Unregister hwmon before the device is unplugged</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179219/">https://patchwork.freedesktop.org/series/179219/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179219v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179219v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69_BAT -&gt; xe-pw-179219v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69 -&gt; xe-pw-179219v1</li>
</ul>
<p>IGT_9200: 9200<br />
  xe-6195-5273820504a824f0c81ed31f939599dd0da3fc69: 5273820504a824f0c81ed31f939599dd0da3fc69<br />
  xe-pw-179219v1: 179219v1</p>

</body>
</html>

--===============2698012787507200350==--
