Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ABFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 23:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC1C10E01F;
	Wed, 29 Apr 2026 23:56:17 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11E10E01F;
 Wed, 29 Apr 2026 23:56:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3154550279474213771=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fexec=3A_Avoid_p?=
 =?utf-8?q?otential_lockdep_cycle_with_xe=5Fpm=5Fblock=5Fmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 23:56:16 -0000
Message-ID: <177750697690.26192.12207536643022525161@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429211359.195640-2-brian3.nguyen@intel.com>
In-Reply-To: <20260429211359.195640-2-brian3.nguyen@intel.com>
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

--===============3154550279474213771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_exec: Avoid potential lockdep cycle with xe_pm_block_map (rev2)
URL   : https://patchwork.freedesktop.org/series/165659/
State : success

== Summary ==

CI Bug Log - changes from xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed_BAT -> xe-pw-165659v2_BAT
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

  * Linux: xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed -> xe-pw-165659v2

  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed: c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed
  xe-pw-165659v2: 165659v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165659v2/index.html

--===============3154550279474213771==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_exec: Avoid potential lockdep cycle with xe_pm_block_map (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165659/">https://patchwork.freedesktop.org/series/165659/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165659v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165659v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed_BAT -&gt; xe-pw-165659v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed -&gt; xe-pw-165659v2</li>
</ul>
<p>IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4954-c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed: c50aab3f28b1580a38a58ca7a3fc3ff9ceb5d5ed<br />
  xe-pw-165659v2: 165659v2</p>

</body>
</html>

--===============3154550279474213771==--
