Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5370FCA5FC7
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 17:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E836C10F10D;
	Wed, 30 Sep 2026 17:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hO3HBkPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09ED10F10D
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790788308; x=1822324308;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puiTmyQ6SMcal1zinvdSDz0cdiWjqdDQz6JpUTJj+tg=;
 b=hO3HBkPOqbKFRdVUptTJ3ctu9h5X/7bE4rqeKtbZnfnM0R3uWZGnsPUB
 t0sTTPyNQWnzsKT48hfkCpdTdbkJyIUpvc8Vqe7GodaC+AwhTtGAoo6R7
 7xOedJka8HRG2Gln5zfYMQQPKpnTEBvtOkyylDKHVFPbKDZ2vt+3Kos7w
 Gx2dISaJW0ErcYykGmzwk/6W0pKksAglPicGJ01oumpZg57qBmUGTtS5D
 3UH6AIQjQNtuvtSDSNry5hF/sYDaN3v47+4nc7eGITo3be0Tolz98c+iq
 AX7gIB98EEiKDZHcuNCN8YniDl5nupmAHz+Dt2mdvSwb+ntATE6iXFRku g==;
X-CSE-ConnectionGUID: vfdWmiXTT4CLy1gp9xh8Wg==
X-CSE-MsgGUID: Ot+G3Jg/RqSNztK/JpNr2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90588756"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90588756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 10:11:48 -0700
X-CSE-ConnectionGUID: L1nFqnBzQqiJiiRBoSWU/w==
X-CSE-MsgGUID: 7mv0EPJCRAGOqfCmlefeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="272190109"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 10:11:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 10:11:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 10:11:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 10:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYKZYp8OmhWEir0ePL41rjHtOXqNnimymdN/bRyHBrjuhhkhJoqk0lETalU2hqY+ovHrGY72NKgDyexFLjQN5fYs/ujHMyPViy/hBC805DS6S4htWDsAy4Xx5aDebuvsXxFXdb22vzWuvw073wi+thLLe4aTnmvzK944Vt2xPZ2j/cjo+19ZERJh1LAhmHnCcRZaVa3UAZ4C8rb2/7xSGyDnX6X81PessYJXnBzHkpIMOSdK6cWiEdlulSUN2l5sWu5/U5Hlw+0vllIIqKGR/CJSM9ejFgQEuKIgOA4GRUJqFL+B45aI4bD+kw714eaCateVPOpgkyQ/Wd5cd61eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji5uI6T5WCx/DxuI8qVS7dVi6vy+mxAWogDOkhUOlHI=;
 b=F9qrUz1ra+PFHn0oNGEgHhxbOYlo85v4n0K2lBNQw1pvDta8xfkXpcLi3jVbyVyAIP5Nmcjoh6LC6lxfPo/1vrNxd8s7fkg6PqkHsRqRBXmNDunyEb+Npg6iR+6yZCoa+C1QCZJeMW9jiPcwEzTS2hETwnCa4ATPC2ojQqn/9nsgV6N7K1Tx2yuf/VYT3c8hDcXs72bU27DAeuVEItoGqPX0u7z0h2jqNRoVjqwdwR/py4zG/UTWljYZYL8kfRO5OxEnnagKgE3d1qqL1QlL+mHt0Q6jTrbXh1n7yu8B1M/Iul8HauaMN8euRRAHa5K2KriliLA+W1uZDhmaL3B2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:11:44 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 17:11:44 +0000
