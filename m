Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276ECCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 10:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489A10EB90;
	Thu, 26 Sep 2024 10:00:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5410EB90;
 Thu, 26 Sep 2024 10:00:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3772359629779363077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv2=2C1/2?=
 =?utf-8?q?=5D_drm/xe/vm=3A_move_xa=5Falloc_to_prevent_UAF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 10:00:53 -0000
Message-ID: <172734485346.1106239.8516384715840964621@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925071426.144015-3-matthew.auld@intel.com>
In-Reply-To: <20240925071426.144015-3-matthew.auld@intel.com>
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

--===============3772359629779363077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] drm/xe/vm: move xa_alloc to prevent UAF
URL   : https://patchwork.freedesktop.org/series/139079/
State : success

== Summary ==

CI Bug Log - changes from xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da_BAT -> xe-pw-139079v1_BAT
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

  Here are the changes found in xe-pw-139079v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#1861]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_basic@no-exec-userptr-invalidate:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da -> xe-pw-139079v1

  IGT_8032: 8032
  xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da: 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da
  xe-pw-139079v1: 139079v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/index.html

--===============3772359629779363077==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] drm/xe/vm: move xa_alloc to prevent UAF</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139079/">https://patchwork.freedesktop.org/series/139079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da_BAT -&gt; xe-pw-139079v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139079v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139079v1/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da -&gt; xe-pw-139079v1</li>
</ul>
<p>IGT_8032: 8032<br />
  xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da: 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da<br />
  xe-pw-139079v1: 139079v1</p>

</body>
</html>

--===============3772359629779363077==--
