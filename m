Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC0FC7619A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 04:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20D710E04A;
	Mon, 27 Mar 2023 04:45:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BB010E130
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679892300; x=1711428300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNLaV0f+bcFG+AeHGAcfLhrBgEepLJu7neupLZDKFRA=;
 b=dKpMZz5lEimwVezOWifqr7yGnv/+VC/KBG/voL6sk0JOmAFBYdI4qm/Y
 rvhzkpCc5gplJgd9ettEUbpmShxUCg76SeLBxeLP6BpF1NkLbh00isWEJ
 TYeKJcddiD2GrNPF1FZ6en8wt757yYQ9senVnYK+fiaaTYs4/GR3w1A7Z
 JcY86ESW1xvLCuSnBNP0A/zkpJR6S2i2e1i1toQ9Uaq8sof/CgMGZip4i
 HBsyOPYl8zGge9owAyVEohroMqDUPMpHTYssc6hoq1kbFILPtOe7OkSAd
 dAECNSexNJvp2NpNR/lxxBdG8g5Q4Ck9eB2bksnws8HrMSKad+Eah+W4I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="340203582"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; d="scan'208";a="340203582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 21:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660716899"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; d="scan'208";a="660716899"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 26 Mar 2023 21:44:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 21:44:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 26 Mar 2023 21:44:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 26 Mar 2023 21:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0u8pjZbJr50JWoitn12xC296Xid91Cu2/3itjX5bVOGf9v93jQL10z/BG4e8bf5N8DoyASTHyMdHV5XxXQ6u5caWIU5IviGP1kiYXAGeXW8cTO/afny4SM+AStuXgNhEyhFf4VoASfQsUAy/t2+ViV5buBByfeBCC2y+AoDsun51Y93TA0NZVflJljSPTJh2nOTkc+B4wubVNlGtTsfggBWYVjJjbCb0wIPMwDMlO8Z1HUfxYFtNQJQiIT52/5w+PNGLpXmnX+bu1P1W/tZTKLOL4cbn6b8Lf8w7DSU8lXSncaeaTvB+7mICtpz50BlipQngSUJciIIW6iQne65fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZr3l46q2ZVxurcAwUSIyr7mBVJcFdUeCzI754seMJ0=;
 b=kkJwzJOecO3Bp0QCPpgEdxnjLAEwIA8Cpl2GqQLMfWG7Oaq63a7163BogHo042g8aloD2Q2FR5KVBxx1do+NZnj+1IR31OJv2cqzArlgvmmMntHjY5jm3OsbJcL6XylcnpJ4D6hkh7rToFTG9ep1u5N0neA40mql7nLF5b+lnXvfn7SY2Xr6qesYI3pHng53pWad/oSRmmPdbvat1AQjysVNpzeWwrYAUVXMNPvzlinbbMBoTgfnee5cYSBIKhTi8jWBo47y1oPQnI7lvJSbc0sqDSOp45Mkk3XRJ4W+vQTBzLE48UvDcxzdEJO503i1UP6N33qeJ/KK87+W5bBJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 27 Mar
 2023 04:44:54 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%3]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 04:44:54 +0000
