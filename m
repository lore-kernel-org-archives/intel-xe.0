Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C5C27C75
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 19:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27010E8DF;
	Wed, 12 Jun 2024 19:05:37 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E5F10E905;
 Wed, 12 Jun 2024 19:05:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7511325730595749940=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_missing_runtime_ou?=
 =?utf-8?q?ter_protection_for_ggtt=5Fremove=5Fnode_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jun 2024 19:05:29 -0000
Message-ID: <171821912904.70996.4138308362287703825@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240612182038.249360-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240612182038.249360-1-rodrigo.vivi@intel.com>
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

--===============7511325730595749940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev5)
URL   : https://patchwork.freedesktop.org/series/134308/
State : success

== Summary ==

CI Bug Log - changes from xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604_BAT -> xe-pw-134308v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-134308v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - {bat-lnl-1}:        [DMESG-WARN][1] ([Intel XE#1330] / [Intel XE#1622]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v5/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604 -> xe-pw-134308v5

  IGT_7884: 3c02edb64e6feef931f1df9898d129b0a92a39eb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604: ade7ab20e5168dd828b15ed18b2f718b67544604
  xe-pw-134308v5: 134308v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v5/index.html

--===============7511325730595749940==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134308/">https://patchwork.freedesktop.org/series/134308/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604_BAT -&gt; xe-pw-134308v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134308v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel XE#1622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v5/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604 -&gt; xe-pw-134308v5</li>
</ul>
<p>IGT_7884: 3c02edb64e6feef931f1df9898d129b0a92a39eb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1452-ade7ab20e5168dd828b15ed18b2f718b67544604: ade7ab20e5168dd828b15ed18b2f718b67544604<br />
  xe-pw-134308v5: 134308v5</p>

</body>
</html>

--===============7511325730595749940==--
