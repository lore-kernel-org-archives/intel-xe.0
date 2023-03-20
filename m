Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD25C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 18:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8B10E1F3;
	Mon, 20 Mar 2023 18:17:17 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852810E5D0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 18:17:16 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a32so13087528ljr.9
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679336234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V26VAdKwCwunD/ydWRbwribz7/6Eum2DfQltMsReXYE=;
 b=pyvW3UqkYHlFT+YFhZKy/Wbqwg63JG0/ygnI969TzHfYNEtXqcqMpLMt/qhXirIzag
 X3PJ0F3eGmxxysp8i7sWj+Ag4M+NlbCbrtzTFAtKXw+f3e3Oj7h1+Twp5vmURcKtkg48
 y+f+FaH9rDsN4xR/tvmHDhdPbfueUn2HvX44ctQff1BLaWprwtl/nVy0+BT/2xE9eTIL
 LJbHxlKS7oDTDEL4qHJcSA4AGrLBQK5l0Q6TC8cLvHZjcJCiyj7/gmx56MvPcEHRhWMC
 gtkVcLggGW10TtD9HUMiuvrn+DRg/hDjtUYMIAMguqV3jKUIbOnSNfAk+k2T54YEacjr
 4orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679336234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V26VAdKwCwunD/ydWRbwribz7/6Eum2DfQltMsReXYE=;
 b=bkJCCohj+QvG2UKAYj030UNZ+IddG8vae/oAfBVI0xElLwwJrdALIB7ZCGJyHdbl5Y
 ylNCcjHFcjgV3QiVlo5ZSwX6TkWoy+JCQ8gMedGFmfFVA9SWGkS6LE23V+dhL3BHthvX
 h4K6xTJYh3JLhAxC5rcNdBU7CK23KQH1tswudFuI/oZTJpn/7QEjPVyAIGV8ceNFE5Lw
 UYC38yTKkOBBsZndLMAk1PBVrK1IHuAIxR2HjYVeStd6ujOjFzMisET/y4B9u+rfAfqr
 5Owhq06acmCF8wmrTfRLIEKqdDiKyVhzulc9w7LwBpJ7hmX0qoNWpWKoZSU9LKh4vi9h
 KO7g==
X-Gm-Message-State: AO0yUKUthWVBOCCXUw7rh+FoUVmuvNOl0xU26Sk/ylaMMINUo6wlvDg1
 l53jH5ZmyXbdn998KESpfs2PUzsPMp01UhPvU/V43DBv5AM=
X-Google-Smtp-Source: AK7set8iRN+xuPi350m/nl95iSKx7uMAq6mEL1sbl+qtUk2QetZ+NnIWXdhGuA1yzgEAXsBkQm52pH2eZytv4UFT3qE=
X-Received: by 2002:a2e:82d6:0:b0:299:ab25:5a89 with SMTP id
 n22-20020a2e82d6000000b00299ab255a89mr24748ljh.5.1679336234363; Mon, 20 Mar
 2023 11:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230320174944.650704-1-matthew.brost@intel.com>
In-Reply-To: <20230320174944.650704-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 20 Mar 2023 18:16:46 +0000
Message-ID: <CAM0jSHM418jWFNpmJeWGKcUxXdbJpGKLAKozncSs0hT4SywBnA@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop zero length arrays
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

On Mon, 20 Mar 2023 at 17:50, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Zero-length arrays as fake flexible arrays are deprecated and we are
> moving towards adopting C99 flexible-array members instead.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
