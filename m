Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87EFEEEC08
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 04:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19010EAC5;
	Fri, 13 Sep 2024 04:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No7cTzTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB2910EAC5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 04:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726200594; x=1757736594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SafeBJ8IgZSXYLZCvsqKlWwBptkOH0nTXIiu2vmcIWc=;
 b=No7cTzTXLRJCe0HRwkO6QwSWT1Nd3DmNSindSSqnBIC8v7ebtJvtdpEq
 4cjXcL7bQx23Q38Jv5A4U60HpaCO7Oc535BeDezvJarjOIPrjA66tsFbY
 48NDrDOMw7bavNxl8GQQpKaROSRpUbugTNwPvmyizDPd2uQlyhqC4JB/V
 SbJ2yxlwGhI9/qVskKUwEDNCfAh7f0wH5wWYMld3vBqlvABfNR2JSRD3A
 D3GozuOCLYCkS6fdGvL5amZksA3gS0JLEXQtE37yHREAATND7HSXKF+4i
 okLiCfFw3WQ5mA2faNq3ERpgSmwCzBviujhukkWJ6aC1uXEUXTvd2AAYE A==;
X-CSE-ConnectionGUID: e0awnCGnQAqsD6x1rngsuA==
X-CSE-MsgGUID: PHG6CsTLT0q32xziLi1ZRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13506070"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="13506070"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 21:09:45 -0700
X-CSE-ConnectionGUID: 3HpwQD+4TAaJmnCWHe2TCQ==
X-CSE-MsgGUID: G3i6UDVwTiy9LM8LqZROBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67889467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 21:09:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:09:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:09:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 21:09:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 21:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw5nkrCJKatJs/NkQ+e5wdnGPeLTDgrxptNb5fxjT3osjfkckL49lHeczQItvEdoHRJFSwH0AaTJJtEbwOtKvmr/MNPgEcfg8JcXYkLBlLjcMxGxRPSQ2sZw7AmSDMmurllip4r/8OzsNrs68qnz7hY2iVBNX0Z0L2LXpsaaShlm5t0TDWGPqJR7HvsOv4jqDYQ1a3TK2aKFF6LiSFokkXTKUo49zDlLHxqthdGbVyffa2E/APj7MKw6EjbbMstAIMtK7sRj0Cy7NDGzMttBTIku46QbCZU4wtviaU6DexQfsTmS0y2b/mAC+PgAP7k/dpR2dBElTKTHOrrdGHtm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8zeUr0OkvcSG1DVnLOJeaQoZe/z5mWC7VSyczyiplI=;
 b=Pn72hfGy/I/m8wWhizUcfoiKoOdmxYA93KcurbzQCsncHYSnEHgn2AGNyeMPjFTdsV+CfAqR8P0TSlh82wG8sdfQgBYrrfVlQKdKw65w52qGSTntC52j2/nJ8Sd/1xkcPzikIkOqAWVQuTb5BK12s/+sUKuZuIWAKmMUP7X1WIPQ1MtqBgXWdmu5rHlcJDIOND/QRlZgujv0A4eS6BJrvAf6Iop+1TybOrYlzAdHfHU+F4hRc1v+FqvwNzml9CEKOHY4iwMCBXdZv/+lagDY4S6lGnZt42cayNOr10Ht4E4+sr4UudWcK50R9ypEc7PED7oBrF2syV4o4tc+moTpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 04:09:39 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 04:09:39 +0000
