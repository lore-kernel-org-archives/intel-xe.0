Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC08F9EDDB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 14:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50FF10EE64;
	Wed, 22 Apr 2026 14:33:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5574310EA18;
 Wed, 22 Apr 2026 14:33:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6819403696576198488=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Convert_stolen_me?=
 =?utf-8?q?mory_over_to_ttm=5Frange=5Fmanager_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Apr 2026 14:33:47 -0000
Message-ID: <177686842734.484983.795069576300995246@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
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

--===============6819403696576198488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert stolen memory over to ttm_range_manager (rev4)
URL   : https://patchwork.freedesktop.org/series/164694/
State : success

== Summary ==

CI Bug Log - changes from xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c_BAT -> xe-pw-164694v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164694v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#7483]) -> [PASS][2] +12 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8868 -> IGT_8869
  * Linux: xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c -> xe-pw-164694v4

  IGT_8868: 731d4d56fcb40355ce9d65cb088d4b4773dd8b85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8869: 4963e78e038806cc75f885d7d5713bb0d12c01d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c: 28247e192ca66016a4b374ff06acdf9dbb6cfe7c
  xe-pw-164694v4: 164694v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/index.html

--===============6819403696576198488==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert stolen memory over to ttm_range_manager (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164694/">https://patchwork.freedesktop.org/series/164694/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c_BAT -&gt; xe-pw-164694v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164694v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8868 -&gt; IGT_8869</li>
<li>Linux: xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c -&gt; xe-pw-164694v4</li>
</ul>
<p>IGT_8868: 731d4d56fcb40355ce9d65cb088d4b4773dd8b85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8869: 4963e78e038806cc75f885d7d5713bb0d12c01d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c: 28247e192ca66016a4b374ff06acdf9dbb6cfe7c<br />
  xe-pw-164694v4: 164694v4</p>

</body>
</html>

--===============6819403696576198488==--
