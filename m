Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F2D3ABF0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 19:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DEE10E512;
	Mon, 11 Nov 2024 19:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MggDvL6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D96810E510
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731351674; x=1762887674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b+ziud/FLEjKTxxb7DFQK6iZEzXz2CMVXXFa964p1tA=;
 b=MggDvL6rehG85hrMdkNpj0FZu0PExlSJhnxkq6Qxz+wC3kVUE/i5WfOO
 GFTHlHj7G+dHGFhlM/i7tjl4kJetUex2LLyKteEUPuNmVe0EalN+xv0la
 mcJJvtXzsQeGjxTXuD29FReBGZZJH80RHERfq/TkJzLK2bUa0zPMyrfQM
 wJrLaA5uz2JGlTEff/u7KyHBV19JA/u0HEFRaMPDj94t4H1mCeKFzpTJn
 O1B7lXgU1vyiQO3pTv5NQr+HdGMmu7l5lIKwKQLpiILlbt+cHQmz3LnoN
 94wgw+6sDVr2IWFDvwD4951LW0ewm3qdIoVCifTQLVeMUiX8V1ZRiI5k3 A==;
X-CSE-ConnectionGUID: LSy57vHISciCB8FdiG8PdA==
X-CSE-MsgGUID: CBI8fp2nQgGPcxLPAAenWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31398485"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="31398485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 11:01:14 -0800
X-CSE-ConnectionGUID: MwrWCQy6T++FwxrFjOF8cg==
X-CSE-MsgGUID: g19l1+qeSaKv/18M5mGDVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="87860308"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 11:01:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 11:01:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 11:01:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 11:01:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tA/MrCoyTfeml3is5HQ3Izmt00pA/DZrTNWrLQL40jValxeRtLOWmshKVQY4krFRrj06Bb+C+xIbx1v66odetKGykPJrEaBLPBRzkrQLr1gS8Dxviyzh3KTYkfJ2cbB5jmmZ2f42bjw9yWqtqB+zJNewGv4k7N5E42dBpUr0c/Pe32lfxnV5KXNAZ+CQpeUtJdwqJaTch+Rvl8tqW32oXJqYBj9OA02XSTyxsDAERpffWHQr9xZbunVjAII8bTNMTNkvjCdVWPhn4bGWVAOvh0t4DaZT1v4wfNzvYh3l4WDx0mIV/1JfZ3PwG/9Rzy7DqmJk9hIUzicTZKMSkiMQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjdT5ggSlo0Mj0KVseceqKqlhw8emCaqyY1OQjNHx7g=;
 b=MCq7qkCK2E13K3H2dQWOxzBpQao/ztQzq2ih8loqkBg842MlFDeeRPyk2SkZ1AVrjXc+fDLfq3lDTfo26qyqcvoiyGiLKSEkPQ3nVMcPtl1GXagG1bwqpD4A9raw916G8dlPULXJ5L2sVW0E3qmQtOgmynWqnyYwRxeB49Lp9AOehc/EtOmmOglwoEkV6CjWCdDGmKfZwF/SS5KWSKeQ5Ibw5F7qJYLujsdWy9gO3OQaSnql/UA95jUTiinmStSdqGgg+UR2nZxY75xTP2+PBnVhC6nsSvY/F5jeKl+kkJl3lWnlP2BakMCU2UGGGbZna/3wuU7Pvf0zQ7sWxOLHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 19:01:00 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 19:01:00 +0000
