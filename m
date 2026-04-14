Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BF2F531CE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 00:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0040310E134;
	Tue, 14 Apr 2026 00:09:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90910E03A;
 Tue, 14 Apr 2026 00:09:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5549102926175712995=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Suppress_reset_lo?=
 =?utf-8?q?g_for_killed_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Apr 2026 00:09:31 -0000
Message-ID: <177612537196.458495.6922002920943908879@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413230724.714884-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260413230724.714884-2-daniele.ceraolospurio@intel.com>
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

--===============5549102926175712995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Suppress reset log for killed queues
URL   : https://patchwork.freedesktop.org/series/164827/
State : success

== Summary ==

CI Bug Log - changes from xe-4897-c8bad7becc008716c8475847328c549e178c813c_BAT -> xe-pw-164827v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164827v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4897-c8bad7becc008716c8475847328c549e178c813c/bat-atsm-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164827v1/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * Linux: xe-4897-c8bad7becc008716c8475847328c549e178c813c -> xe-pw-164827v1

  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4897-c8bad7becc008716c8475847328c549e178c813c: c8bad7becc008716c8475847328c549e178c813c
  xe-pw-164827v1: 164827v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164827v1/index.html

--===============5549102926175712995==
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
<tr><td><b>Series:</b></td><td>drm/xe: Suppress reset log for killed queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164827/">https://patchwork.freedesktop.org/series/164827/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164827v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164827v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4897-c8bad7becc008716c8475847328c549e178c813c_BAT -&gt; xe-pw-164827v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164827v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4897-c8bad7becc008716c8475847328c549e178c813c/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164827v1/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4897-c8bad7becc008716c8475847328c549e178c813c -&gt; xe-pw-164827v1</li>
</ul>
<p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4897-c8bad7becc008716c8475847328c549e178c813c: c8bad7becc008716c8475847328c549e178c813c<br />
  xe-pw-164827v1: 164827v1</p>

</body>
</html>

--===============5549102926175712995==--
