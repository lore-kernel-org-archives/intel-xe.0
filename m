Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266E8C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 15:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47D810E91A;
	Thu, 10 Jul 2025 15:58:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFBD10E91A;
 Thu, 10 Jul 2025 15:58:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1191440701271659300=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/ttm=3A_fix_locking_in_test_ttm=5Fbo=5Fvalidate=5Fno=5Fpla?=
 =?utf-8?q?cement=5Fsignaled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 15:58:11 -0000
Message-ID: <175216309131.151519.1703909250272608892@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710144129.1803-1-christian.koenig@amd.com>
In-Reply-To: <20250710144129.1803-1-christian.koenig@amd.com>
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

--===============1191440701271659300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled
URL   : https://patchwork.freedesktop.org/series/151448/
State : success

== Summary ==

CI Bug Log - changes from xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f_BAT -> xe-pw-151448v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f -> xe-pw-151448v1

  IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f: ab7865510db0144b2f262ded130f8cc54026d64f
  xe-pw-151448v1: 151448v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151448v1/index.html

--===============1191440701271659300==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151448/">https://patchwork.freedesktop.org/series/151448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151448v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151448v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f_BAT -&gt; xe-pw-151448v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f -&gt; xe-pw-151448v1</li>
</ul>
<p>IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f: ab7865510db0144b2f262ded130f8cc54026d64f<br />
  xe-pw-151448v1: 151448v1</p>

</body>
</html>

--===============1191440701271659300==--
