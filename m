Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEE7C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 11:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C814610F021;
	Tue, 16 Apr 2024 11:37:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA55A10F024;
 Tue, 16 Apr 2024 11:37:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4299457388494650804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_TTM_shrinker_helpers_and_xe_buff?=
 =?utf-8?q?er_object_shrinker_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 11:37:47 -0000
Message-ID: <171326746789.1443400.11652978668987248821@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

--===============4299457388494650804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev2)
URL   : https://patchwork.freedesktop.org/series/131815/
State : success

== Summary ==

CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_BAT -> xe-pw-131815v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_BAT and xe-pw-131815v2_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 5 pass(s)
    - Exec time: [6.92, 54.61] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7806 -> IGT_7807
  * Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -> xe-pw-131815v2

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb
  xe-pw-131815v2: 131815v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html

--===============4299457388494650804==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_BAT -&gt; xe-pw-131815v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_BAT and xe-pw-131815v2_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.92, 54.61] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGT_7807</li>
<li>Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -&gt; xe-pw-131815v2</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb<br />
  xe-pw-131815v2: 131815v2</p>

</body>
</html>

--===============4299457388494650804==--
