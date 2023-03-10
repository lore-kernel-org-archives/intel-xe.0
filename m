Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3ACC6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 21:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0610E9F4;
	Fri, 10 Mar 2023 21:05:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0625B10E9FB
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678482318; x=1710018318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HJFWKeKSdrFgxHErvxFdI+pJ7WYy435EYvO6TW3QQoo=;
 b=mg5+A0SWs/JlhSGDIqcTa0sc7wefYdMEpafw3KYoqUBxf9tu27zIwL3I
 2EyWIGsBmhbPOAEf07AqlWhpJJBLoc8KHWXm8qrOztXFHA9Zpbndv6VQP
 wNBRNM9yJIGNoQp+l6wT64edfCkqXTLtyiPl4SUox5i8cZp6xddYasCrW
 X0VCDKXeMASt3BbPfWBlUK5Vxt72GDTgfRT3ueFbQs7+rkftx7kUU/LEa
 /PxoQnAfyMiW+jnkZ7AM1TtU4TgiB5VLhp1M/ZMH+66eZ3U4bWgP0FEBa
 IIQCf5EgnOUnUz/L2w7kLYzhGcoshTrbR1ulkZq76EIxsTnxYTNUxq+2J g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="334306057"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="334306057"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 13:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="710416345"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="710416345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 10 Mar 2023 13:05:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 13:05:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 13:05:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 13:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8roRZh5NSfDhGRt4Z6d9gWgsDRfajp9A243r+5E3uGBfwloIbTvMvXTMvyoyXoDAdkPBDDALxWuWsMMA//qsX3wYI0Ktzm99uhcLzGhq/AzQ6fwTW49+KR+btTlOFilkMzAh10bXP+o58Hb+A8ZccHn0C5/QZprm5Tw6N4jllX6ddtTsx9AHXW2qNeuawgaTvVbgUC7Og9I/9X5pxS5lvZRwqfsviV+6Y0bmvKV2fAMSnyB7CfnIJQ7D2Fiwbm2ASyHbE46FW8Ygu8AMsJCbyA5V8XHaEMRSJFFTzpBBfp/2NHIuAPMc971Rnk+3SK20rTVVXqjepGkCjwCJeJuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnLwPxROtSIOFIZvIOOMPeQFDG6obfXczGryEG8osrg=;
 b=kKhmzL0K+dHNy5NAtkq7cDNqfAXpUJ1sA/2XC0BkFpnCfvpbB7H8OEhCuPMJDse5ntbdZCTk9FnTTuaJcHmzk1msba5ISETGUHEUgsbuGxe9gGoM0Glo8u/B8K68aRw74dtR9d9EffG+gmFCIcCCFM+cdhmVCUnru7zL3TvhI1h3WE428RJusRcqQElx2UNogbvEBcfSTMQNuBSZ6K4UU4+CDY+G9by8ZrBE+nva3jcz/KC4nfYcHaum3tSuJEpxsNKypYyD/gYWt/hJvUg9YlgmfpnwwVgfZSwGtC6YdIjCSOHcAIP3CldXtsixI0P2R5cpzniSf/8DR0DtB/xnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 21:05:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Fri, 10 Mar 2023
 21:05:13 +0000
