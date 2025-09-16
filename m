Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B48CAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 14:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057F610E800;
	Tue, 16 Sep 2025 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKxWG5Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961B10E801
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758034597; x=1789570597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=etaSsaatT03kr1LJUCDHyctMt06BdrxQ+ePr+T+jLao=;
 b=FKxWG5BkxS2L2+Ye7VOL9EtJIpOyMk2fM9Gy9OvzRMPkfCoR64m4dweA
 gDEmCnmQme1GfNbEzMmz/3wMnCx7fcbBkQWKLx7y1LW91xzvaqY1BPAts
 5FZanjQMsHX51F1UIfXTLvH9a1o+/pJLW6aWLUPg/aysTrTrWrbisTne7
 7GQvBybYSd7lid/kEGFA2dnFM03Fj8xfgM7E3gB3u7mC6lh+cgTWepW6h
 nAfJ2TUFXXFhy/CRyMMds+8a10X6KGJJRSB41KTbEogT1jt/NfUcw0zAm
 KVJ7VvyOtDAEGLCR/HleECNPpnNYXcQgCJkEkCuMGklCwlRguOBuuvoeU A==;
X-CSE-ConnectionGUID: XwYc8xCYTMetkIUc82NdFw==
X-CSE-MsgGUID: 3rk395kESwqwJlDMGCc0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71684275"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="71684275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:56:37 -0700
X-CSE-ConnectionGUID: nfb2dIshRSKTDcrXLPTUrA==
X-CSE-MsgGUID: Zi0eJ60ASF+LcKHOdBUHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="205917522"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:56:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:56:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 07:56:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUEyWhZtDzMe+EMB5OvkLwbfa1TuhwxKVgZx6dk9E/FOK4Z87omq7kbSOEkPueOnaAAHUwcACoPT0Y5wtDGsB7Lj86jyHsl6xiqTO/bphfbi/uIbHLUlPQF1vn72qW7bhRYkXNuNREXXfzQVt/kruaViQpnQxbIzYexprXrGBj0alR1d0t6bE7Ej+dhqffFMo+ZNtBPB/y/3eYlcAmPJhfg9HGjYFApHpoP97QWCx2XGrvk9yBLrX97nTeFKT5y64lUVfY0AjaUiFc2gOmHs7jt2nxF/X8CWwlVUYUorcOjQ8jKkSI8R0zSMjMrh3m7zx8rTnhnYtHv96CjDqJqA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP9ueDXxZnRCojjek9cx721LhHQcWowRIfu/CjB1WUE=;
 b=G6n4uLplPN3PpSgt3a845Nonp190IVR0cfo91+ixudyOtiIF/xATWFCbPZo5ZYRmv5kcsBY0MZ3iFvgHwzEIkO4ObMAoeq6qq05eH0XPKYl//v+KxKvYT7zYHeVAyWsL2SDIfAsQ1BDHmCI4FPJxaztz2ml59KY/kcApRZoNbFhTVsDRpjRMxNTpENrnb9zPEqMxUQJ7FzbgxdaOqdIrfG4BdbW13/QOHz0TOM5G/gaRwJbb/v6RJnNivTEUgwFdwbpl2KiIIjhMKGTy4XkxyvJWzWM55SUSpkdDKDKvuUIWXTTFm2SIt1jia/xBXXZl34fAfCjHMIY8xU48iyrWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 14:56:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 14:56:33 +0000
