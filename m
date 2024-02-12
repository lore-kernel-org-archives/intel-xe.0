Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719EDC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 18:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BE710E3EC;
	Mon, 12 Feb 2024 18:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1nLYjAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4340310E3EC
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707764251; x=1739300251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bczdt6TomY5kDAC7wT5ciWHCcudJcs8sviUNNdYNa88=;
 b=C1nLYjAZNVTA7iFkBnlc6lyf5o9XlbYhFTHC6kDTH10R9FomgICMBQNn
 yGLtHeGtknbgggOnrWEwkeihqtAAVvqywQHKnNWETcnUhOUTcztvKDzsE
 tFIVpMI8NUEuY0AxtKmiVdRTAr/NJuESBAcXkl9naq4eFQUHdLfQoVwim
 S/AnJYZgfX82vdUCkIWixzGwO0aCF8PVumtt5kkEIlYPf81plWs4dO7Sb
 URwVObRIZzqS5A97RbYy/G9jTLJDp8BAyZZg6GTCQ7DFnlp1/ttWoOiib
 LPvyqWfY76p/uCPKcv8V5wnGg2JniAPz9EdpVRgvkAok0tfBn7cegqH7y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1625366"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1625366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 10:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="33471953"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 10:57:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 10:57:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 10:57:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 10:57:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OivCxoJaVw2niVryun/rAQZ6/RolzTuPOOmSf8MsP+YGc5n31B+l9AIJtJqugXAmWP4CWPYXru8EFjm1JtSYV09IOTninPL77xnfRwy5HJKGbEg8OFYuIlROHA7AkgZYbHbtYAjAhLzfmJBb3mddcuEf1jPXP0/RctbqJQyHUsVkeIpKggm1uOJgjFvb4XNF2rETb2bYlfLHc+xDpzDtSKQAZoGJPPeQFPc1TatlebwlGGGH7ULU9ZAC/ljJ32KmMMWIN8eoYSMd7i77wx3iJNrtTU/EPDuYMZ5fPOzt6RCURgP6sN2zSDj+vLlYzyr9QMNIf7EKki4T2PM2guFJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pAX2rGAu2FBr7ouR5EYGLoy9jzrsHAPlhnfvoONbvQ=;
 b=Ia5WuN0+xCqRBbWAcG4QK4G22o/eKo3DArKqoaXJVDgGRcw5nSIt6NblHqachvTSzxUH80MKy0Q29tFkW6lTeKDfrm0Q5jDboATG67lOEKT5oey+3Z9UHhZJZwyoTnqzPRt5CHMglTRrkz8bXolS0ArbeCBPIx0zGQOKAgpB83YOZA/XNvBhsfiAUiKDDSRKUnFuKMABjdLrz+kSxgUH4wKjqws8OWDRaD74QHKoF1xEGfnPR4IlDDvdPLoAFoWBh1jgOgk6IMosyf9uEcMcyhR7KezkGK8zwtCsPxqrAwJZot+KXmG8g1RB1PANJS5IRgzGDnaC6+FWs7B+Cs5mbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Mon, 12 Feb
 2024 18:57:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 18:57:27 +0000
