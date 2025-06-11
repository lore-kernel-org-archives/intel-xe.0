Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB07AC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 20:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F42310E730;
	Wed, 11 Jun 2025 20:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0ACwe2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B5810E720
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749673128; x=1781209128;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9+ThN5N/tI1Fzo1ib2u/1MtNiPaSDUx/LZHIM63qCMk=;
 b=W0ACwe2DgsKjA7Gj/m+R1wY7VshvZmAeltxDdn21jby3YUSsZNCvUjOc
 lGd2Y1nFiiENJK9B17mdQP1VPtm0974S0t6Ll1n1oPa6F1gc9T14aXsa9
 R8ut1exf7Gf1qY+zo0s4nzSk7PDyA81r60pSROhEpJwku0tVD3hQJZQK0
 mEKksfoADgnwq2PvxJ5Mi4Y7Ov5XQQVVQs8JvnDs4OLy5w5CI9GlHgq0d
 3vpY5sGdyy4Qig8c1tr1QuCVdkwtmYGpej+TqD5NIuLAhUgHkbcZjeIhu
 VkokMzIolCbRdPRbKEBWtf73bwHaCdBcHqKqV9C9It+qH9Cn/AGwsMNav g==;
X-CSE-ConnectionGUID: 3G8FtXssRL6AV8esDtstYg==
X-CSE-MsgGUID: O8S0imXNRZ+YAcPn3sCzKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55502307"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="55502307"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:47 -0700
X-CSE-ConnectionGUID: MYoFzZqYQ/aC47sc518hLg==
X-CSE-MsgGUID: wC9Lqa2KSdmXt0KyiBQsOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="170464353"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 13:18:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk1r1CCsMLC8+YrjGD5FuKYcIlF4++kz47cyyD8x3OPsod1pYQ07xUsFXmIc6Y5muXga/lFkKIy6dSb1U25cQN/B6yx4vrC3GCRpAA1I5gTXowuIvOlE91HDh5Q5pZVvpxWb0HHOwg/C0c1rPOHJ3oyoi9U51/00IZaxzypUqtVxTxY94kAW9K+ULrPWSId4xKibszRqcga4CrhlU/FwYEOSyP6OCsYWNa4MsUyGdCx/Oror/4qtj0Ws1nC5w323HJrsmZ9AIjWxtPDUB0rD9N4J1Giw8SUzqyMr0/xzc8KkqvjrB5rbrLqFDWwoFv0Dr/lSGWuPLlIbCHw38xtxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+khQIsx+VcUtXzL4L6t9cnEC6KABdPR5eNIKpOC+EP4=;
 b=G1ZgjnCJi2Dlmded7ijhfhR2Y5ZonPZ0RqqPmQp5fXLwdYuYw1ImoJDLJMlqNr/K2y/ThRNApJBwlsnSCbiRRJwiQG0LUwjqqwZ3YGaoOPPLp7ngXs1JaXZ7LyZFWQDdRRnblxKrCxqYrPmuNpG2YAK5jmIjWGnEJNoOaKZ2UP3KsTsLAaxynoJTQbNcfuujN0zxME+VUz7FpRW9YOpaQ3+iwrJ2BzXPjJZiEwVJNP5/fkjyLdLsXn4wPnGC7uzNNNCEF6dnMa6HKg40XWwHJJVVnDH2gEeMMEsWd2jWqZbg92bD0CeThS4HnOL50cXgvDaFe9smQsw0i1iceIUXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Wed, 11 Jun
 2025 20:18:42 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Wed, 11 Jun 2025
 20:18:42 +0000
Message-ID: <e77ec4a2-2429-46e4-8695-c043a29bf674@intel.com>
Date: Wed, 11 Jun 2025 22:18:40 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v4 5/8] drm/xe/vf: Rebase HWSP of all contexts after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
 <20250606001823.1010994-6-tomasz.lis@intel.com>
 <46b4bb51-c088-44d9-97de-9cc9b8385a62@intel.com>
