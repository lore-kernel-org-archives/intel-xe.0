Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBACD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 18:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C8011374D;
	Mon,  1 Jun 2026 18:40:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FAE11374D;
 Mon,  1 Jun 2026 18:40:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4268695055787555863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fmigrate=3A_Fix_?=
 =?utf-8?q?memory_corruption_with_unaligned_dst_in_MEM=5FCOPY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 18:40:06 -0000
Message-ID: <178033920673.32237.4675042476123370538@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601152056.2413514-1-jan.maslak@intel.com>
In-Reply-To: <20260601152056.2413514-1-jan.maslak@intel.com>
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

--===============4268695055787555863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY
URL   : https://patchwork.freedesktop.org/series/167675/
State : success

== Summary ==

CI Bug Log - changes from xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT -> xe-pw-167675v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167675v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
New tests
---------

  New tests have been introduced between xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT and xe-pw-167675v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - Statuses : 4 pass(s) 8 skip(s)
    - Exec time: [0.01, 63.67] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c -> xe-pw-167675v1

  IGT_8943: 8943
  xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c: b64812e86f4a787e10be1ab9f48b9e6dab23376c
  xe-pw-167675v1: 167675v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/index.html

--===============4268695055787555863==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167675/">https://patchwork.freedesktop.org/series/167675/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT -&gt; xe-pw-167675v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167675v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit} (NEW):<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT and xe-pw-167675v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>Statuses : 4 pass(s) 8 skip(s)</li>
<li>Exec time: [0.01, 63.67] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c -&gt; xe-pw-167675v1</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c: b64812e86f4a787e10be1ab9f48b9e6dab23376c<br />
  xe-pw-167675v1: 167675v1</p>

</body>
</html>

--===============4268695055787555863==--
