Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845A7C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC6D10E27C;
	Mon, 24 Jul 2023 08:02:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76910E280
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690185763; x=1721721763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zjLJ7+6m1hxvQdEy4D26WSCeLShq9owOqY1KcpGcDE4=;
 b=DoRZORUvP49+K7qBym5T02KzszekC940Dj6of7Q3FtVK/vjEUtBf2pkM
 WINRdP6M1zce0PtXIzBbbecPSMz6yv8tdbxrbmzwC3AjX97eM5X7bDv1M
 WOd5YUfnhF+bOSNslp0XCpEzB23vMl37D8HVpjpRBvCltFy+yV89zJH1m
 YkC/ur5j8HKEBTGzmPMYXw01F1fgT9dMRlkOHwTnRhWoeeVKCQw2dpwFP
 mJVwlFVf42N7XGwGQaQ/Kof6vPWoR8hqFaPpktootaXLtVm8xM21YhZR7
 2RaXhdupHkUJXYljEcCsh7J6pDzKJ4uqlsiLoGihQqC3+hf11+TrlKjIV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="366269673"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="366269673"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="899424555"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="899424555"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Jul 2023 01:02:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:02:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 01:02:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 01:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNQtr7x21dB6uIF2W8g1aXwlHEURODjH3O9c4B0V/PFR4KOHP5jcoPdouPOQG/NH5FVjccFWe3icL0nf9nBACaSt36W8EqsBU5N/mdsP5Lb/ZV29Tk/kA+8qTZbDQfN1JPTUdkwPnvtRFPXjf2j73ysTaPuvRp5zIs77r6kiiY/80VZcLotMNUOAjZpeJaP+9TBnE5wydV5DN+sHaAhZJo+Zxcll7fKSOhctqsqcSNxEyS9Cs9sSYeOpvo3UAkxJBmIr5fPe/pxz8I7wBZNeQ0+auPszYeY1twyA1y6edPoOXWfn29Rj2zZdhiJojmjB1f01hgOiUhTbrUpYo6LUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGUO0gAp/SXKrrNkt6hkNHjvkgC+rPV7bI3vpyLhTb8=;
 b=YVwGh4i2W+Us77N6KO2lss4aeVzhNvofYlPy56oInrb+2d6ZyZzII90lyO2CL04D96kivy2rNYogVlueH8ZCbhhxUiI4capypGbHvubVT5F9vHlHm3VqErj6VbACAbK7jy1/DTsWCQSHoPT4bQv0Tkgn/fbRmvDU8FJj9Xj74DFEF4b+F1T/QGQO2wL59uy8Hpm3DYho1L8YpT6ZQRO3aKi+LWX9LlzDflN5pD/PrXfMJdAvjOi71Iyv8wnppor/wVSecFAjAo2D6kL1FdvWmD5a38ewuNU4gLLg6gbFumKWXfCKNpuli9HMCsMkQmBNRPxjBTt4Lk3ZQU+h/bxezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Mon, 24 Jul
 2023 08:02:40 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:02:40 +0000
