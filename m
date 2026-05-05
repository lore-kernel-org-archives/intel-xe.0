Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAAEFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 13:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190910E208;
	Tue,  5 May 2026 13:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVgOh8PU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7310E208
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777986778; x=1809522778;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j7N75I4AZxXUp+T/J3Nhz3z8h3bHmTNk5K++2XztpAU=;
 b=BVgOh8PUUrjljtl+2nF3bzXPVUpa1v53J6L4tsvmG8bTKrOkq8Rs32hN
 26j+Zk5unRmSvzjYUGQegZDrgCgoJuoRnz5fi6AaCjRHYyFXoqxEckipv
 8SUp+1YQcJctsQfRnG/TKH8VFk/X8ZRqVps2AjzPApJCTd4sIIZeluk2R
 dNeQPcQrIC56qyKCpVtgtjBMa8z4HsIyBRJSHZCFfPn6VSh+3sdixvvNj
 21HQb+T2G4rIWCpRVvexMDmQiFjmPBoNhJGlSZwlVBHRzkrYEjZ27DaT1
 mrjGVJkal/oe88zJedL2Dm3DIrfadfjBki5CDgiwgz202GHhCPoAtmxly w==;
X-CSE-ConnectionGUID: giXT1oh2TM+FAGGcTt3ebw==
X-CSE-MsgGUID: 75yTWrw7Q4uClvGwNwg/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="77878145"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="77878145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:12:58 -0700
X-CSE-ConnectionGUID: OTBXEq8HSBSamn/2i0cBGA==
X-CSE-MsgGUID: y2yYjSVrQXOVvpLT9dvY1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="237585803"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:12:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:12:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 06:12:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIc6j8qb3l7hC2hhp9HjzVWFWJb/sM7K58TLucVFUTUfve2Mdf68bc3ckz3jjU8dr6xmSi1TTd3L3HntICWLz2RQTPbRCs8p0o8D6NNFCrCkUm7IP2OAlC4/sfDUwo3Ka8lMBHANMTpvyLxiHWHhWJjFzRrSbtDZyVOWlLcOodu127zFaK4CHNNUUE5ZVmpA8gdxWmW9kKX+HJoBG9I5WrAceEfoRcKOr34aXQQmaFpeY9NakFEhnMxYAAeCEH65tYra5N3YufW+ApXMwFOzLo6aDBQ4uapp6i9O+55724TZUd8IP7REzO5KqjVN9WmjsyJM4ThDafr1WHVQJTLChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXOa1WCw/oNlOQW2K8bNksPY5yW7aTP7qi//tGL7AeU=;
 b=NCEuPH09B1D9voCKrUzbeY1MvMCSqwdSIFUPmVC5iTOCCHPH0khc6z59k0MXtKDxnAtNooHD4WZ8avM36MiF9gTn89FbEJsogyp76lZFfXIIxMp9qGW75PggVqcf5iPhzFjrUML2NlOGyI/et9xJXiWP03D3mJDMrPVegCLL4E6W6TK+Dh6EKWm44aQraV9i0VTzT/wnJuukaqbnqoa32diOfKvSdKcbbzbq7c6mrVE7xHWXLnRXhLHmhVhimMZItI8tbsfSy1xKSWZvB/sDgoobtA1oiwJ149kTsMlkpyhJ3XRVRiBnaEmeXF53OYi0hMMALu8j+7mtLc7UKUkPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:12:55 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:12:54 +0000
