Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692ABE69183
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 17:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3910EBFE;
	Fri, 22 Nov 2024 17:15:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EA310E306;
 Fri, 22 Nov 2024 17:15:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9098828348504576923=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_drm/xe/trace=3A_improve_xe=5Fsched=5Fmsg_trace?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 17:15:16 -0000
Message-ID: <173229571628.1766149.6288292222787945402@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122161914.321263-4-matthew.auld@intel.com>
In-Reply-To: <20241122161914.321263-4-matthew.auld@intel.com>
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

--===============9098828348504576923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/trace: improve xe_sched_msg trace
URL   : https://patchwork.freedesktop.org/series/141705/
State : success

== Summary ==

CI Bug Log - changes from xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a_BAT -> xe-pw-141705v1_BAT
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

  Here are the changes found in xe-pw-141705v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3517])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3429]) +31 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#1861])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#455]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8122 -> IGT_8123
  * Linux: xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a -> xe-pw-141705v1

  IGT_8122: 8122
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a: a381faddbfc974e7bd57efe953a738415afccd6a
  xe-pw-141705v1: 141705v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/index.html

--===============9098828348504576923==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/trace: improve xe_sched_msg trace</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141705/">https://patchwork.freedesktop.org/series/141705/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a_BAT -&gt; xe-pw-141705v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141705v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141705v1/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8122 -&gt; IGT_8123</li>
<li>Linux: xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a -&gt; xe-pw-141705v1</li>
</ul>
<p>IGT_8122: 8122<br />
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a: a381faddbfc974e7bd57efe953a738415afccd6a<br />
  xe-pw-141705v1: 141705v1</p>

</body>
</html>

--===============9098828348504576923==--
