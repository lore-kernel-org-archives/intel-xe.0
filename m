Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7931D3516C
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 10:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F5B10E323;
	Wed,  1 Apr 2026 10:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYr2hpbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E58B10E332
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775038027; x=1806574027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yP8gXg+0U4D2xChKOgqDXqnbg1dMsFDdKwq6vNRUmIY=;
 b=IYr2hpbfWuPDGRaF1UG5Hm1Dv2n198vSa2HIgrkJCuafIZoz4qUZxpat
 NDIGslvUiO/yTWACpqIvvk3rYqaSqQElhsAlUMAkYQ3UkIO5APL/e3gGr
 jIVqbfzNPbFEodrALfNORUlanB21A95OA9XLNDezVogKEwBlR8KJqVHxM
 mSKnFeaafxvWvLCL1mFLiveYf5Mziac7oYwn7HHCu5UYIJB4dmy4T7vn3
 QkO+hTxPcR8cXEuZfB60sBsG/HsavhckTqrNbIyEs5tX5I9PvHaDnMu6+
 TDhLhzRcu1+1tM/3XNDOkRnWzxPNuQ/Prh6a7moiHSq3eLLh+HkR4Gu2T A==;
X-CSE-ConnectionGUID: v9f2YIK9RcK4Lgg22OXr4w==
X-CSE-MsgGUID: Elhe2+cPQQCaJCzokt5TUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101522650"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="101522650"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:07:07 -0700
X-CSE-ConnectionGUID: MWAKrNIrTFqwv4os3lvSXQ==
X-CSE-MsgGUID: bQLNKDt7RQG1GRdSjxdfmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="219982649"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:07:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 03:07:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 03:07:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 03:07:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzuVm/1v0Z9LOHSkS6sa63t1WY5oCg4xgvClmzM4iKvvPqzNdiySg3xoHEI+fL1W5QL/7zYPzP8dOL7p0ZD+ItsIUJ/LFqgr78tmAftgYP+euE0ga8A/QrHNUSxa+Wp0X/tGoZie2pxRPEeQhsmbmSlNVpRhe6a2hDmsoTc/F5hFeXILX41brDPJZ2DXZwamP2Iz77PwdImhguo+0//byGntYIY9iggEHzMw9A/L0lTev/AjF5UbnlAwSZYi/bA+IQ9FsJAmM2T7fXPl4AbLQbI8D5XklRpKoRGo37xo4XDWQeL0Qfudts8ImdegOR/iUfVb2esMJ2AQTaN6HP+Jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK8w7Vtqlr1G8dELX510/fpaoRTgd7zc7zz2dZffkhQ=;
 b=GrLaum9DW1UWAmfzXO3LHpdhZiZFNMJj056MPKjuhUuTkHDQz76FOlSRYrV1f/TkXP0xeuWyFYH/RPiBx5UYrgccMSQPKE2VUCMdyVE58rmJalvpurF2PXtwIYVM4j66n40d7KEus0H1dKgQRNhT0H2GgFooXtHzxoFc0+4DZdZ8QIsTiaywjZ3pthh9hCvtBHsZmIWvMmD69gU/Ulw7/IlzAVRX2jKrkY63Bm74JBb7OBEZe3IsU/VWG2Zf9W54v/9uDt5dbcvrOWQATsEhH5Tp7gyNVzeSgNnwsEwc9QC+7q0eQYBKCnxsgr7gHCCtq5OAk8wh8Do/ESg6Okjl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 10:07:04 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 10:07:04 +0000
