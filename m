Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB4EC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 10:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6810E6BE;
	Tue, 20 Aug 2024 10:18:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114810E6BE;
 Tue, 20 Aug 2024 10:18:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5610971107227911252=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_NULL_check_before_?=
 =?utf-8?q?deferencing_pointer_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 10:18:57 -0000
Message-ID: <172414913712.698595.4697506578540429119@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820085454.976636-1-apoorva.singh@intel.com>
In-Reply-To: <20240820085454.976636-1-apoorva.singh@intel.com>
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

--===============5610971107227911252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add NULL check before deferencing pointer (rev3)
URL   : https://patchwork.freedesktop.org/series/137289/
State : success

== Summary ==

CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e_BAT -> xe-pw-137289v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137289v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137289v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-imm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7976 -> IGT_7978
  * Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -> xe-pw-137289v3

  IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7bb6237a94ee46cc76e
  xe-pw-137289v3: 137289v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137289v3/index.html

--===============5610971107227911252==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add NULL check before deferencing pointer (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137289/">https://patchwork.freedesktop.org/series/137289/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137289v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137289v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e_BAT -&gt; xe-pw-137289v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137289v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic-imm:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137289v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7976 -&gt; IGT_7978</li>
<li>Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -&gt; xe-pw-137289v3</li>
</ul>
<p>IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7bb6237a94ee46cc76e<br />
  xe-pw-137289v3: 137289v3</p>

</body>
</html>

--===============5610971107227911252==--
