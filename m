Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39264C44536
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62F110E8A0;
	Wed, 21 Jan 2026 23:51:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86510E03D;
 Wed, 21 Jan 2026 23:51:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4927612865298251873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Move_=5FTHIS=5FIP?=
 =?utf-8?q?=5F_usage_from_xe=5Fvm=5Fcreate=28=29_to_dedicated_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 23:51:10 -0000
Message-ID: <176903947032.180221.3631064747736635887@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
In-Reply-To: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
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

--===============4927612865298251873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function
URL   : https://patchwork.freedesktop.org/series/160453/
State : success

== Summary ==

CI Bug Log - changes from xe-4432-ad2a046603cba140214aed34015ed5027441e85a_BAT -> xe-pw-160453v1_BAT
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

  * Linux: xe-4432-ad2a046603cba140214aed34015ed5027441e85a -> xe-pw-160453v1

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4432-ad2a046603cba140214aed34015ed5027441e85a: ad2a046603cba140214aed34015ed5027441e85a
  xe-pw-160453v1: 160453v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160453v1/index.html

--===============4927612865298251873==
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
<tr><td><b>Series:</b></td><td>drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160453/">https://patchwork.freedesktop.org/series/160453/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160453v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160453v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4432-ad2a046603cba140214aed34015ed5027441e85a_BAT -&gt; xe-pw-160453v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4432-ad2a046603cba140214aed34015ed5027441e85a -&gt; xe-pw-160453v1</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4432-ad2a046603cba140214aed34015ed5027441e85a: ad2a046603cba140214aed34015ed5027441e85a<br />
  xe-pw-160453v1: 160453v1</p>

</body>
</html>

--===============4927612865298251873==--
