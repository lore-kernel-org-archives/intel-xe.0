Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C7DC5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 14:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5B810F00C;
	Fri,  1 Mar 2024 14:22:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC57910F00B;
 Fri,  1 Mar 2024 14:22:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4198214114125290095=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_Convert_fbdev_to_DRM?=
 =?utf-8?q?_client?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 14:22:45 -0000
Message-ID: <170930296570.436087.25775393104699503@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301134448.31289-1-tzimmermann@suse.de>
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
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

--===============4198214114125290095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Convert fbdev to DRM client
URL   : https://patchwork.freedesktop.org/series/130615/
State : success

== Summary ==

CI Bug Log - changes from xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5_BAT -> xe-pw-130615v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-130615v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#545])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#1161])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#616]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * Linux: xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5 -> xe-pw-130615v1

  IGT_7741: 7741
  xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5: 320f2374b2d52629a6a52c6c3059f02efd73c0a5
  xe-pw-130615v1: 130615v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/index.html

--===============4198214114125290095==
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
<tr><td><b>Series:</b></td><td>drm/i915: Convert fbdev to DRM client</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130615/">https://patchwork.freedesktop.org/series/130615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5_BAT -&gt; xe-pw-130615v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130615v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161">Intel XE#1161</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130615v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5 -&gt; xe-pw-130615v1</li>
</ul>
<p>IGT_7741: 7741<br />
  xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5: 320f2374b2d52629a6a52c6c3059f02efd73c0a5<br />
  xe-pw-130615v1: 130615v1</p>

</body>
</html>

--===============4198214114125290095==--
