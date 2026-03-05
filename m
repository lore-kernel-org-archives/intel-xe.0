Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B002EF30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494110EB53;
	Thu,  5 Mar 2026 12:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jI0wXuwV";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7001C10EB1B;
 Thu,  5 Mar 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772714745;
 bh=ab9I5AqlIbEt0Cs5813dVMgxpQwoO7pPngmI92wUOjY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jI0wXuwVETqNnCkQfLyd27nQOpOgGx4JGQ58IcMIReKUWO6sOGhxRBA9xy1QTnzbx
 mzCOFbTNh1yZpoNOoo6k3gnPDoac3atksFsloMMvpVFu0hp/kGWIk/6hjhUp/4HoBX
 fArmFvaq+2eTPO/lrw0h2AcbdlkSjMK8LRYgr+Np66ZpCrOsomKUNszjyjh6jss5x2
 ph9nIaeIJEbKZLQxzOCT8SSvqeMwjJRsfgJ6sP7bxtJcmTOCwFgQBI+U/N5p5m7Cfz
 n/EzCSnmjJh4KRvsfShZNYIbKS9V2TQGYn7W6yCZLAQOwCMWPqj6cWqvBr4DM0Hroj
 jgR9ZSaXU8f3g==
Message-ID: <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
Date: Thu, 5 Mar 2026 13:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Julian Orth <ju.orth@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260305113734.1309238-1-dev@lankhorst.se>
 <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2026-03-05 kl. 12:48, skrev Julian Orth:
> On Thu, Mar 5, 2026 at 12:37 PM Maarten Lankhorst <dev@lankhorst.se> wrote:
>>
>> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
>>
>> The problem occurs when userspace is compiled against new headers
>> with new members, but don't correctly initialise those new members.
>>
>> This is not a kernel problem, and should be fixed in userspace by
>> correctly zero'ing all members.
> 
> I don't mind it being reverted since userspace rust code is not
> affected by this failure mode.
> 
> However, if you're committed to the idea that this is a userspace
> issue, then I think the correct solution would be to instead apply the
> patch you suggested. It clarifies the intention of the code in my
> opinion.

Thanks for having a better understanding of the issue now. :)
I will resend the original patch I mentioned later. I just wanted to get
this revert in drm/drm-fixes before it reaches a rc kernel.

Can I read your reply as an acked-by?

Kind regards,
~Maarten Lankhorst

>>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Julian Orth <ju.orth@gmail.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 49eccb43ce63d..250734dee928e 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>                 return drm_syncobj_export_sync_file(file_private, args->handle,
>>                                                     point, &args->fd);
>>
>> -       if (point)
>> +       if (args->point)
>>                 return -EINVAL;
>>
>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>                                                           args->handle,
>>                                                           point);
>>
>> -       if (point)
>> +       if (args->point)
>>                 return -EINVAL;
>>
>>         return drm_syncobj_fd_to_handle(file_private, args->fd,
>> --
>> 2.51.0
>>

