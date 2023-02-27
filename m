Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6DDC64ED6
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 23:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBCC10E1F1;
	Mon, 27 Feb 2023 23:07:10 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00910E1F1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 23:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677539228; x=1709075228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QBCP40BCErXd4RGrEkB/gxV9853kYpaqx9LHQOuHDms=;
 b=lKVvmoAq7XeBbNm1QGrqpflt1ejQ1ltqZnVxjLEB/9fQNykTix6SP86o
 CvOdhNNXV5RPS4TJ0xtF6YfMZDaEBjF2QZZnsHH1bmLr4GU8BRdLgtusb
 BeBOHC+oWU6sWklBaXjTSSSmkyeE2G2gG1AY8Rv4Ms+lHvl3EkMjopwyv
 YHV6BgtptjTQ9e8LL6KBEQGLNvsvsqYK7QNDxS5Kl53ct6EiEEflf2ACy
 NXzRk0DlYZcF1nn9SmoJLcegNLP6pAAa3uWUI7ELDHQ7HuDvNYygJCwjC
 bjwKwYKGo4o6Wu3stZDueXcZE3f7wKA3G6YoCGSjV6nYuc/PesmdaP6kW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322238661"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="322238661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 15:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="651398296"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="651398296"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 15:07:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 15:07:07 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 15:07:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 15:07:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 15:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUuT45ynPOMMwsG9HcTl8P62apVk75FgQArXzxhJOkm6C1yoBbHY67MuTKPGKsfZDNOfA9KLQ9cPBJMqz5ciGtYo5nQqODBWfuM22TpS8PI6Q/VqKVIP9dN7gxrZqNDwQQpfQf66uS8ARYrfgq38Hmma9fkM8oZmgSGHUMejTyZzDWFN2k15/ae+O3HnUlN4i2eok8kXUy5tsmUa2qOS1gmQgRuylmbWMeEP+xOko+PZich6qbmqC+Kf524ECK7GptR834YXZN0rlS39s2MpaJzGM3la+vAoOTEQfX1c6a3/3RAmp/S50J5DvI7lceESaWCOvsH2VT0ibcNyqm1Oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqKnodH+N+jlb00SGp4zMzRM0gESx4TJzNRBi5LiGAY=;
 b=Ia22+YxWlTjYsZCTr9RyoqT1hP35R6dYAI6QNV8yURtTUIyAOCKFoybQphZJ7BUFMFY6LwZltaN84pkKEZFWYKLQamoBvggAiCIhDXjfVypcjVxcb0OmEW8IaDkR54phWQSd2urOh9HZll53BqKrIJo3INzFoIsHxz8C8nECs/IKtryWaKqnKCBdMw/1RIeiiWz1BRb5tB24RwDlyS8uZy3N0fw17m2dl2gxGB2G3l12iifTp6m6NZtxMoo1eWL8dJLNdTU5BWgIQRYci46jH1I/QabdgMIhN4l1ueWLJOghvcE/6Y1HKfha/OwCwnekXTxRLJnk+YWlzi6hIWyNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 23:07:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 23:07:05 +0000
