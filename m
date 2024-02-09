Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C502C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 08:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6878410E0DE;
	Fri,  9 Feb 2024 08:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwrX+heG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3283E10E02A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707466432; x=1739002432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=isbWBNweq89O3s59g4ueZU3Jv6ypHrL9MCpINMHpaWY=;
 b=HwrX+heGKkqWsYSdvIdKjLXsrw4akhYVZsAeFjF1sEbgFahZyrIkvyMz
 nBeROfFvly1FCdJDhpKQfWHtdJ4GdwtRGSpYcDzphUiyf+znEn+gc+UlQ
 BLe3oBALoL7qAzclan/mZvBBqMQkuoprfC37gpwFU7yfq8hy+yKBzGESo
 UwKro+NdBiF6sfsCGXhHsZb4VYp5Xyf9JgcO/y5ArUdu1nFP2ZRuPMOT1
 yajONZghihknJZzvsUQTS0GGYKQkvAK/eQkhSKFHhVZ1Y2w72Zo6Q3aMD
 D9324rRva59nzMGsJvX8TpuJgX57z8TcuzfIu/Wmq5B/XHsdDBMqV6fdI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12468615"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12468615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1882507"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 00:13:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:13:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:13:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 00:13:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 00:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm8t90wdTDo8CbUJu2ZMnXYsq++y78Z88tSKFABEZxfoozJE1Vo6wP5D55H1hlQpwV5PqpPLhFi2eAq9j1CR2B4zml9Cm2iYKL5ZmhnZHSMBYJiH9keCh+i5hI+VWWxbWMFODjUY+CMwwF/gp21LgoIswSMCU4xVkkAqnG1Y1X/SUic03uliWDNNIsuy5PdUo/HRuzOcQcUqmQFyhsVnSmP4SPeT52UFXRi1kU1jXYkuq0qwzFl0zuDbTppKu7fks+Ziq2u73Oynpc7bkQtmVntz/IImId9SkoRkWwmkxLpaerYzBNd5vMpzXLv2MKSZ3xFdPXeCmaQcBhxXmKGKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9QkWcE7UtiaOO+CI86ssDX6CqONehX21uQSQZP3iuM=;
 b=ao4+rt4lauH/Vp1cwt4zeE4D7gio3ukCuxiDbkuFf8/gcE/KoU+WgBZ0EBkQHf+gfg6MjT5MIy4v8sZKfDTpTUs19pAXRC4ovb3W9gR/CVKgt7UAEHMSUy1dUJp3pKZc17cjlhnN21lNTfFkECB8c2eOFH8RXAC9cq5Ysohw+/OzOpp3Jhp9tiFdWArosGHBVuamr9qhwxRbkWhif10AApm22q3Js2Dch8BDWHLPx07w87voLcrG2RattZCc5Y+YWAYAQJ6udoDTF5B1S5EFufwMqknrvrnWqQ9+x02P7W+l+qOtXAOE8GNCUj8//2cq1ebwBPqAz2t2lDOJEnxCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Fri, 9 Feb
 2024 08:13:43 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431%4]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 08:13:43 +0000
