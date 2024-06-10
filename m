Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265A5C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD38B10E48E;
	Mon, 10 Jun 2024 16:33:59 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24D310E48E;
 Mon, 10 Jun 2024 16:33:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6223114060311190093=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI=2C1/3?=
 =?utf-8?q?=5D_drm/xe=3A_poor_man=27s_exhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 16:33:57 -0000
Message-ID: <171803723798.32193.2411734527581251055@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
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

--===============6223114060311190093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/xe: poor man's exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/134682/
State : success

== Summary ==

CI Bug Log - changes from xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1_BAT -> xe-pw-134682v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-134682v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1 -> xe-pw-134682v1

  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1: cb76029295c9fea629db76e9bb4106c0179d99c1
  xe-pw-134682v1: 134682v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134682v1/index.html

--===============6223114060311190093==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/xe: poor man&#x27;s exhaustive eviction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134682/">https://patchwork.freedesktop.org/series/134682/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134682v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134682v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1_BAT -&gt; xe-pw-134682v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134682v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1 -&gt; xe-pw-134682v1</li>
</ul>
<p>IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1433-cb76029295c9fea629db76e9bb4106c0179d99c1: cb76029295c9fea629db76e9bb4106c0179d99c1<br />
  xe-pw-134682v1: 134682v1</p>

</body>
</html>

--===============6223114060311190093==--
