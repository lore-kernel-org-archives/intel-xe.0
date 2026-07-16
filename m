Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC69C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 13:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DFB10F311;
	Thu, 16 Jul 2026 13:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un7c1r1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909810E347;
 Thu, 16 Jul 2026 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784208472; x=1815744472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fNLygmLWUuyqlIsyHTQ2YJnt7h6tTRrPsulg0CkZo1U=;
 b=Un7c1r1qEy9IBP992CpwrS8+ZzIgds0lzJKkILOxUnICHpc8FIYi2+yX
 2IAEqTXwf4Cq3j1OelT4Q0xoxBw0lnBVuYah+BvdwEFrEyi4VplAxuY6E
 7Zf5q6Zub66+ChHtiwKMrdgshLdiH9cAfnTqLpbvYCwmwuYxxz09zJkOh
 AENJyUDcxMNWxw7pkOwa2yY76YYzOgFCFbiS3tnM7q030nZVoK4cET3qE
 CrrpNo5TislNvO+lWJxnlOinSee+0fSWySScZEdkdtclOy1IXlRoz4Yvo
 2r1nhrizcRMCLAFHgUZGCxEFFO798hvLEa36yCQfNo9A9TVd/AuQl9khY A==;
X-CSE-ConnectionGUID: P555GQ1GTX2cBS8BbgSS1A==
X-CSE-MsgGUID: Rgh3IocgQu6TiTm1SLIiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102293010"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="102293010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:27:51 -0700
X-CSE-ConnectionGUID: pxXa3TTzSC6UOYbGhE/UUA==
X-CSE-MsgGUID: OHugMt9qRN+g3y6t3jehlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253087121"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:27:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:27:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:27:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVA1dO3cSb4clt0rWvRMsRUJ2bBKjcNK03JqISMkR9RHKEaEuv9pAu6eg7sU5D2XfgpThsbFkaQnt+SM7ao9AiX95TCXAYakKr3nPyqlKWFOsQ8leA6DRwsvYSfGMZGbQzukFZ63BrPo5f20YyCUqrFpmkx+L02bytiNu3ghH8sstOIKtG4tujtXadVuiFU9hagEtxXkUVSCh6PXYLsKyTKU9Q9zmsCnHsZDhdYwCNfxJywtkysTF5iD77OCnEbVTYxj+mSxx+kTGgm90aHTTCotx4jqX8k6iOZme9nvuw6NK9Se3BaPAFhRI4o3A0Rfihe0S83YzCEOz7jrt1HCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T73mUtz2hqPrYP9YfY7BJo2l8IJJCakhu4TCdntS8tc=;
 b=k3fdPSvng3tQuL0x9WGY1VAevYu1wQRbNJIQcNGqCqnXCt8B7Z9744fkLDZTsTP21ZL2E2BpES99qTQ0qGWSSTzka4RHNE/M580NMNzwWOvzQ6kgqjb1nHE4lLV4h2eREQB2ypNkddLnTyypzUvnbfJ6Xbp8mn900/rTHhGJ+Wg8h8izTIBBnV7y6xC8J0UcAQUPwYIrhc1FlTxEbbGb2uAdFk7PMWKoZSO4mISEmrLnA/FkYSoA5x1eo5uGT3CGH9OdRCdiDgS7JhSvhtUR9AgZ36qingF8KvEJaUGul2vFyUj0rlYncfKHNQa65pDODQI45w2icV3ur5P3vTaMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 13:27:47 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:27:47 +0000
