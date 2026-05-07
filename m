Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C6CD3436
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 02:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061C610E56F;
	Thu,  7 May 2026 02:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cws7bG5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871E110E56F
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778121572; x=1809657572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dQ2pkbhzN78JKlz0hjDsIoo4eWnvUifHqLGca56zU8Q=;
 b=Cws7bG5NJ31c+crq/gv0xt4bNCgdOCLufpDpoz04vzKhT0yVRI9zkdhS
 GSpAUW+REpdQog8cyXsPt12fSimdnZ6b2WJGFeRz1YOdfGE8Ow4GW4XLG
 n32CLZNbWC6yR+2k/nFTJs9ByZCUif6arO02+bmscJW6NfPLHszU3805J
 W5y+87iC+EiVV61pnkSHaM+JWqHpGkjQlsMjQrlqvWt/81ZuQn4jHUkgP
 b+d+2cIXto6j2CfzYQ4efedB0fO9zVnU4iKVbJVu41XkQ4dBfCBkeeZMH
 Wwl/Bw65icNfRTH5MhrDfc8riwtQBoCm7fMjtskQts6UV7D/0SVahHlKN w==;
X-CSE-ConnectionGUID: B84fJRWvTW+chQ8ULx5sjQ==
X-CSE-MsgGUID: KPM13EnfQ96ORTCovKKbcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104524466"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="104524466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 19:39:32 -0700
X-CSE-ConnectionGUID: rWHYS+4cSZuTmhWjbva4LA==
X-CSE-MsgGUID: vzg8ByFHQnavhODaZNvo1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="233658672"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 19:39:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 19:39:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 19:39:31 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 19:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcirvZmAU3mwGUZuLIPU9CALoltkKpRejajot/9qww3BzeJGuLgrk/kR8BzZCQPi0vKY1/wJL5WwqRtx56/GRJKqA6GebMCz4lbQ799cnWasKqrUruHdIg3FRqW2QC+cE71fa/SRyLHUbiBXqbWgDeomNg5jJI//YaA4StSL3YVsgqce4t7mkf9fVkE0ugvMrVb/8VWNPgmpQffDqtzp+kyYX2wGaYMRW78o1nHrfYWZyAmnSrJhYpHXwJTSnnIijsHmHrwtWspvEgWuAMNfNCgHKHIH27TH+r2TSMa4qlN5uRlvZhAGa4Q1lMne26lZMJ2X01divL69UWDndQon3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg70kvrlpcDEWHkkFwLjbZVRv/4MLnmNDiHZFnx/6Hc=;
 b=eryOuecLcnL0MaFD95TC0hSz/5ogiLIW8qHHOZzmAPiL1vUTErewGNR2vBXAiKV5VGLZXLrXXRcCC62Heekpn9bI9hwFFXkMj/Iw+KvMvRW1d56fOmQTTzdqDoH3UHoaibYSK3mQHepZK+65a+Ft7PCuFPqPTKMPtQTEwIQghkUq9A7MwVub8h2cfdeK1L3Jxq1WeqPSXJ/rhJ1iyYuC5RSwyRXcv5NJLIsgk8MEXz4tOU6NwCdPBzdeOXNWieoXhTKXIzLj3rJiZ8qDra3YS46+uvktnaFg3/Bw3IdxA2y27rdpFL9Wcbvj+tF0NChzloXCBjl6ZkkS80+6D9Zr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 02:39:22 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 02:39:22 +0000
