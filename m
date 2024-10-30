Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE97D2AB2C
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 09:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E73E10E76B;
	Wed, 30 Oct 2024 09:26:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0C10E76B;
 Wed, 30 Oct 2024 09:26:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1345262967555940982=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/dp=3A_Limit_max_compres?=
 =?utf-8?q?sed_bpp_to_18_when_forcing_DSC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 09:26:33 -0000
Message-ID: <173028039361.1363062.12993582133712676421@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030084100.1361689-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241030084100.1361689-1-ankit.k.nautiyal@intel.com>
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

--===============1345262967555940982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC
URL   : https://patchwork.freedesktop.org/series/140716/
State : success

== Summary ==

CI Bug Log - changes from xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f_BAT -> xe-pw-140716v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-140716v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3295])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3295])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2874]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295


Build changes
-------------

  * Linux: xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f -> xe-pw-140716v1

  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f
  xe-pw-140716v1: 140716v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/index.html

--===============1345262967555940982==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140716/">https://patchwork.freedesktop.org/series/140716/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f_BAT -&gt; xe-pw-140716v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140716v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140716v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f -&gt; xe-pw-140716v1</li>
</ul>
<p>IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f<br />
  xe-pw-140716v1: 140716v1</p>

</body>
</html>

--===============1345262967555940982==--
