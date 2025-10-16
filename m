Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA12CCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 15:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BB410EA09;
	Thu, 16 Oct 2025 15:07:35 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86610EA03;
 Thu, 16 Oct 2025 15:07:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5165825059412859284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Always_expose_?=
 =?utf-8?q?VRAM_provisioning_data_on_discrete_GPUs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 15:07:34 -0000
Message-ID: <176062725457.22488.13131482589856211034@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016122233.3789-1-lukasz.laguna@intel.com>
In-Reply-To: <20251016122233.3789-1-lukasz.laguna@intel.com>
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

--===============5165825059412859284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Always expose VRAM provisioning data on discrete GPUs (rev2)
URL   : https://patchwork.freedesktop.org/series/155608/
State : success

== Summary ==

CI Bug Log - changes from xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070_BAT -> xe-pw-155608v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 11)
------------------------------

  Additional (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-155608v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          NOTRUN -> [ABORT][1] ([Intel XE#6359])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155608v2/bat-pvc-2/igt@xe_module_load@load.html

  
  [Intel XE#6359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6359


Build changes
-------------

  * Linux: xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070 -> xe-pw-155608v2

  IGT_8588: 8588
  xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070: c381038b8c345fb0313a67c6eef0a596e5e91070
  xe-pw-155608v2: 155608v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155608v2/index.html

--===============5165825059412859284==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Always expose VRAM provisioning data on discrete GPUs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155608/">https://patchwork.freedesktop.org/series/155608/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155608v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155608v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070_BAT -&gt; xe-pw-155608v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155608v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155608v2/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6359">Intel XE#6359</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070 -&gt; xe-pw-155608v2</li>
</ul>
<p>IGT_8588: 8588<br />
  xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070: c381038b8c345fb0313a67c6eef0a596e5e91070<br />
  xe-pw-155608v2: 155608v2</p>

</body>
</html>

--===============5165825059412859284==--
