Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6754D116E2
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 16:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24510E17F;
	Fri, 28 Nov 2025 16:14:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5C610E08D;
 Fri, 28 Nov 2025 16:14:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0794704149797354163=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Rust_GPUVM_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Nov 2025 16:14:02 -0000
Message-ID: <176434644295.38795.11567772756004581176@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
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

--===============0794704149797354163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Rust GPUVM support
URL   : https://patchwork.freedesktop.org/series/158211/
State : success

== Summary ==

CI Bug Log - changes from xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670_BAT -> xe-pw-158211v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158211v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - bat-ptl-1:          [FAIL][1] ([Intel XE#5625]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158211v1/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625


Build changes
-------------

  * IGT: IGT_8644 -> IGT_8645
  * Linux: xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670 -> xe-pw-158211v1

  IGT_8644: 069c5ee6eb658181e7264883c6c4fba41fc917a4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8645: 8645
  xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670: e1c1b3e03e356d1e20432dcb0d38ad44d5e92670
  xe-pw-158211v1: 158211v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158211v1/index.html

--===============0794704149797354163==
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
<tr><td><b>Series:</b></td><td>Rust GPUVM support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158211/">https://patchwork.freedesktop.org/series/158211/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158211v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158211v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670_BAT -&gt; xe-pw-158211v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158211v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158211v1/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8644 -&gt; IGT_8645</li>
<li>Linux: xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670 -&gt; xe-pw-158211v1</li>
</ul>
<p>IGT_8644: 069c5ee6eb658181e7264883c6c4fba41fc917a4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8645: 8645<br />
  xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670: e1c1b3e03e356d1e20432dcb0d38ad44d5e92670<br />
  xe-pw-158211v1: 158211v1</p>

</body>
</html>

--===============0794704149797354163==--
