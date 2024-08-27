Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F7C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 00:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F331410E013;
	Tue, 27 Aug 2024 00:11:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFCF10E013;
 Tue, 27 Aug 2024 00:11:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0632442661773354127=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/oa=3A_Insert_wmb/sfence_b?=
 =?utf-8?q?efore_enabling_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 00:11:57 -0000
Message-ID: <172471751750.785986.17988604132742360411@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826232906.1849613-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240826232906.1849613-1-ashutosh.dixit@intel.com>
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

--===============0632442661773354127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Insert wmb/sfence before enabling OA
URL   : https://patchwork.freedesktop.org/series/137816/
State : success

== Summary ==

CI Bug Log - changes from xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90_BAT -> xe-pw-137816v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137816v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][3] ([Intel XE#482]) -> [PASS][4] +3 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][5] ([Intel XE#1000]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482


Build changes
-------------

  * IGT: IGT_7991 -> IGT_7992
  * Linux: xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90 -> xe-pw-137816v1

  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7992: 14c915ac38d4f697f504f3c754195c5e284c49e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90: a98a350b5396d30458c26b4f31d7c4f4f9b1da90
  xe-pw-137816v1: 137816v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/index.html

--===============0632442661773354127==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Insert wmb/sfence before enabling OA</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137816/">https://patchwork.freedesktop.org/series/137816/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90_BAT -&gt; xe-pw-137816v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137816v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137816v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7991 -&gt; IGT_7992</li>
<li>Linux: xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90 -&gt; xe-pw-137816v1</li>
</ul>
<p>IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7992: 14c915ac38d4f697f504f3c754195c5e284c49e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1830-a98a350b5396d30458c26b4f31d7c4f4f9b1da90: a98a350b5396d30458c26b4f31d7c4f4f9b1da90<br />
  xe-pw-137816v1: 137816v1</p>

</body>
</html>

--===============0632442661773354127==--
