Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87807EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 12:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C8510E23E;
	Mon, 21 Aug 2023 12:43:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8210E23E;
 Mon, 21 Aug 2023 12:43:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 14BCFAADF4;
 Mon, 21 Aug 2023 12:43:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4655348047143152287=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Mon, 21 Aug 2023 12:43:16 -0000
Message-ID: <169262179605.22809.1751011577098826164@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_vram_?=
 =?utf-8?q?frequency_sysfs_attributes?=
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

--===============4655348047143152287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vram frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/122699/
State : success

== Summary ==

CI Bug Log - changes from xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615_BAT -> xe-pw-122699v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): bat-atsm-2 

Known issues
------------

  Here are the changes found in xe-pw-122699v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#400]) -> [PASS][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122699v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400


Build changes
-------------

  * IGT: IGT_7445 -> IGT_7448
  * Linux: xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615 -> xe-pw-122699v1

  IGT_7445: 7445
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615: 779f35314dba1441d29f4cfd510e7beb73c5f615
  xe-pw-122699v1: 122699v1



--===============4655348047143152287==
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
<tr><td><b>Series:</b></td><td>Add vram frequency sysfs attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122699/">https://patchwork.freedesktop.org/series/122699/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615_BAT -&gt; xe-pw-122699v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122699v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122699v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7445 -&gt; IGT_7448</li>
<li>Linux: xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615 -&gt; xe-pw-122699v1</li>
</ul>
<p>IGT_7445: 7445<br />
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615: 779f35314dba1441d29f4cfd510e7beb73c5f615<br />
  xe-pw-122699v1: 122699v1</p>

</body>
</html>

--===============4655348047143152287==--
