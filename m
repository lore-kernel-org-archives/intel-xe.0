Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152E5E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 07:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2ED10E2CE;
	Tue, 14 Jan 2025 07:28:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F50110E0BB;
 Tue, 14 Jan 2025 07:28:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4327556501769964213=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_a_typo_in_xe?=
 =?utf-8?q?=5Fvm=5Fdoc=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 07:28:01 -0000
Message-ID: <173683968131.3514108.16314968391570804453@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113212324.3264218-1-oak.zeng@intel.com>
In-Reply-To: <20250113212324.3264218-1-oak.zeng@intel.com>
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

--===============4327556501769964213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix a typo in xe_vm_doc.h
URL   : https://patchwork.freedesktop.org/series/143482/
State : success

== Summary ==

CI Bug Log - changes from xe-2480-20058aae3e619821197cd32b736893f1d7917ba3_BAT -> xe-pw-143482v1_BAT
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

  Here are the changes found in xe-pw-143482v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821197cd32b736893f1d7917ba3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3958]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821197cd32b736893f1d7917ba3/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958


Build changes
-------------

  * Linux: xe-2480-20058aae3e619821197cd32b736893f1d7917ba3 -> xe-pw-143482v1

  IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2480-20058aae3e619821197cd32b736893f1d7917ba3: 20058aae3e619821197cd32b736893f1d7917ba3
  xe-pw-143482v1: 143482v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/index.html

--===============4327556501769964213==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix a typo in xe_vm_doc.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143482/">https://patchwork.freedesktop.org/series/143482/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2480-20058aae3e619821197cd32b736893f1d7917ba3_BAT -&gt; xe-pw-143482v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143482v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821197cd32b736893f1d7917ba3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821197cd32b736893f1d7917ba3/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143482v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2480-20058aae3e619821197cd32b736893f1d7917ba3 -&gt; xe-pw-143482v1</li>
</ul>
<p>IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2480-20058aae3e619821197cd32b736893f1d7917ba3: 20058aae3e619821197cd32b736893f1d7917ba3<br />
  xe-pw-143482v1: 143482v1</p>

</body>
</html>

--===============4327556501769964213==--
