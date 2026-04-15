Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67208F428C8
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 19:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD8910E18F;
	Wed, 15 Apr 2026 19:22:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA5910E18F;
 Wed, 15 Apr 2026 19:22:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4649389474034896840=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv5?=
 =?utf-8?q?=2C1/1=5D_drm/xe/eustall=3A_Return_ENODEV_from_read_if_EU_stall_r?=
 =?utf-8?q?egisters_get_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 19:22:07 -0000
Message-ID: <177628092710.464821.6494140081444608403@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <6935698d70b6c7c347ff8b138209d601030c2c9f.1776200094.git.harish.chegondi@intel.com>
In-Reply-To: <6935698d70b6c7c347ff8b138209d601030c2c9f.1776200094.git.harish.chegondi@intel.com>
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

--===============4649389474034896840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/1] drm/xe/eustall: Return ENODEV from read if EU stall registers get reset
URL   : https://patchwork.freedesktop.org/series/164933/
State : success

== Summary ==

CI Bug Log - changes from xe-4905-4c59525db84aca677fd9f052e662912ad9d88448_BAT -> xe-pw-164933v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8859 -> IGT_8860
  * Linux: xe-4905-4c59525db84aca677fd9f052e662912ad9d88448 -> xe-pw-164933v1

  IGT_8859: 8d537f073bd4d30da991ab868bee2310ca664401 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8860: db5eb72e9ca0c8f7e39b9bfd88da1b28a85c9f8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4905-4c59525db84aca677fd9f052e662912ad9d88448: 4c59525db84aca677fd9f052e662912ad9d88448
  xe-pw-164933v1: 164933v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164933v1/index.html

--===============4649389474034896840==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/1] drm/xe/eustall: Return ENODEV from read if EU stall registers get reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164933/">https://patchwork.freedesktop.org/series/164933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164933v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164933v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4905-4c59525db84aca677fd9f052e662912ad9d88448_BAT -&gt; xe-pw-164933v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8859 -&gt; IGT_8860</li>
<li>Linux: xe-4905-4c59525db84aca677fd9f052e662912ad9d88448 -&gt; xe-pw-164933v1</li>
</ul>
<p>IGT_8859: 8d537f073bd4d30da991ab868bee2310ca664401 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8860: db5eb72e9ca0c8f7e39b9bfd88da1b28a85c9f8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4905-4c59525db84aca677fd9f052e662912ad9d88448: 4c59525db84aca677fd9f052e662912ad9d88448<br />
  xe-pw-164933v1: 164933v1</p>

</body>
</html>

--===============4649389474034896840==--
