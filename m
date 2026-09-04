Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A98C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 09:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694D10F987;
	Fri,  4 Sep 2026 09:05:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3BE10E13D;
 Fri,  4 Sep 2026 09:05:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4069409292518668145=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Guard_page-fa?=
 =?utf-8?q?ult_ack_with_runtime_PM_check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 09:05:47 -0000
Message-ID: <178851274795.121713.14611595477604842872@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904080505.4159219-2-varun.gupta@intel.com>
In-Reply-To: <20260904080505.4159219-2-varun.gupta@intel.com>
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

--===============4069409292518668145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Guard page-fault ack with runtime PM check (rev2)
URL   : https://patchwork.freedesktop.org/series/173248/
State : success

== Summary ==

CI Bug Log - changes from xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a_BAT -> xe-pw-173248v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173248v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [TIMEOUT][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a/bat-ptl-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173248v2/bat-ptl-2/igt@xe_waitfence@abstime.html

  


Build changes
-------------

  * Linux: xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a -> xe-pw-173248v2

  IGT_9084: 9084
  xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a: 6db9bc26b0177aed554e3c57d8c30dad5da11a1a
  xe-pw-173248v2: 173248v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173248v2/index.html

--===============4069409292518668145==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Guard page-fault ack with runtime PM check (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173248/">https://patchwork.freedesktop.org/series/173248/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173248v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173248v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a_BAT -&gt; xe-pw-173248v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173248v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173248v2/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a -&gt; xe-pw-173248v2</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5692-6db9bc26b0177aed554e3c57d8c30dad5da11a1a: 6db9bc26b0177aed554e3c57d8c30dad5da11a1a<br />
  xe-pw-173248v2: 173248v2</p>

</body>
</html>

--===============4069409292518668145==--