Message-ID: <2621089a-298b-4714-92ea-aed376598883@intel.com>
Date: Thu, 16 Jul 2026 18:57:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
 refresh rate path
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-6-mitulkumar.ajitkumar.golani@intel.com>
 <4b475ef0-4572-4b6f-957a-0e5bbf256bd2@intel.com>
 <IA1PR11MB634858DAD04F80A44D36CB60B2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <IA1PR11MB634858DAD04F80A44D36CB60B2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SN7PR11MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dc76df-089f-4a1e-7378-08dee33e0699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4OQVeSouhtJXsy5EFPV1u2Hm6UFh7Rs+EjiHBIwLeBFcRYgB2ij48fcy09wiW3tiumJmDc4mfR6sPKggd7OKbGvcJ2BTFZckRKQJn5dlPTzVUTpGWHu6kzu76up1iTylR1kEdIYwX53Btn4YL90DgA33/sLCFrnr+dy6Yl3f4e/HF4CiWA+Kt6KvCVPI63d8iWv4Cl0xgWYCklyQXUMv+mDHYKGNrUXHJ3TBqyIU9eaJuqQ+zFWt5l2oPKMxQeLPRH+XBvA5vI8fm8AJ89mCcMcS/BfGFEHhVeH3PzCOByjdzj5BgmjKaBewlfEOKqFB71g75yP2AIp2EziaeZAXoSgrCdqb7bYcFGAoXM0udTeLbbR/9B3g7PFfVUQm4hmeQJl86DBzQEDUa5QgM/aEUnhMMiVp4Lx7wRrsUkDBKbG84cW9h0R429Vl9DhbLUh83y3wXR0A7IebzuWtxBpnBGFp7uRbmYU2zDeGSBwn07TL/P4sstHJazvB8HuBlhaXSw8yGT0Ppoil9kMDboARWg8TaM6hJ18CQRlb0XPpjKqTh+IZwh9QsEu3Z0w3p2/thjv/5/wthRwoLC17+WsVP5ETr1dV1QGH1OWq4Ur3W3CWYZP3++7EVG9Y8WGYlFUN8uiMdeIuZkhPqwiUkpDuXVx5iUc9Z34amTxXiLaYizQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNiUGtCWEQ4dUhncUdkZ0xTTlpGakVHYWxGd1B6UTAyRWtRbUwzWW1oQVJz?=
 =?utf-8?B?YVM1TW9RZk9XQTdDbno0MHNXZlBoc3dxNEpWMFp6MzV1M2daOTA1RWEzaVZN?=
 =?utf-8?B?SGkzMVJsZzRVQXBydWdsZ3NRbWFGNWV0SzA4RlExU3hPRGIzTEpDRS9sSmF6?=
 =?utf-8?B?R29wUnFuQStpQ045dUNqditVM1FtUnZnMlRTU1ZZNFpGZnB0TFhkV21BZkRt?=
 =?utf-8?B?OTZZRDk5MzVuVmUxbVR3aVROc0QrMW85bVIwN1NZMEhoc1YvTUg3aVVYRXRN?=
 =?utf-8?B?cldibGdFcE5zRnlhOUtMa3pMakdlT2RwaHVtTlNCVEdWV2Z5L3MwL1JOenV0?=
 =?utf-8?B?YUhoeU9odFJ6bmE3SEJNRzVuNXVNTjlrWU1tN25DamNwbkFkTWR2UTE1MlVu?=
 =?utf-8?B?TmlFempnblpvNnN1cDVvWHdqZ3Q0UEpTZGxBSnNOZzloQmJrNEVFblRsRSth?=
 =?utf-8?B?dzJWUjh0VmtYOGJOcFVZTFRnMFlOSUR2L1QxL1RwU0lPL245dXI0LzU3ZFJK?=
 =?utf-8?B?aUZJTmxjTnpGc09ad3FONUJnZGVtWTJyM1lnUEVCZWFKVllDcmVOdWZrZ3A1?=
 =?utf-8?B?S2l0WXR2Zlc1bktidHdEM0hCT2I4cGxpREVXVnNPS0g1aVMwWVJON3pFcUpY?=
 =?utf-8?B?SldkeUo2bkx0WktXbG0vQk5jcTFONUNScEJJWWlWa2lSY3B4VVdoVkdtazl5?=
 =?utf-8?B?UGxhLzQ3S1NqVkphU3dnVXZpYUIzZTQ5ZkVHcHFzWGlUL1pUbi9oRDJuYkNv?=
 =?utf-8?B?SnBYTW1MVzN0dy9ncWZNdUNLWFZ5WnNVcGw1ejk3eGthMUhoRkYzZzRack5u?=
 =?utf-8?B?djZDRkJqNGFJOVVhbzFWaW9nTmJZejdXYlJjM2xYVUhEOXVQK1RBNWNRNDU0?=
 =?utf-8?B?bGt5cTFUSGhmZnlrajFUUWdXcWtUdVYrWlp6VG8rU0EvTGVSRVYrVVJsU3pM?=
 =?utf-8?B?VVZHYXh4ZitkWlU1QlIrUCs1cDJGeE5Xdmt0SEtwQStHOU9jc2FjMnFuSlhw?=
 =?utf-8?B?cS9wKzF5VGxlRlJQMWRQQ3ZCQjZmMDVZY1V2aTNnVkdveUxqeDhXR0p4UXcy?=
 =?utf-8?B?alZEazZRM252Rm04bWFxYmdPci9zWU15eWxDTVZsaVl4QXhncWF2QVhhbk12?=
 =?utf-8?B?WjQxc1I2ZGtmR1BaT3pmYkthalN6dUQvUGJjZW0xTTM3L3ZrclV5UXBZdFRo?=
 =?utf-8?B?em9zMGVIbWN1eDh4MVRwUk5lbUo3dEwyb3NJcVZnYmFKMUZxcm9sNVhvMWxI?=
 =?utf-8?B?Qll5VEpNMjFZSFdMa0ZrUlhsdDdrM2E1K0M3TnBRaXpUaFJwTkpsak9PaXJt?=
 =?utf-8?B?KzB2WStvcnkySWwraC9PbkhIbEtoWDR0V3p0ZGViUHhqbkIxeWNjTWUwOHZT?=
 =?utf-8?B?dmFjUjJqeTZ5TDlFQkpka1dCcjZaL0NGNDNtTFBtd3pQZkFmSStRSDRsU3JY?=
 =?utf-8?B?Y240Y3BGMUhZdGZaak8vcmdoQ0NrcHV6dHF1My91NTFURE5SUUloVWpHNGE0?=
 =?utf-8?B?dURFYUF2N1BUOVhpNWhqbUNoSHBJSjJaUDNnTDZNTE5ReGZBVmRuZGY1MEhS?=
 =?utf-8?B?TnQxZ0NaM3M5VVhIcExkWmRPclhXWGwxUjFPMXcyYmltaVhBL1ZqaXdYSnh0?=
 =?utf-8?B?MjV2QU9BSVRrSUtmb2RqalA1NjN4bzNvMFZJVmVpLzdjSG1LMnBVd2tSOU9C?=
 =?utf-8?B?KzJiUkpXVndtNDU0MnZIdWYvZXo3c2VsUnpHVDVWeGs1UG05YStzTjZUYzJz?=
 =?utf-8?B?c2wyYk4zNzJQVWlVT1EyVktjdkV5YmpOUHV0UTBSYXRJK0FVYVpYaUtGczkr?=
 =?utf-8?B?aksvclRWMmdySjV0SE1kVURKTmpPNC93K0taR3N4dTdnM21YUjE2aFVzVXg5?=
 =?utf-8?B?LzhmRXdGTDRIbHc1cHc0aHE1anhyTVBnL3NZeEwxa1lGMDNnUkRzc2JXejZo?=
 =?utf-8?B?amdFNFExRGZIZ1JIaHF1T3drMTdmVGFHekRVbEpjL3M1UW1yeWFtbjVUd3RE?=
 =?utf-8?B?RFgraEUxVnFwUEpPT1hSckRTaXhHU21PTU03ekJmYzFLWkpzUDdIT3ErQWtM?=
 =?utf-8?B?NW9ITnk3TEgzYVliQ0RVRExCNE9rMFp4VGVyaldPSldHMzBRUTJnRzNxMWR1?=
 =?utf-8?B?aG5lU2hCcy9iL0FwT0J2UlB1dzQzTG1QTW9aekcrNXNzUDVIZlNFaEI1VzRI?=
 =?utf-8?B?YVIzZUdsbjUzeXVHYW5KcHk2NXJWTW9yekVFMG9NeDg0UzUwZGxQQkpFTjQ5?=
 =?utf-8?B?U0FhelhHSkpLZVZuMXF6YzlxZFVPVEFqZ0R0L1IwVHd5TlNoMFN6NDJsMWdG?=
 =?utf-8?B?VThycHdQRGk3akhSVHFpdFNVNndGd1FpM1E1eExLMldwZGUrUFdGM3MweVlh?=
 =?utf-8?Q?j0DW5fJKSdc6GoEs=3D?=
