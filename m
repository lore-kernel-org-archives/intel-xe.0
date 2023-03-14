Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40EBC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 12:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEC810E79C;
	Tue, 14 Mar 2023 12:16:17 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3A10E174
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 12:16:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r27so19713043lfe.10
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678796173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmbIOQEdkC/EBV9q+mlZpDws79gNwrWvaXxmvvLbfH4=;
 b=OQHDtnDiUOYSxaXWfzhNx+dW3TeXDTeeIjtbcoym8iWznTAtIDAiS0sTNPpErLMk6T
 REfar84P9DKrv26b4h2cBUpk22ZfUvX+ICWvaO8x4ZFmri/jDfIjT8ror0+POBK0Do/y
 jG17q+HCHvBPmYn9ikp5kG0Z1oIyFwbQxBt5Q7ZIM6fHuJwpE3iGd3lQ9mVETuL9Yuja
 aCxWZDu2n78QufXpkQzGBIvJZCVlULxjffSaKGySWJjDHAagcJdoKGwR/dZVkVrnp/Jj
 9+GqLraKIP8T33urmglb5qxBIYsEnAmzkql0cnLqVUWdGFSehNGIEygCr91mRW/K4K0R
 3Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmbIOQEdkC/EBV9q+mlZpDws79gNwrWvaXxmvvLbfH4=;
 b=PQcPJB50RRE65f13/Ixy4Pn1O+SF8mHi03vosYC2iXYJDAZNMPZjWOsVdXSPA76tnn
 OHl01AJcIDor0r381cKXVZfW278f6GzoriPOD2CiY7P9cRWjjcA35fxf6MW4y9YB2ZK6
 CqW/8PKP7N3rRPAYolyfvivpk1YZcL3t7lu3hvr3tT9eBXR6U66L/RILyHAFO2c52ybK
 rD3HsEuf5q3dzmgIDRnDzKzLvrCG+avZFx4d5REjuauF3gVGqwc0/+xaXNYAVodzexw0
 TJkkFnMBBGRh9EZiOZx+vBDlwuCK0/+KhBHpEOFhKvjTc9oAuQ/q/eZ+J55s105RfLHO
 h8bg==
X-Gm-Message-State: AO0yUKWiD7A1ZuUXhVUPUVLKpnqBp+NHlcgpb1gNEoFvtG2f+0HJTPkn
 aYvINSdJm9tnI5rkSX1d9QTDpfcBYqR38oBJfbf4El231HI=
X-Google-Smtp-Source: AK7set8BIzpAS29HBV2A0Orm+5soHlemHHeDBzEwhvyLOXg+fdtZ8PfI/BDphtFofGmAIkyz6rrNgqFsStp3RkdBNWA=
X-Received: by 2002:a19:7604:0:b0:4d5:ca32:7bc3 with SMTP id
 c4-20020a197604000000b004d5ca327bc3mr671504lff.10.1678796173548; Tue, 14 Mar
 2023 05:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230313204519.158888-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 12:15:46 +0000
Message-ID: <CAM0jSHN+vy8R48HRY72ZCmmfv4LG1uMV3zBrY0GMMe5P2ADCYw@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/migrate: Update cpu page-table
 updates
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023 at 20:46, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Don't wait for GPU to be able to update page-tables using CPU. Putting
> ourselves to sleep may be more of a problem than using GPU for
> page-table updates. Also allow the vm to be NULL since the migrate
> kunit test uses NULL for vm.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Seems reasonable to me, but I'm not really familiar with the history here,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
