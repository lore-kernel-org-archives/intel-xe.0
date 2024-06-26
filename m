Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DD5C3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AE10E939;
	Wed, 26 Jun 2024 16:07:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834B410E939;
 Wed, 26 Jun 2024 16:07:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5767762201818883037=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Configure_TLB_time?=
 =?utf-8?q?out_based_on_CT_buffer_size_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 16:07:22 -0000
Message-ID: <171941804253.161617.17613775804510053814@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626150109.10878-1-nirmoy.das@intel.com>
In-Reply-To: <20240626150109.10878-1-nirmoy.das@intel.com>
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

--===============5767762201818883037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Configure TLB timeout based on CT buffer size (rev3)
URL   : https://patchwork.freedesktop.org/series/135341/
State : success

== Summary ==

CI Bug Log - changes from xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65_BAT -> xe-pw-135341v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135341v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - {bat-lnl-1}:        [FAIL][3] ([Intel XE#886]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7902 -> IGT_7903
  * Linux: xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65 -> xe-pw-135341v3

  IGT_7902: c3b86de62fdc1095d52605e1f13a5ce83005cb25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7903: 5993e109620867e80f6f4f0428db26260ae5d16d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65: 426a86fcf373dc03a682c46628cf4f2a9ffeaf65
  xe-pw-135341v3: 135341v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/index.html

--===============5767762201818883037==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Configure TLB timeout based on CT buffer size (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135341/">https://patchwork.freedesktop.org/series/135341/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65_BAT -&gt; xe-pw-135341v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135341v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135341v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7902 -&gt; IGT_7903</li>
<li>Linux: xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65 -&gt; xe-pw-135341v3</li>
</ul>
<p>IGT_7902: c3b86de62fdc1095d52605e1f13a5ce83005cb25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7903: 5993e109620867e80f6f4f0428db26260ae5d16d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1531-426a86fcf373dc03a682c46628cf4f2a9ffeaf65: 426a86fcf373dc03a682c46628cf4f2a9ffeaf65<br />
  xe-pw-135341v3: 135341v3</p>

</body>
</html>

--===============5767762201818883037==--
