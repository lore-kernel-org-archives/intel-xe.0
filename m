Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343F2D0EE0F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 17:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D9410E569;
	Tue, 25 Nov 2025 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjdxbEub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3C989D9A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764091194; x=1795627194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ecl50UI8SP/rqhdoXcJvEJajOaYgm+FGLTYu1t2HBG4=;
 b=cjdxbEubYCAyKjhxf+vybV+vxhhJggOnXz+AH7fD7NQ2opS4FGTJqw/E
 7IwLH46ABL2WRQS8ihc2BHh17/+LsRYCCpmyGzFqfP/Xq1t0qSlKHAQjs
 EJ5xwRPTaiG5dqHkpBxZUqp4ZDHcixoomAd3GGiYFcckr0nSDLCYwPp9B
 DO6Clqr6nJ3fRMJo86dXF7+JjH4O8/WXs82oDdiBXv9GzOemuHdCEUaLS
 CKYlvNltwYP3lcFWtG29BsIOiHMWVIWfJs4X+B1+mapzpRG7abXYABz7F
 15n96CveynOR7EBcYnvC07vhNUlidT4EUMkYw21ScwbJqyApHXs3xaIkY Q==;
X-CSE-ConnectionGUID: VOgaCPfVRd+QRHDQNAz2Mg==
X-CSE-MsgGUID: qGgYdTmITZOM9sT+zBQISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77483715"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="77483715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:19:54 -0800
X-CSE-ConnectionGUID: D4woazmeR76SkGZXJCQ+HQ==
X-CSE-MsgGUID: lQWIZF/ZS8iNDMmzLVFPZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="192692945"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:19:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 09:19:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 09:19:52 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 09:19:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH6ezI3cuLtwr7XaWPlx78HSVZtrL2+qfNJ9MYuRTSKzdJWHnMCHqSl4Z/SxZylA97P+YImk70KZ8lX4DwJw90h38ihBo+5cmLodzaW4mZZamCyDEyhyP7tNUdk9iJiH5d9SaExU3zV62t2YSGHb4psMaVH7AjlxoS1JvtvmOJhf7PWu0yDK6u8xPA6GLmgu9IsFurhQNfYKu4gV+prqwGHHx3k7SUD4zw/gNJqcMFxOS1ksvU4DP363BVKO8L72cB//A7VtLzTvPdeELv1sDRdxIfmuXb1S8d9RExiSW2EQXyvpY3lIN49wH8YrqixlJYEL23eqJgGDn1ggxPGipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I0RH+A03rM+ZtlHVZmA3ajb9yIiK2JcmnI2/kcMZ4I=;
 b=hiAMmgBA6U4Sl476MBWlzSgXCIGoTozYlbWkwcDyLo1331NF9lh+x7fWy5XS7S+JXCVgpTkIN4Cu/New25uKryptT++FmEvrQMf/03EhAUZkf9haowfIJNB4BmY+3v9nWbHPYUshJXelNMwVsm/fsuQ8yHEIpoJ0m4tXg5OB17IcQuX+U3R6sXMhbKMIZFnsH5TeNpvAtuCs9kJ3XFSmaLiE7dVA9oCLzZY5t2NmHbq/iOqc6SQEiMxTCgU6931nf+mkV2pKkGGH21iNFrrlDSe6zP1LWbpGrHh7cA/QNOVeyozQgZmAHHHhkNuCUrn6Yxamgql95GAenjD164TakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 17:19:50 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 17:19:50 +0000
Message-ID: <90713c5f-93d8-48bc-aa0c-25c5086aacf2@intel.com>
Date: Tue, 25 Nov 2025 22:49:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V6 PATCH] Due to SLA agreement between PF and VFs, multi CCS
 mode can't be enabled when VFs are already enabled. Similarly, enabling VFs
 must be blocked when multi CCS mode enabled.
