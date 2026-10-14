Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C2BCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 01:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9B410E12C;
	Wed, 14 Oct 2026 01:10:45 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026FD10E12C;
 Wed, 14 Oct 2026 01:10:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0881800862288327431=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/gmbus=3A_Add_bit-b?=
 =?utf-8?q?anging_debugfs_control_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Oct 2026 01:10:44 -0000
Message-ID: <179194024498.21468.10651831978432655019@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013190712.2092093-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261013190712.2092093-1-ramanaidu.naladala@intel.com>
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

--===============0881800862288327431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gmbus: Add bit-banging debugfs control (rev3)
URL   : https://patchwork.freedesktop.org/series/174932/
State : success

== Summary ==

CI Bug Log - changes from xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614_BAT -> xe-pw-174932v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614 -> xe-pw-174932v3

  IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614: 3bb5625e4dccd61506ad2815da07ac082e1df614
  xe-pw-174932v3: 174932v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174932v3/index.html

--===============0881800862288327431==
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
<tr><td><b>Series:</b></td><td>drm/i915/gmbus: Add bit-banging debugfs control (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174932/">https://patchwork.freedesktop.org/series/174932/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174932v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174932v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614_BAT -&gt; xe-pw-174932v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614 -&gt; xe-pw-174932v3</li>
</ul>
<p>IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5940-3bb5625e4dccd61506ad2815da07ac082e1df614: 3bb5625e4dccd61506ad2815da07ac082e1df614<br />
  xe-pw-174932v3: 174932v3</p>

</body>
</html>

--===============0881800862288327431==--
