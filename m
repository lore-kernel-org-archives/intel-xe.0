Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB19C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB110E73D;
	Wed, 25 Jun 2025 14:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxZAfzcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C080710E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750861039; x=1782397039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ij1zQdertT5Yy3ecd+PS6MnrJQ8975sqsMHhlkl1YsI=;
 b=KxZAfzcdv7cWmKD64e4ODdmWamii0rOaidhpF551fahSCKY+CQhjnCvA
 YAidhII9gxP+igWFUQ45wCQt/cPhRqXtc1X87geWAGCbyN+ZVGyV3wAH1
 bGNABOPowHF3zlVv70fdZ/eR3Y/5jGu+vmQpWrveXisXALafxL1qC24MU
 7srMIJTNQ/DFJkwfauCMZWjYLGvV3iy02SxS9q4FoY/wDyYmQ3Tqre0O2
 OVdGU5f6OFNDtGUK8knCZNCg7+u47bJXKIu7lszUvZVbtkTPwP+rEzvrH
 0haKDE68Ap6G6F5ZCR+0WN3q97nAWWZEWBzdbTx7fE7zExIgYBPCI6mDr A==;
X-CSE-ConnectionGUID: JneonotCSuWujEAdMfpy4A==
X-CSE-MsgGUID: uxytOoaZTE6IaCIMmoQ2pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53067108"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53067108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:17:17 -0700
X-CSE-ConnectionGUID: 9ftwlOC6QTSV6sVM0FiKYQ==
X-CSE-MsgGUID: 1rcIPny3SYajA17I+c4O1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151848827"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:17:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:17:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:17:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:17:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtY4OQqwK+M7p6cq2LHjRMz5F4QUREFuWu2sX7rrq0OtcH11k8wz+8Tm8aGuPOOp9T2yUJQbE2ByQYv4bH0vSyHF0lt6YNq+OK2thXyQTYRQbA27jn2CuCi0F0m6zf4v4eLjpAd+fz3CZkUyFkKYu7j+ymbewH589WsQMjgjsobEJ4etaudxpMTECrNgl5qfrahJtbjfS7D1lpJIH9cCZXJ3N4NXLGNb+8myvnnFkH0ZGvD0jy5BmeWJFH0epO56Np8sUYbVYyPaANrFU0Uqvw5fhDcDs3qQ+CM/KeDZN0nr4ph3DlTcXiTZ8uWFgLDVdhHuO0kjyXBZMDVLRUDgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjwKcycF+73MY185dAftMKTHnKj7ncVSPxW8tvwkNFg=;
 b=qifJvKJrkb7RPZLnwvmUmZTPdKRas3IUOywJ+cUmyj0UCCDa86umeit34AFJt9jWvp6NIdH+QdAIR61YEQ83AWLKM8hChlo9BQbUfZkHboNztcvlqcU0XvithYU0z2422/8DcEGJgE1RG+vzjeV2ZPjA0ed0DsW82xiamDHiOViXYK0AKw2QXqViX0G2KWGI4GUWMSi6sUNc+UL2NTwBdyQMhkRFiuFy2MgcZA0oEBUFJPfai+mD5x7bkDChRynut4XU5BJ7m2A1wBZc4uQhq0RDQdPJyDRSBMpBbE8Nht/8BHUP88tq7XhOlKSfiWWwEPbPbX7/NAZHLFx4+VUuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 14:17:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 14:17:13 +0000
