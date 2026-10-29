Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448D606A321
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489FA112246;
	Thu, 29 Oct 2026 12:16:02 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BE4112246;
 Thu, 29 Oct 2026 12:16:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2363630796416935145=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/ptl+=3A_Fix_eDP_su?=
 =?utf-8?q?pport_on_TypeC_PHYs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 12:16:00 -0000
Message-ID: <179327616036.88070.16791675754847298736@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029113017.618286-1-imre.deak@intel.com>
In-Reply-To: <20261029113017.618286-1-imre.deak@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2363630796416935145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/ptl+: Fix eDP support on TypeC PHYs
URL   : https://patchwork.freedesktop.org/series/177147/
State : failure

== Summary ==

CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a_BAT -> xe-pw-177147v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177147v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177147v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177147v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-3/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -> xe-pw-177147v1

  IGT_9170: 9170
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd59602875f5c54874c92a
  xe-pw-177147v1: 177147v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/index.html

--===============2363630796416935145==
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
<tr><td><b>Series:</b></td><td>drm/i915/ptl+: Fix eDP support on TypeC PHYs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177147/">https://patchwork.freedesktop.org/series/177147/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a_BAT -&gt; xe-pw-177147v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177147v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177147v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177147v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -&gt; xe-pw-177147v1</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd59602875f5c54874c92a<br />
  xe-pw-177147v1: 177147v1</p>

</body>
</html>

--===============2363630796416935145==--
