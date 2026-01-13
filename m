Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89CD29DCA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 04:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD3D10E216;
	Tue, 13 Jan 2026 04:45:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBB010E216;
 Tue, 13 Jan 2026 04:45:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8460374410236446624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_multi=5Fqueue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jan 2026 04:45:04 -0000
Message-ID: <176827950482.148689.12022310328225165356@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113025956.3505110-1-matthew.brost@intel.com>
In-Reply-To: <20260113025956.3505110-1-matthew.brost@intel.com>
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

--===============8460374410236446624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable multi_queue
URL   : https://patchwork.freedesktop.org/series/159992/
State : success

== Summary ==

CI Bug Log - changes from xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5_BAT -> xe-pw-159992v1_BAT
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

  * IGT: IGT_8698 -> IGT_8699
  * Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -> xe-pw-159992v1

  IGT_8698: a631adf809d1cea93174adecc7bfbac121c7d315 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5
  xe-pw-159992v1: 159992v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159992v1/index.html

--===============8460374410236446624==
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
<tr><td><b>Series:</b></td><td>Enable multi_queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159992/">https://patchwork.freedesktop.org/series/159992/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159992v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159992v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5_BAT -&gt; xe-pw-159992v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8698 -&gt; IGT_8699</li>
<li>Linux: xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5 -&gt; xe-pw-159992v1</li>
</ul>
<p>IGT_8698: a631adf809d1cea93174adecc7bfbac121c7d315 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4373-7907558010710b0829258fc6a7bbcbb8783b8aa5: 7907558010710b0829258fc6a7bbcbb8783b8aa5<br />
  xe-pw-159992v1: 159992v1</p>

</body>
</html>

--===============8460374410236446624==--
