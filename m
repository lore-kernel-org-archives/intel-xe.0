Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F626C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 20:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078B510E6FF;
	Mon, 28 Apr 2025 20:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APDhNXzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D568710E6FF
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745870454; x=1777406454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ijXiDKZQGx94tye15d1acp0pqMD23E92i2zVb6JFIeo=;
 b=APDhNXzJXqnJf1BaOamkZ8XN901DB1uPzfncYBAyX42BclGpKEaXZ764
 oCEz68rW4u11BNfhmTntPlUEaDEvmxRib0gYUQBocNg1FTLOsI3f4c8Ab
 zwA6J3NJM+vDMRs6jcUKKmJLGwr7H3RcR9I160xWQdoywp3/ysT1IvSP0
 e35NJW0WJMYjPtx34KwNsYE/VvO2uoVJgJ7L0mD4//HMKbCMs3B1sYY8g
 siLWsJHl6JUsoKQfjU6uE4Dv2nbI7qJooeWESzb1pbE7VLvXBgcJ3iDbN
 LU+X/PWSVDgmaA6oD0KwYGm/6P8kwdSE5km6tauaU6CiDz5Xb4dDdArD4 A==;
X-CSE-ConnectionGUID: IuOIxRFNQu+dTuLr0QYGJQ==
X-CSE-MsgGUID: 8GOi9CJbSI6+Q1tmtP/JFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="46593546"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="46593546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 13:00:54 -0700
X-CSE-ConnectionGUID: 4u0k6QXzRSiDOQPRmhcO5A==
X-CSE-MsgGUID: Y8APQS1oRbaJ8h7gFnJAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="170843242"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 13:00:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 13:00:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 13:00:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 13:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkStqVBk2gJfTW/xI30V5JeL2QfRunmf9t6RyaiichAPfPJvOj2qs1W8yHHppu6Yh0UZSTkdhOrTvlav+5w0DKjird17Unp1bF6dmciOTAp6BiyLAeIIQzIv3It+nN0OEukB1GSBkYPrMt2kVGFmFkayuKqQER9cZ7cB6mZsXPlPcWdSSqoHMbDhC3P92NQKX5hCivExUjR6MsIJdsan7+TzRqw2UXflMyVgJaoyGV7BH1g49RvRAb1ArPI0rIR4RHhonlomFbUVp9AmEivuJl8fwMmdiS3KzxsqVZMkkRSKKOgE9T1w4GW9lOPhtYI4cHNuvTMd9oUIINuWW7GWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2uvjaL7eH+N/1NBIdySOlNa7BLJOrVXQJuO1AjbbrM=;
 b=ybojoaL0jJKIfWwXvW6+tp8zgKMPdJ4nGfkjB3E/v1C661etTNUf/OXGTS2EBP8pQyR0lIT2iP5Us3PWeS0TIr9XY3WpIUQoqshhCjwyS3/pSVfE0AEincSTNohA2UAHjzBb13r3U1VSQQ/Ewx8r+3DYItGS9D7AtEgt3PPwoRL1PYx9P4+smjJrFpOT7yzj4XxweKpDN151fU3df7hoAaq/ZKr4P4ixXK7qo38g2M3UDt85hupRRXEctiBbUxxE0Tk9zaVUp6UqiwQ2hEMbGgW+q9R0CKWcgyMHNgh92wRRmEfdA1dy5+lUB/HrAUZUPL2bWSqAmtAf3wW1rwZqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 20:00:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 20:00:48 +0000
