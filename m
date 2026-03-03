Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44B5EB3648
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 01:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9F10E0B4;
	Tue,  3 Mar 2026 01:53:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9910E0B4;
 Tue,  3 Mar 2026 01:53:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0757303744308329685=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/multi=5Fqueue=3A_Fix?=
 =?utf-8?q?_error_path_skipping_group_xa_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 01:53:53 -0000
Message-ID: <177250283363.305661.888499916653518714@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302212447.208218-1-shuicheng.lin@intel.com>
In-Reply-To: <20260302212447.208218-1-shuicheng.lin@intel.com>
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

--===============0757303744308329685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Fix error path skipping group xa cleanup
URL   : https://patchwork.freedesktop.org/series/162455/
State : failure

== Summary ==

CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc_BAT -> xe-pw-162455v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162455v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162455v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162455v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-162455v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#7483])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#7433]) +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#7433]) +2 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#7433])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-3/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-3/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][13] ([Intel XE#7483]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -> xe-pw-162455v1

  IGT_8776: 8776
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc
  xe-pw-162455v1: 162455v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/index.html

--===============0757303744308329685==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Fix error path skipping group xa cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162455/">https://patchwork.freedesktop.org/series/162455/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc_BAT -&gt; xe-pw-162455v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162455v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162455v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162455v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162455v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +2 other tests dmesg-warn</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -&gt; xe-pw-162455v1</li>
</ul>
<p>IGT_8776: 8776<br />
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc<br />
  xe-pw-162455v1: 162455v1</p>

</body>
</html>

--===============0757303744308329685==--
