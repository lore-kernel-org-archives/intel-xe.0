Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A6F54AD7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 16:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA92D10E731;
	Tue, 24 Mar 2026 16:10:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646B510E736;
 Tue, 24 Mar 2026 16:10:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4341425325205182717=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 16:10:57 -0000
Message-ID: <177436865738.391866.6429330889447910612@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324152935.72444-6-jonathan.cavitt@intel.com>
In-Reply-To: <20260324152935.72444-6-jonathan.cavitt@intel.com>
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

--===============4341425325205182717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
URL   : https://patchwork.freedesktop.org/series/163788/
State : success

== Summary ==

CI Bug Log - changes from xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819_BAT -> xe-pw-163788v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163788v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-wcl-1:          [DMESG-WARN][3] ([Intel XE#7487]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#7487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7487


Build changes
-------------

  * Linux: xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819 -> xe-pw-163788v1

  IGT_8822: 8822
  xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819: 3a61374eb191c4ab83fbbcc569bb3f82a5d68819
  xe-pw-163788v1: 163788v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/index.html

--===============4341425325205182717==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163788/">https://patchwork.freedesktop.org/series/163788/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819_BAT -&gt; xe-pw-163788v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163788v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7487">Intel XE#7487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163788v1/bat-wcl-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819 -&gt; xe-pw-163788v1</li>
</ul>
<p>IGT_8822: 8822<br />
  xe-4773-3a61374eb191c4ab83fbbcc569bb3f82a5d68819: 3a61374eb191c4ab83fbbcc569bb3f82a5d68819<br />
  xe-pw-163788v1: 163788v1</p>

</body>
</html>

--===============4341425325205182717==--
