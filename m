Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59487C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 22:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26310E9A1;
	Wed, 12 Feb 2025 22:07:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1C410E9A1;
 Wed, 12 Feb 2025 22:07:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1394179986910729679=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_type-safety_on_POWE?=
 =?utf-8?q?R=5FDOMAIN=5F*=28=29_macros_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 22:07:46 -0000
Message-ID: <173939806616.1441450.16686051007678195659@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212174333.371681-1-gustavo.sousa@intel.com>
In-Reply-To: <20250212174333.371681-1-gustavo.sousa@intel.com>
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

--===============1394179986910729679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve type-safety on POWER_DOMAIN_*() macros (rev2)
URL   : https://patchwork.freedesktop.org/series/144727/
State : success

== Summary ==

CI Bug Log - changes from xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19_BAT -> xe-pw-144727v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144727v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pde-page:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19/bat-adlp-vf/igt@xe_vm@shared-pde-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/bat-adlp-vf/igt@xe_vm@shared-pde-page.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19 -> xe-pw-144727v2

  IGT_8228: 8228
  xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19: bce900851ac61a73f154b6863e4e81bdb2aa7d19
  xe-pw-144727v2: 144727v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/index.html

--===============1394179986910729679==
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
<tr><td><b>Series:</b></td><td>Improve type-safety on POWER_DOMAIN_*() macros (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144727/">https://patchwork.freedesktop.org/series/144727/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19_BAT -&gt; xe-pw-144727v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144727v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pde-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19/bat-adlp-vf/igt@xe_vm@shared-pde-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/bat-adlp-vf/igt@xe_vm@shared-pde-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v2/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19 -&gt; xe-pw-144727v2</li>
</ul>
<p>IGT_8228: 8228<br />
  xe-2651-bce900851ac61a73f154b6863e4e81bdb2aa7d19: bce900851ac61a73f154b6863e4e81bdb2aa7d19<br />
  xe-pw-144727v2: 144727v2</p>

</body>
</html>

--===============1394179986910729679==--
