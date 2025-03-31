Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62ADC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7210E425;
	Mon, 31 Mar 2025 15:37:31 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAB110E425;
 Mon, 31 Mar 2025 15:37:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6774242015966682180=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_DGFX_PCIe_Gen5_update_telem?=
 =?utf-8?q?etry_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Mar 2025 15:37:30 -0000
Message-ID: <174343545020.19859.4794150563666898892@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250331142336.640226-1-raag.jadav@intel.com>
In-Reply-To: <20250331142336.640226-1-raag.jadav@intel.com>
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

--===============6774242015966682180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DGFX PCIe Gen5 update telemetry and usage
URL   : https://patchwork.freedesktop.org/series/147023/
State : success

== Summary ==

CI Bug Log - changes from xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53_BAT -> xe-pw-147023v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-147023v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147023v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53 -> xe-pw-147023v1

  IGT_8293: 645ffeb9647c6ec1f83725c8293e32fb3706875f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53: 75ad99f966a562133ef212fd4c5220864a8a3c53
  xe-pw-147023v1: 147023v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147023v1/index.html

--===============6774242015966682180==
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
<tr><td><b>Series:</b></td><td>DGFX PCIe Gen5 update telemetry and usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147023/">https://patchwork.freedesktop.org/series/147023/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147023v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147023v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53_BAT -&gt; xe-pw-147023v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147023v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147023v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53 -&gt; xe-pw-147023v1</li>
</ul>
<p>IGT_8293: 645ffeb9647c6ec1f83725c8293e32fb3706875f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2882-75ad99f966a562133ef212fd4c5220864a8a3c53: 75ad99f966a562133ef212fd4c5220864a8a3c53<br />
  xe-pw-147023v1: 147023v1</p>

</body>
</html>

--===============6774242015966682180==--
