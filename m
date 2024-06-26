Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E2FC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B37F10E81D;
	Wed, 26 Jun 2024 10:05:34 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6010E81D;
 Wed, 26 Jun 2024 10:05:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3788265947939327252=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/vf=3A_Track_writes_to_ina?=
 =?utf-8?q?ccessible_registers_from_VF_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 10:05:33 -0000
Message-ID: <171939633363.160231.6605152037681040716@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240626084304.1345-1-michal.wajdeczko@intel.com>
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

--===============3788265947939327252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Track writes to inaccessible registers from VF (rev2)
URL   : https://patchwork.freedesktop.org/series/135295/
State : success

== Summary ==

CI Bug Log - changes from xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1_BAT -> xe-pw-135295v2_BAT
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

  Here are the changes found in xe-pw-135295v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-1}:        [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1 -> xe-pw-135295v2

  IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1: eeab54efcc91d572f99ea6ee3d9f562bb79a08d1
  xe-pw-135295v2: 135295v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html

--===============3788265947939327252==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Track writes to inaccessible registers from VF (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135295/">https://patchwork.freedesktop.org/series/135295/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1_BAT -&gt; xe-pw-135295v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135295v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1 -&gt; xe-pw-135295v2</li>
</ul>
<p>IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1: eeab54efcc91d572f99ea6ee3d9f562bb79a08d1<br />
  xe-pw-135295v2: 135295v2</p>

</body>
</html>

--===============3788265947939327252==--
