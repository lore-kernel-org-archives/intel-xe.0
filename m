Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA64C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D879410E35C;
	Wed,  1 Jul 2026 13:45:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3965910E369;
 Wed,  1 Jul 2026 13:45:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8645193603573497148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_fix_IOVA_unma?=
 =?utf-8?q?p_path_in_=5F=5Fdrm=5Fgpusvm=5Funmap=5Fpages=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honglei1.huang@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 13:45:56 -0000
Message-ID: <178291355623.137468.1806720708420944822@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260627033325.3795298-1-honglei1.huang@amd.com>
In-Reply-To: <20260627033325.3795298-1-honglei1.huang@amd.com>
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

--===============8645193603573497148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: fix IOVA unmap path in __drm_gpusvm_unmap_pages()
URL   : https://patchwork.freedesktop.org/series/169599/
State : success

== Summary ==

CI Bug Log - changes from xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73_BAT -> xe-pw-169599v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73 -> xe-pw-169599v1

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73: 029a25c8ec1d240e0d1ea63d472603bb86e2fb73
  xe-pw-169599v1: 169599v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169599v1/index.html

--===============8645193603573497148==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: fix IOVA unmap path in __drm_gpusvm_unmap_pages()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169599/">https://patchwork.freedesktop.org/series/169599/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169599v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169599v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73_BAT -&gt; xe-pw-169599v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73 -&gt; xe-pw-169599v1</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5320-029a25c8ec1d240e0d1ea63d472603bb86e2fb73: 029a25c8ec1d240e0d1ea63d472603bb86e2fb73<br />
  xe-pw-169599v1: 169599v1</p>

</body>
</html>

--===============8645193603573497148==--
