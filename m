Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8A010F287A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 23:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598AF10EF86;
	Fri, 27 Mar 2026 23:21:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0500B10EF86;
 Fri, 27 Mar 2026 23:21:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8634652978813871259=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_Wa=5F1402662?=
 =?utf-8?q?6235?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 23:21:27 -0000
Message-ID: <177465368799.407613.4346969829142648340@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327080719.2136248-2-nitin.r.gote@intel.com>
In-Reply-To: <20260327080719.2136248-2-nitin.r.gote@intel.com>
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

--===============8634652978813871259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add Wa_14026626235
URL   : https://patchwork.freedesktop.org/series/163967/
State : success

== Summary ==

CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_FULL -> xe-pw-163967v1_FULL
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

  Here are the changes found in xe-pw-163967v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-lnl:          [PASS][1] -> [ABORT][2] ([Intel XE#4760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][5] ([Intel XE#301]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][7] ([Intel XE#7340]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -> xe-pw-163967v1

  IGT_8834: 8834
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b
  xe-pw-163967v1: 163967v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html

--===============8634652978813871259==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add Wa_14026626235</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163967/">https://patchwork.freedesktop.org/series/163967/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_FULL -&gt; xe-pw-163967v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163967v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -&gt; xe-pw-163967v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b<br />
  xe-pw-163967v1: 163967v1</p>

</body>
</html>

--===============8634652978813871259==--
