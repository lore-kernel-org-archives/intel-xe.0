Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A9BC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 20:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9DF10E869;
	Wed, 17 Jan 2024 20:56:54 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B0610E15E;
 Wed, 17 Jan 2024 20:56:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4249517461680695890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_correct_the_calculatio?=
 =?utf-8?q?n_of_remaining_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Wed, 17 Jan 2024 20:56:53 -0000
Message-ID: <170552501366.537693.11359269173897369321@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116200424.651661-1-fei.yang@intel.com>
In-Reply-To: <20240116200424.651661-1-fei.yang@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4249517461680695890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: correct the calculation of remaining size (rev2)
URL   : https://patchwork.freedesktop.org/series/128844/
State : success

== Summary ==

CI Bug Log - changes from xe-640-e492ced01835ac1c2712724ed5728057f267b111_BAT -> xe-pw-128844v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7678 -> IGT_7675
  * Linux: xe-640-e492ced01835ac1c2712724ed5728057f267b111 -> xe-pw-128844v2

  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-640-e492ced01835ac1c2712724ed5728057f267b111: e492ced01835ac1c2712724ed5728057f267b111
  xe-pw-128844v2: 128844v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128844v2/index.html

--===============4249517461680695890==
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
<tr><td><b>Series:</b></td><td>drm/xe: correct the calculation of remaining size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128844/">https://patchwork.freedesktop.org/series/128844/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128844v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128844v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-640-e492ced01835ac1c2712724ed5728057f267b111_BAT -&gt; xe-pw-128844v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7678 -&gt; IGT_7675</li>
<li>Linux: xe-640-e492ced01835ac1c2712724ed5728057f267b111 -&gt; xe-pw-128844v2</li>
</ul>
<p>IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-640-e492ced01835ac1c2712724ed5728057f267b111: e492ced01835ac1c2712724ed5728057f267b111<br />
  xe-pw-128844v2: 128844v2</p>

</body>
</html>

--===============4249517461680695890==--
