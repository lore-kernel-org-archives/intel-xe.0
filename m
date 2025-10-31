Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C98CCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 05:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A612E10E13F;
	Fri, 31 Oct 2025 05:53:30 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9510E13F;
 Fri, 31 Oct 2025 05:53:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8898462540629897702=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_share_USM_BCS_eng?=
 =?utf-8?q?ine_via_root-tile_helper_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 05:53:29 -0000
Message-ID: <176189000914.3439.4803299101155246952@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031051402.1333911-1-nitin.r.gote@intel.com>
In-Reply-To: <20251031051402.1333911-1-nitin.r.gote@intel.com>
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

--===============8898462540629897702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: share USM BCS engine via root-tile helper (rev2)
URL   : https://patchwork.freedesktop.org/series/156117/
State : success

== Summary ==

CI Bug Log - changes from xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340_BAT -> xe-pw-156117v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156117v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8603 -> IGT_8604
  * Linux: xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340 -> xe-pw-156117v2

  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8604: 8604
  xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340: 31f6cf867833cb67c289427c7cfe00d35d0fd340
  xe-pw-156117v2: 156117v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v2/index.html

--===============8898462540629897702==
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
<tr><td><b>Series:</b></td><td>drm/xe: share USM BCS engine via root-tile helper (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156117/">https://patchwork.freedesktop.org/series/156117/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340_BAT -&gt; xe-pw-156117v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156117v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8603 -&gt; IGT_8604</li>
<li>Linux: xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340 -&gt; xe-pw-156117v2</li>
</ul>
<p>IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8604: 8604<br />
  xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340: 31f6cf867833cb67c289427c7cfe00d35d0fd340<br />
  xe-pw-156117v2: 156117v2</p>

</body>
</html>

--===============8898462540629897702==--
