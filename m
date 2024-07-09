Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACE8C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A9B10E60B;
	Tue,  9 Jul 2024 16:48:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25DC10E60B;
 Tue,  9 Jul 2024 16:48:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6768106777034124363=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Add_Wa=5F150154044?=
 =?utf-8?q?25_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 16:48:43 -0000
Message-ID: <172054372384.86477.13424768713848405037@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709155606.2998941-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240709155606.2998941-1-tejas.upadhyay@intel.com>
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

--===============6768106777034124363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add Wa_15015404425 (rev5)
URL   : https://patchwork.freedesktop.org/series/135679/
State : success

== Summary ==

CI Bug Log - changes from xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e_BAT -> xe-pw-135679v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135679v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#2196])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - {bat-lnl-1}:        [FAIL][3] ([Intel XE#886]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e -> xe-pw-135679v5

  IGT_7920: 7920
  xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e: 1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e
  xe-pw-135679v5: 135679v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/index.html

--===============6768106777034124363==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add Wa_15015404425 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135679/">https://patchwork.freedesktop.org/series/135679/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e_BAT -&gt; xe-pw-135679v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135679v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e -&gt; xe-pw-135679v5</li>
</ul>
<p>IGT_7920: 7920<br />
  xe-1580-1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e: 1a722a0c1dc0cfd23d8f0def8d1b4c7c6825761e<br />
  xe-pw-135679v5: 135679v5</p>

</body>
</html>

--===============6768106777034124363==--
