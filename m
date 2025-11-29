Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2426DCFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 06:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5DD10E1B2;
	Sat, 29 Nov 2025 06:37:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C3310E045;
 Sat, 29 Nov 2025 06:37:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8274638261551356138=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBBcHBseSBXYV8xNDAy?=
 =?utf-8?b?MDMxNjU4MCBpbiB4ZV9ndF9pZGxlX2VuYWJsZV9wZygp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Nov 2025 06:37:01 -0000
Message-ID: <176439822179.40073.8308722361629421384@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
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

--===============8274638261551356138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
URL   : https://patchwork.freedesktop.org/series/158230/
State : success

== Summary ==

CI Bug Log - changes from xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc_BAT -> xe-pw-158230v1_BAT
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

  * Linux: xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc -> xe-pw-158230v1

  IGT_8645: 8645
  xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc: 157d0854a24fa73f7516908563d3ee9eacc679fc
  xe-pw-158230v1: 158230v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/index.html

--===============8274638261551356138==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158230/">https://patchwork.freedesktop.org/series/158230/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc_BAT -&gt; xe-pw-158230v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc -&gt; xe-pw-158230v1</li>
</ul>
<p>IGT_8645: 8645<br />
  xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc: 157d0854a24fa73f7516908563d3ee9eacc679fc<br />
  xe-pw-158230v1: 158230v1</p>

</body>
</html>

--===============8274638261551356138==--
