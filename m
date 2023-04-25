Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D841C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 11:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0614A10E094;
	Tue, 25 Apr 2023 11:05:27 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF93310E094
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 11:05:24 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8bdcf87f4so50923081fa.2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682420722; x=1685012722;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RguZLaMZZ3/IUn557q5SCrO7EmTrkulblByeWy4Qnos=;
 b=Pl2I9xp9YdOlpUX4NKdkbLLROiJ+vGh2oWQkzmN1Zc5MbLb7LSXbuEekOgZb04+MPJ
 u532TTQFWW+MLJv/vXrm+EsbFCUSCXtE56QEGg5daMP4OAsSpQWFPhJoXzqqh9jtIN9H
 0LsgIsDS5EZ/VvSh06oUhrJ3DHBwFPPV+gk48FS8lml4URzqUoQ9nQYRMNvN6pXxY9LT
 wGS78NqQplZ9hlExgqkLbjg/txfYK/eEAHZpYQ3q6GO3myoNF3X34x4n2dIve2u4xjv9
 LE/DbShsVfZD+9i49MhpMWsi2o3wLkCl9j0yTdeOFlBB1/EyW2qqetHogkb/d2D+G4R4
 dNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682420722; x=1685012722;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RguZLaMZZ3/IUn557q5SCrO7EmTrkulblByeWy4Qnos=;
 b=hcGzp18V5evwYn/ABPWEyX4O71R0swPqznTR3iH1waC7SDQfu82TI5eEhzFkzDbhgo
 dJVK39QDUhg8RFXue+lq2+g80szxDf0QUb7lbHUcronrlhvBxM3N9OjHjHxemPBadbVm
 9ix8hv0Rr1DbNT/yzHG3geaZGbRcxzJ8LpLTz5uoWkS8TBt3hQEiuw5OAyHEfpeTtTA/
 W+f910wFG78P3FEDvbYHNhewpGT0BRbcmzLdqNyDq3ZeU7ZhfppMHjrWLzKT5LQGv1ZC
 w9ktxEunGSttpNQ4pnCEhEeyN5Hfby7rZ+tCKazi5WU2uu2/kqgOviudabxvevLHBu8x
 gYAw==
X-Gm-Message-State: AAQBX9fD6eHNYgcWhHO+PkdH7MmVi+jHBUZIMfwrVTH/DrQf6D6yV/uy
 /8oC5S+OSDZ7MO5MuLfG+jUkjp8xt9gQu94+NjI=
X-Google-Smtp-Source: AKy350bNSLr8P/Y7RiQu8He6xhUNW0vY7dTCOkL5neTo9WrtaNrASV3S8LnDrRrEJQd34Y3QDA0RBIRynzri8/GrJaQ=
X-Received: by 2002:a05:651c:1026:b0:2a7:75aa:40c with SMTP id
 w6-20020a05651c102600b002a775aa040cmr3329484ljm.10.1682420721987; Tue, 25 Apr
 2023 04:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230425110107.932366-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230425110107.932366-1-balasubramani.vivekanandan@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 Apr 2023 12:04:54 +0100
Message-ID: <CAM0jSHNM=2An1y5VGqOyEZ5d068PFW-MVxDez5-BpYrfxLaU1A@mail.gmail.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Keep all resize bar related
 prints inside xe_resize_vram_bar
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

On Tue, 25 Apr 2023 at 12:01, Balasubramani Vivekanandan
<balasubramani.vivekanandan@intel.com> wrote:
>
> xe_resize_vram_bar() function is already printing the status of bar
> resizing. It has prints covering both success and failure.
> There is no need of additional prints in the caller which were not so
> easily to follow.
>
> Modified all BAR size prints to consistently print the size in MiB.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
