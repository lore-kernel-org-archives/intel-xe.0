Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF62D3A675
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 17:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2610E190;
	Tue, 29 Oct 2024 17:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WE6tLmnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9087F10E190
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730222856; x=1761758856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+6smsLAkBS+0ovQ439V0Uky0DxdLprq2TnE2HaBTzmI=;
 b=WE6tLmnI1CcMP+kBXZL/66v/3h/Mk58NJN4zjoJ9Hw/HrdCzJFf6+t61
 JMrh8Hv1oG3ZwVsW7OC5cnTgNR28EsBAiJ2a55dl1mk+FnB1bLBT1JoSS
 nN4hFYNvZmCCYnC/jmv0oogdUTW76iA58vHHIX3nqasmqBDOULOBeJVD3
 qByXhMSzPDVVAlPO1e5g3keHM/kMp+8+jGiOY2fycbUeimwuUvqrKZ7Vg
 n9l679VP2yndxRmeE0UWq4BUF01029iOq1bQrcYqts55Mz82IUJQ2KOKD
 QI/yt4czPncEol7PGJVqy2eaU73fCQJg/RkVCW+7J9ugr9SZL9s354Lfb A==;
X-CSE-ConnectionGUID: sEtusX9zREaQVMwYEiKijg==
X-CSE-MsgGUID: oHvZhhLlQ76bud26BE7YRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40497795"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="40497795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 10:27:35 -0700
X-CSE-ConnectionGUID: kDE+f6n4QVS0XCCuBbHA4A==
X-CSE-MsgGUID: 02ftsSESRf+cEiTAwkBbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="119505368"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 10:27:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 10:27:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 10:27:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 10:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9xGudGMAy1T1+zYJJzE37vB97Fk6G+Y2g88jIuYiqAr0wK2lXXquOohrTKPhFqqdfRJP7r3080ZJIgN3kuCqY0pc4aoNTxr2NNZ8ACmnutfozviAfEVBjRkbRb/IoiveQbV4hOj8sKS0hxpN59VIO58ZTCbQQgUJruWorsw9o4gbySF3Gj52Hit0IYW9AQI7ugVNO2RcKHRrADitOLHecqEviOH6s7Gjla04Jg6ut8/2Iob1gCcpXP0nff99UVosFcH0zrwllHxt8jZ6Nb5vqFIbDJE10uTNFv9Bi0p2HHfcsgR+WI/Qhaehg02fYg+6F1C7XWksQjYG0OKQlLcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS49SV7XGjxSoP+U4GNrkihpleBWGRLC9gD7Ianr++4=;
 b=aFXc/1ohA/W9K9ML11rRXHFaK5GC9rvchdABgvgPaaKHDFB37soAgUFvy9nQY9q2w+DpISqvSCGNTKtyxaVrLCsKlXVJJZ/aD9Io0t7ktulyUbdL9NCB7A6g7gjcd7a1OEVgQc7usnFLPevkhd2Qwg9LZ5aIbYopfNeXSwNyYQwXTRZF4Lx50GhAiN8ZcMKCekokLA8LtTZqOsOGaxljZXoammBZj6R+2Of7laSc07QEj+vRlMSpwPL7EIAcpHtKH7Fgl3t35HaePj5dzAiqOHrmDklQzsAyGB82Y/SZna7nktCjCdBVRWbn3gVVMLQC1nEqU4xZGGz4u6xSuQhImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 17:27:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 17:27:30 +0000
