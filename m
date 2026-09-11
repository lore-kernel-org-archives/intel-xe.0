Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D282CC88E4A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 00:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BD610E047;
	Fri, 11 Sep 2026 00:31:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716310E047;
 Fri, 11 Sep 2026 00:31:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1305211979840240182=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/tlb=5Finval=3A_Squas?=
 =?utf-8?q?h_wedged_error_in_GGTT_TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Sep 2026 00:31:39 -0000
Message-ID: <178908669948.148519.930171055880556074@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910232734.93054-1-shuicheng.lin@intel.com>
In-Reply-To: <20260910232734.93054-1-shuicheng.lin@intel.com>
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

--===============1305211979840240182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/tlb_inval: Squash wedged error in GGTT TLB invalidation
URL   : https://patchwork.freedesktop.org/series/173820/
State : success

== Summary ==

CI Bug Log - changes from xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d_BAT -> xe-pw-173820v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173820v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173820v1/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * IGT: IGT_9090 -> IGT_9091
  * Linux: xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d -> xe-pw-173820v1

  IGT_9090: 9090
  IGT_9091: 9091
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d
  xe-pw-173820v1: 173820v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173820v1/index.html

--===============1305211979840240182==
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
<tr><td><b>Series:</b></td><td>drm/xe/tlb_inval: Squash wedged error in GGTT TLB invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173820/">https://patchwork.freedesktop.org/series/173820/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173820v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173820v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d_BAT -&gt; xe-pw-173820v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173820v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173820v1/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9090 -&gt; IGT_9091</li>
<li>Linux: xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d -&gt; xe-pw-173820v1</li>
</ul>
<p>IGT_9090: 9090<br />
  IGT_9091: 9091<br />
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d<br />
  xe-pw-173820v1: 173820v1</p>

</body>
</html>

--===============1305211979840240182==--
