Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33075C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 05:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB0E10EC29;
	Fri, 23 Aug 2024 05:45:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B21310EC25;
 Fri, 23 Aug 2024 05:45:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3194278002963441594=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Replace_dma-fence_chain_with_dma?=
 =?utf-8?q?-fence_array_for_media_GT_TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 05:45:44 -0000
Message-ID: <172439194423.727910.7990609414094212098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823045443.2132118-1-matthew.brost@intel.com>
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
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

--===============3194278002963441594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace dma-fence chain with dma-fence array for media GT TLB invalidation
URL   : https://patchwork.freedesktop.org/series/137684/
State : success

== Summary ==

CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_BAT -> xe-pw-137684v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7986 -> IGT_7987
  * Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -> xe-pw-137684v1

  IGT_7986: 7986
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70
  xe-pw-137684v1: 137684v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html

--===============3194278002963441594==
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
<tr><td><b>Series:</b></td><td>Replace dma-fence chain with dma-fence array for media GT TLB invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137684/">https://patchwork.freedesktop.org/series/137684/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_BAT -&gt; xe-pw-137684v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7986 -&gt; IGT_7987</li>
<li>Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -&gt; xe-pw-137684v1</li>
</ul>
<p>IGT_7986: 7986<br />
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70<br />
  xe-pw-137684v1: 137684v1</p>

</body>
</html>

--===============3194278002963441594==--