Date: Tue, 29 Oct 2024 10:27:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <ZyEbAH60kKHDyA/m@orsosgc001>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
X-ClientProxiedBy: MW2PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:907:1::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0cdcd2-ae3d-4c3c-9705-08dcf83ef719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmFodjF1UGlib2FTOTlGYkhhV28veG96bFJWT0s2VGxGWHV3Kzl0WkFXUDlu?=
 =?utf-8?B?WFlqU3BFRDgxSUh5ZTVId2RKUEhONG5kTEp6aTBxWUg1SHc1UVUzUGRFK1NS?=
 =?utf-8?B?U1g4TjQzUXREa0pHT0ZwNk1kdjMwZWdmc0FyczVta2d3VU50R1JnN3Qyem9R?=
 =?utf-8?B?V3J2Q1RBY2VXU3ExKzNlUGlrSmkxa294dnRJYnFSWXpXN3lVeG5FWHRlVkRT?=
 =?utf-8?B?d0g2Ky9HR0hUVXVUR1YwVllSUFJUWGlrTFJ0dHVDYlVCaFk2cWM1RW14Nkh6?=
 =?utf-8?B?TkU4YXRKSWRCWGx1b1VlNmtJY1FneTArMW5jU3QrVlVQcEVETFlyeUlFdG8r?=
 =?utf-8?B?Z2ZZMTFjWGRWTFZabjJYS2ozb2JDZjljVFVLclBCUlFPWTBTRzBFNnRFeWps?=
 =?utf-8?B?ckMxK1VSREFGVjJiSXdEYmlnYWsyQ2JpUG1OYUdtMm41Qkc4YnFHelFsNncr?=
 =?utf-8?B?eTZ1MTQ3Nk5QNG1EdXhVcTlQeEtPNEw0VTFSenFaSER6cFJra3Z2RXVNdDRx?=
 =?utf-8?B?ckMrUW9hMU1mSFkyWXc5RlhYamhxajhlMWI1RjhSemQyVW9Pc2l4Z0t5aURv?=
 =?utf-8?B?dnlyV0ZwNU44aUl3bU9HeUEyUTc4NEhXVXkydEtRaXFpeUtQZ0haVEIraWpy?=
 =?utf-8?B?RmxyRkNtNVhiVzRPVXh5dGpiaUpqL1V1YnFaNU9GZWVtbkJkdkV2T1BuRlJK?=
 =?utf-8?B?eXpldS92VzgrdDZuVmpCWWFIWEtjbm5zL0E1L0ZNdmE1V014cnVieEdHOFY3?=
 =?utf-8?B?STQ3VFlvNnpScVRieVBtMm1MVUtxL01RWlI4NHZ4dzdaSzFqd052QTQ1VEEv?=
 =?utf-8?B?Wjlpay81cUlJWjFnVE92eUdEMzZqRHhYTFhoTzlZOXA3UXFVeUE0bTdQZjQr?=
 =?utf-8?B?ZmYxWk5vMm16Q3NJTnBPR2hraDBwL3BCWkJvSXNKeGZwZGlMdlZadlM1SHZX?=
 =?utf-8?B?RzVsT0JiKzVWY21lWVR0M1dVQ1ZKZzlnU0h2N1FITVdiaDJGRGg3WjEyZWVx?=
 =?utf-8?B?Tm9IN1h1MmorQWRlQ1JUWVVsalcvYkZtdnZKS1VlVGNzc0JINEszNjhKT2Zh?=
 =?utf-8?B?enNwZjZZdktoRUhJbkpJRFFtalJnS3ptVkkvY2EvRjlOWmJkZE1vTk1QcFJ4?=
 =?utf-8?B?RmpTNUNxbHB3dUlLbzc5YXVtUWF6N2M4WmtuRTNBRDlWaU5NT29GQ3YvbkZZ?=
 =?utf-8?B?K3NLR2JRRklKcjd4QmFjeXMzemxveGhWcUJpWnBnZUxZRlIxV2x1S2t1bHRs?=
 =?utf-8?B?aVlyRldtNUIxckFlWXFUSWY2RjdLZ2FUc2NBcGcyZ2pXZENFWVd1bXlrL3Jo?=
 =?utf-8?B?Q3FxY3kvVFgxM3RZcHIvbnBhK3dQYXgyYXpySWFWQVN0YjZJRTZkZXdsZFls?=
 =?utf-8?B?U29CdXAyVThtTmpLNVZNa0grNitXMFNnZ3dGRy9KVGk1dmxWT0lrcEJBdEZN?=
 =?utf-8?B?OUpUdjZHN1RRSHVrZ2dwd1dmVFRGaVBaMXpBU2VQTTh1WFVTWTRmRDdPOHo1?=
 =?utf-8?B?bVhzUjR6aklvNThaUE9kM1BidlBMZ2l4aktBWXc3NU1lZGNrekQyV0hUdS95?=
 =?utf-8?B?c0xSYUNtSFdaVHBPa0RzTkkwVHJaVHlBb1p5M2g3cmhNNW8xN2V3MFF4QUhw?=
 =?utf-8?B?d1FFOWFFRmt3STFUTjBLazFwM1NvVUZMNnFvdzVXa3VkeVlXTG1ZOHZCRHlS?=
 =?utf-8?Q?lY9oSe9cw2KqsuMaXk/O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NXVHZyazkwQWtjZkk1NGVaWUJ2K0VhTTJDUHM4ck5zQ2VxeVJvdmE3NmN5?=
 =?utf-8?B?azIyZ2lxUzduc2NVVjcxcTl4SC8zd3laOTNOVkg5YWlsQzllTm5tb3JxeCs3?=
 =?utf-8?B?bUJqRm9qR1ltdFZTUXdXcE1sWkNYWkJRTjBWYVpteEoyajhKYjhKZWZvQXdu?=
 =?utf-8?B?eklMTE5XSmxUeFl5U3RWOU1NOTNRdjAreUs2R3lvbTlVcFE3WUJPT2xWV2dk?=
 =?utf-8?B?bHNEWnFpakJiUEpqcVkvL3kxekJ0c0NYenRJMHByZXJDTzNHRDBjbkVvb09X?=
 =?utf-8?B?QlV5alRyWHFQMjVNTDdUd1pEaVBvS2VnZG1aR0Y1OXY1bGUvUTlkSkdSZ2hR?=
 =?utf-8?B?NFJURVJ0Yzh3UEp4YkoyNitBeE1uRzhmYndIMlllMm9QZytQNUFmMTh3Y3dY?=
 =?utf-8?B?VWZnVzNmdHdtb3Jmb1FXVGh1L2hwZFRicW9uajBrdXcxaVZDYjZPWG56SGx1?=
 =?utf-8?B?Y1ZpeUdkdzNudXZuV2dXYXVKd0poOUlYcE0yTExTWmtmamNENE12QysveEp6?=
 =?utf-8?B?MUtNdzg4eUtmbDd2Zmh4Q0RGZENaTWp3UjRCWU56LzRTdGNFYUxhVzZ2ZHg1?=
 =?utf-8?B?TWpzWEdYdUsyMTU3UnduazI4MmRBNUR3QTI4by94a21Gd2hRc3RmT3MwM3Ja?=
 =?utf-8?B?QXZhOFk5dlpPQnhDZ1RvbUtvakhPL2pxZ25xSS91NEtOVTVpK3RpYVJHTURl?=
 =?utf-8?B?N0NzYnhnK1JyNmMyREV0Tzg5UEJDeFA1am1QTWlGMmp1Vys2dHV0L2pXaUVC?=
 =?utf-8?B?aktvczR0d0E0eDZLcUptakpNNEtkbEZUUGFpUlRiZFJNeTlWOFMrZlFIMnd3?=
 =?utf-8?B?UTlOTDBSQlZpTXplWXZFU2plQk1oUmNXSm01SXN3ZHZoQzM1SHk1dnJaSTl2?=
 =?utf-8?B?ay9HMWpjeGh4MmN1dWFPM3dkemtYSU92RG5TYlBUQmphNEtlNnVVSCs3YU1S?=
 =?utf-8?B?RjJ0dlRsYnBHQnZhNHdaUFU4MGRKTVpKY2IwZTRNTXcrVGNtM3pXRTVGZDA1?=
 =?utf-8?B?cDl5TEEvYVJmSXI3dDRYRTg3ZzJBNHREVzJPNjRlc0tHQ0x4YUI4ZVFBeEps?=
 =?utf-8?B?SDBHSjZKcjBiNWhoQ1piWGl1RXFWUDJWbkVtN1hzSnVtWFdBdXREV0VuV1d4?=
 =?utf-8?B?K004a2Ztd1FNYmlhVS9PUEtvOHQwSDlBWnR3MGNCQkQ1dElOdG5HNWpjS0hs?=
 =?utf-8?B?b3hyMmV4WDdTVDZiTWNmLzVRUFpST290bmpvMkdpdnorTUg5a2Z6U2lMLytt?=
 =?utf-8?B?QVVhTlpUblVTamlOalZXd3ltNEhqTW45SlpJeVAxeERoeUdPVTNya3A3SlF2?=
 =?utf-8?B?OWVOcVVCVituT0wralpTSXpHcGNKM2xBcU03Qk5HNkZTemZIbmwvZit1MEFR?=
 =?utf-8?B?dXc2eGhJU2NldkNNanJmMVZNUXlxUjRqZXdhVm1PZWpxcmtzcXZMV1d6OUNL?=
 =?utf-8?B?b0VscEZDaGJXRWViam1MazN4WUY5ZlZYa2Q3Q3NLNGRYdHZKMU5oK1k3Skk1?=
 =?utf-8?B?SCtOdFVGSlQ1bGlIRlFTNU9CVWorcTJEUnlEZnZvT3JUdy9ZRldLSHNqSHZw?=
 =?utf-8?B?OGg3MDR5NXBVbjc5c0JEQ2ExRzBNLzVFdkhqQy92TEpSYVAvQitRT2tNWnBE?=
 =?utf-8?B?aFZCOHpTa2ZnQ3hwLzBRQjZ5VEFpVW1wbk5jTWRPdGVqKzkza21wbHFrdE1m?=
 =?utf-8?B?WFZqcVlnOTRETGJqY2haTWNnbEZ5UURsZ1NmZ0tDT3NhZFRibVhHd2FLL2Nl?=
 =?utf-8?B?MTA5TFZYR0IrRnZ2ejl1SmxKS094VkNHY0ViNzBnZklJdXg1ajZ2eTU0MDdY?=
 =?utf-8?B?SmpjZVFYUmVyYTAzWXo3QXBISTVQdjdkVURSNWlCNElhd1RsSEZwTFMxZFNS?=
 =?utf-8?B?QW5DUXcxME5SVGdUMHQwTktTV2ZOUjB2QkF0NzZiQUdpL2pNSS9VKzFlYmx0?=
 =?utf-8?B?SkpLanBTRW1qYTE1NHEwRWU0NFdxenp3Q05HSGNabVF0a2dpL05Cc25LYWIv?=
 =?utf-8?B?NmRsOUVPcjgyeTBJUDlKb2M5QitLaURxTUhEU2ZpWW1HcStRZHVEdFhpM2M5?=
 =?utf-8?B?TElzZzdlTnUra2IrcUtSeWRtVnBXZXRWaGFnRWt0U0dFdG50SXgzRTJHcWJN?=
 =?utf-8?B?SGlVTVNrRGtWQ29kQ3dCYTNuUjQ5dmVtZVN6SkNGaUJtK1lYNlo0RzRkZkRi?=
 =?utf-8?Q?HbKopjvMrtD0bS63KDgWNWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0cdcd2-ae3d-4c3c-9705-08dcf83ef719
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:27:29.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW9P0x6Lbro4/FTDtzIR0lIabmCKqpOS1Y/CVBAX1mBSxgZcairqoLMz98xrTHJt8m+Jr7qPf84liWfBezU8wj30MYQfetEUjCWOZnmpXmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
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