Content-Language: en-US
In-Reply-To: <46b4bb51-c088-44d9-97de-9cc9b8385a62@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ0PR11MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: a4afa46d-bc42-444d-c1f3-08dda9252907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWJPalAxUmxIdVMvWWo4bmFkNEtMN3pwQTNQMUFEOWQyUWJ1QVRGeVhFeTl0?=
 =?utf-8?B?VzU2K01wamgxRlNOMFZ6WXlGZzJ4MU5SM25MSHVzS3NWbGFMVEZnWm9Va0Vk?=
 =?utf-8?B?cUtDUUc3eWJtN0VGRi8rVjlrdzMrbTJvbDhjbDBTSkxHQWNVSm4wTkhpQVh5?=
 =?utf-8?B?L00wM3BudGxmNHBlTGxJY01DSlBIdFROQmc5QkdXLzk0RjNuQVQ2RnV6TmdU?=
 =?utf-8?B?REFqN0JITkNWWDdSKzl3QTc4TFBHWHdTZDRXbVFrYTZUeGJFMHNVOGxrSEhq?=
 =?utf-8?B?WEp2bEZ2Q1lvb2R0VzB5TWlIankwc1pJNDZIZnVuTXpKc3MxZ2xndlY0UG96?=
 =?utf-8?B?bkRxZEQxMGdoZWdsT0ZPQitoaVoyUlUzUklnM1FVZkhzWk9iMFlOZXgwSU04?=
 =?utf-8?B?RkxodFJ3SmU4Y2t1SVdTTURUeWkyOTV1aHFmUWp1STRndXhxaitsVG1adEpQ?=
 =?utf-8?B?SVExSVd0RjNzTVRXNGtJTTBDd2FHWDEwcFZNZzFEc0tOOWxjYmk1dHdEYzY1?=
 =?utf-8?B?RW51TVROei9OZlNwSENxVlE4U25JOUIrcVJVbUdsaEJlYVg4Q1VxWk1sNFc5?=
 =?utf-8?B?cis5ZW9BbjF1TUVwZVl1T1BRYlNLbEc0bkptQ0RkSGpJM3hRZlBVOTNnR09n?=
 =?utf-8?B?NkFOUWRCd0x5Y0NjdW8vLzUzTDdKdytsVTNPS3hTQmRQVXgzbE56aXM2ZjFU?=
 =?utf-8?B?bUhpcjZUTjdWN3BiVHh3RWViRytSMmpCMDVubG9LSWlXVVgwam8yRjd0OEor?=
 =?utf-8?B?VmlNUERvWGxjOFgvd3ZucWZFeWJlSytycUQyYzd2Y25ZN0M4cDNRWTBMZ1Az?=
 =?utf-8?B?dlZQbW16OFFlMGRZTjJMZWk2SnhjaTJPZzRDUlpIclFOZnZvcUh5eHRpaDNS?=
 =?utf-8?B?bGdRS2Y3TGdReWdWU3FHTFMrSjdhOVlBVVZXaGg5T0VBbzFEaUVPSWhIVmhr?=
 =?utf-8?B?cVpCajJ2VnJhUUxGUmxHMURvRDRsUkoyNEN6bmpzR1BwYkVMWGhxamVJN0s0?=
 =?utf-8?B?Qy9PK0V5Um9CWkNrZVR3ZGRnenpwTXEwamVLdUhIV2E2b0VBU1pwUGNnVEx4?=
 =?utf-8?B?MU5MVG5lVHlMSUwvQVprYkpVVWVYL2xRdEdkSVNSektDV200VFZEbjBDSGVP?=
 =?utf-8?B?cXhsV2ZwZ09RNjl2RHJ1M0N4QkhkWGFlQ1Yra3dkWDl4VldOV1ZrdW1PMysv?=
 =?utf-8?B?akJjbms1aUpYQkpKVUo1emJrMWRTY1JBUmQzdlkyMUlKZ1NPeDlZWmpiRXZ3?=
 =?utf-8?B?V25ydmhUdXlTZHB6T2hRaUUzVG9IUGt3c1ZqbFlHS1ROZlNrbSs1OG5lREhN?=
 =?utf-8?B?QW8yaE9PajZjenZ2eGUyMmdVSmo5WTJOZ3NTUlJNV0xVWjVDbG92WkpUeUdB?=
 =?utf-8?B?QXVzU2Z1cldjWjVpUlVocHZ5VlJjeEdwUk4xcHpjSjRwUmhFS1lhQ3VKZ2dN?=
 =?utf-8?B?Vk5NL3RsTlA5ZXFWY2FjTTcrKy82eXVId1hqQmIrQUgya0tselN5cUZZd3l2?=
 =?utf-8?B?Q3d3QVFNRVFPRHFnMHBmeE80bmdYRWhFcDRvR3E3WVNjTjFxSGFPckNxOC9l?=
 =?utf-8?B?RFNteitZamJIMlVGR1hZQTBmeHhVcGFHbDBDRVltcW9UTjN5eWVWdE5MRStt?=
 =?utf-8?B?MmN4a1Q4cjVXanRxekVRdUtLY2FIY1VlWCtRRFdPSERiSG5VMStlbW5CWUYv?=
 =?utf-8?B?UXRCcUJEbUgvMVY3R3B1YmpPeSt0cUVGeDhrV3RxWXNqakhqN3k0ZnBsTWho?=
 =?utf-8?B?aVVNTDN1WWViTi9jUkJTcm96cmF2Z3FtVUExNjU4T3ROWFhSQzdMTnl3Ny9J?=
 =?utf-8?B?enIvTlpWblVmTFNwZGxWWDJBMEFMWlRKZ2dyUXcwLytMcmxDY2ttVlJCbTNC?=
 =?utf-8?B?YVZsekxJWVpYTCtsUFFlUjFzSWpXZFNVcEFGVXhiYWlBYW8wQ3pXRURGYitI?=
 =?utf-8?Q?+wBSFDqqT2g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG5PdnJCS2RUNE9JdDBadVhrVVlFUFQvUXowVk9iOEc4dC8wU3BjRjVuSGsw?=
 =?utf-8?B?OE5yOFQxNnFoRVFhRm5hdFpVTWtReDdnanVrbkMxZmhoQ1Z1VzdxbkV2TjBT?=
 =?utf-8?B?YTRmdE9lNGVoQi9Fa1NaSGhjV2l4Smo3M3dKQ2RrSi9zSmxJeHp6TzdXR0xY?=
 =?utf-8?B?Yk5VQWxsR2FiUG5kOVNLOVB5MDhkR3UzOHkxZUtTUjZjL3pvWEtlN0UrNUU5?=
 =?utf-8?B?d3dPdWtYYWkyOW9kdE9xTnNIYjl2ek5hWkxUUEZKRkZ3S1NKY2x6U1Z5MzIx?=
 =?utf-8?B?Kzlpa2JxMlg4VEhiTGUzd2xBb1JCLzh6U1pwWVA5V1RJbjhQT1ljT3BsUWsr?=
 =?utf-8?B?S1A4Um5TSlk4Z0F4d3h1V1NZQzkvNWk2WjAwTzg0Q3NUdFZ6eDZ5eGVwdmVS?=
 =?utf-8?B?NGo1dFVTeXhod1hQTGYzWlBRS2xieENuUDl6K0FVWEw2WDJWMzJZQlZhQzlv?=
 =?utf-8?B?S0dUN0hVMjg1SE12NVB0d1FqcUJBMFVoVEZFdW52ZnJwQ0N1akk3a294VjRw?=
 =?utf-8?B?QmVBbEVkdGtIcFhCeUF0MEdYRU1vOHR0TDVIcU0wQVBHTGZSRHBrdHF0Vk1I?=
 =?utf-8?B?NEVnZGYydXlsdFYrRXRoV3kzb3Q5TjFNUjdqd3RBUWJPYjB6dmM2WUxVZWJs?=
 =?utf-8?B?SjYyaGw2UG5jaHdqVWllTWJGaXZ4cC9OalFqbm5SS2NidkI3a2pkNTliZ25w?=
 =?utf-8?B?emp3VlowME9aU3NHUnFIUkdhWU5RWS9Oa0hQTncwNlJCK0xsenFsZll3TE9v?=
 =?utf-8?B?c29ZK1BWVmJ4bWdSSnNpSEZiQUcrTW5tZ2hkUWJLWGlNSVhMUnpDOWhJcjVQ?=
 =?utf-8?B?a1V0TXpIbVRxOTE1K1ZxZ3NMT2RRZkNZYmhHNHFVZG44eHkwRzVCOGcvUHBr?=
 =?utf-8?B?K2NzRWFWSW9FRldyaXo0QUtxS0ZiS0toZVdNMzNzR2x4ZlB3c0R5MHhsVGlR?=
 =?utf-8?B?RnArejFxQ01mcTNOVmttYXA1NEhkTmliZzlTSktXNVZsR1JIQUkxTDZaZUth?=
 =?utf-8?B?dXpsVlJVUjhJZ0hlRmdhbVRmZ1ZFSy8rTmszMWlkeEhoemZvTWRBNldyaGVZ?=
 =?utf-8?B?WEg0bjIzb285emIyc0RoWUJ2VnFsSmwwdHhMSDF1NWszNFlqenh1THQ0cjhw?=
 =?utf-8?B?S2I5bFNCWFgxRDFPOXZGOWllR251MmZramNsUlJka1FrdkF2ek1VREJiQ0Ra?=
 =?utf-8?B?Yy93NldPM2FwbENjSTVvTFhia1M2NEUvTTlONmNLSzZIY2F5QUpyNVFjUUtl?=
 =?utf-8?B?T2Z6VDNiVkovaGZwSFcwNGlZVzJUdGhnZ2Uwc3E2alBXSEt3ZVVOdGprSDZi?=
 =?utf-8?B?WmI4eFFKVmYzbE4zNWZURHArdnkzTEFFNnIwQ2Z5bXRmbFR2Vk5Yb0s0a0Mw?=
 =?utf-8?B?VjNKbFZnQk1HMkRFNDNkcjlSZUh6bW8zUSt2bW1CSmNndU9TVmdWdHJjQVFm?=
 =?utf-8?B?WXZUMmhrVldta09PQkNVSjJiOTB3blFBdExpYzFSaTdEaVF1YzFsVkwwcjU0?=
 =?utf-8?B?UllnQTRjWEdMd1ExMnpTTjgxV2syTXdaV2Y5RkxlWEwrM09iQjIrd2J5TDVh?=
 =?utf-8?B?OWNPYU9nRU05R1FmYk53bzM1TEcrMm9udHFpM2RYTnUxUjgvOVFqWkw4Y2hj?=
 =?utf-8?B?eXY2OGlKTHdhSGFxUllxcEthcTdsMmpPbTJhUE4vbEhQcGJjRUpNYlVMQm85?=
 =?utf-8?B?czR0WDFRZ0t4MzRjWjFDZGZRWXZHZUR6Mkt5MFhsYXltdjZFa3NQbnhtL2Y4?=
 =?utf-8?B?TTdJZ2V6UDEzdHVMZUtHYnpIWW5SZnkxbFI4WUtBV3hraTRaRHM5YmdVNFhF?=
 =?utf-8?B?WDBnaWMzYlBNemR6cHdtNWtWY0hxREovSmRISlQ5UHZhTm9lV2NxcTJiakts?=
 =?utf-8?B?VE1hRzUwWkoreVhRTklrb0Iwd3JrNkRpbUl0VnNaaU1kQktWT0lrekVkQTlK?=
 =?utf-8?B?VFFNeWo4N0J6TC9GZHpoZGcrRkVqQytDNWNUbjJNb1orZ0FIcGlScXdXeVVv?=
 =?utf-8?B?bGZyVFd4K1VXa3VWZzg1TXZOV1RGT1R2dTk5eHBmR1R4bkZCdC9iK3cyeUpH?=
 =?utf-8?B?MHczcUFRUG43b0wyVG1XZDIvV0g2UzJteVk1NGc2Ykc0VStGdWtjKzJBaVhF?=
 =?utf-8?Q?AhamgOSFjj7IqiuCwCF2rPjie?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4afa46d-bc42-444d-c1f3-08dda9252907
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:18:42.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXCfTmY7dc+oR/mKzqANg4Wu8hHmUscr1fWug5Frhm7PNDfwXXmvLBkIEZ74zj51Cug1P9WFk8U4cHLFETbUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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


