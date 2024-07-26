Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60714C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 00:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E12410E8F4;
	Fri, 26 Jul 2024 00:51:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241910E8F2;
 Fri, 26 Jul 2024 00:51:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0098815208083270718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Take_ref_to_VM_in_dela?=
 =?utf-8?q?yed_snapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 00:51:16 -0000
Message-ID: <172195507613.384426.14292273587651231613@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725232414.1958243-1-matthew.brost@intel.com>
In-Reply-To: <20240725232414.1958243-1-matthew.brost@intel.com>
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

--===============0098815208083270718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Take ref to VM in delayed snapshot
URL   : https://patchwork.freedesktop.org/series/136541/
State : failure

== Summary ==

CI Bug Log - changes from xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2_BAT -> xe-pw-136541v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136541v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136541v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136541v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@gt:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-1/igt@xe_debugfs@gt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-1/igt@xe_debugfs@gt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_debugfs@gt:
    - {bat-lnl-2}:        [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-2/igt@xe_debugfs@gt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-2/igt@xe_debugfs@gt.html

  
Known issues
------------

  Here are the changes found in xe-pw-136541v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#324])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-small-external:
    - {bat-bmg-1}:        [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-bmg-1/igt@xe_evict@evict-small-external.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-bmg-1/igt@xe_evict@evict-small-external.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2 -> xe-pw-136541v1

  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2: 1c38b092d18ce973d9ec31a4ab097fbc344ab8f2
  xe-pw-136541v1: 136541v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/index.html

--===============0098815208083270718==
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
<tr><td><b>Series:</b></td><td>drm/xe: Take ref to VM in delayed snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136541/">https://patchwork.freedesktop.org/series/136541/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2_BAT -&gt; xe-pw-136541v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136541v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136541v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136541v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_debugfs@gt:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-1/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-1/igt@xe_debugfs@gt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_debugfs@gt:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-lnl-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-lnl-2/igt@xe_debugfs@gt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136541v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-small-external:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-bmg-1/igt@xe_evict@evict-small-external.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136541v1/bat-bmg-1/igt@xe_evict@evict-small-external.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2 -&gt; xe-pw-136541v1</li>
</ul>
<p>IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2: 1c38b092d18ce973d9ec31a4ab097fbc344ab8f2<br />
  xe-pw-136541v1: 136541v1</p>

</body>
</html>

--===============0098815208083270718==--
