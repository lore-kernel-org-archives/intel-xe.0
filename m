Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B61CCD1283
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 15:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C126910F065;
	Tue, 26 Mar 2024 15:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hb3RDrnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8DB10F065
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711467656; x=1743003656;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0cYyiJzme+QfYr1iWnbS8+Cgi7D9eK60/9vOaXTTaUw=;
 b=Hb3RDrnUylWMlI0n2iwOJqBOYjAVKJbTeVXjyyXqRavvkHEHMVwHjMXI
 kKk4rR9X4r+QkHL9zIi/kNVSkUXgjqtZQ8LwxnsprbopIUeQoCl3sUtXt
 qh10OHih+LBWWJ4SCgPnIqpy33EeFeCDy07UFDZsm40hUXYDNS6yLigXO
 RGKogTjocxp1nENAeGE6+7cXC951tkBmtqp3vpVjXfvem3HeBBeeVXKKe
 ZO0vfmKUGX0l9T3A3GQ0suUKM+JhP3uyNqc+tEtRAx6ojvVqmlDV+VQeU
 88YmxPPIyXg79odTtDBbI++RRZX0mOfqs74iyeS5iBH/iSWvvjdhR9Bdu Q==;
X-CSE-ConnectionGUID: S5bnoKBHTr+Ajtx0StcoLA==
X-CSE-MsgGUID: 93XG/HgRQLiiWMSN5j2c3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24015028"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="24015028"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15955812"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 08:40:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:40:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:40:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 08:40:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 08:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye5EjkvEc+H2zFcsCgoKRy4bx5vs4hlR7hsxGAHeuC+56S2zzQsvXkKPAyjNpQKZ7Am356GeWC478otCWNyF8jmgoOuF5782QCogHONZ/MWaKwiq7GpcGjpPMYSPwKrWJIUZ0TOXYUMWi6OywjabaStkzftyKYNSQwXUM5IQJGJ2G7AQyYVXfjk0ZDSuTp4llkSPpfYSwk2/1tRBCJvTSQufD6/1Lb6SN8BNfKj2rsaJ0JxBtS6FoT57e50c8cUPYryRliO8+QHpE3SqR0QrdKlBPmLIMz1LO3LDMa7d8HW5r+TuUseddXArBT8wHG5lNKMcM0C8tO7zRBx1Wtkaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REciobSVBauVOZAgyykgQSPpT5PQ1klf3I+JJWYYscc=;
 b=S94xBDueMkIePdqYFaXKYRrUWj2iojzR1mPeap/qnFMtIJVy1sxKpLV4wkxGMTiid+7O3t9E3O+ovnV6Jqt5gKkM+Yay3+lHWILKVEuw+vFmEtRIIR/EepO7k81NkxoyYTW8iUy21hFy/Ics6SNS7uHI8f9XvCj5TOb6YwSIxlJo+f8+ozDWNLbnRhsf3T4LvT1cDx2HXrTKgkwIxuNLmElKZnuc+TwIT7QMewjlhzkVfdo9FRDqnU/D72zq8V/mM2mvpNupYWIOKwXWgYViNOxpunAfDRshg+7K2Xw+UufoChuUqTEAwqfGQTEQ1Ss6knzbz+xL2vTGmkmXkmSHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 15:40:51 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 15:40:51 +0000
Message-ID: <91ee9ae7-105f-4cfd-8e80-4a3caac15fbd@intel.com>
Date: Tue, 26 Mar 2024 11:40:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
 <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
 <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
 <1226b37a-b163-4b03-97b7-863dc258dca4@intel.com>
