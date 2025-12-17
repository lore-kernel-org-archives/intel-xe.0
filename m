Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E834DD65C7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 16:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EF710E07B;
	Wed, 17 Dec 2025 16:23:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6CB10E07B;
 Wed, 17 Dec 2025 16:23:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7719011336575385277=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_NULL_pointer_?=
 =?utf-8?q?dereference_in_xe=5Fexec=5Fioctl_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 16:23:26 -0000
Message-ID: <176598860631.97606.3663540238019534994@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217061728.35768-1-tapani.palli@intel.com>
In-Reply-To: <20251217061728.35768-1-tapani.palli@intel.com>
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

--===============7719011336575385277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix NULL pointer dereference in xe_exec_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/159132/
State : success

== Summary ==

CI Bug Log - changes from xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395_BAT -> xe-pw-159132v3_BAT
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

  Here are the changes found in xe-pw-159132v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159132v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395 -> xe-pw-159132v3

  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395: 810ba5ee6a71b54b99289f397e8ca9147047c395
  xe-pw-159132v3: 159132v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159132v3/index.html

--===============7719011336575385277==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix NULL pointer dereference in xe_exec_ioctl (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159132/">https://patchwork.freedesktop.org/series/159132/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159132v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159132v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395_BAT -&gt; xe-pw-159132v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159132v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159132v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395 -&gt; xe-pw-159132v3</li>
</ul>
<p>IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4257-810ba5ee6a71b54b99289f397e8ca9147047c395: 810ba5ee6a71b54b99289f397e8ca9147047c395<br />
  xe-pw-159132v3: 159132v3</p>

</body>
</html>

--===============7719011336575385277==--
