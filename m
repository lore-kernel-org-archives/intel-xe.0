Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A65CCD187
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 10:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173C10E209;
	Thu,  9 Oct 2025 10:57:26 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16810E209;
 Thu,  9 Oct 2025 10:57:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7955726976560810747=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_User_readable_error_codes_o?=
 =?utf-8?q?n_atomic=5Fioctl_failure_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Oct 2025 10:57:25 -0000
Message-ID: <176000744511.22793.6961424117481158100@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
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

--===============7955726976560810747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: User readable error codes on atomic_ioctl failure (rev5)
URL   : https://patchwork.freedesktop.org/series/152277/
State : success

== Summary ==

CI Bug Log - changes from xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b_BAT -> xe-pw-152277v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-152277v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b -> xe-pw-152277v5

  IGT_8580: 8580
  xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b: e4621fd776939016f32f5585b188429d68e5ae5b
  xe-pw-152277v5: 152277v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v5/index.html

--===============7955726976560810747==
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
<tr><td><b>Series:</b></td><td>User readable error codes on atomic_ioctl failure (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152277/">https://patchwork.freedesktop.org/series/152277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b_BAT -&gt; xe-pw-152277v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152277v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b -&gt; xe-pw-152277v5</li>
</ul>
<p>IGT_8580: 8580<br />
  xe-3888-e4621fd776939016f32f5585b188429d68e5ae5b: e4621fd776939016f32f5585b188429d68e5ae5b<br />
  xe-pw-152277v5: 152277v5</p>

</body>
</html>

--===============7955726976560810747==--
