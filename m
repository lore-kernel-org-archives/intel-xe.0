Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C924CF8540
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 20:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DFA10E279;
	Wed,  2 Oct 2024 20:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsbOoZMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC4B10E279
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 20:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727902445; x=1759438445;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4kQzAo7eE7Vefuj2WCFhDdVimP8OEZpiZUYR63TABq8=;
 b=VsbOoZMU2hWnWN2LD7TdtnClnlaSQbXr3CsMzQHuC1bHiR1Dr05GgvJ7
 3FT6tkV+iLP68nqGrV14g/VBlbPkd5LLlDHuQ8xAXVQoQTOU/VRWX9VRh
 hbSxM0MpdE3/H4ybovioV0EiqlBRlgOVpWxiKKpgn0MBY2EPEZfb6vL1r
 fn5qcR4ZisgPTYuvJhMi/L/fImC5J7Y26g4GNDMZLZmXPYH5W+B/1UPXT
 hQFd/gjbmWxbJAgQ2HemRK1es6M+R2hduekMKpK+sWPtNqNP4tmYL8oxg
 UHwBODxB9Ty2MqmbWXB9zljiaIT4PrxhY2mGqy7BW0/dYG/jfwyduz2ML g==;
X-CSE-ConnectionGUID: lM9sSzwRRoqqelO33ZXZ5A==
X-CSE-MsgGUID: 4MpmNstMRVSwWYmbkM6cqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38466590"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="38466590"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 13:54:04 -0700
X-CSE-ConnectionGUID: D9JDTikNTAuqX+yEsZPJ3w==
X-CSE-MsgGUID: yDimoI4pSQGjItsjkY6Oyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="79096078"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 13:54:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 13:54:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 13:54:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 13:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8wQffx6Et+3VeOOWYxU+ep50BKbx7tEWXyhBnbHt1iVFS2z31BPA8ENIOxr5OAqOosRqx/3jyYHuPdcEgQ/b6nq5WxNalkwf8dDPyddgT/wa+RPnvsBWW+QM1v3gGYRWGylcwC62UszcA2ocGVVTubhk+EBaD6XYH+mjbj/Ay8rQR4SZjoORlrHsJrvgo6s/aaQZO+8jscOBM+NYCAQsL+M/ENXkOhpwPhil+Xm+Mw3RgKloQ53MZI3aruCtg7UEALYhnSXKmWj54DyPa+w12yi5gyj+Eg6fPoMeNEodUzb0lHi4MTr/v4nnefXGv/lvNQ475Nx/G7s116eX3KMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92NNgkfLAHiOtizVsVtngXwfJ5pLD+wBcUTmuWwZW1g=;
 b=oE/vCSsyoa1iv9VEX/Y1+ALdBrb7rsdQoCIY0Xkjz4TkUhZbC5OwF7lP44SY36epcFznUZMNb1MQd1p0Y9blDP8rfcIuGQecOe7ZVOrnWHnX7xWB3BVfNVr91Wkr3JjPEfKdOFdjR5Gm/B/IB9Hw7OOotS5lXfNXkv9wZwFkzL66+sw7BoUUHJH/BPgM/DriV4xm1BhDHBxCHyTANgEOsLdMb9Dm7S0Fw00Z/q1NhDhJQ5j0oyP/bDPUFVdGyDa2nMzbdYSYmOk06WQiY5Jy96FjGL07AuQnhCNZhsCEy9Ncl1CbNKKOpKOLLp6y2jdViHJngTeu/vimHm/UGgAlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM3PR11MB8713.namprd11.prod.outlook.com (2603:10b6:0:45::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 20:53:56 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8026.014; Wed, 2 Oct 2024
 20:53:56 +0000
Message-ID: <fa0c4e95-fe1b-4473-8a06-7b20b7809b1b@intel.com>
Date: Wed, 2 Oct 2024 13:53:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/11] drm/xe/guc: Use a two stage dump for GuC logs
 and add more info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-7-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM3PR11MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: fa13bdbc-bdcc-4222-065e-08dce324549f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFVVSzAvMitCM0xqRUQvSlBoVk9hQlB6U2lOWFFBTzJTVXN4VFVXeEVmNmYv?=
 =?utf-8?B?WVlhWWhBMnhueGZESHl1ZGppS0tGSFBnYWwySUFMMktIbEhtT09jV1lRbDJq?=
 =?utf-8?B?Q3RzWmFtSzIxdVhUNXNya0llZG1rOE5GWTNhN0RBd053a1JwbUJQaGdqNlVq?=
 =?utf-8?B?WU9TUjY5WC9wdFFVOFRJSmxZRlFmaTMxakZWbmluRm1FWFdJb3BKa05vYWhX?=
 =?utf-8?B?cHRENGJ2NlhzZkMrSjlSRTUwMkJFdGF0OWdRZXVJM3pKZE16M21ubWVndnBx?=
 =?utf-8?B?Ly9LZlFKNDNXVTJnN295NVJiUlE0OGlZcHRXa3ZLVGhiMFk3U0p1NHA5NWt1?=
 =?utf-8?B?QXRmL1haU05kR0hBUWRmcDI3aFhXMXVGZkZYV1NMYVRGb0Nrakx5WmJtZDhw?=
 =?utf-8?B?dHhnUlh5RWxyb091cThQRm9wQllDeEsvVzdaUmZod1k5K1lWSkxmdG9rUHNl?=
 =?utf-8?B?V0NGVk1zck1xUjgwYTI3bHhCVEhjWmRlTUc5V3lYTWRDcVZ5ODQ1RlF1U2RS?=
 =?utf-8?B?NkpobktQT1N1NFdWT1pqcXNNeHNQKzFqZ2pZeEx0M1B4R3dLVmxRd0lsN3ZE?=
 =?utf-8?B?MkcwcUhlOVFsZitCa0F1YnBsVU5WY2Naa2NCTnBKMElTZVNReG01ZWY2YzRW?=
 =?utf-8?B?eUo4TU5NODBFeUVBbCtnVW5VWVIwMWxTOG0wSzR6M2hyR3pHVWVIblludzdW?=
 =?utf-8?B?NFkvdTlVUk83T3RBeXdUT3BsWUJUdGwyRmF0VDRWRjJNSDZWT2RRNFJpeFlQ?=
 =?utf-8?B?bkJrelAyQ21MQmhlZUY3Sy9XNzR4QXpkQngvTWRBV3Q5ZFJhbHJtaEJTdFNL?=
 =?utf-8?B?bndMbmkrNXc5NVpiV3NUOXY4eFFLK00yVGZ2M2VWN3RSSCt2U3plZVJRcmdX?=
 =?utf-8?B?YSs5eTFYaHRYWjhuWlR2NGFZbEFyTDhncnRUS2xEd3JURjVVczcvbFlJY3Fh?=
 =?utf-8?B?L3A5OW9PTlpWMkZTdTRLcEIxNklvTWoxdnhpRVArZHM5TEQzOVFmczlGNW05?=
 =?utf-8?B?ZzJsdWM5amZlbzFNUkhRR1hOaGNSdk9WdVp1NVlPdHhWWlZPZm5ZZGs1MXp2?=
 =?utf-8?B?ZGJZbGdYM0NhTVJnVGpVaVJHalJBcUd5R1hkZmxaMG5HeThzR1hQZytsWTN3?=
 =?utf-8?B?YWJCdkxtRnRBTktmak8xNVJwY1BGRkl0N1dRUCtUbFV1dUIxUkd0Yy9xRzZW?=
 =?utf-8?B?ZHBzTWtpR0VDZkp4Y3ZUQjJ6ZG1RRmtWeEV6Zy9FNHJ2WFpnOVhQTmpsMFFq?=
 =?utf-8?B?TWlBbTRIZFF0aitwZWVHRjRoWkhTTGFoWkFVYjBuZlYyS2ZyaXlhQWViRjVW?=
 =?utf-8?B?cVFZZ1JxVmU3WHVSTTV2dkpieXRrQnE2Y3hTMjNVNTJXVjNUaEcxRVl2d2pH?=
 =?utf-8?B?a2lNK25VY1FpOHFMR01wNGxGazg3WmV4M0xqMWN2R2Jzck1OQmJBK3dnYWtL?=
 =?utf-8?B?d2UrQnhaREx3S29VWWlhSzF1MGM4eU9ZV1N2Q1RVaE1WUUpiK0hEM2hTYUh2?=
 =?utf-8?B?RUlBM0FxRFlJOTRGZElNTlpyVEJtYWJJMURrZGpzbTZxdGQ1d1hweFkwN1dF?=
 =?utf-8?B?Z0tFTFI0cFo3d0FOcTBNV3l4aTVoSksxOUQyWjRhWmRvRkNXdVpCcUlFM1pU?=
 =?utf-8?B?N3Jscm1ST1JjZVF4NHJjR25vNkRRU3htaEdFVVZKSHFUM2E2OVNHS1ViYUIv?=
 =?utf-8?B?aGljbGE0Um11bU5mNEx1RDY4L2pPd2s5Ui9jL05MRmZPWE85QnloVzNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K29PTEpPa3V2aTBEb1pFeThpUWh5M0tyYVZLNWg0cjlXUVAwQXV5WGR4RDhD?=
 =?utf-8?B?T2VFazBLUjJ3VFZWYSthZVZJSmhXVXlkRUsvdDJpSExxcDJrWS84S3ZLUy9I?=
 =?utf-8?B?WUYybjBHaTQ2WkkwaEZsK3UrUUh1eDFjSTFnMlNndS8xV21CZkVxVzVOVFRP?=
 =?utf-8?B?M0kvZXExT3lJazZPWENCdDFiME5wZks1TEJueFZJcURsem1raVRCb0ZaZmlM?=
 =?utf-8?B?ekhCbG1lNzM1bHpvNkh0R0ZRZkVtNHh5MDF0Qy85eGU5V21uNU9jMysyQWJj?=
 =?utf-8?B?YnpHeENpbGhaemdjMiszZzhqeFI5a1pBK3hPaFhWMkNpSlRRSS95YUEyQ2o3?=
 =?utf-8?B?YjI1RmV3bDY5VWM3Sy84SkZXeUY1UzBOM0tldW5Kbml1WWsraEJpN0RkVmt6?=
 =?utf-8?B?ZFZKWmhjSzRRa2ZhejNVZUxrc2JlWm1naStHRE95by90VERkbjl4b3ZIZjJ6?=
 =?utf-8?B?dnp6cGxSYy85Q1hGRnhBaWpnOUVselBIT1pwamMyZStKaUZJcXNyOHBSd1VZ?=
 =?utf-8?B?VmJBOGRxVkFEMFRiNjBBZ0pWOWU2WXZ5UGlqYkJVeG5jb0N6R1pBRU1iZ25Y?=
 =?utf-8?B?c3lyZG9VT2I5TFV0RHlmOXBMVXFqcTQwWFp2NTBpa09mRUdvTHg2Q2c0bzM3?=
 =?utf-8?B?TVBzdG9jU3NCYmJsay85SzFXR2NBeC9Ld3NDUkdBcXBNM3dRTWFNVGdDRFFC?=
 =?utf-8?B?bGhtWFQ1blF0WWFvNEpSdTVlWlNlR3lTSytGVElSSnIrNm5lZXcxMHRUY2hY?=
 =?utf-8?B?cWl4K0VDdlZUN00zeW5UeFY1MFhkeS9iWmFNeWVJdWU2aEtpSk9na21JOEQ4?=
 =?utf-8?B?ZFFFZ1p6RnRBOHNEOEQ5VmYwNHZadFR1MXh3ZlBlRmRCbCtaczAyekpoaFlj?=
 =?utf-8?B?OTcyQjUxS2tER2lHMm10SkErQjNLWHBuZXd1QXcvNHJla0FISFJ6Z1U4OHpy?=
 =?utf-8?B?YW0rTVRhTFVSRkk4TmhQWVdIYnpVSjBmNERCVkU4V2hsWkxmL3NHYW9Lekk4?=
 =?utf-8?B?OW5jS0x3aWtnKzN1K3VybUg1bC8xRjJMVnlzMnJldkVSTGtWdG9kNWVFUHI1?=
 =?utf-8?B?NEhGQzBuR0dLRHQ2UGFpcUU5c2tSL3V2U2hDZ21YenNNcTFqS2ZZMGhpaE02?=
 =?utf-8?B?and4LzVncU9YL2tOdnJBZ3JXWGRGSkZaNnZWYXR4cmIvbnh4aGc1dkRmeEg1?=
 =?utf-8?B?ckFWYXNuK3VuMm5qSzhwL1dFUUVoOERCMWFEMWpnRHM4bzgzbkl4UDdTRFdk?=
 =?utf-8?B?TFV6ZUlqU040LzByT05EemtYNGxnM2MvWlZkY3UvZGIrUDgwWW5GRFIvSERG?=
 =?utf-8?B?RzQ3MjBkbVR4V1VSQ2cwVGhCMVpUUFNUVW1IaEVpd3YyZm5WcHVmTjFWVUxa?=
 =?utf-8?B?Sjk1bFBxMnRQdUtxWFVmUGZwOGxiOWw1TzVwQW41VEJZcXZ1Mjk3VWg1ckdE?=
 =?utf-8?B?OG1QaFBQL0dxUkt1L09QVjVGeUM3ZmtmL3l5N0J2R2huYzVDY0hYYUQwTGp5?=
 =?utf-8?B?VDljTnU5SGFDNjR5eVhMbFV0cndEekF0cEJuVDFjUCs2b3REbHVxRFdncmxP?=
 =?utf-8?B?YzBqTm1tRkczNjg0S0VvVUZ6ODRXZmlSR1hUaUxOSnRmc2lZb0hTbmdKT0d2?=
 =?utf-8?B?VEN1czhHT3JITDhJTXJ0L01jcU5IRmVZaFloZ2ttcGNBVVd0T0NwRW52MFp0?=
 =?utf-8?B?Q1pHSExPV0lIdWRIT05UVGVOWEpOalhyNEtkWnpabXh0eDNDRFlBekpOWCtU?=
 =?utf-8?B?VHJNUUlvaC9UTjZyWHhyM3Uvb2JESlZCeG1wWjRna1BGOVJuNk93NTQxTi9t?=
 =?utf-8?B?T1VTcVNlQTFoa3NEbW9BL0YweWpTb25EdWI3a3FLMjVUTUhiYy9neHpHazN0?=
 =?utf-8?B?V3ZqRjc5cGlyMWJ5ZS9CSkxJWGw2UURjVFpVWGp1MmFIVUV3QUdFTjhCYjN0?=
 =?utf-8?B?VDhjVCtsS0JldHRvbnlhTU54T1BJR2RkcC9oVnBJWEw5dmVEditIbUdvVG04?=
 =?utf-8?B?ZjlpdGx4Q3ZRM0p2em5vckk4ZThlOEtyUHRLekZjL2w4cUxEUjIrbzRZVnFs?=
 =?utf-8?B?R09UMTFDRW1NWnRnMjA2c3IreEtyeGtPVDVhYUJDRlBWT09KODh4b2E0aFly?=
 =?utf-8?B?N2I5UHFLeFg5RThQRlpEVkdFaXVYU0IxMUtQYmtzTTVvWFFUdnVYc1hleHoy?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa13bdbc-bdcc-4222-065e-08dce324549f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 20:53:55.9796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp+cXICS8Nkk8EloeK//NiATIUkL8ykqS23u6JMMFbzXKqHkscT48fpCZXqwlPwZfoNsKOfIpm3yE0j4MNdmfsjQ9Gb3eISSjvAr0Z9E/U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8713
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

On 9/19/2024 8:21 PM, John.C.Harrison@Intel.com wrote:
> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
This register seems to be the lower-32 bits of a pair. Does it make
sense to read the full 64-bit counter for the log?


> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err) {
> +		snapshot->stamp = ~0;
> +	} else {
> +		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	}
