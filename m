Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2773C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68F10E0B6;
	Thu, 13 Aug 2026 08:48:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD5810E0B6;
 Thu, 13 Aug 2026 08:48:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0609236865335802832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cmtg=3A_Disable_CM?=
 =?utf-8?q?TG_after_PSR_exit_to_avoid_disable_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 08:48:15 -0000
Message-ID: <178661089504.46872.9475978972326898910@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807055452.2997983-1-animesh.manna@intel.com>
In-Reply-To: <20260807055452.2997983-1-animesh.manna@intel.com>
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

--===============0609236865335802832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cmtg: Disable CMTG after PSR exit to avoid disable timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/171765/
State : success

== Summary ==

CI Bug Log - changes from xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88_BAT -> xe-pw-171765v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88 -> xe-pw-171765v2

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88: 0c91093a48dc449d951b35ecae7d38b8042f7a88
  xe-pw-171765v2: 171765v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171765v2/index.html

--===============0609236865335802832==
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
<tr><td><b>Series:</b></td><td>drm/i915/cmtg: Disable CMTG after PSR exit to avoid disable timeout (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171765/">https://patchwork.freedesktop.org/series/171765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171765v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171765v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88_BAT -&gt; xe-pw-171765v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88 -&gt; xe-pw-171765v2</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5586-0c91093a48dc449d951b35ecae7d38b8042f7a88: 0c91093a48dc449d951b35ecae7d38b8042f7a88<br />
  xe-pw-171765v2: 171765v2</p>

</body>
</html>

--===============0609236865335802832==--
