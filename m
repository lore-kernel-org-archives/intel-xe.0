Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD204C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 22:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E8113313;
	Fri,  3 May 2024 22:51:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281DB113313;
 Fri,  3 May 2024 22:51:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4694175883311203255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/vm=3A_Wait_for_availabili?=
 =?utf-8?q?ty_if_fault_mode_is_mismatched?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 22:51:32 -0000
Message-ID: <171477669215.1888398.9898680580710944723@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
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

--===============4694175883311203255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Wait for availability if fault mode is mismatched
URL   : https://patchwork.freedesktop.org/series/133188/
State : success

== Summary ==

CI Bug Log - changes from xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8_BAT -> xe-pw-133188v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133188v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@bad-pitch-0:
    - {bat-lnl-1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133188v1/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html

  
Known issues
------------

  Here are the changes found in xe-pw-133188v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466


Build changes
-------------

  * Linux: xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8 -> xe-pw-133188v1

  IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8: 7b36c294e75a5d05248feea5cc821aa1b59ef3c8
  xe-pw-133188v1: 133188v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133188v1/index.html

--===============4694175883311203255==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Wait for availability if fault mode is mismatched</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133188/">https://patchwork.freedesktop.org/series/133188/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133188v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133188v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8_BAT -&gt; xe-pw-133188v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133188v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-0:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133188v1/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133188v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8 -&gt; xe-pw-133188v1</li>
</ul>
<p>IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1237-7b36c294e75a5d05248feea5cc821aa1b59ef3c8: 7b36c294e75a5d05248feea5cc821aa1b59ef3c8<br />
  xe-pw-133188v1: 133188v1</p>

</body>
</html>

--===============4694175883311203255==--
