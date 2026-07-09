Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE44C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 01:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403AB10E204;
	Thu,  9 Jul 2026 01:56:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043710E204;
 Thu,  9 Jul 2026 01:56:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3998116483934749795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Destroy_page_tabl?=
 =?utf-8?q?es_after_unlinking_all_VMAs_on_VM_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 01:56:40 -0000
Message-ID: <178356220012.167178.2917490837387182377@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709005125.1666142-1-matthew.brost@intel.com>
In-Reply-To: <20260709005125.1666142-1-matthew.brost@intel.com>
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

--===============3998116483934749795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Destroy page tables after unlinking all VMAs on VM close
URL   : https://patchwork.freedesktop.org/series/170045/
State : success

== Summary ==

CI Bug Log - changes from xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8_BAT -> xe-pw-170045v1_BAT
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

  * Linux: xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8 -> xe-pw-170045v1

  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8: 9529d603c7d29d245f9fbe23668034657c5a4ab8
  xe-pw-170045v1: 170045v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170045v1/index.html

--===============3998116483934749795==
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
<tr><td><b>Series:</b></td><td>drm/xe: Destroy page tables after unlinking all VMAs on VM close</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170045/">https://patchwork.freedesktop.org/series/170045/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170045v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170045v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8_BAT -&gt; xe-pw-170045v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8 -&gt; xe-pw-170045v1</li>
</ul>
<p>IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5371-9529d603c7d29d245f9fbe23668034657c5a4ab8: 9529d603c7d29d245f9fbe23668034657c5a4ab8<br />
  xe-pw-170045v1: 170045v1</p>

</body>
</html>

--===============3998116483934749795==--
