Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7519BC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 18:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD25688697;
	Fri, 23 Aug 2024 18:48:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE0188697;
 Fri, 23 Aug 2024 18:48:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8725476081427626978=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_separate_rpm_lockd?=
 =?utf-8?q?ep_map_for_non-d3cold-capable_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 18:48:28 -0000
Message-ID: <172443890870.747696.11577368868119585846@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
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

--===============8725476081427626978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices
URL   : https://patchwork.freedesktop.org/series/137730/
State : success

== Summary ==

CI Bug Log - changes from xe-1821-96041621daaf71059d790a2ddbaa60114371eada_BAT -> xe-pw-137730v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137730v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#324]) -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -> xe-pw-137730v1

  IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada
  xe-pw-137730v1: 137730v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html

--===============8725476081427626978==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137730/">https://patchwork.freedesktop.org/series/137730/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1821-96041621daaf71059d790a2ddbaa60114371eada_BAT -&gt; xe-pw-137730v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137730v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -&gt; xe-pw-137730v1</li>
</ul>
<p>IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada<br />
  xe-pw-137730v1: 137730v1</p>

</body>
</html>

--===============8725476081427626978==--
