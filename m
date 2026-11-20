Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8BA606A6C6
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FFD10E0C5;
	Fri, 20 Nov 2026 20:08:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4910E0C5;
 Fri, 20 Nov 2026 20:08:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6594590614981554098=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Handle_GuC_semaph?=
 =?utf-8?q?ore_instruction_field_check_error_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 20:08:11 -0000
Message-ID: <179520529198.62020.5875912062323532802@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120191111.4097737-4-jesus.narvaez@intel.com>
In-Reply-To: <20261120191111.4097737-4-jesus.narvaez@intel.com>
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

--===============6594590614981554098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Handle GuC semaphore instruction field check error (rev2)
URL   : https://patchwork.freedesktop.org/series/178748/
State : success

== Summary ==

CI Bug Log - changes from xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418_BAT -> xe-pw-178748v2_BAT
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

  * IGT: IGT_9200 -> IGT_9201
  * Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -> xe-pw-178748v2

  IGT_9200: 9200
  IGT_9201: 9201
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418
  xe-pw-178748v2: 178748v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178748v2/index.html

--===============6594590614981554098==
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
<tr><td><b>Series:</b></td><td>drm/xe: Handle GuC semaphore instruction field check error (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178748/">https://patchwork.freedesktop.org/series/178748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178748v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178748v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418_BAT -&gt; xe-pw-178748v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9200 -&gt; IGT_9201</li>
<li>Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -&gt; xe-pw-178748v2</li>
</ul>
<p>IGT_9200: 9200<br />
  IGT_9201: 9201<br />
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418<br />
  xe-pw-178748v2: 178748v2</p>

</body>
</html>

--===============6594590614981554098==--
