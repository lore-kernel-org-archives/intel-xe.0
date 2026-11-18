Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA00606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2363710E44D;
	Wed, 18 Nov 2026 07:10:20 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BE510E44D;
 Wed, 18 Nov 2026 07:10:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6755517788842976269=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_drm/xe/pcode=3A_Add_MEMORY=5FCONFIG_mailbox_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 07:10:19 -0000
Message-ID: <179498581903.41175.12985158907257844729@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6755517788842976269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
URL   : https://patchwork.freedesktop.org/series/178849/
State : success

== Summary ==

CI Bug Log - changes from xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a_BAT -> xe-pw-178849v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a -> xe-pw-178849v1

  IGT_9196: 9196
  xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a: fb078d17b966f7a24720b6e3a5de06d43c2e184a
  xe-pw-178849v1: 178849v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178849v1/index.html

--===============6755517788842976269==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178849/">https://patchwork.freedesktop.org/series/178849/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178849v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178849v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a_BAT -&gt; xe-pw-178849v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a -&gt; xe-pw-178849v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6168-fb078d17b966f7a24720b6e3a5de06d43c2e184a: fb078d17b966f7a24720b6e3a5de06d43c2e184a<br />
  xe-pw-178849v1: 178849v1</p>

</body>
</html>

--===============6755517788842976269==--