Message-ID: <a86cc7d6-179d-4a53-b380-edd41d88c082@intel.com>
Date: Tue, 5 May 2026 16:12:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/xe/memirq: Dump additional source pages if MSI-X
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-13-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260428142722.582-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b84b54-c231-4505-cbf7-08deaaa804d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ejSw38bugYKVf2HXvDCbXINGMw4QElMDUXh0arSkjxEg4YKQR3RkfJPnNg/rcaVzJzhltn/b7bRDa0YZsDI1pCZHwsxWg/lMMn1+d02gnneSQAEYR6aTMqwAQlv4nI9Em0I8ySBe2qsJn5qvY8lTCXoKGS2ldDgikS52z2weMv7uyaiG2KGsQ3qtohhGTG6WS2Zv+q5yd3zMDXrX+M7DkgvuytiSlEh06ksnF80AjBJyvyAD+tiU5Z5XgYmoqdXOqlUKXa4vDZ/GIi3Zur56aRCbMkZbOz1c8D3hn2gljwImmn2bPX3aXWy3+XTGsJrk7lRjljlPDK6H4BDaTPu+L/Q1rUTcAVjqOy4Rl/R4v958f+dU1AaFhhPQ1oSqsbSra8+OvUlLFDpMspr4GdwzljSU0rvk0AYJBFm/3qeyK4YxFPM5L7hybao6QRvYE3MRjSESLsbltvCcqf7v5G2E1lXaCxlOsuZNwTXrslRP8VrHfOa/MBFQwJdn/f756VG5k6hVGAUiopZJfo3GHOuqA390QtgYkm5bRyEg4A2pm6one5wL0OJ5dkQ8C4CSuWrzYtAQv4mPjbE4kbpydIO7J9q4E4L1UlzrH9meeukkbgbvb+HQAOTgAoZEwCY8kSl4Yg8aPdcfjdSLQSmlx8udSkQoDcyUklXhgSu7ZMkLCKnBqCHUwJka3DTwGf+tc/T/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHIvYlFVbzdINDFPR2kwWm1tekxPTFFyM0FMYldBbURMdzdFZnFVOHc5dnI5?=
 =?utf-8?B?SzRhWWtJTkcrV2FFTkhqeHN6VDB4bFp0dm51U2VOMGFodytMMGxzaTR6K29N?=
 =?utf-8?B?aUxDcmdldWxJQWNTbXlYZG5IOGhWdExydU41TGVKZStGS2JJUTNJZEpYNk5i?=
 =?utf-8?B?aURsYlJZOXRJY25KNkJqdUpaYmhuRW1yUmNRa0E1WFdMWGowRG03S3VLUTRJ?=
 =?utf-8?B?Wm1HNDdpczNaaWEvcXR6RkE0eEpSMGNqTFA2VGhkL3NYU3dhS1BYNkZydzFn?=
 =?utf-8?B?RnZqYS9Cd0g5dmVVdWRWM2xOb3NwcWV2ck03TmJiYURjcEJkUHNYSk5qTzdq?=
 =?utf-8?B?WXBnOHVqN1JCQmlvYnRFSEFaektxZlZEZ1RRZFM2WFN3a0hCaXltRjVpaTcw?=
 =?utf-8?B?MU9wcldhOHNBMmJUNDdiM0FJMzlrYVdSanRkS3N1a0xnckJkRVZyKzZSREZY?=
 =?utf-8?B?cGYwREdKT0JvMzZpekNhOE5sdWJWZm1KZno3NXIvcC9EQmhOQStzWUFYTHh3?=
 =?utf-8?B?RkVtY0pyamhId3RuRWFBOGFGNWRkVlBuQ1RzLzJGM1ZRNzcvYjhwcVA1YnBC?=
 =?utf-8?B?TjZzM2pJdFRGbTdZZThPNWd1M3BiMWlycVVxdU1MVkJnME1JNmU4Z3FGZGtR?=
 =?utf-8?B?RG8wZ29RR2pGMlpqNlNzVTRZV05iUEZyYmg5dmlrcXRwNEN5UmdxYkFvUk5s?=
 =?utf-8?B?TzlGSUF4R3NqTTJ1U1VJcXN0ei9SZDlpY0lURlpzVEZyQWNjYXhOUWlnNWJu?=
 =?utf-8?B?SmNUcTlsMllmSnNIL0lyOHJhSXVRMVFoTzgzalRLNXMraFBvSzBkeUF1REh0?=
 =?utf-8?B?VzdZWTBCdFN1N3M0WEFyUW5tQWpFUXpJQm1yUEVXMEs3VThZd2ZMNmFrclAw?=
 =?utf-8?B?RHlUaHhydG9yVzhJM3hMNVhTR2pVeDRiT01KZE9heWVrc0JxUlErY0RFY2dl?=
 =?utf-8?B?aU12TVIrRnVaMFJmYXBrYjFTanB4TTgyVWpDVTA4R2NEdzNNUjRsQlFrSnAr?=
 =?utf-8?B?a2pHcFpaRDRiQ0hmUk1obUJ5SVN4TTNIOXdGWXBueUtuNkZ5NkZDZzdjeG5W?=
 =?utf-8?B?dStqWnVTMWpFSmpCYURwVlZXN0dtcjhHUUtNZXV2ajduU3gyUGJVbXpraDU0?=
 =?utf-8?B?VUduTmI1cU5YK2J3LzlRYWpaaElRQTR4NFBGUWV1dzJVRVZFQWpneEJDTlM5?=
 =?utf-8?B?WjQxb3Qxd3IrdmRqMlRLMUtIK3lhaGFhYzhqRVFYZWNxVHllQTFzOHZGOFJV?=
 =?utf-8?B?am5SSkZRK3NQMlJGM052bkZYTnFiNk0wTGpQRThmaWJneis2M3hoekRDZm4y?=
 =?utf-8?B?RHMvaTdDRjlWQXArYyszVTVHc2hZRTl1YXJ1UzhzT1EyUXNNUnkzb3hEQnhE?=
 =?utf-8?B?enkzL2JFR3VIeGJtZE9aZlgzZUhLRndIcm90aHNReEVBVjdWbUJvcENJVW9U?=
 =?utf-8?B?L2RENStFaXRDVHV1ekNxdExFeEdHbys1a1BWaVRtZVJUUUZPRDhyKys1dEhL?=
 =?utf-8?B?bFIyVy95RjN4VGQzeDBYc3VGOEJ2b3k2SGoyT2hQSC91N3JtS0JlMmxXamxT?=
 =?utf-8?B?dlUrdUhDL3p0Z0thaWwyVDJRRW4xT0NZVjVPbFAyeFA2aVR1a0ozbHRaemJK?=
 =?utf-8?B?cUdjVjJrL0dhd3FBQjNzT3J1eklPS2NGVktHYzFTYXBORmRzTzVnWkQ1Qk5h?=
 =?utf-8?B?S05taXRCcU90eUZVNjl0ZGdyRXpVSGxlN0N4SFVXeUxwVTRFOFY0b0pncEhF?=
 =?utf-8?B?ZUwrd05NN3NVL0MvVGh4TmV0NlgraWZ1ZFRtdk1jRzZOcnZQOWJPS3h2aHdp?=
 =?utf-8?B?MTRZSVVTNTg0T2lsSExURTNib25rZStBUjYvTDVYSXc1aWo3UmNCc05VZnFL?=
 =?utf-8?B?SEtObWwvK1cxak1VczJZL0FCZHBmK09KUS9YMitTM0ViVWtqK29vZUdOUGFC?=
 =?utf-8?B?cUxjU09NVHpZWS9NVWZwUHNSbkVtTnlndjB6dnJ3b0xQTTY2NEh4dFEzdWFR?=
 =?utf-8?B?RENNOUVTYmFrV1JIbTFqZmtZalo2WEZuMEZWclRrSFNOZEdkcXduMzZ6RlVH?=
 =?utf-8?B?TmpDVkhwMHlGV1U2dDZyVGxsbmlBdnVWZEtWNlhOSElkL2phNkxNUHFOWEs1?=
 =?utf-8?B?VlRXVU9pOHVUYVpubmZXNEYyT3B3ZWIzeE9VdnpVcjVobHJIdHRXRWp6Y1pN?=
 =?utf-8?B?blc1L1RPbWJabkduUXVacGRlMlpmZVZ0QWdpU2w1eWgvTDhDcHp4VGZ4MmtE?=
 =?utf-8?B?LzRCRFIyd2FPaEpadzlxanZLVkN0d1dPaWx1ZU9ZaUR4cGRiaFVsZGFjbERF?=
 =?utf-8?B?TGp6MWs5dXp2M1hRa3QrZFBYN2xSS0N3VGkyclNvdWRPZkZtNm8xUT09?=
