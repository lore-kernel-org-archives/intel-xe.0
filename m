Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA6C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 16:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C1110E0BE;
	Tue, 21 Jan 2025 16:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TP6Ptet6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15C310E0BE
 for <Intel-Xe@lists.freedesktop.org>; Tue, 21 Jan 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737476986; x=1769012986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+JzVKVjG5EfhBoIC7UD25X7hPqZjD6eeGua8Aec23NU=;
 b=TP6Ptet6+NW8jj76fIVv/1DTKe5EdicH7ZbYfwkiJ5wZbp1XZrhBfWEo
 DYfaOXMQpJeie59DMNlWqX1VBjrOezpDuAGyN8FdzAtUr7OOj9THqTpn2
 78nl1d4zoO9II37nkwq/K1G0Sw357+jb7IA1d5YpMRlYNII92Atc6E7fM
 waNd5047PGfmiOUotxaZfLPME+DXRKrkCvEDaBJxZr0iMqQPsg3LrDKBH
 moyT3cpFZBb//fTTrJRaLtYqQWJ/+mmotLA8e32acHShMEYw32ujtX0uu
 8LdJQgIbUKuQieFqOsX1+yIJB/R5mIUAuGnoSXa+Jt3K2z6a0LPdkDMAo Q==;
X-CSE-ConnectionGUID: 8TzftKDgTgG8dGun3psOlA==
X-CSE-MsgGUID: EB09aPh3QemJPVH6iDxmSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48565078"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="48565078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:29:46 -0800
X-CSE-ConnectionGUID: fi2Iuv7+RKGx65CfO8iBig==
X-CSE-MsgGUID: Wvo21KkITkOKarE0pNc+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111848339"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 08:29:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 08:29:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 08:29:45 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 08:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnC56PJTIiMoN6dE6oX2yOvKuoaW6dONJ5GPiYKYMQeFcfwv3ZX7iw5p1K9oNYd40dYlyucx311Ie0sLfK9WjLmA8h+8G0mKIwhF36dGfy89mf0xC37zEf4Ihv1+cFpetyuoGofb6oy/jrzcAeVlI8+chZDZFWBXQTsTnBfgL1E1aPWf/tFLDnH64rHncjB2BiG8ebxyeoBOVLeuIQ3cNb86+02iyehPfuz5PNZyeZ1yRxiBArD53/TLlExgzkgPhRsP3c8KXEBXg7DYewXkZKacnSKeqi2o5L/SdAO9xrlRqq+EcIUD2nXqJEKH5wihhTPgxkkCeuC24GEmMXx8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldc3sSXodA/BmQ5nfEoV4+SwjiS0lJG2hPDqneVbYVw=;
 b=oeNY5MWQa5t7BGZrAGjv6wFynfyI0v54QGn/B3WKNylkt4D+k/koqtmRBSeXAxqmbDR2V72jLlN+eLc8ReKeRYCkIIceMqUdFs/Wt5uZfqFbI8A96/ZzUxjkXHJXVxXKohsPqwq0Sxopl8wAtKBL/5S1CFPqjmi1y/eZK8Sy+v7MZU8zR16mU1fErvexASHPOZFymxXkM/uglR+kYc+o7ijm8NEq3ifPKvLAjDZH6XoTjgP5fh4CjYt9RbgLLVlm9OmWu/zsMOnoJRF9GPj0zQH6egvIrvaoq9r8IR3Vq1+pjjxk/HBFQk7cpsAn+3x8Dg3dPg/BQJqlY2+OaiMR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 16:29:26 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 16:29:26 +0000