On Mon, Oct 28, 2024 at 05:32:03PM -0500, Lucas De Marchi wrote:
>On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
>>On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>>>When the exec queue is destroyed, there's a race between a query to the
>>>fdinfo and the exec queue value being updated: after the destroy ioctl,
>>>if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>>>the wrong utilization is reported: it's not accumulated on the query
>>>since the queue was removed from the array, and the value wasn't updated
>>>yet by the free_job().
>>>
>>>Explicitly accumulate the engine utilization so the right value is
>>>visible after the ioctl return.
>>>
>>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>>>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>>>1 file changed, 8 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>index d098d2dd1b2d..b15ca84b2422 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>++ b/drivers/gpu/drm/xe/xe_exec_quee.c
>>>@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>>
>>>	xe_exec_queue_kill(q);
>>>
>>>+	/*
>>>+	 * After killing and destroying the exec queue, make sure userspace has
>>>+	 * an updated view of the run ticks, regardless if this was the last
>>>+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>>>+	 * query to fdinfo after this returns could not account for this load.
>>>+	 */
>>>+	xe_exec_queue_update_run_ticks(q);
>>>+
>>
>>At this point we may/may-not have the updated LRC timestamp.
>>
>>fwiu, xe_exec_queue_kill() is an async call. It will queue a work 
>>that will disable guc scheduling on the context. Once guc notifies 
>>KMD that scheduling is disabled on this context, KMD knows for sure 
>>that the context has switched out and the lrc timestamp is updated 
>>for this
>
>ok. do you know what's that notification? Is it the cleanup that we
>process at __guc_exec_queue_process_msg_cleanup() ?  (which is where I'm
>moving the io read to in the other patch)
>
>>context. It may work well for contexts that switch frequently and 
>>may not work for contexts that seldom switch or never destroy their 
>>exec queue.
>
>why does it matter? it's only for contexts going away - for context that
>are scheduled out the sampling on fdinfo read covers it. Note that this
>call is not replacing other calls. If the exec queue is not destroyed,
>the other 2 places should still cover it.
>
>The problem with the case when the destroy ioctl is called is that q is
>removed from xef->exec_queue.xa, so the additional call in fdinfo-read stops
>working. It  then relies on the last job completing and being released before
>a read on the fdinfo. As CI shows, this is racy and fails in ~10% of
>the cases.
>
>On a remote system I got it was failing ~20% of the time
>
>>
>>I still believe calling it from job free is the right thing to do. 
>>As for the ~120 Hz updates, these are just memory updates, so not 
>>sure if it's a huge performance impact.
>
>it seems now you are commenting on the change in the other patch?

