Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6241C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F09110E5E4;
	Mon, 31 Aug 2026 06:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwI3rXid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3146D10E5E4
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159251; x=1819695251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Ymwh0Xlvsb568k/4kDE3UN78Uizd79G7MXzFmfUV7U=;
 b=SwI3rXidOeHleYnIT2+4RDHg811q+rMSc14Dmo89bqsg8pkO9QnCbWJZ
 1iIt8YI4B9K5uB8E16tFX103nirTgPHz9tmE60voZZkuwfRbDqO3OEJaS
 woYROfvoZwpXs/FggWmFtmhrLkCTzCbD06n/YHphI1GbMHMAuj1qZ6wTH
 jZ/sAzutqg/v6PvcEeqZFNFtPYC2DeiVYsi3TiBak0bmP+oEQgGkZXLuE
 dpIh8hKDh46SuHsIaZDmO7yvMJNJoroRFmZO6SdnYdNNwfl9t+Yd58WE/
 7C+N2o45AAiOo77mjbuhzqyr2veC7DQYKpjZwAWV+DmnHDicXYZmtlnTO Q==;
X-CSE-ConnectionGUID: N3/5qBtCSKmogJkPGgwfYA==
X-CSE-MsgGUID: h4NK0QoCTzeG5KHajhBmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88411113"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88411113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:09 -0700
X-CSE-ConnectionGUID: 18QzH8uSRFuNEeZ68rWHMQ==
X-CSE-MsgGUID: NEcnCtmaSx+JCP1byvwx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="292220712"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:54:06 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa5sjNMmOXq0QcTSR+SGn/PEm+8aMdJGZRHONgyGiqCKR7cY9ayLfNP+qv3z+0C3+jKQyynLxOhFo5VLDMbuGjzGzSRzQRXC90dJJGZmgZ6k180znI8KA/TZ6VyFxb8Yt3/v4blOdfWE481+7fSEEsabVKabTFST1BOnzTAHmxa1OU92M/QacRHBIqFRqtJ/eEdbsXwl2UNgPCMkakga8xKpw3b2hfIgUIfXmRLRsraVe8wAozygZm95G4rVJCbWUokLGMVk+U6r/BleXRAtuFQcFjiaKySxbYaj11NYNs8jG3chBWmXdEW+mPnHKT2VM6fY4nDGpb/VTl97ibiNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG7sbIT7MSaY6t5swExJSpXJZPQzWvGUoHE+q3AN9wY=;
 b=WS13blALVUqPzh4GB6LWrn5VHb9VTQiin61JhQS/z7ggWTMyMLRF/T7diiv3OUbbwYwiXWcbySK2rWR8sc1EyS0BFstt8yOOLys50CDLkMgj/ds5IUXGSyax3rCYbfRPSFDCjIB3+iENbY5a7yFS3z79f9J9vDICMVUZX40aW657LITSW1l0QJjiL49BG8WXrKzplcuoxDXBynuD1yKvpTheBZ6YGerWkbDElAXAUZayvdcFeJtny9srBhorEvC9nU72bFIuTVabTMsB24Qffj/NhwOiOjPdDtwTHej9eXNb/uc4rigTra1QWvv88BZGf3J+RIssUXwdY1EuOKxomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6076.namprd11.prod.outlook.com
 (2603:10b6:208:3d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:54:05 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:54:05 +0000
Message-ID: <b6a920af-d524-4bfe-a7ef-f3b20d4ea905@intel.com>
Date: Mon, 31 Aug 2026 12:23:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V19 06/15] drm/xe: Guard teardown paths against purged BOs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-23-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260831064942.315720-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: c905d6a7-53c2-472e-1a17-08df072ca583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: W7uh9/NkNLqQshQ+gGyz9ZfwwbelLcWM1p81fKfm4TgcG7y+wOlw+UHqna3mwBOKqXXaC9pcnTPRWD9tOqlhOTXNAV4aPBYJov1KuUPts8G2/ZlbTHSzpjDouIIHDtX+iVPuKnW2twPTSh8WdM5Af0/pD3cnJIjN5r1LCeGB5GWxYhmGBSlsq96AKtMkn1d5PI73vjhpo5UdzsvhfX0WRl4Dw9RtcZY2YpiKEAHpQvm6/LTb/x6CbtAzBee11mGh1RKfqpyMmgtcf942Svs/VD4EOwBBf6wdoZOHOpKoiIkiCaBuZpqPkBfXj/04mt8X+ENx9R6ckbirAZVXzmeQJnk6Yq9+ISUkwQxVKe0SHkiJEHP87H+Mn4gVUPYof5VwYYGJkMqAC+Hkw9grnofjgcCyDIgNIwnMMJ81bsOVWP8zJQYHZOJOdDhXxQffK8acawVO9zodV9IcXBqHdMLv9QeMUALmJXiMZWXnCLepCOTM9MILIoHy6cTuZv4OLMDZLEO7uDtjasJxOV4zF135S4p9wPVTTOyl4n/8VAwADM8/n3yLNTN2zzTh+eggIsvxg5wY4nVZ1P+VKGaCBLAMg5t+D2A3u1iS8t7qU4EXk1Zxgl7aTbvQJEnk+jE+2ALxvA+HFD2xRR4c5WDe4kOCvdkQD8igtDrJYWym0x6eY10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBtWjhBbG5BSE9QRHdxa0orMzZXUWJrK3N5R0U4WTduZHJWTEpPNFFGNTIw?=
 =?utf-8?B?dGhtc2xHaEw3R0lCM2JocXR1YUdCVW1NVmRyQ2dwYU5JZ0dHUG05Z1lPZGJL?=
 =?utf-8?B?TFlBU3JCSVN5UFkzWkR6RDFzb0hINVgwTUQ0SmoyOWkxeWtsdUN5Z01oNUxh?=
 =?utf-8?B?YjB2V2lLbDFxZFJFejdIZVkzS0F1Z3d3cEFqQjdObjcxQ3h4Yjg5RUtnUG9l?=
 =?utf-8?B?VHhqM1lMbVlZdjJYMDNWMHA3WktDY1Jrc1QyMHRrcWtlS0kvaVFVYlpTM2k4?=
 =?utf-8?B?M1RoeHIrMFpvQkx5cDNickdWd29tOTBXLzZUT01tWEd5Y3crckNNaDdteG5h?=
 =?utf-8?B?VVhlNTVReEFxQ2t6Tk5vSDl4bVdQSHlCczhEdzd0Sm5CdDI3V3NTWkhkOTFZ?=
 =?utf-8?B?bG5uVjBYQ2hUdkYwNmI2NlR3ZHR6cDlVWTNZT1VLVGdhcWJPYnBKaWFXemFK?=
 =?utf-8?B?ckppMzQxVndJa2FUek41eEd6QU9nUHdUeUJ2eGxkcXJoME1jcWNQa2F2cWwr?=
 =?utf-8?B?OUd3eFJjZi9yS1BmY2RGK01mcGRRcnBOZGNZRzloa1RaYU5qWFJHNVFtVGtu?=
 =?utf-8?B?ZDNoemR2dlVNbERodmtRaUFpOHJwV3lFQ3hqVUJUQlhaaGd1bXJaR3lwM1Js?=
 =?utf-8?B?MkZUc1ExUXpVMCtPNUMrVm5EdlJQYmhMZE1PUFhXbUI3ak01dFFGRklsUmVL?=
 =?utf-8?B?QmJMbWhkMzd4alVtTXZ4bU0wWk5EaHEvSlRFa2VwdHBHdEt6UXIyTXBFWU0y?=
 =?utf-8?B?Q1BidFFGWWZsMDRGSXFzMHE4bzAwQWVCV1ZzV211TnNqc1hsdjBKS2hwMHZi?=
 =?utf-8?B?SmJWWUpHYjJsL2NTdzNZQ3V1bDBuZno4aXByL0hET2VwUHlkQ3JBOGdGajVh?=
 =?utf-8?B?c1FXRkg0VG5ZajlDdUNhUU5aWHpkOVlwbXRUdFA5eVdYTWZ3aENxOTY1MU5q?=
 =?utf-8?B?czJjU2NORlZGclpBV25rQUlkekp4SjlKMkJyWHRUV2doT08vdUJ6T3hwd0Zz?=
 =?utf-8?B?bmFIQ0RiUGV4dTh5R0p6WTFXTnRkaWdOZURIbVdVdTJONnJSYVZ0NUprTHhx?=
 =?utf-8?B?UDA2R205TVcySTBLaklOTnlhaTFqZVFxVTF1bVVrM2pXdEJ1RHNmYUd6Nk10?=
 =?utf-8?B?SmNHMjkra1hrV29CWmErRTNYeU1xSjFMRkF5TUZZb0dKaUFJc3FoaXR2SE1B?=
 =?utf-8?B?YmU1c2NNdGJvWFJjSlJndUpoUml6Vmt1WWN4MnZ2bTlKemtMZTZFclJWam03?=
 =?utf-8?B?R3lPbmVZZUUzcGRxWU1YL1A1Rm9GT0NRWFU2aDUyeXpWdjYrbUxScDRZNDlx?=
 =?utf-8?B?SzJDeTRkMzVOTGRTeWJCUG5Rc2JLem1nMVVUN05ZeDFhdGliVlBsRExENzBE?=
 =?utf-8?B?MkNWWWNmSDdhSTZyOGZQNzJvTEFyZjB3dHllNkYrek9HaWptdEQ4YmZRRVI4?=
 =?utf-8?B?NzhuSTlsbmhpeE5YdDBYWElDbGRDK00rd1NtOFA3YklSYk9xeGFhVGQvajRl?=
 =?utf-8?B?K05wNWtObjRrTW5GREt2V1VhQVBscENpTDRhc0YxN3d3K1pIQkppN0NONkM3?=
 =?utf-8?B?UXUrYUhEVk0zNjVEUlZYVFRGTzZtellQWUdYUXJESUNzb214QWlucnlLd2hj?=
 =?utf-8?B?bzlmaDZFSkIrZ0ZJZ3pFblpRTzJoRDZzQ01kVGp2YUhxWkZFQzJ2N2hnSzg0?=
 =?utf-8?B?NUY5aE14WUJqcnMzUlRxQWtqNDVpQTVQbWVLcWhGOTJBRnkreFM3aVBKUjFk?=
 =?utf-8?B?ZmNoSm1NSTl0MGJUZ2U1bTRLcXg5LzlBbkUxSk42d3doZE1IZkdsWnZJdFZv?=
 =?utf-8?B?RnBxeEhaQzcvWWFsbFA5dDRoS0pHMzR5NFlCSEZ2T2ZqN2FGN2F2d1NWQWZ4?=
 =?utf-8?B?YXpRaTAxM1E0OXVXWVFBUXNTUUt2blN3S2dKcW10SU4wLzk0V0E1aU1mcXZ3?=
 =?utf-8?B?cGY5cHg1MnNXY3N5ZGVDOHlIR0tYVktuL0FUNHpxWXQ4SEh0ajFabmw1RkNU?=
 =?utf-8?B?UU94dzRxTEl4bE9pSzBRaDEwL2NYN0ErZHZsZkFDdytnVXZYRXQzTHFEa1hl?=
 =?utf-8?B?c2RhM3BmWGZLQlNYblIrSHlUTUxkdzBMT1hPUUduZHhPQkd0VGFOY3NkZkI5?=
 =?utf-8?B?dVZxVXJpeklISFRWbGh5WDNiZG5yNy9GclRJcUhpYXRRRytiRldrMUVtRVNs?=
 =?utf-8?B?cDYveUxFRlBScU4yOWowdG1xMjJuWUNBaTllVG5Jb200eU53ZkJXVHY3U2VZ?=
 =?utf-8?B?eXVpWXhSaFgwZ3lJTk5vdFowa1lYK2g2eThlNUtjMlRCVURPakF5NkVTeGtF?=
 =?utf-8?B?bWRKU05pbCtnOWJ3SXkwYkV2WUkxY0YraStuRWpDbHlpbEFJVktvT3RiUFNP?=
 =?utf-8?Q?ULD21srdrh/ybhz8=3D?=
