Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F99C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 19:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0FD10E2C3;
	Mon,  8 Jan 2024 19:49:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1128710E2C3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704743361; x=1736279361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DxiAd5aDlRRGkDn+9uOREQgL01wTtQjWzLZkYZefhCc=;
 b=oFYypsGAJtfox8IaX4W67sQdjpADdIuB6VksFdAD694zWM/62FGftJuM
 /PYC0urge7m4AYC98Hv9mj2vQnnDA8cv4qXtXIDrd6QMhwGKDoFIUMWCe
 ssTxyfx1n4T7tZ9TShAlUjDQ4y5Vy9yHFZ9W6iwXgHE09zpNj8k9f7BW2
 koJUZ7m7hsHry/GuA5G0MC7aKHzzg7pwtlJtvd2dL1ovFB7uDCULdV7P4
 Rsc2/Z10lf38c524Pj4rK5b/39qrg1cPpUIro50GHYJuJ3LFmaRH9H6OF
 Yq6HGiHVS93i4Ex+17d4rLsreQKg4uNDEUH5XMKlTmGLsjNM47X1i3uQN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395148291"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="395148291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 11:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="757713177"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="757713177"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 11:49:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 11:49:19 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 11:49:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 11:49:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 11:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXqMD4onI1/ghQcyMhxouXmkeVOhbDcItRq2Xj4hinueE5KUuyM6VntnybYSR8fv3akCYdpJDkGQre9xbqTe9/4JAC9/M9FdlZo9fWQ0IDhctGW1eQbXQkohytae3pulFi5sLBHqFOnRHzedoiDLFUCwbEZWsl15BQxg4FGiyJdmzJDkbk16kYMQo4ri9H1RC8Z6nmapIsWMPyQ63GhgkzZfMT0e1w+0kb3dTNEWfYzwAHiE4S43iOT40Uf+L0ShyUR/eGy5s27pewLl9J3NWz+KdBjjLi10xN4sEEXzS0dV9rOOX/3E8oWjr/Kp5WJZbGw1paUiKa/h7qWsCZP3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSsjgrTI8sqqaoOm/mNquBVmwTsUbMl7v4N4YDl5LME=;
 b=ImRTrOjNIRuWq2n04234kD+JUHrOTBuxexxAZczckLsWl7mGxceUylIgqqsor9+Uf/dDs6Cl06n/17tuiikoDNAM7cWLA1xTxHmBTipDiPNhKf+EMysucg4jEQisZcq/xcR6+Vlo3fY3NVg0/IJ0exnbPE93OF7vHxkucUr0WKwatmo/QXgrO0DBWwrJ01jgb/vwagW0CJiWWm5bsR7MIUypo/nR4ZDxrl73atPLSnNGg9sDWz/osJaFMaTfSkBLqscYRu2uX6jYOeX3ehghBbAEqXhTSHNkbJoXeGRLYUqqWpZWvCTrw9xXmTixgh2hNbeKOsDaPlsjHyAwuE4qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 19:49:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 19:49:01 +0000
