Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C1FCE8D60
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 17:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8DF10E0BA;
	Fri, 14 Nov 2025 17:31:17 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2210E0BA;
 Fri, 14 Nov 2025 17:31:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5747543941570387799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_pci_changes_for_drm-tip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 17:31:16 -0000
Message-ID: <176314147667.55609.12520744122867998269@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114154338.4161137-2-lucas.demarchi@intel.com>
In-Reply-To: <20251114154338.4161137-2-lucas.demarchi@intel.com>
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

--===============5747543941570387799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pci changes for drm-tip
URL   : https://patchwork.freedesktop.org/series/157585/
State : success

== Summary ==

CI Bug Log - changes from xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c_BAT -> xe-pw-157585v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157585v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c -> xe-pw-157585v1

  IGT_8624: 7f6690bd967a2c485671b31a79baedd73149d790 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c: 1aa32d26d18a133c78684c6b75cc657100dd357c
  xe-pw-157585v1: 157585v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/index.html

--===============5747543941570387799==
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
<tr><td><b>Series:</b></td><td>pci changes for drm-tip</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157585/">https://patchwork.freedesktop.org/series/157585/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c_BAT -&gt; xe-pw-157585v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157585v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157585v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c -&gt; xe-pw-157585v1</li>
</ul>
<p>IGT_8624: 7f6690bd967a2c485671b31a79baedd73149d790 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4107-1aa32d26d18a133c78684c6b75cc657100dd357c: 1aa32d26d18a133c78684c6b75cc657100dd357c<br />
  xe-pw-157585v1: 157585v1</p>

</body>
</html>

--===============5747543941570387799==--
