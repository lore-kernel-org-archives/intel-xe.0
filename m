Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2A1EA4FB0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 11:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC3910E36A;
	Mon, 23 Feb 2026 11:23:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82AF10E36A;
 Mon, 23 Feb 2026 11:23:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7295467851691252475=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_memory_leak_i?=
 =?utf-8?q?n_xe=5Fvm=5Fmadvise=5Fioctl_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 11:23:03 -0000
Message-ID: <177184578369.274619.3791530112272825080@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223092815.1500739-1-varun.gupta@intel.com>
In-Reply-To: <20260223092815.1500739-1-varun.gupta@intel.com>
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

--===============7295467851691252475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix memory leak in xe_vm_madvise_ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/161938/
State : success

== Summary ==

CI Bug Log - changes from xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66_BAT -> xe-pw-161938v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-161938v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161938v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66 -> xe-pw-161938v2

  IGT_8765: 8765
  xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66: cec43d5c2696af219fc2ef71dd7e93db48c80f66
  xe-pw-161938v2: 161938v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161938v2/index.html

--===============7295467851691252475==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix memory leak in xe_vm_madvise_ioctl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161938/">https://patchwork.freedesktop.org/series/161938/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161938v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161938v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66_BAT -&gt; xe-pw-161938v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161938v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161938v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66 -&gt; xe-pw-161938v2</li>
</ul>
<p>IGT_8765: 8765<br />
  xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66: cec43d5c2696af219fc2ef71dd7e93db48c80f66<br />
  xe-pw-161938v2: 161938v2</p>

</body>
</html>

--===============7295467851691252475==--
