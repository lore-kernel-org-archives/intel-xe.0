Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F281CD6E6B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 11:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034811276E;
	Thu,  4 Jun 2026 11:35:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171E211276E;
 Thu,  4 Jun 2026 11:35:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5679821137945281080=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/svm=3A_Add_MMU_notif?=
 =?utf-8?q?ier-based_madvise_autoreset_on_munmap_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 11:35:00 -0000
Message-ID: <178057290008.43098.11154222429536029771@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604095012.367231-1-arvind.yadav@intel.com>
In-Reply-To: <20260604095012.367231-1-arvind.yadav@intel.com>
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

--===============5679821137945281080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev3)
URL   : https://patchwork.freedesktop.org/series/161815/
State : success

== Summary ==

CI Bug Log - changes from xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452_BAT -> xe-pw-161815v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452 -> xe-pw-161815v3

  IGT_8948: 8948
  xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452: 70c7b363fab8198549bb9b82134bda0f6bda9452
  xe-pw-161815v3: 161815v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v3/index.html

--===============5679821137945281080==
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
<tr><td><b>Series:</b></td><td>drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161815/">https://patchwork.freedesktop.org/series/161815/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452_BAT -&gt; xe-pw-161815v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452 -&gt; xe-pw-161815v3</li>
</ul>
<p>IGT_8948: 8948<br />
  xe-5201-70c7b363fab8198549bb9b82134bda0f6bda9452: 70c7b363fab8198549bb9b82134bda0f6bda9452<br />
  xe-pw-161815v3: 161815v3</p>

</body>
</html>

--===============5679821137945281080==--
