Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ED6CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 14:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131110E739;
	Wed, 13 Aug 2025 14:30:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46F010E739;
 Wed, 13 Aug 2025 14:30:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3042840608899135049=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_MADVISE_SQUASH_fo?=
 =?utf-8?q?r_CI-v7=5Fwith=5Fcomments=5Faddressed=5Fgpuvm=5Fchanges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 14:30:27 -0000
Message-ID: <175509542792.233544.6819171929743041897@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250813123855.2138754-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250813123855.2138754-1-himal.prasad.ghimiray@intel.com>
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

--===============3042840608899135049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: MADVISE SQUASH for CI-v7_with_comments_addressed_gpuvm_changes
URL   : https://patchwork.freedesktop.org/series/152884/
State : success

== Summary ==

CI Bug Log - changes from xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13_BAT -> xe-pw-152884v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-152884v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13 -> xe-pw-152884v1

  IGT_8493: 8493
  xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13: 546fc742f08b8dbd3fa1486933c9b15085e11d13
  xe-pw-152884v1: 152884v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152884v1/index.html

--===============3042840608899135049==
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
<tr><td><b>Series:</b></td><td>drm/xe: MADVISE SQUASH for CI-v7_with_comments_addressed_gpuvm_changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152884/">https://patchwork.freedesktop.org/series/152884/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152884v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152884v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13_BAT -&gt; xe-pw-152884v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152884v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13 -&gt; xe-pw-152884v1</li>
</ul>
<p>IGT_8493: 8493<br />
  xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13: 546fc742f08b8dbd3fa1486933c9b15085e11d13<br />
  xe-pw-152884v1: 152884v1</p>

</body>
</html>

--===============3042840608899135049==--
