Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A57CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 00:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1244F10E00F;
	Thu,  4 Sep 2025 00:04:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818010E00F;
 Thu,  4 Sep 2025 00:04:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5018211078385524416=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sriov=3A_Don=27t_mig?=
 =?utf-8?q?rate_dmabuf_BO_to_System_RAM_while_running_in_VM_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 00:04:49 -0000
Message-ID: <175694428974.300637.5067203996568953351@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
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

--===============5018211078385524416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM (rev3)
URL   : https://patchwork.freedesktop.org/series/139920/
State : success

== Summary ==

CI Bug Log - changes from xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7_BAT -> xe-pw-139920v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-139920v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-vm}:       [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7 -> xe-pw-139920v3

  IGT_8521: 8521
  xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7: 2b95afd5f659a01a6fc8195358e62077846b97e7
  xe-pw-139920v3: 139920v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/index.html

--===============5018211078385524416==
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
<tr><td><b>Series:</b></td><td>drm/xe/sriov: Don&#x27;t migrate dmabuf BO to System RAM while running in VM (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139920/">https://patchwork.freedesktop.org/series/139920/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7_BAT -&gt; xe-pw-139920v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139920v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v3/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7 -&gt; xe-pw-139920v3</li>
</ul>
<p>IGT_8521: 8521<br />
  xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7: 2b95afd5f659a01a6fc8195358e62077846b97e7<br />
  xe-pw-139920v3: 139920v3</p>

</body>
</html>

--===============5018211078385524416==--
