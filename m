Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC563CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 04:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F74113356;
	Thu,  4 Apr 2024 04:39:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53BD113356;
 Thu,  4 Apr 2024 04:39:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1034281254663660243=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Add_workaround_180?=
 =?utf-8?q?34896535_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 04:39:20 -0000
Message-ID: <171220556067.1190907.11369875118872908967@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404034331.139854-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240404034331.139854-1-krishnaiah.bommu@intel.com>
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

--===============1034281254663660243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 18034896535 (rev3)
URL   : https://patchwork.freedesktop.org/series/131912/
State : success

== Summary ==

CI Bug Log - changes from xe-1033-406e10d886a22211d2866bfa9322aec1727171f8_BAT -> xe-pw-131912v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131912v3_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_module_load@load:
    - {bat-lnl-1}:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1033-406e10d886a22211d2866bfa9322aec1727171f8/bat-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131912v3/bat-lnl-1/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -> xe-pw-131912v3

  IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8
  xe-pw-131912v3: 131912v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131912v3/index.html

--===============1034281254663660243==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 18034896535 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131912/">https://patchwork.freedesktop.org/series/131912/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131912v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131912v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1033-406e10d886a22211d2866bfa9322aec1727171f8_BAT -&gt; xe-pw-131912v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131912v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1033-406e10d886a22211d2866bfa9322aec1727171f8/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131912v3/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -&gt; xe-pw-131912v3</li>
</ul>
<p>IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8<br />
  xe-pw-131912v3: 131912v3</p>

</body>
</html>

--===============1034281254663660243==--
