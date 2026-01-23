Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE26FD6CFAC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 00:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5930E10EBB3;
	Fri, 23 Jan 2026 00:05:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3869810EBB3;
 Fri, 23 Jan 2026 00:05:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1197808280787203374=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Separate_out_GuC_?=
 =?utf-8?q?RC_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 00:05:25 -0000
Message-ID: <176912672522.185372.9675960540029788638@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122232057.150725-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260122232057.150725-1-vinay.belgaumkar@intel.com>
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

--===============1197808280787203374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Separate out GuC RC code (rev2)
URL   : https://patchwork.freedesktop.org/series/158581/
State : success

== Summary ==

CI Bug Log - changes from xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50_BAT -> xe-pw-158581v2_BAT
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

  * IGT: IGT_8713 -> IGT_8714
  * Linux: xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50 -> xe-pw-158581v2

  IGT_8713: 33d772ed2d772fee329e6200cd968962f695a927 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8714: 8714
  xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50: cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50
  xe-pw-158581v2: 158581v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158581v2/index.html

--===============1197808280787203374==
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
<tr><td><b>Series:</b></td><td>drm/xe: Separate out GuC RC code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158581/">https://patchwork.freedesktop.org/series/158581/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158581v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158581v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50_BAT -&gt; xe-pw-158581v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8713 -&gt; IGT_8714</li>
<li>Linux: xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50 -&gt; xe-pw-158581v2</li>
</ul>
<p>IGT_8713: 33d772ed2d772fee329e6200cd968962f695a927 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8714: 8714<br />
  xe-4438-cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50: cb83f2b90fe3dba3db516c1d9ad1a86dcc5e8e50<br />
  xe-pw-158581v2: 158581v2</p>

</body>
</html>

--===============1197808280787203374==--