Date: Mon, 12 Feb 2024 10:57:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZcpqDtxxGxc5PRv5@unerlige-ril>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-7-ashutosh.dixit@intel.com>
 <1c3fef48-f59b-440a-bfb7-275fb5f5d57d@intel.com>
 <857cjewq1s.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <857cjewq1s.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c242d3a-5cfb-4afd-9fc4-08dc2bfc74ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjZkVCUsIJqnOgK+QpXyqApZYoE2pIstzhYspJq5FaUMQNxkTzVbNlLhaWJLg8jADv+Q8ZJgJDq7cYpxq35Trz7FSdpGsiXdqUDrc9GHgWm8wkl1QhWMlMYwAFDsk2ZXXXQ0DDQZpr0eQLQMH2CuxdZaE+C72sG7KC3T1e369iYMyCbiGyCej/EUv4bAKE1gpY4FHx07uy53cRBXjUSO2X+CfUXrAEwB1Lj4ZeSrT5rVh0L5lZTuaE/+XoYHNaVpUZiKlduU5HaRtiGZDmUXZO7o7cpGJdWMuvpZT01zxiSiLEV6WUql3rJRd5YjSarq83etF4Jil3TQIZJ0HLpClq4dNQeCcIPN3eWgl/6gZC/X93U9VdzMQ8hK5GGA+m62aLWtxNFok/A8LbQyRJlE9ROt6nje7e89fXZHP7K+LUAPJmNkfyG5rFd8OM+Kov8MyhaDWcD/+jbnmA5mAy8X18AYdPdhBGO/0yC844LTQOoIoOKh/LvfcQgjUrEi/UI3INYjia19iPbMxBDSCZrRGaCJ9bSz5IgWgG/BVLB299M9eAl/T5xfocrZyyN+SF3/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(38100700002)(82960400001)(33716001)(41300700001)(6512007)(26005)(9686003)(478600001)(2906002)(6636002)(66476007)(316002)(6486002)(66946007)(66556008)(83380400001)(6666004)(86362001)(8936002)(8676002)(6862004)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1Q3Q2lOaEhINTV1Y1ZZRCtWVnhEeGU3eGcrcXhUOXpmSTBxWFk0cVhicWFs?=
 =?utf-8?B?VmE1a0Zab3FkMERxY0UyOUpkWURnRXpzMGZGTG1mTk16a091STNIRHJjNmNV?=
 =?utf-8?B?UUVrNmJEUmhGZTRYdDZhRnFOclJkVXYydTVqYjUwTGZxdnVqQ2ozeGdEMk5K?=
 =?utf-8?B?NEV4dG1tTTJrUm1uT1FuN3EyQWwyeEg5c1hYakVzQkhQTktXVlZmaCsxQzkz?=
 =?utf-8?B?QTFCNnA5NnFRWVpLZ3BUTThQa2l5dWY0TVpYd25LeEQyRkRscXI0Mmp3UDNx?=
 =?utf-8?B?YWFyNktWVVl4RjNVZEVMclhUeG9oblFDMUg0Q0Y3THhIYlFJQ0swTWdMRTUr?=
 =?utf-8?B?aE1CNFdEQkZZNUF3R21uSmJWUnNsbVQrdGtuVkxxOE0xQ3UxNXFiVE1qZHVB?=
 =?utf-8?B?Zk1pOGtoZzFLSWlzRDlqN2JoUksrTi9LSzFlNndYemdtcERMSGlyc3hiNnM2?=
 =?utf-8?B?eW96cEYrYUw5OVNORkFlV1pEUUluanBoWis3Y2JJc2lNeVBDTTdEME1EUDVs?=
 =?utf-8?B?MVFLc1lhUmtHbjl5RGxJQllaN0ZIenVpR0ZLZSthZmtUd3VnUDQ0QmRZUDk0?=
 =?utf-8?B?WUZrMWxicURURHdZeno2N1pudnJidHk0NkhQeGlDamNEb0o5S3ZoTGlhYkRm?=
 =?utf-8?B?Qng0YXNkZUgra3dDSnV5NDJsZlpaMVpqS0YrSk0xbzM3UzJvZEN6b2FMVXNs?=
 =?utf-8?B?Nnd0aUlDbEVaVWNqZDlFQVpTY1dZYlM5NXhPODZTV3NLZkRPTnR3WTdScWZq?=
 =?utf-8?B?eUJxbVg2T2NzdTlxNktJdFNlV2FVWnp0bzRSUUNQWEM3WlowMzh2T1RVU0Qx?=
 =?utf-8?B?ZzlTc2xUM0d5ekVXV0laNU5VeStRYTdFUGpzcHNyTkNVa1ZnZ0JUbUZURURo?=
 =?utf-8?B?OS9HcHVhQVlrK2ZUNkRuRFdxQmVzdnRNeGw2Rlc2VWdZenNuV1NCSWlneDBK?=
 =?utf-8?B?QVJhNnNLNEdPL3ZnNGVXdmRpaENZbU94SEtUdkdqUzhpNFJjVUllczlEWUxU?=
 =?utf-8?B?UmZrSjlJSWxCVlBVdDQzRmdQTEMwSXVtQml1Z1ViSys5dEFncG5Eam0vVXVO?=
 =?utf-8?B?Q29iRUVrVDVFcVpIS1hmMUhZWlBGcUI1VlhOWHVTQ0dJc0tsS1NBUllyWG9j?=
 =?utf-8?B?dkNsS0dySXQ3bEFyRXQ4N1VCMVRMUTZEOE9lTXFFZHZnaDQwb1hxMTM4cmIz?=
 =?utf-8?B?U3YvQjlmVmpFUW9SbE1vL2xPbFdqRXRubyt2Zk1ua1JQMkV2OXNJN0l5ZzBJ?=
 =?utf-8?B?SWkyUnZ0NXpmcmZPbVNVRzlaSFNXUWJDTGluN3hBbGVoUGlvV0M4TGZaVGJh?=
 =?utf-8?B?NnNrcmQvdXU3K3BYSWVrYXFnUVdEdzc1RXpQenFpakt0RkJVVkJPcVVSU1pw?=
 =?utf-8?B?U2cydldXZ2VrSUhyWDh6azBSYThFbWYxb1dIc1J4dURrV203Si9Gb1lVd3Bp?=
 =?utf-8?B?RWpaNEpZVFJMSklHS21XQW5wSGc1T2E2SzR4TTJ3K1BsU2EyOTA4RHgrSGh3?=
 =?utf-8?B?TGRyVkR0VkdPcnR6VDB4bmJpV0pzM2lVN000N1lEeVlISmxEZWtkcWtOQmFG?=
 =?utf-8?B?VndzQStqQVY5Rlo4SXpGeGRTVWZRNENjOVhpbEo1dUZLNVgweGpBZ1diMzNC?=
 =?utf-8?B?bEVXaTlEWmhyenkrbWMweGVPWHMyTVFaUWQ0T3VQNThDR0ZOT2xlL0FRTzY0?=
 =?utf-8?B?a2pWWTM2bGhLUkhMQi8zTDdRUHRHMWJsd2VteGRNZ2dCTnMrR2xpVU9DRVBv?=
 =?utf-8?B?dDhSTlZ2S2F2TjJBZ2txenRGOVRhQ08zZ3dTRlgxUno3VGZhRG9KbWhjc0pp?=
 =?utf-8?B?NG9EcFp0NWg0K1hEYkx6dDdKNUdmVWdiWnNQNkJGV2tpbldTbEJpMVZzWGI4?=
 =?utf-8?B?UUhvbGlzanh5VzF4SDA2cmhxVGdnTUpaYjE5VXBwVU50S0lwNG4zM3g4bDA1?=
 =?utf-8?B?Zy9YQUtnRlR3amF1S2RweXo5WFZxWnBURW1KQWRjMkdmV0g4TXNRcVNNSkY0?=
 =?utf-8?B?SDI3ZGt5OU9wYnp0aEQ0cHdIV2FFaGR6YzlaSTNjY25zQzc3bXNXdFI1TnRX?=
 =?utf-8?B?elRFeURRdk5vcXM1UCt0dUdWVUlCTU9CZFRsMk5hRUd4d0NaKzQ2MmhjWkFX?=
 =?utf-8?B?RVlmdWtFQU15RFc0d2J5UlNPaDB3eStJYjl3K2p4M21BQjRqSTNBWFJnR2I4?=
 =?utf-8?Q?S5MhAivEzWXYzE7kNuCaVa8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c242d3a-5cfb-4afd-9fc4-08dc2bfc74ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 18:57:27.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7YSUM9NQdc2qJfIme/GaSJ8xqR8Tkiu+ySrtyT9zO3Q2hh+CALgb7eoNcVt7aVUx5VRVx84I5VvMIjXY3QyLvrjhwWpE8DLhGtgl/MN8Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
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

