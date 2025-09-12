Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8670CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 19:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC6810E1DE;
	Fri, 12 Sep 2025 19:23:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBD610E1DE;
 Fri, 12 Sep 2025 19:23:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4007420147236554061=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/2=5D_drm/xe=3A_Fix_error_handling_if_PXP_fails_to_start_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 19:23:55 -0000
Message-ID: <175770503588.331444.16006347903124961456@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909221240.3711023-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250909221240.3711023-3-daniele.ceraolospurio@intel.com>
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

--===============4007420147236554061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/2] drm/xe: Fix error handling if PXP fails to start (rev3)
URL   : https://patchwork.freedesktop.org/series/154291/
State : success

== Summary ==

CI Bug Log - changes from xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2_BAT -> xe-pw-154291v3_BAT
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

  Here are the changes found in xe-pw-154291v3_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2 -> xe-pw-154291v3

  IGT_8539: 8539
  xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2: 6cb617616dbbd591f1f34fb95d55dd66cf43f2b2
  xe-pw-154291v3: 154291v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154291v3/index.html

--===============4007420147236554061==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/2] drm/xe: Fix error handling if PXP fails to start (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154291/">https://patchwork.freedesktop.org/series/154291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154291v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154291v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2_BAT -&gt; xe-pw-154291v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154291v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2 -&gt; xe-pw-154291v3</li>
</ul>
<p>IGT_8539: 8539<br />
  xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2: 6cb617616dbbd591f1f34fb95d55dd66cf43f2b2<br />
  xe-pw-154291v3: 154291v3</p>

</body>
</html>

--===============4007420147236554061==--