Message-ID: <21d03e2c-05d8-4fac-8e8d-17b44bcde2a6@intel.com>
Date: Thu, 7 May 2026 08:09:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/madvise: Track purgeability with BO-local
 counters
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
References: <20260506132027.2556046-1-arvind.yadav@intel.com>
 <aftkJ4+5iGRMt07c@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aftkJ4+5iGRMt07c@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de525cb-b343-4d56-05cc-08deabe1d832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 9h9zimqex6qjTG7YaS+KJzNHUg4J90NxoeWcv2rSc86ZeNqjk87YVFORegCMwl5v9c3e87e1A55bhlhkXmNnTO56yclMhY7LMUUoiowytuojA2h35Eme51/rIouqxC31dGUjJmbyxhnsGOPgE+fmafh3oJ5cBep1F6ta8GmYROjFPe1xjjPDEeVYfdeDq6dpKSMjM9fDjlqg8uRfPPji8M3mTmw0dCzAq6mCHrXAa+tpYmLgepZv0yLhF1tYTw/x8FFxwL76TAKuCD078EQWiCVRadT8qoQRF98YKIn00vJbnZ0Yp4U379VBBaXvXK+N0Zd/XovXI9tERLud1thIMb8GhUiem34k2ojBVBn9VVAMiZjEfTcES1Xf9fmzIrw/Jui1K2FvclfaiWjR71mwQG0jeFzbAv3pRAAzYp33uH1oEIwNX+M3yWNY7hcdQo0dUQvRzqqEzeRO4vMn2oY378rJPbT5kofvrL+PovhX9jv8Tyknm8uUZszSk6AZOhjuVAoJloH3et0zzxrFYUYpaMgTDTpWMxWWM9HTGIgpT2UTQ0C6udb8Pl4KxyVQRMLdTPtNkD+XWynWkQxq1t1oUyScjpQxKar/7X+5dwOFkj4Pxg9f8+E41XKjzZ6Ey5b4543v2AZmzm1Ay1OuMexI5jRUHPeY/u2ZBJsKGFwZOM4N3YAao9ikQCURoDaKyk8y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVVjSU5OL2I0cUtudnBJREtGaU54cjhOeEk0OEdnaW81Z2dnT0hVQW43Q3ZE?=
 =?utf-8?B?SmZWeDNtOE9Lb1BoTzNnSmMxSFRybjNPcjZsM3kvL290M0JBaUtKY2VMMmx0?=
 =?utf-8?B?YTFMQ2RUZFFINkJMRXFnV25DSWJZZk9iNE91dEtFWVBmYkt4b1ZwOFdDSXVQ?=
 =?utf-8?B?ano2bGxBb1NrSE5QK2JzL1p6dzkxMklKUHBndDJWWlM3cTU0dVgvZkFZckxX?=
 =?utf-8?B?dUNvVDY2d0ptNFJvNXBPa0x5S3dDUFhjZGQ2UWdrRkxkcThyaEJjZVBvTXJ4?=
 =?utf-8?B?OEVtM0JPY1NtR0N1dmwwVE80cmVjelozY2huN3N6N1BpRDNQU2VwRXhZNHRo?=
 =?utf-8?B?YzZoNWFJcmhLTW4xSFgxVGJCd1U2cHcvYzFTdnFxeVd1bGNBWWkwTVl5Nnhn?=
 =?utf-8?B?NnlucERBbVN6UG14STFXOEVRN0JOZXdvMTd6K2N4K1dJMkJzc3VsWEdOdzA0?=
 =?utf-8?B?cEdxVmFUVFQwNlRDWkErWTYxcWoyOEhhV1NJdU5VUWFoSXRuQ3NEWXBPK2sr?=
 =?utf-8?B?aUEzejgvNENiODFDVFVtY2IyakxVWnlmdGlLZ21zUDJEVUtnRllWZTNwS05i?=
 =?utf-8?B?aXhYdDBoSWwzRE5acXlGSTMwS3BtRDdXblJVaDhheWx3dVEwNDFHazFuem4z?=
 =?utf-8?B?OUlyMkJEZnlBRk13RVBvdkJhTFpJT0lWQVozWFN2Rnc5d1JpMEFyaG1SZHJs?=
 =?utf-8?B?Y2FPbW5idk1kNDlqTUdwQm5xMlhWNTRkL0xkMHhERTVZRENtOVNtdnZiZFZM?=
 =?utf-8?B?MExNNXIrSkVTeFhqM0ozZnh4VlVCc3VkK2h4ZU82VnlXSFc4MmRudjZpa0VK?=
 =?utf-8?B?bTVBWk8wdGV5N3lmMUcveS9lTTJiSXByQW1ta0pYOTh5Q3ZvWFEvMVEzZ2g0?=
 =?utf-8?B?NjZnUXV2TWF3bjFuSVNOdmcvenhPdndOUHlFT1dlV0M5NE44UEZRb01FRDlT?=
 =?utf-8?B?VXg1TG5rVkRpeGZqTWQxU2YvTlJjMG5WSXB3VTl0VnRsTEl2SUp2Mis1MTAw?=
 =?utf-8?B?R1BPVmtTZkZSc3NPUU1BU0ZDSW11eHJTU3YyY1JBcGxhSGJGM09RRHBYTkpl?=
 =?utf-8?B?dHVvYURpc3p5N1djQStaZHZYZ3VpN2JONUJVc05ydk9PVlJoc2o0dDFqN1po?=
 =?utf-8?B?b3BQUjVSV1BiZm1xOUdZckp6STFtSDYyQnpSZXpXenIremR6cWlpQjFZZDBH?=
 =?utf-8?B?ZC9vajZXVU9JUUVNeGIrQ3JkeFR6REd0SmxhUFlqdHZQU0tFbFlwbkF3dDRC?=
 =?utf-8?B?VzVib0NkQjFHcThnWXJvVnJuLzlhYVQxZk5ZRzVZekFHMXZIRnJFa2RhVGZ5?=
 =?utf-8?B?ai9pRXo1azZNaDR3WkJqb2EybjQ5SVZsMndFQjBoL3NEQ21TMEVJZHRmY1pI?=
 =?utf-8?B?VUhHZ01EeCswWUd1QTZvMXFMY2J4bVpoTVlhNGRJdzIxNHR4VmNoNTdKemk0?=
 =?utf-8?B?eEgrOTlFbURGL0VxQzF2Q0ptMWV4T0xWU2dZWU1ZMUhCdjZIUkhySzliN1Zs?=
 =?utf-8?B?OGw0aTU0Q3ZSNWJobXlpancxcnRCWVNVN3ZDekFiREd6NTNWVFFoZlR5aEhP?=
 =?utf-8?B?aHI2T2xCQjBFV3FDYzlyWms4ak9xZnlaTWF6eHBJdXZsb2tKb3UrdVRoR0ZO?=
 =?utf-8?B?ekpqYWg1WGdYbDIvWUdWQnFreWpFbkFUVzNBS2ZHeTQzNmx1NGxPMzZ2dytU?=
 =?utf-8?B?b3dOUk5QZEMyMFltWEEzQXZ4Y1UxTFF2WmhoSGJNWmRiKzRJZ0V1RXJJZEox?=
 =?utf-8?B?TEdYVFc5ZUNXWG05RklhSmY3OWRybjdRRlFUMHFocGtMTGEyWHpWbDVoY2Y5?=
 =?utf-8?B?UDJHT1lSNy9HZXhXd3BIZTE2ZCtWY3hZbmI3aFRzdmZzSGd4czRZWHZqdHF3?=
 =?utf-8?B?aXVJaVZUVUw4TEVHVHdLczdpRGgzMXVFVEo1RmxzUlF2K1RMbFFFdTk1RUgr?=
 =?utf-8?B?OW04ZGQ5MmphSDNQdlBTUk1EY2NlZzRyNElFY0hNR1RwYlJPK2Voc2Y4b2VV?=
 =?utf-8?B?OGlsVFlTOEZMcHdUdDNiYk5vdmY5aHJCODRCQ2xaUDUwdVd2cm9id1ZUc0VR?=
 =?utf-8?B?ZjhUWm51ckNLN3AwR2Rqc3BiZTB0dkhnREl6aWhkZGF0VlM5cmxhY3gzamZI?=
 =?utf-8?B?RkxweXdwSzlXZW9HUk9IU3JOK1RuRXVyaWRMdkNnQjYwWEVTNTJoUC9yUjlS?=
 =?utf-8?B?K3psQWh3b1dLMHQ4K0V4b3MyRkNxTTBoWElSSXNTdlJNOGVrRldMdGtYSmF0?=
 =?utf-8?B?MUNkYnZENFhNbFhBZTBrRjBHbkRJMVZJS25Cc3FROThjTm5mVWozRDdpeVFR?=
 =?utf-8?B?WWFhU2VsRnYvZHBpMy9yMng1SVFxbzZlT0tVcW5kZTNtc3FlWkdCUT09?=
