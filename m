Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3EDC2D0D1
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 15:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E255A10E089;
	Mon, 24 Jun 2024 15:32:25 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113FD10E089;
 Mon, 24 Jun 2024 15:32:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8868004773196156123=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv3=2C1/2?=
 =?utf-8?q?=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-on-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 15:32:25 -0000
Message-ID: <171924314506.153041.14688610863329140554@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624141456.23195-1-nirmoy.das@intel.com>
In-Reply-To: <20240624141456.23195-1-nirmoy.das@intel.com>
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

--===============8868004773196156123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/135303/
State : success

== Summary ==

CI Bug Log - changes from xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398_BAT -> xe-pw-135303v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135303v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - {bat-lnl-1}:        [PASS][1] -> [FAIL][2] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135303v1/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7896 -> IGT_7897
  * Linux: xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 -> xe-pw-135303v1

  IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7897: 9119f9c5dbbb969438b3424dc2f3b30f3b442aab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398: c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398
  xe-pw-135303v1: 135303v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135303v1/index.html

--===============8868004773196156123==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] drm/ttm: Add a flag to allow drivers to skip clear-on-free</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135303/">https://patchwork.freedesktop.org/series/135303/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135303v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135303v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398_BAT -&gt; xe-pw-135303v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135303v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135303v1/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7896 -&gt; IGT_7897</li>
<li>Linux: xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 -&gt; xe-pw-135303v1</li>
</ul>
<p>IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7897: 9119f9c5dbbb969438b3424dc2f3b30f3b442aab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398: c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398<br />
  xe-pw-135303v1: 135303v1</p>

</body>
</html>

--===============8868004773196156123==--
