Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A6FC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 05:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6910E41C;
	Tue, 23 Jul 2024 05:12:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E5F10E41C;
 Tue, 23 Jul 2024 05:12:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1611248716247250996=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Store_process_name_and_pid_in_xe?=
 =?utf-8?q?_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 05:12:50 -0000
Message-ID: <172171157001.358824.10168874984310742496@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723042428.1701998-1-matthew.brost@intel.com>
In-Reply-To: <20240723042428.1701998-1-matthew.brost@intel.com>
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

--===============1611248716247250996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Store process name and pid in xe file
URL   : https://patchwork.freedesktop.org/series/136368/
State : success

== Summary ==

CI Bug Log - changes from xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_BAT -> xe-pw-136368v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136368v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262


Build changes
-------------

  * Linux: xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b -> xe-pw-136368v1

  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
  xe-pw-136368v1: 136368v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136368v1/index.html

--===============1611248716247250996==
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
<tr><td><b>Series:</b></td><td>Store process name and pid in xe file</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136368/">https://patchwork.freedesktop.org/series/136368/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136368v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136368v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_BAT -&gt; xe-pw-136368v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136368v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b -&gt; xe-pw-136368v1</li>
</ul>
<p>IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b<br />
  xe-pw-136368v1: 136368v1</p>

</body>
</html>

--===============1611248716247250996==--
