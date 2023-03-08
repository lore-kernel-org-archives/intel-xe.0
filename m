Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA37C6FD19
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DEC10E740;
	Wed,  8 Mar 2023 22:16:57 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588B10E740
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678313816; x=1709849816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kf+6wWCZCmQ++bjbLEZQ3Tt842o86t5257/D+yKjt2o=;
 b=ZhQiZ8cxEuuQNqRNnTAdUdBO/J78m3GcNwdGmJgnK+UFijJSIdMNMLgA
 06h6JC2x03wOQXVpX22IY3a+JOiV7Ii2005L7D8tpHJQ1CpgTnKKp8g8g
 mJ34yEIPUUdCK/W2M5AOpVnT2fn/GTg1CzChyekNsrikyZNnM7xYi9qTA
 cqBkuN0v8tFEXFNw6evMqWx5xug2fs05T0Fcu5tbF0KRQzuYp4zZDJO/l
 kMue+hT6d/bck7Rfnmq8tQwHCApLfTGcepWORsrp6a1iUOaJNdX5JcZCz
 SRi/9LyMOb2ed+R36DKXlAQLTMJq248nd1izDSIgJiug3oWR4ZPwQRENJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422559453"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422559453"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820384508"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="820384508"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 14:16:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:16:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:16:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTfWXnYwJTFt/wG5NkNcTU4kpq4O1YUH6xku3tJMFx6GOrESqhHsYWShj4VHakRRNOfltBnUADTFq4zisqESYOthbM1fGEXen113LWdZVGjiESBKTd8KXq/DTwlzjFnhmLfrMuK25+Zj52l1Al7lE+8l9/Vx8cyt2r4unhhdwIWJ0F5i3A9cdEB0WwOCULUnNEt8lfPTm3AfaoIJo9+ToeI3MxIZX+TnXCD1LMvXILqR3cAwT48EaCkl5YwLtl+c2gQjPxRSXBBxeSYhQ+F2F/YJlwblhLBVBgQAMKtlJC55XKiQPDguIfvsnVw798oD2W0beKkUd+UwpR1ZhxX4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBFnOhiZwd5+iwKfivqaYZQrnbr1pukxWKplObiHzbQ=;
 b=SdE6MNBtTmxwIsXdM3ZQtSaTaxURxQqYtBBUaxb1UqbhVRwpf2cqe2mBv7ApQB/iVznrzWiLCWzmIREEZseBO7dwO2G8I/O95CHiqWYn71FbV3AiSOBx8sCASaihrkhok54U2JYDqK5e484KVgVeXkLqhPEw4jaiN30vu9gHALA0drpBGFyF2UQ3bNfpZrmwgsCigP+IONpZWX2jHLiPAptBVwTRcn4OzSyVhmZfRsr8fYL3/z9VMZiB9VPhmzQM0EL4vj3luayjFYp5UImckXGxkBjYbwoaD+pEvaGf6W1gyoEIT01tbWJnTY8rSgQSX51SSsEltln1kcy0c+6NDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Wed, 8 Mar
 2023 22:16:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:16:50 +0000
