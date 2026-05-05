Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E120FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 13:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4510EAEE;
	Tue,  5 May 2026 13:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3zD/kOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F3A10E436
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777989058; x=1809525058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CrwFefed7xJAwbh0wlZOTIqH37IE15VIOy1dg1GHXGI=;
 b=j3zD/kOmpNtgT+P3L4v0qLtATBbpuudVEtpvvUx0TXar1mYL8yU9CRwl
 R+AiUWeyqwkBea1NEk09upJ9g2DH71YJdfwQ5XHdEWO+gDpamCmPP2iZV
 QVq10X427DMlZjlDFAIG8ib+/iztJaeaAkL25dON9xylEbHunq3WDMMDr
 B2dT0bpYzSoeHrEeNgBFJT7/vXymNKn0IqM/+znd1QQaXTUHpldzhZKAA
 s7j5IB8aOcKAuAvUQ8pt/KnRm6HdF9Uupyaxocgd4NH756EFfxw4rX8f9
 bWYJyCdq4QNwm+sdT/BMCpDN+lodZaOYRaW/C/Z5bJkN7ywpsNPGYvmqp Q==;
X-CSE-ConnectionGUID: sgDO2NeJT3i8baRAqD9ifg==
X-CSE-MsgGUID: bELb8TyIROWjl5cKkLsnmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78909612"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78909612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:50:57 -0700
X-CSE-ConnectionGUID: N1r18L4TSnqg4oVkvNOxuQ==
X-CSE-MsgGUID: tVdYXhCYQC2xWkNlYCf/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259165823"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:50:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:50:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 06:50:56 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9OBw+AhwLbzGXNUIlavQFBbaQ0gsjuP3rL1HAvNtiR9zwORnJyhmDc16wBGToQtISJwR6u/AZXQEoRaWiAMIPBzb2+3ABtk6zFZ33sVsQ+/h2CVWwnwJbydhkzxs1G4ZYGWk3rPD/t1nzdWaOsQnAbs73/fuyhnV+zNbMSLIXUQl+xPiFFgsQdZNoI+cxVNak4xPiOPzhP1vE53+hBsGiUpmdJED3HLluDtMfN4+Udn+C8aSfqQpjC10O1uaoc+tSUdhYQbOyBiC/W+sbzRLWfhgspoNQkB5E3zlLdkPGTUzYQwhbVMshiL6PQZJqKJ5GebuXffW3bEl9Wzi+AxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+zWW4vYLoshQm9KPgv4P5qMw4vPGGc9lhvS/vsbaXU=;
 b=JWwzEGBklXZKDYGcrheYcEmQnLFLRW3IcgfiFrs0tFYLzLtsEK8gubaN6pcKKvB2Ic2JeavfjDGRqndt132E/sLTnUNa1tGyM7SPpETGcyhq17S0fpX6rLK45QmFQtCG0Ju286uhgCz/z1rS2xWDHpyfe4yQYFyQSTssB9bDaqGRNYv3Jp2JTklAZo+2RQCTDw+5guW8EEg0Zr03w7L4aD13BWozPkQY3TBvZ12xU2G7BdND1QX/RHFhVnojCO3CJ01bud/DouX8JpaEqEF//6F2+pnnSadpaoyS1lfqRhaLj4pww151zzNWJc3sKzRC7e9kHawQSi/T+ytwtm1ivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Tue, 5 May 2026 13:50:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:50:53 +0000
