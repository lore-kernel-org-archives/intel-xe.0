Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14AFC5AC7C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 17:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E5D10F25F;
	Thu,  6 Aug 2026 17:22:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B97810F268;
 Thu,  6 Aug 2026 17:22:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6853860843038470364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_cold_reset_recove?=
 =?utf-8?q?ry_method_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 17:22:01 -0000
Message-ID: <178603692156.25985.14332435024627248554@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805071152.1225416-6-mallesh.koujalagi@intel.com>
In-Reply-To: <20260805071152.1225416-6-mallesh.koujalagi@intel.com>
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

--===============6853860843038470364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce cold reset recovery method (rev14)
URL   : https://patchwork.freedesktop.org/series/163428/
State : success

== Summary ==

CI Bug Log - changes from xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448_BAT -> xe-pw-163428v14_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-nvls-1 
  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-163428v14_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759


Build changes
-------------

  * Linux: xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448 -> xe-pw-163428v14

  IGT_9043: 9043
  xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448: 66c6b22c4f075c8c0e0d5f0fce4e198201f9c448
  xe-pw-163428v14: 163428v14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v14/index.html

--===============6853860843038470364==
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
<tr><td><b>Series:</b></td><td>Introduce cold reset recovery method (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163428/">https://patchwork.freedesktop.org/series/163428/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v14/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v14/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448_BAT -&gt; xe-pw-163428v14_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-nvls-1 <br />
  Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163428v14_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448 -&gt; xe-pw-163428v14</li>
</ul>
<p>IGT_9043: 9043<br />
  xe-5556-66c6b22c4f075c8c0e0d5f0fce4e198201f9c448: 66c6b22c4f075c8c0e0d5f0fce4e198201f9c448<br />
  xe-pw-163428v14: 163428v14</p>

</body>
</html>

--===============6853860843038470364==--