X-Exchange-RoutingPolicyChecked: bawCALDfcwleKSAXbpY0SrEeEzZ+LyOnobW43mdG9KBsNA6EbbgJ8UPPsMHyzOaXrasHJbI9YmhxPTOTwIaDiDrEMYVBKTGdgj6IywAshVYeuWvSJKQOLluMjHcDvODup3mtvBwtrgv02bRNIJVzt0uf428qx2V3JbDQrz+NW+pBfDwZ1V+Go4e1EJZm9uj2VIZL2NAzN4ViO2HUIeOT6XFdZ2y/mrzyocxrrp+guE/onBo4lIfvBvfq1fbCnwfpqGcU/lEbkkeHfdG791iTgYzlvp+b1I4ui6DhRvqmAHMUoLhFklggm1is5s+mdpevQkSXILJCdQlXlLb+T8Dt1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de525cb-b343-4d56-05cc-08deabe1d832
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 02:39:22.5184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGTU3DSgT1HDHDEqEfQuWlrW10YUhSC3IWISksdMVgLfWfvhTHQdQpK5bj/3ZMXcVQD9NKt/8qvZBrL9hLVDXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
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


On 06-05-2026 21:24, Matthew Brost wrote:
> On Wed, May 06, 2026 at 06:50:27PM +0530, Arvind Yadav wrote:
>> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
>> whether the BO can be made purgeable. This makes VMA create/destroy and
>> madvise updates O(n) in the number of mappings.
>>
>> Replace the walk with BO-local counters protected by the BO dma-resv
>> lock:
>>
>>    - vma_count tracks the number of VMAs mapping the BO.
>>    - willneed_count tracks active WILLNEED holders, including WILLNEED
>>      VMAs and active dma-buf exports for non-imported BOs.
>>
>> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
>> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
>> when it still has VMAs, preserving the previous behaviour where a BO
>> with no mappings keeps its current madvise state.
>>
>> PURGED remains terminal, preserving the existing "once purged, always
>> purged" rule.
>>
>> Fixes: 4f44961eab84 ("drm/xe/vm: Prevent binding of purged buffer objects")
>>
> Nit: Move the Fixes tag down by other tags. This can fixed when merging.
>
> Also I assume you have test case showing the current issue with partial
> unbinds of DONTNEED?


