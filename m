Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12725606A324
	for <intel-xe@archiver.kernel.org>; Sun,  1 Nov 2026 04:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C029410E0B6;
	Sun,  1 Nov 2026 04:21:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60D710E07D;
 Sun,  1 Nov 2026 04:21:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4443492465474663495=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Fmst=3A_Avoid_?=
 =?utf-8?q?the_3_s_ACT_timeouts_after_the_upstream_HPD_drops_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 01 Nov 2026 04:21:36 -0000
Message-ID: <179350689693.98330.3430969679084219260@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261101033535.2078860-1-xiaolu.xie@intel.com>
In-Reply-To: <20261101033535.2078860-1-xiaolu.xie@intel.com>
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

--===============4443492465474663495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Avoid the 3 s ACT timeouts after the upstream HPD drops (rev3)
URL   : https://patchwork.freedesktop.org/series/177318/
State : success

== Summary ==

CI Bug Log - changes from xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96_BAT -> xe-pw-177318v3_BAT
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

  Here are the changes found in xe-pw-177318v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177318v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96 -> xe-pw-177318v3

  IGT_9173: 9173
  xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96: a3d3816838d5a0e122641b68b9c502cc5d016e96
  xe-pw-177318v3: 177318v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177318v3/index.html

--===============4443492465474663495==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Avoid the 3 s ACT timeouts after the upstream HPD drops (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177318/">https://patchwork.freedesktop.org/series/177318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177318v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177318v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96_BAT -&gt; xe-pw-177318v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177318v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177318v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96 -&gt; xe-pw-177318v3</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96: a3d3816838d5a0e122641b68b9c502cc5d016e96<br />
  xe-pw-177318v3: 177318v3</p>

</body>
</html>

--===============4443492465474663495==--
