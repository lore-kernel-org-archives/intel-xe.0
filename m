Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B20CD4F52
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 08:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EE210E34C;
	Thu, 13 Nov 2025 08:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5SZMhd+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAE710E34C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021513; x=1794557513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/wYF04z/ffoPvW2xHi/Htx92AxTm2WjSj4PvDPrlpiM=;
 b=F5SZMhd+z+rAgryUUHf6w9BB/jYhKZVUKbUMQYtfKdCv+ul/Shu1HDth
 62/hq5XK3rqnvayO0CipTnQqeABL8gQo88OBXsNuyniBW3ht3t8yFPrvw
 ZnlvSeXsC0+rMvK2qwbqbb9jpNZcm1M8gd1v6Z6+lYptQUIi7TYXw01qo
 nGOA+5laBTRLMMo+SgmpBJx+peJKWe3fNWmvd7sT80xMjU7KMgLrT+c6F
 Mdyh+bQYtZgY9VGxm13EZFWyX4HtUns2Gsc9R/qTXGcT2Wra1d6WyH/5s
 dp7WcetnovCmOD4dho/wCATj8A3KxM5lufiB1uxRNMOaGjBeDE0Zmn5ZA A==;
X-CSE-ConnectionGUID: Z5z9qkWsTiqvLdxAL4FJEw==
X-CSE-MsgGUID: 94YMsYTMQlKmwH8uuBOvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65022063"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65022063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:11:52 -0800
X-CSE-ConnectionGUID: HpUTwE/AStKOdx7FL+cGvw==
X-CSE-MsgGUID: w/CLg+jlTH+5ermDX3QGWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194431801"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:11:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:11:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:11:51 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:11:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBkUmb8m2YjkSJp8uB0KS28kQTGz9SXPltA+wZO2RBiPFHCANFA+/COm7duJ4LnNSGZaA+1gRoTx6NLB9hsEbp6DoKuScIDBCiuvkyoOmv0rH5Bwc8DMRyfz5Tsw7arkdgEMgI050sVsDlanW7fUq2dC8ygwvlH95Xk17JlVizf2B4IDarjpiVF/oYm6cZg/KHdYcSrH8gfxzTyfHplKNz/tC+pt/nAUnOWYsVxeSoKuMqjSWhchGdjDmSMp0MZ5Glbtu6snqx8iMClUAAimoC/bOu/ivalNE78IaXCIrA5U56/RUhYRZoQP9w73KDk8sdAlSvWpcMJxmGcoSxVTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSWbNKkKigSqzAPBswdiJpE8ajqb0Mgibc3SSqmLsxc=;
 b=FGTf4L9W7vCjSSxYjTYJgzOijL1VBMxwon5H2hHEBvJ0tI7Ugd8nCG9kCAQUDGBZ2uL25Z/tAgWQpngGTd6rjnhkiCLHZchk0d0W+2pceiYZ2n2UGCLKRTiZRRwEZ3V4fcbT4sZyVo8JXE1u3E1aQgKy20lHBk1lcVDmcX+aQwuZcpjvJKjeskcDExYSlnyvcJtrzqV4pohIwIKiZpwTsldAKbDOjuNCS1PJJKGJ8X6ALda7BcNTB+Spz2W1OqwjyAkVsMoWMg6uRmWqu5AmF3X2jhts75zpi2hloITExe+finj344R6npAKjA4EpowpTNIEJpZE7WTqtT6AEmeE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 08:11:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:11:43 +0000
