Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76651EF5862
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 06:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D37F10E6B0;
	Wed, 25 Feb 2026 06:22:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DFF10E212;
 Wed, 25 Feb 2026 06:22:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2732646883081758726=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_rust=3A_clist_patches_for_?=
 =?utf-8?q?nova-core_memory_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 06:22:44 -0000
Message-ID: <177200056453.284988.17325032345145265146@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
In-Reply-To: <20260224222734.3153931-1-joelagnelf@nvidia.com>
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

--===============2732646883081758726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: rust: clist patches for nova-core memory management
URL   : https://patchwork.freedesktop.org/series/162092/
State : failure

== Summary ==

CI Bug Log - changes from xe-4608-81bad6eee78e11939cab053edf9734fbf8125913_FULL -> xe-pw-162092v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162092v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162092v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162092v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-162092v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2313])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313


Build changes
-------------

  * Linux: xe-4608-81bad6eee78e11939cab053edf9734fbf8125913 -> xe-pw-162092v1

  IGT_8769: 8769
  xe-4608-81bad6eee78e11939cab053edf9734fbf8125913: 81bad6eee78e11939cab053edf9734fbf8125913
  xe-pw-162092v1: 162092v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/index.html

--===============2732646883081758726==
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
<tr><td><b>Series:</b></td><td>rust: clist patches for nova-core memory management</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162092/">https://patchwork.freedesktop.org/series/162092/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4608-81bad6eee78e11939cab053edf9734fbf8125913_FULL -&gt; xe-pw-162092v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162092v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162092v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162092v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-file-nomemset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162092v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162092v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4608-81bad6eee78e11939cab053edf9734fbf8125913 -&gt; xe-pw-162092v1</li>
</ul>
<p>IGT_8769: 8769<br />
  xe-4608-81bad6eee78e11939cab053edf9734fbf8125913: 81bad6eee78e11939cab053edf9734fbf8125913<br />
  xe-pw-162092v1: 162092v1</p>

</body>
</html>

--===============2732646883081758726==--
