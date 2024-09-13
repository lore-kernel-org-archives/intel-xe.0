Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF488EEEC39
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 06:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6610E20F;
	Fri, 13 Sep 2024 06:39:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A916510E20F;
 Fri, 13 Sep 2024 06:39:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0772497888504038905=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Don=27t_allo?=
 =?utf-8?q?w_tile4_framebuffer_to_do_hflip_on_Xe2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 06:39:08 -0000
Message-ID: <172620954868.995038.5997003140786871665@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912144606.862307-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240912144606.862307-1-juhapekka.heikkila@gmail.com>
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

--===============0772497888504038905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Don't allow tile4 framebuffer to do hflip on Xe2
URL   : https://patchwork.freedesktop.org/series/138591/
State : success

== Summary ==

CI Bug Log - changes from xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03_BAT -> xe-pw-138591v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-138591v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#1861]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138591v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * IGT: IGT_8013 -> IGT_8014
  * Linux: xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03 -> xe-pw-138591v1

  IGT_8013: 8013
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03: 33996ab92ebe57dd8b2c984fa7d0b0e622b32a03
  xe-pw-138591v1: 138591v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138591v1/index.html

--===============0772497888504038905==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Don&#x27;t allow tile4 framebuffer to do hflip on Xe2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138591/">https://patchwork.freedesktop.org/series/138591/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138591v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138591v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03_BAT -&gt; xe-pw-138591v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138591v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138591v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8013 -&gt; IGT_8014</li>
<li>Linux: xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03 -&gt; xe-pw-138591v1</li>
</ul>
<p>IGT_8013: 8013<br />
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03: 33996ab92ebe57dd8b2c984fa7d0b0e622b32a03<br />
  xe-pw-138591v1: 138591v1</p>

</body>
</html>

--===============0772497888504038905==--
