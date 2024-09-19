Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C2CCF3959
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 15:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9310E72F;
	Thu, 19 Sep 2024 15:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABo57CzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C735810E72F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726760988; x=1758296988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7pK/v11Ao/uCZ5rMgV2IXbqbXWhUpUp8vxIj9aJzFMU=;
 b=ABo57CzUe8L/JTiTMTNOX424X2xSc2FssnNYpOG0BCIiyhf+VF4qOgcV
 uPuB3o6Gb4UaUp4SxUdHZ1j9yrvWu4WbpOfKY3dpZRc/t5Tk7G4VdfwHd
 5lHrcN74aW4QTFi3ztahyLsJy0u+A5nKI+V9rV/P5R/ug7ePnun3xotVY
 1E/2XRHukzQYbnufgER26KxsHUYZjfhrZNYf7Maf4ogwZgSJos5TL+SA/
 bnT1n6TUw4AqA2X3tQd0nC1hcglIGVnjNVARnmrmNlOZiT9Xmvvn7bbCv
 uLyen+I04fe5scZ+gvmIG5YEtYSKIaXM+/edfG+77jKuc2iBI77qS588t A==;
X-CSE-ConnectionGUID: PCwSxF3yS/S3jiQ8bHlryQ==
X-CSE-MsgGUID: tNbzWPY3T6SMSIikM6J2FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37101740"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="37101740"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:49:48 -0700
X-CSE-ConnectionGUID: rsUZ/5fHR76UTPdCxU5wyQ==
X-CSE-MsgGUID: exDyHNMCSPWZrXTkZGVQFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74950549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 08:49:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 08:49:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 08:49:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 08:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m03wupUxRgvNARZVr7NQM9aZumgcJb7FKYu4cQoUVHk5BqIDMkNTthBQBTZp5pLgof31p/YmhUhiuU5tiFCqzUvemmm13QENw0C5XJNejAj7jfthAnSV0rsUF/27uSIdP91k9tkOJBAqrH6wkqwFjtxNJ9Xa+2AfTLk2mh4R+FpbC0hNjTADLSYu4aeNTSgGrunCEFJsRaFwxu3iqM9yQbUUWwwGYuT07PqXYsxRPZelcch4FML0jQdpqg5w8O9sRIXeglXXtmGk/DkJ4y8KRfpNvndJ2+rK0ZsdxQY9yHuHgUWEm9MXERjPYzk+Jna2eU0jkQ9ik1qd7g5+K/eQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGMLAbhC3nFg9100ygnejq3E+wPNfI/sWYwrDRr/Ers=;
 b=n4z5k/EeiSMzYvfxrXteWW8d1i1YeM820ddmY1NKWloiy/V+Z+XqeL03GD1/bqGlE6oRA6C/8GLzz+gj+jZUamyU96/GDskI4SVcAeq0SyuENSGtu+stapXCFlM+gieuHxnSHDHHcn9O40AMrXooRti8Gd7hI7YVq6D7bchQvLA3w9fwZz32h0aotPJJ79H4YW50FdeWMIzdV7Nkd0V7tgbTI27IVkYieVJVRa+Je2Oh7RLChjlh1Fg3kALg1m6qduXSpunY34S/rIIR3yTKKesnSHXbXAUVZAz8iNgVZuVXBYQ/fiM3XteuZ3MbZH1/JIySydSCOB2KJXjDHio2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 15:49:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 15:49:42 +0000
