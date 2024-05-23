Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0028C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 16:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F3910ED70;
	Thu, 23 May 2024 16:36:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12B610ED70;
 Thu, 23 May 2024 16:36:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8562325588843916371=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_remove_unused_struct_?=
 =?utf-8?q?=27xe=5Fgt=5Fdesc=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: linux@treblig.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 16:36:21 -0000
Message-ID: <171648218164.2170280.12357353187998690100@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522175840.382107-1-linux@treblig.org>
In-Reply-To: <20240522175840.382107-1-linux@treblig.org>
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

--===============8562325588843916371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: remove unused struct 'xe_gt_desc'
URL   : https://patchwork.freedesktop.org/series/133971/
State : failure

== Summary ==

CI Bug Log - changes from xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083_BAT -> xe-pw-133971v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133971v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133971v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133971v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-133971v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - {bat-lnl-1}:        [ABORT][3] ([Intel XE#1908]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7869 -> IGT_7870
  * Linux: xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083 -> xe-pw-133971v1

  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7870: ad1cea5f9b4ce0f4a036cbda2da3d8979fb1ce15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083: 8e768c3e813ab5519a85997b622edc9a2f79c083
  xe-pw-133971v1: 133971v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/index.html

--===============8562325588843916371==
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
<tr><td><b>Series:</b></td><td>drm/xe: remove unused struct &#x27;xe_gt_desc&#x27;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133971/">https://patchwork.freedesktop.org/series/133971/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083_BAT -&gt; xe-pw-133971v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133971v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133971v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133971v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133971v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133971v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7869 -&gt; IGT_7870</li>
<li>Linux: xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083 -&gt; xe-pw-133971v1</li>
</ul>
<p>IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7870: ad1cea5f9b4ce0f4a036cbda2da3d8979fb1ce15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083: 8e768c3e813ab5519a85997b622edc9a2f79c083<br />
  xe-pw-133971v1: 133971v1</p>

</body>
</html>

--===============8562325588843916371==--
