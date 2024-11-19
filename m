Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDF5D4414C
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 11:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8AC10E24D;
	Tue, 19 Nov 2024 11:58:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191A10E24D;
 Tue, 19 Nov 2024 11:58:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3916663853611623498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Display_Global_Histogram_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 11:58:36 -0000
Message-ID: <173201751668.301060.17869052573751664054@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
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

--===============3916663853611623498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Display Global Histogram (rev3)
URL   : https://patchwork.freedesktop.org/series/138867/
State : success

== Summary ==

CI Bug Log - changes from xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192_BAT -> xe-pw-138867v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-138867v3_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-lnl-2:          [INCOMPLETE][1] ([Intel XE#3466]) -> [DMESG-FAIL][2] ([Intel XE#3466])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html

  
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466


Build changes
-------------

  * Linux: xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192 -> xe-pw-138867v3

  IGT_8116: 10a7dcaa598461073d6c7268704f32043af8722f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192: ae16c37991aa8ab2afc0309ff88d9ccada395192
  xe-pw-138867v3: 138867v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html

--===============3916663853611623498==
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
<tr><td><b>Series:</b></td><td>Display Global Histogram (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138867/">https://patchwork.freedesktop.org/series/138867/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192_BAT -&gt; xe-pw-138867v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138867v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@many-basic:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192 -&gt; xe-pw-138867v3</li>
</ul>
<p>IGT_8116: 10a7dcaa598461073d6c7268704f32043af8722f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192: ae16c37991aa8ab2afc0309ff88d9ccada395192<br />
  xe-pw-138867v3: 138867v3</p>

</body>
</html>

--===============3916663853611623498==--
