Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD5ECCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 21:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90910E694;
	Tue, 14 Oct 2025 21:03:17 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9C10E694;
 Tue, 14 Oct 2025 21:03:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2134877205008446309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Don=27t_call_xe?=
 =?utf-8?q?=5Fdevice=5Fget=5Fgt_twice_in_xe=5Fhw=5Fengine=5Flookup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 21:03:15 -0000
Message-ID: <176047579568.12561.402254125834334340@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014193639.148788-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251014193639.148788-2-jonathan.cavitt@intel.com>
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

--===============2134877205008446309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't call xe_device_get_gt twice in xe_hw_engine_lookup
URL   : https://patchwork.freedesktop.org/series/155937/
State : success

== Summary ==

CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -> xe-pw-155937v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8582 -> IGT_8583
  * Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -> xe-pw-155937v1

  IGT_8582: 8582
  IGT_8583: 8583
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
  xe-pw-155937v1: 155937v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/index.html

--===============2134877205008446309==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t call xe_device_get_gt twice in xe_hw_engine_lookup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155937/">https://patchwork.freedesktop.org/series/155937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -&gt; xe-pw-155937v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGT_8583</li>
<li>Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -&gt; xe-pw-155937v1</li>
</ul>
<p>IGT_8582: 8582<br />
  IGT_8583: 8583<br />
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb<br />
  xe-pw-155937v1: 155937v1</p>

</body>
</html>

--===============2134877205008446309==--
