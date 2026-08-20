Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEC1C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 07:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE17610EF34;
	Thu, 20 Aug 2026 07:43:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C555410EF34;
 Thu, 20 Aug 2026 07:43:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7526576386831310128=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Reject_page_fault?=
 =?utf-8?q?s_from_non-fault-mode_scratch_VMs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Aug 2026 07:43:04 -0000
Message-ID: <178721178479.69537.14918118213025375748@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260820065445.567228-1-arvind.yadav@intel.com>
In-Reply-To: <20260820065445.567228-1-arvind.yadav@intel.com>
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

--===============7526576386831310128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reject page faults from non-fault-mode scratch VMs
URL   : https://patchwork.freedesktop.org/series/172488/
State : success

== Summary ==

CI Bug Log - changes from xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b_BAT -> xe-pw-172488v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b -> xe-pw-172488v1

  IGT_9063: 9063
  xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b: 56f97d9e469399721a815f80710d2baab0d7df4b
  xe-pw-172488v1: 172488v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172488v1/index.html

--===============7526576386831310128==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reject page faults from non-fault-mode scratch VMs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172488/">https://patchwork.freedesktop.org/series/172488/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172488v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172488v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b_BAT -&gt; xe-pw-172488v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b -&gt; xe-pw-172488v1</li>
</ul>
<p>IGT_9063: 9063<br />
  xe-5621-56f97d9e469399721a815f80710d2baab0d7df4b: 56f97d9e469399721a815f80710d2baab0d7df4b<br />
  xe-pw-172488v1: 172488v1</p>

</body>
</html>

--===============7526576386831310128==--
