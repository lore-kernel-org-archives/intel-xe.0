Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5061C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 04:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501010E2D4;
	Wed, 22 Jan 2025 04:59:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62FD10E2C0;
 Wed, 22 Jan 2025 04:59:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2839879732889078830=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_stream-=3Epollin_fixes_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 04:59:36 -0000
Message-ID: <173752197693.2913844.3562360648564915413@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
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

--===============2839879732889078830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: stream->pollin fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/143808/
State : success

== Summary ==

CI Bug Log - changes from xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab_BAT -> xe-pw-143808v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab -> xe-pw-143808v2

  IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab: 0759e5d879e3a6a566f0c8effef1a7c6f8d78aab
  xe-pw-143808v2: 143808v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143808v2/index.html

--===============2839879732889078830==
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
<tr><td><b>Series:</b></td><td>stream-&gt;pollin fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143808/">https://patchwork.freedesktop.org/series/143808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143808v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143808v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab_BAT -&gt; xe-pw-143808v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab -&gt; xe-pw-143808v2</li>
</ul>
<p>IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2527-0759e5d879e3a6a566f0c8effef1a7c6f8d78aab: 0759e5d879e3a6a566f0c8effef1a7c6f8d78aab<br />
  xe-pw-143808v2: 143808v2</p>

</body>
</html>

--===============2839879732889078830==--
