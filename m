Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD2FD874A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 11:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B6F10E615;
	Tue, 17 Mar 2026 11:58:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C288A10E3D7;
 Tue, 17 Mar 2026 11:58:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8344858688590665492=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_don=27t?=
 =?utf-8?q?_access_display_PCH_registers_in_non-display_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 11:58:07 -0000
Message-ID: <177374868778.365547.7917318075763272460@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317104119.1690065-1-luciano.coelho@intel.com>
In-Reply-To: <20260317104119.1690065-1-luciano.coelho@intel.com>
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

--===============8344858688590665492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: don't access display PCH registers in non-display code
URL   : https://patchwork.freedesktop.org/series/163369/
State : failure

== Summary ==

CI Bug Log - changes from xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_BAT -> xe-pw-163369v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163369v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163369v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163369v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/bat-wcl-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163369v1/bat-wcl-1/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * Linux: xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab -> xe-pw-163369v1

  IGT_8806: 8806
  xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab: 9a7eaa045a430ecf1ced87894f3aa54e3ab146ab
  xe-pw-163369v1: 163369v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163369v1/index.html

--===============8344858688590665492==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: don&#x27;t access display PCH registers in non-display code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163369/">https://patchwork.freedesktop.org/series/163369/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163369v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163369v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_BAT -&gt; xe-pw-163369v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163369v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163369v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163369v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163369v1/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab -&gt; xe-pw-163369v1</li>
</ul>
<p>IGT_8806: 8806<br />
  xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab: 9a7eaa045a430ecf1ced87894f3aa54e3ab146ab<br />
  xe-pw-163369v1: 163369v1</p>

</body>
</html>

--===============8344858688590665492==--