X-Exchange-RoutingPolicyChecked: Gw0hcdJUx8vkyo2oBK5nrF7pKN/efYiSBRa492GgKOQ0GVvYAY3fQZzswXO4Ldfvdae9U7E0KyLFmDVIBn4kQdKojrCHXrV8ukL0CHqvt/S+ESAC80WtVuo1PPWM6YGmgCuw3y3M4/+P3LCXsuycy5mJabwzYy0f9zd7rDQuxToepebeyTrlwg3MgV84E3RohrTCJcU6oXJZhoZiNQDOTw5r+XlJz3D6i81ZKZ3MNudXB1/ixDXYBLXdU0OGmLsytWAibsSCuVtzqOa52bKRFoMYERVMuI06gqb3I06NBNhccPCm8/CUt+cZiE1vmKJ8UUraPNb8p1XkN+8X9ckcGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b84b54-c231-4505-cbf7-08deaaa804d5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:12:54.8903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv0PVUEmV4MkprgdTcgA7aLaT8jLUYlxjm8uChZUmpdhCh4vmHm84Z2zveecX60lDoNWXc6dO/cRsFVGY8A8aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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

On 4/28/2026 5:27 PM, Michal Wajdeczko wrote:
> In MSI-X setup engines report their source/status as instance 0
> and we should dump additional source pages, not just the first one.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c       | 35 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_memirq_types.h |  2 ++
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 30266b258087..b6fdefaf9463 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -169,6 +169,21 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
>  	return xe_device_has_msix(memirq_to_xe(memirq));
>  }
>  
> +static unsigned int max_instance(struct xe_tile *tile)
> +{
> +	enum xe_engine_class ec;
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	u32 emask = 0;
> +
> +	for_each_gt_on_tile(gt, tile, id) {
> +		for (ec = XE_ENGINE_CLASS_RENDER; ec < XE_ENGINE_CLASS_MAX; ec++)
> +			emask |= xe_hw_engine_mask_per_class(gt, ec);
> +	}
> +
> +	return fls(emask);


Wouldn't it be more readable to do something like:

    for_each_gt_on_tile(gt, tile, gtid)
        for_each_hw_engine(hwe, gt, id)
            max_inst = max(max_inst, hwe->instance);
    return max_inst + 1;

- Ilia

> +}
> +
>  static int memirq_alloc_pages(struct xe_memirq *memirq)
>  {
>  	struct xe_device *xe = memirq_to_xe(memirq);
> @@ -210,6 +225,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
>  		     XE_MEMIRQ_STATUS_OFFSET(0));
>  
> +	memirq->num_pages = hw_reports_to_instance_zero(memirq) ? max_instance(tile) : 1;