Message-ID: <8450848f-703b-4eef-8de9-0b7665da001c@intel.com>
Date: Thu, 13 Nov 2025 13:41:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pcode: Allow checking for mailbox command
 support during driver probe
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <ville.syrjala@linux.intel.com>, <karthik.poosa@intel.com>
References: <20251113044620.537345-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251113044620.537345-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: a6af6ae0-6de5-40d1-ad42-08de228c4809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tjl4YlNQdHREY1ZrYy82UmhtTGxaZmliMkR1bW9YZXRKM3hEdWt5dHlvWGVE?=
 =?utf-8?B?TUJlaFdUOTc0TExHRWpXWk04cGdQcE1jTnZpTDhibGVwWXZDS0NQYXNQc2VC?=
 =?utf-8?B?UmJLOWlTU25LVnNpM2FtUGNlMWtWVWVnUHVraHljYWtCL1lhTXYxMURjakFS?=
 =?utf-8?B?WlNyOEw5SVd2ZHBpSldOeFhycDBka25xL3B0MnJTV2dma3IvenlxSElFMzhw?=
 =?utf-8?B?NFJVbnRhZWZPeXJpVzFGblpleGltSU1ZaUdDeTByd0pnemYxdjBKWGFkTGJK?=
 =?utf-8?B?ZzFkV2NuYUVYNC9aRng5RmhBSmlPKzFlbW9vSks1aEFPUmhMOXVoTTBaa1pI?=
 =?utf-8?B?TFQ4cGp5Rm9WVExRZlFIY1RLUEcvUUk2eUEyV2l4MnBGbC9lWXJTT1NXb2pT?=
 =?utf-8?B?YkUrM3lZVEZjdnlFeWx4WjN0T0g0dHF1enJXc2k1Q21aWjM2Z3QvT1h0YzRR?=
 =?utf-8?B?Qzg3RlBrV0ZNeUdPN29QYmxXVFR2Z1hqWVFCbDdZSFkvQ1E2bVVqa3VsMXc5?=
 =?utf-8?B?OFFSN1lrcWJuc2xZazhMbHdaeDYzZDVza2VDbExodkhmODVGUHZEM0kvS283?=
 =?utf-8?B?eVFJZk43dzlNVkp1MWNZQU5Tdk1RU1ZEdVNRNjFCLzJaNk5FUm9icDJXUGE1?=
 =?utf-8?B?NjRWOStLQ2xvVmQ0bG9aVFBxZnAzT1FJdCtyUys2c2xwS0UzWWFHbVhPb2tF?=
 =?utf-8?B?di96ZjE4ZzNMWlRXb00yT3RMTUZqRzZkdFl2NDJtcHk1ckRVeTlsNzArRSt4?=
 =?utf-8?B?UVExUVJkZEVSUzdkeHJpazNLcVMzTUpDNkhCaTN2U1VjTUVJRzZYVU5BR2Ra?=
 =?utf-8?B?R2hiWGdDSnA5T1FpT0dlMkw1RlpWZHhlVXJTbHRqVkdMZkNJbnVlaTBweFp4?=
 =?utf-8?B?YmlTQmRiSVFIYkFxaDBwblFaN05HVjJpcjkxTXAxRDNOY1QrUHlaa24vRE5O?=
 =?utf-8?B?azlrUUUvSDVUdXU1Z2RQOG5WTE5MNzF4c3hrOUlVMTFRS3BEcmdGbU10c2Rq?=
 =?utf-8?B?TExacitiQStWejVNVlV4dmNPM0ZuS1IzOXRGb2hML0czOVBGS1krQ2pUUWx3?=
 =?utf-8?B?elNFNnVqZkFSRjNLdndDOXR2NHh2ZktnQ2dCd3VUSVZReWdudmFnc2U5VDky?=
 =?utf-8?B?WWkwSHYzaTdmOFJCRVNobjFXSEttMFFwRFJ5b01RaEV2ZEEvTUNLRm0rT2M5?=
 =?utf-8?B?eElSUDd2UXp0S2NxWjM5VTZqT1lGK1hTRkVPbnBHSmc1SEt2Zlo5cjlFMmlN?=
 =?utf-8?B?VGx0NXdkRzU3eW05UFNVSlhCNHN5WVNMZk5sWE1mSVM1SjNuLzFmRE1ZVjZ6?=
 =?utf-8?B?K1N6dXk5Nm8zZFFTK09oOGJvYzlQdzRTUGc0NTFtN0FhZCt4a0E3akRleTNG?=
 =?utf-8?B?akcvWVpCdXFNZ1VCV0ovUkVxNXJaSm1GZllTdGg4ci9KT3hFSlplYVR1UTZ1?=
 =?utf-8?B?UmNlNDFjZkFSeUJHMlZGK3BHZGUyYlNsSnprVVplVjNMaGx3cVU4OFNqQVZm?=
 =?utf-8?B?S3FWamJjWWZXY3UzaHpyZEV5cmV4eFRLVXFFbFAya1UvUUVEZGpsTFlWTzZD?=
 =?utf-8?B?NzMxdW16YUhkNXAycjMwcmc2cXlBM1JhN0EwUEgzaFQ4bmFPQmMxRXFzRENJ?=
 =?utf-8?B?S2grVHc1aUZSZEF4cysvL1dMNytsMjNwTUUyck40aWNKZ0tEYlNVQWZKamVl?=
 =?utf-8?B?c2lNUEZoTWs2WUZrZUNsYW1NWHNocFl5VWpZUnBjU0x2UEFIY1EvRU5CMC9L?=
 =?utf-8?B?Z1dHdUpWMUJ3ZDRhU1V6K1dKSVFiUnZpZG96RmtpNG1VN3dvalEzV1RieE9Z?=
 =?utf-8?B?NmxXRXVMVUNtYlZ5L04vdWQxVGdrVlNrK2k0akFkL1VtbEdPaktwaXVHQkVl?=
 =?utf-8?B?MmNhdCtOWmpxN1Z2RlFUNW54WUNocjhYcnhHWG1vRFdtNW5ia1AzTEVpWHhW?=
 =?utf-8?Q?UenipeOTuCtYFAwv9ewG2A5h9HjJKn71?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RpaDE4ZzBRNUYrMmlCQUZSK3RtZ1VpQnpGMVVxU0x0TVBIZW5vQkQrckll?=
 =?utf-8?B?NG1kd1JaUzgvY0ZHU3pWZGMxajVZWGtOZE4vNGQ4NkZpSWF4V2xXclhCRURp?=
 =?utf-8?B?MjAzdTM0cWt0dDBSNWNMMkdmakNFeUJMZjNMaFhKRm5LNU0vUGdSZVdjaHh5?=
 =?utf-8?B?SnB3K3Q2YklOWGVsbzd6NTBXMVBYNU1vOVJMTFBGb016NHhQY0c4RnV2eHRy?=
 =?utf-8?B?d0IvQ3FKTzMzMmRGQURzRWtFZEZFWXZlS2RjeERXTVEzYUthQjI4UEIwbTR2?=
 =?utf-8?B?TkVSSnpyNk5lbXpuY2NiY2Z2M1dLdDA2bjE1dncyQnZvR1Y0YXRHbzRVelFT?=
 =?utf-8?B?SXJjUmFvbWpzbmVTa1gySUtWTXkzTjA4NElxaE82V0pBTER0V2R0ZzRvTVhl?=
 =?utf-8?B?cmpCZUVQTXBzcXUwL0EzUnFZUElwZ3AxWDlYWDdHTjBZK2pSVkxYQmY1Tmxo?=
 =?utf-8?B?c1gwZEtCMHZZTDdLaVRlL0E5OEVraEtkbEhPSjBzMFZVVDFRZnh5UDZvV0J6?=
 =?utf-8?B?NDF6UWJCZkRUTUlqeFlMNkwzWlUwS2pCc1ZFbmp6WlZnOG12SGUxRkowYVo4?=
 =?utf-8?B?RUJYdUV5RC90VmZBUlhBRFBTYUljV1oxbjJGVnEyWWxZeGZ1alh3S2ovUzM5?=
 =?utf-8?B?WGtkUzZBWUJ1QlBwNWRQb0wvTFRJYVJQYWtmZU5oVFpYRGxsekltSnRnRDJs?=
 =?utf-8?B?eWg1ekU3eE1lcHBhRVZmUDJaZVFoY09PVUNvNzBJcTVLT3BiU0tuaERGQXJ6?=
 =?utf-8?B?SDAvcDN4ajljbWliYzV1V0ZzQ2EvRTNEMGt6dy85T2QyTmRUS29JY05mcXhY?=
 =?utf-8?B?V1llKzlqcDljcVRyUTJVQ1lqaXNteWI2bTNrMWZTb3hUVlpSZVdZUTRVYUNP?=
 =?utf-8?B?c1hKd3B5M0Q0R2NISGIralFySWpNakd1dTJ2TVJPb0NZY05ZUkRzL0JhUzJ5?=
 =?utf-8?B?ejB6NUhiMkZSbjBTVHJrbUFhbzBWZStsaW5XYm4yYy9scDVkdWhkK2tmQkdE?=
 =?utf-8?B?TXJjL085S3ZJanZIRU5HZ0NTT2ZGNFpyeUJ1VFprcDVEQjlIY0NDaDBrM2Nk?=
 =?utf-8?B?Q2JINTgxN2ZHbUlwZjE5c1VESUhmSXJKVVZVdGtlcHgxbXpVU2RIQ0I0RnR1?=
 =?utf-8?B?UExRQTNKbHowQ1dwTnozZDVPYVJlT0dKMmFNYnVUMVcvOUF4aUcxSkpWRkM2?=
 =?utf-8?B?bGM0eExZODAwU2g5cUx5N2FxVGZVQ3dxbThmMEJZN1ZFaWc0eDFEVDhXYzU0?=
 =?utf-8?B?TXVBVkJiWUFsTjNuNEJIb0xkVmhNYTJSQlRDTzhBandZa2haZW1WNWdLZUlo?=
 =?utf-8?B?NmhrL2hhbnNGNlNRNVIrcDY2NGs1ZnJrekdwcEEwWjVIQVZ0L0dhNmNtTzRV?=
 =?utf-8?B?S3RzbHBJOVZEZnR1czJDSDJOSlR5YldGc1pyT1V6V1VjWlFYV2hiYnc5N0tI?=
 =?utf-8?B?WkdFeXpwemxsN2NWdjY0ZzVBbmJYL0I2L3FTSURCT2Q2Zkptc0dnTVgwMlNq?=
 =?utf-8?B?TTlMbUxVZlN0bVBSOEhDRnpSTlB4MmtBdG5ZQ2xBTlQ5OGMxZWtnRi9kU2tN?=
 =?utf-8?B?ZElIYmdMaXdsSHNRWnpveXR2TC9XNE9rNitqUFp6ZktXSUNvZUpyb0Jwb0t4?=
 =?utf-8?B?WDdaRHFMck1aWjhhVkZYdEhEdkxYRWJGc3hhN0pFaXdUM3AxOHI3c25pM1h4?=
 =?utf-8?B?dXY1VkowbFhCUENic05pUnRWSmU3THp2U2RtdzRnamxkNFgvSUN0S3U3eWV5?=
 =?utf-8?B?c2lzOUVuZklhVHc4Y01XaFFVdVFwYmZNenQxZlhQblU3OVdkeStYNms4VkxN?=
 =?utf-8?B?aVBmeHVTWUU0bjFXS29SMVR0R2tNbi9jS3RqOXFCS0RRSUltelNCWG5PemVI?=
 =?utf-8?B?T3lLcERSM0x3Wk96QVpqWlYvV09NSTRneitsRFBNUytDWlBwaVV1RWU3bFZj?=
 =?utf-8?B?QmY3dWF5UmwvS051ZkVaSVc2TkQxbURma29zOFlDYVg5N0dTbDhINTUvUVl6?=
 =?utf-8?B?TlI2dEFiYTFoVkpPYjN1YkliTEs4QnVyNlR4cFNJNEZoQzFHR1h2NkJ3c3Jl?=
 =?utf-8?B?QWs5d2JvNC9yM3JKaXU0K2dydk83NE9TdkZvZUhjby9zd3NmQko4eFdaSElB?=
 =?utf-8?Q?F6s0arZtue2Gp8dBgxbzdZ2eU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6af6ae0-6de5-40d1-ad42-08de228c4809
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:11:43.5892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPbKJzCbKs3tZwtOhY3lIzMPtP+hlQF5qIRBpjmI4u6NwFncnWXkO2m7OTByPXMmllLCOpk0l1kKSosP1igrhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
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


