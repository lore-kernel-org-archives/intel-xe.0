Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F13CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424310E33C;
	Mon,  6 Oct 2025 10:56:24 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3560410E307;
 Mon,  6 Oct 2025 10:56:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4661210514336089447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv8?=
 =?utf-8?q?=2C1/3=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tre?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 10:56:23 -0000
Message-ID: <175974818320.7926.4783246714859088149@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============4661210514336089447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v8,1/3] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/155444/
State : success

== Summary ==

CI Bug Log - changes from xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791_BAT -> xe-pw-155444v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155444v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_module_load@load:
    - {bat-ptl-vm}:       [ABORT][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791/bat-ptl-vm/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155444v1/bat-ptl-vm/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780


Build changes
-------------

  * Linux: xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791 -> xe-pw-155444v1

  IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791: 8ad3832e11cc44823fc35aa6d36f7e76d69e4791
  xe-pw-155444v1: 155444v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155444v1/index.html

--===============4661210514336089447==
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
<tr><td><b>Series:</b></td><td>series starting with [v8,1/3] drm/buddy: Optimize free block management with RB tree</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155444/">https://patchwork.freedesktop.org/series/155444/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155444v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155444v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791_BAT -&gt; xe-pw-155444v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155444v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155444v1/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791 -&gt; xe-pw-155444v1</li>
</ul>
<p>IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3868-8ad3832e11cc44823fc35aa6d36f7e76d69e4791: 8ad3832e11cc44823fc35aa6d36f7e76d69e4791<br />
  xe-pw-155444v1: 155444v1</p>

</body>
</html>

--===============4661210514336089447==--
