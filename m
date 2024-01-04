Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A2AC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 12:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7AE10E481;
	Thu,  4 Jan 2024 12:43:42 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD93410E47F;
 Thu,  4 Jan 2024 12:43:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2403915384891946890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv2=2C1/3?=
 =?utf-8?q?=5D_drm/xe=3A_Remove_ci-only_GuC_FW_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 04 Jan 2024 12:43:41 -0000
Message-ID: <170437222190.20586.5622531205853096951@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
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

--===============2403915384891946890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/xe: Remove ci-only GuC FW definitions
URL   : https://patchwork.freedesktop.org/series/127987/
State : success

== Summary ==

CI Bug Log - changes from xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a_BAT -> xe-pw-127987v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-127987v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1100])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  
  [Intel XE#1100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1100
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7651 -> IGT_7648
  * Linux: xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a -> xe-pw-127987v1

  IGT_7648: 5c7b44f13c9c5bc15af0cb2b6a5ea10a8a468ac0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7651: 02fa4cf8bcbb15f1641e862fa83e2182c6f73a63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a
  xe-pw-127987v1: 127987v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/index.html

--===============2403915384891946890==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/xe: Remove ci-only GuC FW definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127987/">https://patchwork.freedesktop.org/series/127987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a_BAT -&gt; xe-pw-127987v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127987v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127987v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1100">Intel XE#1100</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7651 -&gt; IGT_7648</li>
<li>Linux: xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a -&gt; xe-pw-127987v1</li>
</ul>
<p>IGT_7648: 5c7b44f13c9c5bc15af0cb2b6a5ea10a8a468ac0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7651: 02fa4cf8bcbb15f1641e862fa83e2182c6f73a63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a<br />
  xe-pw-127987v1: 127987v1</p>

</body>
</html>

--===============2403915384891946890==--