Message-ID: <e60deef7-d1e2-4531-9bd4-38bbaf147a5e@intel.com>
Date: Mon, 11 Nov 2024 14:00:57 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Re?=
 =?UTF-8?Q?move_duplicate_source_field_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241107213841.436384-1-zhanjun.dong@intel.com>
 <173113050737.1605697.4242565822936779330@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173113050737.1605697.4242565822936779330@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV2PR11MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbcb8e3-5b98-4cab-2ded-08dd02832e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi9GN1F0V002ZEhZZ0l4Vzc2NGNFMmRGSXg2MnpITEJ1cU1BV1NLeXR5MlR6?=
 =?utf-8?B?YU9oQ2tQTWFVQkNpN0dYeDFyL29idlFkdGlEV1ZkOXc3SkNDcXpmeXkzZjk0?=
 =?utf-8?B?cEgxUm5IMnNicHhOb3Y3cllZcEFpK24ydVg3RC9aUHNXWithQVZSb1NzbGZ6?=
 =?utf-8?B?d0JtME5hWXB0TldrZHNyQ0lQY3Qxdmwwa2VhWmVJWUdDOVJPTWRldXMxcnpi?=
 =?utf-8?B?MW9rTVptZzlrQ0l1THFzc3BHOVBlOGRhTmlGZGw0L3NtY25nYTVQOGNLWTlK?=
 =?utf-8?B?clpYVDdBN3RSQlNXWElZYXZvSG44cVJjWGVrem1VWTNncGlTeEZac200OUFm?=
 =?utf-8?B?Ky9pMVZ0SE05eEpGZzJWNzBiY01nUU1PY2pZS2Y3aTRhZ2dITDA4TFF1aEg2?=
 =?utf-8?B?emUwOUpHL0R1eVUzbXBJZ0EzcExBSUxzZXVsbm9oVmF6TVRHd2wzYW9oZFJy?=
 =?utf-8?B?UGloRTR6OG0zL2dKa3pSNW9oL2FtSFpPUlFTYldQYzFobFpaUXZDbUdnQXBk?=
 =?utf-8?B?d1ZZRXZvbElzVkh4RFkxclQ2R0RQYlNBeENlV0k5bVlCZjlxLzVnUHV2UWdp?=
 =?utf-8?B?TEhPL0U0dkpMTExacklVSkpiaFBsZDQ4ckZmYURybTRvbXByWTlFa3BRSnZm?=
 =?utf-8?B?a1crRDV3a1JvZHFtbk1mdlpoVUw4M1lmNzZNMzIyVm4wSVBSbml2eEVTeEds?=
 =?utf-8?B?ZlFEZHdRY1NwSXd4dXRqQkdGalZMOWxuR0RYSWhGUmFrRG53V09sSGVyOS9i?=
 =?utf-8?B?S08rY2NOTGE0RXZJM1N2a2FYVUorYXErRTM5dnlKTnV6TUZEQ28rbXFPclov?=
 =?utf-8?B?MGxhQUgxSllIZWJxLzFvNVZtUWpmNFpnaHJTZ283eVFpVUlRY2p5YVRnQkt5?=
 =?utf-8?B?ZGE2NlFKSWdmY2Q3MWZid01GKzRObFpVT2pvaUlxUGx0R2I2Zk5TUGFBV0xC?=
 =?utf-8?B?cnJsb1lkWksyWTFpOFhRSzkxUkNOYXdhYmZzTDR4RTlhV2tabFFTdjVGSEtI?=
 =?utf-8?B?ZzJtMXpTU3R0RUpqdysrSldlZ3EzMEFsVkdRbnRGT1F6cENnY2hoUkp0RGNp?=
 =?utf-8?B?bWJ3U0RhOC9jOVR3TFdoRjVmSkJoemdEZlhQMS9zMEtqTlBWWXFjUFhJVmJM?=
 =?utf-8?B?cXpYQUYxMDVscVR4OXpqWnF2eDlIWWdYazNzK2w0eWJ0LzNjdmNZa0pZZU9D?=
 =?utf-8?B?Y1dwakFvVzNSUE8vWnhNalZHait6a3d2SXlOcWw1ak5sRWJjd2dObjdJMGdr?=
 =?utf-8?B?bTBsMklYcHdtZ2gzMzRKNjFodTIrWFNVNkRDN2xTKy9wVitPRzhhOXBFczU5?=
 =?utf-8?B?T3NoR25kYVd0alh5Z3NaR1pPSFdlNnF5ZG1nT0liMUErZWhpNU84eFFOcnJl?=
 =?utf-8?B?bU9EK1hMRklYRkpBTEhSK3ZUSkJTdWtjbE16U1dMSlR1WFdremlBZS81MCtv?=
 =?utf-8?B?dndyTWljVE9SMUlPM0dwZHhYWllrWnVjUzlaZEJHcUpqMEdwOE9rV25qRHNL?=
 =?utf-8?B?OTlkczlBejZ3VWo3R2txNmNpdTJJN0IzL0RhNWIvek1FenVWSkdRY0NIdUlB?=
 =?utf-8?B?bS9UbDk1eHkraUZ1UEoxWWs1Qmtlamt5RThYNy9SUkJINU1CREhJdlRHUndY?=
 =?utf-8?B?bEhndVUwa2lZem43dnpNaDdIbURTVDFOTUVaNTQ3b3M2NW9sOGZUa2ZUVVo0?=
 =?utf-8?Q?KGEe4FjS4YlzLcWQnWDC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2lKWFFtRlU2T0pxbWpzSzZCUTAzbVZQQUdBZkY5bzFqTHRhcE1mUUVHYnFj?=
 =?utf-8?B?N0hQZy82WVRoMmFqL0EwVTZWYXg1SEJ2eStzNVpUc2tBaHhzUkwyWkRxMGRD?=
 =?utf-8?B?UmRBb2Y0dkdYQUNhTU9DcWFrQlpZWlhHTUh5b0psNjc2SEZyVVBvcXl0S2RL?=
 =?utf-8?B?bitod3R4RXgxbG1XZlhZbnhPVlNMTmJhUkw2dlZkK25ySmFyazVvUEhDbHpU?=
 =?utf-8?B?cmFuV0RWajI3Z0QreENCNllIWDRMUEwxWW9TVEZNV0pwRXAxN1lTL29KbkFn?=
 =?utf-8?B?RzRMMFpnNEs1b1NadUJDYkc4VW80ZGo4bU1FRS9IcXEvRTZwb25ObFByeGhu?=
 =?utf-8?B?aTArbi9YaWE5a0pGTzQ3K1FOKzlmU0RZcUdiODRlOGJOZVdyV0lKR2hacWQ5?=
 =?utf-8?B?cU8vN2lWNE50aGxKKzJrZ1pyeUFselhGQTJ6YWRCQ0RxVDU5N083VDRRdUtS?=
 =?utf-8?B?ZG5VclNYcEp2ZzJ2eGtqQlhHUnd0eVlqdlV1VGYvZWN4b3IycVJEbHJ0QWRE?=
 =?utf-8?B?YzIzWHRJTmpQQnlReXFmaStFV1cveWpVemszRVJiN2J3YUI0T2MyN2c4QnVF?=
 =?utf-8?B?aFRYd3JpOGdGTXg5TjVYTDAzYkNHd1NhblZRaDg1WVUxUWxNUUd2UDRUaE15?=
 =?utf-8?B?V2FMNXduN3BXNzlCR2w1MndodS83angvd1pzOGMvZTU0c3lBUFc5bkgxekVi?=
 =?utf-8?B?SXYxVmhYWjJPTmlkVUpFempCU0lLUGp2Z2hIeVZoSHI0Rjg1QmN5aW5QZ2Jl?=
 =?utf-8?B?QzlTbHdMb1BLOVUxUGZVRC9ud1BVZ2VGYUNhc28yU3gyNEVRTU9sWG82TERW?=
 =?utf-8?B?VWZvQUZOVG5jZzB4dGxGT2RBc1pLOUM0K2h0a1d4RGk2RmV1eXRSaXhjdDIv?=
 =?utf-8?B?N3lLN3A0TmJYa3VaWUpFS0lYWlZucWhHakxFQjIrZ0pxUGNZMldVMkZTMEM3?=
 =?utf-8?B?L1phaEtZb29KNExZaGhJY1V6TDFVZEh5Y1V1clBsOU1IZnJSaGNmVStRRElL?=
 =?utf-8?B?QkI1cUtpc3BOdG9RNy9iVWlQc1BlNzdwRDNrMkFwOHB1dmtYc2FRYk9BeDFy?=
 =?utf-8?B?Y1lzcVltY3VmS0pLVlNuVE1BWVNzbndKUmx6UTNtWG83cE9lU0dsc1hRYktJ?=
 =?utf-8?B?bGk0cDFGSnQ4TFFFeGdwUDVlUzZ3Z09hTkgvY0UydzBpck1tbENSYU1Ib0NY?=
 =?utf-8?B?V1liS1lwRjZMclBRVmFLV2dZaUdzKzRzQ3ZxenVJanFlYUpBd0FyaGlQZmZr?=
 =?utf-8?B?NlllYTJ3WDNxd2M2SUwzRml2TEEwRmhSTWthWFNtZVBkWkJzZWQwWk9sT09o?=
 =?utf-8?B?WWVJVW5ZTFdQNGk0bExNVHl6ci81YlVYMEMvd0ViZ0o3TDNTNlRuMllWTjNj?=
 =?utf-8?B?ZjJyS3o1UEtCTnc1YXhEbGJtbksxUGpqbmJ3MnBGc0d5QnJaN0xtMXVxSlA3?=
 =?utf-8?B?ZFphVFRQZjN1aVNENzlqUWFrbG1rRGpxdDRsY0RCMXZyYm5qZXJic00rKzZZ?=
 =?utf-8?B?bDYzbGM0RDQ0RG1iMHdGYlBFUkcvM2ZjSjN4anUyY0NvTWZCNTJaamgwL1pC?=
 =?utf-8?B?eWhJS01NWG41aTZwVmsyMmJ1enE1MHYyYVB1elgvaTRrdlJmMGl4cysvNGxw?=
 =?utf-8?B?ZUlyVEtRalJkVmx3dkVreHN5UmlCYXNndGRWMkhkVGpSdUdGUi93ZklLRDhi?=
 =?utf-8?B?WUViN2N3VXp5QXNvKzJqSitaUnFoR3oyZnpZTk56bFpEOTJWYUZ5bDU2UmtR?=
 =?utf-8?B?bjBWa2hmZ3hyUVI3dW5KMTFyNUpkbEZZaWYvVTFLVi9SRTBIS1l1Y1Y4bmFr?=
 =?utf-8?B?Z3U4bVZaNnZ2WmpNZFJxaTVTTU80MFZlTjQ0TEhTTkJKc1V2SlYxV1hvN0p3?=
 =?utf-8?B?TTNOMUV0SUFpVWR1enRMRW9oUzJkN25tdTloU2ZvSGErclJDNzB4RW0xR1lY?=
 =?utf-8?B?ZmlRc1gyMS9wU0RrVEFUZHhWa1A1Q1ZDV2NNdForcGxPYkpUK0FKbnNaQkNw?=
 =?utf-8?B?NTFMZEx0Y3IrWk1nYmRjN2dDYXpLTDY4cWI5VTRGRkNGTGEvYWJ6MjQ0ZDdN?=
 =?utf-8?B?UXhFSXpoZXgxR3B1Z00zMVZnL3BhNnZzRUliUHdCcy9oaEZTMWQ2WGtGTGR3?=
 =?utf-8?Q?ranKIFaH5FyyB+7IQm5ZVr3RD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbcb8e3-5b98-4cab-2ded-08dd02832e7c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 19:01:00.4389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgFGTqg47PDb9siHOCkRKsfum49hLn0n3s+VQr6hR1o0F2uJP4tR/uzvEL4KyNzTnj36fZf1GFHAEE5BB0DR6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
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



