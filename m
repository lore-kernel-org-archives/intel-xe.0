Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC62FC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFA710E8A1;
	Fri,  1 Aug 2025 14:58:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F7410E8A1;
 Fri,  1 Aug 2025 14:58:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7360567861648053791=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlL3ZmOiBGaXggSVNfRVJS?=
 =?utf-8?b?KCkgdnMgTlVMTCBjaGVjayBpbiB4ZV9zcmlvdl92Zl9jY3NfaW5pdCgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 14:58:34 -0000
Message-ID: <175406031486.205465.9609712073142952843@1538d3639d33>
X-Patchwork-Hint: ignore
References: <aIzB8-Y6wtZvfNQT@stanley.mountain>
In-Reply-To: <aIzB8-Y6wtZvfNQT@stanley.mountain>
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

--===============7360567861648053791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fix IS_ERR() vs NULL check in xe_sriov_vf_ccs_init()
URL   : https://patchwork.freedesktop.org/series/152418/
State : success

== Summary ==

CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_BAT -> xe-pw-152418v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -> xe-pw-152418v1

  IGT_8482: 8482
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f
  xe-pw-152418v1: 152418v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152418v1/index.html

--===============7360567861648053791==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fix IS_ERR() vs NULL check in xe_sriov_vf_ccs_init()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152418/">https://patchwork.freedesktop.org/series/152418/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152418v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152418v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_BAT -&gt; xe-pw-152418v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -&gt; xe-pw-152418v1</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f<br />
  xe-pw-152418v1: 152418v1</p>

</body>
</html>

--===============7360567861648053791==--