Message-ID: <3fb3fec8-e44b-49fc-be8f-649bc6bec5d3@intel.com>
Date: Tue, 5 May 2026 19:20:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] drm/xe/xe_ras: Query errors from system
 controller on probe
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Anoop Vijay
 <anoop.c.vijay@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-27-riana.tauro@intel.com>
 <afCd_v3fPXpyufAD@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <afCd_v3fPXpyufAD@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 6731d586-4e24-4220-f041-08deaaad533b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Ug79ZBMLWqnLz94V9TFi3QI3QC1+0hlzXyNvJOxXLY4y4P30iUxs1BkXWUamxle0kWDBejzAak+nKBuNGKlZxRkj9Jd3BWAXNOEpNy+zEqZ2ojylm9tmoYixeHLO8Mb9YNvSV6SJEj9kbkAIaPBJvIx/npyZjZqQiXZVhSV0xl6oZhQR9UJ/ZOeLK5Mgnm72FB3kaZWUI6Lsf4/j2wjvWPJIuNyoA9tbJYSUuu7Ay7UgaIbDX5rsm+HtgTXXm40a7vMsM2qZroy7SDYCjGT/5x9z5Mi3VjcZPlSyuebnvp6ZBYj1gQoaYx0AKA+aOMT2IZ27jcTuLFvLDgKxrxLOFkraMMRYeETsrbXB1nsUSDI04V+vZsz79rFvR/jBnfUvlujOu8zEwj53jb9F+woVHgEQK91FhB0QJft/eWW/XJYeVw6+rrI1u1Z4LN30FFQFddMJMIwFQhUBQBDpeogaGEbqo4UbvT8khe1cu13axPayRz3u2EX5VwmLck+qMiIKmwMx2srjVhY99UGTDaixRPCTo/Yqdbe2hlkFa3W41IaYdgo5JW0RCSnfulizwM+37iWjQt8PdR9lmbTPdVbuRvKz1TRNifI0R4iCprvDsPytVFNTd3DbTrzNjhLW4CIjxLIlGM4t8gcoB5wfkWZzMjZ1LfQncKACRSqxwpA2FQSae05FVOD5lqdw6vJpjeXb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVnTUxtU29nRVVqa2RHOEtHRHg3dmJNK0VkZEpObkF0b0RVYlRuUmRtWDNP?=
 =?utf-8?B?VlRJQmpsckRrTGZDQ2RCbHAzbWF1MGFYOTMvYzd6TTNDWkMzUHcwMUVkdldj?=
 =?utf-8?B?cFQyNHB3TTVWMXovd0VKWE4zVG5MVlAxd1c2MERyd2o5MURhTVV4WEVMczEy?=
 =?utf-8?B?ZFhHa2FCcWtObXJTZUFpOWFwbjlwU0pwY3ExMElrcmppNDdQeTdtcnJWTVgw?=
 =?utf-8?B?dEpyYUtXV3hidXhvMTNlMGF6OTBpVmZtVWdaMlVNdWg3UFNEOXdoK2Q5enlN?=
 =?utf-8?B?YkwxL05NVThXR3JtdEJjZDUwR3A0MTFTYlA1UG94UFJRTDlNM25UN2JiaFF2?=
 =?utf-8?B?VkhDVGZzZ2FlamtUSVJ4NVdnVitZMm9lOHhQNEh0WGhzTldUZG9zL2pYKzhs?=
 =?utf-8?B?SFQyUkFUbzJKNUFWSU9vV0NKYWF3QW1PZjhJbVpTUkR3OUpuUVhYNU1UYklP?=
 =?utf-8?B?NDROdUNPcVgyVm1Oak9GbGZRdmFWdHYrRDg0ZHNmbGU3RXlxWEVkQTBzWnFh?=
 =?utf-8?B?eTJ1cm5JSERvbnU5NGd6OVJqWnA0aU95RW9vUXl3K1dacW5TSy9ROVVVMXpR?=
 =?utf-8?B?ZXVBd09OaCtqOUhtMFZwdW04YnhkN2syZEh6YW1pUTZwaWkwZVU3eUFocjNj?=
 =?utf-8?B?RDFxUnJtNFFQTGFVNmdkdTk2T3ZBd1lkekloUUFzaXRDK3BNMU95alFSQTF5?=
 =?utf-8?B?MVEzT1FLb0NIMFpCTUV0N2ZacUYrWFZRVWd1VEdOSTNCbmlyZ2hHckhpMTRz?=
 =?utf-8?B?ZS9mNmlaWlZCdGdIYzVpQ3JvNlVwTGYxd2YyMC93allZL1FGSzg3K2FNa0hC?=
 =?utf-8?B?NUtSK1NHK1FrRW9ud1NBNDhRWTlrWU93SURkc3RxQkl4WkgybFRFREpBbkVs?=
 =?utf-8?B?TGVscTVhaWZDcXdxNUc3ZTNHZXB5VzhBTW9VcHJuN0g0TWZpeE5vYjZ1VVJ1?=
 =?utf-8?B?aWlaOUdXOVZsZnJKU1VxTVRsczlqNGtubGNQalVTNmJ0a2hGM3NSdW9xNG1N?=
 =?utf-8?B?eDBEb1k5V2loYkRLcmhoYjIrbXFsY0ZLUjlYbmhybnMvZXVicE9VU0VlQVQv?=
 =?utf-8?B?K29VWjB0WmZ1Z2h2c3RiVWlhM1Z5WDVHWlgvdzhwRVpLZmNWZGl5THFtTURB?=
 =?utf-8?B?ejlIdzFPQXlBLy8wK1VhUzM2YmsramNRRmRQTHBTaURjcW5iR2c0RmtwdXpB?=
 =?utf-8?B?SWQ1Mkk4QzZwTWNkVGwvNCtKUkhxWjJZSWMwMnVVUElkYmZkTXlWd1hCME5o?=
 =?utf-8?B?Z1cyczNNQVBORloyUlQ5aG94ZGlrbEVLV0gxYVhoZWVzclp3cC9QaEVnd0lo?=
 =?utf-8?B?ZlUzcWlqV09rdmJWd2oySXF1STFPQ1JEWGJmV3ZqckZpTW16S0JJYW5URC9Q?=
 =?utf-8?B?dTZkRmIzSC83UE1GY3dWWlB4YWhOaFpCQmUrdk9KMkJ1S2REeUFxRXhQV2Nj?=
 =?utf-8?B?WUNIamRBSzVXY3FSTmRrYlRXaVFzRGFMOUVTL2tWR01FcVVtcmY0RWIraldF?=
 =?utf-8?B?QTB6aEllS0did2ozbmZkclFFeGRuQ25NU1duNlUxa0pIaWQ1TW9VYXl4SVJD?=
 =?utf-8?B?SVBnanVNV2djWHc3d3htUEJLRjlsLzRoWGJJL2NKN2t1U1FqbWdOaC94S3dZ?=
 =?utf-8?B?RnNodkU5OTRwV09NbjFaNWxwNVlFL201UHUzTHNSNjRMSktmL1lQWktpUnRk?=
 =?utf-8?B?WlJvVFJkcGt2QTVnNDUxNy9DSWxSekpsZVZkRGRvalNxdC9mOGVvTlhhZjJM?=
 =?utf-8?B?Z2hwajFQT3J0RkpYU294U0YvdW44aDlpMnI2UEZlM2V6VFJyWUlwSnZqMDFa?=
 =?utf-8?B?d2kvdjF1Ym5EaWNlWmhaaGRtams0em84WHRhUW1XeFBxZlI1UHBhSTVYTjFx?=
 =?utf-8?B?eTcvSzRFSVpOZEFCeVBNck9nSUk5WEh4dGw0cDhNcWlNUkZwQlFyc0N3R0xM?=
 =?utf-8?B?K2xacW40ZFo3WDJ6MXV3clN2RjlCcEw5bkxEbm1VTlJqN2c1cWpkRlJYclU2?=
 =?utf-8?B?NmxhZFNhNlBlZ1hyczFQQjcrQWh4SlhQR0JnaHhudGFQWWQvZGowVzNQOThF?=
 =?utf-8?B?dklOZVlpb0VUMXQrYzZWcVJFQWtRWXBlLzhpZ0hSRUdKSCs4RnNXS1QvSUd6?=
 =?utf-8?B?SnVieWFTcVc5TnA3QjZ6ZjJyTGdUT3NPTjZXd1o5UVJ5KzNZRW1FNVNWQkpZ?=
 =?utf-8?B?a0o3eGh1T0k3ZEdBM0xVWW5QeUsrL0VVL01oOUZWOFdyQmxJc3RrRkJCQjlv?=
 =?utf-8?B?LzhXTnJRSDNaQk1nRldaNXFJK3diUVRCVENJV2xTUWNHNFJHU0NTbnAxY3RI?=
 =?utf-8?B?ckNXc25HYjZLQlpzakllYy92TFEwcmlOZUtGN2VaK2pReExIK2xRdz09?=
