Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B8F013CA
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 08:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441B10E28E;
	Mon, 16 Mar 2026 08:18:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F77F10E28E;
 Mon, 16 Mar 2026 08:18:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5704175670792006484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Reject_coh=5Fnone?=
 =?utf-8?q?_PAT_index_for_CPU_cached_memory_in_madvise_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 08:18:45 -0000
Message-ID: <177364912516.360219.8225883227151029834@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129000147.339361-1-jia.yao@intel.com>
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
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

--===============5704175670792006484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reject coh_none PAT index for CPU cached memory in madvise (rev6)
URL   : https://patchwork.freedesktop.org/series/160797/
State : success

== Summary ==

CI Bug Log - changes from xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77_BAT -> xe-pw-160797v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77 -> xe-pw-160797v6

  IGT_8805: 8805
  xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77: 7e7f810f52b5287a8a1cce82eebb4e2ffd082b77
  xe-pw-160797v6: 160797v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v6/index.html

--===============5704175670792006484==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reject coh_none PAT index for CPU cached memory in madvise (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160797/">https://patchwork.freedesktop.org/series/160797/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77_BAT -&gt; xe-pw-160797v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77 -&gt; xe-pw-160797v6</li>
</ul>
<p>IGT_8805: 8805<br />
  xe-4726-7e7f810f52b5287a8a1cce82eebb4e2ffd082b77: 7e7f810f52b5287a8a1cce82eebb4e2ffd082b77<br />
  xe-pw-160797v6: 160797v6</p>

</body>
</html>

--===============5704175670792006484==--
