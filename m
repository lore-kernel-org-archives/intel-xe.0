Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E9EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 22:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422BF10E117;
	Thu,  6 Jul 2023 22:49:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099610E117
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 22:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688683742; x=1720219742;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YJMtUbFlWCOHMRoZnspPSLgA+tPoEOElWUqlhyOiq3k=;
 b=M0EXamrpVb31KSfEIsVrMUDWPKHJ3ZMk9EEZAOpmMlnIpiIyGDarN4f0
 Jf1rrFC9PDQywle+lSxSpndtJeLthmYZ/3Fm6uP8HCb4ZiVpLOCs8rgik
 /mu0MuBK1mxiYdN9J4yJNk691PU2VPf1k9BwuOSGOzwTVoPXOLh2FF21m
 tWG2lY90Yg/J4ABpq5nKDJ7qYUyaEIXQSPtGXT6M3qf/WoPoQC3sRiyMe
 l98CNocxaFmPN/War7CXYOCdqoEjABbSlob0PLKoM5CexMazPRAar8KyA
 jO4H3yGvvlkV4WvabTE+O+GfW0FfTlxybycFSk3m09pvi1tjeDI+Tp8SC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363782000"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="363782000"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 15:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="789725811"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="789725811"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2023 15:49:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 15:49:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 15:48:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 15:48:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 15:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK8NXS6T0NETnj8j7WnxhR59H+086a9EVnq23pfqr8PR8YERmZuCnU4MvWrp2YAZv7KM3zTkYoR1Y7ItmAj0ELIWYnNe15Gv8HTE9+GAEWMp9IC+wmR/V9XJl3hUARse/AT4N0cPEB7icc+rEnvzD02K7jaoO+tr88HoOcAikZ1Z/zDh+9c2Gj8F0pams+1wnUln2FHOdAfglXEc5m585CErWikNj/lK/X39UztMc0jxZqZ6abJzTkGuuTkg7Q8nrL9NVPe78ds4EmetcUEoUx0mRNwrszcZN9yHgSjR1NyuQ9vSBdQuNMTe3dElRRkAMVLVO+alaDpy5iI89MEccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fObLAS882/iaLsc8ecUgZLI6Y20dvXz14Qpy6idSJvc=;
 b=DEPEf4tV1UMkSnR3tvh/73mqi75f6i8gBOWUdO1HamhntWFflhfV1P/7c+FicSx4Kfh6gF/F1VsdOsrG2vPAIu3fYWnxtJsQaDdho9ni035ohxJvw9y1mgZLOBIWDUl0IY9dXTEmYiT/jKSo6r2kZ4xYFOxUU2HFVxQBPcJW65FG/owE3yMCUhVF3gOVWi3GUtt9a1RUkFQPbuTzAVAX0dyJrGgEgvyO3Hu83OG7rSgSJ1sfg7DciJ5kLe2rHqM3vdOilgOamrYCsSk40CU0ZAUkvopMwz5ViI/A1iDG4pHH1WUTaN7XIn1INxpOSKgm68zzDwGW3Fft9q0gs1++HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5614.namprd11.prod.outlook.com (2603:10b6:a03:300::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:48:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 22:48:55 +0000
Date: Thu, 6 Jul 2023 15:48:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230706224852.GG5433@mdroper-desk1.amr.corp.intel.com>
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
 <20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com>
 <de824fda-e72c-3fbf-6be1-e42ce05b916b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de824fda-e72c-3fbf-6be1-e42ce05b916b@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b990ac-576e-45ac-f714-08db7e732d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQ5HLZNS3s551C0cP+Nck/k+YKGF2fcjYwK6msE9vjsfs+kvDFeoI6N/DsFBgzZlOTw2cWk7SWfjayNFTqfvEIbIT/AlsMsqXJsWEbypvWVMCeuzaWaohd3Fr+hK09jgEn8Y2jtep5OB+AVffCuIZdQV94rNlXonF8B/M1PE1+LdGpuyN1X9I/VhEEXP+ipaoDKXxUC4zoPKqBSSNtJJFtNt8eZLonPBE+aiD9YqU/GsBFsENbO2g6256xCe/yv0Mq6+pee/J68aGrdiJK9XtBIvV2cMtR5kBp36D3ZicUB8DArPH9i49yLsa094Fd7j0UCTA37jW/7T8RULixmlKxbodadPRRuKpKWQvubvswqAGnaoCMTtKkfhtkpJj2cn2U7a01WEmRkm4YZFZQbjccS9+UC4Tet3OnXe/9kRHJgvuWLJ9DZYg8UIv6QfIf3szbIEj3E5/gdQSdQ7HTPimTZVbytKpwIlpjcGQyK+zl377Qux0gvcSq/eT6sfu2fMUt/giaWc3OmhqsTvRtvDKytov/llvlypFqbG01Roefc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(6486002)(6666004)(6506007)(26005)(1076003)(186003)(6512007)(2906002)(316002)(6916009)(4326008)(5660300002)(66556008)(41300700001)(66476007)(8936002)(8676002)(38100700002)(82960400001)(66946007)(86362001)(33656002)(83380400001)(66574015)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QEWVhJ1fMIMC31DvgMCOi1AZPqi68IJtVaxRbpUGxHI27OxtnYSI+BK2K+?=
 =?iso-8859-1?Q?LkjNp3vcw1j31gjBdegPUmaBR3lF160JnWXn2oFx42BOO6spYk4U+wb8OJ?=
 =?iso-8859-1?Q?jYdHlokvNVhehYaDLWsDADOk6wGox4jHJQunuaqnp/I0QY7CVvSinhGJ3u?=
 =?iso-8859-1?Q?2NeIEWY/EZ0WnXD+uhnjnH0NHWthcq1iNSUqXYPWa2SKO7cIw3WzJVq66A?=
 =?iso-8859-1?Q?0EmImtTDX+9scSnJRRz34KIfpCeHpYvWEk9IBrowwcNlRtD1v/sSefx5e7?=
 =?iso-8859-1?Q?2kXubHndOvXUdMoHZxI7Hr2FgTU7uBGoj06qdkQTgekZHzd5GD7RM3iV5U?=
 =?iso-8859-1?Q?3Nq7i6kLmQp4Phxr1PoEERQ8pMAgiCHjuebmsqR2B1Kl9oE+enQ+PN6ypj?=
 =?iso-8859-1?Q?T2eoOxx4LKVkPpKlw1Vv+DAPre3qeFB1avRwoHBwOU8VOd2cOCnauyKnVX?=
 =?iso-8859-1?Q?vkoYu6hwFCM/CoXnkUzL2ha2vP9RRFht3viOPCDmRzLU68bY31qFB2AzQF?=
 =?iso-8859-1?Q?PfRfhlzvkXsMVyl1G8sBGTGgqkwy8p2mI1rllItmWLcG0n5ZSpLS3KRadZ?=
 =?iso-8859-1?Q?g4GtMnr03FfeuHjAeBzReUAhqpzqptdr3+uf1o8CzxPYzoT2k5FBIFZJl4?=
 =?iso-8859-1?Q?P5Ogdr9VYVHnE+tfTuOOuY+y9gnEPw/HWDajqTDzPABLWESeEqm3Y4wKWa?=
 =?iso-8859-1?Q?iWACH8jGt/OLpXTlx7xbB0SGXhqEPCYl+NApxoQwsZSj3EEONgbdYtrbbq?=
 =?iso-8859-1?Q?vcuP0uGFYVhTkiXMhHknxKpTZmUj/RL50aiPjvLSQQ3+TDxRBP8UDNPNLy?=
 =?iso-8859-1?Q?REdCfcpdRVY6BZX021Eqrv4fQom+qO9FnoIDXZG+aFhkx1oDpqqYdbf2ok?=
 =?iso-8859-1?Q?Tj/1hjOjkHz4xMzi1AdEHvJPz38jNanX4aobnqaA9pIB2qvIVb57X7PCrh?=
 =?iso-8859-1?Q?82GS07JQlAEIhuyeCBcloh1GiUDU/648BlhJxr6/T7t0emnIt0X5eAOz0g?=
 =?iso-8859-1?Q?j/bMaSToUEclVCTAayY0gOl8ZRzz6fwPW3l9RILyZE957iWUWISK9o+tMr?=
 =?iso-8859-1?Q?ryAqi/cONAmx8rvjq+DHJ8F2wVY6i6xBGhq48yUaE/Ndyykc8vZghISbhQ?=
 =?iso-8859-1?Q?3RWVKQklkKRxH5LR4P0w/0TsW6/sXu9iyWj2qZPkRJOmZ8B/sRY8FzvQWy?=
 =?iso-8859-1?Q?hAnA4mEeFFJ1IYpIc8OUKFsgcr28Ji7PWarDKwqMsWkV1TeOZPzVYxmaT2?=
 =?iso-8859-1?Q?wwmqcparX7TpFJI9c+PyKCUT61cPYTDhy6ZS8agJsKU3MWrFrSfiYk9VDw?=
 =?iso-8859-1?Q?OwtjJYm+01VACV5P2dhUmhzcg04XLCQLEzoTCN8Wi/KdPDGwWsKXdb6U+R?=
 =?iso-8859-1?Q?o3WnkJOUDpac5HBLrD5aNvQNbItLUhXhk1zPb8Fw5eKzMynoqF8Bx9xd5A?=
 =?iso-8859-1?Q?E6tGt011dK1ekpS261BDfoLJDc5SYFNK0ZrKBgq1PWVUuy9Gyv1ah0jeTT?=
 =?iso-8859-1?Q?NOHxXq4MEd8O8ZC00goDlJaIGbLSd3D+zapw5KY7WjPNPjG7kzX4qgpj7Q?=
 =?iso-8859-1?Q?Y8Y8AlCSNDGjTS8zJk550e/1ZsLW69dE4rhdrMo5nbU5sSkSymdqVo789O?=
 =?iso-8859-1?Q?C8vA9nRqmCpX9QaPHn/Ew1g3AYWu1+dnViJW6sY7uXc0z7xznE1v0Z1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b990ac-576e-45ac-f714-08db7e732d55
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:48:55.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPspKN4epPUTbLz2lcJGKgZcUU4B8GIj3eVSF61kPigT5wKchFjA2LO9IgtdvWLjtIW6Qe/9myM6DTxeD1JKpT4Me6PBofPrK5UNTXpgWOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5614
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
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

On Thu, Jul 06, 2023 at 08:14:52AM +0200, Thomas Hellström wrote:
...
> > > +	/** @num_gt: number of GTs returned in gts */
> > > +	__u32 num_gt;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/**
> > > +	 * @gts: The GTs returned for this device
> > > +	 *
> > > +	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > > +	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> > > +	 * bandwidth between this GT and remote region?
> > > +	 */
> > > +	struct drm_xe_query_gt {
> > > +#define XE_QUERY_GT_TYPE_MAIN		0
> > > +#define XE_QUERY_GT_TYPE_REMOTE		1
> > Once tiles get properly exposed through the uapi and there's a way to
> > determine which GTs belong to which tiles, TYPE_REMOTE should probably
> > go away.  Within any given tile, the GTs would just be of types
> > TYPE_MAIN and TYPE_MEDIA.  The "main" GT on remote tiles isn't
> > functionally any different than the "main" GT on the root tile.
> Do we need to expose the GT to user-space through the ioctl interface at
> all? Assuming that we could add the engine info of all GTs to the tile, is
> there something else in the ioctl that needs to be per-gt-specific. I
> learned that in sysfs interface there is. Does the same thing hold here?

Sorry, I missed this question on my other reply.  I think the main
GT-centric things that userspace cares about today are:

 * Power management stuff (clock frequencies, sleep states like RC6,
   etc.).  Most of this gets queried/modified via filesystem interface
   rather than through ioctls, although I do see "__u32 clock_freq" in
   the structure below...I'm not sure if any userspace truly needs that
   or not given that they should be able to get the same info from sysfs
   I think.

 * Topology/fusing of the programmable graphics units (DSS / EU).  On
   current platforms these masks always wind up being 0 for the media
   GT, so there isn't too much benefit to being able to query primary GT
   and media GT separately and we could theoretically just query these
   at the tile level with the understanding that the value returned
   always applies to the tile's primary GT.  But that makes me a bit
   nervous since it would be possible for hardware architecture to
   change and for some level of programmable hardware to be added to the
   media GT in the future, and then we'd be a bit stuck without a good
   way to separate the values for each GT.


Matt

> > > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > > +		__u16 type;
> > > +		__u16 instance;
> > We need to decide (and then document) whether this should stay a
> > device-wide instance number, or whether we want this to become a
> > per-tile instance number instead.
> > 
> > > +		__u32 clock_freq;
> > > +		__u64 features;
> > What is this one for?  As far as I can see it's not actually set/used yet.
> > 
> > > +		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > +		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> > > +		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > +		__u64 reserved[8];
> > > +	} gts[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_topology_mask - describe the topology mask of a GT
> > > + *
> > > + * This is the hardware topology which reflects the internal physical
> > > + * structure of the GPU.
> > > + *
> > > + * If a query is made with a struct drm_xe_device_query where .query
> > > + * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
> > > + * struct drm_xe_query_topology_mask in .data.
> > > + */
> > > +struct drm_xe_query_topology_mask {
> > > +	/** @gt_id: GT ID the mask is associated with */
> > > +	__u16 gt_id;
> > > +
> > > +	/*
> > > +	 * To query the mask of Dual Sub Slices (DSS) available for geometry
> > > +	 * operations. For example a query response containing the following
> > > +	 * in mask:
> > > +	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
> > > +	 * means 32 DSS are available for geometry.
> > > +	 */
> > > +#define XE_TOPO_DSS_GEOMETRY	(1 << 0)
> > > +	/*
> > > +	 * To query the mask of Dual Sub Slices (DSS) available for compute
> > > +	 * operations. For example a query response containing the following
> > > +	 * in mask:
> > > +	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
> > > +	 * means 32 DSS are available for compute.
> > > +	 */
> > > +#define XE_TOPO_DSS_COMPUTE	(1 << 1)
> > > +	/*
> > > +	 * To query the mask of Execution Units (EU) available per Dual Sub
> > > +	 * Slices (DSS). For example a query response containing the following
> > > +	 * in mask:
> > > +	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
> > > +	 * means each DSS has 16 EU.
> > > +	 */
> > > +#define XE_TOPO_EU_PER_DSS	(1 << 2)
> > > +	/** @type: type of mask */
> > > +	__u16 type;
> > > +
> > > +	/** @num_bytes: number of bytes in requested mask */
> > > +	__u32 num_bytes;
> > > +
> > > +	/** @mask: little-endian mask of @num_bytes */
> > > +	__u8 mask[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_device_query - main structure to query device information
> > > + *
> > > + * If size is set to 0, the driver fills it with the required size for the
> > > + * requested type of data to query. If size is equal to the required size,
> > > + * the queried information is copied into data.
> > > + *
> > > + * For example the following code snippet allows retrieving and printing
> > > + * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
> > > + *
> > > + * .. code-block:: C
> > > + *
> > > + *	struct drm_xe_engine_class_instance *hwe;
> > > + *	struct drm_xe_device_query query = {
> > > + *		.extensions = 0,
> > > + *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
> > > + *		.size = 0,
> > > + *		.data = 0,
> > > + *	};
> > > + *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> > > + *	hwe = malloc(query.size);
> > > + *	query.data = (uintptr_t)hwe;
> > > + *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> > > + *	int num_engines = query.size / sizeof(*hwe);
> > > + *	for (int i = 0; i < num_engines; i++) {
> > > + *		printf("Engine %d: %s\n", i,
> > > + *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
> > > + *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
> > > + *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
> > > + *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
> > > + *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
> > > + *			"UNKNOWN");
> > > + *	}
> > > + *	free(hwe);
> > > + */
> > > +struct drm_xe_device_query {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_DEVICE_QUERY_ENGINES	0
> > > +#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
> > > +#define DRM_XE_DEVICE_QUERY_CONFIG	2
> > > +#define DRM_XE_DEVICE_QUERY_GTS		3
> > > +#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> > > +#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
> > > +	/** @query: The type of data to query */
> > > +	__u32 query;
> > > +
> > > +	/** @size: Size of the queried data */
> > > +	__u32 size;
> > > +
> > > +	/** @data: Queried data is placed here */
> > > +	__u64 data;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_gem_create {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/**
> > > +	 * @size: Requested size for the object
> > > +	 *
> > > +	 * The (page-aligned) allocated size for the object will be returned.
> > > +	 */
> > > +	__u64 size;
> > > +
> > > +#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
> > > +#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> > I think I asked a while back, but is marking an object as scanout at
> > creation time even reasonable?  I think there are a lot of real-world
> > setups where a render/media client allocates a buffer, generates content
> > into it, and then hands it over to a compositor for display.  Even the
> > compositor itself may not necessarily know up front whether it will make
> > sense to flip that buffer directly onto a display plane for scanout, or
> > whether to use it as a source texture when compositing surfaces into a
> > different scanout buffer.  It seems like to be safe, any kind of render
> > target on the client side is going to have to get marked as SCANOUT,
> > even though chances are it will never actually get used that way in the
> > end.  Pretty much only internal, non-shared objects would be able to
> > skip the SCANOUT flag.
> 
> It sounds like consensus is this is doable. I think there has been
> discussions with mesa, acking this. Also Joonas and Ron Silvas agreeing on
> this approach.
> 
> > 
> > > +	/**
> > > +	 * @flags: Flags, currently a mask of memory instances of where BO can
> > > +	 * be placed
> > > +	 */
> > > +	__u32 flags;
> > > +
> > > +	/**
> > > +	 * @vm_id: Attached VM, if any
> > > +	 *
> > > +	 * If a VM is specified, this BO must:
> > > +	 *
> > > +	 *  1. Only ever be bound to that VM.
> > > +	 *
> > > +	 *  2. Cannot be exported as a PRIME fd.
> > > +	 */
> > > +	__u32 vm_id;
> > > +
> > > +	/**
> > > +	 * @handle: Returned handle for the object.
> > > +	 *
> > > +	 * Object handles are nonzero.
> > > +	 */
> > > +	__u32 handle;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_gem_mmap_offset {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @handle: Handle for the object being mapped. */
> > > +	__u32 handle;
> > > +
> > > +	/** @flags: Must be zero */
> > > +	__u32 flags;
> > > +
> > > +	/** @offset: The fake offset to use for subsequent mmap call */
> > > +	__u64 offset;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
> > > + */
> > > +struct drm_xe_vm_bind_op_error_capture {
> > > +	/** @error: errno that occured */
> > > +	__s32 error;
> > > +
> > > +	/** @op: operation that encounter an error */
> > > +	__u32 op;
> > > +
> > > +	/** @addr: address of bind op */
> > > +	__u64 addr;
> > > +
> > > +	/** @size: size of bind */
> > > +	__u64 size;
> > > +};
> > > +
> > > +/** struct drm_xe_ext_vm_set_property - VM set property extension */
> > > +struct drm_xe_ext_vm_set_property {
> > > +	/** @base: base user extension */
> > > +	struct xe_user_extension base;
> > > +
> > > +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_create {
> > > +#define XE_VM_EXTENSION_SET_PROPERTY	0
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> > > +#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> > > +#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
> > > +#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
> > > +	/** @flags: Flags */
> > > +	__u32 flags;
> > > +
> > > +	/** @vm_id: Returned VM ID */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_destroy {
> > > +	/** @vm_id: VM ID */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_bind_op {
> > > +	/**
> > > +	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
> > > +	 */
> > > +	__u32 obj;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		/**
> > > +		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
> > > +		 * ignored for unbind
> > > +		 */
> > > +		__u64 obj_offset;
> > > +
> > > +		/** @userptr: user pointer to bind on */
> > > +		__u64 userptr;
> > > +	};
> > > +
> > > +	/**
> > > +	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
> > > +	 */
> > > +	__u64 range;
> > > +
> > > +	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
> > > +	__u64 addr;
> > > +
> > > +	/**
> > > +	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
> > > +	 * only applies to creating new VMAs
> > > +	 */
> > > +	__u64 tile_mask;
> > > +
> > > +#define XE_VM_BIND_OP_MAP		0x0
> > > +#define XE_VM_BIND_OP_UNMAP		0x1
> > > +#define XE_VM_BIND_OP_MAP_USERPTR	0x2
> > > +#define XE_VM_BIND_OP_RESTART		0x3
> > > +#define XE_VM_BIND_OP_UNMAP_ALL		0x4
> > > +#define XE_VM_BIND_OP_PREFETCH		0x5
> > > +
> > > +#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
> > > +	/*
> > > +	 * A bind ops completions are always async, hence the support for out
> > > +	 * sync. This flag indicates the allocation of the memory for new page
> > > +	 * tables and the job to program the pages tables is asynchronous
> > > +	 * relative to the IOCTL. That part of a bind operation can fail under
> > > +	 * memory pressure, the job in practice can't fail unless the system is
> > > +	 * totally shot.
> > > +	 *
> > > +	 * If this flag is clear and the IOCTL doesn't return an error, in
> > > +	 * practice the bind op is good and will complete.
> > > +	 *
> > > +	 * If this flag is set and doesn't return an error, the bind op can
> > > +	 * still fail and recovery is needed. If configured, the bind op that
> > > +	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
> > > +	 * Once the user sees the error (via a ufence +
> > > +	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> > > +	 * via non-async unbinds, and then restart all queue'd async binds op via
> > > +	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
> > > +	 * VM.
> > > +	 *
> > > +	 * This flag is only allowed when DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
> > > +	 * configured in the VM and must be set if the VM is configured with
> > > +	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
> > > +	/*
> > > +	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > > +	 * than differing the MAP to the page fault handler.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> > > +	/*
> > > +	 * When the NULL flag is set, the page tables are setup with a special
> > > +	 * bit which indicates writes are dropped and all reads return zero.  In
> > > +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
> > > +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> > > +	 * intended to implement VK sparse bindings.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> > > +	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> > > +	__u32 op;
> > > +
> > > +	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> > > +	__u32 region;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_bind {
> > Should there be a field in here to allow userspace to specify which PAT
> > index corresponds to the behavior (caching, coherency, CLOS, etc.) they
> > want on this binding?  The PAT should be a characteristic of the bind
> > rather than of the underlying object, right?
> Yes, given certain immutable restrictions given at buffer-object create
> time; For example the CPU caching mode will restrict the coherency mode used
> in PAT, and CPU caching mode needs to be specified at bo create time. The
> current suggestion is therefore that coherency mode also needs to be
> specified at bo create time, a slightly stricter limitation on the available
> PAT indices at VM_BIND time. Whether we want to include PAT in the main
> struct or as an extension hasn't been decided yet.
> > 
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: The ID of the VM to bind to */
> > > +	__u32 vm_id;
> > > +
> > > +	/**
> > > +	 * @engine_id: engine_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
> > > +	 * and engine must have same vm_id. If zero, the default VM bind engine
> > > +	 * is used.
> > > +	 */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @num_binds: number of binds in this IOCTL */
> > > +	__u32 num_binds;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		/** @bind: used if num_binds == 1 */
> > > +		struct drm_xe_vm_bind_op bind;
> > > +
> > > +		/**
> > > +		 * @vector_of_binds: userptr to array of struct
> > > +		 * drm_xe_vm_bind_op if num_binds > 1
> > > +		 */
> > > +		__u64 vector_of_binds;
> > > +	};
> > > +
> > > +	/** @num_syncs: amount of syncs to wait on */
> > > +	__u32 num_syncs;
> > > +
> > > +	/** @pad2: MBZ */
> > > +	__u32 pad2;
> > > +
> > > +	/** @syncs: pointer to struct drm_xe_sync array */
> > > +	__u64 syncs;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/** struct drm_xe_ext_engine_set_property - engine set property extension */
> > > +struct drm_xe_ext_engine_set_property {
> > > +	/** @base: base user extension */
> > > +	struct xe_user_extension base;
> > > +
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_engine_set_property - engine set property
> > > + *
> > > + * Same namespace for extensions as drm_xe_engine_create
> > > + */
> > > +struct drm_xe_engine_set_property {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +#define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> > > +#define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> > > +#define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > > +	/*
> > > +	 * Long running or ULLS engine mode. DMA fences not allowed in this
> > > +	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> > > +	 * as a sanity check the UMD knows what it is doing. Can only be set at
> > > +	 * engine create time.
> > > +	 */
> > > +#define XE_ENGINE_SET_PROPERTY_COMPUTE_MODE		3
> > > +#define XE_ENGINE_SET_PROPERTY_PERSISTENCE		4
> > > +#define XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT		5
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/** struct drm_xe_engine_class_instance - instance of an engine class */
> > > +struct drm_xe_engine_class_instance {
> > > +#define DRM_XE_ENGINE_CLASS_RENDER		0
> > > +#define DRM_XE_ENGINE_CLASS_COPY		1
> > > +#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> > > +#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> > > +#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> > > +	/*
> > > +	 * Kernel only class (not actual hardware engine class). Used for
> > > +	 * creating ordered queues of VM bind operations.
> > > +	 */
> > > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > > +	__u16 engine_class;
> > > +
> > > +	__u16 engine_instance;
> > > +	__u16 gt_id;
> > > +};
> > > +
> > > +struct drm_xe_engine_create {
> > > +#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @width: submission width (number BB per exec) for this engine */
> > > +	__u16 width;
> > > +
> > > +	/** @num_placements: number of valid placements for this engine */
> > > +	__u16 num_placements;
> > > +
> > > +	/** @vm_id: VM to use for this engine */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @flags: MBZ */
> > > +	__u32 flags;
> > > +
> > > +	/** @engine_id: Returned engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +	/**
> > > +	 * @instances: user pointer to a 2-d array of struct
> > > +	 * drm_xe_engine_class_instance
> > > +	 *
> > > +	 * length = width (i) * num_placements (j)
> > > +	 * index = j + i * width
> > > +	 */
> > > +	__u64 instances;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_engine_get_property {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +#define XE_ENGINE_GET_PROPERTY_BAN			0
> > > +	/** @property: property to get */
> > > +	__u32 property;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_engine_destroy {
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_sync {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_SYNC_SYNCOBJ		0x0
> > > +#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
> > > +#define DRM_XE_SYNC_DMA_BUF		0x2
> > > +#define DRM_XE_SYNC_USER_FENCE		0x3
> > > +#define DRM_XE_SYNC_SIGNAL		0x10
> > > +	__u32 flags;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		__u32 handle;
> > > +
> > > +		/**
> > > +		 * @addr: Address of user fence. When sync passed in via exec
> > > +		 * IOCTL this a GPU address in the VM. When sync passed in via
> > > +		 * VM bind IOCTL this is a user pointer. In either case, it is
> > > +		 * the users responsibility that this address is present and
> > > +		 * mapped when the user fence is signalled. Must be qword
> > > +		 * aligned.
> > > +		 */
> > > +		__u64 addr;
> > > +	};
> > > +
> > > +	__u64 timeline_value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_exec {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: VM ID to run batch buffer in */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > > +	__u32 num_syncs;
> > > +
> > > +	/** @syncs: Pointer to struct drm_xe_sync array. */
> > > +	__u64 syncs;
> > > +
> > > +	/**
> > > +	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > > +	 * array of batch buffer addresses
> > > +	 */
> > > +	__u64 address;
> > > +
> > > +	/**
> > > +	 * @num_batch_buffer: number of batch buffer in this exec, must match
> > > +	 * the width of the engine
> > > +	 */
> > > +	__u16 num_batch_buffer;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u16 pad[3];
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_mmio {
> > I'm a bit skeptical of the need for this ioctl.  The only "real"
> > userspace that uses it only reads one specific register and only because
> > we haven't given them the timestamp correlation interface that they
> > really want (https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/384).
> > Being able to read/write arbitrary registers is handy for the xe_reg
> > tool in IGT, but if we didn't have the ioctl we could also have just
> > used libpciaccess to map the BAR directly like i915's intel_reg tool
> > does.
> 
> +1 here.
> 
> > 
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	__u32 addr;
> > > +
> > > +#define DRM_XE_MMIO_8BIT	0x0
> > > +#define DRM_XE_MMIO_16BIT	0x1
> > > +#define DRM_XE_MMIO_32BIT	0x2
> > > +#define DRM_XE_MMIO_64BIT	0x3
> > > +#define DRM_XE_MMIO_BITS_MASK	0x3
> > > +#define DRM_XE_MMIO_READ	0x4
> > > +#define DRM_XE_MMIO_WRITE	0x8
> > > +	__u32 flags;
> > > +
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_wait_user_fence - wait user fence
> > > + *
> > > + * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> > > + * instances list and check if user fence is complete::
> > > + *
> > > + *	(*addr & MASK) OP (VALUE & MASK)
> > > + *
> > > + * Returns to user on user fence completion or timeout.
> > > + */
> > > +struct drm_xe_wait_user_fence {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	union {
> > > +		/**
> > > +		 * @addr: user pointer address to wait on, must qword aligned
> > > +		 */
> > > +		__u64 addr;
> > > +
> > > +		/**
> > > +		 * @vm_id: The ID of the VM which encounter an error used with
> > > +		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
> > > +		 */
> > > +		__u64 vm_id;
> > > +	};
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_EQ	0
> > > +#define DRM_XE_UFENCE_WAIT_NEQ	1
> > > +#define DRM_XE_UFENCE_WAIT_GT	2
> > > +#define DRM_XE_UFENCE_WAIT_GTE	3
> > > +#define DRM_XE_UFENCE_WAIT_LT	4
> > > +#define DRM_XE_UFENCE_WAIT_LTE	5
> > > +	/** @op: wait operation (type of comparison) */
> > > +	__u16 op;
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> > > +#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> > > +#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> > > +	/** @flags: wait flags */
> > > +	__u16 flags;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: compare value */
> > > +	__u64 value;
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_U8		0xffu
> > > +#define DRM_XE_UFENCE_WAIT_U16		0xffffu
> > > +#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> > > +#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> > > +	/** @mask: comparison mask */
> > > +	__u64 mask;
> > > +	/**
> > > +	 * @timeout: how long to wait before bailing, value in nanoseconds.
> > > +	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
> > > +	 * it contains timeout expressed in nanoseconds to wait (fence will
> > > +	 * expire at now() + timeout).
> > > +	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
> > > +	 * will end at timeout (uses system MONOTONIC_CLOCK).
> > > +	 * Passing negative timeout leads to neverending wait.
> > > +	 *
> > > +	 * On relative timeout this value is updated with timeout left
> > > +	 * (for restarting the call in case of signal delivery).
> > > +	 * On absolute timeout this value stays intact (restarted call still
> > > +	 * expire at the same point of time).
> > > +	 */
> > > +	__s64 timeout;
> > > +
> > > +	/**
> > > +	 * @num_engines: number of engine instances to wait on, must be zero
> > > +	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> > > +	 */
> > > +	__u64 num_engines;
> > > +
> > > +	/**
> > > +	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> > > +	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> > > +	 */
> > > +	__u64 instances;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_madvise {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: The ID VM in which the VMA exists */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @range: Number of bytes in the VMA */
> > > +	__u64 range;
> > > +
> > > +	/** @addr: Address of the VMA to operation on */
> > > +	__u64 addr;
> > > +
> > > +	/*
> > > +	 * Setting the preferred location will trigger a migrate of the VMA
> > > +	 * backing store to new location if the backing store is already
> > > +	 * allocated.
> > > +	 *
> > > +	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
> > > +	 * drm_xe_memory_class.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_GT		1
> > > +	/*
> > > +	 * In this case lower 32 bits are mem class, upper 32 are GT.
> > > +	 * Combination provides a single IOCTL plus migrate VMA to preferred
> > > +	 * location.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
> > This is another place where we probably need to switch things over to be
> > tile-centric rather than GT-centric.
> > 
> > 
> > Matt
> > 
> > > +	/*
> > > +	 * The CPU will do atomic memory operations to this VMA. Must be set on
> > > +	 * some devices for atomics to behave correctly.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_CPU_ATOMIC		3
> > > +	/*
> > > +	 * The device will do atomic memory operations to this VMA. Must be set
> > > +	 * on some devices for atomics to behave correctly.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC		4
> > > +	/*
> > > +	 * Priority WRT to eviction (moving from preferred memory location due
> > > +	 * to memory pressure). The lower the priority, the more likely to be
> > > +	 * evicted.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_PRIORITY		5
> > > +#define		DRM_XE_VMA_PRIORITY_LOW		0
> > > +#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> > > +#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> > > +	/* Pin the VMA in memory, must be elevated user */
> > > +#define DRM_XE_VM_MADVISE_PIN			6
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad2: MBZ */
> > > +	__u32 pad2;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +#if defined(__cplusplus)
> > > +}
> > > +#endif
> > > +
> > > +#endif /* _UAPI_XE_DRM_H_ */
> > > -- 
> > > 2.40.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
