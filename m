Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12149C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 12:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63E710E631;
	Wed, 14 May 2025 12:57:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91FA10E631;
 Wed, 14 May 2025 12:57:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4822088828146071427=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Prefetch_Support_for_svm_ra?=
 =?utf-8?q?nges_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 12:57:03 -0000
Message-ID: <174722742374.77995.12265328415272101947@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

--===============4822088828146071427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prefetch Support for svm ranges (rev9)
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

CI Bug Log - changes from xe-3086-2e72fd09b4fb0823282977f0717159e47328a533_BAT -> xe-pw-146079v9_BAT
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

  * IGT: IGT_8363 -> IGT_8364
  * Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -> xe-pw-146079v9

  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8364: 8364
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533
  xe-pw-146079v9: 146079v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v9/index.html

--===============4822088828146071427==
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
<tr><td><b>Series:</b></td><td>Prefetch Support for svm ranges (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146079/">https://patchwork.freedesktop.org/series/146079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3086-2e72fd09b4fb0823282977f0717159e47328a533_BAT -&gt; xe-pw-146079v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8363 -&gt; IGT_8364</li>
<li>Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -&gt; xe-pw-146079v9</li>
</ul>
<p>IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8364: 8364<br />
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533<br />
  xe-pw-146079v9: 146079v9</p>

</body>
</html>

--===============4822088828146071427==--
