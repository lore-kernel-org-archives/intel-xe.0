Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3149EC3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 16:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01C310E315;
	Mon, 15 Jan 2024 16:43:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B6510E315;
 Mon, 15 Jan 2024 16:43:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6491856764267605525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Remove_obsolete_async?=
 =?utf-8?q?=5Fops_from_struct_xe=5Fvm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 15 Jan 2024 16:43:57 -0000
Message-ID: <170533703753.480178.14600085621967258851@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
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

--===============6491856764267605525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove obsolete async_ops from struct xe_vm
URL   : https://patchwork.freedesktop.org/series/128782/
State : failure

== Summary ==

CI Bug Log - changes from xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065_BAT -> xe-pw-128782v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-128782v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128782v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128782v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#288]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-128782v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#1161]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  [Intel XE#1161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7673 -> IGT_7674
  * Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -> xe-pw-128782v1

  IGT_7673: 7673
  IGT_7674: 7674
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065
  xe-pw-128782v1: 128782v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/index.html

--===============6491856764267605525==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove obsolete async_ops from struct xe_vm</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128782/">https://patchwork.freedesktop.org/series/128782/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065_BAT -&gt; xe-pw-128782v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-128782v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128782v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128782v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128782v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128782v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161">Intel XE#1161</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7673 -&gt; IGT_7674</li>
<li>Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -&gt; xe-pw-128782v1</li>
</ul>
<p>IGT_7673: 7673<br />
  IGT_7674: 7674<br />
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065<br />
  xe-pw-128782v1: 128782v1</p>

</body>
</html>

--===============6491856764267605525==--
