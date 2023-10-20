Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B576CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEBC10E58D;
	Fri, 20 Oct 2023 07:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE60310E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787004; x=1729323004;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=4bKsfhXKx8Je06KBal1pZVdPf+whaamnD9QXe0aYru0=;
 b=fdKUujIQNmB/EbM4koQ6K6RiEzbvyOzDaBHTEVXks/oIWVsChra82fGV
 h9Ka5Sb0oZqkxqiyxorJbuszwml5hYPx1U51Oko1e3fYNAx64UArkDRsi
 kYVjOhb/wnuV3PtpcXv4mmWO66oHKu+btpFJchNphhyXy1QsP2fI7CrMD
 NIAchKzMmQ0FF3DconCbzoPjXTDaC4Ioj/0ASmhQobACBqHMuwWVcJn1m
 C3ACXLmw7YCt/VQdT1NVQ8atQMJ+MrtidLtBMLJfKftsbVtOE0BRT4n6h
 dzSH7hxpfQ8d4kmcGFQUpoM83JeTeEdfjDo9aTBpXKOg+pEd/fxn6EGrm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389309449"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
 d="scan'208,217";a="389309449"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750829322"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
 d="scan'208,217";a="750829322"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:30:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:30:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:30:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:30:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuzLXKokVc99FIjZKuhbKCph+LzsLSwwECS8bUeVZomaWYphoj626DpwkXy75A9cy8wS2BFabDG0EiyESwKzKIZSF8Gxkoc1cMmWXSQ26u5wC7MII7DSknC1DC52rU1thzna9O/QcVhJG/zzgqDetSNdE8LXIhO9G6NrldYPabPySXHKc9tB6pf/HotwQG6P4TbfILhmjYE7V6dPb3H1BqZ0EMkIbURT7VL2OU4Wls71Ql0YQicXiMAC6uEcEQgDlNfRX2FWUneO9ak9mwdbn641UuuXhFUYzPyJi5aHzQQqozXlejG3fqLPSwl4MtfVdsN0/ijpRtLc6zlBnnOm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meOBxj1G88ch46Mg8yeaMMW/1q7Kf4skXLkQm6QYmco=;
 b=iRtQhzIk/KcyOdxTe4O+Rub3KNZ7faAkv3ZtAYjLM9ZVpoDfscoj06wDxbalh8Hot7kj2Q08MktQ5j64IJU+fLCc/Ts3BOQ/zgytpR/qP08R9buvw6GksC5y4TDmz+d14a4buKObrJ+KmXKNz8qdeKSlMsjOC1UPAvMPyWFrlprXKEUdNxCBVc3C6uEXQSiX9jx812+lweuEb71sJLObOscovoE9p4EmNOF2L28CF0wlhicrM95thVL13DTSiR31a519Mp/bl2K7Nkpxn9Q19JpOmxuLzbnJeQyUFuTAJBVLwVVJvpHlGImRZDtSls7/Ygk4Bnr9bT0FFnfgSElupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SN7PR11MB7437.namprd11.prod.outlook.com (2603:10b6:806:348::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 07:29:59 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:29:59 +0000
Content-Type: multipart/alternative;
 boundary="------------RHlEtYq70f1GDqRAYR0VX1yT"
Message-ID: <d44874a2-6424-484d-b430-bea440ae85c2@intel.com>
Date: Fri, 20 Oct 2023 10:30:15 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-18-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230919161049.2307855-18-ashutosh.dixit@intel.com>
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SN7PR11MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d27078-0df5-4753-4cb4-08dbd13e5dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGGKXT1rB33WTjpMHGjslWpg9XG9afM4gWvEMU6e8iljHal4/Td2zTF6J9SBIaeMEtTDiE1lDhl/ZmHoxoSNqHk0X1M7YabtD19sJmNsfdw14PCkyl5Q97DveQDRFx5JcC4hoGBVPjmtvOawBItPPpTOsPRUUEDkBtqCiTIRBIqgZh8O0+t0r9m378Ny+r2yy+CgK03DylRhO5R0aKmN4Ao0rYw3FqbH+bLjkaQm3taYnC3Cam/0Pp8eqow93JVXFjqmyLu+atJuRJO59KOozWbMsWspvzoW1zcQ2UiTmBwbsN1DW9sRkWp+fyUMmT8PyKeN58he//AjyGV8uutYqI9Xt+ioHhgGybrtKJ5ywW3h0UucElceHluraOLS1PjM/R6UjqCQm1aeA7BywLBA3M6FIb8VCLwG3LyOv1A/kooZFr0yhcaqFq0bmOwb3SxGeRKpIXmamzom4OvwCNc0VaGf8V2ZlEPtoNV5RArJAAqb2ft8x41rft12zNxTb/KDvZwTqJR+V6pE1Oz6UDsy3BlA6ogFkPKwpGE4OWDIcUcwh/GwfwzszbI+cReZ/VBHq9/Ow05uDuJ94hcYHcuKc0RRogPIgvVt/a5/IEKGSOMBpu0Hq2ce5M8iPTwpBQIZTPkPxQFNQLGt7C9T8zFJBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(31686004)(2906002)(86362001)(31696002)(38100700002)(41300700001)(5660300002)(6512007)(83380400001)(82960400001)(6506007)(36756003)(53546011)(33964004)(2616005)(26005)(8676002)(8936002)(478600001)(6666004)(6486002)(66476007)(316002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNBR1R0OWlWMkJYNkhkSFowRmJ1UjUvWGN5MlQ5ZWhhM0t5VE5QcUNtejhR?=
 =?utf-8?B?MDVzd3V5MTFDVzdwYnk3ZUUzenR1Z0tUWXN3bHJuZm9DQzNGL2EwS0c2TXBB?=
 =?utf-8?B?QVdCOFpsZ25lL2g2eTBoWDVlOC95QlpJN1o3RFN0TTNFV1VabGNkekpDb3lJ?=
 =?utf-8?B?WUNoOFVHRVp6bDR6dGxudFFCeVJHaXhhZnByUG9XbkNjYzZzMnBKVjVlcjRs?=
 =?utf-8?B?dHpDc3FjNG1wNlpUTmNwbTNzejg0S0NsMmhrczRNTGRRK0syOVRHamRZcXp6?=
 =?utf-8?B?cGRmaG4vWXdJbTJyS2pSamdRWDBHanZyU1IxWktQUDdGVEdyTTJyODFsWU5w?=
 =?utf-8?B?S3lVNldCRDdEdWxMZG1MSVJ2NHQwRkFtZ3VMNnNtdmdkbFduSWh2Q25HM2Vj?=
 =?utf-8?B?QzdGTThKYzdkR1pBMGdVNmdrQ3JsRDdyK1NtOWp1SXhoOE9xbnNuSzFqYnc4?=
 =?utf-8?B?MWVRQVF5bkIyOFpjYk1IUTFwRS84NnZPRFlQNlgwUkt1NnlYRzdtYWJ2OGVH?=
 =?utf-8?B?OGN3aWwyMmdGMlRZUzZ6WExmODhBN1JibWNvdTlESlRXWForSUhWS25aTUpM?=
 =?utf-8?B?UW5GOTJ5Nm1uZThOK3BhYTNSaWVOczByQ1BwcXBybndjOVFyUGlYd2lkejQ3?=
 =?utf-8?B?N2dkcnBWRXk5TGIzaENDRTVQM2xGQXVLelNSK0hwSTJaWFdQNG9XaHJlc1FT?=
 =?utf-8?B?SmJCU2R4aHJGZzg1S3hLbVEzRVpFTCsxSkxyU0FhVTdXSDNuMFFxdFg5YVZm?=
 =?utf-8?B?bU5jTTBCT0FnZWVwUFlFZTZWZmtHUHBmem8vaEdZOGZGMkRxRFh5VTY2d2Yr?=
 =?utf-8?B?V09mTXJVMWttcXF0b1VPRHJuQlFBWUQ1ejhCS2J5UU5jcE1PUE5sYlh5N0NF?=
 =?utf-8?B?eEJIcmVCZ0lENzlDeEhNU0xXNGY1TzJpY0NJVlkzWkxhOXk0a3ArWXh6czRX?=
 =?utf-8?B?ZmJBWmFCMFdtcG1KVXRtdGdlNHlCUXJCcW5OWUdpanpoTE44N3pmYzhZWWx0?=
 =?utf-8?B?UUQvUVQwRnEyT2NiT0MraFhYM3BJcmRKWnA2MmM3NXVUUXpMZmkwKzNKWDl6?=
 =?utf-8?B?ekpSUFFBMHNOUFpLWDVwbHFZYzVFZk01dU13a2xzd3l2L3NEbmRTdmVkTDlJ?=
 =?utf-8?B?WDVhdnlSS0hvVFEyYUt3YjlPTnNKZFpuZjlYcTZONTMwVis0aGszTmhKVmVM?=
 =?utf-8?B?MGFZdDJuM3hhdWkvWXc4c2o0SnB1aGZRRWw3TTZWa2c5b3ZTY1pyem9PSmhR?=
 =?utf-8?B?QkQ3bG5ZQ2NrOW8rSmZQRks0bDNBZWpBTmpUVnI4ZUtRTmZnT1cwUEFmWUhz?=
 =?utf-8?B?N1Zobk1PeWpCME5mUHFRaVhJZWpDbUtEd3RhTkFrdmtWQ29NLzBELzRpRUVR?=
 =?utf-8?B?UkhvR01NN2tqcGQycC9KK2l1OFdhZHJBQjBhc3JLSDFRS291YjRuTlNTMHdX?=
 =?utf-8?B?NUxib0NIWHhscDNGVkxuelU3SlpSSnZnTUJtRjFLeitLVmJRQ1VMOVpONGZ6?=
 =?utf-8?B?TWNGL0RUUUdMSWFXRi93QTN0QWU2LytQNUd2by9rSHhLTXVBdkxkS1NnRTgx?=
 =?utf-8?B?R3NVVGcwNEJ5ZGZHczAxeVVBc3Rkc2RYa0R4YjZQeHVOcGJ1d3hub3BsblpB?=
 =?utf-8?B?RHFJS0c3aVNWejFPQ0Zxa1lGNTNUQlJraEg5TFloZ0I4ZHJONlRiZG1VWGdp?=
 =?utf-8?B?aUNHZmpDMW82eG5mSmtKM1NYSXdJS2V1aXp3ZkM3cXVIbmZCbFhFUGJTekhE?=
 =?utf-8?B?RGdhL0d5U1IyTjNWNGpMdTBrUXFyWlVZWDltVVMyazUzbTFHbXpadjJpR2lt?=
 =?utf-8?B?cUxndXBRWW9VSE9xaEdrTEpPZ1FGZENoQWVxVnZ3cVMwRDQ3d1lna1YwNmtD?=
 =?utf-8?B?M0hMajlxTlc5dXlRWktTVkJNbVJxUkFjL3grdmIyVDA2QXdQOWwvaG9jNnEz?=
 =?utf-8?B?aWt1M2tLMHBXcVA2NDdySjRsM3ZGdXNqanpjOGY2TlBpdis4eXVRRzRHZHlK?=
 =?utf-8?B?OG04MWtEbGNyVG5zeG9WUjBHYk1ManZ3cFpqc2NpQTBxeDdNU3ZFOXVwZHpy?=
 =?utf-8?B?TkpmbDJtQWdrcWRrN3JWMjZLNittRUwwTjAvVFhMUVVqQ0pZenlZTGc4Ulp2?=
 =?utf-8?B?ZllXcDNpN1BKY0w2MENZc2pLaWxNSGV2VFVGa0ZQWFJac29BT01HMk90MGtr?=
 =?utf-8?Q?ZMKivDLUPYQDReMKS7E2plY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d27078-0df5-4753-4cb4-08dbd13e5dbf
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:29:59.5136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uv+BFovwnVwmLcqEy5ZblZpqk88kdX1nZ3QKtj2FuKm5jq49H54snfh12v0uuswCxiOTR13DdpuMa0Wdgq7aaPKN+hVILY/1T72EtO7icTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7437
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [17/21] drm/xe/oa: Remove filtering reports on
 context id
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

--------------RHlEtYq70f1GDqRAYR0VX1yT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2023 19:10, Ashutosh Dixit wrote:
> At present XE OA code does not obtain context id's from GuC. Even if these
> context id's were available it is not clear if included reports for
> userspace should be filtered on context id's. Till these issues are
> resolved remove filtering reports based on context id's.


If you're removing this, then the opening of the perf stream should 
always be a privileged operation.

I guess this also makes DRM_XE_OA_PROP_EXEC_QUEUE_ID useless?

It should probably be removed from the uapi.

-Lionel


>
> Suggested-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit<ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c       | 33 +++-----------------------------
>   drivers/gpu/drm/xe/xe_oa_types.h |  9 ---------
>   2 files changed, 3 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8648652e05aa5..077698a0c5628 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -184,13 +184,6 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>   		report[1] = 0;
>   }
>   
> -static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
> -{
> -	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
> -
> -	return ctx_id & stream->specific_ctx_id_mask;
> -}
> -
>   static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
>   {
>   	if (oa_report_header_64bit(stream))
> @@ -368,7 +361,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>   
>   	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
>   		u8 *report = oa_buf_base + head;
> -		u32 ctx_id, *report32 = (void *)report;
> +		u32 *report32 = (void *)report;
>   		u64 reason;
>   
>   		/*
> @@ -379,7 +372,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>   		 * this field and it is valid to have a reason field of zero.
>   		 */
>   		reason = oa_report_reason(stream, report);
> -		ctx_id = oa_context_id(stream, report32);
>   
>   		/*
>   		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
> @@ -388,10 +380,8 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>   		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
>   		 * the ID has been squashed by the kernel.
>   		 */
> -		if (oa_report_ctx_invalid(stream, report)) {
> -			ctx_id = INVALID_CTX_ID;
> +		if (oa_report_ctx_invalid(stream, report))
>   			oa_context_id_squash(stream, report32);
> -		}
>   
>   		/*
>   		 * NB: The OA unit does not support clock gating off for a specific
> @@ -419,21 +409,10 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>   		 * since it's not-uncommon for periodic samples to identify a switch
>   		 * before any 'context switch' report.
>   		 */
> -		if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
> -		    stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
> -		    reason & OAREPORT_REASON_CTX_SWITCH) {
> -			/*
> -			 * While filtering for a single context we avoid
> -			 * leaking the IDs of other contexts.
> -			 */
> -			if (stream->exec_q && stream->specific_ctx_id != ctx_id)
> -				oa_context_id_squash(stream, report32);
> -
> +		if (!stream->exec_q || reason & OAREPORT_REASON_CTX_SWITCH) {
>   			ret = xe_oa_append_sample(stream, buf, count, offset, report);
>   			if (ret)
>   				break;
> -
> -			stream->oa_buffer.last_ctx_id = ctx_id;
>   		}
>   
>   		if (is_power_of_2(report_size)) {
> @@ -497,12 +476,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>   	/* Mark that we need updated tail pointers to read from... */
>   	stream->oa_buffer.tail = 0;
>   
> -	/*
> -	 * Reset state used to recognise context switches, affecting which reports we will
> -	 * forward to userspace while filtering for a single context.
> -	 */
> -	stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
> -
>   	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>   
>   	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 3cc1d88fe4a51..7566fef55b0ab 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -222,12 +222,6 @@ struct xe_oa_stream {
>   	 */
>   	struct llist_head oa_config_bos;
>   
> -	/** @specific_ctx_id: id of the context used for filtering reports */
> -	u32 specific_ctx_id;
> -
> -	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
> -	u32 specific_ctx_id_mask;
> -
>   	/**
>   	 * @poll_check_timer: High resolution timer that will periodically
>   	 * check for data in the circular OA buffer for notifying userspace
> @@ -261,9 +255,6 @@ struct xe_oa_stream {
>   		/** @vaddr: mapped vaddr of the OA buffer */
>   		u8 *vaddr;
>   
> -		/** @last_ctx_id: last context id for OA data added */
> -		u32 last_ctx_id;
> -
>   		/**
>   		 * @ptr_lock: Locks reads and writes to all head/tail state
>   		 *


--------------RHlEtYq70f1GDqRAYR0VX1yT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 19/09/2023 19:10, Ashutosh Dixit
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230919161049.2307855-18-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">At present XE OA code does not obtain context id's from GuC. Even if these
context id's were available it is not clear if included reports for
userspace should be filtered on context id's. Till these issues are
resolved remove filtering reports based on context id's.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>If you're removing this, then the opening of the perf stream
      should always be a privileged operation.</p>
    <p>I guess this also makes <span style="white-space: pre-wrap">DRM_XE_OA_PROP_EXEC_QUEUE_ID useless?</span></p>
    <p><span style="white-space: pre-wrap">It should probably be removed from the uapi.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">-Lionel
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230919161049.2307855-18-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

Suggested-by: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
Signed-off-by: Ashutosh Dixit <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_oa.c       | 33 +++-----------------------------
 drivers/gpu/drm/xe/xe_oa_types.h |  9 ---------
 2 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8648652e05aa5..077698a0c5628 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -184,13 +184,6 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
 		report[1] = 0;
 }
 
-static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
-{
-	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
-
-	return ctx_id &amp; stream-&gt;specific_ctx_id_mask;
-}
-
 static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
 {
 	if (oa_report_header_64bit(stream))
@@ -368,7 +361,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	for (; OA_TAKEN(tail, head); head = (head + report_size) &amp; mask) {
 		u8 *report = oa_buf_base + head;
-		u32 ctx_id, *report32 = (void *)report;
+		u32 *report32 = (void *)report;
 		u64 reason;
 
 		/*
@@ -379,7 +372,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * this field and it is valid to have a reason field of zero.
 		 */
 		reason = oa_report_reason(stream, report);
-		ctx_id = oa_context_id(stream, report32);
 
 		/*
 		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
@@ -388,10 +380,8 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
 		 * the ID has been squashed by the kernel.
 		 */
-		if (oa_report_ctx_invalid(stream, report)) {
-			ctx_id = INVALID_CTX_ID;
+		if (oa_report_ctx_invalid(stream, report))
 			oa_context_id_squash(stream, report32);
-		}
 
 		/*
 		 * NB: The OA unit does not support clock gating off for a specific
@@ -419,21 +409,10 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * since it's not-uncommon for periodic samples to identify a switch
 		 * before any 'context switch' report.
 		 */
-		if (!stream-&gt;exec_q || stream-&gt;specific_ctx_id == ctx_id ||
-		    stream-&gt;oa_buffer.last_ctx_id == stream-&gt;specific_ctx_id ||
-		    reason &amp; OAREPORT_REASON_CTX_SWITCH) {
-			/*
-			 * While filtering for a single context we avoid
-			 * leaking the IDs of other contexts.
-			 */
-			if (stream-&gt;exec_q &amp;&amp; stream-&gt;specific_ctx_id != ctx_id)
-				oa_context_id_squash(stream, report32);
-
+		if (!stream-&gt;exec_q || reason &amp; OAREPORT_REASON_CTX_SWITCH) {
 			ret = xe_oa_append_sample(stream, buf, count, offset, report);
 			if (ret)
 				break;
-
-			stream-&gt;oa_buffer.last_ctx_id = ctx_id;
 		}
 
 		if (is_power_of_2(report_size)) {
@@ -497,12 +476,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	/* Mark that we need updated tail pointers to read from... */
 	stream-&gt;oa_buffer.tail = 0;
 
-	/*
-	 * Reset state used to recognise context switches, affecting which reports we will
-	 * forward to userspace while filtering for a single context.
-	 */
-	stream-&gt;oa_buffer.last_ctx_id = INVALID_CTX_ID;
-
 	spin_unlock_irqrestore(&amp;stream-&gt;oa_buffer.ptr_lock, flags);
 
 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 3cc1d88fe4a51..7566fef55b0ab 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -222,12 +222,6 @@ struct xe_oa_stream {
 	 */
 	struct llist_head oa_config_bos;
 
-	/** @specific_ctx_id: id of the context used for filtering reports */
-	u32 specific_ctx_id;
-
-	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
-	u32 specific_ctx_id_mask;
-
 	/**
 	 * @poll_check_timer: High resolution timer that will periodically
 	 * check for data in the circular OA buffer for notifying userspace
@@ -261,9 +255,6 @@ struct xe_oa_stream {
 		/** @vaddr: mapped vaddr of the OA buffer */
 		u8 *vaddr;
 
-		/** @last_ctx_id: last context id for OA data added */
-		u32 last_ctx_id;
-
 		/**
 		 * @ptr_lock: Locks reads and writes to all head/tail state
 		 *
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------RHlEtYq70f1GDqRAYR0VX1yT--
