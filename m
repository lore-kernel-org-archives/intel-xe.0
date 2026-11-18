Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10667606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 11:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81E310FB0B;
	Wed, 18 Nov 2026 11:10:55 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8210FB0E;
 Wed, 18 Nov 2026 11:10:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0173872668785800468=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL2k5MTUvZGU6IHByZWZlciBp?=
 =?utf-8?b?bnRlbF9yZWdfb2Zmc2V0KCkgb3ZlciBpOTE1X21taW9fcmVnX29mZnNldCgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 11:10:54 -0000
Message-ID: <179500025443.42192.11530480767213507729@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118094508.3343569-1-jani.nikula@intel.com>
In-Reply-To: <20261118094508.3343569-1-jani.nikula@intel.com>
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

--===============0173872668785800468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/de: prefer intel_reg_offset() over i915_mmio_reg_offset()
URL   : https://patchwork.freedesktop.org/series/178875/
State : success

== Summary ==

CI Bug Log - changes from xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf_BAT -> xe-pw-178875v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf -> xe-pw-178875v1

  IGT_9196: 9196
  xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf: 0249d68f50c265a0f17c06fc21906fda945fe2cf
  xe-pw-178875v1: 178875v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178875v1/index.html

--===============0173872668785800468==
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
<tr><td><b>Series:</b></td><td>drm/i915/de: prefer intel_reg_offset() over i915_mmio_reg_offset()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178875/">https://patchwork.freedesktop.org/series/178875/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178875v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178875v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf_BAT -&gt; xe-pw-178875v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf -&gt; xe-pw-178875v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf: 0249d68f50c265a0f17c06fc21906fda945fe2cf<br />
  xe-pw-178875v1: 178875v1</p>

</body>
</html>

--===============0173872668785800468==--
