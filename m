Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3319FE9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCED10E300;
	Thu, 19 Feb 2026 13:41:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9D10E300;
 Thu, 19 Feb 2026 13:41:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1213659075792751110=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3p=5Flpg=3A_L2_flu?=
 =?utf-8?q?sh_optimization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 13:41:12 -0000
Message-ID: <177150847219.265880.6362818629535582801@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

--===============1213659075792751110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3p_lpg: L2 flush optimization (rev3)
URL   : https://patchwork.freedesktop.org/series/158017/
State : success

== Summary ==

CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_BAT -> xe-pw-158017v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158017v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#288]) -> [SKIP][4] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        [SKIP][5] ([Intel XE#288]) -> [SKIP][6] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -> xe-pw-158017v3

  IGT_8761: 8761
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f
  xe-pw-158017v3: 158017v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/index.html

--===============1213659075792751110==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3p_lpg: L2 flush optimization (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158017/">https://patchwork.freedesktop.org/series/158017/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_BAT -&gt; xe-pw-158017v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158017v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v3/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -&gt; xe-pw-158017v3</li>
</ul>
<p>IGT_8761: 8761<br />
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f<br />
  xe-pw-158017v3: 158017v3</p>

</body>
</html>

--===============1213659075792751110==--
