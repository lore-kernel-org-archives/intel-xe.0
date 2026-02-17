Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08979E909A3
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 13:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F5F10E25E;
	Tue, 17 Feb 2026 13:52:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C79410E25E;
 Tue, 17 Feb 2026 13:52:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4002714943791081511=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Hardware_Error_handling_for?=
 =?utf-8?q?_Crescent_Island?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 13:52:00 -0000
Message-ID: <177133632062.258831.7620870631840897161@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217114656.2546878-1-raag.jadav@intel.com>
In-Reply-To: <20260217114656.2546878-1-raag.jadav@intel.com>
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

--===============4002714943791081511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Hardware Error handling for Crescent Island
URL   : https://patchwork.freedesktop.org/series/161709/
State : failure

== Summary ==

CI Bug Log - changes from xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366_BAT -> xe-pw-161709v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-161709v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161709v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161709v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-wcl-2:          [SKIP][1] ([Intel XE#7238]) -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-wcl-1:          [SKIP][3] ([Intel XE#7238]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238


Build changes
-------------

  * IGT: IGT_8754 -> IGT_8755
  * Linux: xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366 -> xe-pw-161709v1

  IGT_8754: 8754
  IGT_8755: 8755
  xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366: 32b409741f18c54cd98f942836d1f7bd9bc15366
  xe-pw-161709v1: 161709v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/index.html

--===============4002714943791081511==
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
<tr><td><b>Series:</b></td><td>Hardware Error handling for Crescent Island</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161709/">https://patchwork.freedesktop.org/series/161709/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366_BAT -&gt; xe-pw-161709v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-161709v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161709v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161709v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161709v1/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8754 -&gt; IGT_8755</li>
<li>Linux: xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366 -&gt; xe-pw-161709v1</li>
</ul>
<p>IGT_8754: 8754<br />
  IGT_8755: 8755<br />
  xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366: 32b409741f18c54cd98f942836d1f7bd9bc15366<br />
  xe-pw-161709v1: 161709v1</p>

</body>
</html>

--===============4002714943791081511==--
