Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253ADD41D7A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 17:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485C10E84E;
	Thu, 11 Dec 2025 17:58:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167B210E840;
 Thu, 11 Dec 2025 17:58:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6138098350294050235=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_All_fix?=
 =?utf-8?q?es_for_PREEMPT-RT_that_I_have_collected_so_far=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 17:58:35 -0000
Message-ID: <176547591508.78424.11117564644811711255@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211161923.843758-11-dev@lankhorst.se>
In-Reply-To: <20251211161923.843758-11-dev@lankhorst.se>
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

--===============6138098350294050235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All fixes for PREEMPT-RT that I have collected so far.
URL   : https://patchwork.freedesktop.org/series/158813/
State : success

== Summary ==

CI Bug Log - changes from xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b_BAT -> xe-pw-158813v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158813v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158813v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * Linux: xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b -> xe-pw-158813v1

  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b: 8b41066aadf63fb42a4f04a30d2db80c171c4e4b
  xe-pw-158813v1: 158813v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158813v1/index.html

--===============6138098350294050235==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All fixes for PREEMPT-RT that I have collected so far.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158813/">https://patchwork.freedesktop.org/series/158813/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158813v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158813v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b_BAT -&gt; xe-pw-158813v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158813v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158813v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b -&gt; xe-pw-158813v1</li>
</ul>
<p>IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4224-8b41066aadf63fb42a4f04a30d2db80c171c4e4b: 8b41066aadf63fb42a4f04a30d2db80c171c4e4b<br />
  xe-pw-158813v1: 158813v1</p>

</body>
</html>

--===============6138098350294050235==--