Date: Mon, 28 Apr 2025 16:00:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <aA_ebBh6mxsEJi1w@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aA9UlvQfo5-6-CtB@black.fi.intel.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b5e683-bb80-49c2-d2e3-08dd868f5e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ey5g46s1pbcUkh48AKgDEG4rXV28q3pheGICZT3tsFrYgacpgA94RrF4lRP7?=
 =?us-ascii?Q?yq51rDp1wj8iShVq/fXd2DfihigGm2fR8zMddjq8XeNQxbApX+irku4zFjcJ?=
 =?us-ascii?Q?Ic8C/++U6Z1KRFeOj31A+SxpAsal8iJ2Jn1CQeqRlxbnEUHhvFXnR7+LOY6P?=
 =?us-ascii?Q?G29JnSJ5QY7Tz9zUV0OzVlc4C0hUU6Qu1mYvMQn/NE0cNO2o1hMyGAgeNxci?=
 =?us-ascii?Q?QIltgSWj4BbGeEkOJQMduDTDShWXc0XXL+muAuqttu6cIfrU3quvEQnU5Kjx?=
 =?us-ascii?Q?VOdFEOQlXtaSTxHstmKQCVhDDqF0/S134o9X4q8J3dO/Cv+5riARjEnkfD/Z?=
 =?us-ascii?Q?uS8J2+FxBGIVCxl6mw6B27rQENsURi26w/3NlaLc6QhvU9jLwbZn8oDjVKR2?=
 =?us-ascii?Q?YAkRiKXG13KoITf/VtsF481K9ZbvZekF1fKeuXVOI2IMRK5rqFfpnYtLvPqk?=
 =?us-ascii?Q?sFFE9afl/DwGurRnJzUJuiOZzkr+B9CLJZSWr334UVtKfrBtuJ06MFN+gSA4?=
 =?us-ascii?Q?x/vhiC6oa1CVr1rnToTJTa+MepNoh/BhFuWDE+j1UW1bCOV6qy08tKxmifwg?=
 =?us-ascii?Q?wRP1rxCXenHNZ0FdRyRJ+CCRDGDr7xRAFg8pREwRUvvW+EBkytZt8cgEQ0cG?=
 =?us-ascii?Q?n/WoyKKYrF6/+SzJ3KTflarSntljvgIFg/wtuD1I/Ftyv11KxBkBTzybViuj?=
 =?us-ascii?Q?h7vZndQowi0PrUsPvacbmmCJGRqP4mrny9vJ/pttk0IIqaNmwhc3gLI8+lfi?=
 =?us-ascii?Q?DsfR/210TmIwol+LtYZcNhLJVg4IwPTvzWLdYcHr7+y94KoD9xIgGtyHjG0c?=
 =?us-ascii?Q?qUSeHI78EpRktQalpN87dZvbki2SZ7sTtNr03DY4xcnI9L0kpgVLj651yE/0?=
 =?us-ascii?Q?1D9zE/V19Z3IjirGYdY7sLpbDLMNq3aY+6UsHjgpeovTmOIKUVf8vdcCI5ZK?=
 =?us-ascii?Q?5TUiQx3o5RGxAmnMmLPKQ0ehY96xX7mvhcfH/O8Drltu3piFjqEI/q3wSkyU?=
 =?us-ascii?Q?99Y2xqv3wzk1s8SY7XsYErXSQh35D31ie9B46VY//6SYIB06L6vDoJwQ/SIf?=
 =?us-ascii?Q?1VMDt6X61r/xhGd1Z2REUiBWTBQ+xXs7XJZg+oX7tSg0LYryb/3zY7akMwyT?=
 =?us-ascii?Q?x0Xmowyms2dR+HJ+DWIG7trbYDrRw2Io1yTvx2ViRqV4XKprUJ9dYT1E9GyM?=
 =?us-ascii?Q?pCSlBqszJvDeAp+lN0mNt4ia6qzVLJw/DlJQ3emA7DWh0M82r80SQKAWfPca?=
 =?us-ascii?Q?gIS2u8L2Qs5mE/w3vsVzTUBqJR75HkIDOuyukqzpIMTrWUMyVKaZLwlrUrBO?=
 =?us-ascii?Q?6f6ETTG9gCy/+y/QNarxXmGvTh0AzSWX8Ei4Dr2tG579ilcINLA0QFm5riZ1?=
 =?us-ascii?Q?kqD3L14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDppFS0h65jmPLfVbUZZmlMAZU0rzOSkBYJzeOx2rf0wLuY8j//6m1vW9V/b?=
 =?us-ascii?Q?gfa7kwqUevUBNzdi/evFHRx2ALcodYep9JBFPALHVJOYEFPkDh7SHcXAB39x?=
 =?us-ascii?Q?9u73wkALNZs0CiQIcsbKMa72ZxXHMccAVbaUiL/UAFDlRGCBlvzDmF2t10gA?=
 =?us-ascii?Q?J4tH1UuTnP6+1mJCriXjSkcKG1VFqUshIsbNYrkdNilIZ2r20drIXfsxhvw/?=
 =?us-ascii?Q?IJRVYt1mo63HW1EJGprjG7cj7SscB0I1nm4lT0DMdQNqzgdMtIrMv1ifPiLk?=
 =?us-ascii?Q?GmAmbfUAcv/l7UdZeaHJNMCXztJJUSu9GKrzlcNHl3tLAvcfwjtegnJNRwQB?=
 =?us-ascii?Q?pLb0LqtxFBFa6PEakZCDRIrR7gOWobLqkmMOt8oBh5PpvC5U63xv16XmbQK8?=
 =?us-ascii?Q?p2TwTK/MJyTeeiRMMJ6/kzpLiRVjl7ED+xsSPru+e5w2ZWgOimbzBpYIyHqZ?=
 =?us-ascii?Q?JphTL9lhqFVucoengjOwcdCbrXpDFRxGa9z+G+XkmTZ8q65hsJR1ZAS8LeeN?=
 =?us-ascii?Q?5td/2m66IBtdbcVTxmCdVYqCcP2sqmbuctDj3SgM2nbjSBXQqsN/snD+TI7q?=
 =?us-ascii?Q?7tmNi5u2tAwYv0cjMxwEsuTCys9eNCZQJRj5z3heotlo6GA6hRWD70ZVt7X9?=
 =?us-ascii?Q?bKOPK7iGG7fupdEHZWwtlPe4GnjJe0Z6+WsEzEBqKZBzRRaTG16jH273kFZK?=
 =?us-ascii?Q?UAl5CUnB3PEjmbacqnfpwEMfaSRJVqTaMAclqcMXya5p+gOInKguLF9VO8dC?=
 =?us-ascii?Q?C0qZ819XLrBPtS0khIQGFLb+kyB3mbixepn7QMb70Ni0fg3bOGLHLR1zgOhH?=
 =?us-ascii?Q?pnf/GeyjciHrbD8XqOxbIiXsJ9QPG/LXuZl1tmm15XA6MHBBd1uWSAL7Mt4q?=
 =?us-ascii?Q?rFLOLql0KGik3rc3K3ViaF7fZGBeBSEfWG4+dF9Cqa3P4Mj/0R/NvLA5CJr8?=
 =?us-ascii?Q?qTZULpKC2Zcpeb3pFTcA4j8hP56bZc/uYRI6B8dHmbIqNYiM3ddfksUod676?=
 =?us-ascii?Q?6YZ0wQUKUVlJg3EGSKKLhYl3Uj5y8dBG958tWxmpquywycPPYWFvNEmcDfPc?=
 =?us-ascii?Q?IEw7xWnmXvJbG05djtGyWdexqh+lyE2aNaQFNuy6R4yabIn+nuVxQuKu2BQ1?=
 =?us-ascii?Q?7NcNsSr9jXq1QTD4KdHxTczREcaMRVISspy198y6rrZt+SR4CFJF1SzPSuGy?=
 =?us-ascii?Q?UB7lIQPTl7ncrtPfXMYy7g/3QZHtSfYLpYqf7I4CLVXWWmEDRme57bzCK9Pg?=
 =?us-ascii?Q?qFziF6O19mmlj+i6doF3DfkxyWf04RpUzN97QgRIHlzbbnUZX0FMTzR0+UnO?=
 =?us-ascii?Q?Nmsne/1LKAZIunYuYRZ2TL4LbCihdLZ50Z53a93UhnDsrg0hG2NGOxyWkwea?=
 =?us-ascii?Q?fSF8UgI8+mTOqjejZFuQm/vX77gYwWvY1tdzghnsT50LBvpnsJ/atpc2/RBr?=
 =?us-ascii?Q?5lEIyiIucU7Z/W1yUz2QsC7BoQzl/MDEdUUz1XBI2W5cQehHBeUibJXHioh/?=
 =?us-ascii?Q?TddtDf9A3f7lBXBAZa2hHBm9g0/Wtysok4HP6Vicy+6HlWdXuc12VLXurZnK?=
 =?us-ascii?Q?u3aG7bRjqLt1O6MLS9rgNnZVqaRYLpNMkjUMGOZ6MIu73tLcTTjcmLFm0Yoz?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b5e683-bb80-49c2-d2e3-08dd868f5e8a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:00:48.3624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85rrpYf3xX1rqITVhJrNdECjcOykNwOkB8RnLwfMSyfSQZsaPCJc5mshCZZK/QhOX5TWha+nqVt9e9qbYLpV1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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

