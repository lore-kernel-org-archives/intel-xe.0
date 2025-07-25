Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D1C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 16:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CECC10E9F6;
	Fri, 25 Jul 2025 16:25:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8110E9F6;
 Fri, 25 Jul 2025 16:25:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8656173653417006692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fguc=5Fads=3A_Co?=
 =?utf-8?q?nsolidate_guc=5Fwaklv=5Fenable_functions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 16:25:26 -0000
Message-ID: <175346072627.190550.17673325212276535087@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725150749.68071-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250725150749.68071-2-jonathan.cavitt@intel.com>
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

--===============8656173653417006692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions (rev2)
URL   : https://patchwork.freedesktop.org/series/152099/
State : success

== Summary ==

CI Bug Log - changes from xe-3476-a8e405f4aa574428fb324baa6082991006e813c4_BAT -> xe-pw-152099v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152099v2_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_debugfs@read-all-entries}:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-atsm-2/igt@core_debugfs@read-all-entries.html
    - bat-pvc-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-pvc-2/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-pvc-2/igt@core_debugfs@read-all-entries.html

  
Known issues
------------

  Here are the changes found in xe-pw-152099v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4543]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3476-a8e405f4aa574428fb324baa6082991006e813c4 -> xe-pw-152099v2

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3476-a8e405f4aa574428fb324baa6082991006e813c4: a8e405f4aa574428fb324baa6082991006e813c4
  xe-pw-152099v2: 152099v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/index.html

--===============8656173653417006692==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152099/">https://patchwork.freedesktop.org/series/152099/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3476-a8e405f4aa574428fb324baa6082991006e813c4_BAT -&gt; xe-pw-152099v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152099v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_debugfs@read-all-entries}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-atsm-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-pvc-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-pvc-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152099v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3476-a8e405f4aa574428fb324baa6082991006e813c4/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152099v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3476-a8e405f4aa574428fb324baa6082991006e813c4 -&gt; xe-pw-152099v2</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3476-a8e405f4aa574428fb324baa6082991006e813c4: a8e405f4aa574428fb324baa6082991006e813c4<br />
  xe-pw-152099v2: 152099v2</p>

</body>
</html>

--===============8656173653417006692==--
