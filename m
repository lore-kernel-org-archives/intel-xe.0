Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C4D68BD0
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3BE10E038;
	Sat, 16 Nov 2024 02:57:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BDE10E038;
 Sat, 16 Nov 2024 02:57:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3933659085270682354=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/vf=3A_Post-migration_reco?=
 =?utf-8?q?very_of_GGTT_nodes_and_CTB_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 Nov 2024 02:57:50 -0000
Message-ID: <173172587070.436711.8755150662925204796@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
In-Reply-To: <20241116021238.2486287-1-tomasz.lis@intel.com>
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

--===============3933659085270682354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev2)
URL   : https://patchwork.freedesktop.org/series/141439/
State : success

== Summary ==

CI Bug Log - changes from xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e_BAT -> xe-pw-141439v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141439v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#1033]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141439v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033


Build changes
-------------

  * Linux: xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e -> xe-pw-141439v2

  IGT_8114: 8114
  xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e: 9a7388467f79fb74c67a2444c5b1add91652f89e
  xe-pw-141439v2: 141439v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141439v2/index.html

--===============3933659085270682354==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141439/">https://patchwork.freedesktop.org/series/141439/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141439v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141439v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e_BAT -&gt; xe-pw-141439v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141439v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141439v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e -&gt; xe-pw-141439v2</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2242-9a7388467f79fb74c67a2444c5b1add91652f89e: 9a7388467f79fb74c67a2444c5b1add91652f89e<br />
  xe-pw-141439v2: 141439v2</p>

</body>
</html>

--===============3933659085270682354==--
