Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D61ECA0ECB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1954410E7F8;
	Fri, 30 Aug 2024 06:05:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D7010E7F8;
 Fri, 30 Aug 2024 06:05:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2474217297439753388=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fget=28?=
 =?utf-8?q?=29_failure_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 06:05:50 -0000
Message-ID: <172499795013.850462.17292777120876837780@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

--===============2474217297439753388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_force_wake_get() failure handling
URL   : https://patchwork.freedesktop.org/series/137982/
State : success

== Summary ==

CI Bug Log - changes from xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158_BAT -> xe-pw-137982v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-pvc-2 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158 -> xe-pw-137982v1

  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158: d77e26a2d2f173b7998932b5d76173816ed5e158
  xe-pw-137982v1: 137982v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v1/index.html

--===============2474217297439753388==
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
<tr><td><b>Series:</b></td><td>Fix xe_force_wake_get() failure handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137982/">https://patchwork.freedesktop.org/series/137982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158_BAT -&gt; xe-pw-137982v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-pvc-2 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158 -&gt; xe-pw-137982v1</li>
</ul>
<p>IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1863-d77e26a2d2f173b7998932b5d76173816ed5e158: d77e26a2d2f173b7998932b5d76173816ed5e158<br />
  xe-pw-137982v1: 137982v1</p>

</body>
</html>

--===============2474217297439753388==--
