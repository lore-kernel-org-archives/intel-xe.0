Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD2710AB80C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 19:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774D110E674;
	Thu, 26 Mar 2026 19:09:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504D0898A7;
 Thu, 26 Mar 2026 19:09:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0307127476418122118=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv1?=
 =?utf-8?q?=2C1/1=5D_drm/xe=3A_Fix_null_pointer_dereference_in_devcoredump_c?=
 =?utf-8?q?leanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 19:09:20 -0000
Message-ID: <177455216030.403161.17041962974957569673@a3b018990fe9>
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

--===============0307127476418122118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe: Fix null pointer dereference in devcoredump cleanup
URL   : https://patchwork.freedesktop.org/series/163943/
State : success

== Summary ==

CI Bug Log - changes from xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b_BAT -> xe-pw-163943v1_BAT
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

  Here are the changes found in xe-pw-163943v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2229])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][2] ([Intel XE#7249] / [Intel XE#7578]) -> [DMESG-WARN][3] ([Intel XE#7433])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * Linux: xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b -> xe-pw-163943v1

  IGT_8834: 8834
  xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b
  xe-pw-163943v1: 163943v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/index.html

--===============0307127476418122118==
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


    <h1>CI Bug Log - changes from xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b_BAT -&gt; xe-pw-163943v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163943v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163943v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
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

--===============0307127476418122118==--
