Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9813EC4332F
	for <intel-xe@archiver.kernel.org>; Sun,  5 Nov 2023 11:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7E710E108;
	Sun,  5 Nov 2023 11:46:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6056110E108;
 Sun,  5 Nov 2023 11:46:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5B14CAADF0;
 Sun,  5 Nov 2023 11:46:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7719286031846798127=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Date: Sun, 05 Nov 2023 11:46:31 -0000
Message-ID: <169918479133.24738.14780464597478731122@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231105105307.3710560-1-alexander.usyskin@intel.com>
In-Reply-To: <20231105105307.3710560-1-alexander.usyskin@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gs?=
 =?utf-8?q?c=3A_enable_pvc_support?=
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7719286031846798127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: enable pvc support
URL   : https://patchwork.freedesktop.org/series/125990/
State : success

== Summary ==

CI Bug Log - changes from xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT -> xe-pw-125990v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-471-fc457bcc18109467961edc92c80b238009f6a9fb -> xe-pw-125990v1

  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb
  xe-pw-125990v1: 125990v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125990v1/index.html

--===============7719286031846798127==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: enable pvc support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125990/">https://patchwork.freedesktop.org/series/125990/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125990v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125990v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT -&gt; xe-pw-125990v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-471-fc457bcc18109467961edc92c80b238009f6a9fb -&gt; xe-pw-125990v1</li>
</ul>
<p>IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb<br />
  xe-pw-125990v1: 125990v1</p>

</body>
</html>

--===============7719286031846798127==--
