Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B5C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 16:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3959F10E685;
	Wed, 31 Jul 2024 16:25:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128710E685;
 Wed, 31 Jul 2024 16:25:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1948984255846551250=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Export_xe=5Fhw=5Fengin?=
 =?utf-8?q?e=27s_mmio_accessors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 16:25:09 -0000
Message-ID: <172244310952.468618.4376861706916570490@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
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

--===============1948984255846551250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Export xe_hw_engine's mmio accessors
URL   : https://patchwork.freedesktop.org/series/136755/
State : success

== Summary ==

CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -> xe-pw-136755v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136755v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#2196])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136755v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * IGT: IGT_7944 -> IGT_7947
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-pw-136755v1

  IGT_7944: 7944
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-pw-136755v1: 136755v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136755v1/index.html

--===============1948984255846551250==
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
<tr><td><b>Series:</b></td><td>drm/xe: Export xe_hw_engine&#x27;s mmio accessors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136755/">https://patchwork.freedesktop.org/series/136755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136755v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136755v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -&gt; xe-pw-136755v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136755v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136755v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGT_7947</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-pw-136755v1</li>
</ul>
<p>IGT_7944: 7944<br />
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-pw-136755v1: 136755v1</p>

</body>
</html>

--===============1948984255846551250==--
