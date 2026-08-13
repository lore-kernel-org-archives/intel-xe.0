Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CBCC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91AC10E044;
	Thu, 13 Aug 2026 14:27:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF3010E044;
 Thu, 13 Aug 2026 14:27:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0125965565142920976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Capture_additiona?=
 =?utf-8?q?l_HW_register_state_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 14:27:00 -0000
Message-ID: <178663122043.48297.1963953902102697502@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

--===============0125965565142920976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Capture additional HW register state in devcoredump
URL   : https://patchwork.freedesktop.org/series/172150/
State : success

== Summary ==

CI Bug Log - changes from xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a_BAT -> xe-pw-172150v1_BAT
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

  * Linux: xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a -> xe-pw-172150v1

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a: c194081ec71ea95135c7f9ddbc7d02e9c8cad19a
  xe-pw-172150v1: 172150v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html

--===============0125965565142920976==
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
<tr><td><b>Series:</b></td><td>drm/xe: Capture additional HW register state in devcoredump</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172150/">https://patchwork.freedesktop.org/series/172150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a_BAT -&gt; xe-pw-172150v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a -&gt; xe-pw-172150v1</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a: c194081ec71ea95135c7f9ddbc7d02e9c8cad19a<br />
  xe-pw-172150v1: 172150v1</p>

</body>
</html>

--===============0125965565142920976==--
