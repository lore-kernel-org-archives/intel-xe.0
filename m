Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6FACD8C8C
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 18:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833F610E2F1;
	Sun,  7 Jun 2026 18:06:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8B210E2F1;
 Sun,  7 Jun 2026 18:06:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6658306360211936921=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_fan_control_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 07 Jun 2026 18:06:19 -0000
Message-ID: <178085557929.51702.11656291081892517270@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260607172848.2970580-1-karthik.poosa@intel.com>
In-Reply-To: <20260607172848.2970580-1-karthik.poosa@intel.com>
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

--===============6658306360211936921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add fan control support
URL   : https://patchwork.freedesktop.org/series/168027/
State : success

== Summary ==

CI Bug Log - changes from xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe_BAT -> xe-pw-168027v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-wcl-2 

Known issues
------------

  Here are the changes found in xe-pw-168027v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe/bat-atsm-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168027v1/bat-atsm-2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8950 -> IGT_8951
  * Linux: xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe -> xe-pw-168027v1

  IGT_8950: 8950
  IGT_8951: 8951
  xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe: 98b708c6794c9789a7d7caa89aa5967c6df413fe
  xe-pw-168027v1: 168027v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168027v1/index.html

--===============6658306360211936921==
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
<tr><td><b>Series:</b></td><td>Add fan control support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168027/">https://patchwork.freedesktop.org/series/168027/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168027v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168027v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe_BAT -&gt; xe-pw-168027v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-wcl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168027v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe/bat-atsm-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168027v1/bat-atsm-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8950 -&gt; IGT_8951</li>
<li>Linux: xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe -&gt; xe-pw-168027v1</li>
</ul>
<p>IGT_8950: 8950<br />
  IGT_8951: 8951<br />
  xe-5217-98b708c6794c9789a7d7caa89aa5967c6df413fe: 98b708c6794c9789a7d7caa89aa5967c6df413fe<br />
  xe-pw-168027v1: 168027v1</p>

</body>
</html>

--===============6658306360211936921==--
