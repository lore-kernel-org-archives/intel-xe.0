Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6955CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799D710E93A;
	Wed,  3 Sep 2025 21:11:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADF910E93A;
 Wed,  3 Sep 2025 21:11:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6090310294768941357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D/fbdev?=
 =?utf-8?q?=3A_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 21:11:44 -0000
Message-ID: <175693390456.300637.6412030999127273866@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1756931441.git.jani.nikula@intel.com>
In-Reply-To: <cover.1756931441.git.jani.nikula@intel.com>
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

--===============6090310294768941357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}/fbdev: refactor
URL   : https://patchwork.freedesktop.org/series/153981/
State : success

== Summary ==

CI Bug Log - changes from xe-3672-09933716bb37eda75f5b3562a76e58a17c447647_BAT -> xe-pw-153981v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153981v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_sriov_flr@flr-vf1-clear:
    - {bat-ptl-vm}:       [SKIP][1] ([Intel XE#5496]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-ptl-vm/igt@xe_sriov_flr@flr-vf1-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-ptl-vm/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-153981v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
#### Warnings ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vm:        [SKIP][5] ([Intel XE#3342] / [Intel XE#5496]) -> [SKIP][6] ([Intel XE#3342])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5496
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8520 -> IGT_8521
  * Linux: xe-3672-09933716bb37eda75f5b3562a76e58a17c447647 -> xe-pw-153981v1

  IGT_8520: 8520
  IGT_8521: 8521
  xe-3672-09933716bb37eda75f5b3562a76e58a17c447647: 09933716bb37eda75f5b3562a76e58a17c447647
  xe-pw-153981v1: 153981v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/index.html

--===============6090310294768941357==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}/fbdev: refactor</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153981/">https://patchwork.freedesktop.org/series/153981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3672-09933716bb37eda75f5b3562a76e58a17c447647_BAT -&gt; xe-pw-153981v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153981v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-ptl-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5496">Intel XE#5496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-ptl-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153981v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3672-09933716bb37eda75f5b3562a76e58a17c447647/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5496">Intel XE#5496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153981v1/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8520 -&gt; IGT_8521</li>
<li>Linux: xe-3672-09933716bb37eda75f5b3562a76e58a17c447647 -&gt; xe-pw-153981v1</li>
</ul>
<p>IGT_8520: 8520<br />
  IGT_8521: 8521<br />
  xe-3672-09933716bb37eda75f5b3562a76e58a17c447647: 09933716bb37eda75f5b3562a76e58a17c447647<br />
  xe-pw-153981v1: 153981v1</p>

</body>
</html>

--===============6090310294768941357==--
