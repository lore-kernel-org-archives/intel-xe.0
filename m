Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7193CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 21:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0B510E731;
	Thu, 28 Mar 2024 21:03:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087410E731;
 Thu, 28 Mar 2024 21:03:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7855749546749089586=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Restore_flags_VM=5FBIND=5FFLAG?=
 =?utf-8?q?=5FREADONLY_and_VM=5FBIND=5FFLAG=5FIMMEDIATE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 21:03:45 -0000
Message-ID: <171165982591.1064930.3919646405405144033@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328143742.7-1-francois.dugast@intel.com>
In-Reply-To: <20240328143742.7-1-francois.dugast@intel.com>
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

--===============7855749546749089586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
URL   : https://patchwork.freedesktop.org/series/131775/
State : success

== Summary ==

CI Bug Log - changes from xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8_BAT -> xe-pw-131775v1_BAT
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

  Here are the unknown changes that may have been introduced in xe-pw-131775v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-1}:        [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131775v1/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7789 -> IGT_7790
  * Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -> xe-pw-131775v1

  IGT_7789: 28352d6f0f514d38fe02574653878be9c3a3421c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8
  xe-pw-131775v1: 131775v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131775v1/index.html

--===============7855749546749089586==
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
<tr><td><b>Series:</b></td><td>Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131775/">https://patchwork.freedesktop.org/series/131775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131775v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131775v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8_BAT -&gt; xe-pw-131775v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131775v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131775v1/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7789 -&gt; IGT_7790</li>
<li>Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -&gt; xe-pw-131775v1</li>
</ul>
<p>IGT_7789: 28352d6f0f514d38fe02574653878be9c3a3421c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8<br />
  xe-pw-131775v1: 131775v1</p>

</body>
</html>

--===============7855749546749089586==--
