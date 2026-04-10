Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34381F36BB6
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 06:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D703410E89A;
	Fri, 10 Apr 2026 06:32:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E232210E899;
 Fri, 10 Apr 2026 06:32:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8146707378802435577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_USE_drm_mm_instead_of_drm_S?=
 =?utf-8?q?A_for_CCS_read/write_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 06:32:14 -0000
Message-ID: <177580273489.449443.6110802510966416133@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
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

--===============8146707378802435577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: USE drm mm instead of drm SA for CCS read/write (rev5)
URL   : https://patchwork.freedesktop.org/series/163588/
State : success

== Summary ==

CI Bug Log - changes from xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_BAT -> xe-pw-163588v5_BAT
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

  Here are the changes found in xe-pw-163588v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1 -> xe-pw-163588v5

  IGT_8852: 8852
  xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1: b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1
  xe-pw-163588v5: 163588v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html

--===============8146707378802435577==
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
<tr><td><b>Series:</b></td><td>USE drm mm instead of drm SA for CCS read/write (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163588/">https://patchwork.freedesktop.org/series/163588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_BAT -&gt; xe-pw-163588v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163588v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1 -&gt; xe-pw-163588v5</li>
</ul>
<p>IGT_8852: 8852<br />
  xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1: b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1<br />
  xe-pw-163588v5: 163588v5</p>

</body>
</html>

--===============8146707378802435577==--