X-Exchange-RoutingPolicyChecked: SKQx8weXFQea/tK9snJ1TxIa+mUhgcy0sj66IlVJHwWjIkd70wsOLoKoGENgBfM7uSO5pmu5wNwOM1OkXm/F0XRseT+kkzs20exfqaVs+ym9i0SkhcFAdTTJKHyl0GN8gV0VkMTRBbyngQSqpoZnhGtBFo2eQq6TergZBJrBZfPm/1OrDrXu42bkcFCbm9XjuBoR1zb9Zd4eK0IzYNJ5GsmLv+9H0tZ7lxQIdZcDiDT56agpFHqqvFRYRfJR6gX24ev84Ok7Qxdb0/BUCvPZVkNaAIePF3Xxx77KJ5bM2qx4xdAfgDGntkExVDQKoS2IbzH8lnm0Il0u3sPrW8RRAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c905d6a7-53c2-472e-1a17-08df072ca583
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:54:04.9838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBOSpZk/l2W95zCZPgTDvm46EH7nXWdlZlnCYHZnaJ1W7U+DqbVsFDCX2ZxbcnIRFjmR5+c13usxXQeScYsSmEt9j/rSswTd/MHzh68kAAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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



On 31-08-2026 12:19, Tejas Upadhyay wrote:
> VRAM page offlining can purge BOs that are still referenced by page
> tables, exec queues, and DMA-buf exports. Add xe_bo_is_purged()
> guards in the teardown paths to prevent unpinning or mapping an
> already-purged BO:
> 
> - xe_bo_unpin_map_no_vm(): skip unpin if purged
> - xe_dma_buf_map(): return -ENOENT early if purged
> - xe_exec_queue_update_run_ticks(): skip LRC timestamp read if purged
> - xe_pt_destroy(): skip unpin if purged
> 
> v4(Sashiko):
> - Move bo purge check in xe_bo_unpin() to handle all instances
> v3(Sashiko):
> - Remove dma_resv is already held
> v2(Himal):
> - take dma_resv lock before calling xe_bo_is_purged()
> 

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c         | 3 +++
>   drivers/gpu/drm/xe/xe_dma_buf.c    | 3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
>   3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c255327669da..b162753cebb7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3267,6 +3267,9 @@ void xe_bo_unpin(struct xe_bo *bo)
>   	struct ttm_place *place = &bo->placements[0];
>   	struct xe_device *xe = xe_bo_device(bo);
>   
> +	if (xe_bo_is_purged(bo))
> +		return;
> +
>   	xe_assert(xe, !bo->ttm.base.import_attach);
>   	xe_assert(xe, xe_bo_is_pinned(bo));
>   
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index bf0728838ead..5d9f1cd24b7f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>   	struct sg_table *sgt;
>   	int r = 0;
>   
> +	if (xe_bo_is_purged(bo))
> +		return ERR_PTR(-ENOENT);
> +
>   	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 91ed6c0fac84..91e4f3cb5617 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1572,8 +1572,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>   	 * errors.
>   	 */
>   	lrc = q->lrc[0];
> -	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	xe_bo_lock(lrc->bo, false);
> +	if (!xe_bo_is_purged(lrc->bo)) {
> +		new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +		q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	}
> +	xe_bo_unlock(lrc->bo);
>   
>   	drm_dev_exit(idx);
>   }

