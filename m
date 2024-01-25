Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC060C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 07:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE1610F82F;
	Thu, 25 Jan 2024 07:20:41 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A60110F82F;
 Thu, 25 Jan 2024 07:20:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5401998413318866254=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_memleak_in?=
 =?utf-8?q?_display_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "wangxiaoming321" <xiaoming.wang@intel.com>
Date: Thu, 25 Jan 2024 07:20:41 -0000
Message-ID: <170616724103.710554.7977295420689011917@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <y>
In-Reply-To: <y>
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

--===============5401998413318866254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix memleak in display initialization
URL   : https://patchwork.freedesktop.org/series/129150/
State : success

== Summary ==

CI Bug Log - changes from xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413_BAT -> xe-pw-129150v1_BAT
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

  Here are the changes found in xe-pw-129150v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#545])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html

  
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545


Build changes
-------------

  * Linux: xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413 -> xe-pw-129150v1

  IGT_7691: 7691
  xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413: e7da820591c355e591fe880ff1e02b85a3f1a413
  xe-pw-129150v1: 129150v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v1/index.html

--===============5401998413318866254==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix memleak in display initialization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129150/">https://patchwork.freedesktop.org/series/129150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413_BAT -&gt; xe-pw-129150v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129150v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413 -&gt; xe-pw-129150v1</li>
</ul>
<p>IGT_7691: 7691<br />
  xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413: e7da820591c355e591fe880ff1e02b85a3f1a413<br />
  xe-pw-129150v1: 129150v1</p>

</body>
</html>

--===============5401998413318866254==--