Date: Mon, 27 Feb 2023 15:07:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230227230700.e42ad744nt7suy7l@ldmartin-desk2.lan>
References: <20230225002138.1759016-1-lucas.demarchi@intel.com>
 <20230225002138.1759016-2-lucas.demarchi@intel.com>
 <Y/010MFqCOF0ObXp@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/010MFqCOF0ObXp@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c81ad48-d6bb-4aa2-00c5-08db191757d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/Nm0acqF5fBomYD2UBFkYii3RCGX9lkxsPC8e0JVBCT6nMkiwdqG1tZ4Arq9ZwBG7Tem7pgWLz6K0b03L7iaFbfMvpMrbkN8F8imlA4VgUcIPaFfI2j6yAdtUSiCpfMz6qM0L8Cf1Ul15vzQLoyWadmB3Rj4f2ksvAGuDRnMztxnjqa1VbeI5psuZGeubjOO7ZtMff77dh47Gflkbt2q6tTCSImv7iocv57udWpcRfeigHdJ0A1vKYwXVLTQ4A82kMaTF2tMuaNpvW1vMF4/6UlnmNoP3FoEiLxLYKG6WIQ5Ros2tubtpBh5xySbQUr+LBDqgKRtQJsbie85fnaoY486fvnaHuG3AZZjZGVpvo2j5TMZqFIz7oMqaWA8JDKsuDhEOgo+hs0/JI0WXcUNUTSu5yoLKyTtyEgMHyRrOTXJhvgrinIiwjvGUDUY+047NcfYj1aKxG0L8BTmWtTgz6SHA69PEjLNQLeCiq+ftEt9zda45No+HN7MEmh0eus9XKofA5eRLxhBnjswTxw74IIwbsZo8blvRlJZW9a1H2CFI++xgXhdr0Wqpe1zLEoL9xgsc9ycSteEpYMGJ53O8ahSD4fvVAGFsN1lFq1TeCQ39sdUY0dd77GomeF3JHng+qFMQVzl78gURGOVoDpyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199018)(316002)(36756003)(6636002)(86362001)(38100700002)(82960400001)(6666004)(6506007)(83380400001)(186003)(9686003)(6512007)(26005)(1076003)(5660300002)(6862004)(8936002)(478600001)(2906002)(6486002)(41300700001)(4326008)(66556008)(66476007)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uc2fkIWXOsGLNuLTNHxWqEq8OJu0HtA/U6VIILn4JZ4hmmsdiUnDF3u57u2B?=
 =?us-ascii?Q?bYd0zKt3ZMC59vX01O/YR8wnF+0LILdCtJ9WQrwRnijaMDuSW+n6oVnqqB4e?=
 =?us-ascii?Q?sXD1q30kgLxBIR3FiXcO5xOoYs+H3g0v31OZzjFP/ZC9G8vmMoWxEhhP5f1W?=
 =?us-ascii?Q?mx0B/EHuXoCvnYaHvuUNShlQDLY3cO/ep9wYhp5cWADS3LehA0DT3ehxVUYB?=
 =?us-ascii?Q?euFzfzXx9XQSgvf16yzirzrWXxDewZT6IZr7y2osMHJcFQzdIk9f2U9vJ74v?=
 =?us-ascii?Q?2YStv1SOr4YOl2S6DX+AANrgZUOM4th1Jzw8xygLPjT7owKxN+iic5aezSYw?=
 =?us-ascii?Q?du+E5j7/3pot483aiqXd771ocffQ/DpKkqhY0esxsQsL4bBxFQUm3OPayvLc?=
 =?us-ascii?Q?a12/2kAO39lpe1raC6/rGeB/BOTIhgNs1QFaocyEZmELAp4wlRzRC5RzC5Gf?=
 =?us-ascii?Q?ya7LVGBQrgdtRoNtZCZUcio4veYaJTR6kzA3kM1WbRiSmoNUMfcRfWENY4Pk?=
 =?us-ascii?Q?OJhFjT9cm0m0kSGDqmyxQJbQoXT+4k93TjDC6M0MJ2+i3vbO21vpwU00LKmj?=
 =?us-ascii?Q?eHUmnzFzD+IfQeoT8ZDth2nh4QtOJAm8DE8W9f/5LeC0ifkXRqmhrFO4hl40?=
 =?us-ascii?Q?u8V79uwuZo1RQnTxshdgW7i0ItQRGBqzoPDbDHZr2zZ0pg5ztvKI7Bx0fEQF?=
 =?us-ascii?Q?aZL0FFBkrB/AFKY4mdS4Cc7mszTFkK1RPActK8eEu5wLhLDBRiPLUDF9rFn5?=
 =?us-ascii?Q?Y5R2thdc/x8+E8hr5n1W48vXrGi59Bl3yn4uEvUQiBTN/opIpfnLHiI/1n9J?=
 =?us-ascii?Q?nY8ycxOa0Xs//pCMOi1QJoyYxZE/9bhZ+3fxg7X1z8wKv+otso+oCpIkk9ya?=
 =?us-ascii?Q?/ivddVTT07w0DYSxjGNKSC0Az5oiu8ocLFSaIQg/1GXP2pfoNshvsr0GOGnO?=
 =?us-ascii?Q?q5b9Rr4O6XsV5ue1IrSN5NnrorMG7PFErr7QaPE+/UX46xDdX+vG/bf0PHOD?=
 =?us-ascii?Q?eJTCamqVwyDo9NuSUPuod5d2tu45rlr5dMmcQD95mEQxg6zc5N2jZyuWkKoV?=
 =?us-ascii?Q?Nei0NTqy/a2n5gn2r7FtxkCSNUZEs1wil/hdOUDCdro05pIhiMQ+2lDjvSQD?=
 =?us-ascii?Q?zb9mt3+mVtAxMvDkE8vtMpQMi3dVuua7UVh5XFffGkw5fURUe/NWXvrpkr+Q?=
 =?us-ascii?Q?IgZuV5Rcn53Zs6qH1guiVUYmTI5TGjqxuvKRj5lO//8+niOy3cKVI34Nknhi?=
 =?us-ascii?Q?d9jOyQ7ZqT3cRDr2qbKILptjZ8c64LHP1Oh8j0Nfe89HrkLl8cysx50wmZgN?=
 =?us-ascii?Q?D0TU19mF5qayfxQGezGPsqSh81EBdvFdKoOmldVyQpIhktnmv1sy+QhjdXFs?=
 =?us-ascii?Q?RoVUt2hlFbhHYmesLBQWN1j+lrW24FGLHJ2JMFOQmcq/+azMRtgrFouUVyJf?=
 =?us-ascii?Q?pnOY9ewz5iIjzD+B60Gj/7PE8Bp5nDJ9W99p6eRBY2tE9xSYWU5HvD+YnsLT?=
 =?us-ascii?Q?BusSVoc2eJGZ25Si7OxXVy0M61auI7aefjXm2ohKNwTb3vg2vaohDfpiM8hW?=
 =?us-ascii?Q?QPK0AiH71oEM+JP4Qo1ulUp/QCVlbcE9wTjvdLTKdGxaDLKtnzPhheAcLw9Q?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c81ad48-d6bb-4aa2-00c5-08db191757d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 23:07:05.4116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iizMrm9saqDnT82FQTtHOajFAUxPBI2wWGVSeYrWMbBKQNXe8WxaApfRNn5iOMaWtNQ8C6L1SLbIrIxWpTrrqY3S5h8jighuvs2bijFMedo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/device: Prefer the drm-managed
 mutex_init
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

