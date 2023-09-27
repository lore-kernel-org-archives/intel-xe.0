Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3879FE82CB2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 17:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F308D10E549;
	Wed, 27 Sep 2023 17:05:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AB410E549
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695834357; x=1727370357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Um9Yumc+C3LOhFaS4DdxoTzNx5oLPNI45XxU3tRrj0=;
 b=BgbRE7plcAYafPs+3rLncQS3NQpiQW2wexrvEd28CcnaEx9EqLoxZEgK
 edYUArim/MxLYSRL3XCRhDJr0T2wQhx7qv07d11Fpkq5UYEbAJihh95Tj
 +/LB6RPWV6p6HNJfA/Hkbd49i3r61z3bAQNqNxIwEHJpbYOk/A7RiTQqM
 4HTpVY/c/fne1VJyvgaQvp1ZhPcV9rVy1RjKVaXoSiFPnnHChBPSFqkpc
 IUVdFE3u6OAVJ6Qjdjei3su/lmKPiHExSaDMaomrb5ZR/qsbgS85VOfeA
 HLZ/0Xt6nIh8Um8pSn2hauJk+8NkAEGEG6GRcv1kkG6p/sOlFEpNeV4Oa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380761978"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="380761978"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 10:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892672876"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="892672876"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 10:04:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 10:05:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 10:05:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 10:05:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 10:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9I3nuBevDGbFf6/iHYvaC77ghfA5TAlROQyimZgbm+oBriICGQdaW6VAitcxi1mKdVdAUVuCgDt3b3jgTkswFkSDs9oQbIC2cYIWq5PLAAeUzmNySZfTSedBfyWK6hV2URBISZTsQq4cAGOa9OCTCg2jHxCN8zrnK/fOdZsDne6UHX367Q7Ywb+PcHR0jvKBsNPLN6VY/WaYVTYgcKfxVX41mZr2qAEpQU+942ykNEgT0Lsm/gf20UXv5Z41EJG6Tz/75yZTEWN3tC22wmuYUfqceRUIJ95JeGMx3kMYZxrwj445P6sNlVzkvk7xart76fkwA3DTnJ90dR9zMB0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TswUt6ikooncNcpcFCdg18Sq/+n4tgl2P2SjQQJxNfI=;
 b=bZPKmbNEQztSheLf9x76otjiJJmUhSW13DPggdgD8XgPJcPscXGlTkeFcJ2PbkzBqJWQpJMHCvIjfdWokZP0ZTkj/uy5JY8ygD2FVhTbo+eJa8twcgOCwRSl5h5N4YMOJ06iR78r8nx70g0L3ehWc4uTVMXLJrGGWd3QN7e8lMCzrVxhelEf/P3oXPqUD1Qp5iE5z5Svuo76EAeg/sEuLvPiIyWByah1dM8Lnfv43vV0xtnV/QUXn75pIeJMcLwLorIhYsPI4NrSetnrtopQeoqGbzWQlOqzKEsKcjtkAi8I7fFZoOddrOuGXZN93ocIyTPixYTKZPq7gAj/N5JD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30; Wed, 27 Sep
 2023 17:04:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 17:04:59 +0000