Message-ID: <be241892-665d-4da0-99ab-d897a1eaabd1@intel.com>
Date: Mon, 8 Jan 2024 11:48:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
 <20231212010600.3479465-3-daniele.ceraolospurio@intel.com>
 <da9150ba144d47c347ec3e17d3ec81b8609ce943.camel@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <da9150ba144d47c347ec3e17d3ec81b8609ce943.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0249.namprd04.prod.outlook.com
 (2603:10b6:303:88::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb3cc80-0d3c-4cda-8da2-08dc1082dc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xoFxifqPhTYzuqSKaopizIZ49Twt+hwAbUHZwYUhPwjZi7bciCbCyaHJNeh6KmeeZ7tGNGpw0WQmvrno/xTmL414tSAjxZq0FBPQlP45baVBmgzk72n9a/artnlQBK9r24tmXTKDjQMbROljrHzW33Hd20gTBlFYS2gHuItJgNnGYj7kH42GiUK7j/KRtBelAR1Pc6XmwPvPypAUu6j7a7w8KdWJk6SW59Vr8MutfLTS21YaG2PMX5zXbc67tZdsK6gIGA7VsP9YQyrLg6jP4A/qW1FSKarSXiGN+uV40u355KqkyHn1Rfz+PRAPgovNUzXG4UgZMUVEHYP+G6q6S77X36ZHLomVymWbGfMrIVkiZtrmpoNlgUXbO7QSaKbdbWiJAIGdps1R2zBAyIrjfxKu8she8Srl5iUjPkOF0fP91Ca3sbyC/gpJANz2Jp6w19Z9edJYzJoWHsJOXmCNpheDkx3PrcR3x/ygunCT14kp1Dls+VXNIA+PMkaOxB/HdP+mGkSl50wU5pq6SlCZhhBUP/51O91far8uZjc5kHw3XzJLzYA3ZpUhGZw3k9gqkNi4fqiMtIZonW7+BpFDKBZlBikysmtREqZkjyZYMU8S7sbzBlAbu3TGtOTp25Xn5rigGGHVnZF+OwVRAJrkJua8oPWDzdB6oryvBPi/uHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2616005)(41300700001)(107886003)(26005)(6486002)(53546011)(6506007)(6512007)(478600001)(6666004)(31696002)(36756003)(86362001)(82960400001)(83380400001)(31686004)(38100700002)(4001150100001)(2906002)(8676002)(8936002)(66556008)(66946007)(66476007)(316002)(110136005)(5660300002)(4326008)(87944015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9KazhoL2NObytNYS9tZTIxenNGcmtBSkFVbEMwZmNmdlIwZXU0eVl3UHNW?=
 =?utf-8?B?WGJSa3BUN252bEFsdVlWcUkzZk8zTXVIUzViMnArMXlPWFdhM21CYjlSUlk2?=
 =?utf-8?B?THJ0NW1sczhPRUdLSCtGbGpLZXpobWpyMWJxT1B0WUliME1oeG5pQlVyaVht?=
 =?utf-8?B?Ukx6R2xrTk5XUjdmTVdkRk1jOVdtdGlWRXN2ZW9MTzZ0a01pajJMbk5DZGxH?=
 =?utf-8?B?UmcxYnZYMmNYOVZoVnMzUEs0T2VUYkRwTWVQRkxOUEVjRGViM0FiRXovdzU5?=
 =?utf-8?B?WExVZjV3V3VxVyt6YlAzZmJEVDBqTXdySWdJeGd1aURLQUY0dENRbHllckU3?=
 =?utf-8?B?cDJJT0hTRnJoL0h1YzRDUTZsRVJnZkRscjVSMDdrZVIwNStTbENmNjh3dDRp?=
 =?utf-8?B?eTRtbHdSMmhTZm8xR0tOY1ZTVGVobEdRNnFIei9QbWh1NUQ0VFpob2NHTHUy?=
 =?utf-8?B?cFBzQXBWM3NyLzF4ZnVJZzd5RGw4cW1jODdOV21hNkJDZXZrQXRRNko0Yy8v?=
 =?utf-8?B?S3BndTBxMlk5bEw1Y1l5S2NaSVp2Qk9xSnBZRkNtcWtpOUJaNitsWldnTSsz?=
 =?utf-8?B?M3NKMzhvTEMxT2JIa1YvL0RWaHRUSVRoeEFLeEV4cUdlSmk5cXpTN0xTS3pw?=
 =?utf-8?B?VW0vM1h4eHpYVlgyNjhwNUxPbWpFSnlMN2RwMjlDRTgybGludEEvVk9rUGJ1?=
 =?utf-8?B?QS9EdVZGaHd3VDgyYkpBR2YyT2ZWcmRpS2FLUWRlbTNGZ0E3S0hXdHIxQVV3?=
 =?utf-8?B?Q09UR2FTbjFmenREeG1CWm0xekxZTm9lRFJJZEUwNDVhK1U1L3h3K3hoR1A2?=
 =?utf-8?B?bTl6TGJYbWZycVhtcFdIOEQwblhydDZ1VDhGWDdaR25BZmJCanlEd0Nqaldi?=
 =?utf-8?B?Ni9TMFg0OEtNbEhETEEwU0xZN0sxOGppaFptc1FKQUFNdHBEdG1DRWRDYmVL?=
 =?utf-8?B?UDllQlU3Q3lnbzZJcXI1aEE0bGo3YThqcVFTNzZXY1FHeWJOMWJzVzJudU9H?=
 =?utf-8?B?KzBYVi91RjR3TnpkZU1rZFpMQXZCTEVoTFErajg3R3o0ZHdjVEVSb3lnRFBa?=
 =?utf-8?B?UXFCSTc2ZERLd0o5M09McWNUZDRJR1ZhelROL2lzejVsUnl6eVFTMFFWL3Vt?=
 =?utf-8?B?TlJKeGhmQWVxRk15Vi9uZXlXN2NiYk5mSCtDSW1SeExDZHIzN2o2cFloWlBB?=
 =?utf-8?B?M1l2WVUvM0lwMlZyeG5IVEppc0lzV01ZQ1UrSW5WNjhBMVRFQ3R5WGdPaEJl?=
 =?utf-8?B?T3JEV24wVCswcmJoRHhIZytaSmNFbXFHenFyQktWZDA3S1pTZUpWZWpkdlgy?=
 =?utf-8?B?MWNvNFhjcU12SDc4OFIwUStFdGJDNHViUlNZaUFaR0lDbEQyVk1YNFdEejFB?=
 =?utf-8?B?RlF4RzR3K3BWUVlQRlBmU1VpcTVKQTVhREJ2dVVRS01yVitOMUhRaE1IckVL?=
 =?utf-8?B?cjV0dGZIWXNnZm4vb1owZGJSckx5OHFVdjA1bFh3SE05cGFlZXNBTXBlOFYv?=
 =?utf-8?B?UGgvaUNnQjNCWFdKaWlYZEhlRHlUTHE3Z09KdDhLeGN2NFIvTEFKTFpQOXRR?=
 =?utf-8?B?MTBBRldKMCtLYkgyZFRvREtyNC9oQk5CYnVJTkxRQ1NyVm9rSGhpd2JKa0hl?=
 =?utf-8?B?bTh3U3RUekt4RFkvMTI1SzJvVHpnVFo2YVlMMDJmWk0wS29Wei9URWdzK2pj?=
 =?utf-8?B?YzRVOUNxTnRod29JYTZUV29aM1IyZ3d0c0xCaUpqNkhjMnlaOFRzRVl4d2RS?=
 =?utf-8?B?MC95dDRGa0xFQVAzamd3UTJNZkRRa0xkY3lsT0V1dU9HRUFLaHpuT1loWWZV?=
 =?utf-8?B?UzloS2RXZ2MycmR3YmVPL3dLbHRzdHhheEZBSTVhK24zQk9tWjI5TmxYZWg2?=
 =?utf-8?B?TEZ6SEFvd3U5eTBNejhOLzBYU001MVdhRzVIZlZZa3hxZGcwWlZOSWlGM3Jq?=
 =?utf-8?B?MittTDExbnVLMzVHYnZTejlrSk5yTHZwdWU3U0wzZnYwUDlDVGpGQXF1UmJ2?=
 =?utf-8?B?d1RIMTdza0dLK2xSMTlnUWJ1SlA2b1l0OXJXNFV5S2ZxNG4vVmxDTVdYYWU1?=
 =?utf-8?B?RklUU2Jab0xFcmxuZ3dmQW0wK2JxRWhxbWo4MTJKcTcrdUd4Q01lWDZPbHBQ?=
 =?utf-8?B?MmlMSTRXQVVraWJEOXlBN0Z0VVJuZUFVenhreC91NHE2WFVxNHlMUDYyeFIz?=
 =?utf-8?Q?KwuMSKLKaTiZE65Q/Srq8mQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb3cc80-0d3c-4cda-8da2-08dc1082dc16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 19:49:00.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrqj6LX+SH8G0XC3yxu0kj9wFTfq5ZGJVvvYVjfv52FR1BTvkOxQYkd/+GgpfYqfBI4OjXrER5gnCEVXq4ceBVPI7OxcrlCfj3+r7TqKq7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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



On 1/8/2024 11:32 AM, Teres Alexis, Alan Previn wrote:
> On Mon, 2023-12-11 at 17:05 -0800, Daniele Ceraolo Spurio wrote:
>> The GSC notifies us of a proxy request via the HECI2 interrupt. The
>> interrupt must be enabled both in the HECI layer and in our usual gt irq
>> programming; for the latter, the interrupt is enabled via the same enable
>> register as the GSC CS, but it does have its own mask register. When the
>> interrupt is received, we also need to de-assert it in both layers.
>>
>> The handling of the proxy request is deferred to the same worker that we
>> use for GSC load. New flags have been added to distinguish between the
>> init case and the proxy interrupt.
> alan:snip
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 5f5a72e9d0d8..9f5f2150034a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -450,6 +450,7 @@
>>   #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
>>   #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
>>   #define   OTHER_GUC_INSTANCE			0
>> +#define   OTHER_HECI2_INSTANCE			3
> alan: should we stick with OTHER_GSC_HECI2_INSTANCE to match the naming in our hw specs?

AFAICS the HW specs actually have "Security Engine HECI2"; I abbreviated 
it to just HECI2 since the mask register was like that as well (see 
below comment)

>>   #define   OTHER_GSC_INSTANCE			6
>>   
>>   #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>> @@ -462,6 +463,7 @@
>>   #define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
>>   #define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
>>   #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
>> +#define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
> alan: similarly, i believe it more maintainable to follow hw spec: CRYPTO_RSVD_INTR_ENABLE

This is HECI2_RSVD_INTR_MASK in the MTL specs.

>
>>   #define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
>>   #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
>>   #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>   {
>>   	int err;
>>   
>> +	/* enable the proxy interrupt in the GSC shim layer */
>> +	gsc_proxy_irq_toggle(gsc, true);
> alan: nit: just a question -> does hw/fw require us to enable the gsc heci2 interrupts if
> we are not yet processing event-based requests but rather doing just the proactive-startup-proxy
> sequence? (i.e. maybe only enable IRQs after the proxy-request handler call below? but i
> guess it doesnt matter either way)

Not right now, but there was talk a while back to move from a loop to a 
fully irq-driven flow (i.e. the GSC would generate a new interrupt for 
each message instead of chaining them as it does now). If we ever go 
that way, that would require us to have irq enabled before the first 
proxy is sent, which is why I went with that ordering here.

>> +
>>   	/*
>>   	 * The handling of the first proxy request must be manually triggered to
>>   	 * notify the GSC that we're ready to support the proxy flow.
>>   	 */
>> -	err = gsc_proxy_request_handler(gsc);
>> +	err = xe_gsc_proxy_request_handler(gsc);
> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
>> index 645166adae1f..310f25809798 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>> @@ -39,6 +40,14 @@ struct xe_gsc {
>>   	/** @work: delayed load and proxy handling work */
>>   	struct work_struct work;
>>   
>> +	/** @lock: protects access to the work_actions mask */
>> +	spinlock_t lock;
>> +
>> +	/** @work_actions: mask of actions to be performed in the work */
> alan: nit: did you mean "in the worker"?

we usually call the functions just _work(), not _worker(), so I matched here

>> +	u32 work_actions;
>> +#define GSC_ACTION_FW_LOAD BIT(0)
>> +#define GSC_ACTION_SW_PROXY BIT(1)
>> +
>>   	struct {
>>   		/** @component: struct for communication with mei component */
>>   		struct i915_gsc_proxy_component *component;
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index d1f5ba4bb745..de7cc6e611a2 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_display.h"
>>   #include "xe_drv.h"
>>   #include "xe_gt.h"
>> +#include "xe_gsc_proxy.h"
> alan: alphabetical order

will fix.

Daniele

>>   #include "xe_guc.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_mmio.h"
>> @@ -129,6 +130,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>
> alan:snip

