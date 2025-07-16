Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C60CC83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 19:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC58310E3BC;
	Wed, 16 Jul 2025 19:27:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF8610E3B9;
 Wed, 16 Jul 2025 19:27:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6978843007860417370=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/sched=3A_Consolidate_dr?=
 =?utf-8?q?m=5Fsched=5Fjob=5Ftimedout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 19:27:51 -0000
Message-ID: <175269407130.167933.9573844926915327097@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716144832.62494-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250716144832.62494-1-tvrtko.ursulin@igalia.com>
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

--===============6978843007860417370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/sched: Consolidate drm_sched_job_timedout
URL   : https://patchwork.freedesktop.org/series/151714/
State : success

== Summary ==

CI Bug Log - changes from xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776_BAT -> xe-pw-151714v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151714v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * Linux: xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776 -> xe-pw-151714v1

  IGT_8462: f33a311145a889757f45313d2ff4bf58f7ef01d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776
  xe-pw-151714v1: 151714v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/index.html

--===============6978843007860417370==
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
<tr><td><b>Series:</b></td><td>drm/sched: Consolidate drm_sched_job_timedout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151714/">https://patchwork.freedesktop.org/series/151714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776_BAT -&gt; xe-pw-151714v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151714v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151714v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776 -&gt; xe-pw-151714v1</li>
</ul>
<p>IGT_8462: f33a311145a889757f45313d2ff4bf58f7ef01d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776<br />
  xe-pw-151714v1: 151714v1</p>

</body>
</html>

--===============6978843007860417370==--
