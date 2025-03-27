Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F045C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 21:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A286D10E0CC;
	Thu, 27 Mar 2025 21:21:45 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A8F10E0CC;
 Thu, 27 Mar 2025 21:21:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0214987117847217012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Use_drm=5Finf?=
 =?utf-8?q?o_for_hwconfig_missing_message_in_execlist_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 21:21:43 -0000
Message-ID: <174311050381.13007.5034561524230289825@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327202201.15169-1-stuart.summers@intel.com>
In-Reply-To: <20250327202201.15169-1-stuart.summers@intel.com>
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

--===============0214987117847217012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Use drm_info for hwconfig missing message in execlist mode
URL   : https://patchwork.freedesktop.org/series/146892/
State : success

== Summary ==

CI Bug Log - changes from xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d_BAT -> xe-pw-146892v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146892v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146892v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d -> xe-pw-146892v1

  IGT_8290: 8290
  xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d: 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d
  xe-pw-146892v1: 146892v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146892v1/index.html

--===============0214987117847217012==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Use drm_info for hwconfig missing message in execlist mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146892/">https://patchwork.freedesktop.org/series/146892/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146892v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146892v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d_BAT -&gt; xe-pw-146892v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146892v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-x:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146892v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d -&gt; xe-pw-146892v1</li>
</ul>
<p>IGT_8290: 8290<br />
  xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d: 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d<br />
  xe-pw-146892v1: 146892v1</p>

</body>
</html>

--===============0214987117847217012==--
