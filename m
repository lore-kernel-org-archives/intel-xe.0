Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C636CED245
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 22:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9710E34D;
	Mon,  7 Oct 2024 22:09:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8702E10E34D;
 Mon,  7 Oct 2024 22:09:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9007719328792218666=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Don=27t_allo?=
 =?utf-8?q?w_tile4_framebuffer_to_do_hflip_on_display20_or_greater?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 22:09:49 -0000
Message-ID: <172833898954.1200898.7808290414538813663@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
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

--===============9007719328792218666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater
URL   : https://patchwork.freedesktop.org/series/139665/
State : success

== Summary ==

CI Bug Log - changes from xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7_BAT -> xe-pw-139665v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-139665v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874


Build changes
-------------

  * Linux: xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7 -> xe-pw-139665v1

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7: 1f72b793ff063e3519fc58ca3f3e83854b990ee7
  xe-pw-139665v1: 139665v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html

--===============9007719328792218666==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Don&#x27;t allow tile4 framebuffer to do hflip on display20 or greater</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139665/">https://patchwork.freedesktop.org/series/139665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7_BAT -&gt; xe-pw-139665v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139665v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7 -&gt; xe-pw-139665v1</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7: 1f72b793ff063e3519fc58ca3f3e83854b990ee7<br />
  xe-pw-139665v1: 139665v1</p>

</body>
</html>

--===============9007719328792218666==--
