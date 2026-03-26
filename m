Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE616109E535
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D21610E1A5;
	Thu, 26 Mar 2026 01:12:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460E10E167;
 Thu, 26 Mar 2026 01:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5508298088784116817=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_new_SVM_copy?=
 =?utf-8?q?_GT_stats_per_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 01:11:59 -0000
Message-ID: <177448751951.399091.8966899661123933613@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325160152.1057556-1-francois.dugast@intel.com>
In-Reply-To: <20260325160152.1057556-1-francois.dugast@intel.com>
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

--===============5508298088784116817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add new SVM copy GT stats per size
URL   : https://patchwork.freedesktop.org/series/163864/
State : success

== Summary ==

CI Bug Log - changes from xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50_FULL -> xe-pw-163864v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163864v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#4459]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625


Build changes
-------------

  * Linux: xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50 -> xe-pw-163864v1

  IGT_8826: 8826
  xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50: 2f54b872958d4c373a9d7e7e89a999562c93ba50
  xe-pw-163864v1: 163864v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/index.html

--===============5508298088784116817==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add new SVM copy GT stats per size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163864/">https://patchwork.freedesktop.org/series/163864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50_FULL -&gt; xe-pw-163864v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163864v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163864v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50 -&gt; xe-pw-163864v1</li>
</ul>
<p>IGT_8826: 8826<br />
  xe-4783-2f54b872958d4c373a9d7e7e89a999562c93ba50: 2f54b872958d4c373a9d7e7e89a999562c93ba50<br />
  xe-pw-163864v1: 163864v1</p>

</body>
</html>

--===============5508298088784116817==--
