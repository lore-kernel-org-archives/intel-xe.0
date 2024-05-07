Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30796C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 14:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC83210FC4E;
	Tue,  7 May 2024 14:17:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BDD10FC4E;
 Tue,  7 May 2024 14:17:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1557799041859878333=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_UBSAN_shift-out-of?=
 =?utf-8?q?-bounds_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 14:17:02 -0000
Message-ID: <171509142229.1961497.685014430141133495@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
In-Reply-To: <20240507080456.613786-1-shuicheng.lin@intel.com>
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

--===============1557799041859878333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix UBSAN shift-out-of-bounds failure (rev2)
URL   : https://patchwork.freedesktop.org/series/133270/
State : success

== Summary ==

CI Bug Log - changes from xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68_BAT -> xe-pw-133270v2_BAT
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

  Here are the changes found in xe-pw-133270v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_module_load@load:
    - {bat-lnl-1}:        [INCOMPLETE][1] ([Intel XE#1772]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68/bat-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133270v2/bat-lnl-1/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1772


Build changes
-------------

  * Linux: xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68 -> xe-pw-133270v2

  IGT_7837: 1a77ac56d4538a5a2b9cecd59beab187248f35ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68: fa69951f5fdfe502ff0bb82480742db8400aec68
  xe-pw-133270v2: 133270v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133270v2/index.html

--===============1557799041859878333==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix UBSAN shift-out-of-bounds failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133270/">https://patchwork.freedesktop.org/series/133270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133270v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133270v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68_BAT -&gt; xe-pw-133270v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133270v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68/bat-lnl-1/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1772">Intel XE#1772</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133270v2/bat-lnl-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68 -&gt; xe-pw-133270v2</li>
</ul>
<p>IGT_7837: 1a77ac56d4538a5a2b9cecd59beab187248f35ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1246-fa69951f5fdfe502ff0bb82480742db8400aec68: fa69951f5fdfe502ff0bb82480742db8400aec68<br />
  xe-pw-133270v2: 133270v2</p>

</body>
</html>

--===============1557799041859878333==--
