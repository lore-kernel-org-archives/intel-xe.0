Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19083C3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C8410E14A;
	Tue,  6 May 2025 07:57:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5F10E14A;
 Tue,  6 May 2025 07:57:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3935364025686686816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_page_fault_qu?=
 =?utf-8?q?eue_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:57:10 -0000
Message-ID: <174651823077.50314.6674301104180747362@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250501183220.72097-1-stuart.summers@intel.com>
In-Reply-To: <20250501183220.72097-1-stuart.summers@intel.com>
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

--===============3935364025686686816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix page fault queue calculation
URL   : https://patchwork.freedesktop.org/series/148523/
State : success

== Summary ==

CI Bug Log - changes from xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408_BAT -> xe-pw-148523v1_BAT
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

  Here are the changes found in xe-pw-148523v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4508]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148523v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#4508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508


Build changes
-------------

  * Linux: xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408 -> xe-pw-148523v1

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408: 1fcdd40b106599f78a176ba2aca41b76d79f1408
  xe-pw-148523v1: 148523v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148523v1/index.html

--===============3935364025686686816==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix page fault queue calculation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148523/">https://patchwork.freedesktop.org/series/148523/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148523v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148523v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408_BAT -&gt; xe-pw-148523v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148523v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148523v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508">Intel XE#4508</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408 -&gt; xe-pw-148523v1</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3019-1fcdd40b106599f78a176ba2aca41b76d79f1408: 1fcdd40b106599f78a176ba2aca41b76d79f1408<br />
  xe-pw-148523v1: 148523v1</p>

</body>
</html>

--===============3935364025686686816==--
