Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4EAF532CC
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 04:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC6B10E2DD;
	Fri, 27 Mar 2026 04:19:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288D610E117;
 Fri, 27 Mar 2026 04:19:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4897577255451658825=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/madvise=3A_Add_supp?=
 =?utf-8?q?ort_for_purgeable_buffer_objects_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 04:19:45 -0000
Message-ID: <177458518514.404868.1653492865826955657@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

--===============4897577255451658825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev11)
URL   : https://patchwork.freedesktop.org/series/156651/
State : success

== Summary ==

CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL -> xe-pw-156651v11_FULL
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

  Here are the changes found in xe-pw-156651v11_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#5643])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7340] / [Intel XE#7504])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#7340])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#5625])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][11] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504


Build changes
-------------

  * IGT: IGT_8833 -> IGT_8834
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-pw-156651v11

  IGT_8833: 8833
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-pw-156651v11: 156651v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/index.html

--===============4897577255451658825==
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
<tr><td><b>Series:</b></td><td>drm/xe/madvise: Add support for purgeable buffer objects (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156651/">https://patchwork.freedesktop.org/series/156651/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL -&gt; xe-pw-156651v11_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156651v11_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156651v11/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8833 -&gt; IGT_8834</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-pw-156651v11</li>
</ul>
<p>IGT_8833: 8833<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-pw-156651v11: 156651v11</p>

</body>
</html>

--===============4897577255451658825==--