To: <intel-xe@lists.freedesktop.org>
CC: <Michal.Wajdeczko@intel.com>
References: <20251015142820.2519054-2>
 <20251125102643.2326137-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <20251125102643.2326137-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: b8299548-a6b1-42b1-9cf6-08de2c46d707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STBrKzg1VVhpY1VUUXhtN2tLUDlDeWo0VUlMdWM0eXJOMjZHQTErVUZxR3ZI?=
 =?utf-8?B?aGlod3NqMU5GNzFJZ014Q2dhWnVEN1pZcWRMc2VjazVSRzcwckllUjN3OXll?=
 =?utf-8?B?Sk5Kamp4aU9kWGw1dHRmWlkwbE5iN01DeVk4cklDNHd3bjdkVDlhcWZsZGJI?=
 =?utf-8?B?TkY0QktvSDhsY1I3ZlkxU0RGT1Y2MDdtWDE3RVlZU3VLRkU5K1RHVEhsd2Zp?=
 =?utf-8?B?NWhFVkllejRmcDQ0dUpFQjVrQWlRZFhRRnBHWk8vMHFONjhhMC91UVJLTFFE?=
 =?utf-8?B?ekJUNk13L3MxOW50ci8wZzVkaWJBdmxyYlN4Z2JUeXY3UzExcGlxRG5pcTdH?=
 =?utf-8?B?Q3RpTkkzeC9pMFBFZE5nRjNmUkplYW5HOEtCcUlXMWRPSTNsdzVkL3QyQ0JY?=
 =?utf-8?B?TndxSUMvekpyK3VoMlpZcHlqekxscHQ2S0QxcCtpTkJhTUUxUlJoMVVPMWhx?=
 =?utf-8?B?ZFd1dkRWVVNQbWhXeWFLUXk0M29nbVl5cjFHRmxMWEs2YTQ0c0Q1aUNDaGkz?=
 =?utf-8?B?ZFZsTktIdk8zTE9rblNvb2ZvOUh1RFI5MEJXSDFneGpwMlh2ZEkyTWZUT3lE?=
 =?utf-8?B?bGxmbGcrcU5JeThtUWg4L0JVdnoxYlppS3l1ZSs2ckVvRjdFQUQ5Rm5MdFhG?=
 =?utf-8?B?VGF5VzlkZFZLRUx5VDR2VXNNbXhjWlFXYjFVTUNMZ0g2L1BXdTdSVkxzc012?=
 =?utf-8?B?cUV1dm53OFlwSHJ3QUhxT0FKZHcxRnl4akpoeE5YeDBDbGpIeklCU3lrRHhD?=
 =?utf-8?B?RW1PM2xiZEhJbEpnQVdma0pBQys0bTEvUVllR2x1TWx6VWFTT0V6Z1pkY0tk?=
 =?utf-8?B?a1diakFNckcwMThVVG5YQUZKSXJmTStrWTFhaDBMZjlIeVlZbG9NVzlwL0oz?=
 =?utf-8?B?dE1NT2VxWVVQMTlJdWdLVk95RDZTOElITjJWaUx5SXlvMjNOMWhrQk0vUDhT?=
 =?utf-8?B?RmFNc2tYOE1zTmpEUHUvMS9FUjRQY1BJWEwyQkYwUmVrZDQvakxWMUMwUlVZ?=
 =?utf-8?B?aHJPcEJ4R2RwOVBBSTNIcDk5OHZEK3dqcEtpOVhZVFQvbnErYkVnclpnSnp2?=
 =?utf-8?B?dDJPR2FPVUNzcmVrK3hQUTFobkRVbFZNWTlNYmFhUFNIOXFYODgxMjMvUnMw?=
 =?utf-8?B?QzJ1SHZTeUVOdENaalRiZXZFRzFwWVlNbytmL1BBOWMwTlgzQlZEd3pkdjMy?=
 =?utf-8?B?NWlSYTRSaVYyRVFVUCtmZFJjREkvOWUrTUY0T0grbnY2d1VpUytwalkvU3V5?=
 =?utf-8?B?YjRsTHFWQnd2L2RjTXRCenBZWmpLVnlCNFpsWW90WUlQNGp6UVVHMVhzTjN3?=
 =?utf-8?B?b0J0c1hyZ2ZVbkpsN2pTYWJJMFBDRy9sWDNWY2g2MVZLc3lDd1pJRzhwdEFh?=
 =?utf-8?B?UGI2a2lxRG5ONGd0Nnh6Y2szcG1KUDJESFBDQlUvTmE0WWtFdXFFWS9tQllX?=
 =?utf-8?B?RUd4K3oxWTJtMW04K3cvam5HYStlV3IrVGhMUzB6N01Hclo4ejBBVDZGd0wz?=
 =?utf-8?B?Q0ZZK1BUNUU1S280cHNmSWhrcnZGaWh2T3hyTXRCdWJYdG5MUm1LbklvaGIx?=
 =?utf-8?B?TlR2alB4Vk81OXFwVkQrZTRiTTBJcjFyUUhtRFAreUhGejc3UU96UEEvZEpC?=
 =?utf-8?B?R21YbE5MK3p3YnZIMHIyUnhWSXBEd2YrZDB0Q1QxcWhLSERBaDkzL2NqUlND?=
 =?utf-8?B?ZVprK0JxWFBuT2xMSnl1aktYOEFPajVZQklXRS9tSWpYeVA5N0tsOXRoeHJn?=
 =?utf-8?B?SHFGWlI3enoyTVVwNGJrRlRZVEtWbGFZK3lwYmROTVhma0tGRmdVc1BxM29E?=
 =?utf-8?B?UU1rMXFPU2Z0OGVKQmtPN09ZbHIrSGRjOUNiUlR3YldjcFpyUmtLQUw3NGQv?=
 =?utf-8?B?cnByQW5tT0hoNVpVdDFWK3JjU1J6Q1J6Z2VGQm1TREM0cWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJCY1Z6ZTA1L21STklkQ3NvcFJydjAwdDYrdDJMOTlwaDErcHErNTl5OEM4?=
 =?utf-8?B?Z0hLSEVScDhKbHpiSTBtMXc5cGJSVmQraWVuQ0ZEVFdCWXNsSE1VQkgxbFNq?=
 =?utf-8?B?cUp0V3V3MnNNTCtZSEJ2L3ZrNjZkMmh0VkN4THpZQ3RwWmNlNlpVWnRSMHYr?=
 =?utf-8?B?WW92V0tMWE1QZ05vQ281UmRzZlZpZ0RHV0ZTT3F3ZHdsT0xaeXp2VG8vbzdR?=
 =?utf-8?B?dER1S1oxc1R4cm1rSW1HNkREVkdiZHF5b294S0N2bHFIU0NyaHcyajYrWm8x?=
 =?utf-8?B?bUlGUElNTm5sT0N0WnZZOEhRNFdvaTlob3JGU2pHeHhoaU1nYlBTL3p5TVgw?=
 =?utf-8?B?Tnh6c2wvS0VmSVhFS2d4ZjZGN01mRTd4eWRzd0RCb2V4T1dZODRQYmNZMnZ1?=
 =?utf-8?B?U09QUmNFeC9vQjRKaHR4TnlncThjRU43cWd4UXlkWG96Q1ZFNFAxMWkvbkdO?=
 =?utf-8?B?V3hEd2E5blZERllQc0pVTEl3Vkw4TnNWT2JrWVBKcll2dlJDZFZKWU9FMXNn?=
 =?utf-8?B?ZFV2MzlaMVllS20yZFBFNzRoZTBtb0dObjhoQ1JXZXd4eDllV3FoRlhpZkZl?=
 =?utf-8?B?TW5neG5mK2s2V3R1V08rSUNmVGJQUGlROW02MVFUSmhYckFZWDNWZndnUWcz?=
 =?utf-8?B?c1dHMW9PMXdKdU9GMlpXejVQUlVrYTlWUDdvU1pDRUJLbVRqS29hTlU2dHNv?=
 =?utf-8?B?YkdrQlhBWEZaT1ZaUTlDZWxyVVpPdktraHlhNGdsL29IdFA0T044WGovZmpG?=
 =?utf-8?B?aVlQbnd3blF5RDJxMVpxRUREQ1psaTN6TmxTSFR2akVHeHhXZGFJOS93QUUy?=
 =?utf-8?B?dTc3Q0ZuZGs4SkZYQWxQdlFMd3BGckFGc0U0YnRtRDRMOXFKamdUMW9oQXIz?=
 =?utf-8?B?QmIwTFF2dzBidW9VMzByV3Rsck5PYm9sSWFJWGtJSnFoT3IrNXBWSTBOM3ZY?=
 =?utf-8?B?ZUZDOXM0SndZWFdpTmNTT0tKOGNPU1FqYTlrUUxDa1hpSFV2VldlUHhTbXc0?=
 =?utf-8?B?d2hJa2szQk9xUDd2aVhpdWRHSlk4TXJYbG5DUUVMZXRvb2hqV1pkVVlFcmZo?=
 =?utf-8?B?ZTFhRlo3NjhodUJ4UE81SUpWc1I4cVhtK2JqeVc3djZoMVE2UGlMeVpkeUxs?=
 =?utf-8?B?T1hSQ3dKTWNwYXVSemdiVitndmJpcVU5YUZNYjc3Y0ljd3RRNEtBcEVEWEUx?=
 =?utf-8?B?amQyYUd6V2x5cm5wSlBHUlRLUllBSVgxa0xjQ3FZN3RhbFNZc1ZWS2dHV3J5?=
 =?utf-8?B?RG5NdFRxc0dOWC9maGNTeUlUK2FaK3JMK2IwcFd3Z2RTZnhVRXRnU1BWMjJV?=
 =?utf-8?B?Q21SY3FqUjdXY0ZFdnhKcXRoTG9BS1FYZU5SWjBaWElkRExHbmxYU05NT2wv?=
 =?utf-8?B?TkZkWkpCWTRjbjVKSHNRN2g4S2I2WG0zaFYrUDFScUdmalZxU2NERDVzcExu?=
 =?utf-8?B?bzR2VWYrWWFpT1cycmNSMGhhOFpqeENFajVkd2JCM1J1YnRSWFVIK3VSQWZU?=
 =?utf-8?B?dlh6TCtudnJYMlBUMzZ0NjBSdnRuMXN1QWZ6Zkg0dWdaMS84VFlNMnh2MmRx?=
 =?utf-8?B?TkxBTUFlSlQxTDRmdFdHV3NqMTVOQUVMTStUaGRNaU85Qmdnckh2NndVSGdj?=
 =?utf-8?B?bXZYc3N3eXZXdWUxRUF2enVuazJ3cnZWWStmUHFUM0JRTzVLTFJGM0hxLzBn?=
 =?utf-8?B?eDlqWU40cmZ0dTRmTjVOS1NKWFF4M3lnUE5tWS9uLzgxRE5lS0NNL09BeUJM?=
 =?utf-8?B?ZTFCZFhvc3o3RE1oM1JsQXFrSjhxQkZ4VzgvRVpwUHhZTGkwZmNGNEYvOEtU?=
 =?utf-8?B?RUM4Wkc2czhNc1BxTUs4QmZ1b3ZEU3ZUU0NZYnNnL0xScTIyYy9obHZTVXpq?=
 =?utf-8?B?VjgyUFVFbzRTR1FaRVRSVU5laUFJRXowZGJmTXBJQTV3Wm9kUUNqNVpVMDg4?=
 =?utf-8?B?TkFOR3RZc2ZRd2FvV0taa01JcG5nMnl6WmY0dDR6SER0OCtEYlVnUStvWUU0?=
 =?utf-8?B?WUFIREt0N2diZFljeGNtNnRKb015VHMrT2JISjNNRVg1RktzejgzNmFYK0dQ?=
 =?utf-8?B?WGUzS0VQZEpQbGdGdlRoODNOZmxJWHhNZmxCeWkwcFppdVhlYmRhMm9SZE1I?=
 =?utf-8?B?NUtjK1FIT01icGlUdHJqVG9iczByY3Q3ZkpOOEJBR0NPTFlmSmU5M3VGR0dj?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8299548-a6b1-42b1-9cf6-08de2c46d707
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:19:50.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxPSRvD5B8Wu/YnrF21jLOb0EV5FisSLqxm8pW7UkC742toPSuUg59ZdcQ9SsoQ73XuH6H1TpGPFtzIjLOGkRm6D0wvpTzT6r2dy6cbpxE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
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

