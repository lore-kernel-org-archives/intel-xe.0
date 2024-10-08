Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499CCEFC32
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03FA10E59C;
	Tue,  8 Oct 2024 16:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXM9P33d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6E10E5AC
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728406511; x=1759942511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HGaRO6/WzZIdcE7A3US5zqb8xRPHT2EAAlAoabZcJGI=;
 b=fXM9P33dnP/X5Iv8Pat5IsZM0yVZFfWajK5KfIyLFUH8AvjzxEgFn510
 lnI7TNHTbgtpTPvgOlGCsLM/ZQQrZT65RMKIl7w2O58wm959yH+xQKzOL
 5vGhPxw8FovhTZ2Zhl9KgX55kWfi96T1nbemKTr8w0S3eL3FKmBkuzD/5
 40h9Gqg9U0G51LFfMxBMbmX99vmvo40fQzjeqF/+lYoqr9f/K1htxZdDa
 gwv9PjASSbHcS2J20KaXLyAcKZcnn4FVXBPWJk6GTRChSnzz+5wuh1sio
 mb0PAxc2ACLKrH87yDvlSFwQyr4pgb6LUGB5G1Bbxaq5o3dOFiWNage9T Q==;
X-CSE-ConnectionGUID: BQac711eQNaQcuy5mPkLzA==
X-CSE-MsgGUID: ATntA9FISlGfIRpvrueFOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38983665"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38983665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:55:10 -0700
X-CSE-ConnectionGUID: 8CPgG3TXQ2yAVWJYiaI9Lg==
X-CSE-MsgGUID: j1yMJ5axSmquL/50MK9ekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75771646"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:55:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:55:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:55:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l67qTbaK2vS6D1v4Aphm5gx82vGhUGwUiyGO+XwuX7F9Da9+dMwMhB04STKcb1l6+gcG9WTMdwW2fh7X5JW1f4paE5f8PlrDfOVZ7tz5w62bopFH7Q+AypYzbcVG9bTxZ/RTXACLyNZV7HmRObttyKnaD26z5sQMwAduhcu3YkMTuyR1R+R4UvskO6WhgCm7L8EXD5QbrVyP8elpUrkZJFq3SoVPNerm+PB79AAn+S1c6ZI0DVb5JiDrXv7mZ95+x6RcwEyDnd4alAyFA5G91Tlw4uq8BrI8Q2YjCcEsYYpnCUx5yL4vuoQR4vpxj4eyb3GS1InFP6tEr6n+GXhIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFK2ioEn+A0PjgtgOxf524AVgZSD46F8Aaae/2XTQDs=;
 b=ie0y1UAbHnqNZ/eLRrhRws0veaHDYMkqMyI9SoQeJTGcjlmaFIXUGxPDpdiADORMCcXuErAnrrP6uKdMjlrnZ2V7fT1bNSH504MkbTD1ZnvVqYoq5SXagZVRI/uCDzOEKSw+aGBtgWqHaUDW4+Nd7Saxy6Qa1pSAAzoBq5N5nr/E7xL6F7swHo5wKAHr9pI5U8tmR1z+C9WouBsWqxMb0gJKsiXE8eXNldyEdksf73MkvXkwA7Vg+AydF00wbKgEfaSYdbTxvOkTMeB5B4GX40/vDzZgGIOPygj5MAw9o8R9GZOdv41lKpfScns1Avc1Q9eHNxesapB25dZiESS+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:55:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:55:06 +0000
