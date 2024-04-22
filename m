Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E4C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 18:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725210F594;
	Mon, 22 Apr 2024 18:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLvOCcSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932A210F556
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713809453; x=1745345453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iN/zEyJi/aatLKYMirEoXlQy9FseALm26am7kAdtJD8=;
 b=RLvOCcSePfrBCEsWDvoZ48nh9dH93IMsA7jh4w9D0BTgALmkbKmxFqkP
 hs+hqXlXW438RjQtGskQqITchymQzTQ7ZHlMy89yGZcy9WdJaf9yJs/j/
 GjQsxUFyX/wAlRo4pgKCnrOdTRNTHEChn+U8ZlSm14Uk3ZiZhCH8O/Kr3
 ed/acfTphfj+IrrfBR31WpMkEO50XhXVK7+30Wv3yGwSYvUjSe2u53waR
 eBoqCnPd0OlkQLYPLIiH5/j03DRUvPLcBFn1jDGtt1HYpZ/HwK2ZMLRp4
 bPwn6kvKfnmhT8HyvluG3IMR4ah939A2bwhKa1J6A3SN07n9/d5dA971e Q==;
X-CSE-ConnectionGUID: WG+Z8ESzTWyJ7lEgFQ2a0w==
X-CSE-MsgGUID: YkY5qGNFSkqe4Sn1xCMmng==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26878326"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="26878326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 11:10:51 -0700
X-CSE-ConnectionGUID: N+m9xDPwR9qKq3C9xmJIPA==
X-CSE-MsgGUID: Thx0m9X5RnW7GWzMU/+P9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24073539"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 11:10:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 11:10:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 11:10:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 11:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grDV6cutDQacrh8u3AbJC0qV1UcPWgQ6mtS0DU6xOtHAd/u3UVpITQNu0O0bEVY1zWbWxOJP8x/ITpqdHTXz0QeL/InC1ODyRit2cV7GCa7Tuhr+COI0Ku0uieJd3gOg8GQV0OcomDy3zLkDN75Nb3jQdpDbYxD/JxwWAF26OpG4D0hIKqohPbEme5+j9cgGcGbsefDPs4TrovekPh4VXANdkHgqwc+U+pCNNSdkNbQJP2Og4uNOX7HU1mhCvM2bd8lTJpefhHvA1fhvs7BWTnSB3nU6B3gw9518VHKyDoJ+H/KGcK3c/gkm9H4/a1r4jqptwz1iwu/9S58C5ki5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7AE+sU9xT0FAYKAARZeVt4rpYf/zHEjsQiXyVSGe8=;
 b=QKFLf3At/b6CzSn2bzvP2SHWTyMHYLVujbmtWWWO5dhWS+PqTWPGNeVqnH0wlDTE+EAh3Rap6/v+rGTPHmyvUZ2G0JrdTDUYf/lF6EO1JpoHiRCJRjcFS1J6UlmvK/sUt7ay7aiusB8HdSWdcdXUnZe39YW1yKt3kiOo0rEx98Uy3kUImxLi4cbJZb7ySP0KV06d8bc9GeohY+QdHC2S4jg9UtpT7xAvKqWrMJpmxtoMLj0gAGntO7Lf/T1eFIQelOuW+207W4pHY6DVMpJ3KhTfAP68mibQOp44dy4IfaG5f7D6sVzZt7Sz5WjKBxfieGwji7XYLU13v50Sm2asVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 18:10:45 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%6]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 18:10:45 +0000