Date: Thu, 19 Sep 2024 15:48:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 38906dd1-56d6-4112-d2ac-08dcd8c2ad47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PkCl1JqrABVgGptjrOfMWxAsHacN0QRQQN2d82d8OIU5t/t96NdqATJVMNTJ?=
 =?us-ascii?Q?EbqHJHuhZsvKaf7Lwz7TjI80NWFdgLUUdaHOizVQ9SdxIScpbtKZfmJt/cem?=
 =?us-ascii?Q?pFD+kF6nxIUakZ7WONSf36hSTxJS9RHAat+9AB7FUZ9zBHTYxRS3RP3IPcVC?=
 =?us-ascii?Q?+8X2b0td1Laca0LlytBBxrW0Vj7pMii3ktbzgaq9jubYOcBDNtmVZcvBojhH?=
 =?us-ascii?Q?vEk0wjJyu+F9EAvuhxMv0DjTXrqoOUgc0MoUrel/15LkA0Xuam19P1iwJdXD?=
 =?us-ascii?Q?9l9bBV/Ci05pqCqr/POn/d8JKU3+Dz/awdkd8jhaIe3eCGuUeyU1ehunPy/P?=
 =?us-ascii?Q?i0oO86VW8ZahnzypS3Q8P9j3ekXKwbqzQ+fZv9rSVmK3WDNfTafQmma8xpAx?=
 =?us-ascii?Q?R/gdGOV7uKnWJkKKUG5zGCb/sRg5BdYMbzSUm2r5xxxXoGlDSQ8ecT2u1IZ+?=
 =?us-ascii?Q?YwC0j+JCnQcZ5H9QIQi4LGt692Kq0F98OZlyV88+M8KFkF4L/qydsGijdbc+?=
 =?us-ascii?Q?GRX2Ro1t3Kb4SLvYNgWcjKzTJqwhn1+Jd8qCvfZHJ7gaONGMop5MQMZ1CfMW?=
 =?us-ascii?Q?aV+FNBv3Owc2EXqjWirf8H4UxOJmShMfcXynFvKOuENcODrJ0UrhycKU8+b5?=
 =?us-ascii?Q?v6VTuon8sYUhXdelvnJMkI+XONQjaYENsD+J82aqXdVcCv04GriDiT49/GbA?=
 =?us-ascii?Q?YVEw74yAI/Gpru5TCBdwm+4H3ps/1xhPdGF1fnhP8MePnDCOUxEfLgbAh7E5?=
 =?us-ascii?Q?2w9p+Vh0xoCTkVdK2bloLoiKqQ71BfUXFr8DmmPeocu4OM4T2fm93vN2li8o?=
 =?us-ascii?Q?lgyUn0L9Gk3/N+P2qwR1uCv8XgnS+MwHM8HicTpeYd0AVkrYj9vWW2Rb9kaA?=
 =?us-ascii?Q?HQWUS9m5T1fjqNeRAK5IPoCs1jLpPyky1vlrttL0iWxmvMR4AjkgUz0KcRyb?=
 =?us-ascii?Q?6A1YxsBuOE/esGSXTvf5JIUvKy7vFSnEu1hYXIzM6y9Ma1+cJGg0f+Nimpqn?=
 =?us-ascii?Q?fh4UclLmnVgogVJRA7f7QfAJRmoLc5XBGmiryLttHDVDPhdhPhVrX7WEoegQ?=
 =?us-ascii?Q?A2bvDMtNz7rgQFq2agOpaGCAjb/OzHEZ2Qxcl9J6f35Wd7KeAf5Ja3nbYBf9?=
 =?us-ascii?Q?/zr6E0smAMYUGpmKD0XpGI5TSVmMVGwhboa1fPcTLvhsOhQmDenZI3l5cGkL?=
 =?us-ascii?Q?cRP0O5gncWTUBBIqI4UNFUhPaq9QIYuG+ljI75n3Ov6S+dJuq8+zd9xH3vYR?=
 =?us-ascii?Q?fHKe2B0uxIXdP6a2JwgVqTymOJqi2u2BOhYQ+nlCoMCREP9yIlvFSAlINrLk?=
 =?us-ascii?Q?2NeG0t37rwnaprp8kWwQDHBBeoDDehOtpUgI43EM5KnCiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3kftUnobFUZ1VEpg70pGnCxz30Fha6QogO9tg3R+AbFOuNKTtPK6Q61vfGj?=
 =?us-ascii?Q?wu3tEYQZG9M7JVuI5qSXKGbVFmiG2LonCs90hlTHHYzJZc6faBW1fgxi4hgo?=
 =?us-ascii?Q?xx2N54TZT3L8Fi+xA7eHTJ0aFlMuh93ZYqQqwj02/Pg9vxafh76CWnQIvC6U?=
 =?us-ascii?Q?/Zvp89DQ6H0s6AC6z3YKEuvS4QTA7cqKejG8Vl1rzIlJmpi2DWBqpizm1R3t?=
 =?us-ascii?Q?YZgfzYUclPaoXwu5WtHYaB7XiaUtq0KOfKxXC007ebN2Zs/e+nnLDGd6YZky?=
 =?us-ascii?Q?Pp0wkS+qUNPrsu4KHR+LJaHjw9zWH6idO/o6MYq7uZV3O1Q0qym2UPsZSnVF?=
 =?us-ascii?Q?CItoxp0VHdFTxj1f0IY3yCDkXppbG9sd2wYX0qhyWqpy3Dgce7LHce8ixNb7?=
 =?us-ascii?Q?AQfFSBbjw5EFF7PSXQkY+T5oYx417Wu80og7cA/Sx4JRMSMR/9dMDOoe0y3y?=
 =?us-ascii?Q?+Wu2e3SPpMZczKIrHpLicfQ3ZcriazxrbHnxqq8d5uya2vvekGTQ7eDrYgIk?=
 =?us-ascii?Q?rU/o/qbBQkf7XDFBRgFkJFy31xCiEVvzkcEbhIo+NZyKJ5VfeWHa14i1Hx6Y?=
 =?us-ascii?Q?CmVwt/Vr3Wp7ZI8ZmVlvSgiUWGZx4rwkKa0z4zTVuBz0Wzc6JvWxnnhE3Zct?=
 =?us-ascii?Q?qLDk/fVPoK3HGq2GW+YArJNvxZBoBLlPrI4MQ26++IXrazKBs1rM4dD7qlnd?=
 =?us-ascii?Q?/IgPwGbLkhhHB23M+S1IZxJXManUp/UBgrciUum6N3Lq7UZ7+ZMIetiAcELD?=
 =?us-ascii?Q?W0Sbasj6KxLnEFEqGtjYrn0AKVW7duVm8nQd7liVmFadOe+tOto76b6Cnj5j?=
 =?us-ascii?Q?4HC19GKafwbxEg5ahLvM2PnkIJCRAwPaalED7kQw/reWDs6TP3WIaBPXKFWQ?=
 =?us-ascii?Q?5qYn9qGgKSL7hL1ZxAUDoCkw8PpDluvvytrUeIzTtDyG2jqRQ/BJewBWhm7p?=
 =?us-ascii?Q?YbstR78huyjK34axzOiwA5Hudx03LCCQU3xbLd6ugy9dJm8h1Kz2X/35a9Hb?=
 =?us-ascii?Q?oPvp4OhJgz59m83Y3MqjMGt1H4pymV+94a2vk1u3+L9C9nH21Te47rVVPcOJ?=
 =?us-ascii?Q?EUKFstvOsbsRDsvP7PvrM7hBC7NORSo58HHviSgld6RlGjOWrxlHucf0uYQz?=
 =?us-ascii?Q?kR2d6OB1LsCVelg3Ypq21qg1zVRHovzWivq8sAxDFiR0kz0cxaRFivzuyLuX?=
 =?us-ascii?Q?UQS7WafPO45LR1YoR0LkOYOXUrk23jSbKkW4dAVLLBF9IsjQIxDRmtssB/xY?=
 =?us-ascii?Q?vWbPfXLQT/Yygg3JAxqmeqiz2tV42NsjfHmN9iPUQeHBt7Nq/9vJHExpLrSa?=
 =?us-ascii?Q?FNifk/2P+6zFoktGFIbwnakB1hCG0jm/TGRw62ijJ+5dMmN304zvczkMZhr3?=
 =?us-ascii?Q?UVZms4LbBHAmrrbkKJDgh6/TJ74yyOxY+qWzo6K3CZA8QArcDIZVIiPZp2Vc?=
 =?us-ascii?Q?tq9VEIrqJy9yvl4hf7+j9vcvcSnigvXOD7EnBRxCNZwRh4zptTaSpAcgS09w?=
 =?us-ascii?Q?44SOWfRXFZNMNAsRWnUYjyXuKGnZdv03UzBA0MkFQH16OFa7zJdvIzR4E7Dz?=
 =?us-ascii?Q?ITzaJz2Z5J2ZjIWnIe99f+gcRjD+KVRsslc4lS/VMZFc7HEZc6/NUNLzlGxH?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38906dd1-56d6-4112-d2ac-08dcd8c2ad47
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:49:42.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yogi4diCEl923Ki4KawH1lPaSjo7MpQVQx4e7p5xECgPtkyZ4uDKxZOt/JYAwiELlBuCDrXvldT2K88O2k11iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
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

