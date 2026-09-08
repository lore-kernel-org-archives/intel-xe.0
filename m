Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C7C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 00:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F68810E068;
	Tue,  8 Sep 2026 00:41:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DF110E068;
 Tue,  8 Sep 2026 00:41:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4296944196020407341=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/mmio=3A_Fix_xe=5Fmmi?=
 =?utf-8?q?o=5Fwait32=28=29_to_honor_delay/sleep_maximums?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 00:41:12 -0000
Message-ID: <178882807240.130176.1706947444322304221@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
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

--===============4296944196020407341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
URL   : https://patchwork.freedesktop.org/series/173538/
State : success

== Summary ==

CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095_BAT -> xe-pw-173538v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173538v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][1] ([Intel XE#9115]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/bat-ptl-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -> xe-pw-173538v1

  IGT_9085: 9085
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91dc82d2697f596c095
  xe-pw-173538v1: 173538v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/index.html

--===============4296944196020407341==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173538/">https://patchwork.freedesktop.org/series/173538/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095_BAT -&gt; xe-pw-173538v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173538v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -&gt; xe-pw-173538v1</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91dc82d2697f596c095<br />
  xe-pw-173538v1: 173538v1</p>

</body>
</html>

--===============4296944196020407341==--
