Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F86C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 11:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56A210E220;
	Wed,  5 Mar 2025 11:07:08 +0000 (UTC)
Received: from db0ebb060c04 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817B10E220;
 Wed,  5 Mar 2025 11:07:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5588322035418240952=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Userptr_invalid_p?=
 =?utf-8?q?age_access_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 11:07:07 -0000
Message-ID: <174117282774.50656.3989635936526851640@db0ebb060c04>
X-Patchwork-Hint: ignore
References: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
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

--===============5588322035418240952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Userptr invalid page access fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/145630/
State : success

== Summary ==

CI Bug Log - changes from xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e_BAT -> xe-pw-145630v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e -> xe-pw-145630v4

  IGT_8261: 8261
  xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e: a76e0e6082b604f430c20762ca8495a854ae5f0e
  xe-pw-145630v4: 145630v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145630v4/index.html

--===============5588322035418240952==
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
<tr><td><b>Series:</b></td><td>drm/xe: Userptr invalid page access fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145630/">https://patchwork.freedesktop.org/series/145630/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145630v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145630v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e_BAT -&gt; xe-pw-145630v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e -&gt; xe-pw-145630v4</li>
</ul>
<p>IGT_8261: 8261<br />
  xe-2755-a76e0e6082b604f430c20762ca8495a854ae5f0e: a76e0e6082b604f430c20762ca8495a854ae5f0e<br />
  xe-pw-145630v4: 145630v4</p>

</body>
</html>

--===============5588322035418240952==--
