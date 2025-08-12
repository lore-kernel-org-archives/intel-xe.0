Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E2C87FCB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 15:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4210E03C;
	Tue, 12 Aug 2025 15:06:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3A310E03C;
 Tue, 12 Aug 2025 15:06:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0423551360018941478=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Untangle_vm=5Fbin?=
 =?utf-8?q?d=5Fioctl_cleanup_order_and_fix_double_free_bug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Aug 2025 15:06:30 -0000
Message-ID: <175501119056.230492.10821147018939067284@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250812131728.42314-1-christoph.manszewski@intel.com>
In-Reply-To: <20250812131728.42314-1-christoph.manszewski@intel.com>
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

--===============0423551360018941478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug
URL   : https://patchwork.freedesktop.org/series/152835/
State : success

== Summary ==

CI Bug Log - changes from xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d_BAT -> xe-pw-152835v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-152835v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152835v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d -> xe-pw-152835v1

  IGT_8492: 1e6c0d07b83cde9f2300b193f441c37d9dde5981 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d: c95d955cf0a032f2be77e6b07a3753bcc0f6915d
  xe-pw-152835v1: 152835v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152835v1/index.html

--===============0423551360018941478==
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
<tr><td><b>Series:</b></td><td>drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152835/">https://patchwork.freedesktop.org/series/152835/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152835v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152835v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d_BAT -&gt; xe-pw-152835v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152835v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152835v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d -&gt; xe-pw-152835v1</li>
</ul>
<p>IGT_8492: 1e6c0d07b83cde9f2300b193f441c37d9dde5981 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d: c95d955cf0a032f2be77e6b07a3753bcc0f6915d<br />
  xe-pw-152835v1: 152835v1</p>

</body>
</html>

--===============0423551360018941478==--
