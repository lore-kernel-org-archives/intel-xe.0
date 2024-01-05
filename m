Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C6C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 10:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E69310E5C6;
	Fri,  5 Jan 2024 10:44:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898F910E59A;
 Fri,  5 Jan 2024 10:44:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6987760334217831731=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_mocs_reset_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Fri, 05 Jan 2024 10:44:36 -0000
Message-ID: <170445147655.39691.15574320250599494804@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
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

--===============6987760334217831731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add mocs reset kunit
URL   : https://patchwork.freedesktop.org/series/128000/
State : success

== Summary ==

CI Bug Log - changes from xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a_BAT -> xe-pw-128000v1_BAT
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

  Here are the changes found in xe-pw-128000v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#672]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-dg2-oem2/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [SKIP][3] ([Intel XE#672]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-atsm-2/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][9] ([Intel XE#1033]) -> [DMESG-WARN][10] ([Intel XE#1033])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672


Build changes
-------------

  * IGT: IGT_7651 -> IGT_7657
  * Linux: xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a -> xe-pw-128000v1

  IGT_7651: 02fa4cf8bcbb15f1641e862fa83e2182c6f73a63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7657: e43732850c6fa590d4a26413289be4edbbdcaaac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a
  xe-pw-128000v1: 128000v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/index.html

--===============6987760334217831731==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add mocs reset kunit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128000/">https://patchwork.freedesktop.org/series/128000/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a_BAT -&gt; xe-pw-128000v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128000v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128000v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7651 -&gt; IGT_7657</li>
<li>Linux: xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a -&gt; xe-pw-128000v1</li>
</ul>
<p>IGT_7651: 02fa4cf8bcbb15f1641e862fa83e2182c6f73a63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7657: e43732850c6fa590d4a26413289be4edbbdcaaac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a<br />
  xe-pw-128000v1: 128000v1</p>

</body>
</html>

--===============6987760334217831731==--