On Thu, Feb 08, 2024 at 02:26:39PM -0800, Dixit, Ashutosh wrote:
>On Thu, 08 Feb 2024 13:40:29 -0800, Lionel Landwerlin wrote:
>
>Hi Lionel,
>
>> +
>> +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>> +	DRM_XE_OA_PROPERTY_OA_FORMAT,
>> +	/**
>> +	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>> +	 * the following quantities: a. enum @drm_xe_oa_format_type
>> +	 * b. Counter select c. Counter size and d. BC report
>> +	 */
>> +#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>> +#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
>>
>> People outside of Intel don't have access to the BSpec.
>
>Hmm, I was assuming Bspec is public, at least parts of it. Since we keep
>dropping Bspec references in patch commit messages?
>
>>
>> And since there is no page number either
>
>Page numbers are in the commit message, but you are right, they should be
>added here.
>
>> , it would just be easier for everybody to say :
>>
>>      "Refer to the oa_formats array in drivers/gpu/drm/xe/xe_oa.c"
>
>Umesh, what do you think about this? I don't like the idea too much, of
>referring to the internal implementation in the uapi, but if Bspec is not
>public, and we want to keep this uapi, we'll probably need to do this.
>
>Also, we are directly returning the oa_status register in response to
>DRM_XE_PERF_IOCTL_STATUS ioctl (see 'struct drm_xe_oa_stream_status'), so
>that also needs access to Bspec. But there I think we can just document the
>relevant bits in xe_drm.h.

If that's the case, then based on the PRM documents, I would just put 
this in the comment - 

"Refer to performance counter report formats under the Observability 
section in the PRM"

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
