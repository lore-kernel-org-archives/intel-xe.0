Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17F6C369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 18:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219F10E23F;
	Fri, 18 Apr 2025 18:09:13 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8B10E23F;
 Fri, 18 Apr 2025 18:09:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2926591246994779047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/gsc=3A_test_new_GSC_?=
 =?utf-8?q?104=2E0=2E5=2E1429_for_LNL_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 18:09:11 -0000
Message-ID: <174499975155.18231.11422607294247820319@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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

--===============2926591246994779047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: test new GSC 104.0.5.1429 for LNL (rev3)
URL   : https://patchwork.freedesktop.org/series/147859/
State : success

== Summary ==

CI Bug Log - changes from xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d_BAT -> xe-pw-147859v3_BAT
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

  Here are the changes found in xe-pw-147859v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4829]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#4829]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
  [Intel XE#4829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829


Build changes
-------------

  * Linux: xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d -> xe-pw-147859v3

  IGT_8328: 8328
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73b965292d036c97e9d
  xe-pw-147859v3: 147859v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/index.html

--===============2926591246994779047==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: test new GSC 104.0.5.1429 for LNL (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147859/">https://patchwork.freedesktop.org/series/147859/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d_BAT -&gt; xe-pw-147859v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147859v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d -&gt; xe-pw-147859v3</li>
</ul>
<p>IGT_8328: 8328<br />
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73b965292d036c97e9d<br />
  xe-pw-147859v3: 147859v3</p>

</body>
</html>

--===============2926591246994779047==--
