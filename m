Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC48C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 15:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2F310F15E;
	Tue, 16 Apr 2024 15:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CymAb/nf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EB910F16C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282351; x=1744818351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XIxdHxDt3IEudsUGMw56Q4DLQ7icxQ+7FxDDY876IPg=;
 b=CymAb/nfMNE1M1PzKQmAkv9bwjmtVmmzgzyo8ALoUSkC/LfETfjR1PE5
 b/DXlsBu+6KIB62L3+2tLgvpLCAksrdlAYHKIqGMFyLgXuqz2eQpz1zHy
 Q2tNCQNr4SuWMtVAZuHblUbTTVjSprQIBJDY6Ax5FMByBSG4uuw0Y9cCE
 QhLdOA49/R9zd2Ovzl01PoPEz4gSbSEYaRvJpbTnQgzgUaUzzJP3mnI3s
 heFBxOb6N6V+Tzm7FY7jDVVohUfwece79PySbNRKe3ok32p4d1OgtdCl7
 eh8mAYtX+BgJDW5yoYlABZi5bg5/0d/a6FCn/DSSPs3W2iCLp1EUE8WRU A==;
X-CSE-ConnectionGUID: 8qFrkgjHSzm5G4d0rQAs2A==
X-CSE-MsgGUID: LgTWKW3GSG+h5UuXG84MRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8651211"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8651211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:45:50 -0700
X-CSE-ConnectionGUID: lKF9CcMYQVWSzRPJ5sdOyQ==
X-CSE-MsgGUID: lvIRia+6RMuKHFX9P04VlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22778155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 08:45:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 08:45:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 08:45:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 08:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEoQqMcDCn+BJw5zM4TDJPLWGD2fZ4pTMY0gwkNu0gFTGWQoUG6bYL4zDQDVQ3b6x3HiWTYac6JZr8OMytEsXsSVjquT1j6adMFISZvL/zSp6S0K4/HBjzFyUfsHQHSpS4bjQ9LJ4qWYDT6o3Zgp5dgHsKHsjt6ao83CtTdKAEWfwgxHqustZzqf9KEuYcY7lxent+mrxOxpfrFAsJE4mBwBBSRIrPFgQZhm8pBtm1129t/XMWfhTTDzLxPy4QucF+4yW8fYmrHPCmAqL1+8fqIv1AH8S9cMcd4HgeGRoZoS+nW01yTkY3vgCweYtZki86OEe0NjacemXN0H9ogpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTYvp+nLfhO5dcDVubAZokihw0XfIsxJ4Fi8vFoqnnM=;
 b=ca9J0DbS7Bf8OzStlcyw8W5lGBbgVNxKJczWDqymyT+M6iNAAiW4ACmbTv1oSRhypTPgrUrPzz38AlFh/v3/ovMotTwHsFzhBxO5Jw2AePWwsD4ixx96wo5WxDG9Q3vS24XpOTS6Pd/HwAMJDqD58bEftSeEDKo+Sj7OUsp5aWIK40DhgDMIQtHNcFXNQ5OrvV2elRooMfAvU9ldbF0PG/jHNGoT8z+HiZVnmmN4MH62QN7ZnBLsKlAZF+yRAzzAfNYTjEVhfFtruX/Z/JMChV2q9PwOxG5gYzk4D8zaEcUVpi2GAWOG47HNJQBuFy8H2XQfpkavblyG8XOx42e7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Tue, 16 Apr
 2024 15:45:42 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::24aa:9b79:84d9:c426]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::24aa:9b79:84d9:c426%5]) with mapi id 15.20.7430.045; Tue, 16 Apr 2024
 15:45:42 +0000
