Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72375C83F37
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 19:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4184B10E6DC;
	Thu, 31 Aug 2023 19:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEBE10E6DC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693511725; x=1725047725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c6GTb7MiPtOLqZEvrYkfslfBimT/AH46KdqWMzw8nuM=;
 b=RuqZmYIE3HXZS+HEGYJ1j/Q8Q6gT6ak5DIWBqKtB6tyBlBGzLj4fv8l1
 Gb52VMrcY8knFMEosRBkCob/ZWRC8DRrr1a+z+jxqmRjHfHBDjYWPxQOQ
 JjIWyEK7LTuPHWEjg7BI0DDcZO4WFimMggvjRCb+5pXtTwXhYEw9oh0ZO
 5DGe9Kw5NZoQW/LVBnNaK7IeeIPXLW5j6ivZXrX5ZwIk3jYsQCF9KZKFO
 NqOsjMNu79XvMdOJu3pbox/ZjzZJXKDA9dJBFqT2tLZdEEUdeZ90M0L4N
 OpzLzhtZ5rJTTnJDQqqUqi4RphM5F+XaDqfuVDh0je520FEAt+psGeL79 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407042414"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="407042414"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986378271"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="986378271"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:55:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:55:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:55:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:55:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO2BT9lFICJOUnSveJ+ygRqg2TBwkyufB2XIg6tdSXbEHOPZgyLJ+xnkVa2GNdzfrUhPPODc0VNzYvnp2DYpaGhUtOiKleLNX/5Wrb+TANG/w1UeuHssjkK8ozpOzRtMsIb42+NtlHNfc8VLFz+BreVnqjrdF9rHqVCU8rkBwYKPO/CPu7Kxme/eFS9JYWzUu6sukxns/qf8x7sX+bC50jELXUiVpUPQrtS+YFE3tvTZGkXlHBOCbKAJnKRxYxKtYIIbbcjsSY3FWti6+4O52Qm7XZIJ0vFkeopNR+/9VR61OYINL4cu2XejbwO2GJuV5IG3UOTNpF1Z3h46SXQavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+9isY5VlW9I7sUT2vfq6vZ1hYmZ2MJ/z5z0A06XG5g=;
 b=oIjNfByi6RPnv7zzKqBOjCKXuDhX4sp85/zD3nNyufXieHXMdYkG62tWwmMf5VI0HmecboHjDFm6VDCsN2f6jJp9IAsRV80qVNUJG9tLwrJWEvGOybEf5gV0co1pZTVAZOSAeRb9kgSDmkFTWEHrqJUvjDR8lzLLvih9Ld2uh51Cubgvfj4puDkAQObZC297skvFP2ujvJVC4r61NWLGi7TImodsZOXXLMDXXYwSXnTGfhqs49CktsJ3jXCt+g5aHftXF3ZjTb9RfZVBlp6o+XhzG4uxh8rxjOEFr5GXlbcctfkQmXdxlGCkDPGNkZ1KZ6jMh7Dn9W9qhXxDemaymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 19:55:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:55:18 +0000
