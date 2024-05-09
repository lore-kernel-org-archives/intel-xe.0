Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E4C25B77
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 20:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F0C10F369;
	Thu,  9 May 2024 20:26:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0C410F369;
 Thu,  9 May 2024 20:26:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2173595871878603636=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/7=5D_d?=
 =?utf-8?q?rm/xe=3A_Fix_xe=5Fpm=5Fruntime=5Fget=5Fif=5Factive_return?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 20:26:53 -0000
Message-ID: <171528641311.2039230.646493321402346911@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
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

--===============2173595871878603636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
URL   : https://patchwork.freedesktop.org/series/133404/
State : success

== Summary ==

CI Bug Log - changes from xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027_BAT -> xe-pw-133404v1_BAT
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

  Here are the changes found in xe-pw-133404v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * Linux: xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027 -> xe-pw-133404v1

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027: 2756f0412a64d4a3bedfb79b868fbd8c313ed027
  xe-pw-133404v1: 133404v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/index.html

--===============2173595871878603636==
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
<tr><td><b>Series:</b></td><td>series starting with [1/7] drm/xe: Fix xe_pm_runtime_get_if_active return</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133404/">https://patchwork.freedesktop.org/series/133404/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027_BAT -&gt; xe-pw-133404v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133404v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027 -&gt; xe-pw-133404v1</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027: 2756f0412a64d4a3bedfb79b868fbd8c313ed027<br />
  xe-pw-133404v1: 133404v1</p>

</body>
</html>

--===============2173595871878603636==--
