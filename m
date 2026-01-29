Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E45D6100A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 11:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22A510E102;
	Thu, 29 Jan 2026 11:30:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594B810E102;
 Thu, 29 Jan 2026 11:30:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6155188247234194120=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_i915/i915=5Fdriver=3A_move_?=
 =?utf-8?q?intel=5Fgvt=5Finit=28=29_level_higher_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 11:30:01 -0000
Message-ID: <176968620136.205652.3690838066824379701@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129090129.2601661-1-michal.grzelak@intel.com>
In-Reply-To: <20260129090129.2601661-1-michal.grzelak@intel.com>
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

--===============6155188247234194120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_driver: move intel_gvt_init() level higher (rev2)
URL   : https://patchwork.freedesktop.org/series/160787/
State : failure

== Summary ==

CI Bug Log - changes from xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578_BAT -> xe-pw-160787v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160787v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160787v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160787v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578/bat-bmg-3/igt@xe_peer2peer@read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160787v2/bat-bmg-3/igt@xe_peer2peer@read.html

  


Build changes
-------------

  * Linux: xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578 -> xe-pw-160787v2

  IGT_8724: 6a10d1136a4e856cc4ceb5b899c32b03ed8ddc5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578: a13ec0c1edcbd6228db6236164902b8188a9a578
  xe-pw-160787v2: 160787v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160787v2/index.html

--===============6155188247234194120==
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
<tr><td><b>Series:</b></td><td>i915/i915_driver: move intel_gvt_init() level higher (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160787/">https://patchwork.freedesktop.org/series/160787/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160787v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160787v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578_BAT -&gt; xe-pw-160787v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160787v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160787v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160787v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_peer2peer@read:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160787v2/bat-bmg-3/igt@xe_peer2peer@read.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578 -&gt; xe-pw-160787v2</li>
</ul>
<p>IGT_8724: 6a10d1136a4e856cc4ceb5b899c32b03ed8ddc5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4468-a13ec0c1edcbd6228db6236164902b8188a9a578: a13ec0c1edcbd6228db6236164902b8188a9a578<br />
  xe-pw-160787v2: 160787v2</p>

</body>
</html>

--===============6155188247234194120==--
