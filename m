Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E8CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 14:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20C10E26C;
	Wed, 18 Sep 2024 14:14:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B897F10E26C;
 Wed, 18 Sep 2024 14:14:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4185259472694997063=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_memirq_infra_changes_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 14:14:52 -0000
Message-ID: <172666889274.1026495.3609385658266343765@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918053942.1331811-1-illevi@habana.ai>
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
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

--===============4185259472694997063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: memirq infra changes (rev8)
URL   : https://patchwork.freedesktop.org/series/137643/
State : success

== Summary ==

CI Bug Log - changes from xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9_BAT -> xe-pw-137643v8_BAT
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

  Here are the changes found in xe-pw-137643v8_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-rebind:
    - bat-bmg-1:          [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9 -> xe-pw-137643v8

  IGT_8024: 15f8ad0bce184e96d171dfe19c06bdef93e7cf72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9: 692d461fa9a48c6600df07421a99308f49cf00a9
  xe-pw-137643v8: 137643v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/index.html

--===============4185259472694997063==
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
<tr><td><b>Series:</b></td><td>memirq infra changes (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137643/">https://patchwork.freedesktop.org/series/137643/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9_BAT -&gt; xe-pw-137643v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137643v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9 -&gt; xe-pw-137643v8</li>
</ul>
<p>IGT_8024: 15f8ad0bce184e96d171dfe19c06bdef93e7cf72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9: 692d461fa9a48c6600df07421a99308f49cf00a9<br />
  xe-pw-137643v8: 137643v8</p>

</body>
</html>

--===============4185259472694997063==--
