Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA19C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 18:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA11011341A;
	Tue, 30 Jan 2024 18:48:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF911341A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706640537; x=1738176537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M/xlPocm4I3Ial3+hvuYWSIdxh/R1j9cwmVKhP+/Fgw=;
 b=LMd5Lk3MkxZIVPSKGR/fjQBrJUm3uI6ermoHE4YokWViWPrF5h1OeBYd
 jmqGfqyeWPtEapmWDDaxB+0meWdrBnn3btwfaNyP9OSoRT951pqIx73dm
 8TX2tDn2qDJuG15ECBQXNFfv4Yx75TBEB4S2CmIR7rMk1/I16oEKRwzQS
 /WX7kDo22QP6It+Omwa5YgaMDbLrUm1DLwDOceULxoGvQSEo388dwQ3b1
 ftTd0SsRXAuBSoWdkhRgjF6Nj9YvxQkQd2rFHooe8Xd5YT7Q/enqaEYzH
 bZUreQkNzSv5cV4CDxYUk5ehah8wNH7VS6HQoA1g9MNJWjyzewJLAPN8A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3216882"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3216882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911533699"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="911533699"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 10:48:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 10:48:54 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 10:48:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 10:48:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 10:48:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bojr+7tbTksF/NumbPltsf7AcSUwao3PuH3onbOIFGbR1S90uLEHjN+F0KBwHbrVDQ6Ob71jhCNLZp5+0O1KXvZ5OPlbrxaf/ESsuV3ugtUDbdu/qrmgc4e0QeYWmuEQKUIaBd7EhKz/FULbxTjkil7IZ1ASpBe/OSkNOB/d8gldkeWAiWD1POsWFHT1sgQNoE/DTqDtNorUonRsMEE8gxXt58KVJcy/0eO0JMk5IsupxLdgGB1UUbxMxgaBlVJccyGzOCQtRuLiUZEXp8uRLmb6RsfVCOBEsn0OAvzq8FfGJjyi2MPChLRc2gxXaDvfmBbqqJYwiXaqJv2MsRvzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvJNNY2y9DZW85WtyyByPB6rCoH0bfZVLn1OMOMTqMY=;
 b=RebwpzNE4rb52Yo7htEdadNPqqG4GBDK8AA2VDwf93iuS0UmZLRHz90J4y18uKqNzVPMjp9grqPBWMbNrhKthhRWam122yQ0fEvICDFdJeUvUHlxMgXxtbzPhjEVmBCCg/xToFN0fp2n0xhh1C3ON8r+xgHmRZ1a3SLg674SPhnqGdof2XQLvBgQEk3/dfLEEngitYUxhLqW/OWC2205ahTO4BwhyE7VQ15N1vO/qAzHO+jTO7OXBczcEmP//xoNBH4wKCFjYiMvm8du7LZrn4FN1plH/jmn23qqudYUZ1oi5s4+3jwJP6cLRcaRtUX5nAty394jDcTD1xomwSd+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Tue, 30 Jan
 2024 18:48:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7228.035; Tue, 30 Jan 2024
 18:48:51 +0000
