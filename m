Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F6FC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F2110EB9C;
	Thu, 11 Jul 2024 21:08:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31FD10E02A;
 Thu, 11 Jul 2024 21:08:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3258586188466277762=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIENJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgeGVfcG1fcnVudGlt?=
 =?utf-8?b?ZV9nZXQoKSBpbiB4ZV9nZ3R0X3JlbW92ZV9ub2RlKCk=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 21:08:21 -0000
Message-ID: <172073210166.164910.6701842545112979592@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711200031.49798-1-jose.souza@intel.com>
In-Reply-To: <20240711200031.49798-1-jose.souza@intel.com>
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

--===============3258586188466277762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()
URL   : https://patchwork.freedesktop.org/series/136012/
State : success

== Summary ==

CI Bug Log - changes from xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1_BAT -> xe-pw-136012v1_BAT
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

  Here are the changes found in xe-pw-136012v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1330])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136012v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330


Build changes
-------------

  * Linux: xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1 -> xe-pw-136012v1

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1: 3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1
  xe-pw-136012v1: 136012v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136012v1/index.html

--===============3258586188466277762==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136012/">https://patchwork.freedesktop.org/series/136012/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136012v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136012v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1_BAT -&gt; xe-pw-136012v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136012v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136012v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1 -&gt; xe-pw-136012v1</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1: 3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1<br />
  xe-pw-136012v1: 136012v1</p>

</body>
</html>

--===============3258586188466277762==--