Message-ID: <4d821c9d-9c9e-4087-9046-3443d052130a@intel.com>
Date: Tue, 16 Sep 2025 16:56:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
 <wrdmty6mixvzuononvsfwqcg3ftvsraallbaibauffhfymizu5@ejcdqwurfqd5>
 <32cb4726-ad85-4240-b40f-cf5a3b499fae@intel.com>
 <6fpcepsb32kih6p6x5dktxwpt3bawpgch666wltrqfsd3r4uwe@vjsusedz6v4p>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <6fpcepsb32kih6p6x5dktxwpt3bawpgch666wltrqfsd3r4uwe@vjsusedz6v4p>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0024.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: bfee0a11-c2f3-413f-d667-08ddf5313a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZaNndkQ2l3NnZ1cEd3MFV4aGVCcDRpUk9VSGFNcVE2N3BTbW9YM0pGOVVT?=
 =?utf-8?B?WG9lY3ZwWTFoRFNpdkZUY2s1c0MyTXRyOHJKKy9xVVdFQjlSeHVOemxWSFhI?=
 =?utf-8?B?Y2gxczllSlRDSVZZcHkyZ0hsY1FFT2UzMkR5eW1pTE9IckM0YVNFRmJjRFRh?=
 =?utf-8?B?T3JISzVmVHpwVFFOeDJabFlua0hsd2xSYnFPbmtkeVJUVUdKQy9rVkphQ2w0?=
 =?utf-8?B?V1FpRkk2YyswNUJMZm8xdDJQOVZOV1pxQk5KTW1TZnZJeVhMaTV0Ukd3ME95?=
 =?utf-8?B?b3lJK1kvVjl6S1lSKzMwbzJ0NWtGVXlYQWFsNUhlcWprTVhBU3VvOHRuOEw0?=
 =?utf-8?B?amFqNCtuSWQxRUpISTZjLzErSGJrck9yeWlyQllKU1JXU3dUczVyLy9PdjAr?=
 =?utf-8?B?VHZYVVhVeEhaZzlRNlI0TnV3QkVTY2RoU0gwVU5TbytGdlRyR3hCWnNLWWFV?=
 =?utf-8?B?RTdVbTBzQ2QvTmR1dzdaTTlERVorcEZDMzlOVDNuV1dHVkxlUURTZFJOUjln?=
 =?utf-8?B?NVBMWnVPS0F0bGEwaDgwMHE5d1FFc3hrdExScW5DRFI2Rlg1eDBCVlJtenl4?=
 =?utf-8?B?M3hHSm91RmtuU1FtQ2pueUM5enFhN1lWcnZXTVVPelI3OEpMQmpKUndWRERF?=
 =?utf-8?B?YWZKa1JqWUdnZlVrU3Boc0ovRGNCalF4azM2TFA1Skh5NC9ENy9GeDJwM3A3?=
 =?utf-8?B?aFlIaGVQdzM4bGZtdFZhZ2lDam0xcXVaUFEwZ2loTkk3cE5iWFlkNkFWN09Z?=
 =?utf-8?B?QlRYNmtWREFjRWk5dTl2Yjh0YW0yLzI1clhrZUJmUXVZLy9UZit3RFB3RTNn?=
 =?utf-8?B?eE1WeE5TRm1yVjg5ODR2a3JRa09tRlAvNm5ySEgwRjEzeUNpR2w4dXRJcnd4?=
 =?utf-8?B?NzBBdGgvZ1N3dTBHKytXNjJwSFY1dWZOYkszK3JiY3NWSk9kS3ZmenZoZVVF?=
 =?utf-8?B?SHppS1NaMUNNaTBpbEwxekYvc3pIWlVvMEkzQkNsQVdwbi9zRG5kcEpaQW9G?=
 =?utf-8?B?elV5cEtWeDQwTDVpTGdZd0JEZG1qb2lvTzhrOXlqRDIzOEZmREFrUVhEUEg5?=
 =?utf-8?B?ZGdKWitBZnJkQ0JVTEQ4TVkya2ZORTJqWmw4ZXprNWZZeEFrTnFWbXZFSFVM?=
 =?utf-8?B?ejN6WUUvcjZNM08rbW1lY2hKTncwQ1IyQmZKSFVXL0RVR3llVHVzYXA5QXQx?=
 =?utf-8?B?K2IzREhDaEI2aXRUeFRhbjRjY2RZeVVnT1VvWnBUaWdhL0pzbnRNR2NVN3pL?=
 =?utf-8?B?UGhKeFBJMzJYamE3YnZLYzdHNlduRjJZVkJyZ215NzVzOEJOa29XMksvMjdM?=
 =?utf-8?B?QUs3NTQzcUpqSk5QVm5yWTExTXB6aVdFWVBHZ2ppUi91YzIrajY5bzJMUHFk?=
 =?utf-8?B?SkFSQU1oVFRjd2JiTWZNVkFQOEdFamZ0VjhoYWNPL0VrbHZqTDVxdTBOMldN?=
 =?utf-8?B?R3dqVG5LRHpoelV1dFpyTjlNQTFOZVBqc05yOFRtWk9xRGdCcG9vNGFFOXkz?=
 =?utf-8?B?bk4wYkF1ZWY5OUJSZDJpY05Ja3V6aExJc2daTkFSNEVITlYzaUlMYmVLY3Iv?=
 =?utf-8?B?eDgvMVhvakptQzhsTjZvYlZXYXNpOW1adHNVKzBPNnl1S1hQcXNUOXFacnhD?=
 =?utf-8?B?RjNDRlR0WVhzYytjVnlQQ3BjL2E3TXZ0clBwSHRDZVhORGN2MUk2b3FiUlFH?=
 =?utf-8?B?dFdTaFdxRlVOeGExU1FiWDB4VTNJUUJKK3pMUGZZVU15S3RReTVBV1NaOHB1?=
 =?utf-8?B?OHh4aTFlLys5b2g0K2MrOVR2T1J5aFBqK2VTejVFTnVTUEtYazQ5NmlRRkxY?=
 =?utf-8?B?T05uWWhvNmRqWUF5eGRGUHNHRGZUTS9zNGVYT1pxdXkyRkhTSTJLWTBIMDlN?=
 =?utf-8?Q?ig8m46NAuoDur?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmtGZ2V1YWFQZC9lcUVvVndkTDFyOEpZK2FSYjZtdXRzdUJxc1JPcVFTZ3Fm?=
 =?utf-8?B?UE1oYXNyTWxkM3NvUVdnam03SnQrQThYWEhZUGxQOXNyVGpSaDM3eW5wTlVh?=
 =?utf-8?B?SEl4aEk2eDJGYjlPMzVmUGplUUhWcmFiZlFVRTFmaHVLbi9PTlRqdE05aEpj?=
 =?utf-8?B?T2xSTTU4b3JBZitLeGxveTRDYWFaZG1ydk51L2M4bGpjQjJXNnRpRzRYdWtY?=
 =?utf-8?B?TjVhYTlPZjdPc0x3MWQ1V1EzYWxsY09wR09ndU94Sk1LdTY2UDVldm9HYm1T?=
 =?utf-8?B?by9XUTRKejRhRUJHVWNEWWwzcE9NazNwNUZwL1VYWExnQzRXNXdHT1JyQXZu?=
 =?utf-8?B?WS95a1BCWjB4b0oyOHN4b0dGMUszc2FqcTNUckFmM1RQZ1Iwa3RYNUdPNm9o?=
 =?utf-8?B?ZFByaUtRWkdkZzRCb2JYelZKd3ZmVHE4dzIweHZlK25LeFBPQmJOTWtwK1k3?=
 =?utf-8?B?VjBsK0NocEZIZGExN1AxOGRaQS9BWnlvZmJPZk05NmJGbFNESW9zWHhGMXJU?=
 =?utf-8?B?S3NNazhHMjU1bGZSMXhxdUhkQXlQOTdYNUNFVGgwVHhHL0c0QzZzKzg5cmhR?=
 =?utf-8?B?V29zZEJSdTN2RDhzZWVQYnBsU1dNZ3N0OTJvYUQ4Qk1UVlVFSVVadUk1a09p?=
 =?utf-8?B?RHh6ZmVPaTlnQjhUbU9Mb0o1MTFCcmU4eFpIT3ZvRXlJSG42T052RTF5eG5y?=
 =?utf-8?B?a2hMYjRtVWVuU21YeG40MUhMKzgvb0djRU1ib0tQT2dSSFhSQmUzN1NxRTEr?=
 =?utf-8?B?dWNCL1RKdmIvR1gyc2tpTlN6cmFMeEdiTjlZNVVTcU05dHlJc0l4dFY5b2Ez?=
 =?utf-8?B?cFdiYlhhQzYwZTNwTCtubjVSRGFNWHFsSFJ6WHQ1TnN1eFE0bU5HeSttMHpq?=
 =?utf-8?B?MkZLK0ozUjUxWFQ3N0ZkTjR2WmxmVUZXd1lZZHJaUStuZHl1NkhTb3dtZlhF?=
 =?utf-8?B?Mzl4VDdPczVrR1FOQnFJeExrclBZQUkzNkJVb0ZuaEcveGtmRGlhYXdSNll4?=
 =?utf-8?B?Slc3d0kvZi9MSzdsNkh0TFdIaTBjbkJjWkpFTExSK2Freit6YytkMVJPYlRP?=
 =?utf-8?B?bDM0THZkY0F3ZlA4S3ZzV1lOMWlrL3ZqeElFVC9ZZ3NVbUxOWHYzZXFZN2VP?=
 =?utf-8?B?RlVOR2VEdkhwL0p4TjZNWElKbzlWQVg2MWtCOWEweVJYTE14SU9LcnErK2E1?=
 =?utf-8?B?SlB0bHd3TVBER0traXRYOGtkUG94WFFZUnZ4TFEwUjBUT09Gc3JFUU9LRkhh?=
 =?utf-8?B?dVpWZ0tTKzA3Sm96a09kV2lFck5SanVvbE5abWdKUDZGcmlRWnJKcU0vTlF6?=
 =?utf-8?B?dTZRWFNiTlpCeG1xT0llOFBIWVRCMHFDaUF3SWUyaW1mYW5NOHR4QUlIeHZR?=
 =?utf-8?B?RUY2K0FxUmxBNUVhSVRPY0YzRWkzVWxFU1lDYnZybXErK2QvV3FzbVhJVkZh?=
 =?utf-8?B?R1VsZTN2OEI4a2JkUEZhMm5YODN1V0pOb3NGeElDZTFLTGNvOFJnekdRS044?=
 =?utf-8?B?WERDVEpNeW9xT2N3c0pwZldKOUV0RGFrcHZEeEZMMmhBcVVkMU5UK2ZjWEVj?=
 =?utf-8?B?QUdMRytvY3JjTmh5aWQ4b1h2Vi9MbnRPRGYvUWVnU0c0VHVEbEZRaHZiN1da?=
 =?utf-8?B?blczRVZUVE5WK0ZpdW1qOFdPS0FVOXNxSTE4UmIrYkZNc1ptZjNQaUlsNXc0?=
 =?utf-8?B?U3pkL3lVNUtjd1FoWDkybVNRcjFSbEpzcE1YZUNlQ2hJemhwbWUxK2NQOGVj?=
 =?utf-8?B?dzRqbDNqc2pXTjgySVMxOHpVbW1EVmgvazZWekFhSDQ5TndhQU9BZmo3aFg1?=
 =?utf-8?B?cTY0L1NiSGFuSTErK1hiU3N6NThqQ0FEdTkxSXVSUkIzdTg0MDJ6Tm96MXJy?=
 =?utf-8?B?MFArUlowVmlwdkN1VjZoQ0JHZjUwcTlKU2ZHTXV4ZE4yZlZTd2pyc0RIbnRH?=
 =?utf-8?B?VGpLNzcxcjdkb3V6RnhFdUd2K2kxaHNBWE5sQkRMajhVbVlTZjFDeU5NcE5D?=
 =?utf-8?B?Y3hVSjg5ZTA5UFNmZlFqTlI4TjZKL0ptN1NraUNqUGJvNExFSlVkSWpZUWhT?=
 =?utf-8?B?dnFDbi9INkF2bmZScWNweW9nTTdQaHBuVEh1cjl6S1JvYzZhSXIyNDgrcTFz?=
 =?utf-8?B?d21qcWowSHJVcUd2emZ0alFPaDUzQk9SKzBXT3NnZmJZdC9EcU9rMHZZN3J6?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfee0a11-c2f3-413f-d667-08ddf5313a29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:56:33.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xpOg44+nwKnOkNCfH9Y/6wyKjGlKW1EjLsuzCvcX6kEFKK7Cm6g0B3zVyGtWGVVDH0KyYMDwGly/j1o+x1AEQylL4nslv6AKMkwKl9qN4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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