Message-ID: <b54fe849-bf9f-4000-b695-069bb3c25b70@intel.com>
Date: Tue, 30 Jan 2024 10:48:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Remove ci-only GuC FW definitions
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
 <85h6iubriv.wl-ashutosh.dixit@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <85h6iubriv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: db5a540b-4823-4f7d-a115-08dc21c419c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuTKy3OO4fmJZSCyzC4rdt/IhOMWykZaqIpjhkypXQL7DGbFtTkxenRLCYgY/B6qpZlrNi/QHjZhiL9u97f+lGHESSIzYVQmS/hJAfa+PJme1HQ+sIQZkhAty7xC5ktvbkf1CWWL6S3NfVN0dxhuX9n7lFGkvDPVhOPQiGQgL82GUd+fv1OmtbU+ymuaBL2Dey7UyqxNusSDU1g+B0UGnK9ryzhJzzdVKkxW/V/NmZ1k7/Re+3G9agIJNIMDMYWRrgDYPSPUY6Yna4rZuEt0XnMIbX067YzwZplzJQn5slh30NdYEt/cyMTq2TVmOuVMjLSfdQj0Pt4+saU81oQIlZwH1JJPSOFe7CdYbbKX1GUGEdt/kZRxKz40R2oKortb6xOKFhQFkjLlf4Eyx/ACu3O05AjPQWVtuekUXBT8A8iKkwQsIQuBR1nkztQnaJjXY1/BnKpEF+wKqv0I5OV5xYo58eYRIE7irLvE19LwraSuTKjEkGh6ewWuALya8yPkDRQ4gBM7Hn7boDLPEkb9TNoyu3ohGQf7xYXitryNqxKzI7YjZPpe/sMBDZOU9z3ss7VOjLeWZIx3yX1nPHEHnwEWGysontUpQUNeDgjtm9gaFjzmKfSciby8lS3hhEUfHfHLL9Z8pR7XZHm9BCE+tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(66946007)(5660300002)(26005)(66556008)(6486002)(66476007)(37006003)(2906002)(83380400001)(6506007)(53546011)(6862004)(478600001)(6512007)(6636002)(8676002)(8936002)(316002)(2616005)(107886003)(4326008)(38100700002)(41300700001)(82960400001)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDR2Yzh5WHZIN3JxaERRdnVtbFI2UEk3Y0xiUWIwdW9nMFZjTEsyaURnT1pO?=
 =?utf-8?B?dHM1cUZlSnNxY1pLK1ZYZmVrMzJNWWhrUVIvOEZ1djFTeGZDSjJaZlFENW9B?=
 =?utf-8?B?eTFJZk51VURtNnk4cGJ6S0JkNlNTMXRCUEFXMVRtWXhNelFPUk5yMnR5RFVx?=
 =?utf-8?B?eklGQ0JEai9IWW9ESGxvdVB4aUJTNENGRDNxZzBONVVCaVFkWVpSWVFhV2lV?=
 =?utf-8?B?c2RCMlZBQkZaZzAzb0tLVUtkMWw3Q1dUSEVGTVoyZXJuNTBvanhYaW9WMjBU?=
 =?utf-8?B?a1U3OUFpRUZkb0VSM2tzeksvTHJwYzY1V3RyMlhsekxXcUU2L3VOaHdEODZU?=
 =?utf-8?B?cXF5SmdsSW9BVEdUbkZJWHovVG1TRFh1WTFHUzhGZkV6MG1TeU1uWExFTkdn?=
 =?utf-8?B?RnZ5czkxWnN2a2FtR2VYay9zOTIyQzB5YTgxazdidVk3NEo3YUZJeGl4V0Y4?=
 =?utf-8?B?Z3dpRVZWbWdlRXlENDc1RFU0VUFtSERsV0V6MWo1bHliTUFCWnFLSVpwMTIw?=
 =?utf-8?B?SHRycEpZN0p2SlRjWllzSWZwYzVvVzhrUFZiNUc0RWthK2piZlJTWEFrekJK?=
 =?utf-8?B?ejZIOU1DNEJWSTRKTEF3by9nN2UrVm13V1FLMWxEdTRoZEl1Yk5yZ0s0Vm5F?=
 =?utf-8?B?TktuYmpQZXcxVlZjcjVqRWtnUzZDZjlJK05iYnFpK1BUai9lTjBNUXFTSTNH?=
 =?utf-8?B?MDNLYkJKNWNQdjU2elRkcytSeEpUak5vc3dsUE5oZDNCMy92ZGlCeFVjam0y?=
 =?utf-8?B?TTBPVStSK2gxMCtQc1VQN25SVTZyNjNCc0w3Yk5sN2RuSksvWGxyWmZKMTlU?=
 =?utf-8?B?ZG1UdzE3Q0NtQW8rRHRFRzRXYTRzQ0Q1NFFnRUZBcStpZ2hxcEZLeno5TTdN?=
 =?utf-8?B?U2lDYW5GUXF4NllibkxValJWOTVDcTUwcE8vRCtBNXhzS0t5YWNSVmZiOSt1?=
 =?utf-8?B?SWkyZ1U4YkJzS3MrZ2orTGNqQnBZWXkwcEpiSmR2TG9BMzZSbTVpWTlIUTVW?=
 =?utf-8?B?bjErejdZc0ViR1NXelJsUGh5RGRZbWM3R0F1OG01cEl5UkdnNU5HNklqWHdD?=
 =?utf-8?B?TzJ5SmJWQzVyRm9udUk3NHFDVXpQNTRISlVnMVgrT056VmM1cFV1Y1ZZN2VS?=
 =?utf-8?B?Y0hlMGwyd2RoZEwyQjYrSGhRR0RjVmZZeTg3d3JIUkZTV2g3K3VPR1ZqdUdR?=
 =?utf-8?B?TG8zK2U5c2lpTUt5clFjdEdYWDZuNnRwNG1HM09wQmJhYm15RWZJUUdVWDdK?=
 =?utf-8?B?cTdtSjhmd3NmQmp3Q1NyUkc2OEs3UER6ejRGRFJ2R05BclpnZ2dCN0Y4Tzli?=
 =?utf-8?B?ZWVXSERCUmE3ZDVlZHlEOHgwNVhJcWJHb2JYUmpoeEZWc1U3RW8yczVKVk5M?=
 =?utf-8?B?WDlMcStEeEh0dkFCb2hNekNZcWhaUm5rcjlvNFMzZTUyUVlkWXpaLzJQS0cx?=
 =?utf-8?B?ckRkUk1IUE55a0YrZENUaWhQVWVmNGttMHJLcGtDR0tMR1BTSjdRcGRublRL?=
 =?utf-8?B?aXZjZ0ZZRW9ZcHZPT2d1d2VYaUhzc29lNFVCbWtYVmlSUzhQZXBtREtyejdB?=
 =?utf-8?B?VjJSdUZmRDArRzdGSjBXUlVtWWt4TENuMm8rZ3NmN3F3a20zTjJLbWYwZ2Jj?=
 =?utf-8?B?aXZsVjlkcjVzZ28wbkZNa2RSckxjWVp4VjBhR2Y5dXRGQmowSG0wMnFYR2pD?=
 =?utf-8?B?akU5MnYybTFTbVhaTG9RaGE2c3hRcjZYVG1nQ2ZoRy9Ddmk4SFA1bVVCSDIw?=
 =?utf-8?B?UWVBQkV3bDZlVElpTHVWVHB0Q0p4V0NadFZRTU1rc1RkZXZjYUltNU1rNmlM?=
 =?utf-8?B?NUJqT2JNZk03eHBlQ1pQRGZ2L2krVG5SazRUT21meFU3TG44Nnc5amJTeTJY?=
 =?utf-8?B?amxKZGlHQkQweklUa0FKZXlxejVhcnVTREtSUVBibkllVVVUL3FXT3ZRTkFO?=
 =?utf-8?B?ellabjFNbDBnYkRvcjFaWmRJTmd0TWI0NHBtU0ZPNXpvbUxkOE1WbGtpVTJD?=
 =?utf-8?B?bFZWdCtveTQ1SWtKWEZsYjhwSm1xckhRT3NUZUtMVmUwUlNYMzZXRDQ0TTE0?=
 =?utf-8?B?T0syTlBsbHNOcDJmaTZadU5xMXE2ZEtDNjFBNkdvQktTWXFYMmEwTFViTnRj?=
 =?utf-8?B?ZHZ6MDZsem1xM1d1N3MzYWt1ZHJiY091dWxGbkhNRjl0emxGeFBlR0drKzNJ?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db5a540b-4823-4f7d-a115-08dc21c419c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 18:48:51.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr5qTByBnM0bFDrc6yI5zWUmKrHG1JDiAap4/sP9SGTxfezmZYNKK6ZMJNzBw7eLOMAZUvcSGoSS4SbIV89vtxYk5b/FRPxPjLu5eMF6bYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/30/2024 10:33 AM, Dixit, Ashutosh wrote:
> On Tue, 19 Dec 2023 12:00:20 -0800, Daniele Ceraolo Spurio wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 73d6938c921d..9dff96dfe455 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -102,9 +102,7 @@ struct fw_blobs_by_type {
>>   };
>>
>>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>> -	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
>> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
>> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
> I think this commit should include an error message saying FW not found (or
> whatever). A lot of people have spent a lot of time because probe just
> fails with "xe: probe of 0000:00:02.0 failed with error -22" without any
> indication of why?

There already is a drm_notice for the firmware fetch failure, in 
uc_fw_request(). Are you say that's not coming out in dmesg?

Daniele

>
> I actually reached this patch after bisecting and realizing FW had been
> moved to xe-for-ci branch :/

