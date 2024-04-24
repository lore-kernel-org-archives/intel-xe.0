Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C1C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 20:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9672B11206C;
	Wed, 24 Apr 2024 20:12:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9280711206C;
 Wed, 24 Apr 2024 20:12:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5766324292721320397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Prep_patches_for_1_job_per_VM_bi?=
 =?utf-8?q?nd_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 20:12:09 -0000
Message-ID: <171398952959.1632086.13787878307124970898@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424172352.1704851-1-matthew.brost@intel.com>
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
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

--===============5766324292721320397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prep patches for 1 job per VM bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/132246/
State : failure

== Summary ==

CI Bug Log - changes from xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8_BAT -> xe-pw-132246v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132246v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132246v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132246v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_fault_mode@twice-basic:
    - {bat-lnl-1}:        [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8 -> xe-pw-132246v2

  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8
  xe-pw-132246v2: 132246v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/index.html

--===============5766324292721320397==
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
<tr><td><b>Series:</b></td><td>Prep patches for 1 job per VM bind IOCTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132246/">https://patchwork.freedesktop.org/series/132246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8_BAT -&gt; xe-pw-132246v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132246v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132246v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132246v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132246v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8 -&gt; xe-pw-132246v2</li>
</ul>
<p>IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8<br />
  xe-pw-132246v2: 132246v2</p>

</body>
</html>

--===============5766324292721320397==--
