Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9653C02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 05:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEAF10EA1D;
	Fri,  7 Feb 2025 05:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHlClRfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5D710E104
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 05:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738907118; x=1770443118;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xS0Wrc7qNLZBmKcnvGmKhZVHQpzNkHhMHKEHftVC9Ko=;
 b=kHlClRfZxABjaKH/yhZgBySsnMPT42yxkMwoJ72C8dD8Ev7sHmLEyKbr
 wCttFN5eooRFOxIyvGIz2GXMfwKmC1u2406/59/eqXQN2aBPwCIawy1o3
 NlpfWJy21j9vnqyBaGJoVdR5Y3qot5YgftN5zCBuO5qmvz0LDkwe1zn2s
 H4/v0ZJ0ovK5McI2OC4xZ9JVApSMe4CHtcSMYSZi1lXHd3/s19PL+b0rQ
 0N/fx1AKK4hP/zvUGoYNAUqCJZsmIpKCEOyFwM1DcScUMIum2gRWQxDYc
 nvjx6cUiGQcF0vdRZIDC5Dfz6/hFm/xOmlDa2saRX+YwMysF7TlUl5Lbb Q==;
X-CSE-ConnectionGUID: tkF7FG/XTQ6kaiUptE7UKg==
X-CSE-MsgGUID: MMma9/iXShKoV7/9rHMSTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50177324"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50177324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 21:45:17 -0800
X-CSE-ConnectionGUID: qrkn5SWHSLuSAoWW5dxvfg==
X-CSE-MsgGUID: nZXr927BRRmq+xdG+Z2OsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116045749"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 21:45:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 21:45:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 21:45:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 21:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oW5D0GRr5Rxc9hlTrrw8mFFu/56sIoOTWeiRjlVSYXoZB4X6Q59DEa/QKguYAbpq6c1dofXSrmhFYzdv7Hedyi8c82L3cKv/PVGzEfb2PW/oG2MezF0cN5dHW5qE809OAp5CoxG1peT9pnDo2Naxmt3wsaNPitmYs3S6s2zQaWg4nqTwo9gMkXaC/gH/kRSoOdmlUL3W/j0/1iEBK91hwTnUCUty7u4fXZ/4M0hepFjgF9JbXJrBedLnzf9FPtoQbyQXUhym4+94oCqjKlxzbMXwf276I4NHKGF6It/wmTSkySC0iH+eJ3ZbT8/rr4d7QNYoCLKYY16EB+mmKz19kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUfDhZI9Z/OqgkHRqAD0ShFNlWWSkVbnL0NvUoFw084=;
 b=oFmpHsGaHHgqy7kUJr/2nipenMfZn9L4nZGI9Yn0xn258CobslUHqHhVgz9yUwZvWsGI+UIvDskRa7ZfCI4coUQjCYSNrqN036wrp/u5STXtAfOZOy+pef97x/anCLkfoGCmR8xc2xuTKvCDdRjtdH6V2QR+S0+dAYQqkigaLtpo2jErojeYinkjunSY/SbtsM/zYkshYTykSYoqUASnR+4HOzxA4mIx6QSeYqDx8nLZ2ymUJsocuB7VxdM8/wVhhrwtX8tZt6lNbaSZiZP2F4uoRj7jHSRiUJPD9KIMXkHhrtWW/BRHbN2sknRs+wSml8hYxBLMp26bLsrrp4Ofcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 05:44:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 05:44:32 +0000
