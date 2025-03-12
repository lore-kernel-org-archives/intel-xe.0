Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAE7C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 18:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5310E15D;
	Wed, 12 Mar 2025 18:31:13 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435FA10E15D;
 Wed, 12 Mar 2025 18:31:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8498876696035956475=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/eustall=3A_Fix_a_possible_pointer_dereference_after_fr?=
 =?utf-8?q?ee?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 18:31:12 -0000
Message-ID: <174180427226.26263.16016759769614879927@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <eae49a414a7314921108e0388810aaee6261ad92.1741800396.git.harish.chegondi@intel.com>
In-Reply-To: <eae49a414a7314921108e0388810aaee6261ad92.1741800396.git.harish.chegondi@intel.com>
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

--===============8498876696035956475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/eustall: Fix a possible pointer dereference after free
URL   : https://patchwork.freedesktop.org/series/146223/
State : success

== Summary ==

CI Bug Log - changes from xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945_BAT -> xe-pw-146223v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146223v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146223v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945 -> xe-pw-146223v1

  IGT_8271: 8271
  xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945: dd638300cdc171bdd070ebad302134ada2aa5945
  xe-pw-146223v1: 146223v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146223v1/index.html

--===============8498876696035956475==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/eustall: Fix a possible pointer dereference after free</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146223/">https://patchwork.freedesktop.org/series/146223/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146223v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146223v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945_BAT -&gt; xe-pw-146223v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146223v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146223v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945 -&gt; xe-pw-146223v1</li>
</ul>
<p>IGT_8271: 8271<br />
  xe-2804-dd638300cdc171bdd070ebad302134ada2aa5945: dd638300cdc171bdd070ebad302134ada2aa5945<br />
  xe-pw-146223v1: 146223v1</p>

</body>
</html>

--===============8498876696035956475==--
