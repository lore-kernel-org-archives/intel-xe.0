Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542FCCD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 20:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0812B10E330;
	Sat, 23 May 2026 20:36:40 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0874310E095;
 Sat, 23 May 2026 20:36:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4415909303244914429=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_new_general_DRM_propert?=
 =?utf-8?q?y_=22color_format=22_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 May 2026 20:36:38 -0000
Message-ID: <177956859802.2946.7506550141769428296@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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

--===============4415909303244914429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new general DRM property "color format" (rev13)
URL   : https://patchwork.freedesktop.org/series/157911/
State : success

== Summary ==

CI Bug Log - changes from xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_BAT -> xe-pw-157911v13_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_BAT and xe-pw-157911v13_BAT:

### New IGT tests (1) ###

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f -> xe-pw-157911v13

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f: ca274c47b66d01ca8986007a2d7d395aa5cf247f
  xe-pw-157911v13: 157911v13

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157911v13/index.html

--===============4415909303244914429==
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
<tr><td><b>Series:</b></td><td>Add new general DRM property &quot;color format&quot; (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157911/">https://patchwork.freedesktop.org/series/157911/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157911v13/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157911v13/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_BAT -&gt; xe-pw-157911v13_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_BAT and xe-pw-157911v13_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_query@multigpu-query-topology-l3-bank-mask:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f -&gt; xe-pw-157911v13</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f: ca274c47b66d01ca8986007a2d7d395aa5cf247f<br />
  xe-pw-157911v13: 157911v13</p>

</body>
</html>

--===============4415909303244914429==--
