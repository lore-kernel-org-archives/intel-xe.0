Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D7CC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 08:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2FD10E5A3;
	Tue, 16 Jul 2024 08:03:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A48E10E5A3;
 Tue, 16 Jul 2024 08:03:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4334645698201858299=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Wedge_the_entire_devic?=
 =?utf-8?q?e_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 08:03:27 -0000
Message-ID: <172111700710.234018.12937854858047290922@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716060343.1310088-1-matthew.brost@intel.com>
In-Reply-To: <20240716060343.1310088-1-matthew.brost@intel.com>
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

--===============4334645698201858299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Wedge the entire device (rev2)
URL   : https://patchwork.freedesktop.org/series/136123/
State : failure

== Summary ==

CI Bug Log - changes from xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9_BAT -> xe-pw-136123v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136123v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136123v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136123v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@write:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9/bat-pvc-2/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/bat-pvc-2/igt@fbdev@write.html
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9/bat-atsm-2/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/bat-atsm-2/igt@fbdev@write.html

  


Build changes
-------------

  * IGT: IGT_7926 -> IGT_7927
  * Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -> xe-pw-136123v2

  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9
  xe-pw-136123v2: 136123v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/index.html

--===============4334645698201858299==
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
<tr><td><b>Series:</b></td><td>drm/xe: Wedge the entire device (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136123/">https://patchwork.freedesktop.org/series/136123/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9_BAT -&gt; xe-pw-136123v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136123v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136123v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136123v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@fbdev@write:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9/bat-pvc-2/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/bat-pvc-2/igt@fbdev@write.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9/bat-atsm-2/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136123v2/bat-atsm-2/igt@fbdev@write.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7926 -&gt; IGT_7927</li>
<li>Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -&gt; xe-pw-136123v2</li>
</ul>
<p>IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9<br />
  xe-pw-136123v2: 136123v2</p>

</body>
</html>

--===============4334645698201858299==--
