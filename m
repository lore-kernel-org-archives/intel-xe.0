Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA69EE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 18:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9820510E1D1;
	Tue, 22 Aug 2023 18:08:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF57B10E1D1;
 Tue, 22 Aug 2023 18:08:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B947AA73C7;
 Tue, 22 Aug 2023 18:08:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8184258511549209820=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 22 Aug 2023 18:08:44 -0000
Message-ID: <169272772472.20551.10533750039265300934@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_clean_up_kernel_submissions_=28rev4=29?=
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

--===============8184258511549209820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: clean up kernel submissions (rev4)
URL   : https://patchwork.freedesktop.org/series/121470/
State : success

== Summary ==

CI Bug Log - changes from xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615_BAT -> xe-pw-121470v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-121470v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#400]) -> [PASS][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121470v4/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400


Build changes
-------------

  * IGT: IGT_7445 -> IGT_7449
  * Linux: xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615 -> xe-pw-121470v4

  IGT_7445: 7445
  IGT_7449: 7449
  xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615: 779f35314dba1441d29f4cfd510e7beb73c5f615
  xe-pw-121470v4: 121470v4



--===============8184258511549209820==
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
<tr><td><b>Series:</b></td><td>drm/xe: clean up kernel submissions (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121470/">https://patchwork.freedesktop.org/series/121470/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615_BAT -&gt; xe-pw-121470v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121470v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121470v4/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7445 -&gt; IGT_7449</li>
<li>Linux: xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615 -&gt; xe-pw-121470v4</li>
</ul>
<p>IGT_7445: 7445<br />
  IGT_7449: 7449<br />
  xe-329-779f35314dba1441d29f4cfd510e7beb73c5f615: 779f35314dba1441d29f4cfd510e7beb73c5f615<br />
  xe-pw-121470v4: 121470v4</p>

</body>
</html>

--===============8184258511549209820==--
