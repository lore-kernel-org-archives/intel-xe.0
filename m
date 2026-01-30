Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC9EE6BF0C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 12:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C15810E9D7;
	Fri, 30 Jan 2026 12:50:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E7C10E9D4;
 Fri, 30 Jan 2026 12:50:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5138841328600988052=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Remove_device_private_pages?=
 =?utf-8?q?_from_physical_address_space_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 12:50:31 -0000
Message-ID: <176977743193.210706.18257719905290305425@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130111050.53670-1-jniethe@nvidia.com>
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
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

--===============5138841328600988052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev8)
URL   : https://patchwork.freedesktop.org/series/159738/
State : success

== Summary ==

CI Bug Log - changes from xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9_BAT -> xe-pw-159738v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8726 -> IGT_8727
  * Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -> xe-pw-159738v8

  IGT_8726: 8726
  IGT_8727: 8727
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9
  xe-pw-159738v8: 159738v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v8/index.html

--===============5138841328600988052==
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
<tr><td><b>Series:</b></td><td>Remove device private pages from physical address space (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9_BAT -&gt; xe-pw-159738v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8726 -&gt; IGT_8727</li>
<li>Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -&gt; xe-pw-159738v8</li>
</ul>
<p>IGT_8726: 8726<br />
  IGT_8727: 8727<br />
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9<br />
  xe-pw-159738v8: 159738v8</p>

</body>
</html>

--===============5138841328600988052==--