Date: Fri, 10 Mar 2023 13:05:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230310210511.u24itfuzbx2xpsuj@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
 <Y//caMLc8YAqOB9Q@intel.com>
 <32de8549-1e00-ab70-888a-53f0e269ea97@lankhorst.se>
 <ZAEkU2i07snx2Soq@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZAEkU2i07snx2Soq@intel.com>
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d31191-032b-445f-b845-08db21ab2433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yns+8iyKlxb9sSRaH3KpdrryoR/vQa8huEZreh614aiK02RG7UPz+TdaqbH2wsKYHAe3KQ2X9Pn6TRy235r8cCPvZID6XFXlj1c+dHPDoDVYVpBwjA58+5IckjxPwPudoHRtTzfxJfGRMxrinC5z4Xl1HTqHnmh+pvqY5kKZLZN2VnCBe1w2uXF35N3gnQ1T8hKVkR5naQGfE61UYW0FBLrCaxIniMsISbL+P9WdbNPYKy+sSWjsLjs9dp3Qyc9pMwFbH19Snboclq2MYwk9c3akp677mz7srCBLWVFkzlIkfW1zyu4BcAiomHf3QBQrO+eOAhP/DjKqjdLWIXuYyahcYEjc9aSUIqBiPTDte+pMxknJKB8zhFT2bdtItxAiMP84czIJyRXXn8QGiQyId+6bfY64yEnkzKyqgMPCltP7lboelOvczMK0688iIcE/lr3F3kC2U0buWBIjBENhYOevOcodUUbFbx/RG6lpaMt9KI5/fLQNHW1WVMHqub0tsq4aJBo2zK6TveqYvEm6h6+2bXc7T6u8gLvXThm56vCitc9FT2jKsOTkjoib5E7uv/oB2dDv6sOTBW7/D6spcSSpesexL6VotEbitrg+8K1jYmJL+9yc8boiYNeyx/+VOmLAnCbcMgvyh3LKxbWqVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(8936002)(6862004)(30864003)(36756003)(86362001)(38100700002)(82960400001)(2906002)(83380400001)(5660300002)(6636002)(316002)(26005)(478600001)(6506007)(186003)(1076003)(6512007)(6486002)(66946007)(4326008)(8676002)(41300700001)(9686003)(53546011)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/woawSO2VTWMSTczUHdph3BpyBbA+R/RR2bhnJHoeY+mdH+R588+QZ8mVfEE?=
 =?us-ascii?Q?kVsN0cco4KLrJvjxpFktC28S5LzSBkhnuA2usnR1JKcNVlIVgod90i0GngTf?=
 =?us-ascii?Q?QvNHhW57fVSW5Ee9xchWTwhTIw/7jjyzuK0Ppy72K1sTUvOzjcuBipEXKRLE?=
 =?us-ascii?Q?rwYBjqjAr6VQ9r0r4C+UsdR2Y1Pb+uozFrPUGU5t/ziX60jtCYBEcPTebLtX?=
 =?us-ascii?Q?kaiT7dnAGgOESe0c1ds21iUnqkUDHIWN4YnmWgWhLqSANE8APxKS3+Mcdcag?=
 =?us-ascii?Q?PdaqZrgLNeEYJHmndB8K06/nAFJJJDfQjNfZvbugidhtXUnVoTqKLMUCSTmX?=
 =?us-ascii?Q?wXV5FOacvetEywZyJ6OAAMGwfXUMMcfQJvg59cF5XfpQ3qww6AKK+KNmc3+i?=
 =?us-ascii?Q?TbCAl6klUVmZVlxcfdUZYh/0dPe6n3ujmSnshU02WvaKC/S/HoVSqJv+e9aY?=
 =?us-ascii?Q?wWWFwL9Oi337kVqrjtO5KxTEKT6fObfL4JAN3Aa238qgvTE2PSNdxCq+cpWb?=
 =?us-ascii?Q?UdHpcnbpKz+jBpK67cadRb4Bq/RIs/wwnEBWkkKbawwCpO4D8JBR7KezIVcR?=
 =?us-ascii?Q?/liIaSa5pfW4qVISFQiHgFZ7vjbZJvUa6P+ZFImR8Hx1RZojerXxfOraYAl+?=
 =?us-ascii?Q?eRdmeGJxQRrcQegUoWEe5FNaBxwfvzinLHmjp4zJIerzCCKKznjcY8QesIZ4?=
 =?us-ascii?Q?SRAkiwG54mlvSWAxbgT7uypKP7vDl9ux86nfhFvEIki4Oj77eSYMTPbgLCRG?=
 =?us-ascii?Q?Mv01pYu1QMjKEb6qrXO55m9pLD6Jp1J1l8vrnuK713zcOy9a+Zry5KmuMMcV?=
 =?us-ascii?Q?J+s+HeD5Ecy/g8ounqkXFKzcij+zVUpoDXnNUYnZmv6xTUCrH/DrAOArrVVS?=
 =?us-ascii?Q?GXBCn4P7mZ5QuI8zZW8sAd3j/jNYpOCPcZBooAytK8eCi2PWdWKFLwtsC++j?=
 =?us-ascii?Q?VETAA1Vr20E3mja5Lo8Kq2BdmSZy9UiM0iCLf2bt19xdUtpT359baazvpdJQ?=
 =?us-ascii?Q?t5XXUFtUtKWcvwJvycUUeZzb18cw2ShBCVPnoBAqCLpA/THweVQ6e/erbIW5?=
 =?us-ascii?Q?XEWQzjcrpJVJI5ZkSEeG49E2HYbPdB6NvfFMgDTMDFQ59+G9dkDFIVyAHhSD?=
 =?us-ascii?Q?f501SFslfebN6Ax2V+1ZI4RjjTM1vr7bBqS+xzsKXJXWm+aU+1uhS0XP/iS6?=
 =?us-ascii?Q?EHFaMFDrNUoXO3R/6XnRbHzO7ORwMY6stktEjdMm91M6FKPltU7xb/ZsVFa+?=
 =?us-ascii?Q?m/Yq46ucsctyzF6lA23/nNWlCrSuuBA4Dy7MCsDSba7kT1OfhM4gUK9NK09d?=
 =?us-ascii?Q?ny01l2EXoal6bhthr5pd7967jWF5v8vTV5B3rBtfBARJgMSA82ImRFXGwoDx?=
 =?us-ascii?Q?t2C0nozzxhz540bfCfHPLiXoLhvClFOZMTxWroZgP6ZCbFZmRNv5HATL22ef?=
 =?us-ascii?Q?Q5yS1yo7vmsf+VoN/wI4q1Ul5+xe52NbkJERhnjlJRAHOMBfhq/GHFPkpsK4?=
 =?us-ascii?Q?hVTAv8rYoAz7/D2YRVr8aTCy5g18WsQfMuNoi9StS38kCh1SQXlCB4NEGo18?=
 =?us-ascii?Q?s5mvig/pZuhZqQYHjaiJlbIVysfUzjxwNHiBlgZtdvGfuZJMLsL3yyaHnlM4?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d31191-032b-445f-b845-08db21ab2433
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 21:05:13.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MILOeKkebVIhp/PpWC6CqXtbOJ2M59ho6RKdJG8fLTTdLp9PwQREaqS+brQd2NFvfp8AGeBiUeoYxdFcWTiWVrRSdN4/heQRFJg1ItCuh64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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
Cc: Maarten Lankhorst <maarten@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 05:33:55PM -0500, Rodrigo Vivi wrote:
>On Thu, Mar 02, 2023 at 12:26:18PM +0100, Maarten Lankhorst wrote:
>>
>> On 2023-03-02 00:14, Rodrigo Vivi wrote:
>> > On Wed, Mar 01, 2023 at 08:36:29AM -0800, Lucas De Marchi wrote:
>> > > On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
>> > > > xe_guc_ct_fast_path() is called from an irq context, and cannot lock
>> > > > the mutex used by xe_device_mem_access_ongoing().
>> > > >
>> > > > Fortunately it is easy to fix, and the atomic guarantees are good enough
>> > > > to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
>> > > >
>> > > > As far as I can tell, the runtime ref in device access should be
>> > > > killable, but don't dare to do it yet.
>> > > I don't follow this last paragraph. Could you point it in the code?
>> > I also didn't understand this... if we remove that we will end up in
>> > memory access with the sleeping device...
>> I may understand the code wrong, but without error checking by the callers,
>> and changing the prototype to return int is there any way this will be
>> guaranteed to work regardless?
>> > > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
>> > > > drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
>> > > > drivers/gpu/drm/xe/xe_device_types.h |  4 +---
>> > > > 3 files changed, 13 insertions(+), 22 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > index 4eb6786b11f0..ab179b1e24c1 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>> > > > 	if (err)
>> > > > 		goto err;
>> > > >
>> > > > -	mutex_init(&xe->mem_access.lock);
>> > > > 	return xe;
>> > > >
>> > > > err_put:
>> > > > @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>> > > > void xe_device_mem_access_get(struct xe_device *xe)
>> > > > {
>> > > > 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>> > > > +	int ref = atomic_inc_return(&xe->mem_access.ref);
>> > >
>> > > +Matt Brost
>> > >
>> > > Any reason for not using kref?
>> > hmmm... my bad actually...
>> >
>> > I did considered the kref, but I can't remember why I haven't used it.
>> > I recently was asking myself the same question.
>>
>> I looked at it, I don't think you can kref from 0 to 1 by design.
>>
>> xe_device_mem_access_get() is usually called with force wake held explicitly
>> or implicitly, so we shouldn't need the runtime pm ref there.
>
>But this is one of the main problems in i915 right now on why we can't
>enable the D3Cold. If we have any possibility of memory transaction we
>need to first wake up the device, then we need to proceed with the memory
>accesses. Or the bridges might be sleeping and returning 0xfffff
>
>so, the first one to take the very first mem_access ref will also ensure
>that the device is awake before proceeding. This works now without any
>error handling by the caller.
>
>Another way to do would probably need to involve a queue for every
>memory access or like i915 was going where there's a list...
>
>I wonder if making this spin_lock isn't enough to fix the current issue...

 From what I can see it would be ok. However, how is this reproduced?
The only way I can see a lockdep complain is on a system with a PVC and
another card using the ast module.  In that system we have the following
splat:

1678477803.564451 ======================================================
1678477803.564641 WARNING: possible circular locking dependency detected
1678477803.564797 6.1.0-xe-demarchi+ #34 Not tainted
1678477803.564986 ------------------------------------------------------
1678477803.565220 kworker/28:1/316 is trying to acquire lock:
1678477803.565429 ffff8881ccf8ea48 (lock#7){+.+.}-{3:3}, at: xe_device_mem_access_get+0x2f/0xc0 [xe]
1678477803.565585 
                   but task is already holding lock:
1678477803.565762 ffff8881ccf83ed8 (&ct->lock){+.+.}-{3:3}, at: xe_guc_ct_send+0x2c/0x80 [xe]
1678477803.565921 
                   which lock already depends on the new lock.
1678477803.566149 
                   the existing dependency chain (in reverse order) is:
1678477803.566347 
                   -> #2 (&ct->lock){+.+.}-{3:3}:
1678477803.566505        lock_acquire+0x169/0x410
1678477804.447764        xe_guc_ct_init+0x19b/0x260 [xe]
1678477804.448706        xe_guc_init+0x88/0x570 [xe]
1678477804.449251        xe_uc_init+0x4c/0xc0 [xe]
1678477804.450514        xe_gt_init+0x1be/0x490 [xe]
1678477804.451031        xe_device_probe+0x2d8/0x350 [xe]
1678477804.451724        xe_pci_probe+0x770/0x8d0 [xe]
1678477804.452298        pci_device_probe+0xf9/0x200
1678477804.452974        really_probe+0x13b/0x530
1678477804.453751        __driver_probe_device+0xca/0x210
1678477804.454309        driver_probe_device+0x4a/0xf0
1678477804.455055        __driver_attach+0x135/0x290
1678477804.455744        bus_for_each_dev+0xf9/0x160
1678477804.456304        bus_add_driver+0x29c/0x2f0
1678477804.459887        driver_register+0x10d/0x1a0
1678477804.460599        do_one_initcall+0xce/0x3f0
1678477804.461137        do_init_module+0xe4/0x320
1678477804.465037        load_module+0x331e/0x3560
1678477804.465838        __do_sys_finit_module+0x10d/0x1b0
1678477804.466735        do_syscall_64+0x37/0x90
1678477804.467223        entry_SYSCALL_64_after_hwframe+0x63/0xcd
1678477804.468172 
                   -> #1 (fs_reclaim){+.+.}-{0:0}:
1678477804.468719        lock_acquire+0x169/0x410
1678477804.469372        fs_reclaim_acquire+0xca/0x100
1678477804.470024        __kmem_cache_alloc_node+0x4a/0x3b0
1678477804.470682        kmalloc_trace+0x26/0x60
1678477804.471246        _drm_do_get_edid+0xd3/0x400 [drm]
1678477804.471953        drm_get_edid+0x8d/0x100 [drm]
1678477804.472642        ast_vga_connector_helper_get_modes+0x55/0xb0 [ast]
1678477804.473231        drm_helper_probe_single_connector_modes+0x34b/0x850 [drm_kms_helper]
1678477804.473854        drm_client_modeset_probe+0x31a/0x1390 [drm]
1678477804.474494        __drm_fb_helper_initial_config_and_unlock+0xce/0x980 [drm_kms_helper]
1678477804.474998        drm_fbdev_client_hotplug+0x142/0x1a0 [drm_kms_helper]
1678477804.475577        drm_fbdev_generic_setup+0xbe/0x1e0 [drm_kms_helper]
1678477804.475987        ast_pci_probe+0xe9/0x100 [ast]
1678477804.476588        pci_device_probe+0xf9/0x200
1678477804.477076        really_probe+0x13b/0x530
1678477804.477485        __driver_probe_device+0xca/0x210
1678477804.545950        driver_probe_device+0x4a/0xf0
1678477804.546166        __driver_attach+0x135/0x290
1678477804.546320        bus_for_each_dev+0xf9/0x160
1678477804.546570        bus_add_driver+0x29c/0x2f0
1678477804.546717        driver_register+0x10d/0x1a0
1678477804.546868        do_one_initcall+0xce/0x3f0
1678477804.547007        do_init_module+0xe4/0x320
1678477804.547155        load_module+0x331e/0x3560
1678477804.547305        __do_sys_finit_module+0x10d/0x1b0
1678477804.547490        do_syscall_64+0x37/0x90
1678477804.547636        entry_SYSCALL_64_after_hwframe+0x63/0xcd
1678477804.547777 
                   -> #0 (lock#7){+.+.}-{3:3}:
1678477804.547932        check_prev_add+0xfc/0x1190
1678477804.548114        __lock_acquire+0x1e0a/0x2710
1678477804.548296        lock_acquire+0x169/0x410
1678477804.548484        __mutex_lock+0x164/0xe10
1678477804.548633        xe_device_mem_access_get+0x2f/0xc0 [xe]
1678477804.548787        guc_ct_send_locked+0x224/0xbb0 [xe]
1678477804.548935        xe_guc_ct_send+0x43/0x80 [xe]
1678477804.549112        __register_engine+0x13b/0x180 [xe]
1678477804.549267        guc_engine_run_job+0xf1c/0x1080 [xe]
1678477804.549471        drm_sched_main+0x3fc/0x9e0 [gpu_sched]
1678477804.549619        process_one_work+0x54a/0x9a0
1678477804.549830        worker_thread+0x8f/0x630
1678477804.549984        kthread+0x17b/0x1b0
1678477804.550135        ret_from_fork+0x1f/0x30


Note that #1 is actually coming from the probe of the ast driver.

Lucas De Marchi

>
>But well, Thomas had some bad feelings about the whole idea of the
>memory access handling anyway and was in favor of the i915 approach...
>
>>
>> > > Lucas De Marchi
>> > >
>> > > > -	mutex_lock(&xe->mem_access.lock);
>> > > > -	if (xe->mem_access.ref++ == 0)
>> > > > +	if (ref == 1)
>> > > > 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>> > hmmm... I'm afraid this can be tricky without locks...
>> >
>> > if we have 3 simultaneous threads calling this.
>> > get
>> > get
>> > put
>> > get
>> >
>> > and they happened in this order but the resume didn't finished yet
>> > on the first one, then you will:
>> > 1. end up the runtime pm twice.
>> > 2. the second will pass over thinking the gpu is already awake, but it might
>> > be still asleep.
>>
>>
>>
>>
>>
>>
>>
>> > > > -	mutex_unlock(&xe->mem_access.lock);
>> > > >
>> > > > 	/* The usage counter increased if device was immediately resumed */
>> > > > 	if (resumed)
>> > > > 		xe_pm_runtime_put(xe);
>> > > >
>> > > > -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>> > > > +	XE_WARN_ON(ref == S32_MAX);
>> > > > }
>> > > >
>> > > > void xe_device_mem_access_put(struct xe_device *xe)
>> > > > {
>> > > > -	mutex_lock(&xe->mem_access.lock);
>> > > > -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
>> > > > +	bool hold = xe->mem_access.hold_rpm;
>> > > > +	int ref = atomic_dec_return(&xe->mem_access.ref);
>> > > > +
>> > > > +	if (!ref && hold)
>> > > > 		xe_pm_runtime_put(xe);
>> > > > -	mutex_unlock(&xe->mem_access.lock);
>> > > >
>> > > > -	XE_WARN_ON(xe->mem_access.ref < 0);
>> > > > +	XE_WARN_ON(ref < 0);
>> > > > }
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > > > index 263620953c3b..96b4f3d7969e 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > > > @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>> > > > void xe_device_mem_access_get(struct xe_device *xe);
>> > > > void xe_device_mem_access_put(struct xe_device *xe);
>> > > >
>> > > > -static inline void xe_device_assert_mem_access(struct xe_device *xe)
>> > > > +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> > > > {
>> > > > -	XE_WARN_ON(!xe->mem_access.ref);
>> > > > +	return atomic_read(&xe->mem_access.ref);
>> > > > }
>> > > >
>> > > > -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> > > > +static inline void xe_device_assert_mem_access(struct xe_device *xe)
>> > > > {
>> > > > -	bool ret;
>> > > > -
>> > > > -	mutex_lock(&xe->mem_access.lock);
>> > > > -	ret = xe->mem_access.ref;
>> > > > -	mutex_unlock(&xe->mem_access.lock);
>> > > > -
>> > > > -	return ret;
>> > > > +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>> > > > }
>> > > >
>> > > > static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > index 9743987fc883..0b8c4ee0ad48 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > @@ -230,10 +230,8 @@ struct xe_device {
>> > > > 	 * triggering additional actions when they occur.
>> > > > 	 */
>> > > > 	struct {
>> > > > -		/** @lock: protect the ref count */
>> > > > -		struct mutex lock;
>> > > > 		/** @ref: ref count of memory accesses */
>> > > > -		s32 ref;
>> > > > +		atomic_t ref;
>> > > > 		/** @hold_rpm: need to put rpm ref back at the end */
>> > > > 		bool hold_rpm;
>> > > > 	} mem_access;
>> > > > --
>> > > > 2.34.1
>> > > >
