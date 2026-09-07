Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F95EC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA91D10E43A;
	Mon,  7 Sep 2026 19:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKMpaOL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B210E43A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788808917; x=1820344917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YxqBUj1hgJr5FuQ1HC/wXvtS+TCQhTMsn1GXD6jFYMU=;
 b=CKMpaOL/OXtZDYkwi3+ed/VWRFeEIntE8KRep+fbgV35t+RbJXdaXAL0
 BnpD3uggzWTtTjgqs5r973+05lyEHjPH8N/r9K0Bwwda1sH4wDj5q6kY6
 /vxWpwA8xgOCUU5SWVfl1ICxkXr6U4OVIxboZAAkaENu/irMbnQOka23l
 EbH8w9/VmB5SYTNXZ7gGtSkg1rUrDRAuHXAS+DUbrh2UlVIfYq/NAAZLV
 d8lA8eXT2J8WitVpJaf6yIqST18GsVgx6sVv38hWBAZSTB7Gt2AcJkJl+
 AmaQh+jXV8EOcTuKAF/dFB78CUX/ETWjVCWYZ+H98NfP7Vbke/hE1HBeB Q==;
X-CSE-ConnectionGUID: XwRUjDHSSPS+J4zbDP6OCA==
X-CSE-MsgGUID: rAC7Np8oR8qR9OLezA9syg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99545983"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99545983"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:21:57 -0700
X-CSE-ConnectionGUID: RgNAsocTRvqQnfgYQOD1KQ==
X-CSE-MsgGUID: EzlyUI8+Ta2ra2cyMiUz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294256803"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:21:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:21:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:21:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekSMCb89NlHH/V9FN5PPefzdVw6AaybjCd32+lu40Nmgtkc5kWxlTrsXQWDfB1zHzcscl7I3f08grh7JeepkutIS10rXJJgy+S3h0phWnTJbHOte+//qeMKVBU6q3cwrqHwoSFB68FnEN7+f8zIPNMWmdZT8Z9SZQh469OENdzIfEE6Z2qzssvap5qdtXG7YjdocHmPptsWJmCUzLfZxgLnjN4VwSK3rvgPd4T82N5YkdZjq/1JgSnkqPdjiW9Oh1o6FTljtB7KQvoQ03mkL+6MxOcugALyYZZ/OGTO+YUbWo7Q4cd1dNS0fyLBgned/KSBNOU+lyubhyB004vnT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmUZUZhl4WAvwKjFGsrQwM62SOJP4mCnoCovpGIPrgY=;
 b=cifHRdVy/5gJBoy4hYvGslUJvxgcgyJEENlP9N+fsAD/v7h26emtjHhc0KBSoHc2+LbjEZoHxwzbzYOjD7TJ9d9Rlkpv6j5u7YN7goyntMgXLOGEh0xmyaZjL01exE8qgrtiN83qKa6i/x7nwTN3sNRvkpaiFQ1oxSM5F3AhihB1s1V0q8g71k/x5QuBbyZRx/PefXd3Bu28mOuOnv76f1C+7sxSYESV1YIqTw8oQC7Z8gFMNqftl3PPSuvAZSIs7tpf5DG4GNL2wzYirMH1Gzu/xziLdfyxtgPiK4WBJJ2lbOjYhIfcXZths656or1vE5CgmeGtRD3zvn7YiCDeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6454.namprd11.prod.outlook.com
 (2603:10b6:8:b8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:21:54 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:21:54 +0000
Message-ID: <3cd8b5ff-40e2-414d-8b41-5ca524d70775@intel.com>
Date: Tue, 8 Sep 2026 00:51:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907094706.1407436-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0314.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d9e904-34ac-4110-b4fe-08df0d15470c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PfuK3ytykkMeFKRIEwbj2cVpAi3zutatVQot7rF/80EPt4ANamkWzXADEHsHEqyzQMoO/GfHXlB7Fiibx9NguUvKvgSp3nh6iTWP99OqDwduaTtQ8XKPtSS4w/phj641HQic+IJ4Lquvk+x5dJiNYu1gJZkPdpo3gRQVImEJy1tshaUpBkkdTVHizjRgT2wMrciXSKiy3a32W8c/g6QVxIimuOi6s9JMkVBnDCnT9PVmPOKQQSMq8NLKC+ekVY5Egc/MySh4Ektc9vGjfqsdi3fWYR7/x1pgezziGB1NZ1T8HISCsX4a6QjvT1RCMDwDEKKHrligfM/EsxJCyUFJAb/Y4ETOgF7lqYvDvKAlkzXbienpqJiYG+E+R2ft7CI3/7NCYLGYyfBzbkQHqjfeYFFmB9XyLOmzOVK1hkcmnM4xB4qgWO07RX+O5uG7pn++iSuceiHxiXKzZP3sYHsBPZ8s5B0T2nOdsHsS0j5ozFzuyMtbIRFEed4cZe7ZLH9SfyhK5WDDDACqzRVKRBkzgF0TXxELPrkpStUIQwEgcHTQXB1XJ+KAly6GyPTdNYVyLKNzzqTRobiqTM2fhIlZi2Tg9Sq6Om/CCYa7/hJsaWFE6JhAGy0Kx9151bvX0OjNWHiysIIuiqFJKaZEyTT5iXkTgomGFA0VNU7GReeLE54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3A5T1F4ZzNrSE41L0hFM0dVTVFmSlhGNlB0REVLMHg1ZlZvSjBjYk1IUXFs?=
 =?utf-8?B?SHl5d21qT2RzUithOCs1elhTcVVBNFRTNmdtU01DOWNURGMxdDZsRVhiaGJ5?=
 =?utf-8?B?YUJscmN5M0VFVjNqNHhCeUxwTnB3SlVVRnlTbzNNV0tBaXZQSnZTbk4rSFEy?=
 =?utf-8?B?NzFvNjJWY0V6SjBKSGVHY2JGTXpmdWwzRHhXWncrV0hxWFBla3ZRZ2VsSngx?=
 =?utf-8?B?SUZzK0U0cFg5K1ZabUo0N3Byb0hpeUFvUnNJYUh3NUxiUTliV0g4N0FoOWkv?=
 =?utf-8?B?RTcwQ1gyY2tPU2VZTG1zVlVCSkVIVFBOTjE2c2NtY3RsMEdMVEpkcVlUMzVm?=
 =?utf-8?B?MDZKTGJXc2poc2VMWGl2VVpza2pVZm5QZzBrcmlHdjA3ZEZYQm12MFMydVJV?=
 =?utf-8?B?MzRENzc5MkNURTVraTN0Q2gzeU9wTk5xR3NETE1nS2FtUWE1aG56ZndzMWIx?=
 =?utf-8?B?Z3NXT3N1Szg4amwrV1hzZmlLcVRsNTFvRXFKaUNiQTUzb2JUZGk5bDc3MFdo?=
 =?utf-8?B?RFZlVGkvWURvNURSTEkwblVXVyt6QktXbWU3ay9GMUJ1TnB0dkhFTDRERTJa?=
 =?utf-8?B?YnBkOWZnMUxnd3MyVk9KcCtkbGlLTm9HT3FabEVITjlGTm5RUG4rbTJlMXVy?=
 =?utf-8?B?VlpHcXQwRHpFQzlRelJCcU41eXg3K2djemU3cWRFMlNrTFVmNnFuYXFBa0VO?=
 =?utf-8?B?WWlMWUc4WXhHZEcrQm5GR1dMVlZkbm5GWU45VUExOTJXQ1NyeEUzS0M2NU5O?=
 =?utf-8?B?aVY0eVpZemNRVlZYanVZNisrdGw3MjVnSmthWFBMSTl3Qi9xbWhxTnc5OWg4?=
 =?utf-8?B?QVluVFpMTHpYbzFOTks2em5VVWxMWDFSM01vVmZCVUVUeW1uTGVjMXFrU1Mx?=
 =?utf-8?B?R2VOQkRja1VTTmpWWUJkSFdraENhaU1vUjRsMjJlMjVObVMxaGNOR2pNR0pK?=
 =?utf-8?B?S09ra0NIOC90djI0TE8rVjBMVFF2cjFCZnRjb0Z5QlN6N0ZBSy9JYkZhaml5?=
 =?utf-8?B?dmVPb1dCY01pMjNTbDNOL1RuTjlYYmFFYWRYZVdTOTdPY0ttRURKZFlRNGsy?=
 =?utf-8?B?Vm5yZllHZDhnbEZRaVRuZmxvbGl3WkZtSmxyYUFDZGVMdTMrUjdqbVluUW5W?=
 =?utf-8?B?UmxCRlRQc2U1bDJ4bTc5ejcwYktZU3pwU2dHQW1KeDV0UHFhNDBxdzE2M3ov?=
 =?utf-8?B?OWlyNmVQLzNKOS9FakFidmdMN2VMZHpyR3RYc0pKbWpmb2IyaFlBVVBCNUhV?=
 =?utf-8?B?bWZkM2g4azlIMFdUdzdaRkxKcS9IdFQ5MmpqWUVQWDdwMG1BVDBoeUpvaUNL?=
 =?utf-8?B?OGRTRytYNEtSSDVKSjA4VHVvOHlQY2pEbXQ4dnl3SGFqNjlOM3JCbWMzWmEz?=
 =?utf-8?B?MCtDTG56K1VVUDBTLzBlNnNEQi9RVklKTExyNmhoVWs0dVMwRHAwQ1NPNHJy?=
 =?utf-8?B?Z250WkhlelNDazZSV2VZR1RPcGpRakROL05NSDBkKzY4d1lMb2NBR1k5blYv?=
 =?utf-8?B?YjI1eXZyNUVaYXZJTEQrcElROE55bkN5RTE1OVlZY0lxcmZyKzNJekx3ZWxh?=
 =?utf-8?B?NVBNeTZlY0pHZHF1VUM1TTZwempVZ1VmUUJMVXRFUm1tcWhNOHpQeUp0Nk5E?=
 =?utf-8?B?SHRXNWF2WXB2cm1uWFNrVkRyY1ZqSzNkS3pXWEtMNEZYRlpzOUttK1YyZmZa?=
 =?utf-8?B?czNyWVRsOGpLbzl4cVYrQjd1SjZmNmhxUnpTaE1TazdkSHEzZHk0aVZ4cmhr?=
 =?utf-8?B?MDNBRi9CZmxoOE5IT1BJSXFQQlF6QmRobkpLSGlmai9QcVVEaDVUcFAxMXB3?=
 =?utf-8?B?ZlIrUUNPZUNvbDUwM2xJcnB0c0pldElMQWRpRW1lMUJFd1M0NW1LL0dBdmtj?=
 =?utf-8?B?TW5iVWVTMVZJeFYyVXRzVWhjZlpWZ0ZFaVE4cmNZUU9ZMUo5VlRDR0hIVSs3?=
 =?utf-8?B?QVJjdDNvNjFrZ2xRekV2MW51MHNGREljK1hzTUU4N2RHTlIvRWpsdzl2bGhQ?=
 =?utf-8?B?LzFnUmtBZE9jcTFua0pxU3llbFJ1aEJadHZLNDNyK2J6a1dQNGR1bU94SVJZ?=
 =?utf-8?B?M05icEdKN2FpZEJicmNjL2RTN1VFTDlKTVErSmEwdE9ta0Z2WitqVjVRK3Ju?=
 =?utf-8?B?MFV0SUdQRENOL3J0NVJGRlhTREt3d3ZmSzB0VWM3ZUgvRVVVWmFLdVEwVVdQ?=
 =?utf-8?B?WXVlRy9hTmJpTEZFa1J3YS9EamJZd3lzWDBucU9YMDJRMkc0OXMyZm5iZncz?=
 =?utf-8?B?bUExZjBhQ2c0Q0svbjZDcjZDS3lqRHk5ZDR0eDNhWHRFSk8zb01YR0hiaXBF?=
 =?utf-8?B?VXA4alF5RC9Yb3ZwNTkxQ2VPUlVPWnRFem12MkdjRmdaVzJOUmJManJZMllC?=
 =?utf-8?Q?x+m7Oz6DaofAiCzo=3D?=
X-Exchange-RoutingPolicyChecked: pH0W1YhlgNNo7hmh/cky6xjthgdYJVbV+0ENbSEek+QkwjAIFQ5QLSvq2MbsxnOhrZQp70WgLpCwvKWS5flvT9IPJVXrmjvrOna4nxtcbuiRXnPHWcjFNlWVKVLky8i/1SShcN8E7ax0hvYHE+qAhvL51byfYEWNTkgwxJyStFHmAzz8UJoTUNaq1tsa1iW/t/2L9dln65j9M4zTMQwl/r2UJz8VxW+dxnmT3pI+KFMVkigRtoZoV+UeghYdeOc+zh09te/pfNnMJvtIy3JPNIqppQyOwzry2z9I94+WBeQ4flEJvOBAm4/gLRwPEOUVmpRSmt9wJ8DKbygOXFPB8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d9e904-34ac-4110-b4fe-08df0d15470c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:21:54.8397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zz9utp6ejpwhLs6xCAxq7P6nzwrb3RtymY/76wrvcpjwj93nNrm79oerVvulmDcUH3zYqhrgLaV38Jfj9KW+7nNffE6+mE7gsRsNaN0Dyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 07-09-2026 15:17, Riana Tauro wrote:
> Add function to get maximum number of pages that firmware can store for
> offline tracking. This will be used in sysfs while reporting bad pages.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 4 ++++
>   drivers/gpu/drm/xe/xe_ras.h       | 5 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h | 2 ++
>   3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b5b0c1a3a663..7058482e32a9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -381,6 +381,7 @@ static void get_offlined_list(struct xe_device *xe)
>   	struct xe_sysctrl_mailbox_command command = {0};
>   	struct xe_ras_offline_list_response response = {0};
>   	struct xe_ras_offline_list_request request = {0};
> +	struct xe_ras_state *state = &xe->ras.state;
>   	u32 count = 0, total_pages = 0;
>   	size_t rlen;
>   	int ret, i;
> @@ -412,6 +413,9 @@ static void get_offlined_list(struct xe_device *xe)
>   		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
>   			handle_page_offline(xe, response.page_addresses[i], false);
>   
> +		if (!state->max_pages)
> +			state->max_pages = response.max_entries;
> +
>   		count += response.pages_returned;
>   		if (!response.pages_returned)
>   			break;
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 6e65443cd262..c411a6cb3731 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -27,4 +27,9 @@ static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
>   	return xe->ras.state.disable_page_offline;
>   }
>   
> +static inline u32 xe_ras_get_max_pages(struct xe_device *xe)
> +{
> +	return xe->ras.state.max_pages;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index ca459e785add..9f23970fd5a1 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -423,5 +423,7 @@ struct xe_ras_set_health_response {
>   struct xe_ras_state {
>   	/** @disable_page_offline: cached configfs policy, immutable after init */
>   	bool disable_page_offline;
> +	/** @max_pages: Total number of pages that can be stored by firmware */
> +	u32 max_pages;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   };
>   #endif

