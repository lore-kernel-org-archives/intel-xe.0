Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79BC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 13:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746B10E460;
	Mon, 10 Mar 2025 13:17:23 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EB810E45D;
 Mon, 10 Mar 2025 13:17:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6055067966704312016=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Prefetch_Support_for_svm_ra?=
 =?utf-8?q?nges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 13:17:22 -0000
Message-ID: <174161264278.14070.7590956521330945885@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

--===============6055067966704312016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prefetch Support for svm ranges
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

CI Bug Log - changes from xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a_BAT -> xe-pw-146079v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8267 -> IGT_8268
  * Linux: xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a -> xe-pw-146079v1

  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8268: a7465d3781d7e7a2374425cf4fecd945ef1e1bf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a
  xe-pw-146079v1: 146079v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v1/index.html

--===============6055067966704312016==
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
<tr><td><b>Series:</b></td><td>Prefetch Support for svm ranges</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146079/">https://patchwork.freedesktop.org/series/146079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146079v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a_BAT -&gt; xe-pw-146079v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8267 -&gt; IGT_8268</li>
<li>Linux: xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a -&gt; xe-pw-146079v1</li>
</ul>
<p>IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8268: a7465d3781d7e7a2374425cf4fecd945ef1e1bf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a<br />
  xe-pw-146079v1: 146079v1</p>

</body>
</html>

--===============6055067966704312016==--
