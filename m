Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F8FCA5FFE
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 01:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B1B10E086;
	Tue,  6 Oct 2026 01:14:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45F710E086;
 Tue,  6 Oct 2026 01:14:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0878977932997727476=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/i2c=3A_cancel_the_cl?=
 =?utf-8?q?ient_work_on_remove_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 01:14:31 -0000
Message-ID: <179124927173.242127.18162922774045551133@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006000413.318561-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261006000413.318561-2-rodrigo.vivi@intel.com>
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

--===============0878977932997727476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/i2c: cancel the client work on remove (rev2)
URL   : https://patchwork.freedesktop.org/series/175464/
State : success

== Summary ==

CI Bug Log - changes from xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326_BAT -> xe-pw-175464v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175464v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-wcl-1:          [SKIP][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-wcl-1:          [FAIL][5] -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326 -> xe-pw-175464v2

  IGT_9130: 9130
  xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326: 8c3a206e2315b84f2d349b180c297a807d31b326
  xe-pw-175464v2: 175464v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/index.html

--===============0878977932997727476==
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
<tr><td><b>Series:</b></td><td>drm/xe/i2c: cancel the client work on remove (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175464/">https://patchwork.freedesktop.org/series/175464/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326_BAT -&gt; xe-pw-175464v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175464v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175464v2/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326 -&gt; xe-pw-175464v2</li>
</ul>
<p>IGT_9130: 9130<br />
  xe-5892-8c3a206e2315b84f2d349b180c297a807d31b326: 8c3a206e2315b84f2d349b180c297a807d31b326<br />
  xe-pw-175464v2: 175464v2</p>

</body>
</html>

--===============0878977932997727476==--
