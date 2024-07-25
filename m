Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90201C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 06:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1E610E500;
	Thu, 25 Jul 2024 06:09:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676FD10E500;
 Thu, 25 Jul 2024 06:09:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3840942915484856057=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Nuke_VM=27s_mapping_up?=
 =?utf-8?q?on_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 06:09:40 -0000
Message-ID: <172188778041.373618.3272619380129491092@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725050028.1924802-1-matthew.brost@intel.com>
In-Reply-To: <20240725050028.1924802-1-matthew.brost@intel.com>
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

--===============3840942915484856057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Nuke VM's mapping upon close
URL   : https://patchwork.freedesktop.org/series/136474/
State : failure

== Summary ==

CI Bug Log - changes from xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2_BAT -> xe-pw-136474v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136474v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136474v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136474v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-bmg-1}:        [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_pat@prime-self-import-coh:
    - {bat-bmg-1}:        [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@xe_pat@prime-self-import-coh.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-bmg-1/igt@xe_pat@prime-self-import-coh.html

  
Known issues
------------

  Here are the changes found in xe-pw-136474v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705


Build changes
-------------

  * Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -> xe-pw-136474v1

  IGT_7936: 7936
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2
  xe-pw-136474v1: 136474v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/index.html

--===============3840942915484856057==
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
<tr><td><b>Series:</b></td><td>drm/xe: Nuke VM&#x27;s mapping upon close</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136474/">https://patchwork.freedesktop.org/series/136474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2_BAT -&gt; xe-pw-136474v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136474v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136474v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136474v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@xe_pat@prime-self-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136474v1/bat-bmg-1/igt@xe_pat@prime-self-import-coh.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136474v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -&gt; xe-pw-136474v1</li>
</ul>
<p>IGT_7936: 7936<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2<br />
  xe-pw-136474v1: 136474v1</p>

</body>
</html>

--===============3840942915484856057==--
