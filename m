Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C4CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7AA10E16A;
	Fri, 17 Oct 2025 15:23:54 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40310E16A;
 Fri, 17 Oct 2025 15:23:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1534841435677706672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_Atomicize?=
 =?utf-8?q?_CCS_copy_command_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 15:23:53 -0000
Message-ID: <176071463309.27663.15010015817127358619@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
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

--===============1534841435677706672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Atomicize CCS copy command setup
URL   : https://patchwork.freedesktop.org/series/156128/
State : success

== Summary ==

CI Bug Log - changes from xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c_BAT -> xe-pw-156128v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156128v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156128v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8591 -> IGT_8592
  * Linux: xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c -> xe-pw-156128v1

  IGT_8591: 8591
  IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c: c809fdcf60b85e8a261eaa1b49f18b9c5731b18c
  xe-pw-156128v1: 156128v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156128v1/index.html

--===============1534841435677706672==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Atomicize CCS copy command setup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156128/">https://patchwork.freedesktop.org/series/156128/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156128v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156128v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c_BAT -&gt; xe-pw-156128v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156128v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156128v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8591 -&gt; IGT_8592</li>
<li>Linux: xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c -&gt; xe-pw-156128v1</li>
</ul>
<p>IGT_8591: 8591<br />
  IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3940-c809fdcf60b85e8a261eaa1b49f18b9c5731b18c: c809fdcf60b85e8a261eaa1b49f18b9c5731b18c<br />
  xe-pw-156128v1: 156128v1</p>

</body>
</html>

--===============1534841435677706672==--
