Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EF0C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 15:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EB210FAD6;
	Wed, 31 Jan 2024 15:48:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86D10FAD6
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 15:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706716089; x=1738252089;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vosemGct21dz8/HSITNe4qBRI1sOwfpaQ0KrUYQ6HnY=;
 b=dir0k35msIxs9oqMIDHjNKrdFjTyfcnAJDWEWtuFlSr9HrQMgfoWimzi
 MNN/XRN3KwZg10kolhDl9FXWA1ATBEx3r3AjUjTGV315pX4WK1j4hXurC
 Pnn3i7l/fGqOFTJFclX3Bri2UMcJBWrGVPa9Pi4VthitndffJzvLZogA8
 xqs3o9wj9dWU3UZaziDN2NBFrt49A6/tMk9USafmQ/dIr0Ww18zZHk62q
 /gqkEN/LbENXJAjvLT4ZCPeQmCITKvMkr2OtwYhZELj0xgO6Vhfh2pTss
 Ns5dsvTQC7dqHXtBNNuC1BXhoiQUNuBCOYg0YSx4lWf+1zQVfG+yie61b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3485669"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3485669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 07:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4130918"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 07:47:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 07:47:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 07:47:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 07:47:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 07:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb809h4SibO23SzDfeZIpfDshTFxToYkIN6jqDt7ey+ZMsPylCUPvm19F+QYmeGqki/kqoUH5hWdKUBn+j9WqqfwP9f6BdxPjle2Z+02+E0Cqs3Cjyy3dSUJylp22H5OA4vI/zfZaSgNoOlj6bEUm8pAiv9P9aAFkiH8iXwhYKp8aWa4QrJ0VM9QBlo9tU7qFWwhKB2u5ExFx/uPmBg5LFCOA6YZzq0vWWZgOhiazpMURUvfjsQyY0VOVe481mm4ttVWOA5IOC8l8fsdAXbM1Cq+6Z6y8Kj1RpJnLrUtdYcj0k9MEIW83WS2jFNb39/LX/eHEBOVkk2dwiHCJtj3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYbLKDVCmXNl2HLaLAXmRQ3hOQoOBFMgg9w0cfqkrPs=;
 b=Xg63M2k8VkxcuWFNjpWY+DG/w/DU0xqpwMQUa6YGyYhywKf7zv8DKZEeZRD6/Olkq9jP5ANJ24hvwVCI0QT+5X6DUX5XBxjY5qF7wr0U0wGvmLqzeBPekmgHRWGBSs7D3CuGs5VS1ihQKwK4o4QaeGACmHCFEDmiL1WDUMWsGultC3hrH4VSbJQ5nkvOv7iJkk3jTWT+Cl1F7FDRq4ZVcjtjqwqr63CJsfp/k7FAignI1tsqdPcsp4AB2XAeQqa2u47npginbYOnq35kq9AkomWAWvfVp6ifA4FLZiSF11gid6EIAoP2UTvpUqGoE45dElJ2UNazdS9F5uRm5ElKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 15:47:35 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 15:47:35 +0000
