Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C46C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 09:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15910E145;
	Wed, 17 Jul 2024 09:22:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD110E145;
 Wed, 17 Jul 2024 09:22:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0101432323974044468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/fbdev=3A_Limit_the_usage_?=
 =?utf-8?q?of_stolen_for_LNL+_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 09:22:26 -0000
Message-ID: <172120814681.254371.9743788145016903218@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717082252.3875909-1-uma.shankar@intel.com>
In-Reply-To: <20240717082252.3875909-1-uma.shankar@intel.com>
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

--===============0101432323974044468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/fbdev: Limit the usage of stolen for LNL+ (rev4)
URL   : https://patchwork.freedesktop.org/series/135970/
State : success

== Summary ==

CI Bug Log - changes from xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0_BAT -> xe-pw-135970v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135970v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#2196])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135970v4/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * Linux: xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0 -> xe-pw-135970v4

  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0: 5ed026e3fb07d65872ef64a5428746a0142e13b0
  xe-pw-135970v4: 135970v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135970v4/index.html

--===============0101432323974044468==
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
<tr><td><b>Series:</b></td><td>drm/xe/fbdev: Limit the usage of stolen for LNL+ (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135970/">https://patchwork.freedesktop.org/series/135970/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135970v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135970v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0_BAT -&gt; xe-pw-135970v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135970v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135970v4/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0 -&gt; xe-pw-135970v4</li>
</ul>
<p>IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1618-5ed026e3fb07d65872ef64a5428746a0142e13b0: 5ed026e3fb07d65872ef64a5428746a0142e13b0<br />
  xe-pw-135970v4: 135970v4</p>

</body>
</html>

--===============0101432323974044468==--
