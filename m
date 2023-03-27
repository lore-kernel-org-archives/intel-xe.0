Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A72C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 22:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FE810E77E;
	Mon, 27 Mar 2023 22:26:35 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCE810E77E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679955994; x=1711491994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aKY52D1T8wjiEModyT8qvDi9+g0oz22gx5LzH5qlvfo=;
 b=RfP8mbCmM4gEtQCTq2V7mypt2DeRxMb/NswxRovXUETZr0McDDqDCa/K
 C9+B6r/BDQYAKWyuGV05O9rxGQ6ztuwY/VUeCXqAA6dbHLLvuClMpZXag
 TbN5ujfiybEWXijCjAZM80DbXrYhd5szzI1iAy3AxUcNAdO2Wo0ItJcon
 P8WqrqLSiNS8xVT5FMQTXXkSYJbScWpYozoNiqM7HDGkrSsLwk+G+zH9v
 iClHjRk5S6uQSW4eypv9SJl2pa9UUWfoLHaXp/4Kn4GzjZAisJy289aC6
 2mKeTnK9kUJLpSpNMGMpWWnK21VGdd2Od7ERuhnclNto3LClWy1rnyKLj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328850808"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="328850808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 15:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="827214128"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="827214128"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2023 15:26:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 15:26:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 15:26:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 15:26:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 15:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyhkujgokFcZcAvX8FlzrK/4ZQUT9VAdSHr6lJt/RE+nE3YKo7IfDoHH4wkNM0CGLV0V31I6sSBxlWstycuLje36CenI3Xl+8+YgQBeJb9Gnmb3zmyg3wn24qAvdD/YAcwLDi+thKqYGqGrzPv8jLlYc3a5lANRYLh0m4ZMnEm5e9RbZaIzv03XQMPTYDIvuge3U6xdws5DNApYrTnxP1bdFT9+qJfiCv/3BNlEUIN/rIcDJnmMfYLzsyLxw0TRAR+6KRAanAkCfQDjqm7WoeBUL+cXfOBU7wT2GvWiTxP9suKJ60BQr3X1sWABVcX8HvEZZUSg+6KE834GHqX2pcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD0Yu2B8o7/KyGJymYl5zvPLVjDOxu4gtdcl0ck5Vnk=;
 b=erq88qtwKS048Y82R+atiNosCHYXTQQJcTigJjwenoGyzprZXLoKCF7rZX/ou7L3wQMdF+J5Y/etXqD+WF1mVb3X2iAr3HV/bjY2wDNIrvs4lkHBLdRVcEdARLbeNCDmbKZoDTc6Rs7HK+U8FChNpd3iamciYy4nnVi/bFaHSzJ7y5GLO1muA/OUHWJerdbmJ0tdnMjjWf64YvlcUteExOCC9CCvmAulFqolH1319l4r3JFuyC33xZD4KO0+/QkJKhXSjJ65erUfmuI8WvRtDFNJC9R4JBqb34YQOLqPWAskrSW3HxLnbSPj2S+wc70EzVOasWS0moTuaEXa/+QAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 22:26:17 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%3]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 22:26:17 +0000
