Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F58F532F0
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B5910E0F7;
	Tue, 24 Mar 2026 08:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="anM+sK3i";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0E10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+X90EqG8whFcb/0zSAdQMFCKwLvSQpzDq62+IUpholg=; b=anM+sK3i9QALjd8jvblAyFU7da
 hq4El7kCMmG8WSCsB9pQ/p/u6tINXsiD4ayfxv1hWOf3xRRdILn+1L2Aw6Cabk8UbJhS7ws/QMHuY
 v2UWqceQ5wpx5/5jqgh1tp9nKZOhGJVlwEmS0K6KFioy92kCCTGpDXioru5aKwQjMH1cMSSnJLpnG
 x+we30gLFiaH8GysPsclcGailrLxq+sryRCFsXUOqucH40XL4ovVFKEs7Qd8utWCbC7zuM3cW87w/
 Ngj+XYMZ+2WNWF5xQr518pbrSiRu5+Vuif9mU/iNwbKV7+whPFgFZ4eypz8dmvCuX+p0vyUxdWRBX
 +FaXwkYQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w4x5E-005F9C-J3; Tue, 24 Mar 2026 09:25:52 +0100
Message-ID: <95dfe41d-e64b-418d-bacb-46d4b0afca7a@igalia.com>
Date: Tue, 24 Mar 2026 08:25:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_*AuxCCS_han?=
 =?UTF-8?Q?dling_and_render_compression_modifiers?=
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20260320170222.88625-1-tvrtko.ursulin@igalia.com>
 <177411552592.383330.15034042570807454170@a3b018990fe9>
 <8f60fc5a-d779-47b2-b007-a4cc59e6a338@igalia.com>
 <acG6g7YHbhcnszY9@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <acG6g7YHbhcnszY9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 23/03/2026 22:11, Rodrigo Vivi wrote:
> On Mon, Mar 23, 2026 at 09:42:30AM +0000, Tvrtko Ursulin wrote:
>>
>> On 21/03/2026 17:52, Patchwork wrote:
>>> *Patch Details*
>>> *Series:*	*AuxCCS handling and render compression modifiers
>>> *URL:*	https://patchwork.freedesktop.org/series/163610/ <https://
>>> patchwork.freedesktop.org/series/163610/>
>>> *State:*	failure
>>> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
>>> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
>>> index.html>
>>>
>>>
>>>    CI Bug Log - changes from xe-4753-
>>>    f64c2a6453d0e0196f9697b8429bf97b1da1807e_FULL -> xe-pw-163610v1_FULL
>>>
>>>
>>>      Summary
>>>
>>> *FAILURE*
>>>
>>> Serious unknown changes coming with xe-pw-163610v1_FULL absolutely need
>>> to be
>>> verified manually.
>>>
>>> If you think the reported changes have nothing to do with the changes
>>> introduced in xe-pw-163610v1_FULL, please notify your bug team (I915-ci-
>>> infra@lists.freedesktop.org) to allow them
>>> to document this new failure mode, which will reduce false positives in CI.
>>>
>>>
>>>      Participating hosts (2 -> 2)
>>>
>>> No changes in participating hosts
>>>
>>>
>>>      Possible new issues
>>>
>>> Here are the unknown changes that may have been introduced in xe-
>>> pw-163610v1_FULL:
>>>
>>>
>>>        IGT changes
>>>
>>>
>>>          Possible regressions
>>>
>>>    *
>>>
>>>      igt@kms_fbcon_fbt@fbc-suspend:
>>>
>>>        o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>>>          xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-lnl-3/
>>>          igt@kms_fbcon_fbt@fbc-suspend.html> -> INCOMPLETE <https://
>>>          intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-lnl-7/
>>>          igt@kms_fbcon_fbt@fbc-suspend.html>
>>
>> There is already an incomplete in the history at
>> xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4 so I am pretty sure this
>> one is unrelated.
>>
>>>    *
>>>
>>>      igt@xe_eudebug@basic-vm-access-userptr:
>>>
>>>        o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>>>          intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_eudebug@basic-vm-
>>>          access-userptr.html> +6 other tests skip
>>
>> '/sys/class/drm/card0/device/enable_eudebug' sysfs attribute not found, EU
>> DEBUG not supported
>>
>> Which is the same as all the history for this test I can see so it is some
>> CI confusion that it is flagging this as new.
> 
> I agree, let's ignore those.
> But I couldn't merge it. It is conflicting when trying to apply on drm-xe-next
> or even on drm-tip.
> 
> Perhaps worth a rebase or am I missing something?

Right, trivial conflict due
61e7649a1a25 ("drm/xe/vf: Improve getting clean NULL context")
which landed yesterday.

I will repost shortly.

Regards,

Tvrtko
