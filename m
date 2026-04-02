Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3C4D6AAF5
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E6010E42A;
	Thu,  2 Apr 2026 17:38:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522410E0AD;
 Thu,  2 Apr 2026 17:38:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1418427282322592116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Fix_slab-out-of-?=
 =?utf-8?q?bounds_on_PT_update_ops_retry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 17:38:06 -0000
Message-ID: <177515148613.429210.13327075951604237685@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
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

--===============1418427282322592116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix slab-out-of-bounds on PT update ops retry
URL   : https://patchwork.freedesktop.org/series/164284/
State : success

== Summary ==

CI Bug Log - changes from xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c_FULL -> xe-pw-164284v1_FULL
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

  Here are the changes found in xe-pw-164284v1_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_system_allocator@eu-fault-2m-once-device-host:
    - shard-lnl:          [FAIL][1] ([Intel XE#7592]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-lnl-8/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-lnl-6/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][3], [DMESG-WARN][4], [DMESG-WARN][5], [DMESG-WARN][6], [DMESG-WARN][7], [DMESG-WARN][8], [DMESG-WARN][9], [DMESG-WARN][10], [DMESG-WARN][11], [DMESG-WARN][12], [DMESG-WARN][13], [DMESG-WARN][14], [DMESG-WARN][15], [DMESG-WARN][16], [DMESG-WARN][17], [DMESG-WARN][18], [DMESG-WARN][19], [DMESG-FAIL][20], [DMESG-WARN][21], [DMESG-WARN][22], [DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27]) ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7433]) -> ([DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52]) ([Intel XE#7433])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-5/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-9/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-9/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-9/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-2/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-3/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-4/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-3/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-6/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-6/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-8/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-8/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-6/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-8/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-5/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-5/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-3/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-3/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-7/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-7/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-7/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-10/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-10/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-10/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-4/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-4/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-1/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592


Build changes
-------------

  * Linux: xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c -> xe-pw-164284v1

  IGT_8842: 8842
  xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c: 5ab3838428d9d2baa881cb9b23a30cc77e5c893c
  xe-pw-164284v1: 164284v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/index.html

--===============1418427282322592116==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Fix slab-out-of-bounds on PT update =
ops retry</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164284/">https://patchwork.freedesktop.org/series/164284/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164284v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164284v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4840-5ab3838428d9d2baa881cb9b23a30cc77=
e5c893c_FULL -&gt; xe-pw-164284v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164284v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_system_allocator@eu-fault-2m-once-device-host:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-lnl-8/igt@xe_exec_=
system_allocator@eu-fault-2m-once-device-host.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7592">Intel XE#7592</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/s=
hard-lnl-6/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html">=
PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-5/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-9/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/sha=
rd-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e=
5c893c/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b=
23a30cc77e5c893c/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2=
baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3=
838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-7/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-1/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bm=
g-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893=
c/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30=
cc77e5c893c/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa88=
1cb9b23a30cc77e5c893c/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab383842=
8d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-484=
0-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-10/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-=
4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/=
shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc=
77e5c893c/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881c=
b9b23a30cc77e5c893c/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5ab3838428d=
9d2baa881cb9b23a30cc77e5c893c/shard-bmg-3/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4840-5=
ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-6/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-6/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard-bmg-8/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c/shard=
-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433"=
>Intel XE#7433</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-164284v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shar=
d-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164284v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/s=
hard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-5/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-164284v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v=
1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164284v1/shard-bmg-4/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1642=
84v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-7/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-164284v1/shard-bmg-7/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64284v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-10/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-10/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-164284v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bm=
g-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-4/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard=
-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-164284v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/sh=
ard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164284v1/shard-bmg-1/igt@xe_module_=
load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c -&gt; xe-pw-164=
284v1</li>
</ul>
<p>IGT_8842: 8842<br />
  xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c: 5ab3838428d9d2baa881cb9=
b23a30cc77e5c893c<br />
  xe-pw-164284v1: 164284v1</p>

</body>
</html>

--===============1418427282322592116==--