Hi All,

Please Discard this patch from reviewing as same patch being sent to the
mailing list to have intact review chain @
https://patchwork.freedesktop.org/patch/690313/?series=154538&rev=7

Thanks,
Naresh
On 25-11-2025 15:56, Nareshkumar Gollakoti wrote:
> v2:
> - function xe_device_is_vf_enabled has been refactored to
>    xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> - The code now distinctly checks for SR-IOV VF mode and
>    SR-IOV PF with VFs enabled.
> - Log messages have been updated to explicitly state the current mode.
> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
> 
> v4:
> - sysfs interface for CCS mode is not initialized
>    when operating in SRIOV VF Mode.
> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>    enablement.
> - remove unnecessary comments as flow is self explanatory.
> 
> v5:(review comments from Michal)
> - Add xe device level CCS mode block with mutex lock and CCS mode state
> - necessesary functions to manage ccs mode state to provide strict mutual
>    exclusive support b/w CCS mode & SRIOV VF enabling
> 
> v6:
> - Re modeled implementation based on lockdown the PF using custom guard
>    supported functions by Michal
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 47 ++++++++++++++++++++++++-----
>   1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..495bf517a6d3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>   
>   static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>   {
> @@ -108,6 +109,30 @@ ccs_mode_show(struct device *kdev,
>   	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>   }
>   
> +static int xe_gt_prepare_ccs_mode_enabling(struct xe_device *xe,
> +					   struct xe_gt *gt)
> +{
> +	/*
> +	 * The arm guard is only activated during CCS mode enabling,
> +	 * and this shuould happen when CCS mode is in default mode.
> +	 * lockdown arm guard ensures there is no VFS enabling
> +	 * as CCS mode enabling in progress/enabled.
> +	 */
> +	if (!(gt->ccs_mode > 1))
> +		return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
> +					     true, NULL);
> +	return 0;
> +}
> +
> +static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
> +					   struct xe_gt *gt)
> +{
> +	/* disarm the guard, if CCS mode is reverted to default */
> +	if (!(gt->ccs_mode > 1))
> +		xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
> +					 true, NULL);
> +}
> +
>   static ssize_t
>   ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	       const char *buff, size_t count)
> @@ -117,15 +142,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	u32 num_engines, num_slices;
>   	int ret;
>   
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> +	ret = xe_gt_prepare_ccs_mode_enabling(xe, gt);
> +	if (ret)
> +		return ret;
>   
>   	ret = kstrtou32(buff, 0, &num_engines);
>   	if (ret)
> -		return ret;
> +		goto err;
>   
>   	/*
>   	 * Ensure number of engines specified is valid and there is an
> @@ -135,7 +158,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>   		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>   			  num_engines, num_slices);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err;
>   	}
>   
>   	/* CCS mode can only be updated when there are no drm clients */
> @@ -143,7 +167,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	if (!list_empty(&xe->drm.filelist)) {
>   		mutex_unlock(&xe->drm.filelist_mutex);
>   		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto err;
>   	}
>   
>   	if (gt->ccs_mode != num_engines) {
> @@ -155,7 +180,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   
>   	mutex_unlock(&xe->drm.filelist_mutex);
>   
> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
> +
>   	return count;
> +err:
> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
> +
> +	return ret;
>   }
>   
>   static DEVICE_ATTR_RW(ccs_mode);

