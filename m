Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E7CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 21:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8240410E85F;
	Tue, 16 Jun 2026 21:18:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA8310E85F;
 Tue, 16 Jun 2026 21:18:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8053795624516637428=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Flink=3A_Refac?=
 =?utf-8?q?tor_DP_link_capability_logic_part1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 21:18:02 -0000
Message-ID: <178164468290.86684.8233513805804138378@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616200849.3534628-1-imre.deak@intel.com>
In-Reply-To: <20260616200849.3534628-1-imre.deak@intel.com>
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

--===============8053795624516637428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_link: Refactor DP link capability logic part1
URL   : https://patchwork.freedesktop.org/series/168632/
State : success

== Summary ==

CI Bug Log - changes from xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526_BAT -> xe-pw-168632v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526 -> xe-pw-168632v1

  IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526: 5447491819dcc3d10fd362c7bfbf877d343f6526
  xe-pw-168632v1: 168632v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168632v1/index.html

--===============8053795624516637428==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_link: Refactor DP link capability logic part1</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168632/">https://patchwork.freedesktop.org/series/168632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168632v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168632v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526_BAT -&gt; xe-pw-168632v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526 -&gt; xe-pw-168632v1</li>
</ul>
<p>IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5267-5447491819dcc3d10fd362c7bfbf877d343f6526: 5447491819dcc3d10fd362c7bfbf877d343f6526<br />
  xe-pw-168632v1: 168632v1</p>

</body>
</html>

--===============8053795624516637428==--
