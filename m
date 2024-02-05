Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A5C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 23:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1110F13D;
	Mon,  5 Feb 2024 23:54:38 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACAC10FD8A;
 Mon,  5 Feb 2024 23:54:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9020715200757587026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Assume_large_page_size?=
 =?utf-8?q?_if_VMA_not_yet_bound?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 23:54:37 -0000
Message-ID: <170717727782.1024297.9173772793387836380@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205231714.2956225-1-matthew.brost@intel.com>
In-Reply-To: <20240205231714.2956225-1-matthew.brost@intel.com>
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

--===============9020715200757587026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Assume large page size if VMA not yet bound
URL   : https://patchwork.freedesktop.org/series/129555/
State : success

== Summary ==

CI Bug Log - changes from xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd_BAT -> xe-pw-129555v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129555v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [SKIP][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129555v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  


Build changes
-------------

  * Linux: xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd -> xe-pw-129555v1

  IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd: b71b753a5041cf8869006840c7577c3bac01d1cd
  xe-pw-129555v1: 129555v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129555v1/index.html

--===============9020715200757587026==
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
<tr><td><b>Series:</b></td><td>drm/xe: Assume large page size if VMA not yet bound</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129555/">https://patchwork.freedesktop.org/series/129555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129555v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129555v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd_BAT -&gt; xe-pw-129555v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129555v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129555v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd -&gt; xe-pw-129555v1</li>
</ul>
<p>IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-733-b71b753a5041cf8869006840c7577c3bac01d1cd: b71b753a5041cf8869006840c7577c3bac01d1cd<br />
  xe-pw-129555v1: 129555v1</p>

</body>
</html>

--===============9020715200757587026==--
