Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D00FC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED20110E4B1;
	Tue, 20 Aug 2024 21:35:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC29510E4B1;
 Tue, 20 Aug 2024 21:35:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2661505073315346736=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Free_job_before_xe=5Fe?=
 =?utf-8?q?xec=5Fqueue=5Fput?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 21:35:39 -0000
Message-ID: <172418973983.716728.5705453083231737587@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820202309.1260755-1-matthew.brost@intel.com>
In-Reply-To: <20240820202309.1260755-1-matthew.brost@intel.com>
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

--===============2661505073315346736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Free job before xe_exec_queue_put
URL   : https://patchwork.freedesktop.org/series/137535/
State : success

== Summary ==

CI Bug Log - changes from xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b_BAT -> xe-pw-137535v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137535v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#324]) -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137535v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7979 -> IGT_7981
  * Linux: xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b -> xe-pw-137535v1

  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0feb238bedde6a9d3b
  xe-pw-137535v1: 137535v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137535v1/index.html

--===============2661505073315346736==
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
<tr><td><b>Series:</b></td><td>drm/xe: Free job before xe_exec_queue_put</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137535/">https://patchwork.freedesktop.org/series/137535/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137535v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137535v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b_BAT -&gt; xe-pw-137535v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137535v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137535v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7979 -&gt; IGT_7981</li>
<li>Linux: xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b -&gt; xe-pw-137535v1</li>
</ul>
<p>IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0feb238bedde6a9d3b<br />
  xe-pw-137535v1: 137535v1</p>

</body>
</html>

--===============2661505073315346736==--
