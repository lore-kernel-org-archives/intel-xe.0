Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE2C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 22:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC710E046;
	Fri, 26 Jul 2024 22:49:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689CF10E046;
 Fri, 26 Jul 2024 22:49:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0153264136483871872=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Prime_userptr_notifier?=
 =?utf-8?q?_lock_with_reclaim?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 22:49:43 -0000
Message-ID: <172203418342.387310.2569448011058286563@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726215322.2108865-1-matthew.brost@intel.com>
In-Reply-To: <20240726215322.2108865-1-matthew.brost@intel.com>
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

--===============0153264136483871872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Prime userptr notifier lock with reclaim
URL   : https://patchwork.freedesktop.org/series/136579/
State : success

== Summary ==

CI Bug Log - changes from xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128_BAT -> xe-pw-136579v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136579v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#2196]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128 -> xe-pw-136579v1

  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128: 74f391125fd70bda2e8a3b2579f9d30e9689a128
  xe-pw-136579v1: 136579v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/index.html

--===============0153264136483871872==
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
<tr><td><b>Series:</b></td><td>drm/xe: Prime userptr notifier lock with reclaim</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136579/">https://patchwork.freedesktop.org/series/136579/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128_BAT -&gt; xe-pw-136579v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136579v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136579v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128 -&gt; xe-pw-136579v1</li>
</ul>
<p>IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1675-74f391125fd70bda2e8a3b2579f9d30e9689a128: 74f391125fd70bda2e8a3b2579f9d30e9689a128<br />
  xe-pw-136579v1: 136579v1</p>

</body>
</html>

--===============0153264136483871872==--