Content-Language: en-US
In-Reply-To: <1226b37a-b163-4b03-97b7-863dc258dca4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW5PR11MB5811:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BG8rS1cIemFKZ4l0MMUcFfi2yE6Hoc4OQx9Kvmx+Sb3ZwxGJZkBi2wrVgkpa8H/fvs002QA6G8tLl/VdOQRSsuIzs+Bbcv8DcvWKoVBM0ZnEhTo91GTn9hWU5Idnyzagl9rKVoKL//X/5iVIUdL3JiR9lZ5gWeW5Uqv/75O0KEelzomK20evhHjytcHkcU9wHnPnywPqUWgzVr3SDW5qKzc5wJ/S0r/FfhbXfz/rxHDxIVNKGGMiCSRkGiO9VaBqRtcLdL+m8lNXdbT7jryf6oJ/fkEb85G4dCFS6A+OfcJCtEU8LwDhHzjzNYkj1VtYy5TCPyOGYOb7Uz7S9/LzYralTzpu5y9JPPAYwOdsXwuQEcpaxutxhn0fAGcMpVIdRtK0+ZvHkqMWdg0UaRiOBU2RtJas4cGMLNnjebN69leSYtZgvghczaKj04vFIE3GEjbsOc8bYdQKK81EyA1FvRFiatM0WFT2tDDivrUSsmpFoC+BJSeoNhu4DfNJTE40FV42I6UtGL4MXaJ4/6r3DWeJ08VzCdj9SP73MPlvMkU350evx0mnRwflwED4bzZLAfMMBZ824iiLy4jDrWHYttfwF8CJb13SGcGHrESFZkT6uxXunLjc/Hx9B3ghVa/AY8aeS9sXyeHnno9pf5Z7ayPjlwHdqrS2d4mpAzOt5U0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJiV2JwVHdKSUZWWm16UjlmREZFWEpxa1p3ZjdLMG5BUE9HZ25aeHR6VjhT?=
 =?utf-8?B?RmRhclJwOHlZYW1Dc0c1Q1ljQ0hlY1ViL1BxVm1rN0owc1daM0JLYTRQT0Vu?=
 =?utf-8?B?TWdLOU9mNGRMZEk1Nk91NzNKZmZ4M2xMOURIMDQ2SlJFdWxvRSs5djU2ZVNt?=
 =?utf-8?B?RWFLbXRaMlZ1V2hoNFlsYUJBQ2VYaGt6MVRQYXBFakp3bGpPTG43Y21NTCsw?=
 =?utf-8?B?clQ2V3Baa1lSV0prYUpEcWJLSUlBYitTTmFPVnlFSEZjMWg0cm5sNlRwbGJv?=
 =?utf-8?B?M0NhT3VwR1lLbXVpMndoQnNBejRzYndFc2o0NytwTzhDMXdVdHZUTTV5ZG1K?=
 =?utf-8?B?eXpBaDNZajlCY0lsUEJNOWNYcklabDY1NzZORkUwd3hHV3ZrYmxEZ3N3MzJ6?=
 =?utf-8?B?emNGc1l6UXNmZ05aRmVjQ2QwME9wbHdsblVNUWlzMXJLeit1NlljQ2FDdXBD?=
 =?utf-8?B?Z0JoZTByNEFqYmluMXd4YkJ0NWNNeHNtZUVLVXZDU1NnTnRGTzBlMDhGTnhN?=
 =?utf-8?B?djNJTmg0VVA4VW1hZ1RNSXdnYW52T241aE05UUhpK0Z6WW9iVjRBVEhsT24z?=
 =?utf-8?B?SzVkQjFGcU56SloxMDJmUlhqb0ZkNzN5dlhYZWhDL2J5aFozTUdmYWhzVXdp?=
 =?utf-8?B?eGo5YTBOMk1zUTg1QW1iME5jWXN2d1lTNWhEZ1hobmkxV2phTDFKK3JGaXc4?=
 =?utf-8?B?SUdSYTJRb1Y1MXBodGhNK2F3aTRQTHplOFdFbEYyZjFTNU81VTZRamF2Z0Ev?=
 =?utf-8?B?N2JjME5QNmhtdnRKZ0h5ajZ5NXJ0ZFpLK1ZKMTBVaG5YUWhLOEsvcU91UjA3?=
 =?utf-8?B?TVBSUUVBcTdkRWc5NUs3a1hWaFNaMVV2WmNOaHkvQSt0aUxXUU05ZXlYWHJF?=
 =?utf-8?B?RzlXM29GSEEwVC9EVTBuQkJiby9YL3I2eTN2TEx1bnBNcjFHTFBUZ1FPZzlF?=
 =?utf-8?B?dkZVWWg3ajMvUUhzSVBHbi9MU3Z0eTRqOTFua2M1Y20yY28wT3Q0TXB1TWhK?=
 =?utf-8?B?aEswTWFLeFlRUmtUdENnZW5Ub0lrc1JpSmkzMElUd2xza0FUWCtYZGdiZmVK?=
 =?utf-8?B?UXJYWXJUZ2xuWFJrU1NsaFoxd0ZXd09FaEtVSUNWVjRtZ3llb1FUbzRCVXdI?=
 =?utf-8?B?MTdyOXVsb1pON01RQzVaSXhJUGt1TVhETjN3ZlBJVlV0WExZZEs3OGxtQUh6?=
 =?utf-8?B?L2poK2NQWWxySTN3YmJraUF2RXR3QS9tdjZ6YVBJTEdGMjlmVDZVMmo2eDk5?=
 =?utf-8?B?SjdUdUQ3SmwxMytyWHB6eWZLdWdnMWpzYjY1STc3Sy9hcVg5TzJXQmptMHJK?=
 =?utf-8?B?STVZOFMvUTJHQTQ5Y0V5NTUyaFQvZXg0dXFqSXRBWlh2Y1JYMEYzeVJNR1dD?=
 =?utf-8?B?STNidlhTUXZxTC82ZkNJSWhIc3R5WHJYdTg0aUVyOWMwTk5PL3ZwSHZUUHUr?=
 =?utf-8?B?MHMwT2FvWTBBVWMvTGlPNlBUckNQa09IbWdocGZ0WEd4ZEtia1QzMkFOSHl3?=
 =?utf-8?B?UTdMQ3BzdHR6SG80V1c1V1lOV2NJSDFpWTFKVE9yZXhZN3RNZG9iZ1FsRzVm?=
 =?utf-8?B?eHhFcEtOTjhXVnd6bmZ4aWJZdlZTZEt5Z3FvZ2lFYmhPWXVwL1JkYmVhbU83?=
 =?utf-8?B?Ly9qZ0QrRTZaT20vK0RmdFVNYU9Yd0VpcEViOGZSdXEra25jYXJ6ZkhuY3ZI?=
 =?utf-8?B?VGZvUUV3azlUeEFUc0JRRlFIUjFYVGE0cDNzRGlHa09lZjE1TStLTGsvUUly?=
 =?utf-8?B?bVliR01nZjk0eHUvay9DR0huVkloN3JrN0RLZTJJL0puWUpSUWtqRmMzd0Nj?=
 =?utf-8?B?S1dLcE90eG1xbnh3Snp5Tmp3Vm1PMGZKbFUrd3Yxc3dIN3Mxay9EOTlyUksx?=
 =?utf-8?B?dmh6ZmpMOGxqM3RmM2lwRzl5L1RkejY0dEtkRTl2TDVaS0lhZnBVd1R6V2pJ?=
 =?utf-8?B?SUlERUhEaHo5ZUNCcjJhL1J6SCs5WjBYVjVsRENqQlc2RE5oQXE0QnhJYXNx?=
 =?utf-8?B?aXIzN0wyWmhpYkxUaU45U3lrYUg4ci9vMGFaMXphYXgwZzVtcmg0RzlpVkc1?=
 =?utf-8?B?czVEY0szK1Q4QUtsVlBCdENHS2hBMnRxaW9iR3pUUmpFR2VXY0JQaFRORWhU?=
 =?utf-8?B?cEJIckxiR0UzYXJrSDAwM0puSlBiOTc2cHU1ZldlOW42U1FEcklwMENBSG1r?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5610b7f5-71d8-4816-3b6b-08dc4dab1d6f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 15:40:51.0304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oimc4pt0cvvU9TUnshfVeYEqIuIAWRCx/rdngD4neUsOqEuiwGzr4yjUBVNSoGrXX2eYXNUfxBh8/ZOCyizpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
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

