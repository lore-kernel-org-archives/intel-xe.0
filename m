Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DECCEC8734
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D210E802;
	Thu,  7 Sep 2023 14:50:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 495D610E7FC;
 Thu,  7 Sep 2023 14:50:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4ABF8AADE0;
 Thu,  7 Sep 2023 14:50:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4471672828559001713=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Sep 2023 14:50:35 -0000
Message-ID: <169409823530.17902.5345013779937408086@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Convert_to_drm=5Fexec_=28rev5=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4471672828559001713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert to drm_exec (rev5)
URL   : https://patchwork.freedesktop.org/series/123100/
State : failure

== Summary ==

CI Bug Log - changes from xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1_BAT -> xe-pw-123100v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123100v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123100v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123100v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_evict@evict-mixed-threads-small:
    - {bat-pvc-2}:        [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html

  
Known issues
------------

  Here are the changes found in xe-pw-123100v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7472 -> IGT_7474
  * Linux: xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1 -> xe-pw-123100v5

  IGT_7472: b9d6f8dd0f69d0091e349ddc9d9f1425b2f36ec9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1: bae46e59a7f667734376ddb0d2451967dfb264f1
  xe-pw-123100v5: 123100v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/index.html

--===============4471672828559001713==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert to drm_exec (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123100/">https://patchwork.freedesktop.org/series/123100/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1_BAT -&gt; xe-pw-123100v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123100v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123100v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123100v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small:<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123100v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v5/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7472 -&gt; IGT_7474</li>
<li>Linux: xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1 -&gt; xe-pw-123100v5</li>
</ul>
<p>IGT_7472: b9d6f8dd0f69d0091e349ddc9d9f1425b2f36ec9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1: bae46e59a7f667734376ddb0d2451967dfb264f1<br />
  xe-pw-123100v5: 123100v5</p>

</body>
</html>

--===============4471672828559001713==--
