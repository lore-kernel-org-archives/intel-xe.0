Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86814C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 17:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABBD10E39A;
	Fri, 31 May 2024 17:50:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081910E305;
 Fri, 31 May 2024 17:50:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2598023604004681203=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_kernel-doc_to_some?=
 =?utf-8?q?_xe=5Flrc_interfaces_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 17:50:11 -0000
Message-ID: <171717781106.2241947.13520640921589272273@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531161230.32317-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240531161230.32317-1-niranjana.vishwanathapura@intel.com>
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

--===============2598023604004681203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add kernel-doc to some xe_lrc interfaces (rev2)
URL   : https://patchwork.freedesktop.org/series/134262/
State : success

== Summary ==

CI Bug Log - changes from xe-1390-71fb583af6dea41793b38d947a991f06156f7f11_BAT -> xe-pw-134262v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-134262v2_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_7875 -> IGT_7876
  * Linux: xe-1390-71fb583af6dea41793b38d947a991f06156f7f11 -> xe-pw-134262v2

  IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7876: 7876
  xe-1390-71fb583af6dea41793b38d947a991f06156f7f11: 71fb583af6dea41793b38d947a991f06156f7f11
  xe-pw-134262v2: 134262v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134262v2/index.html

--===============2598023604004681203==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add kernel-doc to some xe_lrc interfaces (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134262/">https://patchwork.freedesktop.org/series/134262/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134262v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134262v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1390-71fb583af6dea41793b38d947a991f06156f7f11_BAT -&gt; xe-pw-134262v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134262v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7875 -&gt; IGT_7876</li>
<li>Linux: xe-1390-71fb583af6dea41793b38d947a991f06156f7f11 -&gt; xe-pw-134262v2</li>
</ul>
<p>IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7876: 7876<br />
  xe-1390-71fb583af6dea41793b38d947a991f06156f7f11: 71fb583af6dea41793b38d947a991f06156f7f11<br />
  xe-pw-134262v2: 134262v2</p>

</body>
</html>

--===============2598023604004681203==--