Message-ID: <b8efb5f2-263a-4fdb-9659-f76dc429913b@intel.com>
Date: Fri, 7 Feb 2025 11:14:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: bo->client does not need bos_lock
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250205051042.1991192-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250205051042.1991192-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 784ddc27-034f-482e-c2fb-08dd473a7f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L214UENtZzRSUmU3YUlRT1NkQWczN3YzZnQ4dzFKNjBsL09xMndIL2JYYm83?=
 =?utf-8?B?ajhRemRNU01HbzNOc3dGT3ZjQUswSERHTXQ4aHJqQ0djVmUreVRCWmhVY2FE?=
 =?utf-8?B?ZXlVWmllK21BY2Ixa284bDc1em40UmZIUnpnVkx3VGRRb3RkQS9kUkRjSW4z?=
 =?utf-8?B?dUxMbHpHSE5mL0hab0hpU2syK0tZd0FNMFU4eXFVbDRWUXdvVFBGQ0hFSUIw?=
 =?utf-8?B?ak9ZTUFIVThsVFpnaUk5aWJPSGhnME9Md2cvOUs5d05CZ2ZYTGsrSHZuV2JS?=
 =?utf-8?B?WW90MVF5cGZEbEdpYi9HTmlnSzRpRG5aVFlYaTUrM3Y3eEttNnNiY0UxRU5X?=
 =?utf-8?B?UFAwQyt1Tnk4bUJwdzNKdVlkVURCUGUyVDh0eXh5Sk1nYUZ5RzBTdmU0ZmpY?=
 =?utf-8?B?T2RaYVhzeGlGZFJubmN1Q3dQR284NFZjbzlQaDV3NzFSeHdPK2FsOFJuckdw?=
 =?utf-8?B?QVVwYUp3b1ovak5tQlBKWGpFZEM4UHVQQVlTdW1zQlllZCtjU2VpblBSOEZN?=
 =?utf-8?B?M3V4M2dKVmJ3a1dSTHlIcVN6VFFRSEtReGx4SURsV1I2TFFvN1MwdHZMMUxD?=
 =?utf-8?B?Zk9BektaTjVhOFlHR2pVZDV3aFRSMlRxbytBUkRQZWRYR0FBd04xaE9waSta?=
 =?utf-8?B?REYrdDJpSjVGdjVxWk0xamJXVkt1R29TdGErNTNnUUt3Yk9PUGZMOEE1YXcw?=
 =?utf-8?B?bU84M0hHT3lEdWtpM0VWTVBaNUtsS2N4Vm1jbWV3ek53WnAzWDZjMGhvVXNJ?=
 =?utf-8?B?bDZWMFpUU1lvYUtxSksrdmoxOWprbTN0VWUvVTFONlBzS0tpbGgzUlU2L2RC?=
 =?utf-8?B?cUhWQlV2eWl5THVSc2VDZzdJQ04zWElpZ3lNbW1TWDU3R01EeU51ekdwR1ph?=
 =?utf-8?B?OHBWS2I0NllWWVlkUXJRY3YxS1dWaVRleFpsbHRXMXQyaWdPd1FybkFCaDBu?=
 =?utf-8?B?ZC8wYVVxRk9Cc3Z3bVN2UGc3ZnBUQmh5Rks3VllqanlmZDdaVTRoMk5ZUWpt?=
 =?utf-8?B?aVpNQmdVT2o1ZnJCb2k1YnE1Tzl5SGxJRy9EU0t1Y0dNWVRoZTVidEczMEQv?=
 =?utf-8?B?ME56dVIvcHZmK2QwQ0Y3bGN1dkVpY1VJMGZTRUo0N2NreExLTUdiR1hUQmRW?=
 =?utf-8?B?YUxoK00wOG5oY2hsODFSeGNnbGlWN2tOaVpMMHJuOGZTSFRoY01qN0FpSUpP?=
 =?utf-8?B?ckhsKzIvWXBRbmlYN0ZCeC8xZitNTjdSVHovc1ZqVXpqcGJ4aTlrL1MrRWZo?=
 =?utf-8?B?T3hoclNDL3FLcmVlMlVSZXNWei9XS3NGVFQwSWQ3ZXRndnBtRDRoOVVKdXF3?=
 =?utf-8?B?WnVNTUpad0RBTVBTR2JOSkxLbEZTTW9tK0ZFV1gvK0QvOE84RjNsY3lvL2dm?=
 =?utf-8?B?dUliSHBOblkxZXdMSWx3UHhYbThEczJjeWs5N2FjT1lybEk4N1FGZHpUQzM1?=
 =?utf-8?B?YStlQ1p0OTNFZCtINnhYd1QyeVRKZkxwbzZTVm4raHlkVUpDOWovaW1ZNTNH?=
 =?utf-8?B?Zml0VzNrRUpEQzRzNEZwc1hBTExiTEpZNElZbTFBRnNmSEIwdFB4aDlFcGVH?=
 =?utf-8?B?dUNqYS9taTJBbFZxRlhaMmNnMEF1bjJOZ0R3cURSOTFDQ0ZaNzFWYWJiY0cx?=
 =?utf-8?B?Z2ZybmdqZC9Za0E2Q2RIdi9LSm1MS21uNFlKMlorUy9KOUMrWEFJeDVUdm84?=
 =?utf-8?B?UE5XV3pPWUJEL2QxcjdwWjhUT21zeVpoTXdHTGdGdU51STViVFJrNzFYQUxS?=
 =?utf-8?B?alFVV1g0UWtNOUM1dFEzWFRNcFVQeHY0OGQvd2t5RG5WWE9JWnVnL3N3WlI3?=
 =?utf-8?B?U0dOWkN5d3RvczVJSW9LOWY5SWRoajY4VHFhejFpR3lSbzVucVd4cXRDZ0du?=
 =?utf-8?Q?Ar2a/oEJLtYt0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkFCMEF4bnFJR0tRTDJJQUtlMU5Ka2VlR050THFyR1F5SXpoRHpsQkZmNzF6?=
 =?utf-8?B?UXlwNysrL0pyTE5OTGtkdUR1bml2VDRIVjZCQ0tMUlpYUXJIbHRLUWZHWU1H?=
 =?utf-8?B?TGl2U3BNWElHU3NXR1diODFvcjAwQmVGRzdLVVROVVlhRUJXd25WSGFRbm16?=
 =?utf-8?B?N1M5d3UreUF0NEI4QVZrUm5wSDVNUnRsMzFuOWxTcmxUVXltWkU3T1pYaFV1?=
 =?utf-8?B?R082NTcrQTNrNjFwd0I1M1NwcnFndlRKUTVyNmp6ODdMalpMMUpEUGI3emE3?=
 =?utf-8?B?OW9ST014QnFoZXB0clo2TGRtbXlvZzg0SmNVK2RUN0M5L2h0aUgzVWlpaWNr?=
 =?utf-8?B?Zmg5Q2dUMEIyTm1hd2R0M2owcHNTRDNNb0hyV3Q2Wm5oTTdqZlpzNWRQRzZp?=
 =?utf-8?B?NElXNElqaUVGRThiNFRQVkF5VzJHVG5NN21ndWhtM2Z1SW5rRnFRaVVDMThZ?=
 =?utf-8?B?RWVNS2tXRmROdzQ1R2d1dk1lL0JxOUFPZlJyZm56K3hseXl5RTBtKzIrK0d4?=
 =?utf-8?B?a3VmOTlITkFFNi9HZVNiU2JodUZXNjhUcWJaSjlrbDlTVFNxUi94QzNvc1I0?=
 =?utf-8?B?aW9yU1cvRGVBS3F4SFFRSDZYRmVaUWpYNGtEalRYbzFadDcxSTZTL1RpVXc4?=
 =?utf-8?B?bHN2cXFVc2RwTGZaMG90L2kvTDgyc3VUbndRNnJSN20wczV6Q1c0enRadTFV?=
 =?utf-8?B?VVZTMWd0WVlvdGo5YTRkUXlxS1VZU2MwZ3VRelRQUHJLOEZxQ3F0QnZzeS9W?=
 =?utf-8?B?SmtpbUFSUHZhZk11NkllWG85TXM1a3JiSDQ0alg2aXRicHhJOUlBcWJNVUQ3?=
 =?utf-8?B?NnhBenpHcmdKMTErSHZHTXpMVXpFZEt1U2RlVnd5NHJRRWJTU3FQdHUzK2Iz?=
 =?utf-8?B?c0FrOWlPbURuTVJabjV6SHpYNHdHYnpYWU5uMUlOakhBYmg2NTNWVXgrV0h6?=
 =?utf-8?B?ZmNPT2I2eEI3RnJYTSt2dTNXc0ZyeUYwMmJ0ZUQ2MUQ1Z2kwL0tMZjVrYlF5?=
 =?utf-8?B?L2dtRG5CY2Iyb0JhSGlVSnpFclEwRkxNTjZuZHhOM0ViRTgzaHpWUkdvOWpk?=
 =?utf-8?B?NDVMMHNVQ0c1aTh6RFo2Q3lXalZXUzd5Q0hlZjRiOW9wVEhQZUpHSzVYU3RP?=
 =?utf-8?B?K09SWWhjNWpsWjlmOTcrSnRjWXdDVkU4STd3a2NFTUJYMFFUZXZRWGtJK2JY?=
 =?utf-8?B?OEFLeGIxa0hXU1pzdXdBRUFnWW8xUk40SFovZENaTUFDeGVIZTdPZlRBb1Yw?=
 =?utf-8?B?TkZTY01LVXhjbElzM2xnU3hZWGR1K05OczIvUDVDS3lFS3BmSUpiYlF5eXAx?=
 =?utf-8?B?d0tXVGpDeUlYVUh5NXIzRUE5NUN1aHRaUjhXK0NycHJPdmpKS28rN0plcC81?=
 =?utf-8?B?USs5YmJIcmJzWTFXNmxvZjJ5QVZSSDV4UXZQdDRDUWxYakZPemZkWHVaWlhC?=
 =?utf-8?B?Sk1uWmpZYzc1Z3F2ZDh0MEV1bk4vRlUvVXozajdaTy9EWUk1dEN1bGdTSmpW?=
 =?utf-8?B?WC9ra1RLOVB4NkhoWlFFd1pSM0c2Q0x3ckxkcEdEelpWYzEvVnhwc2RPbWQ2?=
 =?utf-8?B?cmRPVjZVdGNURndkOEdvVTkwcElNZm1HMlR1MDMxNVV6Rng3Ym9UV1AvTTJ6?=
 =?utf-8?B?N2h4WktUeExydldiZ3BEZ0pEdWUwT2ZsWFh3TTFFb3dBWWZlL0dBdm9jMGV3?=
 =?utf-8?B?Zm00S3BvUGVsLy8wTy9WZDVUYlR3R0JhR0gyUk5aczNQL2VRNHdXZ3BVazdV?=
 =?utf-8?B?R0VMTWw0bnl2QklYLzllUEFWRWtYVUV4SU1PQys0eHJLRHlRYTkzUDBSTi9K?=
 =?utf-8?B?MEM2ZXdhR0hwR1J0cFgzTVN1dTlHZEUwY0JxT1VhQ0hSdzhzeWw1Q3FpblBS?=
 =?utf-8?B?ZDJQcHJDZkZSV1pFd05hZ0lkRGNWSXNiaFZ1bUlOZk1YNGJJaTJFclFpUnk5?=
 =?utf-8?B?cis4ZGh3WWxJMVlVNDlQaDMyOE94SmtJNHpvMWtSSEJ1dzhyNFVLSHl2YThO?=
 =?utf-8?B?Z3pHUDJscktzWEk4TVRqKy9WT1BVTXlhU1FtQnBaNHNqdGFIUENBYy9ibGQr?=
 =?utf-8?B?dEdia0pPZWhaSlhLY0plcmtaYWo1RjJJbU5NcGlKRFRiYVU0cHBOOE5QT2VU?=
 =?utf-8?B?YklEai9WRXpPR1ZqYW9pL1NTeWZKN2RxcUNXeTd5K1VBTURLb1FGYUtuZlJs?=
 =?utf-8?Q?3j/a0r3FRrzt8WiAxR2Xpr8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 784ddc27-034f-482e-c2fb-08dd473a7f0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 05:44:32.4672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPzLIylMDh6MVAsAc6+moqfwd1BcvnVE5cqLICZvld2akS1d8mvqGBNzucrdmyug6THuEcMEPMQCh0f54DOhQ7xPW4oY69si8av/vIfTXD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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



On 05-02-2025 10:40, Tejas Upadhyay wrote:
> bos_lock is to protect list of bos used by client, it is
> not required to protect bo->client so bring it outside of
> bos_lock.
> 
> Fixes: b27970f3e11c ("drm/xe: Add tracking support for bos per client")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 63f30b6df70b..2d4874d2b922 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -135,8 +135,8 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
>   	XE_WARN_ON(bo->client);
>   	XE_WARN_ON(!list_empty(&bo->client_link));
>   
> -	spin_lock(&client->bos_lock);
>   	bo->client = xe_drm_client_get(client);
> +	spin_lock(&client->bos_lock);


LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	list_add_tail(&bo->client_link, &client->bos_list);
>   	spin_unlock(&client->bos_lock);
>   }