On Mon, Feb 27, 2023 at 02:59:28PM -0800, Matt Roper wrote:
>On Fri, Feb 24, 2023 at 04:21:37PM -0800, Lucas De Marchi wrote:
>> There's inconsistent use of mutex_init(), in xe_device_create(), with
>> several of them never calling mutex_destroy() in xe_device_destroy().
>> Migrate all of them to drmm_mutex_init(), so the destroy part is
>> automatically called.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index a028efa8eebe..5e2f5d93f2ce 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -159,7 +159,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>>
>>  	destroy_workqueue(xe->display.hotplug.dp_wq);
>>  	destroy_workqueue(xe->ordered_wq);
>> -	mutex_destroy(&xe->persitent_engines.lock);
>>  	ttm_device_fini(&xe->ttm);
>>  }
>>
>> @@ -196,10 +195,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>
>>  	init_waitqueue_head(&xe->ufence_wq);
>>
>> -	mutex_init(&xe->usm.lock);
>> +	drmm_mutex_init(&xe->drm, &xe->usm.lock);
>>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
>>
>> -	mutex_init(&xe->persitent_engines.lock);
>> +	drmm_mutex_init(&xe->drm, &xe->persitent_engines.lock);
>>  	INIT_LIST_HEAD(&xe->persitent_engines.list);
>
>I'm guessing this was supposed to be "persistent" rather than
>"persitent?"  But the typo has propagated to so many places in the code
>now, that changing it would need to be a separate patch.

yep, looks like it.

>
>>
>>  	spin_lock_init(&xe->pinned.lock);
>> @@ -213,12 +212,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	/* Initialize display parts here.. */
>>  	spin_lock_init(&xe->display.fb_tracking.lock);
>>
>> -	mutex_init(&xe->sb_lock);
>> -	mutex_init(&xe->display.backlight.lock);
>> -	mutex_init(&xe->display.audio.mutex);
>> -	mutex_init(&xe->display.wm.wm_mutex);
>> -	mutex_init(&xe->display.pps.mutex);
>> -	mutex_init(&xe->display.hdcp.comp_mutex);
>> +	drmm_mutex_init(&xe->drm, &xe->sb_lock);
>> +	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
>> +	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
>> +	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
>> +	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
>> +	drmm_mutex_init(&xe->drm, &xe->display.hdcp.comp_mutex);
>
>It looks like we've never bothered to destroy these in i915 either.
>
>I sort of feel like we shouldn't even be initializing display mutexes
>like this in xe at all.  Rather i915's shared display code should just
>be exposing something like an intel_display_early_init() function that
>will take care of doing the basic data structure setup for a 'struct
>intel_display' and that can be called by either driver's general init.
>Then when someone adds a new display mutex to i915, we don't have to go
>duplicate the same initialization on the Xe side as well.

that is exactly what I was doing with some patches on top. These 2
patches are moving it to a single block that I could take out to a

	xe->display = xe_display_create();

with the goal of leaving an opaque `struct xe_display` that would wrap
the i915 one.  I also moved the device infor stuff to be set there.
Code-wise I think I got 90% of that done, but then I gave
up: too many issues were popping up with the ifdefs on the i915 side and
the partial copies we did in display/ext/.  I may try to revive part of
that, but the overall display direction reusing i915 is not very clear
for me to commit much more time on that.

Here I only sent what I had split in small sane commits.

>
>Anway, we can move in that direction with future series, so not a
>blocker here.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi


>
>>  	xe->enabled_irq_mask = ~0;
>>
>>  	xe->params.invert_brightness = -1;
>> @@ -236,7 +235,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	if (err)
>>  		goto err;
>>
>> -	mutex_init(&xe->mem_access.lock);
>> +	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
>> +
>>  	return xe;
>>
>>  err_put:
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
