Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66352CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 22:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7BC10E3A3;
	Tue,  9 Jun 2026 22:06:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1146B10E3A3;
 Tue,  9 Jun 2026 22:06:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5668933222678339188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Probe_info_outsid?=
 =?utf-8?q?e_of_xe=5Finfo=5Finit=28=29_and_xe=5Finfo=5Finit=5Fearly=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 22:06:15 -0000
Message-ID: <178104277506.62628.7886256685578923888@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
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

--===============5668933222678339188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Probe info outside of xe_info_init() and xe_info_init_early()
URL   : https://patchwork.freedesktop.org/series/168205/
State : success

== Summary ==

CI Bug Log - changes from xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a_BAT -> xe-pw-168205v1_BAT
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

  Here are the changes found in xe-pw-168205v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] ([Intel XE#8017])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/bat-bmg-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/bat-bmg-1/igt@xe_waitfence@reltime.html
    - bat-bmg-2:          [PASS][3] -> [FAIL][4] ([Intel XE#8017])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/bat-bmg-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/bat-bmg-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017


Build changes
-------------

  * Linux: xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a -> xe-pw-168205v1

  IGT_8956: 8956
  xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a: 3806de1666bcca0525d737e3849c602cbe98fb1a
  xe-pw-168205v1: 168205v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html

--===============5668933222678339188==
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
<tr><td><b>Series:</b></td><td>drm/xe: Probe info outside of xe_info_init() and xe_info_init_early()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168205/">https://patchwork.freedesktop.org/series/168205/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a_BAT -&gt; xe-pw-168205v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168205v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/bat-bmg-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/bat-bmg-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017">Intel XE#8017</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/bat-bmg-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/bat-bmg-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017">Intel XE#8017</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a -&gt; xe-pw-168205v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a: 3806de1666bcca0525d737e3849c602cbe98fb1a<br />
  xe-pw-168205v1: 168205v1</p>

</body>
</html>

--===============5668933222678339188==--