Date: Thu, 31 Aug 2023 15:55:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPDwIn4o0s1xlxXx@intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <ZORySgimMKjigx3E@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZORySgimMKjigx3E@fdugast-desk.home>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 962f045b-4bc2-4d14-79c7-08dbaa5c33ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqhO4lFdBN2XY5O4ffVIRZeMwHuifuT3tmuIecM55a8oN//ZutIrTyh2UIHaI2+A5ath1oykLNsw9CSNq6p4JaTlmzBV2J2CM3HU7atxbMwtFALFHEjMcdvoRfd1RyRCyjjG8Nd9/adAzh1EbsKSawLd9c5GCSV6rbEogBWmW1fX5FKas3HunFXAA+cCRI7IJ4tKcZOKwmVEgDaDNSUvfe3VFZ/ENbP/TL1v+HbkMEpBHz7nE9Ky3+H2Kv9pQzDe/kRDNwNyV2YJh0aYxuFHQ/xOQdWOoReL6/+rBjCSTiICb0HEuW037sOzIUpduv4kabsLydGOrlbIWQtd+7VmZ7+jeR4LN4cUm/t5QYlK0mVzOJIPfnbzlre/cTaDJR0Qn5KZMVldMpU5gzIoxZe4ErGwBQqSfZLGcfn7zrOxo0MpRdmE8C1UcJs5kd8tLJLbJyFmYgou04i80kanZklzaaTWgSbOKYYtKeiPr69xEzl27Yjt7fWnY/1nl+J0z0Bn9eKV3S4M/ax26tgaJ5xWZg1Mg82aqnkvXQW2VG1AfHw7MStOjnBiksvki9oKb0i8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(478600001)(26005)(2616005)(6486002)(6512007)(6506007)(6666004)(8936002)(82960400001)(8676002)(6862004)(2906002)(30864003)(4326008)(38100700002)(66476007)(5660300002)(316002)(66556008)(66946007)(6636002)(86362001)(36756003)(41300700001)(37006003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2W9B5e6WTMI5ldQ3WK8UOLRk17FOxDIWC9zxRX5wt/xO2rAkiaBSfugLT6FS?=
 =?us-ascii?Q?DEGRSmi8n5rY4iVqG/p/SkGuxPQh6iVqoQvNi1bwKgo5QguZoyKpN6E7NSDf?=
 =?us-ascii?Q?foGjRPUP1fFET/LJlCX0TgCKPzcB9OKgQgDPc37cc55ypvjWn54vflYht49A?=
 =?us-ascii?Q?Pb7dO6vFemCkNPXldzRWjokm9f8RQkZlGO1duAqGEAEbOpCyWIHexZ2nL/0t?=
 =?us-ascii?Q?C552wjjhrJ+WoKsuyzNYrdOZavF8FMDzjX/tLObyxDZRDLHPl9mOdK1Jvvj9?=
 =?us-ascii?Q?wYdTVN50RQg0tco+VZZeTNmd4gWckpwKH8U63joC+4ryMKeVZzlwAGG2YS71?=
 =?us-ascii?Q?aZGD6ZkCpGANLdg4HgwQTc4ad45yoeOMUYQ3laYdSfTEJYfelr9EI2aHvmsh?=
 =?us-ascii?Q?mB9tUl3hfQ8p7vu/QEkoDROY1ldiHT30eT6pLJfQTGdSsyoeR14MwgOJCMJk?=
 =?us-ascii?Q?A19FjFdbvLKTtE6sMAulvR2rUfoQSaelT2AoiKP1B65cm7C3ntJ2j9qzHXZL?=
 =?us-ascii?Q?JolPGnShIClEjN4Jq+ZBNN2L0/JiKNKhsy/TJmqtCTSfyTU577PBW4q5rsTr?=
 =?us-ascii?Q?4Z4w52kzNRipm1uAq2Lqrqy2oKzqty6qCRhvPT44wEwQuT0x8irh8urg1Z82?=
 =?us-ascii?Q?LI5Lrf3pVpigajbYWeFrkQzVfTTkv008W8aSnPpHEvaYCQuegHT1j8ySfKQP?=
 =?us-ascii?Q?219JUkQUk/NAM8MmaVroD+KufFKm3QbM2z6xOAV84+ePGxMzwX7qq9Is6Z8i?=
 =?us-ascii?Q?2ydvDemiNYV42qH+219sdW2ojiULr6tvkJcNeZldHFFa+jJ7NEWXPBfpxkUT?=
 =?us-ascii?Q?5glRWV5bBhrcCw/1hROaoZp6m6YgEvqr63HuWQ4o5a+4dUuXA4WU095KHalv?=
 =?us-ascii?Q?DvBa/RM9u+e24Wkvz9qLqLQouaN3/+G9ERtlJA1u9VFE0DfmCx3CFuWbMPhW?=
 =?us-ascii?Q?xMZnmx/cYpUMAJHPgb0TcOGZXJ61KbwrtOLGNgm7AxbN2s5sxfKDupuZjxlc?=
 =?us-ascii?Q?ikRSSUevHfmR1Lm/G5PG2Zpuzos+6k3r8PUEXimycqg9FAglkeG/JoBqrUbe?=
 =?us-ascii?Q?2N36o2pExq/f4yUlq5K1E8RSCYG5pd6UkJVzrZaDI2X+63wKcUVyVH0JVLcR?=
 =?us-ascii?Q?geXkXg+vKeXDNS8CWuWjI9X7wl13TaFulTWxoKzKVEmraTUnv+t+yQ3+LcVS?=
 =?us-ascii?Q?QBkIKg9KHU6bHSiIGjn5rJLKAIsFWlYcP7Z79S5+8LA+ZFEOkChr7zAnZFOT?=
 =?us-ascii?Q?0GRycO57slVZlMC/TuPGGAxktxlN8spg9HNk0Af3X/dj49PeiEf1Sc/lDj+q?=
 =?us-ascii?Q?V17a7xqBye2jj/NmCe6MYZA4pWPqTkjhDY1df4JCBANCcRmNWekA+MGm2WnJ?=
 =?us-ascii?Q?ArzZmMiQOWce+2+N/G5AhTMJ+aXI0pscH/Hjywxn9WzDS4qXa89+lfeI6fkv?=
 =?us-ascii?Q?HXIzmVBsmIv+aNNgvgZSs/S1oXE+iVRXwXGuCsKH6zb6Ih+Je0lj5u6v+IP/?=
 =?us-ascii?Q?Dwci12foosj+HVo42mcSoTQD0y7HEQCNhMuFjVNV6ZWyEHjw+4MPbittqez8?=
 =?us-ascii?Q?8BSBVeFQm0P6loNCXHBkCuVhsJnXXfRoIkAJ9satv5rJz0WInhf0ru0Dk1bU?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 962f045b-4bc2-4d14-79c7-08dbaa5c33ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:55:18.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58EoG7zCi2VsuruR7mGMdABt2qhts4orn3kBjaUOL/eCAazKDN6/HEyJ3BGzW3RZFUwXZeR1G5m9aBFz2ullgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

