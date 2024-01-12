Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E964C47077
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 02:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AA010E9D8;
	Fri, 12 Jan 2024 02:11:17 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756B810E6D1;
 Fri, 12 Jan 2024 02:11:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4665695557310410848=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_kunit=3A_Mark_filter=5Fglob_para?=
 =?utf-8?q?m_as_rw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 12 Jan 2024 02:11:15 -0000
Message-ID: <170502547547.331936.1195173160398042569@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112001240.1710962-1-lucas.demarchi@intel.com>
In-Reply-To: <20240112001240.1710962-1-lucas.demarchi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4665695557310410848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kunit: Mark filter_glob param as rw
URL   : https://patchwork.freedesktop.org/series/128696/
State : success

== Summary ==

CI Bug Log - changes from xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052_BAT -> xe-pw-128696v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 -> xe-pw-128696v1

  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
  xe-pw-128696v1: 128696v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128696v1/index.html

--===============4665695557310410848==
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
<tr><td><b>Series:</b></td><td>kunit: Mark filter_glob param as rw</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128696/">https://patchwork.freedesktop.org/series/128696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128696v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128696v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052_BAT -&gt; xe-pw-128696v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 -&gt; xe-pw-128696v1</li>
</ul>
<p>IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052<br />
  xe-pw-128696v1: 128696v1</p>

</body>
</html>

--===============4665695557310410848==--
