Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D1D625E5
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 07:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BA10EA4E;
	Fri, 23 Jan 2026 07:08:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259810E279;
 Fri, 23 Jan 2026 07:08:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4739244000240546363=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Remove_device_private_pages?=
 =?utf-8?q?_from_physical_address_space_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 07:08:13 -0000
Message-ID: <176915209305.186607.17445756542005208156@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123062309.23090-1-jniethe@nvidia.com>
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
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

--===============4739244000240546363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev5)
URL   : https://patchwork.freedesktop.org/series/159738/
State : failure

== Summary ==

CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff_BAT -> xe-pw-159738v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159738v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159738v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159738v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-bmg-2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-bmg-2/igt@xe_evict@evict-beng-small.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-bmg-1/igt@xe_evict@evict-beng-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-bmg-1/igt@xe_evict@evict-beng-small.html

  
Known issues
------------

  Here are the changes found in xe-pw-159738v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#6519]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -> xe-pw-159738v5

  IGT_8715: 8715
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef43ba3175b771e77ff
  xe-pw-159738v5: 159738v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/index.html

--===============4739244000240546363==
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
<tr><td><b>Series:</b></td><td>Remove device private pages from physical address space (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff_BAT -&gt; xe-pw-159738v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159738v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159738v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159738v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-small:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-bmg-2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-bmg-2/igt@xe_evict@evict-beng-small.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-bmg-1/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-bmg-1/igt@xe_evict@evict-beng-small.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159738v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -&gt; xe-pw-159738v5</li>
</ul>
<p>IGT_8715: 8715<br />
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef43ba3175b771e77ff<br />
  xe-pw-159738v5: 159738v5</p>

</body>
</html>

--===============4739244000240546363==--
