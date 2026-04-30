Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A32FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 08:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609D910E0F8;
	Thu, 30 Apr 2026 08:25:05 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C945910E0F8;
 Thu, 30 Apr 2026 08:25:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3860477869908578763=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Do_not_include_LRC_indirect?=
 =?utf-8?q?_ring_state_size_in_engine_state_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 08:25:03 -0000
Message-ID: <177753750381.27433.13922429558762206552@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
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

--===============3860477869908578763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Do not include LRC indirect ring state size in engine state size
URL   : https://patchwork.freedesktop.org/series/165754/
State : success

== Summary ==

CI Bug Log - changes from xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a_BAT -> xe-pw-165754v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a -> xe-pw-165754v1

  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a: 98849fffd754b9c71f5d38bb370b840c33441f6a
  xe-pw-165754v1: 165754v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v1/index.html

--===============3860477869908578763==
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
<tr><td><b>Series:</b></td><td>Do not include LRC indirect ring state size in engine state size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165754/">https://patchwork.freedesktop.org/series/165754/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165754v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a_BAT -&gt; xe-pw-165754v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a -&gt; xe-pw-165754v1</li>
</ul>
<p>IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4957-98849fffd754b9c71f5d38bb370b840c33441f6a: 98849fffd754b9c71f5d38bb370b840c33441f6a<br />
  xe-pw-165754v1: 165754v1</p>

</body>
</html>

--===============3860477869908578763==--