Date: Tue, 16 Apr 2024 21:15:16 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 2/7] drm/xe: Add helper to capture context runtime
Message-ID: <Zh6dDMMFsBMLPIbK@bvivekan-mobl2>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-3-lucas.demarchi@intel.com>
 <Zh4L9YhWnN5_CEKP@bvivekan-mobl2>
 <5yckw2zkfkdzlv6gjx77tmrtfpqrxe7yoywtgvbdzslnamyfha@lrfctmrwcqn5>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5yckw2zkfkdzlv6gjx77tmrtfpqrxe7yoywtgvbdzslnamyfha@lrfctmrwcqn5>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba51bdf-ce37-431e-40c6-08dc5e2c45b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jq65bAWsHTh+mxMlUtvdAq08+owwgenmPrG7p90Ch39RoKawTsQtY7EJlxONOjs49qtNchOPEXHJxS9hZDoxwxs05mnX640hYT+dMcA/+Nta15Y3hPL7kuQ6QMKl+iNa0WYvT7/uBoEGDuUZBDue6qljndOKikpuemYXnTXoeoGH9419q7byQh0p6/as70SDfHhK85/IpE+3nXpCZNsl+XnUygQGwpbPDDo+oYkFhT2sKnR+tJt7SAqnXXBFQdf4zWEi7gpUuCffqjIkHDzSzczMhFd/UBes8A+BgeqmPeEwVfIXxRiW67K5Y1MdEjy56K8XBIDmLqq1Ok/DvdyOqxujrn9eJJf79X0TjH/TWbZbv0XAx8qh5fsbuGg6OQQKIJUyZSsaYkhr+j4nGa/5g/aA4hMOZTxgt7pSivIIvnMDY8V5RW2gYPWDmqZpXFCbop0Bp02chr+XUXATdEpPmCvX0cQzY/yxIVAS5rCNIym3xNqCMLAlbDwZ6C9QaYhM+58p3ukfGA35CfLoOFsgAU4u/VR0U2p8Fjkm0gs88a+75FQ4B2h/y2T3rB+M8oktf2ZT4/mbzYmyaL6KQJgqt2jpJMiSwxStBvEnSliLIkbl0EnYFpBySpPALB4NjTmdCdMC/0qBqyanJiJfzcqTijKXZyJ0gDbDrowhltOPmhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amxsb1Y4NStNNHd1RDk0YnBUM2FDWE42b3I1bnl5MnNDWXpXTmN2RUE3Wm92?=
 =?utf-8?B?QTg3c1l3QjZEMzE3a28rNkJ1eU1nMzBXVFdCQW9RV1pTRStPQ3Z3MlZzMVlI?=
 =?utf-8?B?aU5pS212cndrdldNWklRY1cyTHBBOW9WYXh3Y0FzVDQvcFM5VW16L1E1UVEr?=
 =?utf-8?B?THdrNnVveHlDSjQ5UzNKbVczYVJEK0NMM2ZxYWF0Z3NaZjJBV3JJNzhwUDdz?=
 =?utf-8?B?RzhMVGZIT085R3V2OGRFK0p6VVdHVWN6UDJXcUJIeWl4Z0hBYXB2VWdoYlp2?=
 =?utf-8?B?bU1GUDBtb3Iwc0NZckE1d2JkYXpYYWFsM3RPOHNMRTY0SERvd2dvbG1XQXhw?=
 =?utf-8?B?dHRqQ2RjVXBSMXl3amRvcFQ4RDVOaTN1WVRtK0RIaFVZbnQ2L0hHRXBRSVo2?=
 =?utf-8?B?SkJ0eXYyak5qYzkrWXNjUVVyTTQzVHJLeEtwUEhzVFB3bGlBUzIyNklwSjh5?=
 =?utf-8?B?NjBrUG1CSUQ4amNiQk9IZjA0WTJnYmR6c3lqWGxrMWZ3SDZBZmJGRFdHMnpj?=
 =?utf-8?B?SUd1ZjdNT3RYa2xQbWVkRUxhbjZDNFlPN3d3TnJFaU1sZitHT0NNQ2VRVmV0?=
 =?utf-8?B?ZVBBKzE3NU9LT3o0ak1HOXZhaGJjdFcxZWJSd1gxR2cxMThvZVhtRnQxTUFz?=
 =?utf-8?B?c3c2V3ZRNERpVHEvMm5UdnIrVmxvZkJuZDAyZi9JVUdKT0dTdllodGZRZXpv?=
 =?utf-8?B?Q0o2NEtLU0VMdkUxRlVaMkw5UjBCVzQ2WnJyaHQ1eXFTWTNHcGNLbTFjcUZX?=
 =?utf-8?B?K010U29yQlRlVFg4SkVsOFY3NDhldUc5Z3Q5NURpUUpMblc3ZFE5RlMwTGFZ?=
 =?utf-8?B?KzU3THMxYTNUcU5tbjcyeUlSTkRBcHQ1c3dIYnhqcDNoYkR6VXhnaDV1b1M1?=
 =?utf-8?B?ZlVsN2J5bzU0SHB0dEladFhQcEMxNFUzQ0lPMS9WWEVleEkzQjhhV0ZSaHd4?=
 =?utf-8?B?RTJpck5jYmlwcWhRSHVkYS9vMjRYNXFxdXNFRXNsMndqbE04N3laZDVXTHN0?=
 =?utf-8?B?WERmWS9TenFOVmQ3ZlNhODFoNUtZNlFWSFRSTWxXTFFndzgzb1p4ZUJ5REVS?=
 =?utf-8?B?akhzZndYT1VQU0Z3RGo0ZnAvZWJ6Vjl1SlB1Q3pUb2tUZ3I2ZitXK21nSlp4?=
 =?utf-8?B?ZktuNUhLTkUvM2FoTGp1ZC9kRDJHdDQ5dWY4OHkxQ1FvcFVQUFhhNCs3OUU4?=
 =?utf-8?B?WExVeDM3V3dhOEFaS2dJK2NRdGkzNDZsS25pNlhPLzE3TWI3OXVTc2NXSTI0?=
 =?utf-8?B?KzIyTlYzb3d6Vy80a3pjdHlKS29PazliYmJSM3F2Q1BNVWJDRHVNN0l4UjFZ?=
 =?utf-8?B?ZVdBYXBPdTR1VkpXbWFjZ09MYkJDK0NmR3BPeTlZTmsyVTM2c1Z6b1BBYXVw?=
 =?utf-8?B?U0d3dTJOT1lSN0RLcktKNUtvMm1Ha1FxWTQ2aFI5UWJpZHAzbnIxSitBcVQ5?=
 =?utf-8?B?OC9jLzVld2pTbEhGV0N4TzVzZDdqS3UxY3V6cGViRnhjQ1NESDJGUGMwbkV4?=
 =?utf-8?B?TlJZZE81eFRKRlNITzd5cnlCVFN2clpnNWRIOFZVeGhGQU1TTUpHdlpzN3dn?=
 =?utf-8?B?RHUwYVU0bDREb1IrRXBCdlMxeUhlSnRiejI5WFZXZ0xmR3NySmRqR0owdnFT?=
 =?utf-8?B?S0JVaXdrUThPOEZ1ZHZVWGZhYWhoeG8zNzcyK3lQV3dFRWY0ZmtjZmZ1MjZ2?=
 =?utf-8?B?ODQ5VTllcEVZTFBSUXdEQzZNOHNlVC83d051SlBCditwenBIYno3SzdjQzc1?=
 =?utf-8?B?ZTNzZDM3UEdmVGpWZjBOR2VOVkZvb3VHd2FFVzduQXRNTnpCZzdNZkR5QXUv?=
 =?utf-8?B?Ky9hMmt3Yk5CK3JCcnpUa3l5VzZlZXdGQ1VzejU3SlNnOUxKVVpSRXhLSXYw?=
 =?utf-8?B?aXROSmxVY0k1WEtxbGpXNXZXMUlRY0hWelh1eUlKbVAzRFNISStVL3Nnbll5?=
 =?utf-8?B?T3FZVUJvbHgwczVhc2RTM2p5RXZDdzQ3dUR4aW5qQXhZbHEyM0VVem14eDNy?=
 =?utf-8?B?TDVDd1pPbms2TnJSMVZKaU1xSnEzNnk1eEpZbVFVK04vWlVwQjVVc3MvbHht?=
 =?utf-8?B?SXRGYmJaUUUrRHZUT1J2MGJXZVRXV1ArVkNYQUZzbXlHZEdaYnB3NG5ST2JT?=
 =?utf-8?B?aUhIYnFaTUIyYjVYa05JQjRpMkg2RVRFeFBaZ0tqdHFEazEwd0E3blFYUzdT?=
 =?utf-8?Q?c864juPgBXhw5YZe8ePNFC4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba51bdf-ce37-431e-40c6-08dc5e2c45b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 15:45:42.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1G+0WKkhPTI3jB+UIaZzAmHBHcHeC9xeE0+vOTm6D3ZNSQY9xSWEOKe7lt9DodwK2Vw2ifmZpPgyqPTqRyDf22lslw7ok9bWWeH6tXetKNz+kKREEB0wTHVpT1bXfS1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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

