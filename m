Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824EACCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E19C10E20A;
	Fri, 24 Oct 2025 15:48:09 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865E910E20A;
 Fri, 24 Oct 2025 15:48:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0929547485152543337=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_Atomicize?=
 =?utf-8?q?_CCS_copy_command_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 15:48:07 -0000
Message-ID: <176132088754.51052.17338715863666135004@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
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

--===============0929547485152543337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Atomicize CCS copy command setup
URL   : https://patchwork.freedesktop.org/series/156482/
State : success

== Summary ==

CI Bug Log - changes from xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf_BAT -> xe-pw-156482v1_BAT
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

  * Linux: xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf -> xe-pw-156482v1

  IGT_8596: 8596
  xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf: 1e54d2c469a91e00a39ff7f6b98c31d290245ecf
  xe-pw-156482v1: 156482v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156482v1/index.html

--===============0929547485152543337==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Atomicize CCS copy command setup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156482/">https://patchwork.freedesktop.org/series/156482/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156482v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156482v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf_BAT -&gt; xe-pw-156482v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf -&gt; xe-pw-156482v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3981-1e54d2c469a91e00a39ff7f6b98c31d290245ecf: 1e54d2c469a91e00a39ff7f6b98c31d290245ecf<br />
  xe-pw-156482v1: 156482v1</p>

</body>
</html>

--===============0929547485152543337==--