Message-ID: <5fd7ad96-48e9-4522-82dd-8525dcd6240b@intel.com>
Date: Wed, 30 Sep 2026 22:41:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] drm/xe/hwmon: Update PCIE temperature sensor
 offset for CRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-14-karthik.poosa@intel.com>
 <arwDgY5TyDd8UOxv@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <arwDgY5TyDd8UOxv@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf6f53a-0a0b-4aa0-02c0-08df1f15e720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HXT45z9fkXfO0VRwQFmZ99NSbCKIZFcY+IiM78uTUyRNJBro/e7aw0Hxdm0zd79PiWeIZeQd4fHSvPGA/wb1xVUey+uiQNVlNCNXme8JpCXfnkHzas6lJQZkYePt94t/S+bwCEWOuwclwtmX9aeNe3I6gxr5x706IX0cmBbfqZ5fGpzoNfE8cXmVen6QbJp1tm18xivFjrK7/6RyZBjyt8sUh9UeEIrkiSEByj94dBV3Z4L1qzDpH2WPeCVT3ZP/R9QHWOHuTD7gbxLUAnBORLSguUY+wOt3+HmRlZS4Vz3jKL3xLsrKzCinHf1z35YwZE+cmveLfIlQvVKnGe1duuzylD313ylhbXOu5TFFBIhaBGmBW961RsIsu/HBmgNvtgYn9Tqxxg7vDtb3rw+Iso0uoWd/79zYq4aH5YVco/cXV9Z014lRbjRJLgRRdYAtvjX045snbclD2q/9iwKIVpusdYacU9dFjmf1dYw8LUazw6/fOrhougcq7T06+/e30nWcPoItnDja9q460cpg9g8pPvRCPvfyYcLF8+M6tqLR1zGbVNeJaWUA46WtxFQfUKDE0HqztgpF15sH415115ODylI/lyy1iiYjprXbdhTJ9a03+gp2cdmQigk6dyuyRl21+BSrIGu7rWbDN64oKuvvqN4hnzsooXmB+uFl690=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHBJOXdWd2gzejd0bm1xWmEyakluL2g2TkVwQkJrdGlXUGVrTUxvVXlYN2Rm?=
 =?utf-8?B?K2FDUXEvc3F1eUszdGFteWorQUpxb1M4aC9CckVjTEVQMDFNaDJEdUE5WTV1?=
 =?utf-8?B?R2VzaTZEdTYwano2RlcwdU40NGpkcURRNVdhZFVqcTJydEl1Z2FYSVFqdUpo?=
 =?utf-8?B?OGNwQklzQit3ZUdjNnk4d1dUK1J0QVBEYVFxRVRZWktNcGt2WTc3cjBPUFlD?=
 =?utf-8?B?Mkxra1daMFkxV1V3MVo1bnNkcW44YSttS2VRT3o5NnhUd0hTblZxczNzUy8z?=
 =?utf-8?B?cGd2Y1g4Z1h2WFZqZytCcTR1bU9yaTNFbFNXcHozN08vcDNzWDdRTVVRMGdN?=
 =?utf-8?B?WjZYeld4YjFuc2VDV2ozcW5zNW1aWFdoMWNYZWJwYmlucE9UdG5TY2xPSWEv?=
 =?utf-8?B?eWIxMDNaVUIzTWFaeUJ4Y2RRVDNnMzI2aVQ1eUcwWUhDUmh5UzFQNlY0c2Nu?=
 =?utf-8?B?ZWpKRE42Y2VJWmQ2UTRNYkZ4ZzEwOG5GTE85T2lLbWZVRlBNbW9pODlGQ1I5?=
 =?utf-8?B?VjR0ellkTWRYT1RIQVZCT2FMMUhTZWs0QXllcmpLTHQwbENNZFEybnlydmRi?=
 =?utf-8?B?NnJBTzlrMGhzV25VYUlrK2diWlFNK21ydkgyM25rMTdFYmxZQlVaRkJjeUxq?=
 =?utf-8?B?Zm14cExIbVljVllBRFd1NkFxeUpQc1hJb29iTGYyY055SWR2a0RBWlh1N3Nm?=
 =?utf-8?B?NXRDeUNDdkN0UG93Mk9BUU96WmcrYTkwcll0dkRjbWZKTEdzeHoyTjBxd3JL?=
 =?utf-8?B?K0dLaHNTSnNEK2dGMFZrUUg5d1FKM2QyUDE1YlMrbU5KV0hQS2YxTm9SWmsx?=
 =?utf-8?B?M3FyWXdad0w0ZzZWNjN3cllSMnJkS2IvSnBGc3FLb21tdUNRK042WkRhR0xw?=
 =?utf-8?B?cENaVm03a1BCdVY4cDNzRVRqYVYwdWNnRE5CeW1CNGZHRkFjamdsVldrRExO?=
 =?utf-8?B?alNqSU9Od3JZd0lnRkJTaE1WU3JFT0ZmdUtlYUpMUmpFdlM1Q0pMdTN5cUFO?=
 =?utf-8?B?bEx3TXhtZUdCR0lWTjV3S1k3bDVkckJqeEorUDZia213dzNjSzRRZmNMTXU4?=
 =?utf-8?B?NURCSEJlNDF5dDNiL1BON21sMC9rb3NlazNWVkVZRVlyeDFpRHNxS2dHcjNw?=
 =?utf-8?B?QmdaYnlKbjlqdEUxN3RIcFhvSWNPK21WYkNxclNFZ2xuQ2Npd3BhVE5JZUR0?=
 =?utf-8?B?dWZKRDMrWTNSeVlOdVAzc3gydDBMalE0cDk5ck10ZitycVdqV1hQM2VTakNM?=
 =?utf-8?B?U1EyWjNxUE9vSmdta2h2UXBjeDhzelErRCthT2hEOE1YR3QzOVdDY1dDNTB0?=
 =?utf-8?B?VWIvOGx0WTFXYzNubWxrUkxIOEliTWY2anJOYVlnZFNVM1Bka0NhQ2w5VFhw?=
 =?utf-8?B?VTBlQjRMejgzV2FBaHg1RG5wVG12TWhDeW11cHdoZjlHTzN6eXRrclNKNXJm?=
 =?utf-8?B?bzk4VnR5R2gxVDd0Q0g5Z3BqbFlHYklIb1FGOFNOVkdQU0REWEc2ZkhEZFEw?=
 =?utf-8?B?cU5sQlY1Nlg2L2RZUlVJWEIrQ21hL0RsUlVlbW1wY0JjRzU5VTFibEJRMzJV?=
 =?utf-8?B?NGM3WUV0VVY3MlVoL1ZtNTJMM3JHVDJqSGl1bWtudUdGdzFIMEpYMm1ibi9I?=
 =?utf-8?B?QzlVRmxtN3d1NTN5ZE5jUnkvMzR3NzBMRnV3SDNjM1MwL1dqUU41N0tBYmhx?=
 =?utf-8?B?S0pycjNzZE1pcnFPbEJDZVlydDBMTFFBVVlidms5WHNWZVRJOHhKNnRxQkJr?=
 =?utf-8?B?SzN0NDk3YWFPekw5VDhmYk42UG5VT2VvRTV3anJQcXdpOS9QOU50ck85SFVa?=
 =?utf-8?B?OGM5UEhwRFhrYnlLZEFyNVkyUlNmbzBxaUpyRmlHZ3BDSkNhRU5aWkZJT2pC?=
 =?utf-8?B?dmVQN1RhMU9XMzRoNVFkWEluMk5kQVlaMXNNNndZdituSE0vMUZEeUNOZVhM?=
 =?utf-8?B?YVFmcnNGMkIvTWw3czEySkhib0ZyUTBndTljVXdwekNXZ0FHeHZPSjJVOWhv?=
 =?utf-8?B?cEpQd2pmUlhpWk5peUlQMnNHcHBXTC9pYkFSMUhDWTVOT1JOdWsxQWZ6Wjgw?=
 =?utf-8?B?N1lCMDh6Z3YveWxLRkVOekJ6aU9aNForbjZyOFZJWnR0aEpPYWwwR0xxak96?=
 =?utf-8?B?OGdDUndyOWQyZDJOQTJva2szSXcvYzErL2RGSTl3WEpHaHJNVzN1czVEWCtO?=
 =?utf-8?B?cFFRNURvU2h6anphUE9rVko0alFuam1tZHFqc0IzUVgwNlNLc3BvQzNVenR1?=
 =?utf-8?B?Y25JdEVnVmhIS2pxVUNDbEhzODkrc0szNlR0M1VEOWVlaGdNRDd4Tm1tWkw4?=
 =?utf-8?B?R25vQ3A2OGJSMUtOUzlVcU1uV3FLSU9LSlp5M0ZKcU56dnQ4M0szUT09?=
