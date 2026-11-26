Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE33606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 16:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739E210E97E;
	Thu, 26 Nov 2026 16:12:48 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AAE10E667;
 Thu, 26 Nov 2026 16:12:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8022326487286519923=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Account_for_2_PPC_horizonta?=
 =?utf-8?q?l_downscale_inefficiency_in_min_CDCLK?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 16:12:47 -0000
Message-ID: <179570956725.94291.8068815859780234975@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126121827.1951200-1-uma.shankar@intel.com>
In-Reply-To: <20261126121827.1951200-1-uma.shankar@intel.com>
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

--===============8022326487286519923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Account for 2 PPC horizontal downscale inefficiency in min CDCLK
URL   : https://patchwork.freedesktop.org/series/179749/
State : success

== Summary ==

CI Bug Log - changes from xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a_BAT -> xe-pw-179749v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a_BAT and xe-pw-179749v1_BAT:

### New IGT tests (4) ###

  * igt@xe_debugfs@info-read:
    - Statuses : 14 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@xe_debugfs@root-dir:
    - Statuses : 14 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@xe_debugfs@tile-dir:
    - Statuses : 14 pass(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_debugfs@tile-dir@tile-0:
    - Statuses : 14 pass(s)
    - Exec time: [0.0, 0.07] s

  

Known issues
------------

  Here are the changes found in xe-pw-179749v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#9841]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179749v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * Linux: xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a -> xe-pw-179749v1

  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a: c7a2a8c7a31d55cffae58b6551a554b65009c67a
  xe-pw-179749v1: 179749v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179749v1/index.html

--===============8022326487286519923==
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
<tr><td><b>Series:</b></td><td>Account for 2 PPC horizontal downscale inefficiency in min CDCLK</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179749/">https://patchwork.freedesktop.org/series/179749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179749v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179749v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a_BAT -&gt; xe-pw-179749v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a_BAT and xe-pw-179749v1_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_debugfs@info-read:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@root-dir:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@tile-dir:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@tile-dir@tile-0:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179749v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179749v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a -&gt; xe-pw-179749v1</li>
</ul>
<p>IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6241-c7a2a8c7a31d55cffae58b6551a554b65009c67a: c7a2a8c7a31d55cffae58b6551a554b65009c67a<br />
  xe-pw-179749v1: 179749v1</p>

</body>
</html>

--===============8022326487286519923==--