Message-ID: <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
Date: Mon, 22 Apr 2024 11:10:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|DM4PR11MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: dd198da5-1b0f-4636-f2f0-08dc62f787ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VE0rYmxEZzlsKzRXQk04MlBydnBSZDNzSk1XRWZuZzl4bWNiR20rS1FtWGdW?=
 =?utf-8?B?bjhrTjB3TDRKeXE2dGF5Q0M3NUI0SEs1YnVPTDJDcFVRWFRieEowVldOTzBN?=
 =?utf-8?B?WjBadHJqazQ5R3NwWnc1cmNlTmRRWlpnampJZjdFRE5KMlo2ZGg2bjJQUUF1?=
 =?utf-8?B?UUlISEh0RlVSdE1IMERiWTBWa0I3b1JCaXBLdUtyNExIYVN5eHpkNnFoYTFn?=
 =?utf-8?B?M2FpbWVRYm9XWjdJYzlhR2ZNRG1sSEFLTzREdUlaTjgxWmJ3b1ZlR0FwdTdi?=
 =?utf-8?B?aElMVUxJa3ZjV0lSN25pdmJlLzFNRlIvSVowMS9aRkQwMjVXd1BMNXYyVE1M?=
 =?utf-8?B?OFdMTkkybVl0ckQvNmZwNFN6aFI1ZzJ1QVRUVWVSNDUraTZNSExaZFdRdU9E?=
 =?utf-8?B?cDVYNStySGdhSklTcVRhdDVwVTdScldGWnhReUp6QzdYZDRiRDZSclUvUURL?=
 =?utf-8?B?MFFqS0NwMmZkQ052a01ua1Rxd3RtVHMva1F2d2RxMHhWWGpnL3g5ZkwvcTNH?=
 =?utf-8?B?cENwdkc2VTREOFVDRkRYb1Q2TkMvZzhGMXkyWmh1UWFpNjFjaDV4eVlkcFR5?=
 =?utf-8?B?R2VZeERiUzVBM2ZZTk5NV2VhUlVNNmF0YXdQWmJOVmc5b25WSjVVWFZWQnVL?=
 =?utf-8?B?dkppVTlMS2hTby8rQjNwK3RsME1nNm1vTUFBZEttTE8rZzlXU3pXZlMybWVL?=
 =?utf-8?B?aUJoYndta05XWE9US0ViSzdlQ1FDNzVsU3dNdjhuSzRDYXZrTFVEM3pqRWlZ?=
 =?utf-8?B?Z0ZCaHIxOW1wRmJLTGlndGE1N1kwcjNRVmczTTVHa3ZZbmt3ZWV4MkpCZVQz?=
 =?utf-8?B?bU1EMytRMXhFRmp0UEZMNS9PQ3ZXQkZQL2YzV0pyaEdMc3dVTDVXVFYzM0t3?=
 =?utf-8?B?YUJCS1BIN0l5c0YySWd1c2FKZTdWWm1hYVpib25aaGYzNGZDaVpia1hVZWpX?=
 =?utf-8?B?U1A5bXI5dHRSOFdNc0swbENpSWdEOXd1RTdYVW8wOVY3VFNIbFkyWVhGQ3dj?=
 =?utf-8?B?ckdlbTFNTC9xMTFJMXMxRmF5em5YMHAwSDNYZU4vOWFDYW9ha2J3Qkw1Q1F4?=
 =?utf-8?B?UWdzZUpTeW5FY09VZ2x6SVhqbjRuTWlBNXAwUkE3eFFxTHh6OThxMzZ2cEVQ?=
 =?utf-8?B?UkxISEkyL2xSajJsVXl3eXhZSThhd0pwRWVpMXA3WnlSVE1WbWExcDQzclI5?=
 =?utf-8?B?R3hDeVBpQ3FBdU1EaHh0dVFONS9XUXBhNmdHT2hoeUpwK3Y4bm8zdU0vaTJZ?=
 =?utf-8?B?OXVaUUx1aTJmR2NRZmJpT0lzdFF2eklKaHdSTnNGMlo1RElkUEdLZUZZeVRN?=
 =?utf-8?B?OXk0S2JNZW5QNXUxdGtrbDBYY21EOWtjbEZ2RUd1ckk4aGlWS08wV2JiME1r?=
 =?utf-8?B?akVDMnF4czJMdy9qNzNqNFpzcDVrVWlZKzVtb2dzWjBhT002endpUVVvMyt1?=
 =?utf-8?B?RlFwWndjcm1idE5xTnIzUHg2Z0pvczRpS2RsZkE3WWRWWEU5MzBndU1SL0pD?=
 =?utf-8?B?NXQyaERPZURpaENaNys1MEQ4ckI0cEZtMXVIU01EU0tySFBld3JlYytKa3F3?=
 =?utf-8?B?SG5MNmw5UzlPd2x1NHIreVhXVFFQZmJPNlBpSGF4T3h0VWFjR1ByWXJlb0hL?=
 =?utf-8?B?NHlIeEpjNURTSmRVdVdxdUNrUzhRRFV6d0Y0b015ZHZhLzBMWmIxa1RpWVhF?=
 =?utf-8?B?M3NUbnVub0N3dCt3Y0k5V1lKbDIzbFNXeTgwS01Vajh3cGtwR1JQaDd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkQzNEFSa0FTUzFjcFgyUTFxZzNZcDk2dmVKK3NPVWxNaHd3dTZQYmdobFRh?=
 =?utf-8?B?S0I2L1NFL1BENzI1RW9HeURQb0hCdlJzZDFtRG5EaG1pK1lIVUhpMVNsZ1Qy?=
 =?utf-8?B?eDRaS3ZGcXErRVJ4U1hwMStzQnI0czl2Vk0ybStuZkUyeUJLS215SGJyYklL?=
 =?utf-8?B?VTN4MlFpN2w5aDM4bTBMOTc0Q2VGUlZuN1FoeldWN1RqaWFiZW0zMEc5TmdQ?=
 =?utf-8?B?cjAzNWV5eHhSems4YU9LdFVXbk84dHl5TSthd0g4RkxjbjlKeDBDaExPTjJy?=
 =?utf-8?B?ZkFSWTJMYk1YSWJ4cFN6NDM3UHdpTUd2Sk5qN3RWaE9WUEN3SlVncmprYTVU?=
 =?utf-8?B?bFoxVnYxZStqcFNhOWVqNlh4OHIzZ1I5UmNpWEZjd1NGdGIvUmszVmFnb1Jw?=
 =?utf-8?B?YncrWGRyMzNpSTZJZG1RV1ZkaUU3NUJjUkhCYnM2Q1VMcVc1eDVRYmQ3TmZr?=
 =?utf-8?B?M1ZRWE5VRE1EeUtobjNOYjNyUDFPMEI0RktiOUxvWWc5SThBU0xrWjhwZVZT?=
 =?utf-8?B?Y1ZTektBTW9kS2k4djIwSnM5dkc0VjRVa2hlZ3Rycjg5MW1NeG55NjRHaHg2?=
 =?utf-8?B?dmZUSjJkcElJdTJ4TTNrTmZFSGJPYnVRS2h6enpyemNuYUpNNWk5SUVBT0Rz?=
 =?utf-8?B?Q1p5UXBkcWdQZWdBL3h1K3BJdktPY0pyOFJLMFEwMGF1bGxCb2I3YXYrM05k?=
 =?utf-8?B?eDBzYUQ1STZxdDIrOUE3NHFmKzYvTXo2bDFydFA0Y3pnRXRzdXdIaU1KZXYw?=
 =?utf-8?B?M01NdTlGdXpHbTdpRDRwaVorTEw3Rlh6VGZuczI2R05VaDUybUtYNnBJSXZI?=
 =?utf-8?B?K1dJK2pSbm4rTThIS2pYTW8wbGxBRnRPVHA2Q3BhTm95UmtKY2l3VzJZbk85?=
 =?utf-8?B?cm9XSjZqTWVBNk13YzZoNmdCWFp3RlBUQzlNKzdDYk12RnBZVkppOSs2ckV2?=
 =?utf-8?B?VWpXYXVEL1plenNXRVV1M2ljWHZlZmh6TXlpM0JhUHNZZE1JWHluVTNuZ2lx?=
 =?utf-8?B?R0xSTUVmdTNGWUhJeGJwMGlSWHJzclNUK2VJUkdDcGVtLytzcHA1TSs2cjF1?=
 =?utf-8?B?aWJhSndkQ29TT0JZSk9Lc1RFaHJpNExlQUtuNWVPY1pKQjhwUklCWFp2bTRl?=
 =?utf-8?B?MzRha2JiMHNXdk1iaU9hZjFxN3NyWFJTS29QQWFJVldSZTlJbGd1WGpJbTJr?=
 =?utf-8?B?N1RTdGE4Z0pGdVI5aDdaQ08vOTZJc3NTa1VjMHRWbzVJTjJXSHUwM2FXWGdV?=
 =?utf-8?B?M3owMVhsRFBscmVtZTBSdnVYVmdYVUZPODZ2RytLQmFEWHdUWExzZ2gvODMy?=
 =?utf-8?B?aEdSUG5jeXR6Q1JxZ2g0ME82Y1NYUnM0eUZBU3VEZWM2NW9BVk8rYXE4NmZD?=
 =?utf-8?B?WThFeHROckFYajR5KzdVOGpJbnJoUldHdlI4SnNML3lNZ1dtREhsSHhxdGZ3?=
 =?utf-8?B?NVFQeC80V1NpNHZXZHA3RSs0RVlKSTdtbVVrNmpWU1dxc01OL2M2ZkpVZm1Z?=
 =?utf-8?B?clpMWDBlR1FVQXREOTVIcWhNMzd3TlBYQTdhK2RTaEhnSTJWVG9JQy9QaDlC?=
 =?utf-8?B?eCsxb3VPMkhNeG12aHpkZzU1VG03d0lvaDZFejFaSDNHY21oaGFGRlFlU1pn?=
 =?utf-8?B?R0NLM2dDcGhhTlFaem9oN2U1NCtCOWtkUWtySXY2aHFxS0ZOTDRrR0wrcW5v?=
 =?utf-8?B?T2hIbVR4WXE0M0JZOXNScTJKdzFpS2JPblNZa2d4dGlXdmcybEtFWDlObSti?=
 =?utf-8?B?Y3lOUys1YzYrUzUwY0FxeWpwenZ6L2RoNWRmZ20zZ21QSm5GcEM0Q21IWG5V?=
 =?utf-8?B?Z1FjS1BJQWQweXpYY1BId2loZlBwTXZDNXZrV3cwUE9DWkZuWThlSVBsa1RP?=
 =?utf-8?B?U3hRbmgvdHZBeEZ0Yncwd2QvaGdWYkFSNmdja2M3VUs3bFpaSTRrMWhVcFhC?=
 =?utf-8?B?L29lekZ2c1RGNDNCcUl3UnlnT3hhVlhNN2pQUHMxMmNhQ0hyN3JBaVd2L0ox?=
 =?utf-8?B?VTFsYkdzVExNWnRHcCt3eklBL3JqSzNrRU5PaWtYcFFONXdzVEEzYTBBa1ZI?=
 =?utf-8?B?MitMeTRWNEZwVFBtbGpadjBpWkFRMzY3a0hOdTNvdWswbFlzUFZPMnV5QUdL?=
 =?utf-8?B?RTBFeWhWRW1rQ2t0TGZnOUxHK2tDeWR6R2lSWUxXK08xSzhPMWpzRUxUU1hh?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd198da5-1b0f-4636-f2f0-08dc62f787ce
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 18:10:45.6149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHfCqllIwsZhCPZcJhqDgSOy4qUYrcQ9W/hVuGktclooETHlNBnyO7X8fHdgT7zHamk43KNOPmfBJ4+t7bmuIintMqRqq6dsyKFyWix2V8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
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


