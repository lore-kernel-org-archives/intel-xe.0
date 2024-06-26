Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F7C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 17:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76D10E082;
	Wed, 26 Jun 2024 17:39:44 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2211310E082;
 Wed, 26 Jun 2024 17:39:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8461519504206403181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Remove_xe=5Fhwmo?=
 =?utf-8?q?n=5Fprocess=5Freg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 17:39:43 -0000
Message-ID: <171942358313.161868.11451033782672757316@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626170746.2926011-1-karthik.poosa@intel.com>
In-Reply-To: <20240626170746.2926011-1-karthik.poosa@intel.com>
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

--===============8461519504206403181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Remove xe_hwmon_process_reg
URL   : https://patchwork.freedesktop.org/series/135440/
State : success

== Summary ==

CI Bug Log - changes from xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85_BAT -> xe-pw-135440v1_BAT
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

  Here are the changes found in xe-pw-135440v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135440v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * Linux: xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85 -> xe-pw-135440v1

  IGT_7903: 5993e109620867e80f6f4f0428db26260ae5d16d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85: 030da316e4baf1a7c55bba54fdec3aa7f8427f85
  xe-pw-135440v1: 135440v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135440v1/index.html

--===============8461519504206403181==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Remove xe_hwmon_process_reg</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135440/">https://patchwork.freedesktop.org/series/135440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135440v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135440v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85_BAT -&gt; xe-pw-135440v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135440v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135440v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85 -&gt; xe-pw-135440v1</li>
</ul>
<p>IGT_7903: 5993e109620867e80f6f4f0428db26260ae5d16d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1533-030da316e4baf1a7c55bba54fdec3aa7f8427f85: 030da316e4baf1a7c55bba54fdec3aa7f8427f85<br />
  xe-pw-135440v1: 135440v1</p>

</body>
</html>

--===============8461519504206403181==--