Date: Wed, 8 Mar 2023 14:16:48 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 141d8091-e147-41ca-c3a7-08db2022d094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z75R7ZzJdSWl8I4yT2BjUUlj7yZ3s9DgEiYMTxl01gfJ7XKskoCk4lr6ta1UB/4QU11PHpobvauQ6T8mT8zKFuW306fFTTNWeFVk6FMANs340J4Nge28XouFuVGI+n60BAZbYbGpum8w3h/1VZPM2+YA8lb6y9PMI1ePBVH0hPR5OAKEykwnbB+ZwUxoDFh7F7AX6X+uB+5yTRSWULoc+GD6EYLykyhrtmAuoI0Myrokh5pAXYLO30o75m+1qnZzhXM1mlXm3SgRuZ99pXXzixnPLTyDvnZQO/IKGIOhBn+z/p3YJ0DZknXKBKEiVNsr+HGCOfpS0CbQAxPVKVIaHlCG/2KbQL0sP7yXgUIqVWARZqDpLBlaH1mdXZU4ycJBFOAHyU46ez10PqCfHAVQFXRxGuMiAznMwMF6Ps0qjVHnjiJUUQtosRypkk9O4vrVE4YEC8tjSxYhqn+PEYyPb3HyA1LF1KFMM8OrNvMbUaRj/VJSbliEoMOXLh0JBQ8b49LcUqiZcYYr7dmfEEOPsJwkYpmr6VKH9SftnxlYP+eGkyf6FAGm5KUnSqau4PShLbTYpJwfdbgX7KV+qmVjWJ64cGT9jZBJkasFc9NmP85/A5KcFmZ73ZZryDWB3PGPxZvDWzlzNrWr7WD6agWWGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199018)(36756003)(83380400001)(82960400001)(6512007)(186003)(1076003)(26005)(6506007)(9686003)(6486002)(5660300002)(6862004)(66946007)(8676002)(4326008)(66476007)(66556008)(8936002)(86362001)(2906002)(41300700001)(38100700002)(316002)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TrLKpls+3EVrQNnFU/j9xcL21zV7VVcWi6PkNH0q4J6ly5Mpde6ZbY+2q4aA?=
 =?us-ascii?Q?cNoPd5s0/1a9EM08fjVt1h55voh/cZONA1VknCo7vH0yx1IZUHRZ6GiB+N90?=
 =?us-ascii?Q?F2uRnINDkTMbgKmi+opEoRlzb7mUI3eINI7IWnn+LFU83J17zspYL2f292af?=
 =?us-ascii?Q?mSiz8yJnTzcuNkaFqHD7ozkcYgZOZl0i/ZO6tSwbN6bom0W25QaBVYxomkxl?=
 =?us-ascii?Q?gexnY96yMbZGRWSV2PFhN7euI6230x7dQIApIucVoHLVBIar3Gbe5CNVrami?=
 =?us-ascii?Q?52sLvCFgq16PA9PsLlt22F4k3L+mWMrtT4igw8Wx5ZpLPcg1Z9PgyIK4XILY?=
 =?us-ascii?Q?S6qP5OMxqkcmCopF55kWS6fmxAXkpsbUWGOkRIz0ro29LL6WHHRFJgqeywLE?=
 =?us-ascii?Q?9syRSBNswEHGk/pSh1H+cyXyeZjqO190u6RO76a1Ts2X0DL1vkLXUk8i3c3l?=
 =?us-ascii?Q?w2n4e+b0+obvNCwfBtBGdaaNS8/CSi3AwRyjsvccwlwdCntKQyb0ywj7TRyp?=
 =?us-ascii?Q?injZn9NaqlRvvBZkIGo96bWCIGHES6E4L/MSXfwPanwfRTdpErK3kmVB+EQa?=
 =?us-ascii?Q?hHfyrhHHF2Uv+Gid+nS/SvjAJeLdHJ2hHUMC6c0a7RsjoZ7xjq7AN/Dps23V?=
 =?us-ascii?Q?IB9jfS5x0vFRTntH7D5By6rrEa5srXdfvD7ksl2Dxd4fBaEM8Kdf94OHWDnE?=
 =?us-ascii?Q?MIuxeHzCosf1z76x+wJSrvdlt2bQkuQ9d0cwmXo5X01ud0HSP7wf102qWovv?=
 =?us-ascii?Q?pqZqM4/wLkE2ApgHtQRqvXWqHS1EgnjUF9L0R/jnls/iPdPDEb8b1Z021hg1?=
 =?us-ascii?Q?Btq1nt4WwogC90B0VDhD7zv5MDsRHq7/UnPSbGi058B+6lMHLT0DxChvS+pr?=
 =?us-ascii?Q?QVAsKLroJII9FtgPM9nLL8tDG+vgT5BIZVEgWe3AnpdD8oXNw2xKi5jtDwBI?=
 =?us-ascii?Q?F72EIjnWPKkBrMJMEC9gMHLxfStAo8sP11jckbHVhEle2v9RbjY8X9NZnCos?=
 =?us-ascii?Q?oUfS54oW+RJxDmLWvnvMnXKiHac/fkUYuUIpLjWXDTuXuL0KyfFrKCZsLqLk?=
 =?us-ascii?Q?Rpl0sO3Fm/ePgsU8wH58IrxQ21FZoriwVCviIpvsnc918PPxLUptCyGjGuyH?=
 =?us-ascii?Q?mJxyJjo4zur9O7gFr5dqFbJ7p5Zd+T8FjbkxFyKZTKnSpoqirVolhHGepkpg?=
 =?us-ascii?Q?Hka/5u49pBb1FKh0lWCPNw2GKiLWaeeHcKMFulniJjtWiBnwzta2Xq/LEqb6?=
 =?us-ascii?Q?NGAUOcE6PP8l4W8xM+Zt7+91oeZRMYdI62ItZM6ySP71+T0pg7oed4EcwMHa?=
 =?us-ascii?Q?tOtKmvTTjTMRNCxgz+zvbsuSSobSManekoXTP5UNM1/bszx2Rnl01BWOURkN?=
 =?us-ascii?Q?owCIz2cedgIA4/QHIZjq0+T2Tfx9GVaWonf49WrfJH1gmTxnYspGJ9nFrfgh?=
 =?us-ascii?Q?OhcJmdQd4Tlcc4v3LwgnS7WkScH6NZ4OafIr2xrPGNruAadvH3gxC1vcmPWv?=
 =?us-ascii?Q?uIcI8hhpSMCgU8uFIJVILKdcBQFAk+dhlZW3i7coljvTlxoQ/V1DOTRwGts+?=
 =?us-ascii?Q?/s261xB5K4v8pX/5ZFCp1OWDnVOzJMMvZggi3Mr/f+/QWrRMuXTJNkrtR9XJ?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 141d8091-e147-41ca-c3a7-08db2022d094
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:16:50.5162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtwm04OSDXbUrkbbgbdqcNt1Jl5cISviSr+cpoH0zUpwG+az2F3q+bpZ6aQo9RGJrPEkR1yEX7dFbwOMlfgjR/2paYkeyEx115HADqGvkPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
>> This is already used in intel_gt_mcr and will be used in workarounds.
>> Add helpers so the platform-dependency is in a single place.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
>>  drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>>  3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index a42061c4b9d2..694a79b40ec0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
>>  {
>>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
>>
>>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 967f2349c67a..9fe06a46a400 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>
>>  }
>>
>> +unsigned int
>> +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
>
>When this shows up as a general interface, it leaves me wondering what a
>"group" is.  The rules for DSS steering happen to use gslices on Xe_HP
>platforms and cslices on Xe_HPC platforms, but that's just the
>platform-specific rules of steering and doesn't automatically translate
>into which type of slice would be appropriate to use as a grouping
>elsewhere in the driver.

humn... maybe I myself didn't understand the group meaning here.
is group a generic term for cslice/gslice?

>
>I don't see this new function being used yet in the other patches of
>this series, so I'm not sure exactly which workaround(s) plan to re-use

it was supposed to be
"[PATCH 07/19] drm/xe/rtp: Add match helper for gslice fused off", but
then I forgot to replace the hardcoded
`gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;` by a call to this
function.


Lucas De Marchi

>it.  But likely we at least need some kind of clarifying rename for this
>function, otherwise it's probably going to get re-used incorrectly
>elsewhere in the driver.
>
>
>Matt
>
>> +{
>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>>  /*
>>   * Used to obtain the index of the first DSS.  Can start searching from the
>>   * beginning of a specific dss group (e.g., gslice, cslice, etc.) if
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>> index 2375f005e0c8..cf8f75a4c7dd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>> @@ -14,6 +14,9 @@ void xe_gt_topology_init(struct xe_gt *gt);
>>
>>  void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>>
>> +unsigned int
>> +xe_gt_topology_get_dss_per_group(struct xe_gt *gt);
>> +
>>  unsigned int
>>  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>>
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
