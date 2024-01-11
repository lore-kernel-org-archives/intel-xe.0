Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E778CC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 04:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCBB10E070;
	Thu, 11 Jan 2024 04:03:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9810E070;
 Thu, 11 Jan 2024 04:03:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4420199525790630860=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_bounds_checking_in?=
 =?utf-8?q?_=5F=5Fxe=5Fbo=5Fplacement=5Ffor=5Fflags=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Thu, 11 Jan 2024 04:03:58 -0000
Message-ID: <170494583851.270358.13250327919716423362@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111002111.10190-1-brian.welty@intel.com>
In-Reply-To: <20240111002111.10190-1-brian.welty@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4420199525790630860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
URL   : https://patchwork.freedesktop.org/series/128463/
State : success

== Summary ==

CI Bug Log - changes from xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc_BAT -> xe-pw-128463v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-128463v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#1033]) -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc -> xe-pw-128463v1

  IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc: df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc
  xe-pw-128463v1: 128463v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/index.html

--===============4420199525790630860==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128463/">https://patchwork.freedesktop.org/series/128463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc_BAT -&gt; xe-pw-128463v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128463v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128463v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc -&gt; xe-pw-128463v1</li>
</ul>
<p>IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-616-df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc: df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc<br />
  xe-pw-128463v1: 128463v1</p>

</body>
</html>

--===============4420199525790630860==--
