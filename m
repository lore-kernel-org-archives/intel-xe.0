Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B30C54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 11:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CC810E3A6;
	Mon, 20 Nov 2023 11:53:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEC7610E3A8;
 Mon, 20 Nov 2023 11:53:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DAC67A0093;
 Mon, 20 Nov 2023 11:53:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8973588822232914323=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 20 Nov 2023 11:53:54 -0000
Message-ID: <170048123486.29474.8306683267598757807@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231117035321.40102-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231117035321.40102-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fixup!_dr?=
 =?utf-8?q?m/xe/uapi=3A_Remove_MMIO_ioctl?=
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

--===============8973588822232914323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixup! drm/xe/uapi: Remove MMIO ioctl
URL   : https://patchwork.freedesktop.org/series/126568/
State : success

== Summary ==

CI Bug Log - changes from xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23_BAT -> xe-pw-126568v1_BAT
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

  Here are the changes found in xe-pw-126568v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          [SKIP][3] ([Intel XE#626]) -> [SKIP][4] ([Intel XE#541]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#626]) -> [SKIP][6] ([Intel XE#541]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][8] ([Intel XE#282] / [i915#2017])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/626
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7594 -> IGT_7595
  * Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -> xe-pw-126568v1

  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23
  xe-pw-126568v1: 126568v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/index.html

--===============8973588822232914323==
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
<tr><td><b>Series:</b></td><td>fixup! drm/xe/uapi: Remove MMIO ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126568/">https://patchwork.freedesktop.org/series/126568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23_BAT -&gt; xe-pw-126568v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126568v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-leak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/626">Intel XE#626</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/626">Intel XE#626</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126568v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7594 -&gt; IGT_7595</li>
<li>Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -&gt; xe-pw-126568v1</li>
</ul>
<p>IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23<br />
  xe-pw-126568v1: 126568v1</p>

</body>
</html>

--===============8973588822232914323==--
