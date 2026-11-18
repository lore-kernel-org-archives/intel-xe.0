Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5B606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5801120A0;
	Wed, 18 Nov 2026 22:40:37 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A2C1120A0;
 Wed, 18 Nov 2026 22:40:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3802408919697858969=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Reset_PF_sched?=
 =?utf-8?q?uling_defaults_on_auto_provisioning_restore_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rachapalli Bandi Jagadeesh" <jagadeesh.rachapalli.bandi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 22:40:37 -0000
Message-ID: <179504163706.46521.16985568530971305960@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118162346.1204457-1-jagadeesh.rachapalli.bandi@intel.com>
In-Reply-To: <20261118162346.1204457-1-jagadeesh.rachapalli.bandi@intel.com>
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

--===============3802408919697858969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Reset PF scheduling defaults on auto provisioning restore (rev2)
URL   : https://patchwork.freedesktop.org/series/178227/
State : success

== Summary ==

CI Bug Log - changes from xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1_BAT -> xe-pw-178227v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1 -> xe-pw-178227v2

  IGT_9197: 9197
  xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1: 966607dba8b9ce2ffc4eceee0c0047daf3923dc1
  xe-pw-178227v2: 178227v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178227v2/index.html

--===============3802408919697858969==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Reset PF scheduling defaults on auto provisioning restore (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178227/">https://patchwork.freedesktop.org/series/178227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178227v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178227v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1_BAT -&gt; xe-pw-178227v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1 -&gt; xe-pw-178227v2</li>
</ul>
<p>IGT_9197: 9197<br />
  xe-6178-966607dba8b9ce2ffc4eceee0c0047daf3923dc1: 966607dba8b9ce2ffc4eceee0c0047daf3923dc1<br />
  xe-pw-178227v2: 178227v2</p>

</body>
</html>

--===============3802408919697858969==--