sorry, I will try to be more clear here.

patch 3/3:

I missed the fact that the updates could be in VRAM, so moving the 
update out of job_free makes sense. 

Also since fdinfo query is expected to be frequent enough, adding the update 
to exec_queue_fini makes sense too.

patch 2/3 (everything below)

it's just the update in destroy_ioctl that I am not convinced about since 
the kill is async. Also you see another instance of failure already below.

>
>I think it's pretty pointless to do the io access when nobody cares
>about that number. The user needs to be reading the fdinfo, probably
>through gputop or the like for the number to be meaningful. So why do we
>care about sampling it at a high frequency when nobody is looking? For
>real, non-CI use-cases it should be as good as before.  The difference
>is that instead of getting 120 updates of few cycles, we are getting
>just 1 with the amount of cycles that got used in the last sampling
>period.
>
>Looking at the traces we do get a few low-msec execution time for
>xe_lrc_update_timestamp(). Mind you, there's another race about updating
>u32 in xef in a non-atomic way and doing it that frequently just makes
>it more likely to happen. That still needs a separate fix.
>
>Goal of this series is to make this work:
>
>	$ for ((i=0; i < 100; i++)); do echo $i/100 >&2; if ! ./build/tests/xe_drm_fdinfo; then break; fi; done
>
>I was happy when sending this that it passed. But just double checking
>on another host, the issue is still there and I get this after 16
>iterations:
>
>Starting subtest: utilization-single-full-load-destroy-queue
>....
>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>****  END  ****
>
>which makes me think it's probably related to the kill being async as
>you mentioned.
>
>I wonder if we should synchronize the call in the fdinfo read with the
>queues that are going away.

