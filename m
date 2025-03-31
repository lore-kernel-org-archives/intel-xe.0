Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D20C36014
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 22:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436710E4A5;
	Mon, 31 Mar 2025 22:01:07 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF34110E4A5;
 Mon, 31 Mar 2025 22:01:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4011245991043840701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pmu=3A_Add_GT_freque?=
 =?utf-8?q?ncy_events_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Mar 2025 22:01:05 -0000
Message-ID: <174345846597.21412.10643367772969411549@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250331204827.2535393-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250331204827.2535393-1-vinay.belgaumkar@intel.com>
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

--===============4011245991043840701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: Add GT frequency events (rev8)
URL   : https://patchwork.freedesktop.org/series/144164/
State : success

== Summary ==

CI Bug Log - changes from xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201_BAT -> xe-pw-144164v8_BAT
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

  Here are the changes found in xe-pw-144164v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v8/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-pw-144164v8

  IGT_8294: 22adde749f1804e540e66f86fee12117543a2d0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-pw-144164v8: 144164v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v8/index.html

--===============4011245991043840701==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: Add GT frequency events (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144164/">https://patchwork.freedesktop.org/series/144164/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201_BAT -&gt; xe-pw-144164v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144164v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v8/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-pw-144164v8</li>
</ul>
<p>IGT_8294: 22adde749f1804e540e66f86fee12117543a2d0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2886-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201<br />
  xe-pw-144164v8: 144164v8</p>

</body>
</html>

--===============4011245991043840701==--
