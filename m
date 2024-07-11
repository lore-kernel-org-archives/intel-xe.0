Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85762C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 22:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDB110EBB8;
	Thu, 11 Jul 2024 22:46:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320510EA42;
 Thu, 11 Jul 2024 22:46:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0675385262762714777=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/exec=3A_Fix_minor_bug_rel?=
 =?utf-8?q?ated_to_xe=5Fsync=5Fentry=5Fcleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 22:46:54 -0000
Message-ID: <172073801400.165317.11865249645353194151@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
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

--===============0675385262762714777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/136013/
State : success

== Summary ==

CI Bug Log - changes from xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75_BAT -> xe-pw-136013v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136013v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75 -> xe-pw-136013v3

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75: b8617992926ffce3569049c2eb3dffeef5eafe75
  xe-pw-136013v3: 136013v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v3/index.html

--===============0675385262762714777==
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
<tr><td><b>Series:</b></td><td>drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136013/">https://patchwork.freedesktop.org/series/136013/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75_BAT -&gt; xe-pw-136013v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136013v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75 -&gt; xe-pw-136013v3</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75: b8617992926ffce3569049c2eb3dffeef5eafe75<br />
  xe-pw-136013v3: 136013v3</p>

</body>
</html>

--===============0675385262762714777==--