On 2024-11-09 12:35 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Remove duplicate source field (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/141033/ <https:// 
> patchwork.freedesktop.org/series/141033/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-2185-
>   a1fa8135081e9c259deee601ef3dc945af012447_full -> xe-pw-141033v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-141033v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-141033v2_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-141033v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@torture-move@all-pipes:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_cursor_legacy@torture-move@all-pipes.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-463/igt@kms_cursor_legacy@torture-move@all-pipes.html>
>   *
This failure is not related to this patch.

> 
>     igt@kms_flip@bo-too-big@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-3/
>         igt@kms_flip@bo-too-big@c-edp1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-lnl-1/
>         igt@kms_flip@bo-too-big@c-edp1.html> +1 other test fail
>   *
This display failure is not related to this patch.
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_rotation_crc@bad-
>         tiling.html>
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_rotation_crc@sprite-rotation-270.html>
>   *
Above 2 skip is not related to this patch.
> 
>     igt@kms_vblank@query-forked-hang@pipe-d-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-4/
>         igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         bmg-5/igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html> +1
>         other test incomplete

This incompelted test is not related to this patch.

Overall, all failures is not related to this patch.

Regards,
Zhanjun Dong

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-141033v2_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_getstats:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@core_getstats.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@core_getstats.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1 other test
>         skip
>   *
> 
>     igt@core_hotunplug@hotreplug-lateclose:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@core_hotunplug@hotreplug-lateclose.html> (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>   *
> 
>     igt@core_hotunplug@unplug-rescan:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@core_hotunplug@unplug-rescan.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@core_hotunplug@unplug-rescan.html> (Intel XE#1885 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) +1 other test
>         skip
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-8/
>         igt@kms_atomic_transition@modeset-transition-nonblocking.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-141033v2/shard-lnl-5/igt@kms_atomic_transition@modeset-
>         transition-nonblocking.html> (Intel XE#1701 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test
>         fail
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +50 other
>         tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-7/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-
>         modeset-transition@pipe-a-dp-2.html> (Intel XE#1426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_big_fb@linear-8bpp-
>         rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-180.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_big_fb@y-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_big_fb@yf-
>         tiled-64bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_big_fb@yf-
>         tiled-8bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_bw@connected-
>         linear-tiling-2-displays-3840x2160p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_bw@connected-
>         linear-tiling-3-displays-1920x1080p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_bw@linear-
>         tiling-3-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_ccs@crc-
>         primary-rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_ccs@crc-primary-
>         rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +20
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-433/igt@kms_ccs@crc-
>         sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +121 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-432/igt@kms_ccs@missing-
>         ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +29 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>         (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-432/igt@kms_cdclk@mode-
>         transition@pipe-d-dp-4.html> (Intel XE#314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests
>         skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-464/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-
>         hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/373>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-
>         hpd-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_color@ctm-0-25@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-1/
>         igt@kms_color@ctm-0-25@pipe-c-edp-1.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         lnl-8/igt@kms_color@ctm-0-25@pipe-c-edp-1.html> (Intel XE#2929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) +1
>         other test dmesg-warn
>   *
> 
>     igt@kms_color@degamma:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_color@degamma.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +34 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-463/
>         igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_content_protection@legacy@pipe-a-dp-5.html> (Intel
>         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_content_protection@uevent@pipe-a-dp-5.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_cursor_crc@cursor-
>         onscreen-32x10.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> (Intel XE#308 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +4 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_cursor_legacy@torture-move.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-463/
>         igt@kms_cursor_legacy@torture-move.html> (Intel XE#3184
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_feature_discovery@display-2x.html> (Intel XE#702
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/702>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-
>         panning-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1 other test skip
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-8/
>         igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-7/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-
>         dp2.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301>) +2 other tests fail
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-9/
>         igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-2/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html> (Intel
>         XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1401> / Intel XE#1745 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +12 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-
>         blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-141033v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-pri-indfb-draw-blt.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +17 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +8 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) +31 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/656>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +13 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_getfb@getfb-
>         reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/605>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-bmg-6/igt@kms_hdr@brightness-with-
>         hdr@pipe-a-hdmi-a-3.html> (Intel XE#3312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3312>)
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-466/
>         igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-432/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@kms_panel_fitting@legacy.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other
>         tests skip
>   *
> 
>     igt@kms_plane@pixel-format:
> 
>       o shard-adlp: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_plane@pixel-
>         format.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1035>)
>   *
> 
>     igt@kms_plane@pixel-format@pipe-a-plane-3:
> 
>       o shard-adlp: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_plane@pixel-
>         format@pipe-a-plane-3.html> (Intel XE#2078 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1 other test
>         warn
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/361>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html>
>         (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_plane_scaling@planes-unity-scaling-downscale-
>         factor-0-25@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-5@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_pm_dc@deep-
>         pkgc.html> (Intel XE#2007 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2007>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (Intel
>         XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2446>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_pm_rpm@modeset-non-
>         lpsp-stress-no-wait.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
>         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/igt@kms_psr2_sf@fbc-
>         pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@kms_psr@fbc-psr-
>         sprite-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@kms_psr@pr-sprite-
>         plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-8/
>         igt@kms_setmode@basic.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-lnl-5/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +1 other test
>         fail
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_setmode@clone-
>         exclusive-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (Intel XE#362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-7/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-
>         edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/899>) +1 other test fail
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-7/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-lnl-8/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test
>         fail
>   *
> 
>     igt@testdisplay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/igt@testdisplay.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423>) +1 other test skip
>   *
> 
>     igt@xe_ccs@block-multicopy-compressed:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_ccs@block-multicopy-
>         compressed.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455> / Intel XE#488 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@xe_copy_basic@mem-copy-linear-0xfd.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-1/igt@xe_copy_basic@mem-set-
>         linear-0x369.html> (Intel XE#1126 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@xe_drm_fdinfo@utilization-single-full-load-destroy-
>         queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2667>)
>   *
> 
>     igt@xe_eudebug@discovery-race-vmbind:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_eudebug@discovery-
>         race-vmbind.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@sysfs-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/igt@xe_eudebug@sysfs-
>         toggle.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +5 other tests skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/
>         igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-
>         sram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-7/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-141033v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@xe_evict@evict-mixed-
>         threads-large-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_evict@evict-threads-
>         large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/261> / Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4 other tests
>         skip
>   *
> 
>     igt@xe_exec_balancer@twice-virtual-basic:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_exec_balancer@twice-virtual-basic.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@xe_exec_balancer@twice-virtual-basic.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +98
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr-invalidate-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1392>) +3 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8 other tests
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race-imm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-imm.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-imm.html> (Intel XE#1630 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) +1 other test
>         fail
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@xe_exec_fault_mode@many-
>         execqueues-userptr-invalidate-race.html> (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@xe_exec_fault_mode@once-rebind-imm.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +12
>         other tests skip
>   *
> 
>     igt@xe_exec_reset@cat-error:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_exec_reset@cat-
>         error.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/358>)
>   *
> 
>     igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html> -
>          > DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-141033v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-
>         userptr-invalidate-race.html> (Intel XE#358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +1
>         other test skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-2/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> (Intel
>         XE#2998 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2998>) +1 other test incomplete
>   *
> 
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/
>         igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html> (Intel
>         XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1999>) +2 other tests fail
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@xe_module_load@reload-no-display.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@non-privileged-map-oa-buffer:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@xe_oa@non-
>         privileged-map-oa-buffer.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +4 other
>         tests skip
>   *
> 
>     igt@xe_oa@syncs-syncobj-cfg:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_oa@syncs-syncobj-
>         cfg.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2541>) +2 other tests skip
>   *
> 
>     igt@xe_oa@unprivileged-single-ctx-counters:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-lnl-6/igt@xe_oa@unprivileged-
>         single-ctx-counters.html> (Intel XE#2248 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/igt@xe_pat@pat-index-
>         xe2.html> (Intel XE#2839 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2839> / Intel XE#977 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-6/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@d3hot-basic:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-3/
>         igt@xe_pm@d3hot-basic.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-adlp-4/
>         igt@xe_pm@d3hot-basic.html> (Intel XE#3086 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/igt@xe_pm@s2idle-
>         exec-after.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>) +55 other tests skip
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-2/
>         igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-435/igt@xe_pm@vram-
>         d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-adlp-3/igt@xe_query@multigpu-
>         query-invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@xe_wedged@basic-wedged.html> (Intel XE#2919 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2919>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotreplug:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@core_hotunplug@hotreplug.html> (Intel XE#1885 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@core_hotunplug@hotreplug.html>
>   *
> 
>     igt@core_setmaster@master-drop-set-user:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@core_setmaster@master-drop-set-user.html> (Intel XE#3339
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-464/igt@core_setmaster@master-drop-set-user.html>
>   *
> 
>     igt@core_setmaster_vs_auth:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@core_setmaster_vs_auth.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-463/igt@core_setmaster_vs_auth.html>
>   *
> 
>     igt@fbdev@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@fbdev@read.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@fbdev@read.html> +2 other tests pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-8/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-adlp-8/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-6/
>         igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-adlp-1/igt@kms_big_fb@y-
>         tiled-addfb.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-
>         hdmi-a-6.html> (Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-466/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> +1 other
>         test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195> / Intel XE#3124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         b-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-toggle.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-8/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-
>         hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-bmg-6/igt@kms_flip@2x-flip-
>         vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> +1 other
>         test pass
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-3/
>         igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html> +3
>         other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-5/
>         igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html> (Intel
>         XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-
>         vblank@a-dp2.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-
>         vblank@b-hdmi-a6.html> +6 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-9/
>         igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-adlp-2/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html>
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-9/
>         igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-2/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html>
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling.html> +20 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         upscaling.html> +9 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-
>         draw-mmap-wc.html> +1 other test pass
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-
>         formats.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-
>         clamping-pixel-formats.html> +67 other tests pass
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         adlp-8/igt@kms_pm_rpm@legacy-planes-dpms.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-
>         dpms.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_pm_rpm@universal-planes.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_pm_rpm@universal-planes.html> +2 other tests pass
>   *
> 
>     igt@kms_psr@psr-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-1/
>         igt@kms_psr@psr-cursor-render@edp-1.html> (Intel XE#2808
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-lnl-4/igt@kms_psr@psr-cursor-render@edp-1.html> +1 other
>         test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-7/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html>
>   *
> 
>     igt@xe_evict@evict-threads-small-multi-vm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_evict@evict-threads-small-multi-vm.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-463/igt@xe_evict@evict-threads-small-multi-vm.html>
>         +112 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-6/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         prefetch.html> (Intel XE#1630 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1630>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-lnl-2/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         prefetch.html> +1 other test pass
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-7/
>         igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> (Intel
>         XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1630>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-bmg-4/igt@xe_exec_fault_mode@many-
>         userptr-invalidate-race.html> +5 other tests pass
>   *
> 
>     igt@xe_gt_freq@freq_reset_multiple:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-7/
>         igt@xe_gt_freq@freq_reset_multiple.html> (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932> /
>         Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3184>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-lnl-8/
>         igt@xe_gt_freq@freq_reset_multiple.html>
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         adlp-8/igt@xe_module_load@reload.html> (Intel XE#3086 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-8/igt@xe_module_load@reload.html>
>   *
> 
>     igt@xe_pm@d3hot-basic-exec:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-8/
>         igt@xe_pm@d3hot-basic-exec.html> (Intel XE#3184 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         lnl-5/igt@xe_pm@d3hot-basic-exec.html> +1 other test pass
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-432/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-9/
>         igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-adlp-6/igt@xe_pm@s4-basic.html>
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-9/
>         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-adlp-3/
>         igt@xe_pm@s4-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-lnl-2/
>         igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-4/
>         igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-4/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-
>         rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-4/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-
>         async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-adlp-3/igt@kms_big_fb@x-
>         tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@kms_big_fb@y-tiled-16bpp-rotate-90.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-
>         rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-adlp-3/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242> / Intel
>         XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-433/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) +2 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-433/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@kms_bw@connected-linear-
>         tiling-4-displays-2160x1440p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-
>         displays-1920x1080p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html> (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-rc-ccs.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html> (Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-
>         tiled-mtl-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +7 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-
>         change-during-hibernate.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +7 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-433/
>         igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-463/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_content_protection@content-type-change.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_content_protection@content-type-change.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_content_protection@lic-type-0.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_content_protection@lic-type-0.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (Intel
>         XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x170.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>         size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>         size.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_feature_discovery@chamelium.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         downscaling.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-463/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-
>         pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-
>         draw-render.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +14 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@kms_hdr@brightness-with-hdr.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_joiner@basic-big-joiner.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_joiner@basic-big-joiner.html> (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-adlp-6/
>         igt@kms_plane_multiple@tiling-yf.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-adlp-1/igt@kms_plane_multiple@tiling-
>         yf.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-464/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25.html> (Intel
>         XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>         factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_plane_scaling@planes-downscale-
>         factor-0-25-upscale-factor-0-25.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-
>         simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@kms_pm_dc@dc5-psr.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/908>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-
>         plane-move-continuous-sf.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-
>         plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel
>         XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-pr-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@kms_psr@fbc-pr-dpms.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6
>         other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_psr@fbc-pr-sprite-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-
>         plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_psr@psr-primary-page-flip.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@kms_psr@psr-primary-page-flip.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>)
>   *
> 
>     igt@kms_psr@psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_psr@psr2-sprite-plane-move.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html> (Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +7 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2939>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-463/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-180.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@kms_scaling_modes@scaling-mode-full-aspect.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-141033v2/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-
>         full-aspect.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +3 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-bmg-6/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-bmg-7/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@kms_writeback@writeback-invalid-parameters.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-dg2-433/
>         igt@kms_writeback@writeback-invalid-parameters.html> (Intel
>         XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@xe_eudebug@multigpu-basic-client-many:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_eudebug@multigpu-basic-client-many.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-433/igt@xe_eudebug@multigpu-basic-client-many.html>
>         (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +5 other tests skip
>   *
> 
>     igt@xe_eudebug_online@preempt-breakpoint:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_eudebug_online@preempt-breakpoint.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +7 other tests skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-463/
>         igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-141033v2/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-
>         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-141033v2/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +16 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-
>         userptr-rebind-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +17 other
>         tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-dma-fence.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-lr.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-464/igt@xe_fault_injection@inject-fault-probe.html> (Intel
>         XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3343>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@xe_fault_injection@inject-
>         fault-probe.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-433/
>         igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/255>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@xe_huc_copy@huc_copy.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_mmap@small-bar.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-433/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_oa@mi-rpc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_oa@mi-rpc.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@xe_oa@mi-rpc.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3 other
>         tests skip
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-
>         stream-sample-oa.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +4 other
>         tests skip
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_pm@d3cold-mmap-system.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-432/igt@xe_pm@s3-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1794>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-434/igt@xe_pm@s3-basic.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/366>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-432/
>         igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/
>         shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +2 other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-434/
>         igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-141033v2/shard-dg2-463/igt@xe_query@multigpu-query-uc-
>         fw-version-huc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_tlb@basic-tlb:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-dg2-464/
>         igt@xe_tlb@basic-tlb.html> (Intel XE#2922 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2922>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@xe_tlb@basic-tlb.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/shard-
>         dg2-433/igt@xe_wedged@wedged-at-any-timeout.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/shard-
>         dg2-434/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
> 
> 
>     Build changes
> 
>   * Linux: xe-2185-a1fa8135081e9c259deee601ef3dc945af012447 -> xe-
>     pw-141033v2
> 
> IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2185-a1fa8135081e9c259deee601ef3dc945af012447: 
> a1fa8135081e9c259deee601ef3dc945af012447
> xe-pw-141033v2: 141033v2
> 

