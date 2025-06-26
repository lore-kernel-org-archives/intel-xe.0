Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EB4C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 16:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765E10E2D8;
	Thu, 26 Jun 2025 16:38:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2AA10E2D8;
 Thu, 26 Jun 2025 16:38:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4312270732739611542=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_i2c_support_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Jun 2025 16:38:03 -0000
Message-ID: <175095588309.112774.10110480477375407107@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
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

--===============4312270732739611542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: i2c support (rev4)
URL   : https://patchwork.freedesktop.org/series/149699/
State : failure

== Summary ==

CI Bug Log - changes from xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0_BAT -> xe-pw-149699v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149699v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149699v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149699v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  


Build changes
-------------

  * Linux: xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0 -> xe-pw-149699v4

  IGT_8429: 8429
  xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0: f6b8af31b91ad0672ddd31165d4917c255886bd0
  xe-pw-149699v4: 149699v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/index.html

--===============4312270732739611542==
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
<tr><td><b>Series:</b></td><td>drm/xe: i2c support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149699/">https://patchwork.freedesktop.org/series/149699/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0_BAT -&gt; xe-pw-149699v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149699v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149699v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149699v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149699v4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0 -&gt; xe-pw-149699v4</li>
</ul>
<p>IGT_8429: 8429<br />
  xe-3311-f6b8af31b91ad0672ddd31165d4917c255886bd0: f6b8af31b91ad0672ddd31165d4917c255886bd0<br />
  xe-pw-149699v4: 149699v4</p>

</body>
</html>

--===============4312270732739611542==--
