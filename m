Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15852C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 13:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED0F10E498;
	Wed, 14 Aug 2024 13:50:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08EF10E4A0;
 Wed, 14 Aug 2024 13:50:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2501732508879476090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_add_wopcm_device_info_?=
 =?utf-8?q?and_set_region_into_Guc_registers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 13:50:09 -0000
Message-ID: <172364340964.632722.4455972362549876749@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814120432.2040511-1-fkassabri@habana.ai>
In-Reply-To: <20240814120432.2040511-1-fkassabri@habana.ai>
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

--===============2501732508879476090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add wopcm device info and set region into Guc registers (rev3)
URL   : https://patchwork.freedesktop.org/series/133879/
State : success

== Summary ==

CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_BAT -> xe-pw-133879v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vf 

Known issues
------------

  Here are the changes found in xe-pw-133879v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] ([Intel XE#1760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/bat-adlp-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/bat-adlp-7/igt@xe_module_load@load.html

  
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760


Build changes
-------------

  * IGT: IGT_7968 -> IGT_7969
  * Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -> xe-pw-133879v3

  IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6
  xe-pw-133879v3: 133879v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/index.html

--===============2501732508879476090==
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
<tr><td><b>Series:</b></td><td>drm/xe: add wopcm device info and set region into Guc registers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133879/">https://patchwork.freedesktop.org/series/133879/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_BAT -&gt; xe-pw-133879v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vf </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133879v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7968 -&gt; IGT_7969</li>
<li>Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -&gt; xe-pw-133879v3</li>
</ul>
<p>IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6<br />
  xe-pw-133879v3: 133879v3</p>

</body>
</html>

--===============2501732508879476090==--
