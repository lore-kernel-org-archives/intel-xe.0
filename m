Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD012C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 10:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA55610E084;
	Wed,  8 Nov 2023 10:43:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2557210E084;
 Wed,  8 Nov 2023 10:43:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D5A7AADF5;
 Wed,  8 Nov 2023 10:43:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5111725424908785643=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 08 Nov 2023 10:43:19 -0000
Message-ID: <169944019908.24273.13303452171926116308@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231102143127.2692-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231102143127.2692-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Disable_panic=5Fon=5Fwarn_for_testing_purposes_=28rev3=29?=
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

--===============5111725424908785643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable panic_on_warn for testing purposes (rev3)
URL   : https://patchwork.freedesktop.org/series/125858/
State : success

== Summary ==

CI Bug Log - changes from xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2_BAT -> xe-pw-125858v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-125858v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#692] / [Intel XE#773]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
  [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
  [Intel XE#773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/773


Build changes
-------------

  * IGT: IGT_7575 -> IGT_7576
  * Linux: xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2 -> xe-pw-125858v3

  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7576: d529fa7368a622634a9842a99df155cd10570446 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2: 2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2
  xe-pw-125858v3: 125858v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v3/index.html

--===============5111725424908785643==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable panic_on_warn for testing purposes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125858/">https://patchwork.freedesktop.org/series/125858/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2_BAT -&gt; xe-pw-125858v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125858v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/692">Intel XE#692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/773">Intel XE#773</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7575 -&gt; IGT_7576</li>
<li>Linux: xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2 -&gt; xe-pw-125858v3</li>
</ul>
<p>IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7576: d529fa7368a622634a9842a99df155cd10570446 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2: 2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2<br />
  xe-pw-125858v3: 125858v3</p>

</body>
</html>

--===============5111725424908785643==--
