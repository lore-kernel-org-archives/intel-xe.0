Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF41410ED656
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D3910ED5F;
	Fri, 27 Mar 2026 10:25:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439FF10ED4A;
 Fri, 27 Mar 2026 10:25:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0050535762312647429=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5Bv1?=
 =?utf-8?q?=2C1/1=5D_drm/xe=3A_Fix_null_pointer_dereference_in_devcoredump_c?=
 =?utf-8?q?leanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 10:25:48 -0000
Message-ID: <177460714825.405622.11196846047751642179@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326181017.2060209-1-zhanjun.dong@intel.com>
In-Reply-To: <20260326181017.2060209-1-zhanjun.dong@intel.com>
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

--===============0050535762312647429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe: Fix null pointer dereference in devcoredump cleanup
URL   : https://patchwork.freedesktop.org/series/163943/
State : success

== Summary ==

CI Bug Log - changes from xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b_FULL -> xe-pw-163943v1_FULL
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

  Here are the changes found in xe-pw-163943v1_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][1] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [FAIL][3] ([Intel XE#7072]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072


Build changes
-------------

  * Linux: xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b -> xe-pw-163943v1

  IGT_8834: 8834
  xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b
  xe-pw-163943v1: 163943v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/index.html

--===============0050535762312647429==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] drm/xe: Fix null pointer dereference in devcoredump cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163943/">https://patchwork.freedesktop.org/series/163943/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b_FULL -&gt; xe-pw-163943v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163943v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072">Intel XE#7072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b -&gt; xe-pw-163943v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b<br />
  xe-pw-163943v1: 163943v1</p>

</body>
</html>

--===============0050535762312647429==--
