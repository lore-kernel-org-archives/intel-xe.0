Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFFFC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 19:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B00410E63F;
	Tue, 21 Jan 2025 19:45:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4330110E63B;
 Tue, 21 Jan 2025 19:45:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3722105326286689118=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/backlight=3A_Retur?=
 =?utf-8?q?n_immediately_when_scale=28=29_finds_invalid_parameters_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 19:45:51 -0000
Message-ID: <173748875126.2728873.8100037795270098846@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121145203.2851237-1-linux@roeck-us.net>
In-Reply-To: <20250121145203.2851237-1-linux@roeck-us.net>
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

--===============3722105326286689118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Return immediately when scale() finds invalid parameters (rev2)
URL   : https://patchwork.freedesktop.org/series/143773/
State : success

== Summary ==

CI Bug Log - changes from xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b_BAT -> xe-pw-143773v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-143773v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [DMESG-WARN][1] ([Intel XE#4078]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * Linux: xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b -> xe-pw-143773v2

  IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b: 7727d97a1f38c61a60e87b2d38f7cc5a4aae277b
  xe-pw-143773v2: 143773v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/index.html

--===============3722105326286689118==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Return immediately when scale() finds invalid parameters (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143773/">https://patchwork.freedesktop.org/series/143773/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b_BAT -&gt; xe-pw-143773v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143773v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b -&gt; xe-pw-143773v2</li>
</ul>
<p>IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b: 7727d97a1f38c61a60e87b2d38f7cc5a4aae277b<br />
  xe-pw-143773v2: 143773v2</p>

</body>
</html>

--===============3722105326286689118==--