On Thu, Sep 19, 2024 at 09:09:57AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, September 18, 2024 2:38 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> > Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
> > a map operation
> > 
> > On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
> > 
> > Please sent patches which touch common code to dri-devel.
> > 
> > > Considder this example. Before a map operation, the gpuva ranges
> > > in a vm looks like below:
> > >
> > >  VAs | start              | range              | end                | object             |
> > object offset
> > > -----------------------------------------------------------------------------------
> > --------------------------
> > >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> > | 0x0000000000000000 | 0x0000000000000000
> > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> > | 0x0000000000000000 | 0x0000000000000000
> > >
> > > Now user want to map range [0x00007ffff5cd0000 -
> > 0x00007ffff5cf0000).
> > > With existing codes, the range walking in __drm_gpuvm_sm_map
> > won't
> > > find any range, so we end up a single map operation for range
> > > [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> > >
> > >  VAs | start              | range              | end                | object             |
> > object offset
> > > -----------------------------------------------------------------------------------
> > --------------------------
> > >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> > | 0x0000000000000000 | 0x0000000000000000
> > >      | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000
> > | 0x0000000000000000 | 0x0000000000000000
> > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> > | 0x0000000000000000 | 0x0000000000000000
> > >
> > > The correct behavior is to merge those 3 ranges. So
> > __drm_gpuvm_sm_map
> > 
> > Danilo - correct me if I'm wrong, but I believe early in gpuvm you had
> > similar code to this which could optionally be used. I was of the
> > thinking Xe didn't want this behavior and eventually this behavior was
> > ripped out prior to merging.
> > 
> > > is slightly modified to handle this corner case. The walker is changed
> > > to find the range just before or after the mapping request, and
> > merge
> > > adjacent ranges using unmap and map operations. with this change,
> > the
> > 
> > This would problematic in Xe for several reasons.
> > 
> > 1. This would create a window in which previously valid mappings are
> > unmapped by our bind code implementation which could result in a
> > fault.
> > Remap operations can create a similar window but it is handled by
> > either
> > only unmapping the required range or using dma-resv slots to close
> > this
> > window ensuring nothing is running on the GPU while valid mappings
> > are
> > unmapped. A series of UNMAP, UNMAP, and MAP ops currently
> > doesn't detect
> > the problematic window. If we wanted to do something like this, we'd
> > probably need to a new op like MERGE or something to help detect
> > this
> > window.
> > 
> > 2. Consider this case.
> > 
> > 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
> > 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
> > 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
> > 
> > What is VMA[A], VMA[B], and VMA[C] are all setup with different
> > driver
> > specific implmentation properties (e.g. pat_index). These VMAs
> > cannot be
> > merged. GPUVM has no visablity to this. If we wanted to do this I
> > think
> > we'd need a gpuvm vfunc that calls into the driver to determine if we
> > can merge VMAs.
> 
> #1, #2 are all reasonable to me. Agree if we want this merge behavior, more work is needed.
> 
> > 
> > 3. What is the ROI of this? Slightly reducing the VMA count? Perhaps
> > allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
> > just leave GPUVM as is rather than add this complexity and then
> > make all
> > driver use GPUVM absorb this behavior change.
> 
> This patch is an old one in my back log. I roughly remember I ran into a situation where there were two duplicated VMAs covering
> Same virtual address range are kept in gpuvm's RB-tree. One VMA was actually already destroyed. This further caused issues as
> The destroyed VMA was found during a GPUVM RB-tree walk. This triggered me to look into the gpuvm merge split logic and end
> Up with this patch. This patch did fix that issue.
> 

If a destroyed VMA is in the RB tree that would be a big issue and
definitely would need to be fixed. 

Adding a test case to show the issue you describe would be good. Also if
we end doing something with merging adding a test case for the
description in the commit message would also be good.

> But I don't remember the details now. I need to go back to it to find more details.
>

That would be good.

> From design perspective, I think merging adjacent contiguous ranges is a cleaner design. Merging for some use cases (I am not sure
> We do merge for some cases, just guess from the function name _sm_) but not merging for other use cases creates a design hole and
> Eventually such behavior can potentially mess things up. Maybe xekmd today doesn't have such use cases, but people may run into
> Situation where they want a merge behavior.
> 

I don't think Xe has a current use case, but the situation you describe
is very similar to a system allocator case where we would want merging.

Simple example below.

Initital State:
VMA[A] 0x0000-0x0fff - System allocator VMA
VMA[B] 0x1000-0x1fff - BO binding VMA
VMA[C] 0x2000-0x2fff - System allocator VMA

User op:
Bind 0x1000-0x1fff to sytem allocator

Ideally we really want this final state:
VMA[D] 0x0000-0x2fff - System allocator VMA

The without merging like above as BO bindings are bound / unbound the
system allocator space will get fragmented into lots of VMA which is not
ideal.

So here 1) from my list is a non-issue as UNMAP system allocator VMAs
don't interact with the hardware. 2) could still be an issue as VMA[A],
VMA[C] could have different caching or migration policies.

