Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E9C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 17:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AE310E8F1;
	Thu,  6 Feb 2025 17:59:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514BE10E8F1;
 Thu,  6 Feb 2025 17:58:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7680113065669748450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_uninitialized?=
 =?utf-8?q?_pointer_read_in_xe=5Fvm=5Fbind=5Fkernel=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dheeraj Reddy Jonnalagadda" <dheeraj.linuxdev@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 17:58:59 -0000
Message-ID: <173886473932.2163878.8532390393117911372@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
In-Reply-To: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
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

--===============7680113065669748450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
URL   : https://patchwork.freedesktop.org/series/144428/
State : success

== Summary ==

CI Bug Log - changes from xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73_BAT -> xe-pw-144428v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144428v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-userptr-end:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-end.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144428v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-end.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73 -> xe-pw-144428v1

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73: 6aefd052b6d045413722e295ca100dce6c8c7b73
  xe-pw-144428v1: 144428v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144428v1/index.html

--===============7680113065669748450==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144428/">https://patchwork.freedesktop.org/series/144428/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144428v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144428v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73_BAT -&gt; xe-pw-144428v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144428v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-end:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144428v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73 -&gt; xe-pw-144428v1</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2610-6aefd052b6d045413722e295ca100dce6c8c7b73: 6aefd052b6d045413722e295ca100dce6c8c7b73<br />
  xe-pw-144428v1: 144428v1</p>

</body>
</html>

--===============7680113065669748450==--
