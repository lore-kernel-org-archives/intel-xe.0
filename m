Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E9EEB566
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 19:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2C010E944;
	Fri,  8 Sep 2023 19:52:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F6A810E942;
 Fri,  8 Sep 2023 19:52:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8CC2BA66C9;
 Fri,  8 Sep 2023 19:52:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8471113675017830674=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Fri, 08 Sep 2023 19:52:46 -0000
Message-ID: <169420276656.14896.8044156734521786611@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908184928.65815-1-gustavo.sousa@intel.com>
In-Reply-To: <20230908184928.65815-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Remove_re?=
 =?utf-8?q?dundant_call_to_intel=5Finit=5Fdisplay=5Fhooks=28=29?=
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

--===============8471113675017830674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove redundant call to intel_init_display_hooks()
URL   : https://patchwork.freedesktop.org/series/123456/
State : success

== Summary ==

CI Bug Log - changes from xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459_BAT -> xe-pw-123456v1_BAT
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

  Here are the changes found in xe-pw-123456v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [FAIL][2] ([i915#2346]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][4] ([Intel XE#480]) -> [PASS][5] +2 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7476 -> IGT_7477
  * Linux: xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459 -> xe-pw-123456v1

  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7477: 7477
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459
  xe-pw-123456v1: 123456v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/index.html

--===============8471113675017830674==
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
<tr><td><b>Series:</b></td><td>Remove redundant call to intel_init_display_hooks()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123456/">https://patchwork.freedesktop.org/series/123456/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459_BAT -&gt; xe-pw-123456v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123456v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7476 -&gt; IGT_7477</li>
<li>Linux: xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459 -&gt; xe-pw-123456v1</li>
</ul>
<p>IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7477: 7477<br />
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459<br />
  xe-pw-123456v1: 123456v1</p>

</body>
</html>

--===============8471113675017830674==--
