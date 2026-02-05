Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185D5ECD985
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 17:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0410E928;
	Thu,  5 Feb 2026 17:03:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3B10E928;
 Thu,  5 Feb 2026 17:03:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8408270953055511061=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_bounds_check_?=
 =?utf-8?q?on_pat=5Findex_to_prevent_OOB_kernel_read_in_madvise_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 17:03:31 -0000
Message-ID: <177031101167.228151.17950588057334236552@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203172045.1154546-1-jia.yao@intel.com>
In-Reply-To: <20260203172045.1154546-1-jia.yao@intel.com>
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

--===============8408270953055511061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise (rev5)
URL   : https://patchwork.freedesktop.org/series/161100/
State : success

== Summary ==

CI Bug Log - changes from xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f_BAT -> xe-pw-161100v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f -> xe-pw-161100v5

  IGT_8739: 8739
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f
  xe-pw-161100v5: 161100v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v5/index.html

--===============8408270953055511061==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161100/">https://patchwork.freedesktop.org/series/161100/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f_BAT -&gt; xe-pw-161100v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f -&gt; xe-pw-161100v5</li>
</ul>
<p>IGT_8739: 8739<br />
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f<br />
  xe-pw-161100v5: 161100v5</p>

</body>
</html>

--===============8408270953055511061==--
