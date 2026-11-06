Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9829606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C8C10E0C1;
	Fri,  6 Nov 2026 03:50:38 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A82710E0C1;
 Fri,  6 Nov 2026 03:50:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1520259172304934106=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe=3A_Preserve_healthy_preempted_LR_queues_across_system_?=
 =?utf-8?q?suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huajun Li" <huajun.li@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 03:50:37 -0000
Message-ID: <179393703742.129891.11718692070081838917@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106042332.412621-1-huajun.li@intel.com>
In-Reply-To: <20261106042332.412621-1-huajun.li@intel.com>
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

--===============1520259172304934106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe: Preserve healthy preempted LR queues across system suspend
URL   : https://patchwork.freedesktop.org/series/177913/
State : success

== Summary ==

CI Bug Log - changes from xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781_BAT -> xe-pw-177913v1_BAT
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

  * Linux: xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781 -> xe-pw-177913v1

  IGT_9180: 9180
  xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781: 939254095daf14bd6ed8b6ec575d9b0ac390d781
  xe-pw-177913v1: 177913v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177913v1/index.html

--===============1520259172304934106==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe: Preserve healthy preempted LR queues across system suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177913/">https://patchwork.freedesktop.org/series/177913/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177913v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177913v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781_BAT -&gt; xe-pw-177913v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781 -&gt; xe-pw-177913v1</li>
</ul>
<p>IGT_9180: 9180<br />
  xe-6076-939254095daf14bd6ed8b6ec575d9b0ac390d781: 939254095daf14bd6ed8b6ec575d9b0ac390d781<br />
  xe-pw-177913v1: 177913v1</p>

</body>
</html>

--===============1520259172304934106==--