X-Exchange-RoutingPolicyChecked: ZRT79nPN9//fAblLvOWfjVGpLxB6/gKmu7iPQflxoUBsDzUZAlWLafvHsGESWWH/M6ksUnwNbBs+DaWkNBG1R7NzcCmoO85GWnASD7fx7q8jEE1x766wpPnoMaXdpYkeN+XBiBvvVutmAkzpXKEJ9y1i1sUXeYawmLMB51XlCsLmBR4XeRV72tXjTxdAw6d1opDi9KOJ0iehPtVWp+8lWSSgpfqtBGvzbe0tTFLlYeeGZRECltJAhwPZM/GA6sadlPilzufl1GkjY0n8fp9o5nqoqAdGjcYCWsfA+08YRhivOgM/U3lMt35/fOyDMMyGeibrSXVXbwUA01j7cqvdog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6731d586-4e24-4220-f041-08deaaad533b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:50:53.8196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd26Bk1pt3n2YueJQ1JA4UM5qxzpZkRzn7WCFR+SRiNPrPPHEH0+mLi8CPChyUbIEpb/0GuNqf80e1IkHlUIog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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


On 4/28/2026 5:16 PM, Raag Jadav wrote:
> On Fri, Apr 17, 2026 at 02:28:24PM +0530, Riana Tauro wrote:
>> Reorder soc remapper and system controller initialization to
>> early probe to allow querying errors on module load.
> ...
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 42ec27c05e9a..7598eeb796f0 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -479,4 +479,11 @@ void xe_ras_init(struct xe_device *xe)
>>   	/* Get any pages that need to be offlined from firmware and reserve them */
>>   	get_offlined_list(xe);
>>   	get_queued_pages(xe);
> I know it's yet to be merged but should we also add get_pending_event()?

We could add that.

>
>> +	/*
>> +	 * On init, process and log any errors detected by firmware before driver init.
>> +	 * Critical errors are handled in xe_pcode_probe_early(), which enters survivability mode
>> +	 * if required.
>> +	 */
>> +	xe_ras_process_errors(xe);
> What about wedging? Should we continue driver load after declaring wedged?

Wedging is only on CSC and Punit errors. Such errors will be caught 
during boot survivability and appropriate
action will be taken. The rest of the errors require only logging.

Thanks
Riana

>
> Raag
>
>>   }
>> -- 
>> 2.47.1
>>