Message-ID: <3bb9f8ee-b797-4dde-b228-7590bd3dd0ad@intel.com>
Date: Wed, 31 Jan 2024 10:47:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe: Expose number of dss per group and helpers
To: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240130212208.235448-1-zhanjun.dong@intel.com>
 <20240130212208.235448-2-zhanjun.dong@intel.com>
 <20240131000941.GA8089@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240131000941.GA8089@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 1610b9a1-a1ab-4127-a20d-08dc2273f1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWNHjFqbj7scfki0kFZ2o53xmV9uZCOYUUH6i9m0CLVaKvKhvby+d8hhRLjMOmSdjzQE3x4ew3/+eWSqtf1dtZhx2MFE2QCWFO6qcExOn4pI6Wukpn9WcS7HdtSNG5Li1yzz1EGvYMZ0fNn541b6r/0PzhnXY9vd7nTE9zsHFULKzEXA3Ja0Mtr5PDS+GwxsfwZfyQGUcb7ZjBrI8cKbI4QTUPY7EPm1OaUbb4KK5t7iwRfhz2lUAnZLkjDlPRixI48J8R5vl67d2U8v7viBf44weJK0TA6StZ9rxNJUJSC7D49ex1hS9e27aKdtfIW+SeJAjIH+zRwE8NB0rkG2xYxKoaCYU83/rrmVVpGBR48PZfg3QoCI2zZTBiIhaJN6DriCT9DTJk8CtdZ7Ur6rYBjIdIKKsUHBZ1cqpa7APOZWTRY008HX7IhILsVZz1VX9mIY9ESdlPkShk8y7P0XMBph9O1leGdgR1o1KL68cYjUWALOymt/HT+noL1uk0XC/TaCqXHkIyzWxgPvvceCmdR3Mo+jrRjs45RFfowEDyzAppGBw0gKMBksi5IwM565ufMUwThpiJawn5mKAsRdihWHoTqTcdFxFafFErJFBmJgvdQhwTvN6CbEN/lceslpUqKn36xuFMzKziEMmJS+cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(8936002)(8676002)(66899024)(4326008)(2906002)(31696002)(110136005)(5660300002)(86362001)(66556008)(66476007)(66946007)(6636002)(36756003)(6486002)(38100700002)(82960400001)(53546011)(6666004)(6512007)(6506007)(478600001)(83380400001)(2616005)(26005)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkx4aFBaSDlHY2NRcGJFRW53ZGlBWHdjbHg0T2JWdVBzZ2ZUenhvWk9BSlAv?=
 =?utf-8?B?dlpUeWRLV0VyUVdFZk5wK2IybnFIZTNucUg3bVJjbFVJYnNEaHQrdXoxbzBD?=
 =?utf-8?B?YVZ2R1ZRcWVxd2F4cUNjNHhtdW55YzBrNEdodHdWU0NRMG5TakI1RVZGdDB3?=
 =?utf-8?B?WkdLempWQ3dFVkJVRHZtamtVQzdONU54aXBXU1p4OHpVSzVBK1dIOG1acGFn?=
 =?utf-8?B?MUs5TlI2OU8yWTErbExzemxZLzRibHZTMXdkcm9Pa1diV3hraGdUT0pUcWdR?=
 =?utf-8?B?VlpnY21lSTVaS1pJaTdVWWNrVEFSaDVZamY4a0UwRmxJSVFHakdXZ1hJd3E1?=
 =?utf-8?B?R2pKMlJKa2Nwd2tuYlpETUJRQ2h6c1ZlbkN6Q3RTVGJ6ZElKdWxtUjA5QUtE?=
 =?utf-8?B?T1lkYVV0dmQ3cVQvNHFPbWJCVUp2Z2NOd2RDVEhLSU1IZURSQTVDaDQ2c3NI?=
 =?utf-8?B?dWJyOG1wTmxaYlNmT3UzcElRWitJOVl5VFowQ0x1ZlNBMXpLVGVGUVZNSlJP?=
 =?utf-8?B?eVQraGhPRXprZEt6Q3hmcy9BWU5rMENjeEYvU2xKdmRHV0k0aXVMR2cwVFFu?=
 =?utf-8?B?YlF3NEVVSG1wcEFnNnh5c0ZqVG9jaWI2ek5QdkxZNXZlY2x5dTA3WENQL2R4?=
 =?utf-8?B?OGxmVGxONkJxdXMvMHVYK2lnd0h3M2VNS2c1RG1jMzRjNEJ0Qno4bUpHbnhP?=
 =?utf-8?B?M0ZPL3VtSXRzK2dRWFd0YmRPcUUvU0wzZVphOUM2MWJJY3gxcmZWQVoyWnpO?=
 =?utf-8?B?MHdocjlScU80V2ZtL0k1Y1Q0Q21tN2pIQU1EL2VlWWp1d1JvMmM0Tk1tSXBW?=
 =?utf-8?B?b3hEaFBETVQrNWpIdjR5VkVRUzVZRTdjc1JMeFEwYmpXcXBmbUJaNDN3RlZa?=
 =?utf-8?B?T1dyM1psaDUvckRZS1EyWkYrS21xNWNZa3g4Ym55WHl3enNuRWk2OEJVeWRw?=
 =?utf-8?B?cWg1YkNtcHVSeFZtdkdhUnZFMXcvbzgrcnA1UlIvTlI0UUF3ZHFpby9jMk5w?=
 =?utf-8?B?Z2tWSmM4aExaSUw3M1Urc2pEcWtwY1ZHU1kwOEZPVFB3WGdHU1h2dUZIQVFq?=
 =?utf-8?B?d3RGQ0E1aVUrSkd4RjlSL3dtR1lXN2o2TDh0RWpTZjFTMTZXYlRPQ3ZuUEh0?=
 =?utf-8?B?ekxUMDREOHYybHkvQUFEUktkQVVsQy9FWGM4dmd0K3YzU0ZFb2JKcGtRMjlV?=
 =?utf-8?B?aExveUZHUHkxNk9GalFOUVE2Z05MaDg4QlFvZWVScTVUNTMvQjVJNGZLUEJ3?=
 =?utf-8?B?YzZvb0Z3NEhZSWN2T0ZjWUJZNXl6bUMyVld6TWFaa2s5b1pRcmltaDk0N0Q0?=
 =?utf-8?B?a0ozNlVhVzJ0Y2w3YXREVE9lYmMwOVRWbWFOcUc4UTlRTktYcEsrSFJmaHdx?=
 =?utf-8?B?a2ZPNDFxeksvOGNibmh5MnlqODVXaEcwV1FlRWdGNVcxdlowNHdHcGlGRG1m?=
 =?utf-8?B?VngwMjRzTGluNXUzdjVSREFVd2hteVBBYTVLcXlYMHlMSFpJWHc5ZHgrTEVQ?=
 =?utf-8?B?czdvR0NuNERyNGFObW9tMzJBaWw3M3JZL2lsaWozZW81cFFmTWN4WmJodXhK?=
 =?utf-8?B?cWZ5NTZnWjZaOUVIc3BiVUhGU1kyb3VBNVNJT1p2Vjg0ZGdZNGxlV24wQUtJ?=
 =?utf-8?B?bTd6anNFcjkrZ0dEZ3c1aXI2TzdSWEQ2OFFYSGhDMFB1MDVZZ0VZL0JCM0NT?=
 =?utf-8?B?NWpCUlhFMWpRVEhubGVrbFBEbEtOaEVWZld2RG44UTZnM21MTEIxQ1U3aUxZ?=
 =?utf-8?B?RkhVT3Bnem5uRVg1WjR4LzBFbDkvU1ZoSkh3Q0NvWCtGWmVmNEI0V2NOVHJh?=
 =?utf-8?B?WlR6T21lU1Arem41VktxU1dRQW1RQjhWLzhyeUdmd3h0MzdvSGZFUFdSTzNT?=
 =?utf-8?B?TjVLRUJ1T2ZwdHJMTzd6R3l2Mm04Q2I4bU1OQmp1aWdVdzMyRDl1Z20vQU5C?=
 =?utf-8?B?UE5SbWVJQzRSMnl2TFNJNGJEVEdSNWtnNXkyR09wWnJaUWJ4Q2ZqVXl5V0FM?=
 =?utf-8?B?YjNLbEFxSFpsYm5uam4xMy9zZFQwMFE4VFZaWjVmMDN6WUNraVFBR1NpM1Va?=
 =?utf-8?B?dzFjWXlCeDNJSnVESWRUK0ljVGlxRzRhUXVoQkJHQjhIUGpJMWlOQnVmQ0FT?=
 =?utf-8?Q?Zw50OLv7WPsaz1D/SWguzJb6P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1610b9a1-a1ab-4127-a20d-08dc2273f1a0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 15:47:35.1939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FW8WNr2NHW8TrqoiaRvuiI2ZX2t5KpN5encWUtD8rOoOXpTZFIq4gcq/I/jB+1NoMdl3kMwVXEgb7T0isgH3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2024-01-30 7:09 p.m., Matt Roper wrote:
