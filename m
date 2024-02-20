Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F088C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762A10E521;
	Tue, 20 Feb 2024 19:32:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11F10E521;
 Tue, 20 Feb 2024 19:32:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1413992969052090753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI=2C1/4?=
 =?utf-8?q?=5D_drm/xe/guc=3A_Allocate_GuC_data_structures_in_system_memory_f?=
 =?utf-8?q?or_initial_load_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 19:32:14 -0000
Message-ID: <170845753489.125002.10714808548384884050@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219130530.1406044-1-michal.winiarski@intel.com>
In-Reply-To: <20240219130530.1406044-1-michal.winiarski@intel.com>
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

--===============1413992969052090753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load (rev3)
URL   : https://patchwork.freedesktop.org/series/130079/
State : success

== Summary ==

CI Bug Log - changes from xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805_BAT -> xe-pw-130079v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-130079v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][1] ([Intel XE#392]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v3/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392


Build changes
-------------

  * Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -> xe-pw-130079v3

  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805
  xe-pw-130079v3: 130079v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v3/index.html

--===============1413992969052090753==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130079/">https://patchwork.freedesktop.org/series/130079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805_BAT -&gt; xe-pw-130079v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130079v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v3/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -&gt; xe-pw-130079v3</li>
</ul>
<p>IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805<br />
  xe-pw-130079v3: 130079v3</p>

</body>
</html>

--===============1413992969052090753==--