Date: Tue, 8 Oct 2024 11:55:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW2PR16CA0072.namprd16.prod.outlook.com
 (2603:10b6:907:1::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed1a105-777c-4626-a73a-08dce7b9f61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uDyc015mLPrNY7eerJVopaWTD78HsMxChDT/boApe06zmUMH8X2L+FfSp/UG?=
 =?us-ascii?Q?KPIYzVbaImE7qv93lvHnOAYzL3GD9El8uEgCuFDKXBZ9qFyH7jn7yUopV+33?=
 =?us-ascii?Q?2bQsFV+b1FtOIanfXaYpuC0mTWnmDb2fgKdsE1mDDKk96FSog7wdBN9o/5EV?=
 =?us-ascii?Q?AOy75m6SQKYMTJkuuk3gPdsMz5bVrrG5IFycb2ET629AoMORPc81T2Rd9OSk?=
 =?us-ascii?Q?pEluj7A42jJsePV3ewez9AjpPpcah/YJPLhrbDgxWQqmKNfNHuxmwZyxZJIc?=
 =?us-ascii?Q?jqQpFNw5WelCP2KlNGB2IQ1omv/9g0MNO2YIKt13NTid1Eb3/hCNT5/v+CD3?=
 =?us-ascii?Q?jA5uOQKaB1YdgABV1qEX9hwGjrY0IWHfuoKJYu/aR84GwhQi3+QPQo2l6Sw9?=
 =?us-ascii?Q?yQr9S9kHm41C8J+QrzV8xt2e+eveYwtVcaUie+4Vsbn4gpJOg9zPcxT4oxjC?=
 =?us-ascii?Q?nAfUMnk1z2cxPLSnmpfkJQ/BcwXr69x9KsjyEf4zypToB0adWyzMVZZVg2DJ?=
 =?us-ascii?Q?1PqQMNtW7Ov+1L+y1JxxYqjDhX1hG1eeX2TaOWzS77qSNHIJsfBfDUkIf3n/?=
 =?us-ascii?Q?rSE+uiOCkfu+6/eLr3emNS4X0UG8ByIdHwhsSObeax2sWESZpVdd9ul9zsjb?=
 =?us-ascii?Q?6VzVQ+yOQsoL3fQc5DmmgxIyHlE1lOb8Hi8HUrBmjFwaKIFsm+t8a6xpXirH?=
 =?us-ascii?Q?Ec+L32UQsRVGLZ9DVSRsUfDDL9YB7grRLH3PynrSO+i2rCK87HHS5Et/Ts1R?=
 =?us-ascii?Q?7mAoDfOwM7kCdENwMZcIaz4p82PjzqzRl6nNQ+z+A5sd6PrqxjeEyzBVS/Ff?=
 =?us-ascii?Q?QNjPl1uMvOAjjwNnUzPtbwzfkggB6JylI1riXPd5ANCtBO4heIZRgHBdQYoJ?=
 =?us-ascii?Q?y3Mu5NCLM8+NXzTulFbXv+KvtQLD8ZnkBpK++uK+0UDQejRjdOgDYZp5V2PI?=
 =?us-ascii?Q?7gcMLpuqWFoDYllyKjMtOwhb3lLqzd1CUVcJ0f1i238s158NtRPLjZfdRNjK?=
 =?us-ascii?Q?vV/HFRnP6AyRhVTyrLlVj1MNaeB8BYgFZZYqeEZZzk8kQn3Ofe5mCWWxHc8l?=
 =?us-ascii?Q?Xl9z0Z2CNdV22e/j4VHdyHexwyPtL8hsNhIEZ6fkX218QbdF1RFq/WrhZO5f?=
 =?us-ascii?Q?pr34uohe73gRsYj8Tc9+vNG++53GyRwekzloXlOwUxIXiZexAPusE7+J6Xxf?=
 =?us-ascii?Q?324Ycg9co35MNlk2pTrsNP5QC5wCPWsV085pZBz6glF2JBgWlE2z+tR+nVtR?=
 =?us-ascii?Q?FtTR8SoQU2otiuu+M8GFSiV3n+MFfY9/s/3+y8g+Qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8zMUVps6jcKN9AmHLmU6kCVxgIgfP8N2IVOVz7PXI6xFSq7yU+xgv0MSI7M9?=
 =?us-ascii?Q?pIR3f/KZ3M9SEFKF2Vi0QmyHl+ywE8F2zfjfJ2xicXCo1ooGdUih3Gt8/ZCo?=
 =?us-ascii?Q?isKxDlcext5dtE/xwnMczaOIu1Y8et9hQIHOwihphK9IMdeKp7HASwo5jiY4?=
 =?us-ascii?Q?6T+abfNTkn7SEdA3xNIZslCwDLv7Wu/w9yPYJN6LnGQYT0X3FmA+5O5UzkKV?=
 =?us-ascii?Q?wasNRWd9UOtiwHnQtsybvWHLYYnAOjAXD+fvQQjAsGNu7e7zzU3id/Q9jxim?=
 =?us-ascii?Q?6w8PLg7psZFLH6YvODbzfBZ07hGQS8TdRzyRxzL0a7cNPu+EGhnjHLlMwa5L?=
 =?us-ascii?Q?ajCBkn9G9HWRAK2z9VS89j7TGySXATAkW0Kppj9rlFGGuWwWRhDgv5YS+39c?=
 =?us-ascii?Q?GR6C3yTli8FRRljLRWQQ78KEPfbTC8t2Lc33qrOqrGivMoMoCvZa4yOZv12P?=
 =?us-ascii?Q?fiJwAnuNIz7Gs72GRu8RQrt0YJzLQsQ9IUtKaphTdZ1lWh5HdOWRDZTwCDjp?=
 =?us-ascii?Q?dX4kQe8h83CyCZ7J150cH9b16v5yA96KC6DY0lg8f1G2Ta3q6JjW4zvz0QeB?=
 =?us-ascii?Q?FWD0aTM5zUFDCkTx8ytzpzurVPG8RgQwaXdXJuQOdwbQh3/mBRPkEXPGrfDQ?=
 =?us-ascii?Q?abjvGtYkO/mRo6rtE8e2L/b2XG8t0EZh10EjX0VxKFp0CRRTj/CE5ywdMd+X?=
 =?us-ascii?Q?+wFnvn+6Vor5+KDHbCeyCBxpGcKGLSrHXFZFYCRN6hCnAjqx5dhhDqZGpkNN?=
 =?us-ascii?Q?uHHm6D0mYkLtlGONmd9xNX9fGgXBVSBNNdm7nKLqBJ4MT1F9J7KSEFw/h1o3?=
 =?us-ascii?Q?ejTEZqnstrP/EEGE1P84CtTQ85qJgVqAC6AwEQ+1YsdVTLvI216j5nStWvCS?=
 =?us-ascii?Q?YdXrUWawMp0GUKrdnJAwTI62nbnjilxhP0LS1TMIsVVuIGbWV61Fa0bEz+db?=
 =?us-ascii?Q?rx5Ol/9XT/JCwFpc+2XgNEbk0ftZMzo6MQ8nkDvjzzaOt5xAIILxA9wo4Juq?=
 =?us-ascii?Q?9dQP4nvzf9jbXk9EAhzdFCdFTPxw+LjTIHDlZKsKXWoi73PCVeLZy58/V5F3?=
 =?us-ascii?Q?xnG/x3BdqjpI4OLcOcpkyMitpKqeoOWXaYtmICkMlpXeRtmbVgCRNU4wNO1Q?=
 =?us-ascii?Q?lKMaqCO9To7VMcarkLWw8wiZbpWvbL+P5vrJA++/N+ZvS5HUZpJtouG+9q3n?=
 =?us-ascii?Q?Uz6I0DRooynvPfNCaiNk4XKcmA9hoWAaTz0CAmUDbOnGNJuPYhs2Q0guLQ1v?=
 =?us-ascii?Q?ISkqnJbAzdE/7FhUmkFCw2cZ6S6hrQ2qi+MYHS8relT5s0xFaf94epvXblxp?=
 =?us-ascii?Q?hWrxKlD95a/Uk1d/1tp8OYj1Hu9Hk9jXxWY19mKY5SKARk+TOwAWcoPc/7Oj?=
 =?us-ascii?Q?d1Pn0u/kDUhYSzpP/SHUlrcB4fycmM+VrfYYJ2HRZhxquf6ArrlTPdLqDdlo?=
 =?us-ascii?Q?P4wHjGiIu29/niMY5WmdWf35K4MwQG/PKP3FEY+pLVvIl7Z5d3OKAP5TT7UT?=
 =?us-ascii?Q?/E2oRycqmM5mHI4clPqJS3tzK314/bBGQyDT4VaDhHXCKOLu9kQupUpLFdUr?=
 =?us-ascii?Q?xHJRn+1AtOgoPRwpGDhnfiUzs8KvNem5OntViIUDwJSPZx0NOwBkdNO8UuAm?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed1a105-777c-4626-a73a-08dce7b9f61d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:55:06.5485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyOyDkGLd48/BKYcsrKFhLO38ECNEzDvk4lN4qbhvO9UYGQwzx2mpaD4uCgk5EGKSckanbiUXsD8iJz5DPdmP0VzDtjzkqj6MlXJNvL+GMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
X-OriginatorOrg: intel.com
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

On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
>On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
>> On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
>> > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
>> > > Drop the exclusive client count tracking and use the filelist from the
>> > > drm to track the active clients. This also ensures the clients created
>> > > internally by the driver won't block changing the ccs mode.
>> > >
>> > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>> >
>> > Is this really fixing anything. As far as I can tell nothing upstream
>> > opens a file internally (i.e. xe_file_open) is never called directly.
>>
>> should fix this case:
>>
>> 	open()
>> 	close()
>> 			<---- race here
>> 	change_ccs_mode()
>>
>> because the close is not completely sync - the cleanup where the
>> previous number of clients is decremented is executed too late and
>> subject to a race fixed here.
>>
>
>Ah, ok. But then IMO just move the clients.count decrement to
>xe_file_close. I try to preach solid locking / layering and this seems
>to go against this idea.

why do you want to track the exact same thing in 2 ways, one in drm and
the other in xe? "Are there clients connected?" is something drm_file
answer and doesn't need to be duplicated in the individual drivers.

At least it's also used for similar reasons in amdgpu and vmwgfx:

$ git grep -l -e "->filelist" -- drivers/gpu/drm/
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
drivers/gpu/drm/drm_client.c
drivers/gpu/drm/drm_debugfs.c
drivers/gpu/drm/drm_drv.c
drivers/gpu/drm/drm_file.c
drivers/gpu/drm/vmwgfx/vmwgfx_gem.c


Lucas De Marchi
