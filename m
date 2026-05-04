Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB88FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 14:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECF610E704;
	Mon,  4 May 2026 14:01:19 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6C010E704;
 Mon,  4 May 2026 14:01:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3519137181067346156=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_MST_VCPI_lookup_and_mod?=
 =?utf-8?q?eset-lock_splat_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 14:01:18 -0000
Message-ID: <177790327818.33712.14203618011550552170@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504101117.3619984-1-suraj.kandpal@intel.com>
In-Reply-To: <20260504101117.3619984-1-suraj.kandpal@intel.com>
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

--===============3519137181067346156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix MST VCPI lookup and modeset-lock splat (rev2)
URL   : https://patchwork.freedesktop.org/series/165748/
State : success

== Summary ==

CI Bug Log - changes from xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc_BAT -> xe-pw-165748v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc -> xe-pw-165748v2

  IGT_8882: 3ef61dd87d23e6c8d7956b5a72ba01a6597a3fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc: b7b044c135319b52782f6d3a8aa55982927273dc
  xe-pw-165748v2: 165748v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165748v2/index.html

--===============3519137181067346156==
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
<tr><td><b>Series:</b></td><td>Fix MST VCPI lookup and modeset-lock splat (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165748/">https://patchwork.freedesktop.org/series/165748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165748v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165748v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc_BAT -&gt; xe-pw-165748v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc -&gt; xe-pw-165748v2</li>
</ul>
<p>IGT_8882: 3ef61dd87d23e6c8d7956b5a72ba01a6597a3fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4975-b7b044c135319b52782f6d3a8aa55982927273dc: b7b044c135319b52782f6d3a8aa55982927273dc<br />
  xe-pw-165748v2: 165748v2</p>

</body>
</html>

--===============3519137181067346156==--
