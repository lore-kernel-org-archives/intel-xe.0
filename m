Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096DB606A8A0
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36B110EF79;
	Mon, 16 Nov 2026 11:14:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F76510EF8D;
 Mon, 16 Nov 2026 11:14:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6923857053044925362=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/atomic=3A_Try_to_make_a?=
 =?utf-8?q?tomic+async_usable=2C_and_clear_up_the_=22async_update=22_helper_?=
 =?utf-8?q?confusion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 11:14:05 -0000
Message-ID: <179482764525.30722.7951916802917397221@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
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

--===============6923857053044925362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Try to make atomic+async usable, and clear up the "async update" helper confusion
URL   : https://patchwork.freedesktop.org/series/178652/
State : success

== Summary ==

CI Bug Log - changes from xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_BAT -> xe-pw-178652v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-1 

Known issues
------------

  Here are the changes found in xe-pw-178652v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3 -> xe-pw-178652v1

  IGT_9192: 9192
  xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3: 7bc1ac64a8303bd83e0394f306c4137a5a2febf3
  xe-pw-178652v1: 178652v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html

--===============6923857053044925362==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Try to make atomic+async usable, and clear up the &quot;async update&quot; helper confusion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178652/">https://patchwork.freedesktop.org/series/178652/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_BAT -&gt; xe-pw-178652v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178652v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3 -&gt; xe-pw-178652v1</li>
</ul>
<p>IGT_9192: 9192<br />
  xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3: 7bc1ac64a8303bd83e0394f306c4137a5a2febf3<br />
  xe-pw-178652v1: 178652v1</p>

</body>
</html>

--===============6923857053044925362==--
