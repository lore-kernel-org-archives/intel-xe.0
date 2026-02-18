Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97373E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 17:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784810E606;
	Wed, 18 Feb 2026 17:05:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B22B10E606;
 Wed, 18 Feb 2026 17:05:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2977886904291267819=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_DRM=5FRAS_using_g?=
 =?utf-8?q?eneric_netlink_for_RAS_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 17:05:47 -0000
Message-ID: <177143434761.262680.3086838601135145738@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218121904.157295-7-riana.tauro@intel.com>
In-Reply-To: <20260218121904.157295-7-riana.tauro@intel.com>
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

--===============2977886904291267819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM_RAS using generic netlink for RAS (rev7)
URL   : https://patchwork.freedesktop.org/series/155188/
State : success

== Summary ==

CI Bug Log - changes from xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d_BAT -> xe-pw-155188v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155188v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v7/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8758 -> IGT_8760
  * Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -> xe-pw-155188v7

  IGT_8758: 8758
  IGT_8760: 8760
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d
  xe-pw-155188v7: 155188v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v7/index.html

--===============2977886904291267819==
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
<tr><td><b>Series:</b></td><td>Introduce DRM_RAS using generic netlink for RAS (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155188/">https://patchwork.freedesktop.org/series/155188/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d_BAT -&gt; xe-pw-155188v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155188v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v7/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8758 -&gt; IGT_8760</li>
<li>Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -&gt; xe-pw-155188v7</li>
</ul>
<p>IGT_8758: 8758<br />
  IGT_8760: 8760<br />
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d<br />
  xe-pw-155188v7: 155188v7</p>

</body>
</html>

--===============2977886904291267819==--
