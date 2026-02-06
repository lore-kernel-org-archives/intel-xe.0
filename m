Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30CEE6B43
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 17:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506310E8A0;
	Fri,  6 Feb 2026 17:34:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A773510E89D;
 Fri,  6 Feb 2026 17:34:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4627999109438700939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 17:34:13 -0000
Message-ID: <177039925365.232294.10140958621341854845@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206164731.8395-7-jonathan.cavitt@intel.com>
In-Reply-To: <20260206164731.8395-7-jonathan.cavitt@intel.com>
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

--===============4627999109438700939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
URL   : https://patchwork.freedesktop.org/series/161293/
State : failure

== Summary ==

CI Bug Log - changes from xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04_BAT -> xe-pw-161293v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161293v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161293v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161293v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - bat-bmg-3:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161293v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  


Build changes
-------------

  * IGT: IGT_8740 -> IGT_8742
  * Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -> xe-pw-161293v1

  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8742: 8742
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c3629013dde27929dbf04
  xe-pw-161293v1: 161293v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161293v1/index.html

--===============4627999109438700939==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161293/">https://patchwork.freedesktop.org/series/161293/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161293v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161293v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04_BAT -&gt; xe-pw-161293v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161293v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161293v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161293v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161293v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8740 -&gt; IGT_8742</li>
<li>Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -&gt; xe-pw-161293v1</li>
</ul>
<p>IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8742: 8742<br />
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c3629013dde27929dbf04<br />
  xe-pw-161293v1: 161293v1</p>

</body>
</html>

--===============4627999109438700939==--
