Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A09AC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 20:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0A811323A;
	Fri,  3 May 2024 20:21:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831C911323A;
 Fri,  3 May 2024 20:21:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2159373912590883996=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Demote_CCS=5FMODE_info?=
 =?utf-8?q?_to_debug_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 20:21:41 -0000
Message-ID: <171476770153.1887279.12388915580467512773@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503190331.6690-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240503190331.6690-1-rodrigo.vivi@intel.com>
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

--===============2159373912590883996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Demote CCS_MODE info to debug only
URL   : https://patchwork.freedesktop.org/series/133185/
State : success

== Summary ==

CI Bug Log - changes from xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163_BAT -> xe-pw-133185v1_BAT
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

  Here are the changes found in xe-pw-133185v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466


Build changes
-------------

  * Linux: xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163 -> xe-pw-133185v1

  IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163: e9ea5061461b07fcb7e19892a54a61aa8fa1d163
  xe-pw-133185v1: 133185v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133185v1/index.html

--===============2159373912590883996==
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
<tr><td><b>Series:</b></td><td>drm/xe: Demote CCS_MODE info to debug only</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133185/">https://patchwork.freedesktop.org/series/133185/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133185v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133185v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163_BAT -&gt; xe-pw-133185v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133185v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163 -&gt; xe-pw-133185v1</li>
</ul>
<p>IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163: e9ea5061461b07fcb7e19892a54a61aa8fa1d163<br />
  xe-pw-133185v1: 133185v1</p>

</body>
</html>

--===============2159373912590883996==--
