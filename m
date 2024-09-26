Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C460CDE025
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F8010E056;
	Thu, 26 Sep 2024 16:51:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64AD10EBB0;
 Thu, 26 Sep 2024 16:51:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4305613762501188335=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Restore_GT_freq_on_GSC?=
 =?utf-8?q?_load_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:51:07 -0000
Message-ID: <172736946780.1108067.8926965618157680393@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
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

--===============4305613762501188335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Restore GT freq on GSC load error
URL   : https://patchwork.freedesktop.org/series/139119/
State : success

== Summary ==

CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_BAT -> xe-pw-139119v1_BAT
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

  Here are the changes found in xe-pw-139119v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8032 -> IGT_8033
  * Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -> xe-pw-139119v1

  IGT_8032: 8032
  IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334
  xe-pw-139119v1: 139119v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html

--===============4305613762501188335==
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
<tr><td><b>Series:</b></td><td>drm/xe: Restore GT freq on GSC load error</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139119/">https://patchwork.freedesktop.org/series/139119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_BAT -&gt; xe-pw-139119v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139119v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGT_8033</li>
<li>Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -&gt; xe-pw-139119v1</li>
</ul>
<p>IGT_8032: 8032<br />
  IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334<br />
  xe-pw-139119v1: 139119v1</p>

</body>
</html>

--===============4305613762501188335==--