Message-ID: <ac6f3356-ffdd-4d01-ae1f-80845e64f93b@intel.com>
Date: Fri, 13 Sep 2024 09:39:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3f11d7-7fc5-400e-d27a-08dcd3a9e2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXplOUZrYlgwWXNGYjlJZXByUkNTbHhIM2V3REIyRklnVHp1UUZSYVp4ckM3?=
 =?utf-8?B?M2RGOEM0U3Bxc29jUUhQb3NZbElGYVlGRkZ2b1p0TDNycllZSzlJWjZHd1pI?=
 =?utf-8?B?MWN6bUMvQUVlSitVaGU5NjRLQUtIVEtUV05qeGx1WlUrRXVPWlVCaUIwazZE?=
 =?utf-8?B?d09PcHlqeGhKNXpkMlB1UUorbkRSS29vWDJOK3g1YjYrTjd5Z1YvV2U2SVNa?=
 =?utf-8?B?RVNDVXYrVXBRKyt0MjZIY1krSWZTdm93Nkpmc0dWaU5haFpNVllhK0x2VS9M?=
 =?utf-8?B?NGEzQk16TkljRGNTZ2NCRUxXYTZpamFtT1p4cmhHbGZ3d2pxbTdNdkl2Yjhl?=
 =?utf-8?B?cW9FTlAwaitUTmVld0NDbFhFWDFQejlDcFNqRm9iSEZCOUlTK1pjVm9VYjQ0?=
 =?utf-8?B?cURVVFExS1daLzduV2VXWndsS0lnc3U4TDJnMFF5YXhtZGlrNTUvSG1hMUNl?=
 =?utf-8?B?WGMzbWxyR1RlTHcxT1EzQ3BSelNMZml1a3JCNHZsSnVEMEcxM2hLWFlIVnd4?=
 =?utf-8?B?T0tmb1R2WGx4bUFHM0lqSjAwU0IrOFV3aVFVNHAzR2g1a1dmb2pHUklpTTE1?=
 =?utf-8?B?RDNZcENINENZdEZKekVvQjZ5UFNkZUhWNkxFay9uUDd3bG5ENExtOWJYUXli?=
 =?utf-8?B?K3JXS2dsQXVzVElqbHF2dlVWdEt2QjBsTWFhMmFIamxWdml4UWlEcjA3NExM?=
 =?utf-8?B?RXBPbzUyMUJTNlk3Wlc3RjVGKzI0ek9PcHJtR28vU0hpQWRsN20rbDdqTjRU?=
 =?utf-8?B?M2xyL01PcEU4b1oxS1l1TGRqK1BITHhjTlpSazZvaFdwRXQrdjZUeUNWd0Fh?=
 =?utf-8?B?d3NmVW1hbFVCVXRLSHNyeExsdmlqQVpkUWNLNnR6azVqSUtIaUx0ZHFHWGVU?=
 =?utf-8?B?VjlVTDQ0WEJ4c2pqdVJBZVNvS2dudm9kSG9lTUh1WHI3T1pDUmx2MmlNVzhx?=
 =?utf-8?B?T1hzd2QzMGU2R05xY1J3Ulc3V1JHeWlrWU5OZmx1bXJtVU1kWnBUSDdqTVU1?=
 =?utf-8?B?aWx3TlVtYllGdmNIaExIZ0IyVEt0UldSeDFpT292d1dyZ0NKTGF5TWprcEQx?=
 =?utf-8?B?bWhrWWVDbk1ySTZPRmlDY0c5MmRzMGxzYXNBQ21nVCtsZDBNMDJWYVRBUi9U?=
 =?utf-8?B?bFp1dC9WeDhmS0xQdHo3MHUrSmhEMk9wOXRrekRPb3pWaGRwWUVMcnZhMnli?=
 =?utf-8?B?aXRqSVU4UW0rbkg3QTJuQUFMc1VQSHdYeUhVY1REZTZnSkFCeTZ3cGk0bkts?=
 =?utf-8?B?RDV6anZaWG9kVjNYcXVlUWpHUlZGT3REeHhLRUlBcWlvR1hnVFdkbkZhYzZQ?=
 =?utf-8?B?U1ZDdnBkZkUyUHVhbjRUN1ltMjBrQUt4M3Z3ZXg1eW8yWEc1QlBVV1ZqamNm?=
 =?utf-8?B?NDAzajNDOXFJMFIvMzV1a09QU1pYZTRHVnB0S25WNTJ2QTRKWnNsVmtiUzBv?=
 =?utf-8?B?b2trcWppOCtzNXZoSHlZUXVCUEczNENkV3R4Yy9qeE80bkQxME16WmhsN0tw?=
 =?utf-8?B?RnRLVGx6aWN2YW0rYitQOE5qZXh5TWxoZXkzd3JJNmpiTXdJcTltdVNZdTll?=
 =?utf-8?B?UDhyMzNxNkt1ckxDV3dHT2IwZ1ZuMEc4K2o3RUUvQkNqS0RLVHl5TjM3dmZl?=
 =?utf-8?B?cGpNNXMrbHc0dVVGK2xrYk9WOGdLNFpUc1hCckJEVktVRTBaYUFiTCtuZGhN?=
 =?utf-8?B?cDhUMzVHZ0E5bnNSVkwxRlVTejF1NU9ZN0Jyc29ib0J5NnlJL3AvamI3UVdD?=
 =?utf-8?B?MWlPMUtGZDBDL2Y5MGNRclZPYTkzUW0vcko2M3dEaXBZNzdQQmdoMWdsaWFL?=
 =?utf-8?B?Y3d3VHBRcDRQL3dMSVpZdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9WUDBPcjBtaXVBb0NicXdVYXhVV2lCVmI4eUtZSjV3YXdhTDFFVm83KytQ?=
 =?utf-8?B?UlhwcC9KVzdXdHlZRi8weitVdkhVOXRoNnlVc0k4ajk1bmVNVFFqL2FmbzEv?=
 =?utf-8?B?TENFeWlpUGdnTS9qYlFPZ3ErVTdKVmszSHB3THk5WHlTNlhTYS84OFpMZFEz?=
 =?utf-8?B?bFgxbzUrdGpSelBCOFVVcGtKWldzVDVJdThZUzE4NVlZWkZCbW1qalhaMG5B?=
 =?utf-8?B?WWZUcCtVR0UrdUIyWE02UTlVNUd3NFNGY3hOdjNtcVFCV3RUL29HdHdiVkFI?=
 =?utf-8?B?WWkrR3l4T3hNVFdPVjM1K2ZZSjJHeWk1ZjVmdDh6WUpNeWNMZlYzYXRBODJO?=
 =?utf-8?B?YWpyZ21xdWp4dW5SbDlJZHUzN0VUWGRKcUxtV0lXUGRwRUx4K2ZaK1hhdDND?=
 =?utf-8?B?VE5FT1phbVRkT0JDektNYWN4Ymc2NXlIQ0JlSTBBK3VVQjg2dWluaGlzd08w?=
 =?utf-8?B?ZEQ3Q3JJbkQzUlZHWHplUXBvTVhqSVpYZURCUlZxODg1a2hjaTUvY1dyZGlQ?=
 =?utf-8?B?eHNESU11d0tQY0dVbHZaeWRDRkx6a3hJbkRteFI1QVpwc2NIdDVwNFFEM3Az?=
 =?utf-8?B?VXFtbi9OUmVZQTNNM3F4eVdra0hITERJN2hKNTM5M1BKZ1NWMkdVbmRwVzRy?=
 =?utf-8?B?UFRnUWNybldZQWNJanNwdEJCRFdMcjQ1bUhUTTNEa09PT3NCZHhxQk5iZzRN?=
 =?utf-8?B?TEVVUWRhMXd5cEhiaFZxOFY0QW5ZUHo5QmppNmVKd0R1L1dXbjNmV1RMV2Nz?=
 =?utf-8?B?cUJEeml1dUpuVElCVC95aDhpanFjZENkNTdJQ0RNODk1dHdBWUVjTWhQRlNK?=
 =?utf-8?B?MjhnSHV6Q3AyaXJ2VWs5T0pIaktYV1JOZmthVSthNUtjSXVwNlliS0ZWa0Zz?=
 =?utf-8?B?Y0lkUGhuSENER3pmQ3RVZzFNajBaVURSblZVNEF6emxxTHpsWlpVaXUvZHB5?=
 =?utf-8?B?WVpuYUJWK3U2S3cwVGR1Q0pyNWJlRlhuN0E0WVpsSTEvQkxXdHNZNjVFRmZt?=
 =?utf-8?B?V1BGckNZSnU5RDB4N3doSXhjb0RGUks3NjFweWQ0VUFQSVZNcmZYTmo4a1ZX?=
 =?utf-8?B?eElRdFdwOWZUM1ZPSGdIR1AwaVZLcXkzWHBpR1R0bDg4bDRVeFdTbHNGdUUy?=
 =?utf-8?B?cE9RMml4enl6cytQVlJacDZzLzA2RmVTZTlCTnJ2S1cwUjdQOWtGbkZSOFhk?=
 =?utf-8?B?SS9FamZTWHBQeklQYzBNM0ZaNHZxU29aU3h5N21HWEpmZ3VtTC9DWVA3dncw?=
 =?utf-8?B?Si9MNUVFbWwyWHJvSWJKWDhqYkc0RDNGZ2dPalZESE5QMWFjc09sZzVQbDdN?=
 =?utf-8?B?dTNuRXkvSmFMNXJZck9BemZ1NWxLbm1qNzZhOXdrZHpwMHE5QlFaUGM2VGl4?=
 =?utf-8?B?QzlaazRQdjU1c25hdFhOUW5BeW8wSUlrSStlb2REU0tQY1lIUXRYZlVYZ0ZR?=
 =?utf-8?B?UHRPeHdNWFpNUGRzRUdXWCtDQXZaK2Q4YUdwY0kzOCtvWmM0ajVzZ1BOMnpa?=
 =?utf-8?B?VEsrT0c4bEZCcXlDYVQ3a0VLa3gyMm1acjNtYlhISkhuTHBuR3NDeHlrUnFs?=
 =?utf-8?B?dHVQY1pSdUJvdnV2Y2VzbkxsYklCWjlkSlZQWjQ1ejdycTBlYS9welN3T1Zm?=
 =?utf-8?B?LzlDMm1EMzVYeUsxV3VVZlZhd0E3U0Z1VUp1b21yRkJwV3ZaSDR6M01jU0hE?=
 =?utf-8?B?SWZMR0JWRFlXZE0zVVFTWTR5a2tPK2hiMVRlZy95Z2YwajVkRTNRUmhJQ01O?=
 =?utf-8?B?KzZCL1dYT0xmTlpzMjJKRWJmMFhEV2JOTFpzK3JCbnM1VVMreDduK2UrSGQr?=
 =?utf-8?B?OGl4M1Zjbm9KekZpRkUvalorK1IxejZsK0NIelBXNWIyd1hyZXBVQzhpWFZr?=
 =?utf-8?B?K0pHcTV4NzJLOUNUOHUzZTJCQ1JYdmVLV0JtcFN2Zll6V1c0T0JETVFyTUhl?=
 =?utf-8?B?K3hRN0pIOU9iVkpsRzd2WkU4UGpOTnFyM2VKakpHSGk0eUpJKzJ6cWMrL0xk?=
 =?utf-8?B?Mkk5QW0wYVBuTk53Y1FRLzF6cnI2b3dDS3E4R3o4NG1TdHdpOVphVzFCcWNo?=
 =?utf-8?B?UTRqbno1VzFSS21xMFRJYS92clBwOW5vcnB2WUw3QkpCRUVlT3hRT0ZxZzhQ?=
 =?utf-8?B?eWs5MFNHOVpISGliVS9qaS91Y3ZWbkhGWVJ6VWUzbzBBZ2JhYVphalJmaXVH?=
 =?utf-8?Q?E7Y+sU8g+GOBfqWnEZtC4a4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3f11d7-7fc5-400e-d27a-08dcd3a9e2da
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 04:09:38.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BpcUaxLDCSLE1eHY6NxSuITyEjNAZCx5gDo/f7KsKLyA8ZI8zVtwsr0dfL1gJmaRw86rkv3xguLAroM+hk0AWfTSfaD1hI99V/Cwd3jbPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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