Message-ID: <c04684e8-f312-4ea6-ba12-d2b9ae6c7bcb@intel.com>
Date: Wed, 1 Apr 2026 15:36:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260331102346.1034100-1-raag.jadav@intel.com>
 <20260331102346.1034100-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260331102346.1034100-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 624d0bab-df79-4cd1-70ba-08de8fd66c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: KK9M+6ToT34cJJaLrTUbMOwGRSZLZVDGVgsJW98EBCun3rF5PAr2JSbR232YPekO9Dz5uoGawypr4YWLff3N7cdG0K2t1zj3gFcFto5jJ8KNOfvfT8BbCD5odTDBotxnqRd2hb+O7OHxAAHRlXFI/JOrBmFaH2jzu72q01Ba2c2a14LzjB46kuggEOK8rmF5Uph8RW3cAvwa8kkfiTDZurLdPZ9h/rBvnZc4zhWIxD5ItlJ8TlqOOLV7I3gBquaKt9oV502TvBIBLja3gRCTHSxTqD1qVufjj+U2FGI9CVmKwp6n2PvnvGbdlbGrlOJaSL4RFsq4cMDm5hqhlwYXxSQwnfzIT05SNALPjTsZE+g42zRGbJCFKxGTUrghOwyIP6boGpHAcYFA+Qr1hWxJ9AAR2S7W1A42fiazMNQX6FfgpnNU/sl8HCnPEkGKX5/1aO2/pgq514cOwQ00BJLtfK9M3hLGlERqFarD3LHCR5BGqhnyrXl0LEWzMbB/7WRabdLfSj/o9eEajDfGOGcL5uBrUWvLjE00qNRW66EaLRU/HZhiD6KZXgXnHiQ3Wkp+EtTYwl5RN96tGng/6ZfHTmcpip6wysoDW8nMws2SI/oExn6MuDYjoZ9wEUe/EahVcnRwOYgueLYAGZGCOu0Rgy2EHG/sqJ3HGGLrjgvlMjO3q98JBt6de57i2ml8N3COGpu4JBuMXpcVdr9mAIg0Bsqw5pfq91E3MOnFeHvn7vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFXV3h6TzZma29tNElIZmFBOVJYWEhOT2svTkwwaDl1QXRXUVVpMjdLdDUz?=
 =?utf-8?B?azRxUGpaN2Z0MXJUSUkrRHlCTitsMG1uQmhnb3ZXTXlKK3dPSWI5QVB3Ym1U?=
 =?utf-8?B?cjYyaEQ2NTZMRDVmRXpQT2tNQ3o1aUVGSmNWK2ZGRlBFdUxIVEs0ZkxTYXJt?=
 =?utf-8?B?clZLOFlmWHArbHJ2M2p3VGVsZFdORDhTbjQ0c0MrNXhWVFB4S1hnZGRzcGk5?=
 =?utf-8?B?MW5YbVRad2c1ajhyOE5BdkpJRjFQdkJTVUhZT2xXS3R2azNOYlI2T0FTUm5u?=
 =?utf-8?B?aFhEa1I2TjZVbzhGVWxubVFRa3FMQnJJaVJTZGpoLzdqeTJkQ0dUbE1GRXlC?=
 =?utf-8?B?TUVROE41b0xtSWcvcy9BSDY2cWlCSS9TMlJGKzNTU2RMMXU5WTFveHZWd2Nh?=
 =?utf-8?B?YzFPeVRWRW5VQWNmVm96YjNoWUIrN3V5UEl3eitoRzAwQnVQRlVZbFhhTXBt?=
 =?utf-8?B?ZSt1a0ROL1cwZWd0VmcvOGxUWDFheEN2WmRGbVN6S3FwK0dtbUZ0bUxPTVBk?=
 =?utf-8?B?clphdXRqcjhEWlcxYi9LazlzaVUwTEhscUt0NnRCZ3dNZ3pGdDZGU0Y0UUNn?=
 =?utf-8?B?dWdCSGF1NUlDM2hEZDZnVlNNQ2IvSFZYeFRGbWRieUVXNTcveFpYTVhFek5w?=
 =?utf-8?B?WVVyd3QwdEpjekQrelhta3NzVlpaL0lVa2FENzByQXJpdnFmZzc5ZkV6UEkw?=
 =?utf-8?B?SUZNN01GcnowQmhlejV0OUJvbVQxTlFYYTZMK0hHZnV1VDJySUo3aGhjVUc1?=
 =?utf-8?B?dVhzWk5OSWZlNVhuczBRcmpaMC9IOGNPS3UxbEJoOW9WUDliRk9Zak5RajAw?=
 =?utf-8?B?MlBEQ0pjR0VjMFVVWHVQenlucHJTb2lVclBZblZDNkNsamJHRTBUYmFXaUlI?=
 =?utf-8?B?ZG1nSWw3SGh0NkY0ckFDMVdFY1htUTBrV2RDbk1RQWdmL0xGak50SUUyaHFv?=
 =?utf-8?B?VDBSd1NXT3JQQ0xyUUtzbGttMitTNkk1NDRQdjdGVU5PRTFQOE03ZmVXcXRZ?=
 =?utf-8?B?ZnF1cXM5U2FBQ2hKWWRoSFhGQmVWeURiSGdTb3QrZU1nQUtYUVpic291VWpV?=
 =?utf-8?B?TEE0S1VDN3BDMUdwU2p6TUxZM3NvU0kvODdtckZYV0hEYmwwajFZclFKbWM3?=
 =?utf-8?B?dmVTS2F2SmR6Zk1hTnlzZm1lNThncGsvQlFSZ3pjMWQweWRhMkh2a2JYWnRa?=
 =?utf-8?B?UHN3a1IrQ0JjejRqTjNPdDNrLzZUMWhSbXVsUER3Yi9DellyVytDU2M0MGVo?=
 =?utf-8?B?YWJEUkYxTHJabDlPdXhCT1JRVW1rck1jQjlBM2JoTnhUZmUwMVBDL1JXZVFj?=
 =?utf-8?B?REJIOUtUY2FpUER4NmU0N3VueGQzR09zb2FsQkpuVTBLNnV3QkMvblJEd2lT?=
 =?utf-8?B?cUZJSUh3NVFERHFwMVNyb3lZQnFZaFNXOEVCa1dNZVpja1pyMUFBMEJMNUlX?=
 =?utf-8?B?NXNSVTE0MXA4ZFRETHl2NU9oU1d3M1M3TjRkVi9IcjljODZmV2VwbysvZTFC?=
 =?utf-8?B?UXlzMklYTWdjS1NSd3VqMk5uN1ptNzVuZ0VUV3NLbHFZZkh1WktxZlAvb0FV?=
 =?utf-8?B?ZGc2YzhEc2xGaVB4bUFtL2djRlg2ckZPYnFtQ21Cam03bVMrb0w0S3FCU1pi?=
 =?utf-8?B?eVJVS2Z5Rm5UdFNnaFpSUnQ1eHl1a0VlMUdxbkhXRWVZMUUxSzB5Wm1DMEZT?=
 =?utf-8?B?S1Y3VXNHcXVFS2FCMlF6MmdoY0R5YmlZVG5BcEt1OU5Va0REL09neVdnQW9p?=
 =?utf-8?B?Rk9sQXg1Zm5Fbmd0SDZKYXcyTmdqaFoySkdEUEptVCtrdUhmenRxd2JvNExs?=
 =?utf-8?B?TTBIanNhK0hUUmowWlNRRzNBTjllb3ZMOHM5V3NPeDNiM0NYUHpaY0VMTWta?=
 =?utf-8?B?S21TcmU3bFVJVitWWG9qZGF1WS85dmFScERTMlFnM1Bqdi9TSWRDRkVmK3d6?=
 =?utf-8?B?Nk5DKzNnZ21wVzhhcHJrSnNIdUhzSy9RaHd4VkVmRGh3N3VocW9rU0pRZmYw?=
 =?utf-8?B?U2R3TDVWZm1yNXpNVTJsRCtVZDNac3dhcmM2a2I3UzVieDMvVVROaVNYbk1q?=
 =?utf-8?B?TE1WNUpRWmxTeU8vVEs2WjFjWmdhMlI4M2pkNzZPVjRLaVo1VE0zN2lmbHly?=
 =?utf-8?B?VDMzK0FYc3hZbi9ETU9QbEFuYU4vQzdOcWRnd0RxUXpRUlAwWk83azArWmRE?=
 =?utf-8?B?VFJ1TmZ5eTBOQ1lUaVRqUDM0QkswWGk4SzZMK1V6bDNYTmhlUGVUSTdOL21Y?=
 =?utf-8?B?dlJLQ0tseEFzamM1MWZRSTdHRjBkQWxDRHlTd0tscVgydUlvRlNFaE12Q1ky?=
 =?utf-8?B?TE4yUTdEdklEMk5IcU9jT2Y3bkhBdjdpZFVyVzhRQ0pHL1o0VThIMXcvdTI3?=
 =?utf-8?Q?uT96c3tz5Xgdo/Lo=3D?=
