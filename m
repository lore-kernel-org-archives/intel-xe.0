Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBBCE6C5FD
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 04:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B6610E463;
	Tue,  3 Dec 2024 04:42:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F96C10E113;
 Tue,  3 Dec 2024 04:42:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1421069195071983593=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Maintenence_of_devcoredump_?=
 =?utf-8?q?=3C-=3E_GuC-Err-Capture_plumbing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 04:42:56 -0000
Message-ID: <173320097644.1874388.8298742395685594804@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1421069195071983593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Maintenence of devcoredump <-> GuC-Err-Capture plumbing (rev2)
URL   : https://patchwork.freedesktop.org/series/141459/
State : success

== Summary ==

CI Bug Log - changes from xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824_BAT -> xe-pw-141459v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824 -> xe-pw-141459v2

  IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a7f76ae830c89d1824
  xe-pw-141459v2: 141459v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141459v2/index.html

--===============1421069195071983593==
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
<tr><td><b>Series:</b></td><td>Maintenence of devcoredump &lt;-&gt; GuC-Err-Capture plumbing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141459/">https://patchwork.freedesktop.org/series/141459/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141459v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141459v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824_BAT -&gt; xe-pw-141459v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824 -&gt; xe-pw-141459v2</li>
</ul>
<p>IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a7f76ae830c89d1824<br />
  xe-pw-141459v2: 141459v2</p>

</body>
</html>

--===============1421069195071983593==--
