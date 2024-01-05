Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CFC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 21:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F7E10E6A3;
	Fri,  5 Jan 2024 21:12:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A0510E69E;
 Fri,  5 Jan 2024 21:12:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6475416824740756111=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_unlock_on_error_path_i?=
 =?utf-8?q?n_xe=5Fvm=5Fadd=5Fcompute=5Fexec=5Fqueue=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Fri, 05 Jan 2024 21:12:30 -0000
Message-ID: <170448915093.57116.9242967201163543141@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
In-Reply-To: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============6475416824740756111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
URL   : https://patchwork.freedesktop.org/series/128270/
State : success

== Summary ==

CI Bug Log - changes from xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513_BAT -> xe-pw-128270v1_BAT
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

  Here are the changes found in xe-pw-128270v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] ([Intel XE#1099])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513 -> xe-pw-128270v1

  IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513: 2f34bf674c7dad8d0cb6ae92d4e56805d63d0513
  xe-pw-128270v1: 128270v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/index.html

--===============6475416824740756111==
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
<tr><td><b>Series:</b></td><td>drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128270/">https://patchwork.freedesktop.org/series/128270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513_BAT -&gt; xe-pw-128270v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128270v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128270v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513 -&gt; xe-pw-128270v1</li>
</ul>
<p>IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513: 2f34bf674c7dad8d0cb6ae92d4e56805d63d0513<br />
  xe-pw-128270v1: 128270v1</p>

</body>
</html>

--===============6475416824740756111==--
