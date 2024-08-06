Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE986C52D71
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 15:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77610E3A7;
	Tue,  6 Aug 2024 15:42:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5610E14B;
 Tue,  6 Aug 2024 15:42:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7536729298020542961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_GuC_based_regi?=
 =?utf-8?q?ster_capture_for_error_capture_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 15:42:22 -0000
Message-ID: <172295894228.543564.1688871675457357079@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806145704.165231-1-zhanjun.dong@intel.com>
In-Reply-To: <20240806145704.165231-1-zhanjun.dong@intel.com>
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

--===============7536729298020542961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev15)
URL   : https://patchwork.freedesktop.org/series/128077/
State : success

== Summary ==

CI Bug Log - changes from xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8_BAT -> xe-pw-128077v15_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-128077v15_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v15/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8 -> xe-pw-128077v15

  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8: fbea69172f4a0da3170a3fa7f444d3924eef30e8
  xe-pw-128077v15: 128077v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v15/index.html

--===============7536729298020542961==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add GuC based register capture for error capture (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128077/">https://patchwork.freedesktop.org/series/128077/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v15/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8_BAT -&gt; xe-pw-128077v15_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128077v15_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v15/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8 -&gt; xe-pw-128077v15</li>
</ul>
<p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1721-fbea69172f4a0da3170a3fa7f444d3924eef30e8: fbea69172f4a0da3170a3fa7f444d3924eef30e8<br />
  xe-pw-128077v15: 128077v15</p>

</body>
</html>

--===============7536729298020542961==--