On 13-11-2025 10:14, Raag Jadav wrote:
> If the device is running older pcode firmware, it is possible that newer
> mailbox commands are not supported by it. The respective functionality
> isn't useful in that case but nor is error logging, since it doesn't
> particularly signify anything wrong with pcode firmware or device as a
> whole. Log such failures as debug messages during driver probe which allows
> the caller to check for mailbox command support without it being reported
> as an error. This is useful in cases where we want to make a decision on
> driver functionality based on pcode return codes and a relatively simpler
> design choice compared to other solutions like checking pcode firmware
> version, which comes with additional complexity of binding every single
> command to a specific version and deems pcode commands useless in case the
> driver fails to obtain it for reasons unrelated to pcode.
>
> This only silences command related failures and still reports other
> failures as errors, so we don't end up hiding the genuine ones.
>
> v2: Split unsupported command cases
> v3: Add device bound check
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>
> I've not followed the documented device_lock() rule here because
>
> 1. It'll deadlock in ->probe() path.
> 2. I don't know the code well enough to tell if it's really needed for
>     our case.
>
> So feel free to weigh in.
>
>   drivers/gpu/drm/xe/xe_device.h | 7 +++++++
>   drivers/gpu/drm/xe/xe_pcode.c  | 8 ++++++--
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..e8f997546ae1 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -12,6 +12,13 @@
>   #include "xe_gt_types.h"
>   #include "xe_sriov.h"
>   
> +static inline bool xe_is_bound(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +
> +	return device_is_bound(dev);
> +}
> +
>   static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>   {
>   	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 0d33c14ea0cf..0f1edf5155c4 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>   	}
>   
>   	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> +		if (err_decode == -ENXIO && !xe_is_bound(tile_to_xe(tile)))

Use -EBUSY here. The check should be against -6, which indicates "mailbox temporarily unsupported.

Thanks,
Badal

> +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> +				err_decode, err_str);
> +		else
> +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> +				err_decode, err_str);
>   
>   		return err_decode;
>   	}