> If we decide only merge for some case but not for other cases, we need a clear documentation of the behavior.
>

If this was added merging it likely would a be optional user controled
thing. I suggested a vfunc or something to test for merge condition, we
could just use a user defined cookie attached to VMA that GPUVM could
match on for merging (also could be used as enable merging if cookie is
non-zero). That actually seems pretty clean.

Matt

> Oak
> 
> > 
> > Matt
> > 
> > > end result of above example is as below:
> > >
> > >  VAs | start              | range              | end                | object             |
> > object offset
> > > -----------------------------------------------------------------------------------
> > --------------------------
> > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > >
> > > Even though this fixes a real problem, the codes looks a little ugly.
> > > So I welcome any better fix or suggestion.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_gpuvm.c | 62
> > +++++++++++++++++++++++++------------
> > >  1 file changed, 43 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > b/drivers/gpu/drm/drm_gpuvm.c
> > > index 4b6fcaea635e..51825c794bdc 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
> > drm_gpuvm *gpuvm,
> > >  {
> > >  	struct drm_gpuva *va, *next;
> > >  	u64 req_end = req_addr + req_range;
> > > +	u64 merged_req_addr = req_addr;
> > > +	u64 merged_req_end = req_end;
> > >  	int ret;
> > >
> > >  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
> > req_range)))
> > >  		return -EINVAL;
> > >
> > > -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > req_addr, req_end) {
> > > +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > req_addr - 1, req_end + 1) {
> > >  		struct drm_gem_object *obj = va->gem.obj;
> > >  		u64 offset = va->gem.offset;
> > >  		u64 addr = va->va.addr;
> > >  		u64 range = va->va.range;
> > >  		u64 end = addr + range;
> > > -		bool merge = !!va->gem.obj;
> > > +		bool merge;
> > >
> > >  		if (addr == req_addr) {
> > > -			merge &= obj == req_obj &&
> > > +			merge = obj == req_obj &&
> > >  				 offset == req_offset;
> > >
> > >  			if (end == req_end) {
> > >  				ret = op_unmap_cb(ops, priv, va,
> > merge);
> > >  				if (ret)
> > >  					return ret;
> > > -				break;
> > > +				continue;
> > >  			}
> > >
> > >  			if (end < req_end) {
> > > @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
> > drm_gpuvm *gpuvm,
> > >  			};
> > >  			struct drm_gpuva_op_unmap u = { .va = va };
> > >
> > > -			merge &= obj == req_obj &&
> > > -				 offset + ls_range == req_offset;
> > > +			merge = (obj && obj == req_obj &&
> > > +				 offset + ls_range == req_offset) ||
> > > +				 (!obj && !req_obj);
> > >  			u.keep = merge;
> > >
> > >  			if (end == req_end) {
> > >  				ret = op_remap_cb(ops, priv, &p,
> > NULL, &u);
> > >  				if (ret)
> > >  					return ret;
> > > -				break;
> > > +				continue;
> > >  			}
> > >
> > >  			if (end < req_end) {
> > > -				ret = op_remap_cb(ops, priv, &p,
> > NULL, &u);
> > > -				if (ret)
> > > -					return ret;
> > > -				continue;
> > > +				if (end == req_addr) {
> > > +					if (merge) {
> > > +						ret =
> > op_unmap_cb(ops, priv, va, merge);
> > > +						if (ret)
> > > +							return ret;
> > > +						merged_req_addr =
> > addr;
> > > +						continue;
> > > +					}
> > > +				} else {
> > > +					ret = op_remap_cb(ops, priv,
> > &p, NULL, &u);
> > > +					if (ret)
> > > +						return ret;
> > > +					continue;
> > > +				}
> > >  			}
> > >
> > >  			if (end > req_end) {
> > > @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
> > drm_gpuvm *gpuvm,
> > >  				break;
> > >  			}
> > >  		} else if (addr > req_addr) {
> > > -			merge &= obj == req_obj &&
> > > +			merge = (obj && obj == req_obj &&
> > >  				 offset == req_offset +
> > > -					   (addr - req_addr);
> > > +					   (addr - req_addr)) ||
> > > +				 (!obj && !req_obj);
> > >
> > >  			if (end == req_end) {
> > >  				ret = op_unmap_cb(ops, priv, va,
> > merge);
> > >  				if (ret)
> > >  					return ret;
> > > -				break;
> > > +				continue;
> > >  			}
> > >
> > >  			if (end < req_end) {
> > > @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
> > drm_gpuvm *gpuvm,
> > >  					.keep = merge,
> > >  				};
> > >
> > > -				ret = op_remap_cb(ops, priv, NULL,
> > &n, &u);
> > > -				if (ret)
> > > -					return ret;
> > > -				break;
> > > +				if (addr == req_end) {
> > > +					if (merge) {
> > > +						ret =
> > op_unmap_cb(ops, priv, va, merge);
> > > +						if (ret)
> > > +							return ret;
> > > +						merged_req_end =
> > end;
> > > +						break;
> > > +					}
> > > +				} else {
> > > +					ret = op_remap_cb(ops, priv,
> > NULL, &n, &u);
> > > +					if (ret)
> > > +						return ret;
> > > +					break;
> > > +				}
> > >  			}
> > >  		}
> > >  	}
> > >
> > >  	return op_map_cb(ops, priv,
> > > -			 req_addr, req_range,
> > > +			 merged_req_addr, merged_req_end -
> > merged_req_addr,
> > >  			 req_obj, req_offset);
> > >  }
> > >
> > > --
> > > 2.26.3
> > >