See my comments inline below.

Regards,
Zhanjun
On 2024-03-22 5:36 p.m., Dong, Zhanjun wrote:
> See my comments below.
> 
> Regards,
> Zhanjun
> 
> On 2024-03-22 5:28 p.m., Souza, Jose wrote:
>> On Fri, 2024-03-22 at 11:37 -0700, José Roberto de Souza wrote:
>>> On Fri, 2024-03-22 at 09:57 -0700, José Roberto de Souza wrote:
>>>> On Tue, 2024-03-19 at 07:36 -0700, Zhanjun Dong wrote:
>>>>> Port GuC based register capture for error capture from i915 to Xe.
>>>>>
>>>>> There are 3 parts inside:
>>>>> . Prepare for capture registers
>>>>>      There is a bo create at guc ads init time, that is very early
>>>>>      and engi  ne map is not ready, make it hard to calculate the
>>>>>      capture buffer size, new function created for worst case size
>>>>>      caluation. Other than that, this part basically follows the i915
>>>>>      design.
>>>>> . Process capture notification message
>>>>>      Basically follows i915 design
>>>>> . Sysfs command process.
>>>>>      Xe switched to devcoredump, adopted command line process with
>>>>>      captured node list.
>>>>
>>>> Just some notes after trying this to debug a issue with this series:
>>>>
>>>> - CONFIG_DRM_XE_CAPTURE_ERROR is not a good name for a config to 
>>>> enable GuC based capture.
>>>>     - in my opinion this should not even exist, always capture with 
>>>> GuC if xe_device_uc_enabled() is true.

3 reasons:
1. This GuC based register error capture is for debug purpose, does it 
still important for production stage? I want to leave it an option for 
users who don't need it.
2. With this opiton disabled, extra memory could be saved. It might not 
be a big deal for PC, while might be valuable for customers who want to 
save few 10KBs to 100KB RAM usage.
3. The feature with an opiton is what we have in i915, where the feature 
is ported from. So make it the same style to avoid users migrated from 
i915 complains about it.

