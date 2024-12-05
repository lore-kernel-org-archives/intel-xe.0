Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FD9E7716D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 14:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A81410EE7F;
	Thu,  5 Dec 2024 14:00:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFC10EE7F;
 Thu,  5 Dec 2024 14:00:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4095812939969982246=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BRFC?=
 =?utf-8?q?=2C1/2=5D_drm/xe=3A_Add_madvise_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 14:00:13 -0000
Message-ID: <173340721311.2986419.3758136124578020489@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205104620.456353-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241205104620.456353-1-himal.prasad.ghimiray@intel.com>
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

--===============4095812939969982246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [RFC,1/2] drm/xe: Add madvise interface
URL   : https://patchwork.freedesktop.org/series/142164/
State : success

== Summary ==

CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760d899ae2_BAT -> xe-pw-142164v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142164v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][1] ([Intel XE#2229])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [DMESG-WARN][2] ([Intel XE#877]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [SKIP][4] ([Intel XE#1192]) -> [PASS][5] +2 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -> xe-pw-142164v1

  IGT_8138: 8138
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e80658ab760d899ae2
  xe-pw-142164v1: 142164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/index.html

--===============4095812939969982246==
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
<tr><td><b>Series:</b></td><td>series starting with [RFC,1/2] drm/xe: Add madvise interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142164/">https://patchwork.freedesktop.org/series/142164/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760d899ae2_BAT -&gt; xe-pw-142164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142164v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -&gt; xe-pw-142164v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e80658ab760d899ae2<br />
  xe-pw-142164v1: 142164v1</p>

</body>
</html>

--===============4095812939969982246==--
