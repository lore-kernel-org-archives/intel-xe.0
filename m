Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07776CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 14:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8740A10EAEA;
	Fri,  7 Nov 2025 14:57:34 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D307A10E0D2;
 Fri,  7 Nov 2025 14:57:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8496764408856573033=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/dp=5Fmst=3A_Disabl?=
 =?utf-8?q?e_Panel_Replay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 14:57:33 -0000
Message-ID: <176252745385.28862.15146616360821548161@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107124141.911895-1-imre.deak@intel.com>
In-Reply-To: <20251107124141.911895-1-imre.deak@intel.com>
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

--===============8496764408856573033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Disable Panel Replay
URL   : https://patchwork.freedesktop.org/series/157224/
State : failure

== Summary ==

CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_BAT -> xe-pw-157224v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-157224v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157224v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157224v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-lnl-2:          [ABORT][1] ([Intel XE#6541]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html

  
  [Intel XE#6541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541


Build changes
-------------

  * Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -> xe-pw-157224v1

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160
  xe-pw-157224v1: 157224v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html

--===============8496764408856573033==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Disable Panel Replay</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157224/">https://patchwork.freedesktop.org/series/157224/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_BAT -&gt; xe-pw-157224v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-157224v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157224v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157224v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -&gt; xe-pw-157224v1</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160<br />
  xe-pw-157224v1: 157224v1</p>

</body>
</html>

--===============8496764408856573033==--
