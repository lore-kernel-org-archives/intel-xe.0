Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E6C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 19:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6D310E2B9;
	Wed,  5 Mar 2025 19:33:31 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032710E2B3;
 Wed,  5 Mar 2025 19:33:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7675972707522879936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_fbdev?=
 =?utf-8?q?_GGTT_mapping_handling=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 19:33:30 -0000
Message-ID: <174120321071.44240.10633600094539803204@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250305110106.564366-1-dev@lankhorst.se>
In-Reply-To: <20250305110106.564366-1-dev@lankhorst.se>
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

--===============7675972707522879936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix fbdev GGTT mapping handling. (rev7)
URL   : https://patchwork.freedesktop.org/series/144602/
State : success

== Summary ==

CI Bug Log - changes from xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793_BAT -> xe-pw-144602v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144602v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v7/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793 -> xe-pw-144602v7

  IGT_8261: 8261
  xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793: e97a9e18020884dc112584ad5316f6e7f144c793
  xe-pw-144602v7: 144602v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v7/index.html

--===============7675972707522879936==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix fbdev GGTT mapping handling. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144602/">https://patchwork.freedesktop.org/series/144602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793_BAT -&gt; xe-pw-144602v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144602v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v7/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793 -&gt; xe-pw-144602v7</li>
</ul>
<p>IGT_8261: 8261<br />
  xe-2760-e97a9e18020884dc112584ad5316f6e7f144c793: e97a9e18020884dc112584ad5316f6e7f144c793<br />
  xe-pw-144602v7: 144602v7</p>

</body>
</html>

--===============7675972707522879936==--
