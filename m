Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C579A108E1ED
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D210E985;
	Thu, 19 Mar 2026 11:27:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4EF10E983;
 Thu, 19 Mar 2026 11:27:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6518645732428340382=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_AuxCCS_handling_and_render_?=
 =?utf-8?q?compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Mar 2026 11:27:26 -0000
Message-ID: <177391964649.375689.7679483106040644901@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
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

--===============6518645732428340382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/163519/
State : success

== Summary ==

CI Bug Log - changes from xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce_BAT -> xe-pw-163519v1_BAT
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

  Here are the changes found in xe-pw-163519v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][4] ([Intel XE#7249]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][6] ([Intel XE#7483]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][8] ([Intel XE#6506]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * Linux: xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce -> xe-pw-163519v1

  IGT_8810: eb9035ba642724dc0a7711672805f26d1f34f712 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce: 61409ba11a36fa5aff4ce0f0086a6026a43c5bce
  xe-pw-163519v1: 163519v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/index.html

--===============6518645732428340382==
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
<tr><td><b>Series:</b></td><td>AuxCCS handling and render compression modifiers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163519/">https://patchwork.freedesktop.org/series/163519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce_BAT -&gt; xe-pw-163519v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163519v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163519v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce -&gt; xe-pw-163519v1</li>
</ul>
<p>IGT_8810: eb9035ba642724dc0a7711672805f26d1f34f712 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4745-61409ba11a36fa5aff4ce0f0086a6026a43c5bce: 61409ba11a36fa5aff4ce0f0086a6026a43c5bce<br />
  xe-pw-163519v1: 163519v1</p>

</body>
</html>

--===============6518645732428340382==--
