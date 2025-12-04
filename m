Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C159DD21687
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 15:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691CC10E946;
	Thu,  4 Dec 2025 15:20:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5D710E8FE;
 Thu,  4 Dec 2025 15:20:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8533498994604013718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fs=3A_PM=3A_Fix_reverse_che?=
 =?utf-8?q?ck_in_filesystems=5Ffreeze=5Fcallback=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 15:20:49 -0000
Message-ID: <176486164944.58573.6763877262802634701@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251203135551.2629298-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251203135551.2629298-1-chaitanya.kumar.borah@intel.com>
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

--===============8533498994604013718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fs: PM: Fix reverse check in filesystems_freeze_callback() (rev2)
URL   : https://patchwork.freedesktop.org/series/158444/
State : success

== Summary ==

CI Bug Log - changes from xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a_BAT -> xe-pw-158444v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158444v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][3] ([Intel XE#6506]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#6519]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8654 -> IGT_8655
  * Linux: xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a -> xe-pw-158444v2

  IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8655: 8655
  xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a: 4eb27c4b4b45606c79769918ab8736249f94035a
  xe-pw-158444v2: 158444v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/index.html

--===============8533498994604013718==
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
<tr><td><b>Series:</b></td><td>fs: PM: Fix reverse check in filesystems_freeze_callback() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158444/">https://patchwork.freedesktop.org/series/158444/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a_BAT -&gt; xe-pw-158444v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158444v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158444v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8654 -&gt; IGT_8655</li>
<li>Linux: xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a -&gt; xe-pw-158444v2</li>
</ul>
<p>IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8655: 8655<br />
  xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a: 4eb27c4b4b45606c79769918ab8736249f94035a<br />
  xe-pw-158444v2: 158444v2</p>

</body>
</html>

--===============8533498994604013718==--
