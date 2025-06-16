Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EFAC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 15:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A47310E33B;
	Mon, 16 Jun 2025 15:56:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5E810E33B;
 Mon, 16 Jun 2025 15:56:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1049050512323253255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CCS_save_restore_for_IGPU_?=
 =?utf-8?q?=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Jun 2025 15:56:05 -0000
Message-ID: <175008936549.82997.17788432798481690236@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
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

--===============1049050512323253255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CCS save restore for IGPU (rev7)
URL   : https://patchwork.freedesktop.org/series/149108/
State : success

== Summary ==

CI Bug Log - changes from xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76_BAT -> xe-pw-149108v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-149108v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76/bat-pvc-2/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/bat-pvc-2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-atsm-2:         [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76/bat-atsm-2/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/bat-atsm-2/igt@fbdev@info.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134


Build changes
-------------

  * IGT: IGT_8411 -> IGT_8412
  * Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -> xe-pw-149108v7

  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8412: 8412
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76
  xe-pw-149108v7: 149108v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/index.html

--===============1049050512323253255==
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
<tr><td><b>Series:</b></td><td>CCS save restore for IGPU (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149108/">https://patchwork.freedesktop.org/series/149108/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76_BAT -&gt; xe-pw-149108v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149108v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76/bat-pvc-2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/bat-pvc-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76/bat-atsm-2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v7/bat-atsm-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8411 -&gt; IGT_8412</li>
<li>Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -&gt; xe-pw-149108v7</li>
</ul>
<p>IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8412: 8412<br />
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76<br />
  xe-pw-149108v7: 149108v7</p>

</body>
</html>

--===============1049050512323253255==--
