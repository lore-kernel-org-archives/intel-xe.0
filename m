Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D8EC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 20:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252110E21F;
	Thu, 24 Apr 2025 20:35:36 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A33C10E21F;
 Thu, 24 Apr 2025 20:35:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6679065729329043155=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 20:35:33 -0000
Message-ID: <174552693311.8616.504860242668499080@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250424143812.11210-1-jonathan.cavitt@intel.com>
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

--===============6679065729329043155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
URL   : https://patchwork.freedesktop.org/series/148215/
State : success

== Summary ==

CI Bug Log - changes from xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b_BAT -> xe-pw-148215v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b -> xe-pw-148215v1

  IGT_8336: 8336
  xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b: 6f55ae2f38d94749192304df6ac565c1fd5b584b
  xe-pw-148215v1: 148215v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148215v1/index.html

--===============6679065729329043155==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148215/">https://patchwork.freedesktop.org/series/148215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148215v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148215v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b_BAT -&gt; xe-pw-148215v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b -&gt; xe-pw-148215v1</li>
</ul>
<p>IGT_8336: 8336<br />
  xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b: 6f55ae2f38d94749192304df6ac565c1fd5b584b<br />
  xe-pw-148215v1: 148215v1</p>

</body>
</html>

--===============6679065729329043155==--
