Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193BCD5BB1
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595010E198;
	Fri, 22 May 2026 08:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jypMfhED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB54D10E198
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779438026; x=1810974026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5kAx9W/XwQAgPhxtW7WQPUOrnQjxoX81+fkMxA0dScA=;
 b=jypMfhEDAntsEy10vOoxojNffrKA+n0tuwZXrfE0YR3t7fJJBrwauyaa
 PsxrdIGDU7mfvCVhbNvJ3JIg2dojr4aRpdPvz5kT3RmAQZTrfLE+b4kFb
 4qkhDtY1GF7vcB2rmAhJTguwe4jSS0RsPWEL+t8ymRTrhBRWRfHZRt7/p
 BnAuoYzQZby3VDAoFLDFMZBdBRO5+e32aQXkvFF1d268x00dormjOcbCT
 utv0HvwKFQodnsilUg9brxidLDimB/d/TTqWY0VfXUe8J+GwQKmPRiktv
 5k3l06/UJLz+rASGigJnKXbZJMzHkP+qLy7Oed6wU2GR4PjK64tN++Qan g==;
X-CSE-ConnectionGUID: xjnC1tW0SZ+WuhQDBHNMaA==
X-CSE-MsgGUID: +3W47fP0ReOkE/63Gf+wrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80218654"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80218654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:20:24 -0700
X-CSE-ConnectionGUID: jsy4DU31T1ybLLaRim1olA==
X-CSE-MsgGUID: bfRqU0ahRuGFm5IlEVsOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238251080"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:20:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 01:20:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 01:20:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 01:20:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx6fBXvFCxRxmVprEV56N8kUbylh6VstClfmFKPzeLvay+iErmqG4Rjvq/7Diza56em2dnnH3hDb/WIag8tgAqj+rJvhFyNnCBVmIDTNmPXztjh7J0ljWDjc7OCH6GeYvtJabEbjA/MA7a4fYB87qUZGFpRdhQM7EBXYwin1nB2/hPRZP6a/m03HcnvCEiSmRdZvFnobpHwY2c9f3VQVl2I5TXIG4qO+pcpFyiT7yHIllhKt/YNfzv/3XUBLrKt60FMjmuxjYYa4o7fuFFcIZNmcu5HgCYLyvEF4aTi4zH2lmQaxiUiUdOB+76SWiI8ebtMQcsqWuzNiYz+3VZ1+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRO8+5YfhZhBxC8cw/Ya37cgMbobUXd8gKmVTFfzBqE=;
 b=kVv9XVehE5NqW1NlgEfDVmU8wwZYcktXc+/YLhfbHb0rxB49UG08bJQilqWTtyfM8DTBWtUBsD/glxuJPi3Jl1Mlg+tLloNKQkl0btg6BgzLlPy7tokQHBYeND6IIHYhgDBbmMboDoeZdA8cWk+YlxZNf6p583WZOCbktPV+CvHUS5kfiIzkmP1qfblDQOdrkZQlXADXA7PnfwI8ahnWIzPdwQvzTgz4TWpwrhp/AQwaCA+5KBIy6UBxSd0GMZy8yHgk8ChKJjugZW6VEq74On39zCz9LtFHviDniraBEZNO4DKDSgTrXPQqXMVj2dBnv3EXApLsi4yhsBZ5kEdIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPF37F43E35D.namprd11.prod.outlook.com (2603:10b6:518:1::d16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 08:20:14 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:20:14 +0000
Message-ID: <03c09a21-4216-48c3-a922-48649f8f03dd@intel.com>
Date: Fri, 22 May 2026 13:50:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260518134658.113460-2-mallesh.koujalagi@intel.com>
 <ce8a32bb-c41a-499f-805d-84fca6941db0@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <ce8a32bb-c41a-499f-805d-84fca6941db0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPF37F43E35D:EE_
X-MS-Office365-Filtering-Correlation-Id: b26de8e2-8353-495e-8724-08deb7daf2f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: El8jbuyOtyQn3ABb2miYDmZX2Bw/b7oHy17OBU9iekezpVdb/Tv2HVE/cv5YfEb5UFuwP3zo+qB6t4ciVfcd3l6VmfvKuXUTVVCF0pFbMgo9rm8XVnrCfltMWogO24V2ps95VKR6tLksnu8irBBNI3D9ohXdEps/F0aobiyKTROYakFUZR0V/hHUmqH0GMp8CkBwYupgpiAUD1eaUNYZFsVhO8TU6hB1J3gm9CUAHCkOolmofU61HEDVhO2TUyhdjYt4J/bqITcQ8j4XmVxKxvZzMJv1E7/IDA5OP9bIZacURarhGE09l4XAODdUuysJ+1SOvheI+lxirRq5vYbZsJBufJDUfOOSyWDqdt5GCDD13omj/d3ZDLx0B2j4OTpTuKtxKVUHtjOGZhgmlRt1Ec9KeQZVTP4TuZTOpjHkl5AB/JewNUSm8uAp6uhJNAqcVZUA7yJp5LDBlNdWsKFVyU0rH2ZvhBC8PRgvx2GnVAFQQaZhYyPUGtEyov9QSnG06gsNWdCygb6SooofUbCHpRt1p6WrE1eiMf2AnaJqdediCU0K3JSkGzSg0dSZS3coJtK/uMMA8xjWjKjEswGXVP0q6HpGNSYXMHqpB/FbRzNUhBQ7XV0rpY4QC5UkR5NA7rEx7bpmBGjlCo8E7K1e6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YndvbHBEenI5UmFHYXVlUXBleHEvK0FabHZPYTZ1KzRycjJobzdaUnRZTFhC?=
 =?utf-8?B?R2Y5WE5PSWsyQ1Y2ZzRSS2JJYVUzQis4eVc0ZzBhaVp0ZXhxUTVCTGprbW9v?=
 =?utf-8?B?Z2ppakpaOVZLTkQ2c2QwaHZGRXRFVGFkai80bUpweTBGRHZEblh3b3ZubkFt?=
 =?utf-8?B?MDhjY2ljOVZIRkhPMmlvbGxYNFpWeTlhSU9LejhtMjM3Ny9VZWRKemFzOVZI?=
 =?utf-8?B?dGtraXRRME5yckxLcExjaFRvdUovOWV0aWhSQ1lqblVqY1VuVDk5RWhheHRo?=
 =?utf-8?B?RTJobk9QMVd2RllLTHFhc2VGNm5FVHRXZVozRUl6cWxpdUpvTUlLTE5pY2F4?=
 =?utf-8?B?cTBjRGIrajV3T3hacTdFZEFGTWxWSkhKUE0xWE9Ua05pRWp2U3M3MUtubU5W?=
 =?utf-8?B?MGx6Nkl6UkNXaGJYNUZySmFjSkFyNmdGY1hFdnYwWVhHeDI4MnNvRTVLOFFl?=
 =?utf-8?B?NTdibkh0bFVXbEZKdzFCVHFkNFh5TXF3L0FJTUd3TTlHMGlYb01zdVRMbjJK?=
 =?utf-8?B?QXpBNW4wdWxnOUVMZlVTYjA5a3pUdWZhaFMreDNGZzNuVnFkS0E1RVMrVWdR?=
 =?utf-8?B?WVhQYmN6c0U1S25YQjJMZW5DOFJwRHNxNEQvZDdYM2k2RnllelM2RUdPSTRz?=
 =?utf-8?B?QXNlUDhpR3JMU0Y0UDBrclpxVjJCTDJCclFKeXR6QmtBM2w1M3Q3Q0tzMkJu?=
 =?utf-8?B?Nyt2UU1EbmVja1BZeFllWnRTZUlqQWlVTTVPSjNXSUZmS29lZE9wR0NORWN2?=
 =?utf-8?B?UDV3dzlWWExDVWlodEh3NzYyeXNTMStldkVsZFgzOTBDM29VeW5HeFMzUW5l?=
 =?utf-8?B?ZlhweWh5cUR0YndDRDVmV0tvcG5IT3d1Y2tvREQ4d2tkSVErVGtZTWRMcGRI?=
 =?utf-8?B?andzNVpOdTFxY3oyc1pQSXdLbEt5dzVmdWJlZmFmaCtBWFpOeWNwUXd5cVZN?=
 =?utf-8?B?b21OTWwrRjEzS0g5eElUaEphb2JJT1JPaUFGelE3elZ1NlNnMVFRbERkV2ht?=
 =?utf-8?B?azZrTVlrNXJaQXp2RHd3WUlzazlCRmZ1a1JwbTdWbE5lZ2h4eVU2aXUrcmxv?=
 =?utf-8?B?bHFIRkZseTZxWEZaQjNkZktIa0daUHpjdnROZVJUTUFGT3k1NVJnN0NaMkhB?=
 =?utf-8?B?U2NhalBkZWE2aVNJMzdFTjhNdFJEVzkwS0VDRGlFbXI3WnhuY2VUYmdQYlNB?=
 =?utf-8?B?UFRxUGFNK1FoWmowekxvM2o2VmNGQkhTMnIzYXV1SEF6UWtKVUpSNnpkZnVl?=
 =?utf-8?B?bmh1YU5yQitJSHZYWC9vR21IV0dqdDZIZk5vWWRXVWV2UzZGRHlneUNBRTVB?=
 =?utf-8?B?ZGl0OHhCUEtjTnJFOGdlczIvdk9UYUdMUmxOZ055b0pDZkF4R1VkbE5kVUQr?=
 =?utf-8?B?U1NYell5dUxZUmc3N1UrQzMzQU52c0lmaTRpaE50QSsrZjRsYkdPbVg3Y3VH?=
 =?utf-8?B?UHVIZW1RQStxRE9aSEZYb0g3cElkR0JTQ0JoOHJKUm1IczRsa0RVeXFyUGFU?=
 =?utf-8?B?RGx5K05FY3NqeFVDMHFJSWt2U1BkdmhpVFZRTHordXUxTDhKNkxtOWJUMXJM?=
 =?utf-8?B?ZVRYbDl2MVFBVzVwRnFmWEZ2aWIwcXZ6QjBaSnFuOHdUUUNSRnUvdVFic09u?=
 =?utf-8?B?SnVKSURxU1NUalVxQlhIcjN3T1FkTDVva2pKMGRFQ0hPV3lsWnEyNWl4a0xG?=
 =?utf-8?B?U3Vxa1dCdWZMSStOSUVqSFMwSk5mKzBnZUhiNVBZaml1YmxCRGpza1hPQ29o?=
 =?utf-8?B?bytiZGtVc3Q3ZE1DUWlSSjRKU3FTRm82MFBPZ2pGVm1tYWdYUjdGRWtpQWt3?=
 =?utf-8?B?SVIrY1EzMlZPNkhPVS9FSUdMQi9XV3ZvUEZiaVpoU0FiN2xvN0s4cFpXRFZx?=
 =?utf-8?B?aVhoZURUcVJJMWpCNHoxLzVVYVJiVXlDZjVWTTd2QmxiUEpFcmdSa2hNQ0F1?=
 =?utf-8?B?amRsNDlPaFFGV0Y0akVXb0JQR2Z5RkliYTZkaVcvU01qT1lxZHJmS2o4ZElN?=
 =?utf-8?B?SXBtdUFJRndPd0l6dm55NDNuOTlaUGpnOU9wRGtuN2Y3YTNKbVZNQ2EzbWhM?=
 =?utf-8?B?eURxYmZiTHZzRENGTDU4blJTVUNiN0pIbXRkVEtVSEdldit0RGxKc1ZTUUI3?=
 =?utf-8?B?MzNHUEZaMkJVVS9ZWU54dTFhWDNMaURxbSsyd3EvWlE2d3FsR25sNkhaR1BI?=
 =?utf-8?B?VzBzaWk5Tml5NmZ4cS8yN1c1U3RoSnRGcU51dEtsUmRDa1BDK1ZTeUhMdlJj?=
 =?utf-8?B?cTZqY01NdnZseHRSU1d0c3luZDhiaXdSbzZyRDNpb284YkdkQW53YTdRMkxE?=
 =?utf-8?B?M3k5Szh3U2FoY0NnU1Zzai8xeVlYNUZGSGRic2E0S3d6dU1LOHdmancrUHd3?=
 =?utf-8?Q?Rvj3WdPO+ZQhE/rY=3D?=
X-Exchange-RoutingPolicyChecked: bpfCpXSLlU6QRZ7uF14ndhKq+VeBOVcvlFbuY9HFr1QuyKYFdLL/SC5fOGI92GwXheUVPp3T2Ah4uqgckI1MzMIvp4rbE7KiHvk5jvZmo8MKgUTKN5+jxOiicslyy4fa7oUfSyQbr2FipJ1m84XW3WrearRuiGJCNy2SEsLUE+Mz16vV6B9zCZ8u3SdkujSXZfRVGp7nQCr2PRdVmQrpjtdARyq3JmBUF+MCYw8275fVdmyHMdXYxgIKjWMd8gEt3aULiRNmrdqrW730KQ/8FiYyJTTv4OWHfblt2WZCmfq3aX88W9Ta++nrsQmZsq77EC9aS4/H9nsXOLTAQern3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b26de8e2-8353-495e-8724-08deb7daf2f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:20:14.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y//iPIwlLo/JJSkWIFEwDJmSyDSwJ8S0VV92P+qKdeWNk4GU08ZAK2+LFt0DzBtESbXtF/8wBBvs2ULWXTyL5+uxnqXvx7t2fzLZP07CuH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37F43E35D
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

Hi Riana,

On 20-05-2026 08:00 pm, Tauro, Riana wrote:
>
> On 5/18/2026 7:16 PM, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration,
>
> Since they belong to the components they were added there
The problem is what happens at scale: each component ends up with its 
own fault_attr global,
its own extern declaration visible in headers, and its own ad-hoc 
debugfs registration
sprinkled across unrelated init paths. There's no single place to see 
all active fault injection points,
no consistent naming, and no shared policy for platform or VF filtering.
Introduce a centralized registration system that allows components
to register fault injection points with consistent naming and shared 
policy enforcement.
>>   and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>>
>> Create a single, centralized fault injection module
>> (xe_fault_inject.c/h) that manages all fault types through
>> one table.Each type is just an entry in an enum and a one-line
>> row in a descriptor array -- no more scattered globals,
>> externs, or per-type inline helpers.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> v2:
>> - Add multiple platform support. (Vinay)
>> - Handle VF properly.
>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>    create xe_fault_inject_types.h file including those name.
>>
>> v3:
>> - Solved patch apply issue on tip.
>>
>> v4:
>> - Add proper header file.
>>
>> v5:
>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>> - Change 2025 to 2026.
>> ---
>>   drivers/gpu/drm/xe/Makefile                |  2 +
>>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +--
>>   drivers/gpu/drm/xe/xe_fault_inject.c       | 68 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 ++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 +++++++
>>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>>   8 files changed, 129 insertions(+), 26 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 09661f079d03..d4acb8e9c3b7 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>         xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>>   +    xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
>> +
>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>           i915-display/intel_display_debugfs.o \
>>           i915-display/intel_display_debugfs_params.o \
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..8402189b24ef 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -6,7 +6,6 @@
>>   #include "xe_debugfs.h"
>>     #include <linux/debugfs.h>
>> -#include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>>     #include <drm/drm_debugfs.h>
>> @@ -14,6 +13,7 @@
>>   #include "regs/xe_pmt.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_debugfs.h"
>> @@ -38,9 +38,6 @@
>>   #include "xe_vm.h"
>>   #endif
>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>> -
>>   static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>>   {
>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>> new file mode 100644
>> index 000000000000..405dab10c942
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
> Add a documentation for the fault injection entries
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/fault-inject.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_fault_inject.h"
>> +#include "xe_platform_types.h"
>> +#include "xe_sriov.h"
>> +
>> +static struct {
>> +    const char *name;
>> +    u32 platforms;
>> +    bool skip_on_vf;
>> +    struct fault_attr attr;
>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>> +                    .platforms = BIT(XE_BATTLEMAGE),
>> +                    .skip_on_vf = true,
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +};
>
> Instead of this. why not just check skips and platforms in 
> xe_fault_inject_debugfs_register? What will happen if there are more 
> checks in the future.?
The checks are already in xe_fault_inject_debugfs_register.
The table fields (platforms, skip_on_vf) are just the per-entry
data that drives those checks in the loop. The data-driven approach
is precisely more scalable for "more checks in the future". Even we can 
add new platform BIT(XE_BATTLEMAGE) | BIT(XE_NEW_PLATFORM) as well.
>
>> +
>> +/**
>> + * xe_fault_inject - Check if a fault should be injected
>> + * @type: fault injection type to check
>> + *
>> + * Returns true if a fault should be injected for the given type.
>> + * Controlled via debugfs fault injection attributes.
>
> Return: true if fault injection is successful. false otherwise
> Also return should be the end statement.
>
> See Kernel-doc comments — The Linux Kernel documentation 
> <https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation>
>
Good catch!! Sure, will update.
>> + */
>> +bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    if (type >= XE_FAULT_MAX)
>> +        return false;
>> +
>> +    return should_fail(&xe_fault_inject_entry[type].attr, 1);
>> +}
>> +
>> +/**
>> + * xe_fault_inject_debugfs_register - Register fault injection 
>> debugfs entries
>> + * @xe: xe device instance
>> + * @root: debugfs root directory
>> + *
>> + * Creates debugfs fault injection attributes for all supported fault
>> + * injection types. Platform-specific entries are only registered on
>> + * matching platforms. Entries marked skip_on_vf are not registered for
>> + * SR-IOV VF devices.
>
> Function description should be brief. Do not mention everything the 
> function does
>
Sure!
>> + */
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>> +            continue;
>> +
>> +        if (xe_fault_inject_entry[i].platforms &&
>> +            !(xe_fault_inject_entry[i].platforms & 
>> BIT(xe->info.platform)))
>> +            continue;
>> +
>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>> +                      &xe_fault_inject_entry[i].attr);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>> new file mode 100644
>> index 000000000000..91883ffb5f4b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_H_
>> +#define _XE_FAULT_INJECT_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_fault_inject_types.h"
>> +
>> +struct xe_device;
>> +struct dentry;
>> +
>> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
>> +bool xe_fault_inject(enum xe_fault_type type);
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root);
>> +#else
>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline void xe_fault_inject_debugfs_register(struct xe_device 
>> *xe,
>> +                            struct dentry *root)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* _XE_FAULT_INJECT_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> new file mode 100644
>> index 000000000000..d5402b5a3fd6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_TYPES_H_
>> +#define _XE_FAULT_INJECT_TYPES_H_
>> +
>> +/**
>> + * enum xe_fault_type - Fault injection types
>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_type {
>> +    XE_FAULT_GT_RESET,
>> +    XE_FAULT_CSC_HW_ERROR,
>
> Inject_csc_error?
>
In review 2, we had it, find the details: 
https://patchwork.freedesktop.org/patch/717885/?series=164761&rev=2 for 
the change.

Thanks,

-/Mallesh

> Thanks
> Riana
>
>> +    XE_FAULT_MAX
>> +};
>> +
>> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..242683cd5906 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_execlist.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gsc.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 4150aa594f05..f8e3ca63aabb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5135e8e4093f..192e68e847a5 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -167,11 +165,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
