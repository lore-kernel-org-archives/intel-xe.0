Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FED10F3DCE
	for <intel-xe@archiver.kernel.org>; Sat, 28 Mar 2026 13:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A1810E075;
	Sat, 28 Mar 2026 13:23:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C8D10E059;
 Sat, 28 Mar 2026 13:23:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4683565804076346106=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/uc=3A_Track_uc_firm?=
 =?utf-8?q?ware_state_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Mar 2026 13:23:40 -0000
Message-ID: <177470422077.409290.1243429245960381440@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327202407.563-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260327202407.563-1-michal.wajdeczko@intel.com>
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

--===============4683565804076346106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Track uc firmware state changes
URL   : https://patchwork.freedesktop.org/series/164018/
State : success

== Summary ==

CI Bug Log - changes from xe-4811-d699fa2d9776038b13f7b8153738a850676d0641_FULL -> xe-pw-164018v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164018v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4811-d699fa2d9776038b13f7b8153738a850676d0641/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#7340])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4811-d699fa2d9776038b13f7b8153738a850676d0641/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * Linux: xe-4811-d699fa2d9776038b13f7b8153738a850676d0641 -> xe-pw-164018v1

  IGT_8834: 8834
  xe-4811-d699fa2d9776038b13f7b8153738a850676d0641: d699fa2d9776038b13f7b8153738a850676d0641
  xe-pw-164018v1: 164018v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/index.html

--===============4683565804076346106==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Track uc firmware state changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164018/">https://patchwork.freedesktop.org/series/164018/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4811-d699fa2d9776038b13f7b8153738a850676d0641_FULL -&gt; xe-pw-164018v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164018v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4811-d699fa2d9776038b13f7b8153738a850676d0641/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4811-d699fa2d9776038b13f7b8153738a850676d0641/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164018v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4811-d699fa2d9776038b13f7b8153738a850676d0641 -&gt; xe-pw-164018v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4811-d699fa2d9776038b13f7b8153738a850676d0641: d699fa2d9776038b13f7b8153738a850676d0641<br />
  xe-pw-164018v1: 164018v1</p>

</body>
</html>

--===============4683565804076346106==--