X-Exchange-RoutingPolicyChecked: uaL4JwcH+5hYGn9qSDsyMTMJIIpo/snpuzGCBrD6igCl64yGW8CJzyJb/+HnL3J8CqXS+erPAznqECLrna19PKRY3jldIiq7cAeEt+XfRenjF6lAz8viDdX6ehjlOrerqjt798N/23msnAreBr+nQ+56E6RSKPLP9j1sYAgIQa0Q0CUP0hZrILeM3ZbSfQOCPxh2Rw++96uE8PLYxWJSbUc3Inw1KWMa72GHEVw3vBd+CvNAmBtIBgsBggZGfKlV0UH6n5Wkpxx5GT6UN8gTnOoBfdhmxcy5o/acCUVqsTDFSEPVdbEE45fpmmxWV7hL9G9ZJzxbvQRaI3uX6m2zew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 624d0bab-df79-4cd1-70ba-08de8fd66c40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 10:07:03.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uewI+MY7k1mFHcKMGR8fC+KhvNEyyj/S8/5/mzOrpvYi7pWK7wxIzOUn827+LogvkZfF4A8w2lQMFCLdUSTzYAy6yxEQKEq4uJN3MBm+uM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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


On 31-03-2026 03:53 pm, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: Handle unexpected response length (Mallesh)
> v3: Handle event flood (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c             |  7 ++
>   drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 88 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 ++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>   6 files changed, 159 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 06b5d53e1629..593b359bbaca 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index afa9654668a2..7003b1da6e46 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -12,6 +12,7 @@
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -39,6 +40,12 @@ static void sysctrl_fini(void *arg)
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	guard(xe_pm_runtime)(xe);
> +	guard(mutex)(&sc->work_lock);
> +	xe_sysctrl_event(sc);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f7469bfc9324..090dffb6d55f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -16,6 +16,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   	return container_of(sc, struct xe_device, sc);
>   }
>   
> +void xe_sysctrl_event(struct xe_sysctrl *sc);
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..800d100f09c5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> +					 struct xe_sysctrl_mailbox_command *command)
> +{
> +	struct xe_sysctrl_event_response response;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 count = 0;
> +	size_t len;
> +	int ret;
> +
> +	command->data_out = &response;
> +	command->data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(sc, command, &len);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			return;
> +		}
> +
> +		if (len != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected pending event response length %zu\n", len);
> +			return;
> +		}
> +
> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> +			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +		} else {
> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> +			return;
> +		}
> +
> +		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
> +			xe_err(xe, "sysctrl: event flooding\n");
> +			return;
> +		}
> +
> +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
> +	} while (response.count);
> +}
> +
> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> +					  struct xe_sysctrl_app_msg_hdr *header,
> +					  struct xe_sysctrl_event_request *request)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> +
> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	request->fn = PCI_FUNC(pdev->devfn);
> +}
> +
> +/**
> + * xe_sysctrl_event() - Handler for System Controller events
> + * @sc: System Controller instance
> + *
> + * Handle events generated by System Controller.
> + */
> +void xe_sysctrl_event(struct xe_sysctrl *sc)
> +{
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_request request = {};
> +	struct xe_sysctrl_app_msg_hdr header = {};
> +
> +	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +
> +	xe_sysctrl_get_pending_event(sc, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..1430a7ee2b39
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		59
> +
> +/* Modify as needed */
> +#define XE_SYSCTRL_EVENT_FLOOD			16
> +
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,
> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u8 fn;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Number of pending events */
> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u8 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:31;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;
> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 91460be9e22c..d59a825597d3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>   
> +/* Command groups */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +};
> +
> +/* Commands supported by GFSP group */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +};
> +
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