On Tue, Aug 22, 2023 at 10:31:06AM +0200, Francois Dugast wrote:
> Hi Ashutosh,
> 
> On Mon, Aug 07, 2023 at 06:31:50PM -0700, Ashutosh Dixit wrote:
> > OA uapi allows userspace to:
> > * Read streams of performance counters written by hardware
> > * Configure (and reconfigure) which sets of perf counters are captured as
> >   part of OA streams
> > * Configure other properties (such as format and periodicity) of such
> >   captures.
> > * Query associated parameters such as OA unit timestamp freq, oa_unit_id's
> >   for hw engines and OA ioctl version
> 
> Please document the uapi structures, not only their members. Also it would
> be nice to explicit somewhere what OA stands for, maybe in the commit
> message as well.

Besides that, we need true API like documentation with examples showing
how this is used. Please!

> 
> Francois
> 
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 257 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 256 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 86f16d50e9ccc..b4ab07c285245 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -111,6 +111,9 @@ struct xe_user_extension {
> >  #define DRM_XE_WAIT_USER_FENCE		0x0b
> >  #define DRM_XE_VM_MADVISE		0x0c
> >  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
> > +#define DRM_XE_OA_OPEN			0x36
> > +#define DRM_XE_OA_ADD_CONFIG		0x37
> > +#define DRM_XE_OA_REMOVE_CONFIG		0x38
> >  
> >  /* Must be kept compact -- no holes */
> >  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > @@ -127,6 +130,9 @@ struct xe_user_extension {
> >  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > +#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
> > +#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
> > +#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
> >  
> >  /**
> >   * enum drm_xe_memory_class - Supported memory classes.
> > @@ -261,7 +267,8 @@ struct drm_xe_query_config {
> >  #define XE_QUERY_CONFIG_GT_COUNT		4
> >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> > +#define XE_QUERY_OA_IOCTL_VERSION		7
> > +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
> >  	/** @info: array of elements containing the config info */
> >  	__u64 info[];
> >  };
> > @@ -298,6 +305,7 @@ struct drm_xe_query_gts {
> >  		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> >  		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> >  		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > +		__u64 oa_timestamp_freq;
> >  		__u64 reserved[8];
> >  	} gts[];
> >  };
> > @@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
> >  
> >  	__u16 engine_instance;
> >  	__u16 gt_id;
> > +	__u16 oa_unit_id;
> >  };
> >  
> >  struct drm_xe_exec_queue_create {
> > @@ -1056,6 +1065,252 @@ struct drm_xe_vm_madvise {
> >  	__u64 reserved[2];
> >  };
> >  
> > +enum drm_xe_oa_format {
> > +	XE_OA_FORMAT_C4_B8 = 7,
> > +
> > +	/* Gen8+ */
> > +	XE_OA_FORMAT_A12,
> > +	XE_OA_FORMAT_A12_B8_C8,
> > +	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
> > +
> > +	/* DG2 */
> > +	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
> > +	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
> > +
> > +	/* MTL OAM */
> > +	XE_OAM_FORMAT_MPEC8u64_B8_C8,
> > +	XE_OAM_FORMAT_MPEC8u32_B8_C8,
> > +
> > +	XE_OA_FORMAT_MAX	    /* non-ABI */
> > +};
> > +
> > +enum drm_xe_oa_property_id {
> > +	/**
> > +	 * Open the stream for a specific exec queue id (as used with
> > +	 * drm_xe_exec). A stream opened for a specific exec queue id this
> > +	 * way won't typically require root privileges.
> > +	 */
> > +	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
> > +
> > +	/**
> > +	 * A value of 1 requests the inclusion of raw OA unit reports as
> > +	 * part of stream samples.
> > +	 */
> > +	DRM_XE_OA_PROP_SAMPLE_OA,
> > +
> > +	/**
> > +	 * The value specifies which set of OA unit metrics should be
> > +	 * configured, defining the contents of any OA unit reports.
> > +	 */
> > +	DRM_XE_OA_PROP_OA_METRICS_SET,
> > +
> > +	/**
> > +	 * The value specifies the size and layout of OA unit reports.
> > +	 */
> > +	DRM_XE_OA_PROP_OA_FORMAT,
> > +
> > +	/**
> > +	 * Specifying this property implicitly requests periodic OA unit
> > +	 * sampling and (at least on Haswell) the sampling frequency is derived
> > +	 * from this exponent as follows:
> > +	 *
> > +	 *   80ns * 2^(period_exponent + 1)
> > +	 */
> > +	DRM_XE_OA_PROP_OA_EXPONENT,
> > +
> > +	/**
> > +	 * Specifying this property is only valid when specify a context to
> > +	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
> > +	 * will hold preemption of the particular engine we want to gather
> > +	 * performance data about.
> > +	 */
> > +	DRM_XE_OA_PROP_HOLD_PREEMPTION,
> > +
> > +	/**
> > +	 * Specifying this pins all contexts to the specified SSEU power
> > +	 * configuration for the duration of the recording.
> > +	 *
> > +	 * This parameter's value is a pointer to a struct
> > +	 * drm_xe_gem_context_param_sseu (TBD).
> > +	 */
> > +	DRM_XE_OA_PROP_GLOBAL_SSEU,
> > +
> > +	/**
> > +	 * This optional parameter specifies the timer interval in nanoseconds
> > +	 * at which the xe driver will check the OA buffer for available data.
> > +	 * Minimum allowed value is 100 microseconds. A default value is used by
> > +	 * the driver if this parameter is not specified. Note that larger timer
> > +	 * values will reduce cpu consumption during OA perf captures. However,
> > +	 * excessively large values would potentially result in OA buffer
> > +	 * overwrites as captures reach end of the OA buffer.
> > +	 */
> > +	DRM_XE_OA_PROP_POLL_OA_PERIOD,
> > +
> > +	/**
> > +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
> > +	 * identified by class:instance of any engine mapped to it.
> > +	 *
> > +	 * This parameter specifies the engine class and must be passed along
> > +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
> > +	 */
> > +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
> > +
> > +	/**
> > +	 * This parameter specifies the engine instance and must be passed along
> > +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
> > +	 */
> > +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
> > +
> > +	DRM_XE_OA_PROP_MAX /* non-ABI */
> > +};
> > +
> > +struct drm_xe_oa_open_param {
> > +	__u32 flags;
> > +#define XE_OA_FLAG_FD_CLOEXEC	BIT(0)
> > +#define XE_OA_FLAG_FD_NONBLOCK	BIT(1)
> > +#define XE_OA_FLAG_DISABLED	BIT(2)
> > +
> > +	/** The number of u64 (id, value) pairs */
> > +	__u32 num_properties;
> > +
> > +	/**
> > +	 * Pointer to array of u64 (id, value) pairs configuring the stream
> > +	 * to open.
> > +	 */
> > +	__u64 properties_ptr;
> > +};
> > +
> > +/*
> > + * Enable data capture for a stream that was either opened in a disabled state
> > + * via I915_PERF_FLAG_DISABLED or was later disabled via
> > + * I915_PERF_IOCTL_DISABLE.
> > + *
> > + * It is intended to be cheaper to disable and enable a stream than it may be
> > + * to close and re-open a stream with the same configuration.
> > + *
> > + * It's undefined whether any pending data for the stream will be lost.
> > + */
> > +#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
> > +
> > +/*
> > + * Disable data capture for a stream.
> > + *
> > + * It is an error to try and read a stream that is disabled.
> > + */
> > +#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
> > +
> > +/*
> > + * Change metrics_set captured by a stream.
> > + *
> > + * If the stream is bound to a specific context, the configuration change
> > + * will performed inline with that context such that it takes effect before
> > + * the next execbuf submission.
> > + *
> > + * Returns the previously bound metrics set id, or a negative error code.
> > + */
> > +#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
> > +
> > +struct drm_xe_oa_record_header {
> > +	__u32 type;
> > +	__u16 pad;
> > +	__u16 size;
> > +};
> > +
> > +enum drm_xe_oa_record_type {
> > +	/**
> > +	 * Samples are the work horse record type whose contents are
> > +	 * extensible and defined when opening an xe oa stream based on the
> > +	 * given properties.
> > +	 *
> > +	 * Boolean properties following the naming convention
> > +	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
> > +	 * every sample.
> > +	 *
> > +	 * The order of these sample properties given by userspace has no
> > +	 * affect on the ordering of data within a sample. The order is
> > +	 * documented here.
> > +	 *
> > +	 * struct {
> > +	 *     struct drm_xe_oa_record_header header;
> > +	 *
> > +	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
> > +	 * };
> > +	 */
> > +	DRM_XE_OA_RECORD_SAMPLE = 1,
> > +
> > +	/**
> > +	 * Indicates that one or more OA reports were not written by the
> > +	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
> > +	 * command collides with periodic sampling - which would be more likely
> > +	 * at higher sampling frequencies.
> > +	 */
> > +	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
> > +
> > +	/**
> > +	 * An error occurred that resulted in all pending OA reports being lost.
> > +	 */
> > +	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
> > +
> > +	DRM_XE_OA_RECORD_MAX /* non-ABI */
> > +};
> > +
> > +struct drm_xe_oa_config {
> > +	/**
> > +	 * @uuid:
> > +	 *
> > +	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
> > +	 */
> > +	char uuid[36];
> > +
> > +	/**
> > +	 * @n_mux_regs:
> > +	 *
> > +	 * Number of mux regs in &mux_regs_ptr.
> > +	 */
> > +	__u32 n_mux_regs;
> > +
> > +	/**
> > +	 * @n_boolean_regs:
> > +	 *
> > +	 * Number of boolean regs in &boolean_regs_ptr.
> > +	 */
> > +	__u32 n_boolean_regs;
> > +
> > +	/**
> > +	 * @n_flex_regs:
> > +	 *
> > +	 * Number of flex regs in &flex_regs_ptr.
> > +	 */
> > +	__u32 n_flex_regs;
> > +
> > +	/**
> > +	 * @mux_regs_ptr:
> > +	 *
> > +	 * Pointer to tuples of u32 values (register address, value) for mux
> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > +	 * &n_mux_regs).
> > +	 */
> > +	__u64 mux_regs_ptr;
> > +
> > +	/**
> > +	 * @boolean_regs_ptr:
> > +	 *
> > +	 * Pointer to tuples of u32 values (register address, value) for mux
> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > +	 * &n_boolean_regs).
> > +	 */
> > +	__u64 boolean_regs_ptr;
> > +
> > +	/**
> > +	 * @flex_regs_ptr:
> > +	 *
> > +	 * Pointer to tuples of u32 values (register address, value) for mux
> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > +	 * &n_flex_regs).
> > +	 */
> > +	__u64 flex_regs_ptr;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > -- 
> > 2.41.0
> > 
