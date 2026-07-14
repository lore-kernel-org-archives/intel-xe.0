Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBEDC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 06:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F810E690;
	Tue, 14 Jul 2026 06:50:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B110E690;
 Tue, 14 Jul 2026 06:50:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0253961896623334257=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Disable_displa?=
 =?utf-8?q?y_in_admin_only_PF_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 06:50:49 -0000
Message-ID: <178401184967.186937.10279711596908040683@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714053259.504308-2-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260714053259.504308-2-satyanarayana.k.v.p@intel.com>
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

--===============0253961896623334257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Disable display in admin only PF mode (rev3)
URL   : https://patchwork.freedesktop.org/series/168356/
State : success

== Summary ==

CI Bug Log - changes from xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc_BAT -> xe-pw-168356v3_BAT
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

  Here are the changes found in xe-pw-168356v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-atsm-2:         [FAIL][1] ([Intel XE#8576]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc/bat-atsm-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168356v3/bat-atsm-2/igt@xe_waitfence@engine.html

  
  [Intel XE#8576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8576


Build changes
-------------

  * Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -> xe-pw-168356v3

  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc
  xe-pw-168356v3: 168356v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168356v3/index.html

--===============0253961896623334257==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Disable display in admin only PF mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168356/">https://patchwork.freedesktop.org/series/168356/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168356v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168356v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc_BAT -&gt; xe-pw-168356v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168356v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc/bat-atsm-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8576">Intel XE#8576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168356v3/bat-atsm-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -&gt; xe-pw-168356v3</li>
</ul>
<p>IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc<br />
  xe-pw-168356v3: 168356v3</p>

</body>
</html>

--===============0253961896623334257==--
