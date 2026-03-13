Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EF8105F784
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 09:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A4710E036;
	Fri, 13 Mar 2026 09:00:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620A410E036;
 Fri, 13 Mar 2026 09:00:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4775479219011860067=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/i2c=3A_Assert/Deasse?=
 =?utf-8?q?rt_I2C_IRQ?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Mar 2026 09:00:12 -0000
Message-ID: <177339241237.354486.12051796114174495218@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313080438.4166251-1-raag.jadav@intel.com>
In-Reply-To: <20260313080438.4166251-1-raag.jadav@intel.com>
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

--===============4775479219011860067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/i2c: Assert/Deassert I2C IRQ
URL   : https://patchwork.freedesktop.org/series/163162/
State : success

== Summary ==

CI Bug Log - changes from xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f_BAT -> xe-pw-163162v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163162v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8799 -> IGT_8800
  * Linux: xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f -> xe-pw-163162v1

  IGT_8799: 8799
  IGT_8800: 8800
  xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f: 721db23a9c232926f1e4f896d9226b9710cf658f
  xe-pw-163162v1: 163162v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/index.html

--===============4775479219011860067==
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
<tr><td><b>Series:</b></td><td>drm/xe/i2c: Assert/Deassert I2C IRQ</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163162/">https://patchwork.freedesktop.org/series/163162/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f_BAT -&gt; xe-pw-163162v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163162v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8799 -&gt; IGT_8800</li>
<li>Linux: xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f -&gt; xe-pw-163162v1</li>
</ul>
<p>IGT_8799: 8799<br />
  IGT_8800: 8800<br />
  xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f: 721db23a9c232926f1e4f896d9226b9710cf658f<br />
  xe-pw-163162v1: 163162v1</p>

</body>
</html>

--===============4775479219011860067==--
