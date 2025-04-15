Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88051C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 16:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506410E7F6;
	Tue, 15 Apr 2025 16:24:33 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7C110E124;
 Tue, 15 Apr 2025 16:24:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4746712269348253795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 16:24:31 -0000
Message-ID: <174473427131.7529.10372773754004652641@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415153823.102926-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250415153823.102926-1-jonathan.cavitt@intel.com>
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

--===============4746712269348253795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev20)
URL   : https://patchwork.freedesktop.org/series/145529/
State : success

== Summary ==

CI Bug Log - changes from xe-2955-f031245c01c722de43e8a02c2358140de0685428_BAT -> xe-pw-145529v20_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2955-f031245c01c722de43e8a02c2358140de0685428 -> xe-pw-145529v20

  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2955-f031245c01c722de43e8a02c2358140de0685428: f031245c01c722de43e8a02c2358140de0685428
  xe-pw-145529v20: 145529v20

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/index.html

--===============4746712269348253795==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev20)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145529/">https://patchwork.freedesktop.org/series/145529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2955-f031245c01c722de43e8a02c2358140de0685428_BAT -&gt; xe-pw-145529v20_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2955-f031245c01c722de43e8a02c2358140de0685428 -&gt; xe-pw-145529v20</li>
</ul>
<p>IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2955-f031245c01c722de43e8a02c2358140de0685428: f031245c01c722de43e8a02c2358140de0685428<br />
  xe-pw-145529v20: 145529v20</p>

</body>
</html>

--===============4746712269348253795==--
