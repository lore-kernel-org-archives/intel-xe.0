Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D09C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47910EEAE;
	Thu, 30 Jul 2026 11:04:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EAA10E661;
 Thu, 30 Jul 2026 11:04:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2400903816233601584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_memory_page_offlining_s?=
 =?utf-8?q?upport_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 11:04:44 -0000
Message-ID: <178540948495.4522.4664274898247071123@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
In-Reply-To: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
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

--===============2400903816233601584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory page offlining support (rev16)
URL   : https://patchwork.freedesktop.org/series/161473/
State : success

== Summary ==

CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0740c57e_BAT -> xe-pw-161473v16_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-161473v16_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-wcl-1:          NOTRUN -> [SKIP][1] ([Intel XE#7245])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-wcl-1:          NOTRUN -> [SKIP][2] ([Intel XE#8265])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-1:          NOTRUN -> [SKIP][3] ([Intel XE#7238]) +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          NOTRUN -> [SKIP][4] ([Intel XE#7482]) +17 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-wcl-1:          NOTRUN -> [SKIP][5] ([Intel XE#8364]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-wcl-1:          NOTRUN -> [SKIP][6] ([Intel XE#7239]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-1:          NOTRUN -> [SKIP][7] ([Intel XE#7243])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-wcl-1:          NOTRUN -> [SKIP][8] ([Intel XE#7247] / [Intel XE#7590])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-wcl-1:          NOTRUN -> [SKIP][9] ([Intel XE#7242] / [Intel XE#7590])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-wcl-1:          NOTRUN -> [SKIP][10] ([Intel XE#7248] / [Intel XE#7590])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-wcl-1:          [ABORT][11] ([Intel XE#8717]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/bat-wcl-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8717


Build changes
-------------

  * IGT: IGT_9032 -> IGT_9033
  * Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -> xe-pw-161473v16

  IGT_9032: 9032
  IGT_9033: 9033
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405b446c82de0740c57e
  xe-pw-161473v16: 161473v16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/index.html

--===============2400903816233601584==
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
<tr><td><b>Series:</b></td><td>Add memory page offlining support (rev16)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161473/">https://patchwork.freedesktop.org/series/161473/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0740c57e_BAT -&gt; xe-pw-161473v16_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161473v16_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8717">Intel XE#8717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v16/bat-wcl-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9032 -&gt; IGT_9033</li>
<li>Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -&gt; xe-pw-161473v16</li>
</ul>
<p>IGT_9032: 9032<br />
  IGT_9033: 9033<br />
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405b446c82de0740c57e<br />
  xe-pw-161473v16: 161473v16</p>

</body>
</html>

--===============2400903816233601584==--