> On Tue, Jan 30, 2024 at 01:22:08PM -0800, Zhanjun Dong wrote:
>> Expose helper for dss per group. This is a precursor patch to allow
>> for easier iteration through MCR registers and other per-DSS uses.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
>>   drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>>   4 files changed, 58 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 77925b35cf8d..ad2e42dc2218 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
>>   	gt->steering[LNCF].instance_target = 0;		/* unused */
>>   }
>>   
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
>> +{
>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>>   static void init_steering_dss(struct xe_gt *gt)
>>   {
>>   	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>   			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>   
>>   	gt->steering[DSS].group_target = dss / dss_per_grp;
>>   	gt->steering[DSS].instance_target = dss % dss_per_grp;
> 
> To avoid duplicating the logic, we could just replace these lines with a
> call to your new xe_gt_mcr_get_dss_steering() function as well.  Then we
> don't even need the dss_per_grp local variable.

There are pointer type mismatch issue, both 
gt->steering[DSS].group_target and gt->steering[DSS].instance_target are 
u16, while xe_gt_mcr_get_dss_steering take uint*, which called by the 
macro and get the pointer from macro. I would prefer leave int type as 
macro argument type as it is easy and safe way to avoid write 4/8 bytes 
to 2 bytes data.
Let's leave the part as is to avoid u16* vs uint* type issue.

> 
>> @@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>>   		}
>>   	}
>>   }
>> +
>> +/**
>> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
>> + * @gt: GT structure
>> + * @dss: DSS ID to obtain steering for
>> + * @group: pointer to storage for steering group ID
>> + * @instance: pointer to storage for steering instance ID
>> + *
>> + * Returns the steering IDs (via the @group and @instance parameters) that
>> + * correspond to a specific DSS ID.
>> + */
>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>> +				unsigned int *instance)
>> +{
>> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +
>> +	*group = dss / dss_per_grp;
>> +	*instance = dss % dss_per_grp;
>> +}
>> +
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)
> 
> "dss" and "subslice" are basically two terms for the same thing so this
> name is a bit redundant.  Something like "xe_gt_mcr_has_dss" would
> probably be fine?
> 
> Although this should probably be in xe_gt_topology rather than xe_gt_mcr
> since it deals more with the hardware topology than with steering.  So
> moving it over to that file, the name would become
> "xe_gt_topology_has_dss."
Moved to xe_gt_topology is fine, because the function need dss per group 
to do calculation, then it requires xe_gt_mcr_get_dss_per_group exposed.

