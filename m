Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48603D4899D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 13:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C5710E174;
	Fri, 16 Jan 2026 13:24:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5AF10E174;
 Fri, 16 Jan 2026 13:24:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1425763841477109274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_THP_support_in_drm?=
 =?utf-8?q?=5Fpagemap_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 13:24:46 -0000
Message-ID: <176856988638.161945.13202937290466847999@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260116111325.1736137-1-francois.dugast@intel.com>
In-Reply-To: <20260116111325.1736137-1-francois.dugast@intel.com>
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

--===============1425763841477109274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable THP support in drm_pagemap (rev7)
URL   : https://patchwork.freedesktop.org/series/159119/
State : success

== Summary ==

CI Bug Log - changes from xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a_BAT -> xe-pw-159119v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159119v7_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [DMESG-WARN][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v7/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  


Build changes
-------------

  * Linux: xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a -> xe-pw-159119v7

  IGT_8704: 8704
  xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a: 278a33d3977124821c19b51fb88d9d651b4fe40a
  xe-pw-159119v7: 159119v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v7/index.html

--===============1425763841477109274==
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
<tr><td><b>Series:</b></td><td>Enable THP support in drm_pagemap (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159119/">https://patchwork.freedesktop.org/series/159119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a_BAT -&gt; xe-pw-159119v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159119v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v7/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a -&gt; xe-pw-159119v7</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4395-278a33d3977124821c19b51fb88d9d651b4fe40a: 278a33d3977124821c19b51fb88d9d651b4fe40a<br />
  xe-pw-159119v7: 159119v7</p>

</body>
</html>

--===============1425763841477109274==--