On Mon, Apr 28, 2025 at 01:12:38PM +0300, Raag Jadav wrote:
> On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
> > This series exposes sysfs attributes for BMG PCIe Gen5 downgrade and
> > documents their usage.
> 
> Anything I can do to move this forward?

I almost push it here, but then I noticed that it is gen5_downgrade.
Hadn't we agreed to follow what spec says so?

"to then automatically persist the Gen4 downgrade flag in Flash"
"Write Gen4 Downgrade bit to MRC Flash File"

== Applying  PCIe Gen4 Downgrade ==

Although I see that there are some mentions calling "Gen5 downgrade", "Gen4 downgrade" seems to be the most used term in the specs, specially when calling bits and
sections names...


> 
> Raag
> 
> > v1: https://patchwork.freedesktop.org/series/147023/
> > 
> > v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
> >     Rework macros and their naming (Rodrigo)
> > 
> > v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
> >     Use sysfs_create_files() (Riana)
> >     Fix checkpatch warning (Riana)
> > 
> > v4: s/gen4_downspeed/gen5_downgrade (Lucas, Rodrigo, Riana)
> > 
> > Raag Jadav (3):
> >   drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
> >   drm/xe: Expose PCIe Gen5 downgrade attributes
> >   drm/xe/doc: Wire up PCIe Gen5 limitations
> > 
> >  Documentation/gpu/xe/xe_firmware.rst |   6 ++
> >  drivers/gpu/drm/xe/xe_device.c       |   5 ++
> >  drivers/gpu/drm/xe/xe_device_sysfs.c | 107 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
> >  drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
> >  drivers/gpu/drm/xe/xe_pm.c           |   2 +-
> >  6 files changed, 123 insertions(+), 3 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
