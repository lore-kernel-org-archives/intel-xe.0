Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84D5C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 18:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADF110E996;
	Thu, 11 Jan 2024 18:30:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54A10E996;
 Thu, 11 Jan 2024 18:30:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6224015042287602890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Split_GuC_communicatio?=
 =?utf-8?q?n_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 18:30:03 -0000
Message-ID: <170499780318.290000.16555634926912004207@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111162051.585-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111162051.585-1-michal.wajdeczko@intel.com>
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

--===============6224015042287602890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Split GuC communication initialization
URL   : https://patchwork.freedesktop.org/series/128679/
State : success

== Summary ==

CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -> xe-pw-128679v1_BAT
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

  Here are the changes found in xe-pw-128679v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#288]) +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  
#### Possible fixes ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-atsm-2:         [FAIL][4] ([Intel XE#1099]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-atsm-2:         [INCOMPLETE][6] ([Intel XE#506]) -> [SKIP][7] ([Intel XE#288])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/506


Build changes
-------------

  * IGT: IGT_7669 -> IGT_7670
  * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-pw-128679v1

  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
  xe-pw-128679v1: 128679v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/index.html

--===============6224015042287602890==
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
<tr><td><b>Series:</b></td><td>drm/xe: Split GuC communication initialization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128679/">https://patchwork.freedesktop.org/series/128679/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -&gt; xe-pw-128679v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128679v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/506">Intel XE#506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128679v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7669 -&gt; IGT_7670</li>
<li>Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -&gt; xe-pw-128679v1</li>
</ul>
<p>IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad<br />
  xe-pw-128679v1: 128679v1</p>

</body>
</html>

--===============6224015042287602890==--
