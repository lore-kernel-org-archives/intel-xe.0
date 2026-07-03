Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F9C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 23:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C090110E197;
	Fri,  3 Jul 2026 23:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="hUhyamIv";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C1810E197;
 Fri,  3 Jul 2026 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1783121250;
 bh=7YhStp6EJiEVCO+a6a9StkgkNtvZS2IhoZ+Tm3oKdv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hUhyamIvkqYtXk6QZCdDSX+2tWxLSrdWPXwAG1v5CfriBX6EehYsrrqcl047MpTZn
 DjdO/7sgBjBB4iIPWGWjVl/nbXNG5t6jI8E8QTrGBNwiScjP9qT4s5bs7ugXt56AIa
 Hb0qawhLW971sqfRSmW4NKVdyoXnR/z+cTj4aB4fBu2y71floPs+JgxNyw7O/mD0gA
 2zSidRhER1o+6r6RyEpZ8girk/6FaS7dW4UWDrzFEquP2o/i/KT3ZwZDZNfoNc3ZoU
 7MnGvHzCQMbuKTnYdj4oh3spyfs/soqEUU714amXQQlETctydD2s2vCQWU98Np5zEM
 L3ojYEnB0C+Ww==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 43BC118764;
 Sat,  4 Jul 2026 01:27:30 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Sat, 4 Jul 2026 01:27:29 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.kaplan@sms-medipool.de
Subject: Re: [PATCH 1/3] drm/i915/dp: Prefer DSC over a 6 bpc uncompressed
 output
Date: Sat,  4 Jul 2026 01:27:28 +0200
Message-ID: <20260703232728.4424-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <113da161-b03f-47ab-973d-96799ada5f13@intel.com>
References: <113da161-b03f-47ab-973d-96799ada5f13@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On 29/06/2026 09:29, Nautiyal, Ankit K wrote:
> I agree to this part. As you have noted, since HDMI does not accept 6
> bpc, we should narrow down the check to HDMI sinks behind a DFP.

Hi Ankit,

thanks for the review.
I will send a v2 of the series with the limit gated on
intel_dp_has_hdmi_sink(), so it becomes a plain correctness fix for
HDMI sinks behind a DFP and leaves DP/eDP policy untouched.
The v2 will also pick up your Reviewed-by on patch 2 and drop patch 3
in favor of your reworked PCON series.

Thanks,
Alex

