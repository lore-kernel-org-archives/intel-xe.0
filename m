Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E55AC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 12:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350910EE33;
	Wed,  5 Aug 2026 12:31:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A652010EE33;
 Wed,  5 Aug 2026 12:31:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3570686349963727863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introduce_cold_reset_recove?=
 =?utf-8?q?ry_method_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 12:31:27 -0000
Message-ID: <178593308767.21461.14214690203746337977@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805071152.1225416-6-mallesh.koujalagi@intel.com>
In-Reply-To: <20260805071152.1225416-6-mallesh.koujalagi@intel.com>
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

--===============3570686349963727863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce cold reset recovery method (rev13)
URL   : https://patchwork.freedesktop.org/series/163428/
State : failure

== Summary ==

CI Bug Log - changes from xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660_BAT -> xe-pw-163428v13_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163428v13_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163428v13_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163428v13_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-nvls-2:         [SKIP][3] ([Intel XE#7779]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779


Build changes
-------------

  * Linux: xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660 -> xe-pw-163428v13

  IGT_9038: 9038
  xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660: 4c13a67db118ee0019231dbc1362bcb8115ac660
  xe-pw-163428v13: 163428v13

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/index.html

--===============3570686349963727863==
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
<tr><td><b>Series:</b></td><td>Introduce cold reset recovery method (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163428/">https://patchwork.freedesktop.org/series/163428/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660_BAT -&gt; xe-pw-163428v13_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163428v13_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163428v13_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163428v13_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v13/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660 -&gt; xe-pw-163428v13</li>
</ul>
<p>IGT_9038: 9038<br />
  xe-5545-4c13a67db118ee0019231dbc1362bcb8115ac660: 4c13a67db118ee0019231dbc1362bcb8115ac660<br />
  xe-pw-163428v13: 163428v13</p>

</body>
</html>

--===============3570686349963727863==--