On 09.06.2025 13:03, Michal Wajdeczko wrote:
> On 06.06.2025 02:18, Tomasz Lis wrote:
>> All contexts require an update due to GGTT range shift, as that
>> affects their HWSP.
>>
>> The HW status page of a context contains GGTT references, which
>> need to be shifted to a new range (or re-computed using the
>> previously updated vma nodes). The references include ring start
>> address and indirect state address.
>>
>> v2: move some functions to better matched files
>> v3: Add missing kerneldocs
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski<michal.winiarski@intel.com>
>> Acked-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>>   drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>>   7 files changed, 65 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index fee22358cc09..c44a523ba906 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1028,3 +1028,16 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>>   
>>   	return err;
>>   }
>> +
>> +/**
>> + * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
>> + * within all LRCs of a queue.
>> + * @q: the &xe_exec_queue struct instance containing target LRCs
>> + */
>> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < q->width; ++i)
>> +		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 17bc50a7f05a..1d399a33c5c0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
>>   				      struct xe_vm *vm);
>>   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>   
>> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 0d6d9e07fc48..89b4c09e733a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2449,3 +2449,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>>   		guc_exec_queue_print(q, p);
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>> +
>> +/**
>> + * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>> + * exec queues registered to given GuC.
>> + * @guc: the &xe_guc struct instance
>> + */
>> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_exec_queue_contexts_hwsp_rebase(q);
>> +	mutex_unlock(&guc->submission_state.lock);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 45b978b047c9..5b43e6639f52 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -45,4 +45,6 @@ void
>>   xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>>   
>> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 63d74e27f54c..72690f71289c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1181,6 +1181,22 @@ void xe_lrc_destroy(struct kref *ref)
>>   	kfree(lrc);
>>   }
>>   
>> +/**
>> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
>> + * @lrc: the &xe_lrc struct instance
>> + */
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
>> +{
>> +	if (xe_lrc_has_indirect_ring_state(lrc)) {
>> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>> +
>> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
>> +					      __xe_lrc_ring_ggtt_addr(lrc));
>> +	} else
>> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> please run checkpatch.pl as promised!
>
> 19c7fdd34f6b drm/xe/vf: Rebase HWSP of all contexts after migration
> -:109: CHECK:BRACES: Unbalanced braces around else statement
> #109: FILE: drivers/gpu/drm/xe/xe_lrc.c:1196:
> +	} else

Right, I didn't realized there's a clear rule for that:

"if only one branch of a conditional statement is a single statement 
[...] use braces in both branches"

-Tomasz

>> +}
>> +
>>   void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>>   {
>>   	if (xe_lrc_has_indirect_ring_state(lrc))
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index eb6e8de8c939..e7a99cfd0abe 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>>   u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>>   u32 *xe_lrc_regs(struct xe_lrc *lrc);
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>>   
>>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 29f3082c8fa5..d54048bc4576 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,12 +7,14 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_irq.h"
>> +#include "xe_lrc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -240,6 +242,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +}
>> +
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>> @@ -325,9 +336,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	}
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>> -	/* FIXME: add the recovery steps */
>> -	if (need_fixups)
>> +	if (need_fixups) {
>> +		vf_post_migration_fixup_contexts(xe);
>> +		/* FIXME: add the recovery steps */
>>   		vf_post_migration_fixup_ctb(xe);
>> +	}
>>   
>>   	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
