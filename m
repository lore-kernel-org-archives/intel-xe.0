Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A13AC9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 15:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE02E88E45;
	Fri, 25 Sep 2026 15:19:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85388E45;
 Fri, 25 Sep 2026 15:19:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5394678792590673297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Add_Syste?=
 =?utf-8?q?m_Controller_debugfs_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 15:19:20 -0000
Message-ID: <179034956018.208193.445465659487104579@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
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

--===============5394678792590673297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add System Controller debugfs (rev7)
URL   : https://patchwork.freedesktop.org/series/161655/
State : success

== Summary ==

CI Bug Log - changes from xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a_BAT -> xe-pw-161655v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-161655v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#9103])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a/bat-wcl-1/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v7/bat-wcl-1/igt@xe_waitfence@engine.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * IGT: IGT_9112 -> IGT_9113
  * Linux: xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a -> xe-pw-161655v7

  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a: f44eaea74cc54b667ac438cfda0c7ee39cfa556a
  xe-pw-161655v7: 161655v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v7/index.html

--===============5394678792590673297==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add System Controller debugfs (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161655/">https://patchwork.freedesktop.org/series/161655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a_BAT -&gt; xe-pw-161655v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161655v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v7/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9112 -&gt; IGT_9113</li>
<li>Linux: xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a -&gt; xe-pw-161655v7</li>
</ul>
<p>IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a: f44eaea74cc54b667ac438cfda0c7ee39cfa556a<br />
  xe-pw-161655v7: 161655v7</p>

</body>
</html>

--===============5394678792590673297==--