On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
> On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load as well as after driver unload. Freq limits
>> are restored after driver load completes, so perf will not be
>> affected during normal operations.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device.c |  6 +++++
>> drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>> drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>> 4 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index d85a2ba0a057..e29c152a6c4e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -30,6 +30,7 @@
>> #include "xe_gsc_proxy.h"
>> #include "xe_gt.h"
>> #include "xe_gt_mcr.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_hwmon.h"
>> #include "xe_irq.h"
>> #include "xe_memirq.h"
>> @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>> {
>>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 
>> 3s wait */
>>     struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>     int ret;
>>
>>     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>> @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>         return;
>>     }
>>
>> +    /* Set requested freq to mert_freq_cap before FLR */
>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>> pc->rpe_freq));
>> +
>>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>
>>     /*
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 60202b903687..556e73fca813 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -19,6 +19,7 @@
>> #include "xe_gt.h"
>> #include "xe_gt_mcr.h"
>> #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_huc.h"
>> #include "xe_map.h"
>> #include "xe_mmio.h"
>> @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>     struct xe_gt *gt = gsc_to_gt(gsc);
>>     struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>     u32 actions;
>>     int ret;
>>
>> @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>     if (actions & GSC_ACTION_SW_PROXY)
>>         xe_gsc_proxy_request_handler(gsc);
>>
>> +    /* Revert the min/max freq limits as we're done with GSC/driver 
>> load */
>> +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>> +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>> +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>> +    }
>> +
>> out:
>>     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>     xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 521ae24f2314..7f82b6c2ad3c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -40,6 +40,8 @@
>> #define GT_FREQUENCY_MULTIPLIER    50
>> #define GT_FREQUENCY_SCALER    3
>>
>> +#define LNL_MERT_FREQ_CAP    800
>> +
>> /**
>>  * DOC: GuC Power Conservation (PC)
>>  *
>> @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct 
>> xe_guc_pc *pc, bool enable)
>>     xe_mmio_write32(gt, RP_CONTROL, state);
>> }
>>
>> -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> {
>>     struct xe_gt *gt = pc_to_gt(pc);
>>     u32 rpnswreq;
>> @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct 
>> xe_guc_pc *pc)
>>         tgl_init_fused_rp_values(pc);
>> }
>>
>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>> +{
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>
> that's what xe_wa_oob.rules is for. Why are you adding it as a separate
> function that won't allow debugfs/.../workarounds to match reality?

The workarounds are not initialized at this point, this is early in the 
driver load process.

Vinay.

>
> Lucas De Marchi
>
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>> +        return LNL_MERT_FREQ_CAP;
>> +    else
>> +        return 0;
>> +}
>> +
>> /**
>>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>  * frequency to allow faster GuC load times
>> @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>
>>     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>     pc_init_fused_rp_values(pc);
>> -    pc_set_cur_freq(pc, pc->rp0_freq);
>> +
>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>> pc->rp0_freq));
>> +    else
>> +        pc_set_cur_freq(pc, pc->rp0_freq);
>> }
>>
>> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct 
>> xe_guc_pc *pc)
>>     if (pc_get_min_freq(pc) > pc->rp0_freq)
>>         ret = pc_set_min_freq(pc, pc->rp0_freq);
>>
>> +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>> +        /*
>> +         * Setting min to RPn disables use of efficient freq
>> +         * which could otherwise interfere with this WA for media GT.
>> +         * We will also bind max to MERT_FREQ_CAP until driver loads.
>> +         */
>> +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>> +        if (!ret)
>> +            ret = pc_set_max_freq(pc, min(pc->rp0_freq, 
>> xe_guc_pc_mert_freq_cap(pc)));
>> +    }
>> +
>> out:
>>     return ret;
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index d3680d89490e..25fe693c7ee3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct 
>> xe_guc_pc *pc);
>> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>> #endif /* _XE_GUC_PC_H_ */
>> -- 
>> 2.38.1
>>
