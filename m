Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46DDC04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 14:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646A11246A;
	Thu,  2 May 2024 14:51:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ED511246A;
 Thu,  2 May 2024 14:51:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1182307473196512609=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gt=3A_Fix_assert_in_L3_ba?=
 =?utf-8?q?nk_mask_generation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 14:51:53 -0000
Message-ID: <171466151327.1848758.4254042741043074921@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502124311.159695-1-francois.dugast@intel.com>
In-Reply-To: <20240502124311.159695-1-francois.dugast@intel.com>
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

--===============1182307473196512609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gt: Fix assert in L3 bank mask generation (rev4)
URL   : https://patchwork.freedesktop.org/series/133055/
State : success

== Summary ==

CI Bug Log - changes from xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8_BAT -> xe-pw-133055v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-133055v4_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1767


Build changes
-------------

  * Linux: xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8 -> xe-pw-133055v4

  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8: 1b26f047c5fd5ce2cb738736d729d198b4ead7c8
  xe-pw-133055v4: 133055v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133055v4/index.html

--===============1182307473196512609==
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
<tr><td><b>Series:</b></td><td>drm/xe/gt: Fix assert in L3 bank mask generation (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133055/">https://patchwork.freedesktop.org/series/133055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133055v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133055v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8_BAT -&gt; xe-pw-133055v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133055v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8 -&gt; xe-pw-133055v4</li>
</ul>
<p>IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1220-1b26f047c5fd5ce2cb738736d729d198b4ead7c8: 1b26f047c5fd5ce2cb738736d729d198b4ead7c8<br />
  xe-pw-133055v4: 133055v4</p>

</body>
</html>

--===============1182307473196512609==--
