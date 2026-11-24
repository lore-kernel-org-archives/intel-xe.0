Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE4606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2C10F0AB;
	Tue, 24 Nov 2026 20:42:47 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDC010F0A6;
 Tue, 24 Nov 2026 20:42:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4263506081864940964=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Destroy_the_ttm?=
 =?utf-8?q?=5Ftt_in_ttm=5Fbo=5Fmove=5Fnull=28=29_when_it=27s_no_longer_neede?=
 =?utf-8?q?d?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 20:42:46 -0000
Message-ID: <179555296657.80588.10639262692817994233@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124190954.47690-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261124190954.47690-1-thomas.hellstrom@linux.intel.com>
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

--===============4263506081864940964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it's no longer needed
URL   : https://patchwork.freedesktop.org/series/179550/
State : success

== Summary ==

CI Bug Log - changes from xe-6225-0136c4319eff88f24494b8d1655e247a935dda57_BAT -> xe-pw-179550v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-179550v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9202 -> IGT_9203
  * Linux: xe-6225-0136c4319eff88f24494b8d1655e247a935dda57 -> xe-pw-179550v1

  IGT_9202: 9202
  IGT_9203: 9203
  xe-6225-0136c4319eff88f24494b8d1655e247a935dda57: 0136c4319eff88f24494b8d1655e247a935dda57
  xe-pw-179550v1: 179550v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html

--===============4263506081864940964==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it&#x27;s no longer needed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179550/">https://patchwork.freedesktop.org/series/179550/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6225-0136c4319eff88f24494b8d1655e247a935dda57_BAT -&gt; xe-pw-179550v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179550v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9202 -&gt; IGT_9203</li>
<li>Linux: xe-6225-0136c4319eff88f24494b8d1655e247a935dda57 -&gt; xe-pw-179550v1</li>
</ul>
<p>IGT_9202: 9202<br />
  IGT_9203: 9203<br />
  xe-6225-0136c4319eff88f24494b8d1655e247a935dda57: 0136c4319eff88f24494b8d1655e247a935dda57<br />
  xe-pw-179550v1: 179550v1</p>

</body>
</html>

--===============4263506081864940964==--