X-Exchange-RoutingPolicyChecked: BLB3PdF3Tks5oVIemIiMypO1ltOZKfFavz4IUtJkVuWQuuJzTUrv1SiXhI8cGSFlRRY5X4TQJMev5yf/pTmXtx3fOLluwPTMgcdSfXRUdowCC+Z5RMl6HZa+F6Vph7jAzVa6ElwQ9MrO9Fo/WRpxFK3BvyJqmljRPSExFL2N2N4XPhc3jYqcxEVEX2XMOuzLMTMDMJLzHJgQ/n5WfhLz3NGSpkBm+NUuvwh2MR87I7zgrEtKjXfx1qkereyPwr09ofEb73ztU10IJZASsjDtMLsMGtCu8x/MbIYIIdpWqKS7bou2/nntkZHKtot8cyCDnsrll6Gg35171EIeGb7RFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dc76df-089f-4a1e-7378-08dee33e0699
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:27:47.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndOXTWFCDpa+pLHBxZF6ubL5+x7G5r7s2MFq3F65dwIuEWvG+jYDSxlxHIoOgb2UxQlKXVIVUj5Q5yecYLN0Qw5/4FJ7dFfCt4rz0Aa/80w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
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



On 7/16/2026 5:32 PM, Golani, Mitulkumar Ajitkumar wrote:
> 
> 
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: 15 July 2026 18:45
>> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
>> refresh rate path
>>
>>
>>
>> On 7/14/2026 4:09 PM, Mitul Golani wrote:
>>> Move CMRR register writes to fix refresh rate register write path to
>>> consolidate with fix refresh rate implementation.
>>>
>>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/display/intel_vrr.c | 22 +++++++++++-----------
>>>    1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c
>>> b/drivers/gpu/drm/i915/display/intel_vrr.c
>>> index 25ce56d48bb1..95c7b0c05ec3 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>>> @@ -337,6 +337,17 @@ void intel_vrr_set_fixed_rr_timings(const struct
>> intel_crtc_state *crtc_state,
>>>    	if (!intel_vrr_possible(crtc_state))
>>>    		return;
>>>
>>> +	if (crtc_state->vrr.cmrr.enable) {
>>> +		intel_de_write(display, TRANS_CMRR_M_HI(display,
>> transcoder),
>>> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>>> +		intel_de_write(display, TRANS_CMRR_M_LO(display,
>> transcoder),
>>> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>>> +		intel_de_write(display, TRANS_CMRR_N_HI(display,
>> transcoder),
>>> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>>> +		intel_de_write(display, TRANS_CMRR_N_LO(display,
>> transcoder),
>>> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>>
>> Shouldn't TRANS_CMRR_N_HI be the last register to be written.
> 
> No functional change has done, just moved to fix refresh rate path.
> 
> In later patches when actual enable/disable sequence is computed, there suggested changes are applied.
> 

The function is never touched in the later patches.

> Thanks
> 
>>
>>> +	}
>>> +
>>>    	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
>>>    		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
>>>    	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder), @@
>>> -648,17 +659,6 @@ void intel_vrr_set_transcoder_timings(const struct
>> intel_crtc_state *crtc_state)
>>>    		return;
>>>    	}
>>>
>>> -	if (crtc_state->vrr.cmrr.enable) {
>>> -		intel_de_write(display, TRANS_CMRR_M_HI(display,
>> cpu_transcoder),
>>> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>>> -		intel_de_write(display, TRANS_CMRR_M_LO(display,
>> cpu_transcoder),
>>> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>>> -		intel_de_write(display, TRANS_CMRR_N_HI(display,
>> cpu_transcoder),
>>> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>>> -		intel_de_write(display, TRANS_CMRR_N_LO(display,
>> cpu_transcoder),
>>> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>>> -	}
>>> -
>>>    	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
>>>    	intel_cmtg_set_vrr_timings(crtc_state);
>>>
> 

