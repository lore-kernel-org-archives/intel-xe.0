Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EABC43327
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 08:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315F10F231;
	Thu,  2 Jul 2026 08:27:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBDC10F230;
 Thu,  2 Jul 2026 08:27:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5438984955078016724=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_unif?=
 =?utf-8?q?y_runtime_pm_calls_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 08:27:09 -0000
Message-ID: <178298082971.141897.15938338467213202517@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1782913901.git.jani.nikula@intel.com>
In-Reply-To: <cover.1782913901.git.jani.nikula@intel.com>
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

--===============5438984955078016724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: unify runtime pm calls (rev4)
URL   : https://patchwork.freedesktop.org/series/168519/
State : success

== Summary ==

CI Bug Log - changes from xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a_BAT -> xe-pw-168519v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a -> xe-pw-168519v4

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a: fa669b282e875afd49a387644ad4d47767fe2e0a
  xe-pw-168519v4: 168519v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168519v4/index.html

--===============5438984955078016724==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: unify runtime pm calls (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168519/">https://patchwork.freedesktop.org/series/168519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168519v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168519v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a_BAT -&gt; xe-pw-168519v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a -&gt; xe-pw-168519v4</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5328-fa669b282e875afd49a387644ad4d47767fe2e0a: fa669b282e875afd49a387644ad4d47767fe2e0a<br />
  xe-pw-168519v4: 168519v4</p>

</body>
</html>

--===============5438984955078016724==--
