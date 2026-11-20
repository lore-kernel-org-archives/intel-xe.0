Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32E606A685
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E36010E293;
	Fri, 20 Nov 2026 21:47:32 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D94A10E293;
 Fri, 20 Nov 2026 21:47:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6098220285191140931=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Crescent_Island_PMT_support?=
 =?utf-8?q?_=28rev22=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 21:47:31 -0000
Message-ID: <179521125131.62267.15628203555782270665@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

--===============6098220285191140931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev22)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418_BAT -> xe-pw-160717v22_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v22_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v22_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v22_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v22/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  


Build changes
-------------

  * IGT: IGT_9200 -> IGT_9201
  * Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -> xe-pw-160717v22

  IGT_9200: 9200
  IGT_9201: 9201
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418
  xe-pw-160717v22: 160717v22

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v22/index.html

--===============6098220285191140931==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev22)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v22/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v22/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418_BAT -&gt; xe-pw-160717v22_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v22_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160717v22_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160717v22_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v22/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9200 -&gt; IGT_9201</li>
<li>Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -&gt; xe-pw-160717v22</li>
</ul>
<p>IGT_9200: 9200<br />
  IGT_9201: 9201<br />
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418<br />
  xe-pw-160717v22: 160717v22</p>

</body>
</html>

--===============6098220285191140931==--
