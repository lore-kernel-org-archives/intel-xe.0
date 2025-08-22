Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2341CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 16:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A842A10EB82;
	Fri, 22 Aug 2025 16:31:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B569710EB7A;
 Fri, 22 Aug 2025 16:31:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2417404237343999803=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_handle_?=
 =?utf-8?q?return_value_in_intel=5Fsdvo=5Fenable=5Fhotplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 16:31:22 -0000
Message-ID: <175588028269.262277.1390359775194430010@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822154327.109766-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250822154327.109766-1-juhapekka.heikkila@gmail.com>
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

--===============2417404237343999803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: handle return value in intel_sdvo_enable_hotplug
URL   : https://patchwork.freedesktop.org/series/153362/
State : success

== Summary ==

CI Bug Log - changes from xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66_BAT -> xe-pw-153362v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153362v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66 -> xe-pw-153362v1

  IGT_8504: 8504
  xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66: a9008af007ab96e23814e3248475e7a4f4aebe66
  xe-pw-153362v1: 153362v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/index.html

--===============2417404237343999803==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: handle return value in intel_sdvo_enable_hotplug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153362/">https://patchwork.freedesktop.org/series/153362/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66_BAT -&gt; xe-pw-153362v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153362v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66 -&gt; xe-pw-153362v1</li>
</ul>
<p>IGT_8504: 8504<br />
  xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66: a9008af007ab96e23814e3248475e7a4f4aebe66<br />
  xe-pw-153362v1: 153362v1</p>

</body>
</html>

--===============2417404237343999803==--
