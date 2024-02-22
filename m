Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFBEC47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 21:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986E610EA8C;
	Thu, 22 Feb 2024 21:40:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46EA10EA8C;
 Thu, 22 Feb 2024 21:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1964988786094695538=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/dg2=3A_Fix_number_of_mocs?=
 =?utf-8?q?_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 21:40:28 -0000
Message-ID: <170863802887.217031.3395719660799542082@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222204203.3007498-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222204203.3007498-1-lucas.demarchi@intel.com>
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

--===============1964988786094695538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/dg2: Fix number of mocs entries
URL   : https://patchwork.freedesktop.org/series/130286/
State : success

== Summary ==

CI Bug Log - changes from xe-829-5dfa3c2da4803652582408bfb3c529970735f594_BAT -> xe-pw-130286v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-130286v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [DMESG-WARN][1] ([Intel XE#1009]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-829-5dfa3c2da4803652582408bfb3c529970735f594/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130286v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009


Build changes
-------------

  * IGT: IGT_7724 -> IGT_7725
  * Linux: xe-829-5dfa3c2da4803652582408bfb3c529970735f594 -> xe-pw-130286v1

  IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7725: 7725
  xe-829-5dfa3c2da4803652582408bfb3c529970735f594: 5dfa3c2da4803652582408bfb3c529970735f594
  xe-pw-130286v1: 130286v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130286v1/index.html

--===============1964988786094695538==
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
<tr><td><b>Series:</b></td><td>drm/xe/dg2: Fix number of mocs entries</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130286/">https://patchwork.freedesktop.org/series/130286/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130286v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130286v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-829-5dfa3c2da4803652582408bfb3c529970735f594_BAT -&gt; xe-pw-130286v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130286v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small-multi-vm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-829-5dfa3c2da4803652582408bfb3c529970735f594/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130286v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7724 -&gt; IGT_7725</li>
<li>Linux: xe-829-5dfa3c2da4803652582408bfb3c529970735f594 -&gt; xe-pw-130286v1</li>
</ul>
<p>IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7725: 7725<br />
  xe-829-5dfa3c2da4803652582408bfb3c529970735f594: 5dfa3c2da4803652582408bfb3c529970735f594<br />
  xe-pw-130286v1: 130286v1</p>

</body>
</html>

--===============1964988786094695538==--