Message-ID: <d6ea3293-911d-058a-b376-504c22ec9e67@intel.com>
Date: Tue, 28 Mar 2023 01:24:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230327124807.54459-1-matthew.auld@intel.com>
 <20230327124807.54459-3-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230327124807.54459-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: f80f8c83-a1bb-4689-68ac-08db2f1247db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utbxeTPEL7YnZU1zgMzFHbpdf22vmiRWo1VNWykT7nQmEE4tTj7wUYkzb8EYtDYGFpa5AWS2Bqi6S0EpD6XF8Al2YfGhIy3Raz15N3o+64uTNR2s+txaDfqOiczmJtiIOL1xGWRLOEiJB2SjktQUL4kmgwiD0XvLehpza56AGJdfkBVTv3BXHXe2ydurCZSsiX2OOYq0l1W2oQuKulbpVf0GQvtdpavFB7Ihs+UV5cAVNY5BZz7V4gEo+c+fqy3OM8dMMhklUq3H/2hNQbgyEO7n1cOIw6LmbWJpvZwR8Pxsmjm8t3WALbWg+H0XxAyQduNJoBf5dj5mh+whBCZGFIhLqKWbm7E2rJ1ADAX2L1WAWEzMYnx48agP7HF3bY5PjjWDxKn73ZaUFEZYEL/UaODWOqQD++vh5sRbW+CyeZBrTZTjMp2WM1NbwdAKExn0NK5FfckxAnxkz9JTXmHrgYNSiSdN7sO0OL17z4mCh0ePOEn/nYMy2VN0QV0lqEBsu2PCzHy8Ncn0agCmOgmu+pM0wYHBSODd+9qpRJRvMXuhbTlGGHBeJ6G9CbooadfdFZidWYhQtoDDJuLPsC+Wz/WeFOCkOTzLwQ3nDJ3q7vxcYH/je9EyMpuRavfdxIFhuw6mJFwdMKMdDrRo2hGFeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(38100700002)(36756003)(66946007)(31696002)(86362001)(66476007)(66556008)(8676002)(316002)(186003)(8936002)(5660300002)(2616005)(41300700001)(6666004)(53546011)(478600001)(6486002)(6512007)(31686004)(54906003)(6506007)(26005)(4326008)(82960400001)(66574015)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVcyUE5QalZXL2lMQXZWbEJhWSsrK1UxVm5YQkN2UVBYd2dadTduVlpQUDBE?=
 =?utf-8?B?Wnc2VmZrZVVjYktwazRmbDFMSlo4eGhTczdOdTZVSTlVcUsyZm9DSDgvZWYz?=
 =?utf-8?B?Vy9YTzRDQ0dMV2J2YW5tZVoyWjQ1Wk1uRTR6T1FKdXlDWjBONy9GWWg5S1Z2?=
 =?utf-8?B?eXM0K1F3QVBiM01VTWJQMWZNeWhwN1ptbzA0RDhsR00xOUdTOXRXWHdPbysy?=
 =?utf-8?B?N3E5RzZVSlRYOU92RC9vMUxPblovVGFveTAyVDJLOVE1aDVuU0hFR0ZsUEpz?=
 =?utf-8?B?RzEwMlFBaGVtNW1MbXZnbW02a1FrNm9UTG1ITDVvZ2EvUTR2bHdvcU1IZi9o?=
 =?utf-8?B?bXAwUjZNMGR6TkFETmtLQ1pUTXFIejN4ZG5Vcy9kQ2kxV0dzQXBobkN4cVgv?=
 =?utf-8?B?bTdZRnV0Umx6N2tWL29ZbjlNRVBvNzU1RzhMN05DN3VyN3d5SU1NbHZ6Z3Qv?=
 =?utf-8?B?T1JKUVc5L2YySTFZZGxDWU90TkJ6eGRHQ3V6YTJPNzRMcmlzdDRUTk84UzRH?=
 =?utf-8?B?aWkyeEo4dHpudXlZdXFmTlgwUWxUWkI3NUIyTW5tNWFMVC9ONWF4T2ZacFNt?=
 =?utf-8?B?MldvV1JKcGNWVTBZNEhuYXFmamloNmdINzN5dWZFZEN6Mk0xOEpvMGJwK2ZT?=
 =?utf-8?B?cVlQdUIwT08yc2hXNjVkZXFHZ2Q0ZkUyWmxsZFhTZlpkUTBhMW5mdzZJdC8v?=
 =?utf-8?B?VUtNN2RIVGxJbzUyajhzdXV1UEtyNHl4UC9Fc1VYdkRTVGJ5UUg3THBtR09m?=
 =?utf-8?B?eENTMEV0RkNraXU0TUwxSnk5K3BPYkJHRGVMUU56K2l2N2ZCNTcrYWVweThR?=
 =?utf-8?B?Ni8xQnQxdE95NTNEZmtNS25DVU9EbFg3d0tsUzJtZk04RW9QUUt1QlVabC9s?=
 =?utf-8?B?SysyOFNXWDh4QS80aEFqcytEbGdDRWNSMzI4TXY3ZkIxNWVEVDN5RG9JNUZU?=
 =?utf-8?B?MjFBWERLNng0Q3kwdGNaZGdiT1BZdTFTY3JkS1BqMWQycmJOd25QbFVJWnpB?=
 =?utf-8?B?dnJubEllMHhlcjhWakx4T2JxVjVreXJmWnZYZlY2c2I1T2RHYTB2bkJ1N0Mw?=
 =?utf-8?B?UWpyMjRwUEFzKzVPSGsrbGJvK0wzUnUxWkZFZTBJcUxzOWxVbHF5NkE4b0Jo?=
 =?utf-8?B?R3J3WmZmWFVVNWVJY0Fpc1FpcWVqTXdWWG5kUzloUExBQVQvSER0U2ZkNHo0?=
 =?utf-8?B?SG1OckNMNkQxSzQ2QlhNeVJZYXpEVlA2SDR6SEF4YnJoOU94RTVUZVhMdWYv?=
 =?utf-8?B?RENCbGJLNnRxMkUvNDkvZFpCemJyV1JScHNNQU5mWGZwV1A0cS9kTENZd2lp?=
 =?utf-8?B?VEtVKzNJQ082MkNhdVRGNUpnNHdZa21LcS9JWXZwMTlmaUxGTzFZY3hGbHFx?=
 =?utf-8?B?OHZ3bm56KzE4dFY0Tlc1MTV1T2VoYVoxWklBYjNHSk9sdURRRmRSK096RmFr?=
 =?utf-8?B?VXY2YjVhaS9JVHYzdlZFdzhLYkJrVjZCbSs5MEZSV1pSWGlYcjZwdkM5cEdE?=
 =?utf-8?B?eVZLbHhnZjdSSnQza0hnNmVyUVZjeHYxOE5rM0xDbDFZY0J6anhPaTJSMWJS?=
 =?utf-8?B?SU9Kbk9TNXZmS3FpQWQrdFNYWUpBV0NqWHhBSDJQSFZ6T0VCYWxvTmJmRUFG?=
 =?utf-8?B?a3d0dXl5RXpWRnNmVm1KSXVLRWsyRUY1eFp6d0dYamU4WHhQL3R1WTlSL0dw?=
 =?utf-8?B?TmZ3L0N0R1ZsME5EeUU3OUJ5a2d2V25zOGh6LzFhbVhPaGlVWkJ5NU9Nb1lU?=
 =?utf-8?B?TVYxMW5sSVVsZkNFUGxGZWt0RGRBQkxFMkJuYkVHSnQ1VDEyM3FqczJvZk8z?=
 =?utf-8?B?VERVbUZjNXYzVDc0Nm1kRG9vYnlPa3h2ekNlQmdZb2psVWkxVEtWYjRuMHZk?=
 =?utf-8?B?SEdSZlV4OFcwVmdsT2M3dVpFVFkxS0xUWWJ6RXY1TGtjbWpsWWNlaHJrZGov?=
 =?utf-8?B?dkpWb3UxTjdNTko2a242S2gxTGYxaG1CYVE5Q2hJUjBMcnRIVTdPbFFzK1Bw?=
 =?utf-8?B?dzlxenZVdldHS1pqeHo4OU5iMTVxU204dC9QbDRvdVVCSUM2UTNLeU9lUXVV?=
 =?utf-8?B?QTVYQVFOSmZYVEdxRHJrRFNFcDBvYUU5MFg4YklvamVjL0dxT0pLZ1J6N2dl?=
 =?utf-8?B?QnNvV2dZendhMFh3Mkw3RCtUQkFNelI5T2ZPZHl6UFJ6QkFQWUZnRDZlUUZN?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f80f8c83-a1bb-4689-68ac-08db2f1247db
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 22:26:16.8753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApU4d7vHdRVeXrYNC7wSVnkEQNMQNgH2d0udTq3rDgjO/PlS/TxUGvinFP1wUst1Ym/+e+p50fCHwQjNiTbGnnygrLU8YwWv6Sbb8UcxUIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/5] drm/xe/uapi: add some kernel-doc for
 region query
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/27/23 3:48 PM, Matthew Auld wrote:
> Since we need to extend this, we should also take the time to add some
> basic kernel-doc here for the existing bits. Note that this is all still
> subject to change when upstreaming.
> 
> Also convert XE_MEM_REGION_CLASS_* into an enum, so we can more easily
> create links to it from other parts of the uapi.
> 
> Suggested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 74 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..8cb3324221f2 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -154,21 +154,84 @@ struct drm_xe_engine_class_instance {
>   	__u16 gt_id;
>   };
>   
> -#define XE_MEM_REGION_CLASS_SYSMEM	0
> -#define XE_MEM_REGION_CLASS_VRAM	1
>   
> +/**
> + * enum drm_xe_memory_class - Supported memory classes.
> + */
> +enum drm_xe_memory_class {
> +	/** @XE_MEM_REGION_CLASS_SYSMEM: Represents system memory. */
> +	XE_MEM_REGION_CLASS_SYSMEM = 0,
> +	/**
> +	 * @XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
> +	 * represents the memory that is local to the device, which we
> +	 * call VRAM. Not valid on integrated platforms.
> +	 */
> +	XE_MEM_REGION_CLASS_VRAM
> +};
> +
> +/**
> + * struct drm_xe_query_mem_usage - The region info query enumerates all regions
> + * known to the driver by filling in an array of struct drm_xe_query_mem_region
> + * structures.
> + */
>   struct drm_xe_query_mem_usage {
> +	/**
> +	 * @num_regions: Number of supported memory regions for this device.
> +	 *
> +	 * The @regions will contain @num_regions entries.
> +	 */
>   	__u32 num_regions;
> +	/** @pad: MBZ */
>   	__u32 pad;
> -
> +	/**
> +	 * struct drm_xe_query_mem_region - Describes some region as known to
> +	 * the driver.
> +	 */
>   	struct drm_xe_query_mem_region {
> +		/**
> +		 * @mem_class: The memory class describing this region.
> +		 *
> +		 * See enum drm_xe_memory_class for supported values.
> +		 */
>   		__u16 mem_class;
> -		__u16 instance;	/* unique ID even among different classes */
> +		/**
> +		 * @instance: The instance for this region.
> +		 *
> +		 * The @mem_class and @instance taken together will always give
> +		 * a unique pair.
> +		 */
> +		__u16 instance;
> +		/** @pad: MBZ */
>   		__u32 pad;
> +		/**
> +		 * @min_page_size: Min page-size in bytes for this region.
> +		 *
> +		 * When the kernel allocates memory for this region, the
> +		 * underlying pages will be at least @min_page_size in size.
> +		 *
> +		 * Important note: When userspace allocates a GTT address which
> +		 * can point to memory allocated from this region, it must also
> +		 * respect this minimum alignment. This is enforced by the
> +		 * kernel.
> +		 */
>   		__u32 min_page_size;
> +		/**
> +		 * @max_page_size: Max page-size in bytes for this region.
> +		 */
>   		__u32 max_page_size;
> +		/**
> +		 * @total_size: The usable size in bytes for this region.
> +		 */
>   		__u64 total_size;
> +		/**
> +		 * @used: Estimate of the memory used in bytes for this region.
> +		 *
> +		 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> +		 * accounting.  Without this the value here will always equal
> +		 * the @total_size.
> +		 */
>   		__u64 used;
> +		/** @reserved: MBZ */
>   		__u64 reserved[8];
>   	} regions[];
>   };
> @@ -760,6 +823,9 @@ struct drm_xe_vm_madvise {
>   	 * Setting the preferred location will trigger a migrate of the VMA
>   	 * backing store to new location if the backing store is already
>   	 * allocated.
> +	 *
> +	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
> +	 * drm_xe_memory_class.
>   	 */
>   #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
>   #define DRM_XE_VM_MADVISE_PREFERRED_GT		1