Message-ID: <8750ab31-591c-8e98-8370-d7e15ea8a28f@intel.com>
Date: Mon, 24 Jul 2023 13:32:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <874jlwqabn.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <874jlwqabn.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 312f4a81-6c42-4572-2017-08db8c1c5a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VynOrKYKTAWlk+NIbzD/uylr3sl1CCYw7xoCkoDfNYnlhAQCZ8zrDa4mzzc60eJJ3ROvkFFnjNCddJkFVv0rourXKEM+SKPWALaCG/nLrTyPdZTlBJgBde8KmyZr5IarflnzGKaHca4bbC4w9AEPXCyy9KgtCCM5xQCB3ZtUFA1V/nowW3Lo6bPoZSpJ4vZhtGsupnPpjoVc/6hhFjoWs5Ab26FnKlFYUZNox8q9CZc2tiKAim5P0Pid2JnPqDUsCMt1V7scTrs0z+srJxbE/2he51VaZKJRsrS5NFk5guN5rT2NL6Fg0BFaShMt2wkTlzVQgCoTXqPRxMzlyQsKL4hRX39yimnALQvBo30r3NyJNRUXTSzFzGv8495Vr49e+Zf0/K1ZzZ5mfvA8CDySuxz9Isr2wEZSpC0KmqEce+e5b8OJlEc8UfXNntTgft2bZPNe8HkJccMx5tA4KIbSu2pp957tW3S/ZQNmAJgmSOYHP3iOwdLyzBXvJpyDCpw2VgLgZ8ul7JkFAGw54xngSdtRjlkMYpVCCwdEv7Mpsi5PQmSfnRwNP6yqWrfZ6xbs5cPnDFhq84TtkAzcpfHAikeMYgtdDxQX87v1Q8v+SYv5pwiiwP1k1NeXyhhGcOVMypb2KfQQ4SIoFPq5qZudQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(53546011)(4744005)(6506007)(41300700001)(186003)(83380400001)(478600001)(26005)(6666004)(2616005)(6512007)(2906002)(6486002)(36756003)(31696002)(86362001)(5660300002)(66476007)(66556008)(66946007)(6636002)(4326008)(6862004)(8936002)(8676002)(316002)(31686004)(107886003)(82960400001)(38100700002)(37006003)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZaRjZ3elRjb1FPdGxoemxTeDkrTld6ZGp0MGpqbUhlamVTaysxaXM5Z0R4?=
 =?utf-8?B?Y2F4Rk5HVHEyV2duLyt0NG5tbVRVaHlvTE1PaThia0lHYTFuVUI0bXU3eXNt?=
 =?utf-8?B?TG95NU9xd1FOZnZOWUN5WUlwdU5Rd2VqSXY1ZFdXRGhnaDF5Q0s4YndmUzdv?=
 =?utf-8?B?aVBLNy83YnV6VVgzWGFGU3ZCZmdwcXNNaTdWODVDaWhxVzZzSExLa09vc3BL?=
 =?utf-8?B?aHNqTzhYd1hoWCtoTTl1Y1cyaTJNVXhza0s2TUFnaXVEa2Y5ZkVqZ3VJY2Y1?=
 =?utf-8?B?UERobW9qUUJRT1dOSVVwNEgzNmIrNWp2dWlheXpQdFBNNTJaRmdRMUtwNlI3?=
 =?utf-8?B?Z3NpZFR2UGZDS215TDlQUit3N1FqeGwzcVRxeUxicFo1UWF2RnZvRzJ2QUtH?=
 =?utf-8?B?cWdINnVZeGVMU2NWTVhjNXByQlFaeDBaeXd3d3VUNyt6UHlOcDB6NUN0VFpV?=
 =?utf-8?B?YzBQMmVCYXVZVjZmUklvekVyZitsc3k5ZkdvempQanNxSDJFWUs3VHVSZ3Js?=
 =?utf-8?B?THlKek9hNHdCSkQxZ0w0dGZkU3U1YVdpdGx5bk5vN0F0RXhEakt1SThmc0ZH?=
 =?utf-8?B?RGJ5U0ZvMjNJbWZYNDlWSjFSSFZEdDVSb1V2OXpuYTdyRHpPMzZvSDJHLzVt?=
 =?utf-8?B?MkJwVS8zMHVrWkRLSksvbE1mOXliOE90MnZ5WFZiNDE1N0Evc3RaaERaSldr?=
 =?utf-8?B?M3hSLzVpciswUjJYUExoR0pIcld6UXBVY3AxQUorMGdmM08zNjRqbjh0cU10?=
 =?utf-8?B?WWRlTWFjRTB1Qk9iZUoya2xnR0JEMG5oY3QzR1ZLVndBNDNmQjRsM2VLKzVB?=
 =?utf-8?B?WXAwM09VcEowZ2kzNGN2eGVad1k2NGs2SmhmNkdZUGtCNWt2dnM2SzJZTkhP?=
 =?utf-8?B?Y3p0V3owbzNqLzZOaUlSMFVBc2ZoOE5tMDlTK0FoaGE0YzNCQWJyQ0RvbVZl?=
 =?utf-8?B?Tk9jbFErVU5CMVBXS284R2dUZ0VCR3kzdjBub3dibUR0V2lEZkpSQmVGb1h0?=
 =?utf-8?B?RGZ1RXpLdXMvdEZvTk5QV05LT1YwZCtjNjJsL0Zja1FGdFozNUZqOEVqNHY5?=
 =?utf-8?B?dDlIZklXRjl5U2JhZjVMaDRMR2FoRmZkRG1rdmwzMXp6dksyajVOQkFmcVN4?=
 =?utf-8?B?dUZBVEdDdy90bmhzQXNoeWpPRHJnZXNzMnIwVkRFSFVlV0pJTmZ6RlZ2VWdF?=
 =?utf-8?B?aUtPQWdZcmJjSnllQ3cxYlhhbFFOKy8yQWR0SW1MV2FIMWlSUWhRWGphT1E5?=
 =?utf-8?B?c2dQK0xlcWljaml0ZDc2QmluT25pcExyVFptaGszZjJqbG1BS0luRklJd1li?=
 =?utf-8?B?UWY4L0NpaVAyRnZvRmQ3ejFKRVZIQ3FhL1RUSDF0RUxzdGhOWDhkQ05pR2pj?=
 =?utf-8?B?SzBsYmUwSDRxT1lTQ3hMOFVZMGhTaGtyajRYRmRlcDRNTGdZQkllZngydDNV?=
 =?utf-8?B?cHRQQTZHbngvOWUzc3NFNzJjKzlRSUh1SVRyVkxmR0FyMjQ5cDJIMUpNK3d6?=
 =?utf-8?B?OFdjb3cvbmpQZythQ0tndjRkSThGWk9PaG94a0Vqd1JEUXJvWEpKRWZYZTZk?=
 =?utf-8?B?VEhBd2lZQnBjbWkrQnp3OGlCVVFiUlptZGhKYTZISTR3OVp1bUhyUmF3ak5p?=
 =?utf-8?B?Q2VsRTZaaVRyRHR0SitMNGVqWmlYMjAySnNZQnJjQ2ZEd1JsVExwTmw0eTJl?=
 =?utf-8?B?aUw1VGVwaE9YdlpheTY3Qk15RnIvZlJtQTNWWnNyWUJsYjBoSCtJTGJ2MlZY?=
 =?utf-8?B?bnBBQ3VkdkU0bzhFQ0MrVHBGOXRiUjExd01XWlZNMWg1RHNnYUYzUE5EY2c5?=
 =?utf-8?B?a3M3djIwQ0t0K2ErWW5ONXc5eE5oVzRmMmY2cDBTc1lWL0d5NFkydzZyNVNm?=
 =?utf-8?B?cnBGbjJkWVRzZ0VBbldHTldYcjZ5MGxhOFhic0NqK20wRWZqSC9BTm45ekNq?=
 =?utf-8?B?ekpSbkVEZWh1Tmo3S1k2VHRtK0tHOEtTNzBsWDRzTEovMzdLY0M4azdXZUxS?=
 =?utf-8?B?Vy9QT1lOdXhYK1pJVUJjTHlHdzNMd3VYS3c5QUg5L3N6eFNYMWdKWTRyTFRQ?=
 =?utf-8?B?enAyQzZSZkJVa3JaTDNhODZUcS9ERXBYYmhuM2IrWXVCK0Q4WkU2azRaZ2E5?=
 =?utf-8?B?YmNBTXdleWFuWXVFM2V4VTdVNDlIN0NGc1dES0M0M3dTLzBXZEpXZVhmVk5v?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 312f4a81-6c42-4572-2017-08db8c1c5a0f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:02:40.4961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XJt1e+9A8EcHAmt0f6vgGxHUQPG5m9NPmTA40825iOhapBYEYi/re+6pvZAyNOhetDZcIm6E7nYJixjbFglKL1iMefF59zKYwNN7pRAKLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 22-07-2023 20:09, Dixit, Ashutosh wrote:
> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 2458397ce8af..96e3720923d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>> 	if (err)
>> 		goto err_msg;
>>
>> +	engine_group_busyness_store(gt);
>> +
>> 	err = xe_uc_suspend(&gt->uc);
>> 	if (err)
>> 		goto err_force_wake;
> 
> Also, another tiny point, let's not call engine_group_busyness_store
> directly from here. Let's expose a xe_pmu_suspend() in xe_pmu.h and call
> that from here and have xe_pmu_suspend call engine_group_busyness_store.

Ok makes sense.

Thanks,
Aravind.
