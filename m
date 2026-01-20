Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A09ED26293
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 19:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A81210E153;
	Tue, 20 Jan 2026 19:23:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0BD10E153;
 Tue, 20 Jan 2026 19:23:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8502031914790684702=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_nvm_aux_resource_cleanu?=
 =?utf-8?q?p?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jan 2026 19:23:28 -0000
Message-ID: <176893700875.172340.16470661590509247504@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
In-Reply-To: <20260120183239.2966782-5-shuicheng.lin@intel.com>
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

--===============8502031914790684702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix nvm aux resource cleanup
URL   : https://patchwork.freedesktop.org/series/160376/
State : success

== Summary ==

CI Bug Log - changes from xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1_BAT -> xe-pw-160376v1_BAT
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

  Here are the changes found in xe-pw-160376v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160376v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8708 -> IGT_8709
  * Linux: xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1 -> xe-pw-160376v1

  IGT_8708: 8708
  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1: fa2241b92adb500a9c016188d338aa3f6f8a95a1
  xe-pw-160376v1: 160376v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160376v1/index.html

--===============8502031914790684702==
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
<tr><td><b>Series:</b></td><td>Fix nvm aux resource cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160376/">https://patchwork.freedesktop.org/series/160376/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160376v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160376v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1_BAT -&gt; xe-pw-160376v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160376v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160376v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8708 -&gt; IGT_8709</li>
<li>Linux: xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1 -&gt; xe-pw-160376v1</li>
</ul>
<p>IGT_8708: 8708<br />
  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4419-fa2241b92adb500a9c016188d338aa3f6f8a95a1: fa2241b92adb500a9c016188d338aa3f6f8a95a1<br />
  xe-pw-160376v1: 160376v1</p>

</body>
</html>

--===============8502031914790684702==--
