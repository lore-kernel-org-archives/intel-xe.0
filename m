Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87021C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 20:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFA210E3FE;
	Tue, 29 Jul 2025 20:15:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D210E3FE;
 Tue, 29 Jul 2025 20:15:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0399200675546199154=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Foa=3A_Fix_unsig?=
 =?utf-8?q?ned_to_signed_cast_in_xe=5Foa=5Fget=5Foa=5Fconfig?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 20:15:24 -0000
Message-ID: <175382012442.196436.17897556567091401797@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
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

--===============0399200675546199154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_oa: Fix unsigned to signed cast in xe_oa_get_oa_config
URL   : https://patchwork.freedesktop.org/series/152247/
State : success

== Summary ==

CI Bug Log - changes from xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678_BAT -> xe-pw-152247v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678 -> xe-pw-152247v1

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
  xe-pw-152247v1: 152247v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152247v1/index.html

--===============0399200675546199154==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_oa: Fix unsigned to signed cast in xe_oa_get_oa_config</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152247/">https://patchwork.freedesktop.org/series/152247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152247v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152247v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678_BAT -&gt; xe-pw-152247v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678 -&gt; xe-pw-152247v1</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678<br />
  xe-pw-152247v1: 152247v1</p>

</body>
</html>

--===============0399200675546199154==--