Message-ID: <8bb5c0c9-e1e0-4687-a2ac-a5555cfbbdc8@intel.com>
Date: Fri, 9 Feb 2024 10:14:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] drm/xe/oa: OA stream initialization (OAG)
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-8-ashutosh.dixit@intel.com>
 <c16fd9ed-95d4-4a4d-a57f-06f19c7b6d6f@intel.com>
 <85zfwaunc1.wl-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <85zfwaunc1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: ac96ffaf-6f77-4700-084e-08dc2947079d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WAhHsk8N/qC2LjmWYKUL8YyTEq2NiFiuRFNnYWzLORjfeCH0cPfq+fU5drQn4XCZdJ14C4xYtP4ro8lSmNx1iYC7dRrh8eT1mN0xASbqtudjN04uWa4r27rkgd2iUk4uNYTIYRN1gM3KgW8dd7O1sfzr4c8x/q02Q8AGygyXHa3jdQZPHfezE+qtzC74G2lX+VFIKWjNyMToNCssdLTsoEmgJjoBUG9ieIMwnUzWzJeGAhAK+iPWs2TPIZcGy0NYB5XSTvBoW05jcwfhhcyLKfxeAQvQwFcTEqWzLwprMjunewVkFHpE2x27WDcj4zk6U+NKjLXtFhEVm6UHpNBM220U383FozZsBNUDUHZiEidLHCrsDw8ZonGhSr/9fEGl8Gxw9dXIBif5MDS4UjXC+refC8K8+4rXLMjze1oMpv10vFIgPaQl4giDp0NBH1qANbnM1HJIYiaNtsoPs9kznj9aPpor5ls9bGm7uY90WILLwzPmnXGPRs6htkfQBr+cC74l12oazq+meiTIRvoD4gsvNgPjsITr7UZOKuY5DivSkcP0x7bDWkXkqMKj7FtF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6486002)(41300700001)(4326008)(8936002)(6862004)(83380400001)(8676002)(86362001)(31696002)(6512007)(6666004)(2616005)(53546011)(26005)(107886003)(36756003)(37006003)(66476007)(66946007)(316002)(66556008)(6636002)(2906002)(6506007)(5660300002)(478600001)(38100700002)(31686004)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlB6VU5oR3VhaHN1MHpYdVFVTDBadkh1bFBCNldrMmd0RzhPQmtCcml2a2NZ?=
 =?utf-8?B?aHNaK2pYWDhVT1hXQklBcnJVYmFqZ0pJNElud2VMeEtsYWhYMStmZTBkaUUv?=
 =?utf-8?B?VGttV250TnpiNlJCRnNKcjlZZnhXZ240Q3dVQWQ4Uk9SVE5wejdGSFRBLy8r?=
 =?utf-8?B?bzVYcjFMSFFvSTlQTGRZSjNKQ25tZFNiZzAxTVVaUUY0dHZheUlNT25EOFZ4?=
 =?utf-8?B?RENCNDFzeU9Hd2szWElCSzdQZXZKZmZ3ZWZTWEorZ01xVmVBRTA4QU5jYWRM?=
 =?utf-8?B?ZzJ6cmlsUlRoeGwydUo1VUViVGppRlI1aUtWa0pRQVp3Y2V4bFlpbjhseWNL?=
 =?utf-8?B?Qk0zVmRicTNzNjhKVVpoRjV1OFZtWlA4U20yeCtmbU5BWkYrenF6bzlkNkdU?=
 =?utf-8?B?ZitEeXZWOVkrcW13ODZYSmR3SmpzNGIxZ3MzUGkrdk4xYW01SUtENC9lVWlx?=
 =?utf-8?B?YWpPdC9yenQ1REJmS0swSWtkN0JUSmJrM3VGeklWc1o3dGMzd3hSVnVvU1J6?=
 =?utf-8?B?WjJ5UEo2K3hDUUdYVjg3UjV2SUlxcWdiM2JDajhkSDBldlIzdU1WSTNyWmt4?=
 =?utf-8?B?aDlEeHp1ZUhwaGFDNEdkZFFtam1MYngvSUdtdTZrdmNxQndYekRxQm1JSVFw?=
 =?utf-8?B?a0szdzZrTFkwNlRnell6ZDlWNkFSdEhBaTdvNVREVVpDWElQOFplQkMvSXpp?=
 =?utf-8?B?RDVRcUlpS0FZb2hFVXAzMFNnOXJkWm1kSUVsQy9xd3NuazVGMnhLcjVnTmhm?=
 =?utf-8?B?Qk9kbkV4cHUrRU5OZDg3SkRTK21Zb244OEZrK2FSVzhneWRNTnRZS2VRWFRV?=
 =?utf-8?B?Z1BiY0pkbi9ESm5RbUd0UmUwOHRNWUVMQktidTBIdG1reGc5WFV0UTc1ZzUz?=
 =?utf-8?B?V29VcVVUS1VnaWU0MDVWUHFtQ0hlQjdSUnNQWUQxTy84aDF2U1g1UnVNcVFm?=
 =?utf-8?B?YjF6dXZVaGZGY1JpQUpKMUF1RVRHYjdCQ1hBUmN2ZnBYRHM1bUphaHZtL3Rm?=
 =?utf-8?B?cVpJVE1DZzNVNFlNM1M4TVJYUDkvalp5QXU5VzdCdXNuL20zYndIdlpJdVN6?=
 =?utf-8?B?eDdSYkpaQlg4dWc4YU1XUVk2dVpyK0ZHMUdCV2ZqRXhhcW8wL0g1RFJhVnh6?=
 =?utf-8?B?LzRleWdrdFlTZk9Tc0diaEhpb0NXZDY5akFid1pERVltR0crR1NremFFb1Jk?=
 =?utf-8?B?Z3Y0VnowZzh1VGdzM01oaVd0eGZoK21CMHlxVXJQQjB3RkNKY3FVY3NvUzRB?=
 =?utf-8?B?Y09JbEdteFBqNVZzb3llazFkQXg1YWFRMWsyd253cDk3TEcrVS94MFVEQllx?=
 =?utf-8?B?SFE4RkxtVENydXhQZkQrM3JPUW92a1QzN1krV2lZSkFWdnpLRGtOMDFaK1VT?=
 =?utf-8?B?UlE4SXNXZUExWWpyTXpVSmxXTGk5M2RUK1ZJUDFDaE5lVVpad3RabzZYanpN?=
 =?utf-8?B?MCtXYjh4Z3BUTndUSEsrRE9DYll1V0xCQm1yZFl3VCt4YXhlYkZwdnAzOW83?=
 =?utf-8?B?VmZqb21kUU0zZHZSdGRWRlJrRlExYVRvM2dwRVVmMC9TcmhaaHhycGNYaDE3?=
 =?utf-8?B?bkhFdXoybWh4cVEwbnFUT3FZR01mbUZRRG0zeFVhL0wyeElHNXlMVS9OMDV2?=
 =?utf-8?B?Yy9QOU90T2VjQTNvM3IwWEI4ZUkrYVFkK29PTVJXc1AxaTNlLzlvbVdXQXRV?=
 =?utf-8?B?d0tpT0JWOHEzNjRaaHU3VktWTmdWZkUrSnk1dHVlVUljZEwwWEZuNGJ0dGR2?=
 =?utf-8?B?RnBLV2dyY0pHOS9pbXNid2w3bWcrMW56SWRqbzJKUlJtMWtxTmtyNG1nSGp4?=
 =?utf-8?B?M2tKNnVTZG5uT1RvQllocEQxOVk5SklueHdoTkY0UjNleWg4WkdFaVE2NE54?=
 =?utf-8?B?WVZNQlVPSkQxSkFWZzNRbVNhYjgzTWdwNWRrdTZNVDNIZXk1R3pYUzlWL3dx?=
 =?utf-8?B?OWV4bVZFa0xmak92MStjNWMwMmtIQWlPUUFGTWh2K2tWZzdubHpURUFiVGxO?=
 =?utf-8?B?VHF6VE8rV0dtSnhyYzFBeHF3ZTNDNWora3JybHE5M3ZTM01nWU9UL2x3RnJW?=
 =?utf-8?B?b2lOK3pNN21oOVFQcjUyMVhiOERzbHp4dVFiTXBaQ2t0NjJ3eERYVlpSQzd5?=
 =?utf-8?B?QXFDNkdOSklhc2FJaFJNWVVIWjZ0TUVzY0JKbm5rVEQ5ZzdJTHBnM0M1R24r?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac96ffaf-6f77-4700-084e-08dc2947079d
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 08:13:42.8867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNeYHVwpqDh2/EHzAk7AWgyKnV8kYVdyEWUVlPCe7cxMbTEkHdg5hKP1EOosBizvSoaekVqv+o18n+toL13FcXvq93L/WKgZsbIc7U4TJtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On 09/02/2024 09:08, Dixit, Ashutosh wrote:
> On Thu, 08 Feb 2024 22:23:30 -0800, Lionel Landwerlin wrote:
> Hi Lionel,
>
>>> +static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
>>> +{
>>> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>>> +	struct xe_oa_config_bo *oa_bo;
>>> +	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>>> +
>>> +	oa_bo = xe_oa_alloc_config_buffer(stream);
>>> +	if (IS_ERR(oa_bo)) {
>>> +		err = PTR_ERR(oa_bo);
>>> +		goto exit;
>>> +	}
>>> +
>>> +	err = xe_oa_submit_bb(stream, oa_bo->bb);
>>> +
>>> +	/* Additional empirical delay needed for NOA programming after registers are written */
>>> +	usleep_range(us, 2 * us);
>> Looks like the entire oa_config emission is synchronous.
> Yes that is indeed the case in this patchset.
>
>> That's a difference from i915 where we could just pipeline all the config
>> changes with perf queries in between.
>>
>> If there was a mechanism to return a syncobj in this ioctl, we could do the
>> wait from userspace and/or pipeline more submissions.
> That is the plan. To expose syncobj's in OA properties and make also make
> the oa_config emission asynchronous. But have not been able to get to it
> yet (IGT's are mostly getting ready, but now we may also need to add
> support for GPUVis before we can merge these patches, if we can't get a
> temporary waiver).
>
> So the direction right now is to get the current patchset merged before
> adding more features (like the syncobj).


Thanks,


Any idea when that will happen?

I suppose you'll have to define a new ioctl for this?


-Lionel


>
> (Also, separately I'm trying to figure out if a delay similar to the NOA
> programming delay is really needed when we have PES registers, the case for
> Xe2+. Looks like it might not be, but still needs to be confirmed).
>
> Thanks.
> --
> Ashutosh


