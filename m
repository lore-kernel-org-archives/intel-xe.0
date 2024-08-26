Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD611C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 18:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546CC10E285;
	Mon, 26 Aug 2024 18:50:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64D10E289;
 Mon, 26 Aug 2024 18:50:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1682804317259263862=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Split_out_dma_fence_array_and_in?=
 =?utf-8?q?validate_media=5Fgt_TLBs_in_PT_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 18:50:14 -0000
Message-ID: <172469821463.785437.5233803360958222076@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826170144.2492062-1-matthew.brost@intel.com>
In-Reply-To: <20240826170144.2492062-1-matthew.brost@intel.com>
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

--===============1682804317259263862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Split out dma fence array and invalidate media_gt TLBs in PT code (rev2)
URL   : https://patchwork.freedesktop.org/series/137805/
State : success

== Summary ==

CI Bug Log - changes from xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f_BAT -> xe-pw-137805v2_BAT
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

  Here are the changes found in xe-pw-137805v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#324])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f -> xe-pw-137805v2

  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f: ebf52522dc2395b7c809271ffdb908c9af876f4f
  xe-pw-137805v2: 137805v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/index.html

--===============1682804317259263862==
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
<tr><td><b>Series:</b></td><td>Split out dma fence array and invalidate media_gt TLBs in PT code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137805/">https://patchwork.freedesktop.org/series/137805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f_BAT -&gt; xe-pw-137805v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137805v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137805v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f -&gt; xe-pw-137805v2</li>
</ul>
<p>IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1828-ebf52522dc2395b7c809271ffdb908c9af876f4f: ebf52522dc2395b7c809271ffdb908c9af876f4f<br />
  xe-pw-137805v2: 137805v2</p>

</body>
</html>

--===============1682804317259263862==--
