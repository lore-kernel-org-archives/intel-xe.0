Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B65CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 13:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF6810E010;
	Mon, 18 Sep 2023 13:13:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68A2510E010;
 Mon, 18 Sep 2023 13:13:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5894EAADD5;
 Mon, 18 Sep 2023 13:13:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7970655514731980418=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Mon, 18 Sep 2023 13:13:26 -0000
Message-ID: <169504280633.32417.5322683026970980758@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918114848.67712-1-dliberman@habana.ai>
In-Reply-To: <20230918114848.67712-1-dliberman@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5B1/3=5D_drm/xe=3A_proper_setting_of_irq_enabled_f?=
 =?utf-8?q?lag?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7970655514731980418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe: proper setting of irq enabled flag
URL   : https://patchwork.freedesktop.org/series/123856/
State : success

== Summary ==

CI Bug Log - changes from xe-377-717f01815b20bde3f081a18f42f31673ce1f107f_BAT -> xe-pw-123856v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-377-717f01815b20bde3f081a18f42f31673ce1f107f -> xe-pw-123856v1

  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-377-717f01815b20bde3f081a18f42f31673ce1f107f: 717f01815b20bde3f081a18f42f31673ce1f107f
  xe-pw-123856v1: 123856v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123856v1/index.html

--===============7970655514731980418==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe: proper setting of irq enabled flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123856/">https://patchwork.freedesktop.org/series/123856/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123856v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123856v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-377-717f01815b20bde3f081a18f42f31673ce1f107f_BAT -&gt; xe-pw-123856v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-377-717f01815b20bde3f081a18f42f31673ce1f107f -&gt; xe-pw-123856v1</li>
</ul>
<p>IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-377-717f01815b20bde3f081a18f42f31673ce1f107f: 717f01815b20bde3f081a18f42f31673ce1f107f<br />
  xe-pw-123856v1: 123856v1</p>

</body>
</html>

--===============7970655514731980418==--