On 9/16/2025 3:52 PM, Lucas De Marchi wrote:
> On Mon, Sep 15, 2025 at 05:33:29PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/15/2025 5:12 PM, Lucas De Marchi wrote:
>>> On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
>>>> Instead of manually maintaining each sysfs attribute define and use
>>>> attribute groups and register them using device managed function.
>>>> Then use is_visible() to filter-out unsupported attributes.
>>>>
>>>> This will result not only in less code and smaller footprint:
>>>>
>>>>  Function                                     old     new   delta
>>>>  late_bind_attr_is_visible                      -     183    +183
>>>>  ____versions                               80832   80896     +64
>>>>  vram_attr_group                                -      48     +48
>>>>  late_bind_attr_group                           -      48     +48
>>>>  auto_link_downgrade_attr_group                 -      48     +48
>>>>  late_bind_attrs                                -      24     +24
>>>>  vram_attrs                                     -      16     +16
>>>>  __pfx_late_bind_attr_is_visible                -      16     +16
>>>>  xe_device_sysfs_init.cold                     20      21      +1
>>>>  __pfx_xe_device_sysfs_fini                    16       -     -16
>>>>  xe_device_sysfs_fini.cold                     21       -     -21
>>>>  xe_device_sysfs_fini                         271       -    -271
>>>>  xe_device_sysfs_init                         421     135    -286
>>>>  Total: Before=2848898, After=2848752, chg -0.01%
>>>>
>>>> but will also fix some bad error handling that we had here.
>>>>
>>>> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>>>> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
>>>
>>> we should probably land the fix separately though:
>>> https://lore.kernel.org/intel-xe/7p7wqbghc2ebupbzljjaegakun3azczuby2haiqmmneavnpl44@joqtzfismsgv/
>>>
>>> and suggestion to rather use attribute group, similarly to what you're
>>> doing here:
>>> https://lore.kernel.org/intel-xe/3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu/
>>>
>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
>>>> 1 file changed, 39 insertions(+), 57 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> index 6ee422594b56..5b0b98ac9b17 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>>>
>>>> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>>>
>>>> +static struct attribute *vram_attrs[] = {
>>>> +    &dev_attr_vram_d3cold_threshold.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group vram_attr_group = {
>>>> +    .attrs = vram_attrs,
>>>
>>> since we are already checking by the attribute inside the is_visible
>>> hook, couldn't we just add 1 group for "device attributes" and
>>> share a single function?
>>
>> I tried that approach first, but checking for late_bind_attrs was
>> so different that decided to keep it separated from other attrs
>>
>> after all, this is what the purpose of having multiple groups is, no?
> 
> yes, my concern was just about having too much boilerplate. Looking
> again at the late_bind_attr_is_visible() you added I'm ok with that
> though.
> 
>>
>>>
>>>> +};
>>>> +
>>>> static ssize_t
>>>> lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>>>> {
>>>> @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>>>> }
>>>> static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>>>>
>>>> -static int late_bind_create_files(struct device *dev)
>>>> +static struct attribute *late_bind_attrs[] = {
>>>> +    &dev_attr_lb_fan_control_version.attr,
>>>> +    &dev_attr_lb_voltage_regulator_version.attr,
>>>
>>> As above, I think we can just consider them "device attributes".
>>
>> IMO we should _group_ related attributes into "attribute_group" and
>> either add them based on single prerequisite condition and/or provide
>> is_visible filter to control each attribute separately
> 
> ok
> 
>>
>> now as we only have five attribute, it's tempting to put all into
>> one group, but I assume we will soon have more attributes, and trying
>> to manage them as single group may not scale, so it's better to show
>> how to split related attrs now
> 
> ok, fair enough.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> But as I said before, I'm going to land the fix from the other patch
> series first as that can be propagated much more easily to stable.
> 
> Maybe one step further would be adding something like this on top?
> (WARNING: just build-tested, may very well not work as is)
> 
> | diff --git a/drivers/base/core.c b/drivers/base/core.c
> | index d22d6b23e7589..a84b74e487b0e 100644
> | --- a/drivers/base/core.c
> | +++ b/drivers/base/core.c
> | @@ -2858,6 +2858,15 @@ static void devm_attr_group_remove(struct device *dev, void *res)
> |      sysfs_remove_group(&dev->kobj, group);
> |  }
> |  | +static void devm_attr_groups_remove(struct device *dev, void *res)
> | +{
> | +    union device_attr_group_devres *devres = res;
> | +    const struct attribute_group **groups = devres->groups;
> | +
> | +    dev_dbg(dev, "%s: removing groups %p\n", __func__, groups);
> | +    sysfs_remove_groups(&dev->kobj, groups);
> | +}
> | +
> |  /**
> |   * devm_device_add_group - given a device, create a managed attribute group
> |   * @dev:    The device to create the group for
> | @@ -2890,6 +2899,39 @@ int devm_device_add_group(struct device *dev, const struct attribute_group *grp)
> |  }
> |  EXPORT_SYMBOL_GPL(devm_device_add_group);
> |  | +/**
> | + * devm_device_add_groups - given a device, create managed attribute groups
> | + * @dev:    The device to create the groups for
> | + * @grp:    The attribute group array to create
> | + *
> | + * This function creates the groups in the NULL-terminated array for the first
> | + * time.  It will explicitly warn and error if any of the attribute files being
> | + * created already exist.
> | + *
> | + * Returns 0 on success or error code on failure.
> | + */
> | +int devm_device_add_groups(struct device *dev, const struct attribute_group **groups)

well, this would be nice to have, but short term I would just stay
with currently available devm_device_add_group() since our two other
groups would have very simple is_visible() logic, so it really doesn't
matter if we have 2x extra:

umode_t vram_attr_is_visible()
{
	...
	return xe->d3cold.capable ? attr->mode : 0;
}

and single:

{
	devm_device_add_groups(dev, xe_groups);
}

vs simple extra 2x conditions:

{
	if (xe->d3cold.capable)
		devm_device_add_group(dev, vram);
}

and who knows how it would take to land this in sysfs core ...

unless we want to show preferred code layout, so short term we can keep
our fini action, with:

void fini(arg)
{
	 device_remove_groups(dev, xe_groups);
}

ps. actually I exactly did this this way in my rev0 but then
decided to use devm_device_add_group() due to trivial conditions

> | +{
> | +    union device_attr_group_devres *devres;
> | +    int error;
> | +
> | +    devres = devres_alloc(devm_attr_groups_remove,
> | +                  sizeof(*devres), GFP_KERNEL);
> | +    if (!devres)
> | +        return -ENOMEM;
> | +
> | +    error = sysfs_create_groups(&dev->kobj, groups);
> | +    if (error) {
> | +        devres_free(devres);
> | +        return error;
> | +    }
> | +
> | +    devres->groups = groups;
> | +    devres_add(dev, devres);
> | +    return 0;
> | +}
> | +EXPORT_SYMBOL_GPL(devm_device_add_groups);
> | +
> |  static int device_add_attrs(struct device *dev)
> |  {
> |      const struct class *class = dev->class;
> | diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> | index c5151c86a98ae..e398176679e48 100644
> | --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> | +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> | @@ -69,6 +69,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> |      return ret ?: count;
> |  }
> |  | +static umode_t vram_attr_is_visible(struct kobject *kobj,
> | +                    struct attribute *attr, int n)
> | +{
> | +    struct device *dev = kobj_to_dev(kobj);
> | +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> | +
> | +    return xe->d3cold.capable ? attr->mode : 0;
> | +}
> | +
> |  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> |  |  static struct attribute *vram_attrs[] = {
> | @@ -78,6 +87,7 @@ static struct attribute *vram_attrs[] = {
> |  |  static const struct attribute_group vram_attr_group = {
> |      .attrs = vram_attrs,
> | +    .is_visible = vram_attr_is_visible,
> |  };
> |  |  static ssize_t
> | @@ -173,8 +183,10 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
> |      u32 cap = 0;
> |      int ret;
> |  | -    xe_pm_runtime_get(xe);
> | +    if (xe->info.platform != XE_BATTLEMAGE || IS_SRIOV_VF(xe))
> | +        return 0;
> |  | +    xe_pm_runtime_get(xe);
> |      ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> |                  &cap, NULL);
> |      xe_pm_runtime_put(xe);
> | @@ -269,6 +281,15 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
> |  }
> |  static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
> |  | +static umode_t auto_link_downgrade_attr_is_visible(struct kobject *kobj,
> | +                           struct attribute *attr, int n)
> | +{
> | +    struct device *dev = kobj_to_dev(kobj);
> | +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> | +
> | +    return  xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe);
> | +}
> | +
> |  static struct attribute *auto_link_downgrade_attrs[] = {
> |      &dev_attr_auto_link_downgrade_capable.attr,
> |      &dev_attr_auto_link_downgrade_status.attr,
> | @@ -277,28 +298,17 @@ static struct attribute *auto_link_downgrade_attrs[] = {
> |  |  static const struct attribute_group auto_link_downgrade_attr_group = {
> |      .attrs = auto_link_downgrade_attrs,
> | +    .is_visible = auto_link_downgrade_attr_is_visible,
> | +};
> | +
> | +static const struct attribute_group *device_groups[] = {
> | +    &vram_attr_group,
> | +    &late_bind_attr_group,
> | +    &auto_link_downgrade_attr_group,
> | +    NULL,
> |  };
> |  |  int xe_device_sysfs_init(struct xe_device *xe)
> |  {
> | -    struct device *dev = xe->drm.dev;
> | -    int ret;
> | -
> | -    if (xe->d3cold.capable) {
> | -        ret = devm_device_add_group(dev, &vram_attr_group);
> | -        if (ret)
> | -            return ret;
> | -    }
> | -
> | -    if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> | -        ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
> | -        if (ret)
> | -            return ret;
> | -
> | -        ret = devm_device_add_group(dev, &late_bind_attr_group);
> | -        if (ret)
> | -            return ret;
> | -    }
> | -
> | -    return 0;
> | +    return devm_device_add_groups(xe->drm.dev, device_groups);
> |  }
> | diff --git a/include/linux/device.h b/include/linux/device.h
> | index 0470d19da7f2c..63cc4aaf5f416 100644
> | --- a/include/linux/device.h
> | +++ b/include/linux/device.h
> | @@ -1170,6 +1170,9 @@ static inline void device_remove_group(struct device *dev,
> |  int __must_check devm_device_add_group(struct device *dev,
> |                         const struct attribute_group *grp);
> |  | +int __must_check devm_device_add_groups(struct device *dev,
> | +                    const struct attribute_group **groups);
> | +
> |  /*
> |   * get_device - atomically increment the reference count for the device.
> |   *
> 
> 
> Thoughts?
> 
> Lucas De Marchi