> 
>> +{
>> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +	int index = slice * dss_per_grp + subslice;
>> +
>> +	if (index >= XE_MAX_DSS_FUSE_BITS) {
>> +		xe_gt_dbg(gt, "DSS id out of range: slice:%d subslice:%d\n", slice, subslice);
>> +		return false;
>> +	}
>> +
>> +	return test_bit(index, gt->fuse_topo.g_dss_mask) ||
>> +	       test_bit(index, gt->fuse_topo.c_dss_mask);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> index 27ca1bc880a0..356f21978eb8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_types.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>> @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>   			       u32 value);
>>   
>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
> 
> It doesn't look like you actually use this outside of xe_gt_mcr.c
> anymore so we probably don't need to export it.  It can remain a static
> function for now.
Same to above, move xe_gt_mcr_has_dss to xe_gt_topology.c conflicts with 
this static prototype definition.

> 
>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>> +				unsigned int *instance);
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
>> +
>> +#define _HAS_DSS(gt__, group__, instance__) xe_gt_mcr_dss_has_subslice(gt__, group__, instance__)
> 
> I don't think we need this macro which is just a pure alias for the real
> function.
Sure, will take it off.

> 
>> +
>> +/*
>> + * Loop over each subslice/DSS and determine the group and instance IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + */
>> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
>> +	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
>> +	     dss_ < XE_MAX_DSS_FUSE_BITS; \
>> +	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \
>> +		for_each_if(_HAS_DSS(gt_, (group_), (instance_)))
> 
> We could also probably implement this more efficiently if we had a
> topology helper like this (untested):
> 
>      int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from) {
>              xe_dss_mask_t all_dss;
>              unsigned long next;
>      
>              bitmap_or(all_dss,
>                        gt->fuse_topo.g_dss_mask,
>                        gt->fuse_topo.c_dss_mask,
>                        XE_MAX_DSS_FUSE_BITS);
> 
>              next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
>              if (next == XE_MAX_DSS_FUSE_BITS)
>                      return -1;
>      
>              return next;
>      }
> 
> Then you could write these loops as something like:
> 
>     #define for_each_dss_steering(dss_, gt_, group_, instance_) \
>             for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
>                  dss_ >= 0; \
>                  dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
> 
The macro above actually not set group_ and instance_, while the macro 
for_each_dss_steering designed is to iterate all dss id, call a code 
block, with group_ and instance_ already set. In my review comments to 
Jose's patch, I have similar optimization, but revert back because of 
the same group_ and instance_ not set reason.

> That also avoids leaking the XE_MAX_DSS_FUSE_BITS internal detail
> outside the topology files.
> 
>>   
>>   #endif /* _XE_GT_MCR_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..e973eeaac7f1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> -
>>   static void
>>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 70c615dd1498..b926606edb38 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -25,7 +25,9 @@ enum xe_gt_type {
>>   };
>>   
>>   #define XE_MAX_DSS_FUSE_REGS	3
>> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> 
> Based on the suggestions above, I don't think moving these will actually
> be necessary.
This bind with for_each_dss_steering macro define.
> 
> 
> Matt
> 
>>   #define XE_MAX_EU_FUSE_REGS	1
>> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>>   
>>   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>> -- 
>> 2.34.1
>>
> 