X-Exchange-RoutingPolicyChecked: eTvyjdvLnry3YYhx1kCryGZTovKg2C/LjgODcNmVP2TsyOInQWBfzccbUQF9kk8wS3AoknyfQNwSF2x8a6Ov69kHkG729epuF4C+sQK7cBs1ZWYmVDA8fLcpLNxsUqDtn20r0LD3TWX1R5QPCztfDuxIxFatVsh+PRhJGWY4w8/pkQqTVTRfufoBRuRiL58etFB99lK0IG+Kbh3SIxppe7qzL39HSVChKuD73UEZVhnwL4LWZfGgsFDdefldkR4rEAIVeYh7FuzMiOiPG/7W2CikSu+u0n40/kNFq3uNe05ffhmu9fMNQNdJZ5ZmWwoHjEAyalP38d1d45YghaXHDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf6f53a-0a0b-4aa0-02c0-08df1f15e720
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:11:44.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9dpUwPr/lYOXPRESsQLppLeJ5xqTJkr/YeTwO8s+e6dy+8T9yEED2px2lJVrq87UoMZcrz7sms2ggpVvoMxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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


On 29-09-2026 23:59, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 02:24:29AM +0530, Karthik Poosa wrote:
>> On Crescent Island, the PCIe temperature sensor is reported in
>> READ_THERMAL_DATA group 5, byte 0. Add support for reading the sensor
>> from this mailbox location.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 79240d4aadd3..fcb1d2f14f5a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -113,6 +113,9 @@ enum sensor_attr_power {
>>   #define CRI_TEMP_INDEX_MCTRL	16
>>   #define CRI_TEMP_MCTRL_COUNT	4
>>   
>> +/* On CRI the PCIe temperature is READ_THERMAL_DATA byte 20 (group 5, low byte). */
>> +#define CRI_PCIE_SENSOR_GROUP_ID	5
>> +
>>   /* Mailbox sentinel reported for an unavailable temperature sensor */
>>   #define TEMP_MBX_INVALID	0xFF
>>   
>> @@ -1011,16 +1014,21 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	u32 group = PCIE_SENSOR_GROUP_ID;
>>   	u32 data = 0;
>>   	int ret;
>>   
>> +	/* CRI relocated the PCIe temperature to a different data group. */
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
>> +		group = CRI_PCIE_SENSOR_GROUP_ID;
>> +
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
>> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
>> +						  group), &data, NULL);
>>   	if (ret)
>>   		return ret;
>>   
>> -	/* Sensor offset is different for G21 */
>> -	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
>> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21 &&
>> +	    hwmon->xe->info.platform != XE_CRESCENTISLAND)
> this is deserving a info flag no?!
yes that looks cleaner, we can add xe.info.pcie_temp_sensor_offset and 
compute group id and byte offset in the group from that.
>
>>   		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>>   
>>   	data = REG_FIELD_GET(TEMP_MASK, data);
>> -- 
>> 2.25.1
>>