Date: Wed, 27 Sep 2023 13:04:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZRRgt81Ekx0tNk3e@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
 <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ba4643-36d6-4f6d-5940-08dbbf7be181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eM0qeUyOIPAXdiD5CcTuCM6LJjsmQ7P+zyzLgsW50bHECDndWqIWz6aSg3yu14WUkvCjY4FJ/0cy4r/bcqstUyK03G66sr79VUuSb/QH4hFDcF4pqJCg5Ec114nlTdQhS41FQjLVyEjlHZPAiaKr+TsPTw5i+46f5LRidMD9saotiFreOKDkXpES+cMVpYQSSRyLrwDgPVBBcZqAxEhfyYfpAW5npz0YoH8V7Q5PpnV/mToiQhAaPkHiWTWFJ/KfjSk2s1Gztp/76yVLVF4/AiosiltCsXYU1oM7plgx+zncclVyrtV/2pdy4E1fWMrs87CD2XaleAd8s2gnKVNDCUTFQTTFOfT+PG4rnFHGUb710hRITseHFi0tW1QZYXnD6TVhJRufNBlvlFU5Yx76eRUBVVE7MqinlK9/8Akl8TLFEYIEi9XHrCCEtgyzrKgHkrBf5Ktf9I9G/4k9Dwg+GIrVnby6sD41r2CfgHxA4iOCTlQ9JED4e1xZhJ478pWRsbAasSjz8iJ9outPxSnU8z83d2kiQhXcBAQSIQifw8BbJ8KFbC1QpS/Me8QXFMEw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(6506007)(6486002)(82960400001)(6666004)(6862004)(38100700002)(6636002)(2906002)(54906003)(86362001)(26005)(41300700001)(37006003)(6512007)(83380400001)(2616005)(478600001)(107886003)(8936002)(5660300002)(316002)(66946007)(44832011)(4326008)(66556008)(66476007)(36756003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FLsZ64pu2oAEzvPuPHlbaL4IU2gep/ykBnrJMOrVoj7D8FP3HF6B13oipSGr?=
 =?us-ascii?Q?NQ/6UDLaRSBwfjn3tgkHieqBOd1lR/0xKFNqJ1ZO6Eox95JCjaqDXmzYbsX3?=
 =?us-ascii?Q?GA+stAteEBsNjGMiuTzgQ92X/NsnfF+2kMudIRr/eF4QJOa4EwSvvT4qUP3c?=
 =?us-ascii?Q?c8ZNQJY0YInFGNuNZ0Is6BHC3gEPz0MkfNnh/m6ZOxYIGRNXyPD9FH3grL6T?=
 =?us-ascii?Q?8vxvxnnfCNuqRy84MgI9Q47erOXB1usFEgBxneje2S5cleoSLIkQTq0UkqW9?=
 =?us-ascii?Q?BJCVxjOV/xbTHwOP1OwHwko09VDnfg1AvHC04nx5BmxQsPz23jhGYPYkStNZ?=
 =?us-ascii?Q?FSktZEfik6LT0MyTyE7yiCYUGN3+DD1uSV8oPy46IumKCiqIj2ecqjlmdnbg?=
 =?us-ascii?Q?QGzMROsLqMZIrMW3G6Z4V/hkNE3+ul5Qy/XYoCg3QZpeNsnJ4GFvzMANHGxm?=
 =?us-ascii?Q?x9ks7fS6kEJY4OkitcR2KPo9VOkJwNF618wEavKAnsDjiGmd8ELGL8cOGWlj?=
 =?us-ascii?Q?5Re8iu9Q6csULsQdaoOPWyt5NT5LnJS70rrmbhvOQUg5GNWJuuaYEXpPdidf?=
 =?us-ascii?Q?0KPIXYPQLvk1BKpHJm98wnEoYYpaizedcFog6KfPu2+//eATNYQZM3g8ESdL?=
 =?us-ascii?Q?hSGUea8wtgfwpKrXeD1Q9uEsbGwKr4QUBsmlFy0L6+KDMDDR1SWTolWArsye?=
 =?us-ascii?Q?dmaO4mtTswaQOJ2vzFJUO3UNX6BGld2EMzx4ZHFQwBc7rGo+pvPJXrtICbW5?=
 =?us-ascii?Q?83xOzukMOHlRDT8qTyDbrwsNMZr398TjSz6mZCIHXXLEdg6UFIQdVzlwvj8U?=
 =?us-ascii?Q?MfmNmZiDYbpGD/InTjP5483QkSDjLyeJQ/o/m6T15irxBwnqr4gzLrMLfvB5?=
 =?us-ascii?Q?KivF+5L3TBv0roUWBFS0I/NmPK+aq4GBo6aG7mdbcWhfF2hiIFIIOZ5e0MGy?=
 =?us-ascii?Q?N7Yzz9+1PYobbMDTUCiFNuEqZ/ZS/9Wt8sWBqda1N0CAyLyvaYkr3vl8990f?=
 =?us-ascii?Q?Qigtg6GbGw6y+eO9uC+VsEFnsbo6ddBAQjBwws8/y2gNsjHX8lKdMhPCNIGF?=
 =?us-ascii?Q?uAatmISc5vR1kg9ORYZt+P2ACzKikEieuicn3I1a47B6xXrPZBodnPOqwOcu?=
 =?us-ascii?Q?FBdOMqeCbVDxT3l/V7pDqw6+ZIVz7ZEJqMR71RE7ppR55tIzoOKWBuQjNlg9?=
 =?us-ascii?Q?eqD9hwhVDMCgZOpV5NspCsnyarwjhkLASNN/wvna1t+g//a6Zh7cs2IJm0Mh?=
 =?us-ascii?Q?3c1IdT1bAk2suODg64sjUnLo+9tXqGAKLKkoqceYxad5BT+zRtaGBZSV+kJi?=
 =?us-ascii?Q?f4ep3O8wGXjz7XnN6dGnmgcKlgJC6xnlpfJFGMjwt5EBsy6ROJWnROBKIKCA?=
 =?us-ascii?Q?JsdBjwPkHw5cXj9zaAZ8wFJaEZq02myJFZd8enBxun34DhVTTmpGRjzN8BbP?=
 =?us-ascii?Q?9cy39c3BT/WtLsrCMliv2m4zpiO7Qk91/BzBpXF9Dhx0iZXaWI+c6Kx7bHz6?=
 =?us-ascii?Q?POAs7TKlxeXE6TRA5MJBxUJDdttcqSPzVrn70Zk/ktUup7xmQ6y/3z3MwanS?=
 =?us-ascii?Q?LoYlQARQhYnamOBMEwHaZOZsmdKpjL9L1Yj0T6LuAB5TYGWIzsbvreZ26Jpc?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ba4643-36d6-4f6d-5940-08dbbf7be181
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 17:04:59.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/6fX5uAkugjgs8RZUeg6LZh98XencAsUMd4JI+2YynB0Wq5dimmBAetWZq5YpOo7MW3Qcj/ntP0+5dQoHofJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 04:46:36PM +0000, Souza, Jose wrote:
> On Tue, 2023-09-26 at 12:55 +0000, Francois Dugast wrote:
> > The infrastructure to query GuC firmware version is already in place. It
> > is extended with a new micro-controller type to query the HuC firmware
> > version. It can be used from user space to know if HuC is running.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 9 +++++++++
> >  include/uapi/drm/xe_drm.h     | 1 +
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 7a0ffd9a654a..c250ca534bb9 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -530,6 +530,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> >  		resp.branch_ver = 0;
> >  		break;
> >  	}
> > +	case XE_QUERY_UC_TYPE_HUC: {
> > +		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;
> > +
> > +		resp.major_ver = huc->fw.major_ver_found;
> > +		resp.minor_ver = huc->fw.minor_ver_found;
> > +		resp.patch_ver = huc->fw.patch_ver_found;
> 
> Have you confirmed that HuC will not have something like submission version like GuC have?

Nah... GuC is the only complicated fw in our set of fw...

> At least in GuC, when running in SRIOV mode the VFs will not have access to the actual GuC version, that is why it have submission version.
> 
> Not sure if providing a complete different firmware version from one kernel version to other would be considered a uAPI break...

hmmm... but now what I'm asking myself is if we shouldn't move the guc one to
have the current loaded firmware and create a special category for the
submission version:

XE_QUERY_UC_TYPE_GUC
XE_QUERY_UC_TYPE_GUC_SUBMISSION
XE_QUERY_UC_TYPE_HUC

But to be really really honest, there's something really fishy on this
submission version. Why the VF cannot read the running firmware and
get the submission version from there?

> 
> > +		resp.branch_ver = 0;
> > +		break;
> > +	}
> >  	default:
> >  		return -EINVAL;
> >  	}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 84091860c7d2..fe7e83a5bd3e 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
> >  struct drm_xe_query_uc_fw_version {
> >  	/** @uc: The micro-controller type to query firmware version */
> >  #define XE_QUERY_UC_TYPE_GUC 0
> > +#define XE_QUERY_UC_TYPE_HUC 1
> >  	__u16 uc_type;
> >  
> >  	/** @pad: MBZ */
> 
