Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEB7E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 01:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247CB10E637;
	Fri, 13 Dec 2024 01:14:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE810E637;
 Fri, 13 Dec 2024 01:14:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2740942943770234266=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Mark_ComputeCS_re?=
 =?utf-8?q?ad_mode_as_UC_on_iGPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 01:14:52 -0000
Message-ID: <173405249202.1855674.9249414300676795359@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212234606.2877233-1-matthew.brost@intel.com>
In-Reply-To: <20241212234606.2877233-1-matthew.brost@intel.com>
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

--===============2740942943770234266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Mark ComputeCS read mode as UC on iGPU
URL   : https://patchwork.freedesktop.org/series/142512/
State : success

== Summary ==

CI Bug Log - changes from xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e_BAT -> xe-pw-142512v1_BAT
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

  Here are the changes found in xe-pw-142512v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [DMESG-WARN][1] ([Intel XE#3729]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142512v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * Linux: xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e -> xe-pw-142512v1

  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e: ca3a36b62673357c3e8f0734c5009be40504c05e
  xe-pw-142512v1: 142512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142512v1/index.html

--===============2740942943770234266==
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
<tr><td><b>Series:</b></td><td>drm/xe: Mark ComputeCS read mode as UC on iGPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142512/">https://patchwork.freedesktop.org/series/142512/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142512v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142512v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e_BAT -&gt; xe-pw-142512v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142512v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142512v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e -&gt; xe-pw-142512v1</li>
</ul>
<p>IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2366-ca3a36b62673357c3e8f0734c5009be40504c05e: ca3a36b62673357c3e8f0734c5009be40504c05e<br />
  xe-pw-142512v1: 142512v1</p>

</body>
</html>

--===============2740942943770234266==--