Don't you want to use max_instance in the calculation of BO size instead of XE_HW_ENGINE_MAX_INSTANCE?
- Ilia


> +	memirq_debug(memirq, "page instances: %u\n", memirq->num_pages);
> +
>  	return 0;
>  
>  out:
> @@ -525,6 +543,18 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
>  				       guc_name(guc));
>  }
>  
> +static void memirq_dump_source_pages(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, !memirq->source.is_iomem);
> +
> +	for (int n = 0; n < memirq->num_pages; n++) {
> +		memirq_debug(memirq, "SOURCE %*ph\n", 32,
> +			     memirq->bo->vmap.vaddr + memirq_source_page_offset(memirq, n));
> +		memirq_debug(memirq, "SOURCE %*ph\n", 32,
> +			     memirq->bo->vmap.vaddr + memirq_source_page_offset(memirq, n) + 32);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -544,9 +574,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  	if (!memirq->bo)
>  		return;
>  
> -	memirq_assert(memirq, !memirq->source.is_iomem);
> -	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
> -	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ))
> +		memirq_dump_source_pages(memirq);
>  
>  	for_each_gt(gt, xe, gtid) {
>  		if (gt->tile != tile)
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 02ac938cadb4..eab384342878 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -14,6 +14,7 @@ struct xe_bo;
>   * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
>   *
>   * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
> + * @num_pages: number of per-instance source/status pages.
>   * @source: iosys pointer to `Interrupt Source Report Page`_.
>   * @status: iosys pointer to `Interrupt Status Report Page`_.
>   * @mask: iosys pointer to Interrupt Enable Mask.
> @@ -21,6 +22,7 @@ struct xe_bo;
>   */
>  struct xe_memirq {
>  	struct xe_bo *bo;
> +	unsigned int num_pages;
>  	struct iosys_map source;
>  	struct iosys_map status;
>  	struct iosys_map mask;