Hmm, maybe.

I was of the opinion that we should solve it in Xe by adding an update call 
in an additional place (like you are doing), but after digging into it a 
bit, I am not sure if we should resolve this specific issue. Instead, we 
should alter the test to not check for accuracy when the queue is destroyed 
before taking the second sample. We know that the ticks will get 
updated at some reasonable point in future and the user will see it in 
subsequent fdinfo queries anyways. If that "reasonable point in future" is 
unacceptably large, then I think the problem is outside the PCEU domain.

Note that the original reason we added the test was to catch the ref count 
issue with xef object (which is now fixed).

>
>Another thought I had was to use the wabb, but afaics we can only
>execute something on context restore, not on context save.

I am curious what you want to run in context save though and how it's any 
different from what's happening now - CTX_TIMESTAMP is being updated on 
save.

>
>>
>>If the ftrace is getting filed up, we could throttle that.
>
>oh no, that is definitely not what I want. If we enable the tracepoint, we
>want to see it, not artifically drop the events.
>
>Initially (and to get a good measure of function runtime), I was
>actually using retsnoop rather than using the previously non-existent
>tracepoint:
>
>	retsnoop -e xe_lrc_update_timestamp -e xe_lrc_create -e xe_lrc_destroy  -S -A -C args.fmt-max-arg-width=0

Didn't know that. That's ^ useful.

Thanks,
Umesh
>
>Lucas De Marchi
>
>>
>>Thanks,
>>Umesh
>>
>>>	trace_xe_exec_queue_close(q);
>>>	xe_exec_queue_put(q);
>>>
>>>-- 
>>>2.47.0
>>>
