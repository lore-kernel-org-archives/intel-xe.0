Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B84C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 23:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931BF10EA8D;
	Thu, 10 Apr 2025 23:57:02 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E825210EA8F;
 Thu, 10 Apr 2025 23:57:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8912475678190130071=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Set_LRC_addresses?=
 =?utf-8?q?_before_guc_load_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 23:57:01 -0000
Message-ID: <174432942194.2150.2342487942283479121@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
In-Reply-To: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
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

--===============8912475678190130071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Set LRC addresses before guc load (rev2)
URL   : https://patchwork.freedesktop.org/series/147505/
State : success

== Summary ==

CI Bug Log - changes from xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb_BAT -> xe-pw-147505v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb -> xe-pw-147505v2

  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb: 00a3cb4f4ab069fae5ccd844f89f2962cc0283bb
  xe-pw-147505v2: 147505v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147505v2/index.html

--===============8912475678190130071==
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
<tr><td><b>Series:</b></td><td>drm/xe: Set LRC addresses before guc load (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147505/">https://patchwork.freedesktop.org/series/147505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147505v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147505v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb_BAT -&gt; xe-pw-147505v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb -&gt; xe-pw-147505v2</li>
</ul>
<p>IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb: 00a3cb4f4ab069fae5ccd844f89f2962cc0283bb<br />
  xe-pw-147505v2: 147505v2</p>

</body>
</html>

--===============8912475678190130071==--
