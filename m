Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5FC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1A310EA8F;
	Tue,  8 Sep 2026 07:47:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03710EA8C;
 Tue,  8 Sep 2026 07:47:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2414631948828391715=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_support_for_Common_SDP_?=
 =?utf-8?q?Transmission_Line_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 07:47:22 -0000
Message-ID: <178885364243.133338.15117411102268871162@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

--===============2414631948828391715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Common SDP Transmission Line (rev5)
URL   : https://patchwork.freedesktop.org/series/162623/
State : success

== Summary ==

CI Bug Log - changes from xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7_BAT -> xe-pw-162623v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-162623v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162623v5/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * Linux: xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7 -> xe-pw-162623v5

  IGT_9085: 9085
  xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7: 8968c3fbc95e850342a9316f74df831afc2376b7
  xe-pw-162623v5: 162623v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162623v5/index.html

--===============2414631948828391715==
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
<tr><td><b>Series:</b></td><td>Add support for Common SDP Transmission Line (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162623/">https://patchwork.freedesktop.org/series/162623/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162623v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162623v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7_BAT -&gt; xe-pw-162623v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162623v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162623v5/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7 -&gt; xe-pw-162623v5</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7: 8968c3fbc95e850342a9316f74df831afc2376b7<br />
  xe-pw-162623v5: 162623v5</p>

</body>
</html>

--===============2414631948828391715==--
