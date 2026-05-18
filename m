Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB2CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 17:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F24310E916;
	Mon, 18 May 2026 17:00:02 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41010E8F8;
 Mon, 18 May 2026 17:00:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7566104588359824879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/bw=3A_Split_bandwi?=
 =?utf-8?q?dth_params_into_platform-_and_display-IP-specific_structs_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 May 2026 17:00:01 -0000
Message-ID: <177912360157.80757.7736052130608147582@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
In-Reply-To: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
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

--===============7566104588359824879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/bw: Split bandwidth params into platform- and display-IP-specific structs (rev3)
URL   : https://patchwork.freedesktop.org/series/166340/
State : success

== Summary ==

CI Bug Log - changes from xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc_BAT -> xe-pw-166340v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-166340v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * Linux: xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc -> xe-pw-166340v3

  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc: dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc
  xe-pw-166340v3: 166340v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v3/index.html

--===============7566104588359824879==
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
<tr><td><b>Series:</b></td><td>drm/i915/bw: Split bandwidth params into platform- and display-IP-specific structs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166340/">https://patchwork.freedesktop.org/series/166340/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc_BAT -&gt; xe-pw-166340v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166340v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v3/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc -&gt; xe-pw-166340v3</li>
</ul>
<p>IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5082-dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc: dd6c69e211ead406faa36e4e2ec21f2ad8b75bbc<br />
  xe-pw-166340v3: 166340v3</p>

</body>
</html>

--===============7566104588359824879==--
