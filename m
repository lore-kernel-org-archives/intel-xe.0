Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFFC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 11:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FCB10E216;
	Fri,  9 Feb 2024 11:54:05 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C24810E216;
 Fri,  9 Feb 2024 11:54:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5206004685079936110=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_XE_HDCP_Enablement_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Feb 2024 11:54:03 -0000
Message-ID: <170747964344.1128958.6829646400041808658@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209101412.1326176-1-suraj.kandpal@intel.com>
In-Reply-To: <20240209101412.1326176-1-suraj.kandpal@intel.com>
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

--===============5206004685079936110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: XE HDCP Enablement (rev4)
URL   : https://patchwork.freedesktop.org/series/129457/
State : failure

== Summary ==

CI Bug Log - changes from xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb_BAT -> xe-pw-129457v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129457v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129457v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129457v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v4/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  


Build changes
-------------

  * Linux: xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb -> xe-pw-129457v4

  IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb
  xe-pw-129457v4: 129457v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v4/index.html

--===============5206004685079936110==
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
<tr><td><b>Series:</b></td><td>XE HDCP Enablement (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129457/">https://patchwork.freedesktop.org/series/129457/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb_BAT -&gt; xe-pw-129457v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129457v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129457v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129457v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v4/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb -&gt; xe-pw-129457v4</li>
</ul>
<p>IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb<br />
  xe-pw-129457v4: 129457v4</p>

</body>
</html>

--===============5206004685079936110==--
