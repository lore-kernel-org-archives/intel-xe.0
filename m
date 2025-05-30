Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F07C3ABB2
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 04:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A257110E1AE;
	Fri, 30 May 2025 04:41:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE0910E7CD;
 Fri, 30 May 2025 04:41:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2088654838307182285=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/bmg=3A_Update_PCI_Id?=
 =?utf-8?q?=27s_and_Workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 04:41:52 -0000
Message-ID: <174858011296.33798.17608981929785104206@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

--===============2088654838307182285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bmg: Update PCI Id's and Workarounds
URL   : https://patchwork.freedesktop.org/series/149641/
State : success

== Summary ==

CI Bug Log - changes from xe-3157-bf0749a9930efe943554c3f73454d03c43779d15_BAT -> xe-pw-149641v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 7)
------------------------------

  Additional (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in xe-pw-149641v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       NOTRUN -> [ABORT][1] ([Intel XE#5155])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#5155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155


Build changes
-------------

  * Linux: xe-3157-bf0749a9930efe943554c3f73454d03c43779d15 -> xe-pw-149641v1

  IGT_8383: 8383
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15
  xe-pw-149641v1: 149641v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v1/index.html

--===============2088654838307182285==
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
<tr><td><b>Series:</b></td><td>drm/xe/bmg: Update PCI Id&#x27;s and Workarounds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149641/">https://patchwork.freedesktop.org/series/149641/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3157-bf0749a9930efe943554c3f73454d03c43779d15_BAT -&gt; xe-pw-149641v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 7)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149641v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155">Intel XE#5155</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3157-bf0749a9930efe943554c3f73454d03c43779d15 -&gt; xe-pw-149641v1</li>
</ul>
<p>IGT_8383: 8383<br />
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15<br />
  xe-pw-149641v1: 149641v1</p>

</body>
</html>

--===============2088654838307182285==--
