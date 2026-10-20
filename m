Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B671606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 06:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33D10F251;
	Tue, 20 Oct 2026 06:42:43 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3110F247;
 Tue, 20 Oct 2026 06:42:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5770905343943510120=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv5?=
 =?utf-8?q?=2C1/2=5D_gpu/buddy=3A_restore_two-pass_clear/dirty_guard_for_ran?=
 =?utf-8?q?ge-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 06:42:43 -0000
Message-ID: <179247856332.44173.1077611358547199502@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020055537.1640552-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261020055537.1640552-1-arunpravin.paneerselvam@amd.com>
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

--===============5770905343943510120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/176444/
State : success

== Summary ==

CI Bug Log - changes from xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42_BAT -> xe-pw-176444v1_BAT
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

  Here are the changes found in xe-pw-176444v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176444v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42 -> xe-pw-176444v1

  IGT_9153: 9153
  xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42: 24d867f5e671c78760ab39087a57c25ad98e1f42
  xe-pw-176444v1: 176444v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176444v1/index.html

--===============5770905343943510120==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176444/">https://patchwork.freedesktop.org/series/176444/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176444v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176444v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42_BAT -&gt; xe-pw-176444v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176444v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176444v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42 -&gt; xe-pw-176444v1</li>
</ul>
<p>IGT_9153: 9153<br />
  xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42: 24d867f5e671c78760ab39087a57c25ad98e1f42<br />
  xe-pw-176444v1: 176444v1</p>

</body>
</html>

--===============5770905343943510120==--
