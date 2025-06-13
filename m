Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16BDC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 05:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D809710E1AA;
	Fri, 13 Jun 2025 05:13:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC8B10E19A;
 Fri, 13 Jun 2025 05:13:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5326304579984834061=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Set_wedged_on?=
 =?utf-8?q?_Xe_micro_hardware_initialization_error_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 05:13:53 -0000
Message-ID: <174979163323.74715.11384625803894143482@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612220925.2286286-1-zhanjun.dong@intel.com>
In-Reply-To: <20250612220925.2286286-1-zhanjun.dong@intel.com>
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

--===============5326304579984834061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Set wedged on Xe micro hardware initialization error (rev3)
URL   : https://patchwork.freedesktop.org/series/149856/
State : failure

== Summary ==

CI Bug Log - changes from xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6_BAT -> xe-pw-149856v3_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-149856v3_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149856v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149856v3_BAT:

### IGT changes ###

#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [ABORT][1] ([Intel XE#5214]) -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149856v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214


Build changes
-------------

  * IGT: IGT_8409 -> IGT_8410
  * Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -> xe-pw-149856v3

  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6
  xe-pw-149856v3: 149856v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149856v3/index.html

--===============5326304579984834061==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Set wedged on Xe micro hardware initialization error (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149856/">https://patchwork.freedesktop.org/series/149856/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149856v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149856v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6_BAT -&gt; xe-pw-149856v3_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-149856v3_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149856v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149856v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149856v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8409 -&gt; IGT_8410</li>
<li>Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -&gt; xe-pw-149856v3</li>
</ul>
<p>IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6<br />
  xe-pw-149856v3: 149856v3</p>

</body>
</html>

--===============5326304579984834061==--
