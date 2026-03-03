Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C920EDA698
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 17:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FED810E88E;
	Tue,  3 Mar 2026 17:06:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217310E88E;
 Tue,  3 Mar 2026 17:06:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2816827969325859209=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/xe3p=5Flpg=3A_L2_fl?=
 =?utf-8?q?ush_optimization_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 17:06:45 -0000
Message-ID: <177255760598.311574.2582492089212664971@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
In-Reply-To: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
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

--===============2816827969325859209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3p_lpg: L2 flush optimization (rev6)
URL   : https://patchwork.freedesktop.org/series/158017/
State : success

== Summary ==

CI Bug Log - changes from xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143_FULL -> xe-pw-158017v6_FULL
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

  Here are the changes found in xe-pw-158017v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][5] ([Intel XE#5625]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][7], [DMESG-WARN][8], [DMESG-WARN][9], [PASS][10], [DMESG-WARN][11], [DMESG-WARN][12], [DMESG-WARN][13], [DMESG-WARN][14], [DMESG-WARN][15], [DMESG-WARN][16], [DMESG-WARN][17], [DMESG-WARN][18], [DMESG-WARN][19], [DMESG-WARN][20], [DMESG-WARN][21], [DMESG-WARN][22], [DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [PASS][30], [DMESG-WARN][31]) ([Intel XE#7433]) -> ([DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53], [DMESG-WARN][54], [DMESG-WARN][55], [DMESG-WARN][56]) ([Intel XE#7433])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-5/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-5/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-3/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-6/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-4/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-4/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-9/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-9/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-9/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-7/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-7/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-8/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-5/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-8/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-4/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-4/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-9/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-9/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-9/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-2/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * Linux: xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143 -> xe-pw-158017v6

  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143: 69ee18cb718c8e62d92b25235881fc562e71a143
  xe-pw-158017v6: 158017v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/index.html

--===============2816827969325859209==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3p_lpg: L2 flush optimization (rev6=
)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158017/">https://patchwork.freedesktop.org/series/158017/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158017v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158017v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4646-69ee18cb718c8e62d92b25235881fc562=
e71a143_FULL -&gt; xe-pw-158017v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158017v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-8/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shar=
d-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vm=
a.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-lnl-5/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158017v6/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-2/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-5/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/sha=
rd-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e=
71a143/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc=
562e71a143/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b=
25235881fc562e71a143/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb71=
8c8e62d92b25235881fc562e71a143/shard-bmg-6/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-=
69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-8/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shar=
d-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e7=
1a143/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235=
881fc562e71a143/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e6=
2d92b25235881fc562e71a143/shard-bmg-2/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee1=
8cb718c8e62d92b25235881fc562e71a143/shard-bmg-2/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-9/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-9/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg=
-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143=
/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc=
562e71a143/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b=
25235881fc562e71a143/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb71=
8c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-=
69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/shard-bmg-1/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-8/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15801=
7v6/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158017v6/shard-bmg-3/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
8017v6/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-6/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-5/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158017v6/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-4/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-4/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-158017v6/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-1=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-1/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-158017v6/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bm=
g-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-7/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158017v6/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard=
-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-9/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-158017v6/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/sh=
ard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6/shard-bmg-2/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-158017v6/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158017v6=
/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</l=
i>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143 -&gt; xe-pw-158=
017v6</li>
</ul>
<p>IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143: 69ee18cb718c8e62d92b252=
35881fc562e71a143<br />
  xe-pw-158017v6: 158017v6</p>

</body>
</html>

--===============2816827969325859209==--
