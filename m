Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF461CE7AA0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 22:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6010510E95D;
	Thu,  5 Sep 2024 22:06:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3E310E95D;
 Thu,  5 Sep 2024 22:06:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5204037886167516480=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Improve_GuC_log_du?=
 =?utf-8?q?mping_and_add_to_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 22:06:49 -0000
Message-ID: <172557400955.952326.2090955748674779917@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
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

--===============5204037886167516480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/137985/
State : failure

== Summary ==

CI Bug Log - changes from xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d_BAT -> xe-pw-137985v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137985v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137985v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137985v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  


Build changes
-------------

  * Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -> xe-pw-137985v2

  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d
  xe-pw-137985v2: 137985v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v2/index.html

--===============5204037886167516480==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137985/">https://patchwork.freedesktop.org/series/137985/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d_BAT -&gt; xe-pw-137985v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137985v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137985v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137985v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-fault:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -&gt; xe-pw-137985v2</li>
</ul>
<p>IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d<br />
  xe-pw-137985v2: 137985v2</p>

</body>
</html>

--===============5204037886167516480==--