>>>>
>>>> - coredump don't have some registers like SAMPLER_INSTDONE, 
>>>> ROW_INSTDONE, XEHPG_INSTDONE_GEOM_SVG...
> 
> Yes, those steering register print out is missing.
> 
>>>> Here the output in LNL:
>>>
>>> ah this could explain...
>>>
>>> [  152.189386] xe 0000:00:02.0: 
>>> [drm:xe_hw_engine_snapshot_from_capture [xe]] GT0: GuC error capture 
>>> is empty, take snapshot from engine.
>>> [  152.190215] xe 0000:00:02.0: [drm] Xe device coredump has been 
>>> created
>>>
>>> but both code paths needs to dump the same registers
> 
> I found you have another patch:
> drm/xe/devcoredump: Print errno if VM snapshot was not captured
> I will take a look.
> 
>>
>> Hi Zhanjun
>>
>> Mesa team needs the INSTDONE registers to debug issues and I have 
>> patches implementing the dump of this registers.
>> Do you mind if I send this patches the list?
> 
> Sure, please send it.
> 
>>
>> I guess this GuC based register capture will need another version and 
>> someone with experience on GuC to review, so it will take a while...
>>
>>>
>>>>
>>>> **** HW Engines ****
>>>> rcs0 (physical), logical instance=0
>>>>     Forcewake: domain 0x2, ref 1
>>>>     HWSTAM: 0xffffffff
>>>>     RING_HWS_PGA: 0x01693000
>>>>     RING_START: 0x029d5000
>>>>     RING_HEAD: 0x00001914
>>>>     RING_TAIL: 0x00001968
>>>>     RING_CTL: 0x00003001
>>>>     RING_MI_MODE: 0x00001000
>>>>     RING_MODE: 0x00000008
>>>>     RING_IMR: 0x00000000
>>>>     RING_ESR: 0x00000000
>>>>     RING_EMR: 0xffffffff
>>>>     RING_EIR: 0x00000000
>>>>     IPEHR: 0x7a000004
>>>>     ACTHD: 0x0000effeffff9208
>>>>     RING_BBADDR: 0x0000effeffff9209
>>>>     RING_DMA_FADD: 0x00000000029d6968
>>>>     RING_EXECLIST_STATUS: 0x000000004000279c
>>>>     RING_EXECLIST_SQ_CONTENTS: 0x00000000029d9719
>>>>
>>>> - a lot of style issues, see 'CI.checkpatch'

After review the CI.checkpatch output, all style issues reported is by 
purpose.

>>>>
>>>>>
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>>>
>>>>> Changes from prior revs:
>>>>>    v6:-  Change hardcoded register snapshot fill to follow mapping 
>>>>> tables
>>>>>          When capture is empty, take snapshot from engine
>>>>>    v5:-  Split dss helper code out as an standalone patch
>>>>>          Remove old platform registers definition.
>>>>>          Split register map table to 32 and 64bit each
>>>>>    v4:-  Move register map table to xe_hw_engine.c
>>>>>    v3:-  Remove condition compilation in code
>>>>>    v2:-  Split into multiple chunks
>>>>>
>>>>> Zhanjun Dong (8):
>>>>>    drm/xe/guc: Add kconfig for GuC based register capture
>>>>>    drm/xe/guc: Update GuC ADS size for error capture
>>>>>    drm/xe/guc: Add XE_LP steered register lists
>>>>>    drm/xe/guc: Add capture size check in GuC log buffer
>>>>>    drm/xe/guc: Check sizing of guc_capture output
>>>>>    drm/xe/guc: Extract GuC error capture lists on G2H notification
>>>>>    drm/xe/guc: Pre-allocate output nodes for extraction
>>>>>    drm/xe/guc: Plumb GuC-capture into dev coredump
>>>>>
>>>>>   drivers/gpu/drm/xe/Kconfig               |   11 +
>>>>>   drivers/gpu/drm/xe/Makefile              |    1 +
>>>>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>>>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |    5 +
>>>>>   drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>>>>>   drivers/gpu/drm/xe/xe_guc.c              |    6 +
>>>>>   drivers/gpu/drm/xe/xe_guc_ads.c          |  229 +++-
>>>>>   drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>>>>>   drivers/gpu/drm/xe/xe_guc_capture.c      | 1332 
>>>>> ++++++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
>>>>>   drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
>>>>>   drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>>>>>   drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
>>>>>   drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
>>>>>   drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>>>>>   drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
>>>>>   drivers/gpu/drm/xe/xe_guc_submit.c       |   21 +-
>>>>>   drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
>>>>>   drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>>>>>   drivers/gpu/drm/xe/xe_hw_engine.c        |  261 ++++-
>>>>>   drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
>>>>>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  117 +-
>>>>>   22 files changed, 2421 insertions(+), 115 deletions(-)
>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>>>>>
>>>>
>>>
>>
