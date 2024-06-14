Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C0FC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 04:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC310EC1D;
	Fri, 14 Jun 2024 04:23:54 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658410EC1B;
 Fri, 14 Jun 2024 04:23:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1101861607317299021=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Update_calcu?=
 =?utf-8?q?lation_to_avoid_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 04:23:53 -0000
Message-ID: <171833903334.77189.18040105542923360694@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614034046.375797-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240614034046.375797-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============1101861607317299021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Update calculation to avoid overflow
URL   : https://patchwork.freedesktop.org/series/134859/
State : success

== Summary ==

CI Bug Log - changes from xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23_BAT -> xe-pw-134859v1_BAT
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

  Here are the changes found in xe-pw-134859v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#324]) -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134859v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23 -> xe-pw-134859v1

  IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23: 802ed9a43fb0e8546d366e703768d3271267ce23
  xe-pw-134859v1: 134859v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134859v1/index.html

--===============1101861607317299021==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Update calculation to avoid overflow</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134859/">https://patchwork.freedesktop.org/series/134859/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134859v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134859v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23_BAT -&gt; xe-pw-134859v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134859v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134859v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23 -&gt; xe-pw-134859v1</li>
</ul>
<p>IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1461-802ed9a43fb0e8546d366e703768d3271267ce23: 802ed9a43fb0e8546d366e703768d3271267ce23<br />
  xe-pw-134859v1: 134859v1</p>

</body>
</html>

--===============1101861607317299021==--