On 16.04.2024 08:42, Lucas De Marchi wrote:
> On Tue, Apr 16, 2024 at 10:56:13AM +0530, Vivekanandan, Balasubramani wrote:
> > On 15.04.2024 20:04, Lucas De Marchi wrote:
> > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > 
> > > Add a helper to update the runtime of an exec_queue accumulate it at 2
> > > places:
> > > 
> > > 1. when the exec_queue is destroyed
> > > 2. when the sched job is completed
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
> > >  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
> > >  4 files changed, 49 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 60ced5f90c2b..f6632b4d8399 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -553,6 +553,15 @@ struct xe_file {
> > >  		struct mutex lock;
> > >  	} exec_queue;
> > > 
> > > +	/**
> > > +	 * @runtime: hw engine class runtime in ticks for this drm client
> > > +	 *
> > > +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
> > > +	 * case, since all jobs run in parallel on the engines, only the stats
> > > +	 * from lrc[0] are sufficient.
> > > +	 */
> > > +	u64 runtime[XE_ENGINE_CLASS_MAX];
> > > +
> > >  	/** @client: drm client */
> > >  	struct xe_drm_client *client;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 71bd52dfebcf..c752d292fd33 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> > >  {
> > >  	int i;
> > > 
> > > +	xe_exec_queue_update_runtime(q);
> > > +
> > >  	for (i = 0; i < q->width; ++i)
> > >  		xe_lrc_finish(q->lrc + i);
> > >  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> > > @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> > >  		q->lrc[0].fence_ctx.next_seqno - 1;
> > >  }
> > > 
> > > +/**
> > > + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> > > + * @q: The exec queue
> > > + *
> > > + * Update the timestamp saved by HW for this exec queue and save runtime
> > > + * calculated by using the delta from last update. On multi-lrc case, only the
> > > + * first is considered.
> > > + */
> > > +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> > > +{
> > > +	struct xe_file *xef;
> > > +	struct xe_lrc *lrc;
> > > +	u32 old_ts, new_ts;
> > > +
> > > +	/*
> > > +	 * Jobs that are run during driver load may use an exec_queue, but are
> > > +	 * not associated with a user xe file, so avoid accumulating busyness
> > > +	 * for kernel specific work.
> > > +	 */
> > > +	if (!q->vm || !q->vm->xef)
> > > +		return;
> > > +
> > > +	xef = q->vm->xef;
> > > +	lrc = &q->lrc[0];
> > > +
> > > +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> > > +
> > > +	/*
> > > +	 * Special case the very first timestamp: we don't want the
> > > +	 * initial delta to be a huge value
> > > +	 */
> > > +	if (old_ts)
> > > +		xef->runtime[q->class] += new_ts - old_ts;
> > What is the need for accumulating the delta instead of using the
> > absolute timestamp read from CTX_TIMESTAMP?
> > This would break if xe_lrc_update_timestamp() is called from some
> > additional places in future. The delta would be incorrect.
> 
> can you clarify the breakage?
> 
> - CTX_TIMESTAMP is per context (or exec_queue if you want to use the sw
>   name)
> - Reported runtime is per client.
> - any update to xef->runtime[] should only ever be done by
>   xe_lrc_update_timestamp()
> 
> Anytime xe_lrc_update_timestamp() is called, it updates the timestamp,
> saves the new one in the lrc, and updates the delta in the xef. The
Everytime xe_lrc_update_timestamp() is invoked, it reads the
CTX_TIMESTAMP and caches it in lrc. The value in lrc is updated on every
invoke of xe_lrc_update_timestamp().
xe_exec_queue_update_runtime() is using the delta between the new value
from CTX_TIMESTAMP and the value stored in lrc. In this series,
xe_lrc_update_timestamp() is called only from
xe_exec_queue_update_runtime(). But there is nothing blocking from
xe_lrc_update_timestamp() being called from some other place in future.
In that case, the cached value in lrc would be updated by that
invocation outside of xe_exec_queue_update_runtime(). So the next time
xe_exec_queue_update_runtime() calls xe_lrc_update_timestamp(), it would
have lost a update.

> value in xef is the **runtime** for all the exec_queues created by that
> client, per engine class.
> 
> Note that we already call it from multiple places with this patch
No, xe_lrc_update_timestamp() is called only from
xe_exec_queue_update_runtime(). But it is xe_exec_queue_update_runtime()
which is called from multiple places.

Regards,
Bala

> series:
> 
> 1. when the exec_queue is destroyed
> 2. when the sched job is completed
> 3. when userspace queries the runtime
> 
> ... so I don't think I understood what would break.
> 
> Lucas De Marchi
