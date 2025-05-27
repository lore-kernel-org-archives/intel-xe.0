Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDA5C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 13:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607910E4F9;
	Tue, 27 May 2025 13:58:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DF110E4F0;
 Tue, 27 May 2025 13:58:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8169260598896313788=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/svm=3A_Avoid_duplicate_eviction_on_get=5Fpages=28=29_f?=
 =?utf-8?q?ailure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 13:58:06 -0000
Message-ID: <174835428633.24233.16184231580107586170@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
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

--===============8169260598896313788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/svm: Avoid duplicate eviction on get_pages() failure
URL   : https://patchwork.freedesktop.org/series/149506/
State : success

== Summary ==

CI Bug Log - changes from xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba_BAT -> xe-pw-149506v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-149506v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * Linux: xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba -> xe-pw-149506v1

  IGT_8380: 8380
  xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba: 1ba472d34ab7f4d19d74cb93f53622fb940de8ba
  xe-pw-149506v1: 149506v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/index.html

--===============8169260598896313788==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/svm: Avoid duplicate eviction on get_pages() failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149506/">https://patchwork.freedesktop.org/series/149506/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba_BAT -&gt; xe-pw-149506v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149506v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba -&gt; xe-pw-149506v1</li>
</ul>
<p>IGT_8380: 8380<br />
  xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba: 1ba472d34ab7f4d19d74cb93f53622fb940de8ba<br />
  xe-pw-149506v1: 149506v1</p>

</body>
</html>

--===============8169260598896313788==--
