Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DFCD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 16:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A747710E110;
	Wed, 13 May 2026 16:36:07 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47C10E110;
 Wed, 13 May 2026 16:36:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3927039333569469949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_driver_core=3A_remove_softw?=
 =?utf-8?q?are_node_from_platform_devices_on_device_release_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 16:36:06 -0000
Message-ID: <177869016644.68993.3815869685477769708@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
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

--===============3927039333569469949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: driver core: remove software node from platform devices on device release (rev2)
URL   : https://patchwork.freedesktop.org/series/166515/
State : success

== Summary ==

CI Bug Log - changes from xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf_BAT -> xe-pw-166515v2_BAT
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

  * Linux: xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf -> xe-pw-166515v2

  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf: fac83f02a1733658723f3ac8fbb5532bcf3c56bf
  xe-pw-166515v2: 166515v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166515v2/index.html

--===============3927039333569469949==
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
<tr><td><b>Series:</b></td><td>driver core: remove software node from platform devices on device release (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166515/">https://patchwork.freedesktop.org/series/166515/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166515v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166515v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf_BAT -&gt; xe-pw-166515v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf -&gt; xe-pw-166515v2</li>
</ul>
<p>IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5057-fac83f02a1733658723f3ac8fbb5532bcf3c56bf: fac83f02a1733658723f3ac8fbb5532bcf3c56bf<br />
  xe-pw-166515v2: 166515v2</p>

</body>
</html>

--===============3927039333569469949==--
