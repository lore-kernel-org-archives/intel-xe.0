Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B53BC10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 15:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27010E2D8;
	Fri,  8 Dec 2023 15:02:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C84BA10E2C8;
 Fri,  8 Dec 2023 15:02:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C114DAA917;
 Fri,  8 Dec 2023 15:02:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6455141769817667333=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Handle_remaining_ifdefs_in_hack_?=
 =?utf-8?q?patch_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 08 Dec 2023 15:02:34 -0000
Message-ID: <170204775478.7325.5950138472100586247@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
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

--===============6455141769817667333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle remaining ifdefs in hack patch (rev3)
URL   : https://patchwork.freedesktop.org/series/127488/
State : success

== Summary ==

CI Bug Log - changes from xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072_BAT -> xe-pw-127488v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127488v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_gt_freq@freq_fixed_idle} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  
New tests
---------

  New tests have been introduced between xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072_BAT and xe-pw-127488v3_BAT:

### New IGT tests (3) ###

  * igt@xe_gt_freq@freq_basic_api:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_gt_freq@freq_fixed_idle:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.34, 1.06] s

  * igt@xe_gt_freq@freq_range_idle:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.11, 1.06] s

  

Known issues
------------

  Here are the changes found in xe-pw-127488v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][2] -> [FAIL][3] ([Intel XE#524])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][4] ([Intel XE#480]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][6] ([Intel XE#999]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7628 -> IGT_7629
  * Linux: xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072 -> xe-pw-127488v3

  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072: 61789dd6d716fdb2ad639ddcc1d88856b6e55072
  xe-pw-127488v3: 127488v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/index.html

--===============6455141769817667333==
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
<tr><td><b>Series:</b></td><td>Handle remaining ifdefs in hack patch (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127488/">https://patchwork.freedesktop.org/series/127488/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072_BAT -&gt; xe-pw-127488v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127488v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_gt_freq@freq_fixed_idle} (NEW):<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072_BAT and xe-pw-127488v3_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.34, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.11, 1.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127488v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-leak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127488v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7628 -&gt; IGT_7629</li>
<li>Linux: xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072 -&gt; xe-pw-127488v3</li>
</ul>
<p>IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072: 61789dd6d716fdb2ad639ddcc1d88856b6e55072<br />
  xe-pw-127488v3: 127488v3</p>

</body>
</html>

--===============6455141769817667333==--
