Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D713AC44500
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 23:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648C410F9CD;
	Fri,  3 Jul 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="c989Lmex";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC9910F9CD;
 Fri,  3 Jul 2026 23:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1783121258;
 bh=lKZFSA9M97/7t+2NNX4JZoaIycN4hPQvFY8cDe3/w6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c989LmexOAVNL+O6AjhAESh+q8SWEBqGvLLsfJDJrQcoqHT9RrorC/4tgzZwY3ZRM
 5yh6R+AeZBF7mi3d+qXhMXb9HHFH8TG27xS4YOnFx0joMqauGOcy4l4Np9B/vC+TmN
 OXUkDcmFNKk0Uls7ZO3ecYbnLKnNk5oNo9n9pUwApeulBcMybKbL9q/pA/o2EGjVd3
 uxPJGzAMm80FhH4qgDdNahsw8bvsPyYZnd/RwNrffkvom+nfym+79Y27OB9cFEA4Ba
 WJB4nEEsf1dAmeLxA6OOo/Ox2UTxQzE+wr9264FjSpo9S9reZoTlwqf73hp8/duXEN
 2cEfgC1VnBKsw==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 3CFAB18765;
 Sat,  4 Jul 2026 01:27:38 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Sat, 4 Jul 2026 01:27:37 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.kaplan@sms-medipool.de
Subject: Re: [PATCH 3/3] drm/i915/dp: Check FRL bandwidth limits in the HDMI
 bpc computation
Date: Sat,  4 Jul 2026 01:27:37 +0200
Message-ID: <20260703232737.4433-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <19361dc8-2ecd-4ffd-af43-e6839fffc064@intel.com>
References: <19361dc8-2ecd-4ffd-af43-e6839fffc064@intel.com>
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

On 29/06/2026 09:46, Nautiyal, Ankit K wrote:
> I had sent a few patches to address these sometime ago, but didnt go
> through [1] [2].
>
> This patch overlaps with my earlier 2023 series [1] which fixes both
> compute_bpc and mode_valid via a common wrapper.
>
> I've since extended these with the PCON DSC bandwidth handling [3] and
> I'm about to post the updated series once I'm done testing, I'll Cc you.
>
> Since these touch the same paths, it'd be good to converge there rather
> than land overlapping changes.
>
> Feel free to take a look once it's out. A Tested-by from you on the PCON
> hardware would be very welcome.

Hi Ankit,

thanks for the pointers, and converging on your series sounds good
to me.
I will drop this patch in the v2 of my series and keep only the two
independent fixes.

I will gladly test your updated series here once you post it.
The setup covers a Panther Lake NUC with Synaptics VMM7100
converters on two firmware lines, a VMM7100 based TB4 dock and an
LG G4 as the FRL sink, so both the FRL and the PCON DSC paths get
real hardware coverage.

Thanks,
Alex

