Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708DDC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 06:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F29F10E0D1;
	Wed, 15 May 2024 06:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmPbcqpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41310E0D1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715756005; x=1747292005;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZCvGk7NMl54C6oEUWFYG+HufxyZGwX6rqwUUQFcojOQ=;
 b=UmPbcqpQ0ecVKsA2S0uWdZtqEdvUqF+oDzqOBu7O4ANIYJP8NEgW/DGC
 vdHLK2OPJz9jiK5j64nMqNwrX5evBtXG0KFN0eajYeScXLOmTxVkeoSaN
 TuaQSiml7O7+7jngGmLP3Mb3zvQkz3VjyvNU4fjJUKfrzjFqjXwbgJWCS
 njFg1mGwdOnETBxr7UekiA5qZ+auK6QsQcu+Vtiybauj6lwTqMJ1O9Zz3
 O65RwR1Ey6huIMbDTZ7fHJlKS4+zAODHT/p69Ej3IfQUePaiZLQ09WFT5
 VKTcpm9C2qc36VgGhcbdsZqNVsOFKHco+FbPIrKSjm5SbsrsAja35+WwH Q==;
X-CSE-ConnectionGUID: ZYZA5adSRfSvmoUOpte9zg==
X-CSE-MsgGUID: w5O++PIgRFOxtZPLtCXOjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22387642"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22387642"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 23:53:24 -0700
X-CSE-ConnectionGUID: Q2MCpyhkTZi+E3Mj+uZO4w==
X-CSE-MsgGUID: d6tGzIfbRFGjq4lTC2mBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31032715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 23:53:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 23:53:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 14 May 2024 23:53:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 23:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0DsHehspFtx7m+3n9xYD6fFqKRsnrDpgbfyTIcir2vQeRy61mOzFpjDHQ7dwFaHGaQFk02da6LnSHE0ddTucpoUk30IBIWey7Z7CgvQzbVVIcsWghkyV+LhsMW3Qg+I0XJb+Cm6MIFmkpOojpm9BoNjX7XbznqZbpnnMnQR1pIYmzFz3AW8oN6JDyYHXrgnuBSTE9R7OLARK/Y/NojVI9HcbY9sRLg7BbetKDRRELQaoNkAj0tkBdbEn7O+BuOlTwmZcoGBZqQ3+LW1pCMtFF/0R/bNNFr9g3841IUtuHzjtReipMgJrBhm49ZiU/jJ/F+gO5I7MMLs0R036cSWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbFWPYChlyH9fb+av/CiZfr+yt5UqBcBitNLcqO0A4Y=;
 b=Ewrg1Qt7NLATzgeqWGnl7adhOHR6BX1FUEEMbpvrphv+JGPXnnADLa3dY4+POz46sDLAAPAQPs3oBSCHL7rMuycn4uLtT4wJeuScoOI878RJrtmAmrmqP24D2DlKUYVHAfvfK77CuCtEoqoRr8Bsiu179KtYRBdGAL8U3wpUl7QwdxfLIyTxq7PvujQr+wQnq8oOj5mA+CgnU+beu9cN9d68b4ZB3ykQHBzJ4imKWtXzqoW47Dz1xjgCZgmf2gK/4lRv9MwbTIfDmxB+WNCA+gcwuTAzFtM41gnbcDaxoSZOud2bg3LmSRZgHzRcHpRXM1MIqFkFhSFdyg8RVunDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 06:53:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 06:53:21 +0000
