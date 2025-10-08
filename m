Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5101CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 10:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DD610E7B7;
	Wed,  8 Oct 2025 10:25:12 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AFC10E1E6;
 Wed,  8 Oct 2025 10:25:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9202997622853706804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Fix_panel_re?=
 =?utf-8?q?play_in_DSC_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 10:25:11 -0000
Message-ID: <175991911114.17294.12064636096908154813@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008094108.88242-1-imre.deak@intel.com>
In-Reply-To: <20251008094108.88242-1-imre.deak@intel.com>
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

--===============9202997622853706804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix panel replay in DSC mode
URL   : https://patchwork.freedesktop.org/series/155586/
State : success

== Summary ==

CI Bug Log - changes from xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_BAT -> xe-pw-155586v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8575 -> IGT_8577
  * Linux: xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44 -> xe-pw-155586v1

  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8577: 8577
  xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44: ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44
  xe-pw-155586v1: 155586v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155586v1/index.html

--===============9202997622853706804==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix panel replay in DSC mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155586/">https://patchwork.freedesktop.org/series/155586/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155586v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155586v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_BAT -&gt; xe-pw-155586v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8575 -&gt; IGT_8577</li>
<li>Linux: xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44 -&gt; xe-pw-155586v1</li>
</ul>
<p>IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8577: 8577<br />
  xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44: ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44<br />
  xe-pw-155586v1: 155586v1</p>

</body>
</html>

--===============9202997622853706804==--
