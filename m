Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D8D6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C89B10E2B2;
	Thu,  2 Apr 2026 22:14:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2119F10E2B2;
 Thu,  2 Apr 2026 22:14:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5044485751603603184=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Suppress_reset_lo?=
 =?utf-8?q?g_for_destroyed_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 22:14:52 -0000
Message-ID: <177516809211.430198.14609803651313009235@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
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

--===============5044485751603603184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Suppress reset log for destroyed queues
URL   : https://patchwork.freedesktop.org/series/164321/
State : success

== Summary ==

CI Bug Log - changes from xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62_BAT -> xe-pw-164321v1_BAT
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

  Here are the changes found in xe-pw-164321v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6520])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62 -> xe-pw-164321v1

  IGT_8846: 8846
  xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62: 76f07a8a9c761686987cba92056f78c1d3cd1c62
  xe-pw-164321v1: 164321v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/index.html

--===============5044485751603603184==
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
<tr><td><b>Series:</b></td><td>drm/xe: Suppress reset log for destroyed queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164321/">https://patchwork.freedesktop.org/series/164321/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62_BAT -&gt; xe-pw-164321v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164321v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164321v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62 -&gt; xe-pw-164321v1</li>
</ul>
<p>IGT_8846: 8846<br />
  xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62: 76f07a8a9c761686987cba92056f78c1d3cd1c62<br />
  xe-pw-164321v1: 164321v1</p>

</body>
</html>

--===============5044485751603603184==--
