Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC154C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 10:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B1110E92E;
	Wed, 22 Feb 2023 10:05:49 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633110E92E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 10:05:47 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id y14so70600ljq.4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N3DqiGLZ0XE8Ma9F5MMF4N83l4mZ3Hhb693JLqKG3ow=;
 b=LY2PCukDi3XVUFpSce4GJblozjtMbtALeHeH3shtxdeVc2cv8p2yoXZLb1lxqAYGX6
 4jjNsk2b38z1YZCBo/GFcTZYvz6HU1+NNlnN6ms49z5y0KWuhCCGjBIP9WX1oigZs9Zd
 40S37RtEjpV9+u+bXDm0MPR5JQqZjRwQ69VLTz+ZZP09t7ELjK5GBmvmtsC+vsO63kPM
 wELNBLTat9CyFHAahYpfQZFncBsniENqODDGfrPzgMmvpOkXxDqBhtY5G2oEXX9jUWfR
 pg6RJlOkcTymbLG888+xDuRtnaZ3tci5QnRJ26Ry1wVEVZU1lKMhQYuCdmEHbBkgUi5J
 vxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N3DqiGLZ0XE8Ma9F5MMF4N83l4mZ3Hhb693JLqKG3ow=;
 b=Gqs7BEJ/bJAbLNLa8paJNkG0MLF+5U3CzPWPUXoho1FcFFwU5jhroC9iFAwdbRVvty
 fRy7mrkjt74TU3u3WbKKzcCdMlvk5F1ddR7a2TKDFXQ55N9nQ/w8+Dx8u/bBm3xcygb8
 /ioO8GuWnrPljqC9t0TQMotdsDnyowv5WAoWrmmagjFSXM+SVShSZCVYnRX4PnCJTeo0
 Kf5dI2McYRhZBXFK3YgL/eyyJlI46wKVs7MjBH4Q6tQiZ8RSJSgW8fZ5OcTiYvMPXo52
 13s4kAr+9Wm3UJNda8Kmj/R0z8kq9XEUDhiID80o7yQrlh2TzS0WxZxpExvuKKGT4yIF
 ftDQ==
X-Gm-Message-State: AO0yUKWkCnQQK+FZTg8MxV5SVWiUo0PveLgyn1LIlS5+Je4GsEOhD4BG
 O7fvaMRO4/0h2smxA7RRcVK51DMFNyLkOzsj/4ua/QcAqhI=
X-Google-Smtp-Source: AK7set9yAjTdTn4U3hmpQ4VXcbd4KSvcQaAUzUPolBKWvdskui/+nH2F84t7OwCJjyGgLlA2bzE8rSP1y2dofbGe8y0=
X-Received: by 2002:a05:651c:1614:b0:293:27a9:ef34 with SMTP id
 f20-20020a05651c161400b0029327a9ef34mr2940676ljq.0.1677060345580; Wed, 22 Feb
 2023 02:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-5-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-5-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 10:05:18 +0000
Message-ID: <CAM0jSHO9hMF9Pn8gYPE54ziqDto6a23ey8DMyjhFv48ea67nRg@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: Remove unused functions
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

On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> xe_gt_topology_dss_group_mask and xe_gt_topology_count_dss are probably
> leftover from initial implementation - they are not called from
> anywhere. Remove those functions.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
