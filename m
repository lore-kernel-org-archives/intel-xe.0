Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4546C5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 01:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE19010E2FA;
	Fri,  6 Jun 2025 01:02:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666410E2FA;
 Fri,  6 Jun 2025 01:02:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8731722493027588339=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/bmg=3A_Update_PCI_Id?=
 =?utf-8?q?=27s_and_Workarounds_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 01:02:00 -0000
Message-ID: <174917172022.54219.13957283784545398353@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
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

--===============8731722493027588339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bmg: Update PCI Id's and Workarounds (rev4)
URL   : https://patchwork.freedesktop.org/series/149641/
State : success

== Summary ==

CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -> xe-pw-149641v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -> xe-pw-149641v4

  IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7
  xe-pw-149641v4: 149641v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v4/index.html

--===============8731722493027588339==
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
<tr><td><b>Series:</b></td><td>drm/xe/bmg: Update PCI Id&#x27;s and Workarounds (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149641/">https://patchwork.freedesktop.org/series/149641/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -&gt; xe-pw-149641v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -&gt; xe-pw-149641v4</li>
</ul>
<p>IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7<br />
  xe-pw-149641v4: 149641v4</p>

</body>
</html>

--===============8731722493027588339==--
