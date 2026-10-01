Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908ABCA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 18:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B0B10E1CF;
	Thu,  1 Oct 2026 18:58:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87EE10E145;
 Thu,  1 Oct 2026 18:58:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2845511828470350638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/cri=3A_Add_new_PCI_I?=
 =?utf-8?q?D?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 18:58:10 -0000
Message-ID: <179088109081.230602.4015276748450119630@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001135515.74225-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20261001135515.74225-2-balasubramani.vivekanandan@intel.com>
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

--===============2845511828470350638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cri: Add new PCI ID
URL   : https://patchwork.freedesktop.org/series/175367/
State : success

== Summary ==

CI Bug Log - changes from xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23_BAT -> xe-pw-175367v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175367v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175367v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23 -> xe-pw-175367v1

  IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23: c38e9a564523153a2fea3eacb6b632be61d1fa23
  xe-pw-175367v1: 175367v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175367v1/index.html

--===============2845511828470350638==
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
<tr><td><b>Series:</b></td><td>drm/xe/cri: Add new PCI ID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175367/">https://patchwork.freedesktop.org/series/175367/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175367v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175367v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23_BAT -&gt; xe-pw-175367v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175367v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175367v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23 -&gt; xe-pw-175367v1</li>
</ul>
<p>IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5866-c38e9a564523153a2fea3eacb6b632be61d1fa23: c38e9a564523153a2fea3eacb6b632be61d1fa23<br />
  xe-pw-175367v1: 175367v1</p>

</body>
</html>

--===============2845511828470350638==--
