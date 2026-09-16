Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB18BC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 22:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7287810E1F1;
	Wed, 16 Sep 2026 22:55:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD89E10E1F1;
 Wed, 16 Sep 2026 22:55:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5173298595474416371=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Move_locking_t?=
 =?utf-8?q?o_xe=5Fsriov=5Fpf=5Freprovision=5Fdefault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 22:55:08 -0000
Message-ID: <178959930890.174773.10803204328783335937@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916212949.13120-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260916212949.13120-1-michal.wajdeczko@intel.com>
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

--===============5173298595474416371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Move locking to xe_sriov_pf_reprovision_default
URL   : https://patchwork.freedesktop.org/series/174369/
State : success

== Summary ==

CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -> xe-pw-174369v1_BAT
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

  Here are the changes found in xe-pw-174369v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9115])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-wcl-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/bat-wcl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -> xe-pw-174369v1

  IGT_9099: 9099
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5
  xe-pw-174369v1: 174369v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/index.html

--===============5173298595474416371==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Move locking to xe_sriov_pf_reprovision_default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174369/">https://patchwork.freedesktop.org/series/174369/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -&gt; xe-pw-174369v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174369v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174369v1/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -&gt; xe-pw-174369v1</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5<br />
  xe-pw-174369v1: 174369v1</p>

</body>
</html>

--===============5173298595474416371==--
