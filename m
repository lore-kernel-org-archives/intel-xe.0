Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D0EE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539E010E086;
	Fri, 18 Aug 2023 22:44:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3EAD10E086;
 Fri, 18 Aug 2023 22:44:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ABBD1A00CC;
 Fri, 18 Aug 2023 22:44:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7866565278429544626=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 18 Aug 2023 22:44:01 -0000
Message-ID: <169239864166.12741.13296523242427521098@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_Lunar?=
 =?utf-8?q?_Lake_support_=28rev2=29?=
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

--===============7866565278429544626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Lunar Lake support (rev2)
URL   : https://patchwork.freedesktop.org/series/122353/
State : success

== Summary ==

CI Bug Log - changes from xe-327-ddd31145723188b5d7add72fef209f5ceaf27941_BAT -> xe-pw-122353v2_BAT
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

  Here are the changes found in xe-pw-122353v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([i915#1072]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][2] -> [ABORT][3] ([Intel XE#429])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#483]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-dg2-oem2:       [INCOMPLETE][5] ([Intel XE#543]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3:
    - bat-dg2-oem2:       [INCOMPLETE][7] ([Intel XE#545]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html

  
  [Intel XE#429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/429
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/543
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * Linux: xe-327-ddd31145723188b5d7add72fef209f5ceaf27941 -> xe-pw-122353v2

  IGT_7445: 7445
  xe-327-ddd31145723188b5d7add72fef209f5ceaf27941: ddd31145723188b5d7add72fef209f5ceaf27941
  xe-pw-122353v2: 122353v2



--===============7866565278429544626==
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
<tr><td><b>Series:</b></td><td>Add Lunar Lake support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122353/">https://patchwork.freedesktop.org/series/122353/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-327-ddd31145723188b5d7add72fef209f5ceaf27941_BAT -&gt; xe-pw-122353v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122353v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/429">Intel XE#429</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/543">Intel XE#543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-327-ddd31145723188b5d7add72fef209f5ceaf27941/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122353v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-327-ddd31145723188b5d7add72fef209f5ceaf27941 -&gt; xe-pw-122353v2</li>
</ul>
<p>IGT_7445: 7445<br />
  xe-327-ddd31145723188b5d7add72fef209f5ceaf27941: ddd31145723188b5d7add72fef209f5ceaf27941<br />
  xe-pw-122353v2: 122353v2</p>

</body>
</html>

--===============7866565278429544626==--
