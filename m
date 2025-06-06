Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C58C5B552
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 01:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED5710E920;
	Fri,  6 Jun 2025 01:41:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CF710E920;
 Fri,  6 Jun 2025 01:41:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1497672784804495547=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_early_wedge_o?=
 =?utf-8?q?n_GuC_load_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 01:41:17 -0000
Message-ID: <174917407778.53928.17148815990488464723@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
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

--===============1497672784804495547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix early wedge on GuC load failure
URL   : https://patchwork.freedesktop.org/series/149906/
State : success

== Summary ==

CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -> xe-pw-149906v1_BAT
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

  * Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -> xe-pw-149906v1

  IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7
  xe-pw-149906v1: 149906v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v1/index.html

--===============1497672784804495547==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix early wedge on GuC load failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149906/">https://patchwork.freedesktop.org/series/149906/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -&gt; xe-pw-149906v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -&gt; xe-pw-149906v1</li>
</ul>
<p>IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7<br />
  xe-pw-149906v1: 149906v1</p>

</body>
</html>

--===============1497672784804495547==--