Date: Wed, 25 Jun 2025 10:17:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Correct sync type definition in comments
Message-ID: <aFwE5xzuG9TATRtB@intel.com>
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
 <20250608230133.1250849-1-shuicheng.lin@intel.com>
 <DM4PR11MB54561CC1D8F1FC82EE89E8AAEA7BA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54561CC1D8F1FC82EE89E8AAEA7BA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0023.namprd21.prod.outlook.com
 (2603:10b6:a03:114::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: e124de6c-4a9a-4b19-4faa-08ddb3f2fb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bHdMvPLO4hpAzcP2lljiAJsnpJmgKXZKw4iKgziys1po/5giMQl9clJ+/gFg?=
 =?us-ascii?Q?rD+1uu4gIEvlj6eO/8wyZG/hoopygH7Dc58qP7qc9+DxgfxAZyXuQTNKROZG?=
 =?us-ascii?Q?OQmReng9hgtRcdgQhb7XxW83ZRMC+MK+rkNFplMwcV6GeY9M9ZVNhHtiNheE?=
 =?us-ascii?Q?9f7I5+V6/pp71Od++GX9PDbA+56RAWscvgmw69w5W0B4Ox0+mXW9sQgkI+Bu?=
 =?us-ascii?Q?PjAU7geFDcFSteJ2uHFUW/Mybzl+YhIv6OXX8KwBQtXerVFupM8nL883MJGP?=
 =?us-ascii?Q?nPSjCuDq2FmK7h7SYlqRpNX/m+D1d/q1wEOamikbnvv2gR+2dx979EOFBak4?=
 =?us-ascii?Q?98Fv4uYIwlTGzsem5cAHnTNbp5rirVsxXbSDAGn0xcHnedhM7DSLZynvu7S4?=
 =?us-ascii?Q?Xpp0gZ92flPlEVK7vMRHMX6ZtMdALbSLD0OmKCRdSO6codq6kQyENZRCj3z7?=
 =?us-ascii?Q?aPrwC+C/p4DROc5h1oREakK9aNBoWwDVRSUtqfa2n7dbANLTTElIyc+1Sjcx?=
 =?us-ascii?Q?QOuqTbt/yHR9mtaYjbOFgE3Zi6lS7ADKZ52FnrRnP8FESwkAlli77ykfwA0+?=
 =?us-ascii?Q?935AfpdTqqTCwbuxNMVDU56wuzmuM1T81aQ59Nhs6v5L+YtHnDfiq8R7K70c?=
 =?us-ascii?Q?hmBvw57OMu+qc4Iw2k44qD47XjhHrAUry9wa0//kugSM7wUp+HugRYi4f87z?=
 =?us-ascii?Q?IISWmxlryPtMaSqcIxYoEgAU7JGVuiXOsBXV+3XHdO+EO5Was7GkFJeiTbID?=
 =?us-ascii?Q?5wqR0tHU9MQky3VUmSp4RF0EyZrrKl6oaaiQ/zRLMkTiPxHwNaBTYST6aMPk?=
 =?us-ascii?Q?bbLMwIUU4sqiYii8/uw8hEaJJ1CqKhWuSYHIC4Q0J7O0OtTJNaHCVf7U1bH6?=
 =?us-ascii?Q?upY69WPqzMpidi9Ix0lOYtzxwCQLtnKqAAPpFmGuG9gMoYKKmRzUPPXLW+XO?=
 =?us-ascii?Q?j04fW/h2dixYQfvld5jQijyWT9AsUsLd+RXEjcN6bhuVM7uOqn+iEM7QiZSV?=
 =?us-ascii?Q?J/ybqLMGHTpa2gImNOKhHK+mSv+jPcmXSOWEhIta3V7DgzIbb8i/48rzERnU?=
 =?us-ascii?Q?VMh1X78AcSk28aIP51AZZWpaIDzeQ2grrbjJJK9k5svlfR86sO/3NSzNacWc?=
 =?us-ascii?Q?VV06Ly8izSRG5FnvdDpsRa/Et+dhk8mPz5c6kBnTpafLCKSusmKAqDaiK/QF?=
 =?us-ascii?Q?O3gMq95Rm8cvKZxLb7N3NdCkq9ibnPz0e3d+k27xREppI580JyDzNJqbHfk5?=
 =?us-ascii?Q?IKTPAUaAZc+sTf9gdNuhxk7YzHybqHZrjz7GFc8Cna6aP1Pkf/WvRJM9d8YZ?=
 =?us-ascii?Q?kt/vclxY3NHuZ7uXzzyYd3a55+qD63rB6yIgTel/TZOKL8YvTHmZYb8d3l0I?=
 =?us-ascii?Q?FPLkqhUslZqPMUn/3WJ/uDUoJbaHAA6q6Fng7rQUt3nvFZY2qVlzJaXaK0TY?=
 =?us-ascii?Q?tEiMJ6Ltrw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yhtn4Fpa80jCHyipzz7BCnUpWJ3izCpv89zE9aoZmRtvoUzkppa8MXRAbfa6?=
 =?us-ascii?Q?iCA2dLlr4TqtTt7ihIwaE/rB/alJez+gT3cnBpZxggWCQlkcUIqDNNsg8oBq?=
 =?us-ascii?Q?8LgYz19+t9Yhu4nhe7xJHEF7jz322ANzZ0g3HucZirFy29rSqqhz1pCWeknS?=
 =?us-ascii?Q?OycshvcYUm1I9EjkpqJ8ghR29e/1epvVC5HwDuW0WoxzYD2alGZHF4/EGaRa?=
 =?us-ascii?Q?4X0hWW6Tu7PoFs6FTOEhc1Xw9CyT7p2Rcwtpj3ppeXPhxp20Q1YIgNWPcbEv?=
 =?us-ascii?Q?6pxm1jo24may55HlOUCXOdLtCysA0REnawiH5mi+Vv9ZQcPNxAjgzdhrqYcG?=
 =?us-ascii?Q?uKTa32OtsqnStVNuAyeDRgP/ojlAaALZk8lRWPyq0mBsfBZHE5X+8IOsZedt?=
 =?us-ascii?Q?xF24Uc+WIKYuhssK7/A/GMcPRBJANEg/k59Ct8A+AkR3/OXNaa37fZjBD+Oi?=
 =?us-ascii?Q?6cFhYRjADhNKWtg/0u3NgKak+rXzdZVJQyeCMs8Ja740TF4lT/GdYolUEMI+?=
 =?us-ascii?Q?10ykb1KmOctWDjRy8E4LPkQ1fjOt53uMpUSBj8vLbcAtcjYFOKfln8WK8qtE?=
 =?us-ascii?Q?wzJbWQNfcREbp3CwJWF4aLDDFOF/heREtbZMR7jzuZB3/Ymo1JsX0eGRxvn/?=
 =?us-ascii?Q?SUn1PT0jzfhzTKVcaZvs7gr4rX+tlF/WvVYHtHu5PNuWIbYdoVBgb8saIj8K?=
 =?us-ascii?Q?KQJvUpLrUqB8eury5U1MMecaveyeQxytFf39M6c+dwkeuFtq2wKY1zzKzvEx?=
 =?us-ascii?Q?avKnCCBpf2p2iYe+/RB+UQqHtcjPP+u7vOwOxfMS3jDNbkb1qUGY57P/2ZSh?=
 =?us-ascii?Q?3OErwT44RB0kQR2ViUC0pmM11MeVFhPelMw8CgIf7x6sn5Yes2y4SyYyk9ZC?=
 =?us-ascii?Q?RKTrdTtMPOqXllvLgsSYDRL0PYd2RawAb9Lo8vvbpHZxhzN6F4aFDZKEAZ85?=
 =?us-ascii?Q?rdbO5ITb1iH+55JQG9f0o5jqVK75O6/TeQtOcE3G46wzU02q1vg0MytQRvMX?=
 =?us-ascii?Q?ArVN1RaZjMFTaUf0Uo4GP4YRndEpbEBoSJY574MVgZsJe2uXXOxgRaHBZgic?=
 =?us-ascii?Q?9PtBYg3T86/WC+ESwF1fkT+E8wipFU1zAMLEl2A/E2HiKfMaaERUbbmB17GN?=
 =?us-ascii?Q?BQiDIj7rzMTZ+PU4wYwDtDrYpS62fvL1JAfaXgVvgcgeD3Y/kpwgU8YXT3t6?=
 =?us-ascii?Q?b1uChNBTu28Kw2H10bMm2TnGO5R/DnEO6305wd0CZrSi5SZTaePU2psaU9YR?=
 =?us-ascii?Q?oYwQJRa//aoybT0ait+nOB7V0tJOZ//re2UhL2LpnjAjOmiY7IBBqusbgXxf?=
 =?us-ascii?Q?Ee8WmJXwrKddrPl/5AZWA45UvJdzQ7vFfS99a3E7z1F4GoZ2w9FQGRTuWMEV?=
 =?us-ascii?Q?NDQqAl1dehnLj4Xnb5lj00rnNwms/8tTsrhFNwm+ZnNREiTcBduyj7CljriK?=
 =?us-ascii?Q?JSEgZyIoSyeMiBP14T/WXHE/S3Ssl8e/K/pSeFBD9fN0LhmR9TRvDN/Nq8ma?=
 =?us-ascii?Q?mrtzU+TbguLKbFEDVHw/fMsK+IbRajc8S85MLLwDZ49kI1eiV/xNcG7G+C1x?=
 =?us-ascii?Q?0jDm9Ok+7AmEwDvmgdHzifPbxwRYAE2jL7f7RblmdAP2gfSvjc2gTnmlAKrX?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e124de6c-4a9a-4b19-4faa-08ddb3f2fb55
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:17:13.8250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy/VmFPGYWlIyOszsm4GYJxNaIWJCxkxzvgBhoHDGghvoJeCH/hoPrDUrJP5crF1jrfPRcncBR/xtvrSVM5IKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
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

On Wed, Jun 25, 2025 at 05:38:06AM +0000, Lin, Shuicheng wrote:
> Hi maintainers:
> Could you please help me review and merge it?

pushed to drm-xe-next, thanks for the patch

> Thanks.
> 
> Shuicheng
> 
> On Mon, Jun 9, 2025 7:02 AM Shuicheng Lin wrote: 
> > Commit 37d078e51b4c ("drm/xe/uapi: Split xe_sync types from flags") renamed
> > some DRM_XE_SYNC_* defines but later commits kept using the old names.
> > Correct them with the new definition.
> > 
> > v2: correct fixes tag and update commit message to explain why (Lucas)
> > 
> > Fixes: 9329f0667215 ("drm/xe/uapi: Use LR abbrev for long-running vms")
> > Fixes: 4b437893a826 ("drm/xe/uapi: More uAPI documentation additions and
> > cosmetic updates")
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Zongyao Bai <zongyao.bai@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > 6a702ba7817c..5f1524f466a7 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -925,9 +925,9 @@ struct drm_xe_gem_mmap_offset {
> >   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM
> > accepts
> >   *    exec submissions to its exec_queues that don't have an upper time
> >   *    limit on the job execution time. But exec submissions to these
> > - *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> > - *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ,
> > DRM_XE_SYNC_FLAG_DMA_BUF,
> > - *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
> > + *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
> > + *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
> > + *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
> >   *    LR VMs can be created in recoverable page-fault mode using
> >   *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
> >   *    If that flag is omitted, the UMD can not rely on the slightly
> > @@ -1394,7 +1394,7 @@ struct drm_xe_sync {
> > 
> >  	/**
> >  	 * @timeline_value: Input for the timeline sync object. Needs to be
> > -	 * different than 0 when used
> > with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
> > +	 * different than 0 when used
> > with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
> >  	 */
> >  	__u64 timeline_value;
> > 
> > --
> > 2.25.1
> 
