Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EFAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 16:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F74E10F174;
	Tue, 16 Apr 2024 16:17:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB3410F174;
 Tue, 16 Apr 2024 16:17:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1574692291377870553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_L3_bank_mask_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 16:17:26 -0000
Message-ID: <171328424691.1444657.9581720666279020079@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416145037.7-1-francois.dugast@intel.com>
In-Reply-To: <20240416145037.7-1-francois.dugast@intel.com>
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

--===============1574692291377870553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: L3 bank mask (rev3)
URL   : https://patchwork.freedesktop.org/series/132075/
State : success

== Summary ==

CI Bug Log - changes from xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f_BAT -> xe-pw-132075v3_BAT
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

  Here are the changes found in xe-pw-132075v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][1] ([Intel XE#1238]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132075v3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * Linux: xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f -> xe-pw-132075v3

  IGT_7808: 135f9d25b7c2d0d39895a65d052a761b6fed8bf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f: cb0e9220fe7db4b89b7641f09171c7ba7260b35f
  xe-pw-132075v3: 132075v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132075v3/index.html

--===============1574692291377870553==
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
<tr><td><b>Series:</b></td><td>L3 bank mask (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132075/">https://patchwork.freedesktop.org/series/132075/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132075v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132075v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f_BAT -&gt; xe-pw-132075v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132075v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132075v3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f -&gt; xe-pw-132075v3</li>
</ul>
<p>IGT_7808: 135f9d25b7c2d0d39895a65d052a761b6fed8bf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1097-cb0e9220fe7db4b89b7641f09171c7ba7260b35f: cb0e9220fe7db4b89b7641f09171c7ba7260b35f<br />
  xe-pw-132075v3: 132075v3</p>

</body>
</html>

--===============1574692291377870553==--