Yes, I am adding an IGT test to cover this scenario.

~Arvind

>
> Anyways patch LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> v2:
>>    - Use early return for imported BOs in all four helpers to avoid
>>      nesting (Matt B).
>>    - Group purgeability state into a purgeable sub-struct on struct
>>      xe_bo (Matt B).
>>    - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
>>      transition means all remaining active VMAs are DONTNEED (Matt B).
>>
>> v3:
>>    - Move DONTNEED/PURGED reject from vma_lock_and_validate() into
>>      xe_vma_create(), gated on attr->purgeable_state == WILLNEED.
>>      Fixes vm_bind bypass and partial-unbind rejection on DONTNEED
>>      BOs (Matt B).
>>    - Drop .check_purged from MAP and REMAP; keep it for PREFETCH and
>>      add a comment why (Matt B).
>>    - Skip BO validation in vma_lock_and_validate() for non-WILLNEED
>>      VMA remnants so cleanup/remap paths do not repopulate
>>      DONTNEED/PURGED BOs.
>>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         |   6 +-
>>   drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
>>   drivers/gpu/drm/xe/xe_bo_types.h   |  28 ++++-
>>   drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>>   drivers/gpu/drm/xe/xe_vm.c         |  51 +++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>>   7 files changed, 190 insertions(+), 175 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 5ce60d161e09..eaa3a4ee9111 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>>   		  new_state == XE_MADV_PURGEABLE_PURGED);
>>   
>>   	/* Once purged, always purged - cannot transition out */
>> -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
>> +	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
>>   			new_state != XE_MADV_PURGEABLE_PURGED));
>>   
>> -	bo->madv_purgeable = new_state;
>> +	bo->purgeable.state = new_state;
>>   	xe_bo_set_purgeable_shrinker(bo, new_state);
>>   }
>>   
>> @@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>   
>>   	/* Initialize purge advisory state */
>> -	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>> +	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
>>   
>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 68dea7d25a6b..6340317f7d2e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>   static inline bool xe_bo_is_purged(struct xe_bo *bo)
>>   {
>>   	xe_bo_assert_held(bo);
>> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
>> +	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
>>   }
>>   
>>   /**
>> @@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
>>   static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>>   {
>>   	xe_bo_assert_held(bo);
>> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
>> +	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
>>   }
>>   
>>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>>   
>> +/**
>> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
>> + * @bo: Buffer object
>> + *
>> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
>> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	/* Imported BOs are owned externally; do not track purgeability. */
>> +	if (drm_gem_is_imported(&bo->ttm.base))
>> +		return;
>> +
>> +	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
>> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
>> +}
>> +
>> +/**
>> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
>> + * @bo: Buffer object
>> + *
>> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
>> + * DONTNEED only if it still has VMAs (implying all active VMAs are
>> + * DONTNEED). If the last VMA is being removed, preserve the current BO
>> + * state to match the previous VMA-walk semantics.
>> + *
>> + * PURGED is terminal and the BO state is never modified.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (drm_gem_is_imported(&bo->ttm.base))
>> +		return;
>> +
>> +	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
>> +	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
>> +	    !xe_bo_is_purged(bo))
>> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
>> +}
>> +
>> +/**
>> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
>> + * @bo: Buffer object
>> + *
>> + * Increments vma_count.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (drm_gem_is_imported(&bo->ttm.base))
>> +		return;
>> +
>> +	bo->purgeable.vma_count++;
>> +}
>> +
>> +/**
>> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
>> + * @bo: Buffer object
>> + *
>> + * Decrements vma_count.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (drm_gem_is_imported(&bo->ttm.base))
>> +		return;
>> +
>> +	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
>> +	bo->purgeable.vma_count--;
>> +}
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 9c199badd9b2..fcc63ae3f455 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -111,10 +111,32 @@ struct xe_bo {
>>   	u64 min_align;
>>   
>>   	/**
>> -	 * @madv_purgeable: user space advise on BO purgeability, protected
>> -	 * by BO's dma-resv lock.
>> +	 * @purgeable: Purgeability state and accounting.
>> +	 *
>> +	 * All fields are protected by the BO's dma-resv lock.
>>   	 */
>> -	u32 madv_purgeable;
>> +	struct {
>> +		/**
>> +		 * @purgeable.state: BO purgeability state
>> +		 *                   (WILLNEED/DONTNEED/PURGED).
>> +		 */
>> +		u32 state;
>> +
>> +		/**
>> +		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
>> +		 */
>> +		u32 vma_count;
>> +
>> +		/**
>> +		 * @purgeable.willneed_count: Number of active WILLNEED holders.
>> +		 *
>> +		 * Counts WILLNEED VMAs plus active dma-buf exports for
>> +		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
>> +		 * transition only when VMAs still exist; if the last VMA is
>> +		 * removed, the previous BO state is preserved.
>> +		 */
>> +		u32 willneed_count;
>> +	} purgeable;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index b9828da15897..855d32ba314d 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>   	return 0;
>>   }
>>   
>> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
>> +{
>> +	struct drm_gem_object *obj = dmabuf->priv;
>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +
>> +	xe_bo_lock(bo, false);
>> +	xe_bo_willneed_put_locked(bo);
>> +	xe_bo_unlock(bo);
>> +
>> +	drm_gem_dmabuf_release(dmabuf);
>> +}
>> +
>>   static const struct dma_buf_ops xe_dmabuf_ops = {
>>   	.attach = xe_dma_buf_attach,
>>   	.detach = xe_dma_buf_detach,
>> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>>   	.unpin = xe_dma_buf_unpin,
>>   	.map_dma_buf = xe_dma_buf_map,
>>   	.unmap_dma_buf = xe_dma_buf_unmap,
>> -	.release = drm_gem_dmabuf_release,
>> +	.release = xe_dma_buf_release,
>>   	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>>   	.mmap = drm_gem_dmabuf_mmap,
>>   	.vmap = drm_gem_dmabuf_vmap,
>> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>>   		ret = -EINVAL;
>>   		goto out_unlock;
>>   	}
>> +
>> +	xe_bo_willneed_get_locked(bo);
>>   	xe_bo_unlock(bo);
>>   
>>   	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>>   	if (ret)
>> -		return ERR_PTR(ret);
>> +		goto out_put;
>>   
>>   	buf = drm_gem_prime_export(obj, flags);
>> -	if (!IS_ERR(buf))
>> -		buf->ops = &xe_dmabuf_ops;
>> +	if (IS_ERR(buf)) {
>> +		ret = PTR_ERR(buf);
>> +		goto out_put;
>> +	}
>>   
>> +	buf->ops = &xe_dmabuf_ops;
>>   	return buf;
>>   
>> +out_put:
>> +	xe_bo_lock(bo, false);
>> +	xe_bo_willneed_put_locked(bo);
>>   out_unlock:
>>   	xe_bo_unlock(bo);
>>   	return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 43a578d9c067..b01f31ed4417 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1120,6 +1120,25 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   
>>   		xe_bo_assert_held(bo);
>>   
>> +		/*
>> +		 * Reject only WILLNEED mappings on DONTNEED/PURGED BOs. This
>> +		 * gates new vm_bind ioctls (user supplies WILLNEED) while
>> +		 * still allowing partial-unbind / remap splits whose new VMAs
>> +		 * inherit the parent's DONTNEED attr. It must also run before
>> +		 * xe_bo_willneed_get_locked() below so a 0->1 holder bump
>> +		 * cannot silently promote DONTNEED back to WILLNEED.
>> +		 */
>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
>> +			if (xe_bo_madv_is_dontneed(bo)) {
>> +				xe_vma_free(vma);
>> +				return ERR_PTR(-EBUSY);
>> +			}
>> +			if (xe_bo_is_purged(bo)) {
>> +				xe_vma_free(vma);
>> +				return ERR_PTR(-EINVAL);
>> +			}
>> +		}
>> +
>>   		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
>>   		if (IS_ERR(vm_bo)) {
>>   			xe_vma_free(vma);
>> @@ -1131,6 +1150,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		vma->gpuva.gem.offset = bo_offset_or_userptr;
>>   		drm_gpuva_link(&vma->gpuva, vm_bo);
>>   		drm_gpuvm_bo_put(vm_bo);
>> +
>> +		xe_bo_vma_count_inc_locked(bo);
>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_willneed_get_locked(bo);
>>   	} else /* userptr or null */ {
>>   		if (!is_null && !is_cpu_addr_mirror) {
>>   			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> @@ -1208,7 +1231,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   		xe_bo_assert_held(bo);
>>   
>>   		drm_gpuva_unlink(&vma->gpuva);
>> -		xe_bo_recompute_purgeable_state(bo);
>> +
>> +		xe_bo_vma_count_dec_locked(bo);
>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_willneed_put_locked(bo);
>>   	}
>>   
>>   	xe_vm_assert_held(vm);
>> @@ -3016,7 +3042,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>>    * @res_evict: Allow evicting resources during validation
>>    * @validate: Perform BO validation
>>    * @request_decompress: Request BO decompression
>> - * @check_purged: Reject operation if BO is purged
>> + * @check_purged: Reject operation if BO is DONTNEED or PURGED
>>    */
>>   struct xe_vma_lock_and_validate_flags {
>>   	u32 res_evict : 1;
>> @@ -3030,6 +3056,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>>   {
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	bool validate_bo = flags.validate;
>>   	int err = 0;
>>   
>>   	if (bo) {
>> @@ -3044,7 +3071,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>>   				err = -EINVAL; /* BO already purged */
>>   		}
>>   
>> -		if (!err && flags.validate)
>> +		/* Don't validate the BO for DONTNEED/PURGED remap remnants. */
>> +		if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_WILLNEED)
>> +			validate_bo = false;
>> +
>> +		if (!err && validate_bo)
>>   			err = xe_bo_validate(bo, vm,
>>   					     xe_vm_allow_vm_eviction(vm) &&
>>   					     flags.res_evict, exec);
>> @@ -3152,7 +3183,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   								    op->map.immediate,
>>   							.request_decompress =
>>   							op->map.request_decompress,
>> -							.check_purged = true,
>> +							.check_purged = false,
>>   						    });
>>   		break;
>>   	case DRM_GPUVA_OP_REMAP:
>> @@ -3174,7 +3205,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   							    .res_evict = res_evict,
>>   							    .validate = true,
>>   							    .request_decompress = false,
>> -							    .check_purged = true,
>> +							    .check_purged = false,
>>   						    });
>>   		if (!err && op->remap.next)
>>   			err = vma_lock_and_validate(exec, op->remap.next,
>> @@ -3182,7 +3213,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   							    .res_evict = res_evict,
>>   							    .validate = true,
>>   							    .request_decompress = false,
>> -							    .check_purged = true,
>> +							    .check_purged = false,
>>   						    });
>>   		break;
>>   	case DRM_GPUVA_OP_UNMAP:
>> @@ -3211,9 +3242,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   		}
>>   
>>   		/*
>> -		 * Prefetch attempts to migrate BO's backing store without
>> -		 * repopulating it first. Purged BOs have no backing store
>> -		 * to migrate, so reject the operation.
>> +		 * PREFETCH is the only op that still gates on BO purge state.
>> +		 * MAP/REMAP handle this inside xe_vma_create() so partial
>> +		 * unbind on a DONTNEED BO still works. PREFETCH skips
>> +		 * xe_vma_create() and would migrate a BO with no backing
>> +		 * store, so reject DONTNEED/PURGED here.
>>   		 */
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.prefetch.va),
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index c78906dea82b..c4fb29004195 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> -/**
>> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
>> - * @bo: Buffer object
>> - *
>> - * Prevent marking imported or exported dma-bufs as purgeable.
>> - * For imported BOs, Xe doesn't own the backing store and cannot
>> - * safely reclaim pages (exporter or other devices may still be
>> - * using them). For exported BOs, external devices may have active
>> - * mappings we cannot track.
>> - *
>> - * Return: true if BO is imported or exported, false otherwise
>> - */
>> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
>> -{
>> -	struct drm_gem_object *obj = &bo->ttm.base;
>> -
>> -	/* Imported: exporter owns backing store */
>> -	if (drm_gem_is_imported(obj))
>> -		return true;
>> -
>> -	/* Exported: external devices may be accessing */
>> -	if (obj->dma_buf)
>> -		return true;
>> -
>> -	return false;
>> -}
>> -
>> -/**
>> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
>> - *
>> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
>> - * one WILLNEED, or have no VMAs at all.
>> - *
>> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
>> - */
>> -enum xe_bo_vmas_purge_state {
>> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
>> -	XE_BO_VMAS_STATE_WILLNEED = 0,
>> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
>> -	XE_BO_VMAS_STATE_DONTNEED = 1,
>> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
>> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
>> -};
>> -
>> -/*
>> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
>> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
>> - * both enums so the single-line cast is always valid.
>> - */
>> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
>> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
>> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
>> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
>> -
>> -/**
>> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
>> - * @bo: Buffer object
>> - *
>> - * Check all VMAs across all VMs to determine aggregate purgeable state.
>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>> - *
>> - * Caller must hold BO dma-resv lock.
>> - *
>> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
>> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
>> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
>> - */
>> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>> -{
>> -	struct drm_gpuvm_bo *vm_bo;
>> -	struct drm_gpuva *gpuva;
>> -	struct drm_gem_object *obj = &bo->ttm.base;
>> -	bool has_vmas = false;
>> -
>> -	xe_bo_assert_held(bo);
>> -
>> -	/* Shared dma-bufs cannot be purgeable */
>> -	if (xe_bo_is_dmabuf_shared(bo))
>> -		return XE_BO_VMAS_STATE_WILLNEED;
>> -
>> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
>> -
>> -			has_vmas = true;
>> -
>> -			/* Any non-DONTNEED VMA prevents purging */
>> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
>> -				return XE_BO_VMAS_STATE_WILLNEED;
>> -		}
>> -	}
>> -
>> -	/*
>> -	 * No VMAs => preserve existing BO purgeable state.
>> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
>> -	 */
>> -	if (!has_vmas)
>> -		return XE_BO_VMAS_STATE_NO_VMAS;
>> -
>> -	return XE_BO_VMAS_STATE_DONTNEED;
>> -}
>> -
>> -/**
>> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
>> - * @bo: Buffer object
>> - *
>> - * Walk all VMAs to determine if BO should be purgeable or not.
>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>> - * If the BO has no VMAs the existing state is preserved.
>> - *
>> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
>> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
>> - * This is satisfied at both call sites:
>> - * - xe_vma_destroy(): holds vm->lock write
>> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
>> - *
>> - * Return: nothing
>> - */
>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>> -{
>> -	enum xe_bo_vmas_purge_state vma_state;
>> -
>> -	if (!bo)
>> -		return;
>> -
>> -	xe_bo_assert_held(bo);
>> -
>> -	/*
>> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
>> -	 * This matches i915 semantics where purged BOs are permanently invalid.
>> -	 */
>> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>> -		return;
>> -
>> -	vma_state = xe_bo_all_vmas_dontneed(bo);
>> -
>> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
>> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
>> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
>> -}
>> -
>>   /**
>>    * madvise_purgeable - Handle purgeable buffer object advice
>>    * @xe: XE device
>> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   		/* BO must be locked before modifying madv state */
>>   		xe_bo_assert_held(bo);
>>   
>> -		/* Skip shared dma-bufs - no PTEs to zap */
>> -		if (xe_bo_is_dmabuf_shared(bo)) {
>> -			vmas[i]->skip_invalidation = true;
>> -			continue;
>> -		}
>> -
>>   		/*
>>   		 * Once purged, always purged. Cannot transition back to WILLNEED.
>>   		 * This matches i915 semantics where purged BOs are permanently invalid.
>> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   
>>   		switch (op->purge_state_val.val) {
>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>>   			vmas[i]->skip_invalidation = true;
>> -
>> -			xe_bo_recompute_purgeable_state(bo);
>> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>> +				xe_bo_willneed_get_locked(bo);
>> +			}
>>   			break;
>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>>   			/*
>>   			 * Don't zap PTEs at DONTNEED time -- pages are still
>>   			 * alive. The zap happens in xe_bo_move_notify() right
>> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   			 */
>>   			vmas[i]->skip_invalidation = true;
>>   
>> -			xe_bo_recompute_purgeable_state(bo);
>> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>> +				xe_bo_willneed_put_locked(bo);
>> +			}
>>   			break;
>>   		default:
>>   			/* Should never hit - values validated in madvise_args_are_sane() */
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index 39acd2689ca0..a3078f634c7e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -13,6 +13,4 @@ struct xe_bo;
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>> -
>>   #endif
>> -- 
>> 2.43.0
>>
