Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CE60A3829
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 14:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8D112654;
	Thu, 22 Oct 2026 14:09:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80B1112699;
 Thu, 22 Oct 2026 14:09:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8580579800884429859=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Enable_CSC_fault_?=
 =?utf-8?q?injection_on_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Oct 2026 14:09:50 -0000
Message-ID: <179267819087.56426.10764673380292424075@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022122708.625136-2-sk.anirban@intel.com>
In-Reply-To: <20261022122708.625136-2-sk.anirban@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8580579800884429859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable CSC fault injection on CRI
URL   : https://patchwork.freedesktop.org/series/176643/
State : failure

== Summary ==

CI Bug Log - changes from xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856_BAT -> xe-pw-176643v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176643v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176643v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176643v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#9657]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-2:          [SKIP][5] ([Intel XE#9657]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-2:          [SKIP][7] ([Intel XE#9657]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-nvls-1:         [SKIP][9] ([Intel XE#9657]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-nvls-2:         [SKIP][11] ([Intel XE#9657]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-2:          [SKIP][13] ([Intel XE#9657]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-1:          [SKIP][15] ([Intel XE#9657]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-1:          [SKIP][17] ([Intel XE#9657]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-vm:         [SKIP][19] ([Intel XE#9657]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-1:          [SKIP][21] ([Intel XE#9657]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * Linux: xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856 -> xe-pw-176643v1

  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856: b2af5f9ef576a3026836cca5ec8757cc045a1856
  xe-pw-176643v1: 176643v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/index.html

--===============8580579800884429859==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable CSC fault injection on CRI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176643/">https://patchwork.freedesktop.org/series/176643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856_BAT -&gt; xe-pw-176643v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176643v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176643v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176643v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176643v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856 -&gt; xe-pw-176643v1</li>
</ul>
<p>IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856: b2af5f9ef576a3026836cca5ec8757cc045a1856<br />
  xe-pw-176643v1: 176643v1</p>

</body>
</html>

--===============8580579800884429859==--