Message-ID: <31313ebc-01f2-c364-3028-929a57d1990e@intel.com>
Date: Mon, 27 Mar 2023 07:42:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-7-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0684.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::17) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 0526e07f-7da6-4250-dddc-08db2e7e0214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cSZN2ca6QJ7LuWHa7hPdR1A1Rv0WS4rLeZ+GfxauoDhxsY5815jJ2ZK3wDG3OKF5ZqLtCw7BF3XRFCUI6xafSRHjJ4Y8NWvEAlTTJalmGarjPnuLjQeQv+U4DGUBjdh6nz5BmPt/EPE/Sja9pGnz4/DsnkANEN5umJ6qdGxPn9mBLbTdc91zFwZ4tHuZ/KOorgz+bE//Ti2VGesSs4QdH7SAO2ih1ahY5L20y5c7ZH7ILRsIVFnCeEz1AnRAkYqVsqv67OVfBzPKJferZKtC+RokseA1gqEXR8vYppyqbsRhdejjq1/OEoRvr+RNc73vsOU+itOWWSJmyYExKrvgbNuInwdDp7e6OSycEToGtxF0bmFe+0rvZ3eIhy+TsM4ChxL2qVmXYBFwlGx8UxHXCVU9+iJdyJSl4RtWgNQMPRj5iZBwoieGXG6axlqMqBab644BCtzS2Be7Yq/ZICBn/Hgwwv2xyhvBJsOffYeW+22tEQZqsTS421fWM4ae5WHmnEp/DMr/ZMcwTwrYzs7XeUz4UZ1knMgGWhdFUZ5BLWNXuedaXYf0QllHQdPyLtTZAxgUNKVQ8JNdmXckgTLT/3pSX89JHTZiqVLe+LIeoLa559X1Vjh7E0mP0N19BHRliCDLGTL8j0eHfSESCsd5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(5660300002)(66476007)(66946007)(66556008)(6486002)(316002)(54906003)(4326008)(8676002)(26005)(82960400001)(8936002)(2616005)(186003)(478600001)(41300700001)(6512007)(53546011)(6506007)(83380400001)(38100700002)(36756003)(86362001)(31696002)(31686004)(2906002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNGZzI4U1cwN0hJQVArK2R6TFhPb0twbUJ0cGJXR3JuL1ZPN1hkYzdUc0xk?=
 =?utf-8?B?Q0JNLzI2TS85L2o5WEJpT0FQY1BMd3VDNWU4VFZIWUcyNWZCTERHbHk5T1Z5?=
 =?utf-8?B?WE1SQ1B2RFFJUzZOUHNjQ0NMQTlneWxvRThJTkpIbWdMNERVLzdLNTJoN3Qv?=
 =?utf-8?B?bkt5RDFwM3lmN3hJRjhDK1hrNS9wd0ovbDk0dHlndzRoQi80TVRTSGlKeER4?=
 =?utf-8?B?Mmh2TEpZR2o1MlZTQkNFR294UmtJOXV1c1BuUytmc0NWRDJqWThPWit4NlRO?=
 =?utf-8?B?TG9od0FwemlxWnh2KzFqRU9PNjc2MVkzZmV2bklOTEFzVW00UUNmZWt2RzdX?=
 =?utf-8?B?d0Jld3Y1TlZISGVGTDAzUmpQSHFsVHNMY2NSREZJVUNFSUVvK25Dem1zcWpE?=
 =?utf-8?B?MHJzMld0WmtwbEU3OTRYRVNJRmhuRUduZ2pHWS9yWHNqNnppcVZJZEtpN3pJ?=
 =?utf-8?B?dHowTHY2ZE95OVJ3VmNSUDRpRTFYOCtMMWNqMUpybVl3bjc3cVc1bEFuRVRE?=
 =?utf-8?B?eU5EMSs1dnVGZXprMStBRWNrcjBVUjN5cE1jajYxdXpvcGo4aE5qVUp6eExs?=
 =?utf-8?B?MlpBdDRySXhyQXBibnBUakZYQko3WndsOFgza2hkbmhyM1pUcGdDeitoQWRu?=
 =?utf-8?B?ZEZLWUFYYlNyR29QamtSeFpjZkNnMWowT0hGL0REL2paMjJ1WkpLL3ByY0hO?=
 =?utf-8?B?N3NNZjR4MmxEUXBXemVmSHdpanZBK3B1UGY2ai9na2trQXlmNlJwWEs0YUtQ?=
 =?utf-8?B?eTUrQkthSzVNeTdmbGJHUkNtSnVGb3IxZHczbEdYOWJoSXo2TkFQYUNhTWFC?=
 =?utf-8?B?SEZuL09JN3ZxdU9IZ2JxN05FWkRvUVUvM29TOXlPdGNRaXcySHc0bmRLL3NI?=
 =?utf-8?B?b3U1VzYwREdwM3diMXhLUGtaVTB4ZFBuTjg4V1F1eGozMjdQMXkxenI1dFZw?=
 =?utf-8?B?WE9IZnJwZTUwelVDbEFKYk8zY3Y4RUZxbVgzUzh0QVQvSjNPdjJkakRDUXM0?=
 =?utf-8?B?aGY1QnhuQ3VDN2syWUxDUHZ6UVQzTGwxTjF2UFNjdG0rWmIxcm9xMzF5RjM2?=
 =?utf-8?B?MmdmNnZIL3lXQ2R1ZzBqTlhWdzNZNFJkM3l1dGdiRUJVL2ZYT2lYMStnTkVG?=
 =?utf-8?B?eDZORFFwQlFsamJ6L1RUNmRBMi9LSS9uaFhqR25IY1FGTHhtWmY0YXZjdVZE?=
 =?utf-8?B?VkFGYXV1TW9ZNmtoN003ZVhoS2YrWndwM0FsZ0xJR3EwcFc0UFQ4U3NHNHNC?=
 =?utf-8?B?ZXg2MC90aVA2ME5kc05oYUNpYUczanRXL09iL3FDenF5bEpzZmZaVm1oUWM4?=
 =?utf-8?B?SEp0N3V1NXlaajJYa0pJZXZKZGlMRm9HZFVBQXFEVDlEeWFsa2NMcmRQS09O?=
 =?utf-8?B?bzMybDQ1TU9jWlErOENtL1p4eGRBWXNoMGtqNmxyaGlOSld3QmpkY1JiMHdP?=
 =?utf-8?B?eHo0bjh4OHJsL1gvcC9rZmdoOWREU1dIdTUrMTlSZi9DYUJlRXUyeFpRdkRX?=
 =?utf-8?B?UUxSYlRDVm5JaGJtZ0ttbkJ3cUNkbm1FdUM0RW9BdDVjNmE3Mk9MQ01ieEZI?=
 =?utf-8?B?QU5HUUpTOUFmU3R1U2V5N2p0RC9zVUpJK2RadDdJY2l3N1VYRTQwRUlpZjd5?=
 =?utf-8?B?anB1UVRjblJzdGoxOVNKMjJ1MFVqZjkvbXV3VkR0U2JyTEJ2cHVSSUZNaWZ5?=
 =?utf-8?B?WVVxUFJXbUZ6VFJYZlZMaVJFUmZWdXlGeGNzbVF0dmEzM1RaYis5eTRZdHkw?=
 =?utf-8?B?NHMvLzIvdUJGUmo5Y0NZR2xGa2xKMGhjVSszaW1Od2lTS3ZTKzU5ZWpkY2lZ?=
 =?utf-8?B?bDgxbS9Fa0hKRWoxdFBsRWhJTzcxRGoxUXZkYzI2SXlaTTZlaXNVM2xTa0dF?=
 =?utf-8?B?VnhNNDh5QXpyMWUzRmcyVTBzNWE2NnAyMU5Kb29FMUlPVUtCcXVzUUFlSkUx?=
 =?utf-8?B?UXl1VFZzQWQwVzFzLzhCYXdFYXBBOFRKcU9HOWorMFhxanRtWnJMWVdJUEg0?=
 =?utf-8?B?TE9FeFlTcmZGNysrM2hHNWpZYVFCcGl5ZHdSK2RwMlZuemU1VUlSeHFGNlpi?=
 =?utf-8?B?b3ZDc1VWaWFsajJEUy85dWsrTGNqVmtCcjJycEh2S0NwVTVnUnM0RVljbWVO?=
 =?utf-8?B?TmpwVzFZNFNDV3pvUnJhUUhnd3c1R3JVaFZCMm4wK0t6RDBOd3MxRUgxbkZV?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0526e07f-7da6-4250-dddc-08db2e7e0214
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 04:44:54.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRYz76Lv5bp8Ke3RkaN6vk/SDTOPURY7DEFE9wyvDGnHQArcax0JnDe4MLPDEb8RLCQhXGXl/ZChXVNp7sVG1zd8KoFsN6gMy+/f8aSPq2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe: fully turn on small-bar
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/23/23 1:59 PM, Matthew Auld wrote:
> This allows vram_size > io_size, instead of just clamping the vram size
> to the BAR size, now that the driver supports it.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5cacaa05759a..f6becf32ca49 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -216,7 +216,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>   	xe->mem.vram.io_size = min(usable_size,
>   				   pci_resource_len(pdev, GEN12_LMEM_BAR));
> -	xe->mem.vram.size = xe->mem.vram.io_size;
> +	xe->mem.vram.size = vram_size;
>   
>   	if (!xe->mem.vram.size)
>   		return -EIO;
