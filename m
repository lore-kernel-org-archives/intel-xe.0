Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E58C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 13:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9CF10E0C3;
	Tue, 18 Jun 2024 13:35:49 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BF610E0C3;
 Tue, 18 Jun 2024 13:35:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6321893573183808572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv2=2C1/3?=
 =?utf-8?q?=5D_drm/i915=3A_Move_encoder_suspend/shutdown_helpers_to_intel=5F?=
 =?utf-8?q?encoder=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 13:35:47 -0000
Message-ID: <171871774781.103671.18141548144990319853@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618125255.4080303-1-imre.deak@intel.com>
In-Reply-To: <20240618125255.4080303-1-imre.deak@intel.com>
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

--===============6321893573183808572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
URL   : https://patchwork.freedesktop.org/series/135013/
State : success

== Summary ==

CI Bug Log - changes from xe-1490-5a093f17293ae50283f19372263a7595ed50bc34_BAT -> xe-pw-135013v1_BAT
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

  Here are the changes found in xe-pw-135013v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462


Build changes
-------------

  * IGT: IGT_7890 -> IGT_7891
  * Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -> xe-pw-135013v1

  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34
  xe-pw-135013v1: 135013v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135013v1/index.html

--===============6321893573183808572==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135013/">https://patchwork.freedesktop.org/series/135013/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135013v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135013v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1490-5a093f17293ae50283f19372263a7595ed50bc34_BAT -&gt; xe-pw-135013v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135013v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7890 -&gt; IGT_7891</li>
<li>Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -&gt; xe-pw-135013v1</li>
</ul>
<p>IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34<br />
  xe-pw-135013v1: 135013v1</p>

</body>
</html>

--===============6321893573183808572==--
