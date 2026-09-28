Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD26CA5FB1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAC910E651;
	Tue, 29 Sep 2026 12:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CndcBI1i";
	dkim-atps=neutral
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE55910E987;
 Mon, 28 Sep 2026 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=5qnV7EXhoJJFalznK0XSuqpTf5BmngP99eEFgR/0CXs=;
 b=CndcBI1iX95SD7YrTr9oVR148/T/UGzqfpsXqRoEELwYwfVgN6/HYBprUkjRm+
 thJpJ3dUrJvoLFZVOwaMoj0v7MQYHbcpZTIeJtTyWBsDFOv/6d5OKu27KCQW+Gem
 ii/9fFWxBlw2D6+CC2SFQquDg5K5Czz+GYJa+C59fdKpk=
Received: from fedora.localnet (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgA3NmsQt7pq6yiKBw--.44976S2;
 Tue, 29 Sep 2026 02:50:57 +0800 (CST)
From: "xizheTang2005@163.com" <xizheTang2005@163.com>
To: intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/vrr: Use vrr.in_range to determine if we
 need the AS SDP
Date: Tue, 29 Sep 2026 02:50:56 +0800
Message-ID: <tUu3Qs03RZO9Y8ZvpXUc7w@163.com>
In-Reply-To: <a902dd489a317d5c0d07e0703ec905caee0ed89b@intel.com>
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
 <RxSA9gIRRBSaKwxlF7t96Q@163.com>
 <a902dd489a317d5c0d07e0703ec905caee0ed89b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CM-TRANSID: QCgvCgA3NmsQt7pq6yiKBw--.44976S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw47tFy7tF4DWF1xXrW3Awb_yoW3KwcEqF
 ySqrsrW348tFyjva1rCF4xWF4xGay7try8X3y8W3WkZryrGasrZFW8GFn2yrn7Ja13Awn8
 C34Yvw1ruana9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb8u45UUUUU==
X-Originating-IP: [2001:250:20f:1:a533:cf01:13a0:45f8]
X-CM-SenderInfo: x0l2xvpwdqwjqqqvqiywtou0bp/xtbC6hE7kmq6txHVRgAA33
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:01 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

I retested on drm-tip, same SHA with and without series 174831.

Baseline: 972eeb850a4c (drm-tip 2026y-09m-28d-15h-36m-03s,
v7.3-rc5-601). Full kernels, not a distro xe.ko:

  A: 7.3.0-rc5-drmtip-A+  (no 174831)
  B: 7.3.0-rc5-drmtip-B+  (174831 applied;
     intel_dp_needs_as_sdp() returns crtc_state->vrr.in_range)

Machine is still the 21VG / 8086:b080 eDP from #9252
(EDID range 30-120 Hz).

Boot full modeset shows the same vertical corruption on A
and on B as Fedora 7.2. Suspend/resume on B is unchanged.
I did not dump drm.debug on these boots. If a dump is
needed I can recapture it and attach it to #9252.

This is not a Fedora stable-backport artefact: vanilla
drm-tip already breaks the same way. That matches #9252, 
174831 changes the gate to in_range, which is still true here, 
so B is expected not to fix it.

Thanks,
Xizhe Tang