Date: Tue, 21 Jan 2025 11:29:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
Message-ID: <Z4_LYzVd6jfUTUXj@intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:303:b5::33) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY5PR11MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: cc768834-a2db-4ff0-4984-08dd3a38c549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7nrpRCVBBt86EuErqpMc+jOTZX3r2Kjq0pkDdoH2ET94XA+vD14wDLNKSYPT?=
 =?us-ascii?Q?wPfQ8/oA/akhEmbpJYOLVWawZq1XWz1dDa6LbPkgFY8DOLSJuglD9OayFBgF?=
 =?us-ascii?Q?BOnOUHvUe4f2Y4Aujh4mkpy5SIq2ar2LN9lG4lBVDl7IsnD0X6TyynuXH3Ig?=
 =?us-ascii?Q?fgSpnvA4opzeeWe07LfISUCGSpeYXKs2x/sneS4G6O/E8873gNPVKpbFIYnE?=
 =?us-ascii?Q?ChcJSaQ84PsoyKeKCQ5swhTOnaOqWHLkgBrILQk71KfXwtOA0gddGn2MRHLf?=
 =?us-ascii?Q?mmcf4jECVE6zaNDLpFA6UE/Lxg7yHPWYn1/08p6USbUA781euRQ7j1Y8946u?=
 =?us-ascii?Q?AsgPGVS46ufiMN8ukKIpyUeJ8jJyjR1iCqvvQnG9M/PJtItVOr2tJcBQl01w?=
 =?us-ascii?Q?j6VRSBxBJCihIOPbYNdhXtsva4tABwQdmicPsSJFkN2115W7nyc3LXWLYMwj?=
 =?us-ascii?Q?l3CGD4EsUEbLJYmLoHhiBdloHtxoB7ca6LLPISxqTGRQRP9fguQIEDEaIoKV?=
 =?us-ascii?Q?thCU5KDdpumK8vUGJnS7Lv2WL5i3LwPwnla8gBB0hGWLeQr37yht1kq6eoba?=
 =?us-ascii?Q?6Qvks0TyZuy6dl1VvUOJF8gNFFZ/lTxxKignNpGDfRisXkAz4rzBu9wZn+vt?=
 =?us-ascii?Q?jB8gKINvJjksBhsWHTRi1ltip8mEp56scogMdSFExRDdttxcplQEdes2GNN7?=
 =?us-ascii?Q?EsVnF2jJqQiTPPas2JTVWoY5o/ALz99pCutls8PPNMDb/ulupXBC1i0clRVM?=
 =?us-ascii?Q?Wwg3X65iJatDosaiPWFYlJoqPHCuxK4ywSenf3Tljj3JjLyh3xujDVYP7nf8?=
 =?us-ascii?Q?ug/aZH/htG53DeNbk1IKTkqE5FyMat29ivKVlLBIzJiumBOmlzQAycd5dohn?=
 =?us-ascii?Q?85lhN02j86Fxw3GEkgHEQHMgDJKfkT7wnJV7o6OkdS6jS8bBDhF0z+WqXXTd?=
 =?us-ascii?Q?XNsUGRDDqTvhvi5kaMxDwab4fUBCyw5IQHvYNzopRDrW0WEormjLi9TO/hLM?=
 =?us-ascii?Q?FqmtSDmmCUdCV77W8ButWxrDfQENeNq23kvSJ2iSTVHJKd/b4Ysvz0bUiQiM?=
 =?us-ascii?Q?gMxZw4RE27upNONXxdiUkcTvaE7fjfeismWNVIJAU16fiPhUO3yyIbQzM3XP?=
 =?us-ascii?Q?i5B49XXEpo8LcCuvlVz/YSXYJdQ8hXxshz2QMP1BQKqMaZONHmrbvbHev2rP?=
 =?us-ascii?Q?UF+wXtYSzmc8lNoALFg3VAdCpiWAfg0f7KEWTdpXDOIoWZI0MOzHKIbn3rF8?=
 =?us-ascii?Q?8DfjFCiiEloeY8TK4/p/hgv76Yw2WIPzLg4FbSYcf0PNe0jKgkU5gpaYbiqg?=
 =?us-ascii?Q?ylZHyte7hKMPV6qQwsvywV04dtpwqfPFKTi3hjQ3fVBsYMbgDhBFc5+2YLht?=
 =?us-ascii?Q?xSYyFkzqF10JVG03BZtFqXt3n5YG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b5isGEdTUPyHX6uoL9KRufhlr5tnJYHOcvzZiylt8vMwvhvUyFzq4k1l4hcY?=
 =?us-ascii?Q?wXYvqoIVuvEyVe1/NH9cnlxvIWNGoiXMx+i9gh/r9wrOjYvEMfUqrYzMxxv1?=
 =?us-ascii?Q?CrQUBeuzR0K6ZJMzvPvZ7IamWOcEloG5RSBEkJeQSrDjp4eymGhhkNFkOYvc?=
 =?us-ascii?Q?CwP88PdpIAKiRJQ+Y8JtUeyh8FPWa4yALd6ZTSlS+B+9SlSQgBFsSzgF38+7?=
 =?us-ascii?Q?K2wkbYUGJf89FzJotEnbuKZoSMAxxJK7/B9Fj6AGrdS+EqyJSeAUhMhkKsOu?=
 =?us-ascii?Q?UgzDK9uRr1Ng1FA3aK/MeI0vcLWEo3dE9LwkYMsn0o1idhSKiiDRnc0BVYGu?=
 =?us-ascii?Q?xYxQJ1fcFokbeoy53BPPJ2EDJZiPTnNdCQQjK67Se7KsnW4F2uOZr8DozfNZ?=
 =?us-ascii?Q?2JrKuD0fF3wZFvuIrervogF74udU2PeNy/oaOBCNLlWYiCXf8OaCXWXf4cU3?=
 =?us-ascii?Q?8kQc0XVU+UgD/PbHOErl03eTQE+bWdw3CDhc1AX7s3RYqKyLCXDDlVmarhEe?=
 =?us-ascii?Q?WtwCtL7NkSK2PNMrgtUXedfwlRwOv91VpXu6B0iPnXWR/8yjkUP7FWdlsS6H?=
 =?us-ascii?Q?eq5okge3T/JsAn8BB9IAi4je+YgaFVQTnUOpdYU8+yZQTUr0ZtJZZN3HbD5Y?=
 =?us-ascii?Q?BMbHIEkplo5p+G0k2DgwFo3+5oHpHlq/rDIBd0HhPpf6eK1siz+pdE0g8yMU?=
 =?us-ascii?Q?1XVQIErtQNNKR+Bjwgcij1ZgM4odDTyRiNxDYttmCRaC0tzIkLDR+AmrU3VN?=
 =?us-ascii?Q?CH+yL6k/q+nxWb6hSsZJUSW+pLtQ3ubY0KfMx0fUkMIREg/IFhI96uBb1hxf?=
 =?us-ascii?Q?XNbNqd/NdW+eky3G+Aga9sVz/hQQr2huRyzk8Onslb/3WwJ1gKut+xkb49gB?=
 =?us-ascii?Q?hNpFOJ6ktdGpAjt8s6je7ZHz5EqhxtGRu8+HRJPjTBldKHq+AnjJfKjvA0s6?=
 =?us-ascii?Q?rurwaDvDpZHy+t9NXF0LCiuZtbqZn9jwlgqB5MJfdhWVC3Ii2Zcwyrgzv+Ca?=
 =?us-ascii?Q?RLOVjgPaoz6vDJOB022b39wrrq3ERmQtW5EO/9aIDsK9I+u/eIWkL6GuLkfY?=
 =?us-ascii?Q?iG/bASU7uY6r8B+5jdcmqWXJCGJEcNMJI9TF+VLsd8P/OHvWL0WyqDidViZ+?=
 =?us-ascii?Q?JqHPo0t3nJRV9P6tDakdaVniZmVY7g7HIhg9GkGzyFJTH2vfp2Lf/7vWvVNI?=
 =?us-ascii?Q?FtlUvW11Le5yH9Q9QyNYUpeyQ2LFur6CuYdgb2MgabRdBVi2zfFXoQg0Qcc9?=
 =?us-ascii?Q?yOTdMLsQA/6uiRsERcNg9uxRDFQh8dqZlhaHV046Ug2rz1wUTb9jhcx6qvrz?=
 =?us-ascii?Q?wNOuHm0qXSMyJ3dHTefBzNpgNzvlBxHY0jjxcZgKwGsChaAtioaeRslusxoI?=
 =?us-ascii?Q?9VnQg++5nmrzNilTzGiCqYB1S0OU9gGRVBywhlkbO+aYSWIfP9owc4uZ/GKL?=
 =?us-ascii?Q?hqRyPy7SNmX+lV7VADFWn8zLm8H0NlFN1SHJ3vSepT/dbBY87OJlBcL6hlbz?=
 =?us-ascii?Q?GXD9KgJt9eDqFAOKjd4EcLwVEYqwLBslZ5h9XZzNLe+WYCA+QaqioMAKN/L3?=
 =?us-ascii?Q?jRvE9TVS+7l0hzXj9M6QvTgl+sdRLMdOmFaaU1ZKkHClkyJVB841ZtjpC1AN?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc768834-a2db-4ff0-4984-08dd3a38c549
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 16:29:26.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBI0PZZ1MO8MyMpGLWVcctF/6JrNMSerlRc3w79KVamBtcEHcIl8cA8kPC6CPJEj6qz8njMtkcECmOeSDU6GQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
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

On Fri, Jan 17, 2025 at 04:54:03PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The steering code needs to know slice/subslice counts and this
> information should be retrieved from the hwconfig table. However,
> earlier platforms don't have it, hence the KMD has a fallback path.
> Newer platforms really should have the entries and if they are missing
> that is a bug that needs to be fixed in the table.
> 
> So update the complaint to be an error on newer platforms and remove
> it completely for older ones that we know are bad (but are not POR for
> the Xe driver anyway). Also, re-word the message a little to make it
> clearer what the issue is.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a1676b787fdc..605aad3554e7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>  	return DIV_ROUND_UP(max_subslices, max_slices);
>  
>  fallback:
> -	xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using typical fallback values\n");
> +	/*
> +	 * Some older platforms don't have tables or don't have complete tables.
> +	 * Newer platforms should always have the required info.
> +	 */
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
> +		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
> +

is the information useless on older platform? Shouldn't we keep that as
informative at least?

>  	if (gt_to_xe(gt)->info.platform == XE_PVC)
>  		return 8;
>  	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> -- 
> 2.47.0
> 
