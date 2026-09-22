Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343CC982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CCF10E3CA;
	Tue, 22 Sep 2026 05:39:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25F10E3CA;
 Tue, 22 Sep 2026 05:39:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9110266770009689638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Refresh_TTM_LRU_on_SVM_pref?=
 =?utf-8?q?etch_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 05:39:27 -0000
Message-ID: <179005556717.190466.2924804795130605357@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
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

--===============9110266770009689638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refresh TTM LRU on SVM prefetch (rev3)
URL   : https://patchwork.freedesktop.org/series/174276/
State : failure

== Summary ==

CI Bug Log - changes from xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04_BAT -> xe-pw-174276v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174276v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174276v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174276v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-174276v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-bmg-1:          [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  


Build changes
-------------

  * Linux: xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 -> xe-pw-174276v3

  IGT_9105: 9105
  xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04
  xe-pw-174276v3: 174276v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/index.html

--===============9110266770009689638==
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
<tr><td><b>Series:</b></td><td>Refresh TTM LRU on SVM prefetch (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174276/">https://patchwork.freedesktop.org/series/174276/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04_BAT -&gt; xe-pw-174276v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174276v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174276v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174276v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-rebind-prefetch:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174276v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 -&gt; xe-pw-174276v3</li>
</ul>
<p>IGT_9105: 9105<br />
  xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04<br />
  xe-pw-174276v3: 174276v3</p>

</body>
</html>

--===============9110266770009689638==--