Message-ID: <85293c6c-9a1b-4145-bb86-9a000c58eb73@intel.com>
Date: Wed, 15 May 2024 12:23:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Only zap PTEs as needed
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240514232325.84508-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240514232325.84508-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ccc7d0-47a2-443c-9acc-08dc74abb546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU9ESitKQVkxeFo4VlhQN2w2VXY2Tk8wLzZ1eSsrdVAzNjMzb1hvaGF0QVVM?=
 =?utf-8?B?R2J5QzR6dXVDSkRmVSt6SGMvNjhheTFNQmVMcWpoeGZPYmZ4NjBGdmZOSlhC?=
 =?utf-8?B?OVlmdXlaZmVzRGZRS2F4V2RFV2k3QUlSdUZ5TFhIS21aTnQ1ZzhRUGZ6OGZP?=
 =?utf-8?B?RGYwUElPMEtIdmFOVVFaQlZMbFlzZ05nU1NyczJ1cktDYmdDamZOWXFVeE1G?=
 =?utf-8?B?Sm83OFRyRVN2UGZXeFpqYnhPOEdxaFBISXlVUVd2eExwbEpaczlLbDZMdmx6?=
 =?utf-8?B?aWdNUUc5NDY0WEJLVXp3bXJwU25GRjZjN2pBcitPOExaNHFxczNTcEVMdXdi?=
 =?utf-8?B?Rk4rNVNQRlB3WC92Z2JaRy9mRXJWWEVtU3lhbWJzWVVNMTdmK2NtaWowcWpj?=
 =?utf-8?B?M3JSdlZ5U1hwNGsvZG92am16S3AyZmVsOWJQYXd5Ly9ERHYrVERZd0FZOEZt?=
 =?utf-8?B?NWpXall1NzZ0THJTL1dpK1VKU3VMdm5qTVBGNHFjYlRjOTRGc1FtaFF0OW5M?=
 =?utf-8?B?WVF0cXdBZm93RWZUaEhNUlp4ZEdTekw5ZXZ5YUpONWVuNWpzdFQ3OU5OSWNP?=
 =?utf-8?B?OC9MRWRBejRMYlhnbTNBbFE0MmVSYnQ1ZklPTEYvSzU4WHdpd3ArOUZWQXRi?=
 =?utf-8?B?Zi9YUGRBSTdFTHJxSXEyc25rWE13UjhmM3FYVnZ2cFZHT0hOUlR6Qm5xN3Ey?=
 =?utf-8?B?T0ZaemZMa2IvT3hZcGtWT1NtNDc1dk1rNVArSUhTVldhY2lnK05yNnRBTCtR?=
 =?utf-8?B?eDR5MCtwRUx3SjBKdkNWWmI5OU9ZREU2SDI5SlhjSEg4NGluckRzN0g3THgx?=
 =?utf-8?B?a25Ia3BETTJ3NFIxL3BhMXVtZjFQQ2NWLzk5R0daeEVNMUI3Q0FYUFpGRVQz?=
 =?utf-8?B?a2JYc1BNUThIWmFYZ0F1NkpDcG5SVmFFN3A4eS82TmV3eFRWdjZKZVBFVUo5?=
 =?utf-8?B?cHZiSG9GMUw3cnEwQW0vUkxnSUpvbEJVenN4WlV0Y01FVDBkbE1qUHBPR0tN?=
 =?utf-8?B?bG8yUW9YS3l0NkthTklZZmhxdVZmd2sveXA1UWFGYmN4U0VSVUFaa3E5ekVp?=
 =?utf-8?B?UERmd3BnSngyNGZvYWtrR1JCTWlIVXppMThmT0N6dDhIV05IWkh4anhmdk1h?=
 =?utf-8?B?Q1RyMWY3SVdWcWorUWxJNEFCb2NCWkVYZU9jeEJpSmkrWURxVVVHZVE4M3o4?=
 =?utf-8?B?TWtZZnE4ZFZ1Y3BMQmVKZUFPRW82VVA1MzVzd0NYMUpjb3lUYVg1Y2JxTVBR?=
 =?utf-8?B?dzgzb0tZd3FTdEw4NjRVNWNEWE53SENQT0VVbVZUVFVJSGxNTUJ0MnpNSTNq?=
 =?utf-8?B?NW1CM29BbVJjZ2xsblFxeElSQ1NUazVOQUdLdytvbXhQdkxzeDYrNUtHRDBF?=
 =?utf-8?B?UmhUc3EyanJzdTFjM0Q0YXI2Mmdwc0tlajB5VlJ5L0J3QTZlM0J4NnJMUGd5?=
 =?utf-8?B?R2xWbU9rNUR0QUdlZDRvTXBtWXVyMXpjc2J1K2FRaDNwaGxqN0pLWFlZUlJx?=
 =?utf-8?B?a2c4c1pwcE9RVXJZZ2dkdHpFaHV5M2FwK2tQS09lZEhmZ3hFVlZHWjduekJ6?=
 =?utf-8?B?V250MUZpVVZLVXJaVkhwSCtRamwvbm04cGlLd3oxVmJ3bHFMejFMUExOUmNR?=
 =?utf-8?B?VkRYNzluTVZGWS9mRlZzRjRHVGFQNWxXZWpYd3ZrQlFURW40TUlWb0VqNzNr?=
 =?utf-8?B?QW85elg2b3F5OWNEYzNvUC9lOGpxSTdYWXk1alM4anlGdS9sRGJxSnN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG8vS2RNTUZOOEFyanZGSlpXaTBvUmRSMGJSSi9sN2l3ZDVGM2V6ZmhiVDZL?=
 =?utf-8?B?aWpJL3djTlQ3eTlpRUdyKzVpcmRPQzZ3dUFkaHFXVVdsT083UGNHamRuc05Q?=
 =?utf-8?B?Wm9TL09XTlUxQkZ0c0czZThoT0RVb2MwclQ5U2d4UlhuWFdiWDVzditBaW1i?=
 =?utf-8?B?R1RBUGxyK0MvQXIwM3B3TDN2ckU1aHBVdVdZZVhtOTdFTUgrL0hURkFxZkp3?=
 =?utf-8?B?d1lHaE5nOVVZbHZSOFpOMGQwV3poVExCTkFUeHhkcXJGcFRzZkF0eWdrRjNn?=
 =?utf-8?B?NGdKODNwNitPZHNGUmg2ZU5JdkFaNmtlOGlweHpmYzZGcXVnMjBUVStBV3Mx?=
 =?utf-8?B?bkI0VjJpQ3N1c21hbEh6ZGpQWU1uNHlhWlNLY25EU2hVNE5oUS84aHl5MFFL?=
 =?utf-8?B?UmlmbS9aZFhjMlBnSE1pWThjZmNTSU50MHltQUlKaVloUURaaFN1UUJjQllL?=
 =?utf-8?B?UE5mZ1BLMk9KaWxJTkNaTE0xUm43YytNOFR6aVdBTEZaTU9uMXlXQTUyRFJG?=
 =?utf-8?B?R3VtcUJNZ1h1NDA4UUoxNmNmYUkzZFd3SEl2NjJMT3NUMjViemZuNlBZWlBR?=
 =?utf-8?B?T2tRbzdPbitVY3FXZDhJSStXcWYyck50c0R2UjRaelZGSEhSNmhlNkU4Ri9G?=
 =?utf-8?B?NGZlZjNzaXV1NHdyaUt0N3FJVzB4TUxRRmZBU1NuanppUTBGUnZqTENabGI5?=
 =?utf-8?B?YW16ZDFhc2d3Z00ydFpLVmdRZGtPaFpBSW5hc1UrL2x2ZUE1aEtZTnJ1SzY1?=
 =?utf-8?B?T2Jyb3I2by9Gazk5OWdkVG15SndXaEppZU11WXZLaVJ0c21sbitNWmdIUzh5?=
 =?utf-8?B?WWdPOVBRMWFQZEJCcmE0NU1wRGc0MmxHOFd6R2p3dkptald3VVZqSkdZa2tK?=
 =?utf-8?B?N0tSaEEwMUJNK3hoSzZ1ZTVaRWJNeDIydWtxaGR4amZCQXFldER6WWowbzdq?=
 =?utf-8?B?enh5TmRyNWZCSEtXQ2VrOFB5ckRKaDdIKy9xRU5MM3F6T0JTdTdkSTN3eGE0?=
 =?utf-8?B?M0tjWlE2eFZRZEg3aGJDVDY0UkR2V1pRTVJjaFRTWjZVbmprcXdtSjlabnhG?=
 =?utf-8?B?cVpLK2N5ZTFIUUZGb3U2MjM5YTlrajdHSzU1NGgyZXVoYkJ2ZGNkcnprakI2?=
 =?utf-8?B?NjBjdnpROVM5MlYvSkF1Z2lpMVBvUFBPMnpZK3NzdHpqbHBjYmFTellDWUVy?=
 =?utf-8?B?WlRuY2tZaDl5SnZkT0RGUDM3YVBnb2g4SjZtbWVFRVVCWjBzUU5aTkZmdlFE?=
 =?utf-8?B?MmRhZmhsZEM5Qm5xSW1seGVXZ0lnYWczZXVKRUVpY3FXbTNMRjN0RnY5NjM4?=
 =?utf-8?B?cGtMTjNlNVFaam5hS2hOTGNiVVVDZm5oV0xtZVhhR0lHdE9wZ2NZclZrd2Er?=
 =?utf-8?B?RGFnK0hkNDRnZFBKMFc5S1dNeFdkdk5wTU1YRlF0MDdobGJTNDVIMk9ZZmFu?=
 =?utf-8?B?UVRjS0FodDRGZzBrbWtZWWh3alNTcUpMTkF0S3dTR29vUVhId0FGbXUrUGxK?=
 =?utf-8?B?NnpCRkJHRFZmTjVDV2FCU3BRU1p5aDJFVXhMa3hOdjErL3dxSXdXSkxQZHhk?=
 =?utf-8?B?MGJ1M0tSUEdtSVBBanlKMGNIMkZZZnB0M1FNRk5LenRLZlRPYW9tNDVhQlgv?=
 =?utf-8?B?cWVTL2REQ0xveVZUYW5tdVBldTdzdExpekRkOXFXZFpYdjhNVk83bWxHR3hO?=
 =?utf-8?B?OHQ5ZTZZY29Jc0xCUEM5UFVXYWVPYVZaRzJYbmJ0MW1sc3d2K0M4YVJjSjBW?=
 =?utf-8?B?VWI5SDhOZmJnQXcxWHdwUi90N2c4anRMamthQ0U1cHg4bUIvTHUyM0VFVUkx?=
 =?utf-8?B?anRBZ1hkQnRNOVBPc3NOcjJqRENPM0F0RUJBeEdERVg2dkRoZTk0MjZVTkJj?=
 =?utf-8?B?VWtFRVg0UXRWTitZRG9jNFlaMys0aUpxa0FGTXZrei9lczRMMEVvN1llQmly?=
 =?utf-8?B?clg1OFRjTWlIbUx0eFAyRkJjZjNyNDk5MENTR3lhcnVBcDk2K0JDdlBOeDRj?=
 =?utf-8?B?bEZYNzNSMEhHT2QyV3dMMkxsZXM1aWZOZGRRWktFVHVmd0JHb0tjVTQzdlZF?=
 =?utf-8?B?YnJjRmlBdDV0WlVDMUlZMkZKdzIxLzYzZUdrMmpaOEtPK0tXQkRSazh4Z1ZU?=
 =?utf-8?B?WDBNWDZ1dU1iWnRsUHhHTjFBWFlvMTBQc3Y0VTl5OHdaZjNmR0pUcDVwc3h4?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ccc7d0-47a2-443c-9acc-08dc74abb546
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 06:53:21.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhu7Je9xYcQfv7qHd287kXzeHfXhhum7PPfx/G7rNBWW9NIf/lYPUdQKI8B9sPFqnd4D+BKs5MDqPMbX0jDSOPr17XSS5xkM5ey/F0Altls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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


On 15-05-2024 04:53, Matthew Brost wrote:
> If PTEs are already invalidated no need to invalidate again.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f792b7feb06..d8817673c097 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -815,8 +815,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>   		.tile = tile,
>   	};
>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> +	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
>   
> -	if (!(vma->tile_present & BIT(tile->id)))
> +	if (!(pt_mask & BIT(tile->id)))
>   		return false;

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
