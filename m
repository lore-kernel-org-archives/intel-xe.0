Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969ECC79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78F810E4CE;
	Tue,  8 Sep 2026 18:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="uJTRj0Pa";
	dkim-atps=neutral
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A64110E1AD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 11:48:39 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-930c0f9c1b1so83516185a.1
 for <intel-xe@lists.freedesktop.org>; Fri, 04 Sep 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788522518;
 x=1789127318; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fl9PTSUs9B7FCZMsxUqQ5YejuzDpmr3a9lkSBiQbIlE=;
 b=uJTRj0Pa6L4QLxM4Xg9d97ivckDacH6Fnur7Z2dZT5NKEdQxa5eZRcCcEKj+BlCOOi
 nWGxi/HXhF3JIPgf+hG0vpUkeNQgz2hkQNhyqY7sBKgPZQLGx6i2e3tqkSiWqDQ/bVHG
 HZMJj8pfZbgZPds2tihhvK2T+CBNKLWyTP0x35sgYq+U6liv2u4zL4R42X49hNwDm0ul
 BAgdX7/mJ9zrVH9QF+W8LT6VpQlH/GQP/Ux4KZ4jeoSv3PjzFMF793e2DZ7BBEZHb0ql
 0MHOTyQRy053HLzz1/vlCgHweMTlQDHB482tnHJhdzGzUDk3HJWRB7khSEDMRB7s7vqB
 p/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788522518; x=1789127318;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fl9PTSUs9B7FCZMsxUqQ5YejuzDpmr3a9lkSBiQbIlE=;
 b=hiMrNIhu8/snL/qGFfzmqi9zJXg3sHV6FT8pzMdXwG1oxhsTxbzDG3BE+4J7hmbALd
 aPJ1ptM1CwlT1x1XWT1ktRBxVaWSLnEYGb8DM61R+ENf29A7aGoMufPS/VYSfy4uUmiE
 LDgAdH0HqKVWkv6bg5XvEe/BQAvjrIWGfIiyRSz2/XwEsyaZyhKGQwG/TVUU3ABbgfU0
 Lldb0YwotqZ87uKv7iOmBOqzOGYZhpSOpCZ944um8K8wkuO/caZNCuufbxTXTPyUkVOh
 gXwycs+YGopC57RFLsLUj4ZaUbUw8TQTd05PqKf6lcDvjHGQTeAcy9fBMVR/R1cPVSvs
 B8iA==
X-Forwarded-Encrypted: i=1;
 AKwUvByu7KaR56y4SSweR+vGdKGow9S+jRlgF61Z77r+NTS5/EwaRh/g8D3VIp4oIaeS5g+MITksYNbfBw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mD95YLrDclPzYVHY637ESTy0QLbHMz716tqo2PeGoUFMJfHKH+
 4wocoY3qGEFSKvVQ9yN9YLlkXfVxNctA85oam3jGsMKkjgKKRQOpNo6pvga05qaM+mQ=
X-Gm-Gg: AYBFou2dzL5hGC80CbO5kzimW4ppjoas30213bPUnR1AZumg1S4G0fk3Nb1OcEvBIvV
 oN41pNJ5NrBM3A3utLEMxOsZxqeoiOZHOAUD7ciNbYMRYfoB84Z/zWYz9l0O5TkDyJZW+Rvwf8b
 985Q85Jl8jcbRmU2QBM+kr4GVZ9NZ/evBL8nd1Y0MkMaGtHayQIeFkNysAF6EIphjDN1YVO2dzm
 4bp5T0EXgqOsPRemR8fu8BOJ6bbqssPrVhwJdYDxv22VKBd1oBljz58VspAtSyd0ExCIVa2MFow
 UlRr+eQQBh9XAvg96AufDBub/gf6RVIyCkPyR9H0bxjCwS2S6jWax4734jt9hKBEhDw4jnVG3f/
 DtwjDDwqiBjmM93pApceVeEB+AA6cR5rJNXvOeeHU0a4TZ+YYaK+VXiNb0EqpuPaFXVYt4eh113
 N+ef/WZm6Es0uLQQ30NoLDRVuaPI5fH3oYjy1zxAtc39WoB4exPvPU7I4XnMfkGkLvattuOu238
 RjRAJcXCPBvrysHch6hnBycpsxG5hUKYQAmMdezDNElCG9EX/SV6WxIb9nMNjt+nrNb39Y3itMl
 0Ru9F1AudHhkXeNaY+h++h/w2lV9QycFX1Jkr2xU4Mb0IKPdK8eqSnvBAL767I/Q3ai3
X-Received: by 2002:a05:620a:2606:b0:939:2d94:667c with SMTP id
 af79cd13be357-9398037ac4fmr542501585a.21.1788522518164; 
 Fri, 04 Sep 2026 04:48:38 -0700 (PDT)
Received: from jake-laptop ([153.67.39.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397f9f0734sm197825785a.4.2026.09.04.04.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:48:37 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Fri,  4 Sep 2026 07:48:35 -0400
Message-ID: <20260904114835.483057-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904004308.185788-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

On Thu, 2026-09-04 Jouni Högander wrote:
> This patch doesn't help much ATM because we wont get rid of the quirk
> disabling selective fetch anyways.

Understood. Which quirk is that? As of yesterday's drm-tip this machine
only has the Panel Replay quirk; PSR2 with selective fetch is enabled,
and that is where these CRC errors show up. If selective fetch is going
to be quirked off for the DA16260 as well, then agreed, this can wait
until the SU problem is understood.

The SU problem is https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119.
I'd much rather see that fixed than another quirk on this machine, and
I can test whatever you want on it, same day.

Jake
