Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4E5C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6F112A9E;
	Mon, 29 Jan 2024 18:55:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B54112A9E;
 Mon, 29 Jan 2024 18:55:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1181835110340964923=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv3=2C1/6?=
 =?utf-8?q?=5D_drm/xe=3A_Add_functions_to_convert_regular_address_to_canonic?=
 =?utf-8?q?al_address_and_back?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 29 Jan 2024 18:55:23 -0000
Message-ID: <170655452369.806401.15315360328802065820@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129181742.183694-1-jose.souza@intel.com>
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1181835110340964923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/6] drm/xe: Add functions to convert regular address to canonical address and back
URL   : https://patchwork.freedesktop.org/series/129278/
State : success

== Summary ==

CI Bug Log - changes from xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6_BAT -> xe-pw-129278v1_BAT
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

  Here are the changes found in xe-pw-129278v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#400] / [Intel XE#616]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129278v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * Linux: xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 -> xe-pw-129278v1

  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6: f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6
  xe-pw-129278v1: 129278v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129278v1/index.html

--===============1181835110340964923==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/6] drm/xe: Add functions to convert regular address to canonical address and back</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129278/">https://patchwork.freedesktop.org/series/129278/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129278v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129278v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6_BAT -&gt; xe-pw-129278v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129278v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129278v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 -&gt; xe-pw-129278v1</li>
</ul>
<p>IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-698-f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6: f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6<br />
  xe-pw-129278v1: 129278v1</p>

</body>
</html>

--===============1181835110340964923==--