On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
> void.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>   13 files changed, 59 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5edb1cf51ea5..cce754801e8d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   		drm_dbg(&xe->drm,
>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>   
> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   int xe_device_probe(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 01f643f6aaba..e5defce08281 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>   		if (fw_ref != fw) {
>   			hwe = NULL;
> -			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   			break;
>   		}
>   
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 73d37e79da9c..01b8bfdd748f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -11,6 +11,7 @@
>   #include "regs/xe_reg_defs.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   
> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>    * and waits for acknowledgment for domain to sleep within specified timeout.
>    * Ensure this function is always called with return of xe_force_wake_get() as
>    * @domains_mask.
> - *
> - * Returns 0 in case of success or non-zero in case of timeout of ack
> + * Warns in case of timeout of ack from domain.
>    */
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      int domains_mask)
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       int domains_mask)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	 * in error path of individual domains.
>   	 */
>   	if (!domains_mask)
> -		return 0;
> +		return;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	fw->awake_domains &= ~sleep;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret;
> +	if (ret)
> +		XE_WARN_ON("Timedout for domain sleep acknowledgment");
> +
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e17fe316dc3c..c2c729371b2a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   				   enum xe_force_wake_domains domains);
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      int domains_mask);
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       int domains_mask);
>   
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b0126daee359..5f5760b60eac 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	 */
>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   
> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_init_hw(gt);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   
>   err_force_wake:
> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>   	if (err)
>   		goto err_out;
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	xe_gt_info(gt, "reset done\n");
> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>   	return 0;
>   
>   err_out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>   
>   	xe_uc_stop_prepare(&gt->uc);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   int xe_gt_suspend(struct xe_gt *gt)
> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_disable_host_l2_vram(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "suspended\n");
>   
>   	return 0;
> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>   err_msg:
>   	err = -ETIMEDOUT;
>   err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>   
>   	xe_gt_idle_enable_pg(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "resumed\n");
>   
>   	return 0;
> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>   err_msg:
>   	err = -ETIMEDOUT;
>   err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 86146de1d31c..2ecf3c87c6b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> -	int fw_ref, err;
> +	int fw_ref;
>   
>   	xe_pm_runtime_get(xe);
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_hw_engine_print(hwe, p);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
> -	if (err)
> -		return err;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 9af81b07ab7a..1a7ee5681da6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   	}
>   
>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	XE_WARN_ON(!fw_ref);
>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>   		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>   
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   
>   	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c7a00565216d..27ad412936f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   	 */
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>   	*freq = decode_freq(*freq);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   }
>   
> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   	*freq = pc_get_min_freq(pc);
>   
>   fw:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	return ret;
> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
>   	xe_gt_idle_disable_c6(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   }
> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>   
>   out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 80e5c4ef86ef..8d7d9e7ade51 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	xe_oa_free_oa_buffer(stream);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_pm_runtime_put(stream->oa->xe);
>   
>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   err_free_oa_buf:
>   	xe_oa_free_oa_buffer(stream);
>   err_fw_put:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   	if (stream->override_gucrc)
>   		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 96d5ec1fbbd9..4372dd727e9f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);


wrong assert in few places, Will fix in next rev with other review comments.


>   }
>   
>   static const struct xe_pat_ops xelp_pat_ops = {
> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehp_pat_ops = {
> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   /*
> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   	u32 pat;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>   		   pat);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xe2_pat_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 7c866b736f00..df7bdf3822cc 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL)  {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -EIO;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 6ab6a48b1d29..874523f22f56 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   	xa_for_each(&sr->xa, reg, entry)
>   		apply_one_mmio(gt, entry);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return;
>   
>   err_force_wake:
>   	err = -ETIMEDOUT;
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>   }
>   
> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return;
>   
>   err_force_wake:
>   	err = -ETIMEDOUT;
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 3b5256d76d9a..1384c97a75c2 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   	/* remove the tile offset so we have just the available size */
>   	*vram_size = offset - *tile_offset;
>   
> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   static void vram_fini(void *arg)
