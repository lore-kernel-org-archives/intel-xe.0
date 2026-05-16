Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4778BCD4F25
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 10:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05D410E19D;
	Sat, 16 May 2026 10:35:26 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5F510E151;
 Sat, 16 May 2026 10:35:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1063621221430346245=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_Xe_PCIe_FLR_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 May 2026 10:35:26 -0000
Message-ID: <177892772624.76852.15253093890970662402@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260516093131.27442-1-raag.jadav@intel.com>
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
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

--===============1063621221430346245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce Xe PCIe FLR (rev7)
URL   : https://patchwork.freedesktop.org/series/162055/
State : success

== Summary ==

CI Bug Log - changes from xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e_BAT -> xe-pw-162055v7_BAT
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

  Here are the changes found in xe-pw-162055v7_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [ABORT][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v7/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  


Build changes
-------------

  * Linux: xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e -> xe-pw-162055v7

  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e: 7e5a51dc7012a8abe09f9232d2c303402875761e
  xe-pw-162055v7: 162055v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v7/index.html

--===============1063621221430346245==
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
<tr><td><b>Series:</b></td><td>Introduce Xe PCIe FLR (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162055/">https://patchwork.freedesktop.org/series/162055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e_BAT -&gt; xe-pw-162055v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162055v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v7/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e -&gt; xe-pw-162055v7</li>
</ul>
<p>IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5072-7e5a51dc7012a8abe09f9232d2c303402875761e: 7e5a51dc7012a8abe09f9232d2c303402875761e<br />
  xe-pw-162055v7: 162055v7</p>

</body>
</html>

--===============1063621221430346245==--
