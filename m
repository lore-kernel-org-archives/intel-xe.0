Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65317C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 16:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1553110E069;
	Fri,  7 Jun 2024 16:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFX6UUjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FBD10E069
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717776551; x=1749312551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LaJuZFJqIwkeTciaSys6lD5C53J+so9fo80AMK1gWdU=;
 b=cFX6UUjUSSb6EdDPwGlIW6Gkkp0JImTx1KOaFEadHXNdO5eBQpu3bwzI
 ef7eoERm4NJz07GdRJHaS1QIdepnpv6utqFJTONOk/1P1N5nr27zD7ANB
 3aH6GXK2ra4RRZ1t9KT9GnGKDRtHdJe6oId6/gpB6hOmFvQPlf4S1HMRO
 ba/v+K7WSY3fCxipkTEup1V0U8sZdmRvcnmhsEpN6ls2pNiJ4Tgjnsbur
 tm1yWBR0roIzAX3Yr+3HBNboWGg0SWzO1BtBEPu/RKyaPB8QfNeMKcuHB
 efLG2K7x5olp6ibdH4R78TH3X3MHrB04MZj4UT52p8MjFggxfVeEXHzyS g==;
X-CSE-ConnectionGUID: GBJmrMvkRF+uOqKkFAP82w==
X-CSE-MsgGUID: +iDkgl4TScyNsRvpX04lhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18331200"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18331200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 09:09:10 -0700
X-CSE-ConnectionGUID: IcLeGTGlTrChxkqQ486HIQ==
X-CSE-MsgGUID: TVLfXIGZQ4GHOKEY1qLa5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="75853075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 09:09:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:09:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:09:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 09:09:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 09:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5z8W9hn2G2IbINF1+1QHgrK69XUvEd3s5rpy84AvKxYP00Z4rbkU1W1WGRoUhALmZP3Xb6P8UEfNb+ljYJQFwTbDetstbGss8ulBstA29qVcQhUeb2zGmOUws2YJm93PSqMW0TMked3DaUjd52psqOijulxMdoFrnpA5Ds5DTBr7XG99diGSAULOFY3vzs+Ds3M8DYAEYEZNRTH+w0wjM9iGCPbBquEC11bdIfK3at+tRRdhCNf2LJaPf3EhCo3d4E0yLuRKwKzOgariVTFihkEk5gZcn17ncudlUmTUrdV6iYF5e82cJD6qTXpGwzRy4WGqHzMtqjJ/qWoQnSefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7EBp+PDQUKmsbCbZ8UP68ilJz0gi/I43eZT/Fm28r0=;
 b=SO/my+uW8iQMVbbJSQR82l8FuasG7Jq0BohFURhgHJVIahvYniU/Wdgm2kASNvIaAWl1KlxHUmMj/UCVRjYLtp9rDK9CfLIOZexgM1aECCYib5yB0E8QxXlHcUx1EFURc/s9Vc88wKhtfqwozvC6vGk0bLVPwA1KQIY+PrLLqhaUZB7lOXQQ4MeMtqEmEl+zOZsQvIIqBvcRq8XWa04cRK+OmTt+P/ocEKcsRzk7TdvnQKsD41hZzwyLbQ41jElZHZP9Gg21K+Et/66Qz3oaPz6yFV/K95gcHR8KXXYJXyNLhc9U9RAyMeMgOuGX34qfJh8DRxHL04T4BuZ0Fdzn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 16:09:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 16:09:01 +0000
Date: Fri, 7 Jun 2024 12:08:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Assert LMEM provisioning is done only on DGFX
Message-ID: <ZmMwmm1H2ylPCKa1@intel.com>
References: <20240607153155.1592-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607153155.1592-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5b55a8-3cbd-47ce-4763-08dc870c2550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VoMUufUUGONcSeHJu6gEuJ3W6FyftmqaAoHJWOkVP3odR5f2QnyDH3dTgO?=
 =?iso-8859-1?Q?oV++T4ksd5ba57W+5BVTNs/jTVxKAC6WQcRM48rYgEntcrC7BaaejNDZQI?=
 =?iso-8859-1?Q?14L5QDzMgCM0N3isB1B9G+eyZ7TvWNP8FPyDsmPICveaQq49MoYpuIcrnR?=
 =?iso-8859-1?Q?UPT2fwvH6wNMC55M1FdlbCOzQcwIqKlN83fi+UaZNB9hcxKesHZElTgoAA?=
 =?iso-8859-1?Q?KgxTZR0gRS8nkboPqdwynPGw/oKWCNc2dpSHsx8JASUsLQvI4ZvKASxe/B?=
 =?iso-8859-1?Q?zLl5RJSxL03jlEvwmtxnJ+qLwg3HYxVIHye780b6Hy2A3NCK9DLmCyTcnk?=
 =?iso-8859-1?Q?o7F44rZMTb4Zs+870IJ/8erj6MAfAXPv/ZneXW04JqRa8KhN4A5T8vEuOV?=
 =?iso-8859-1?Q?zk5Ejh1hW9zthVP3OJSuEu/C3aBwOwAihN0klqMzIs11sBrZ7kEZUu6DUs?=
 =?iso-8859-1?Q?PrBIs0HGxRCQQxbwSfMuXOUvhNVSIMbjYNOgQANqzsneBj4LkRRKPkTsrZ?=
 =?iso-8859-1?Q?NhV+5BXTYI5NmaWqeCDxfOM/hQsKq11NJEmD8Zy+X9eRsOxxb1WckWHnNk?=
 =?iso-8859-1?Q?6ll6T/p3+Ob4Tu1n/znSU/wLrQR0uN2/+t+ugEbQ9U2nn+PYdaMD+jK0o+?=
 =?iso-8859-1?Q?2OrMQRY2JnSXVbuN5oukbFw9kli1Q0YdUa5UEB2cMv0re42HCvuEFJ4Z4S?=
 =?iso-8859-1?Q?cYEAtsb6bT7CLSinQccKm8745YCuHYwIAvC6nq/4GgayejUtxm6/qVuoH/?=
 =?iso-8859-1?Q?dA1pN4EsoreONgrbQrMl0r1iCtmj5xfdJ3F1HxB+UWXV3YUpjcFXT7aK4U?=
 =?iso-8859-1?Q?T6T/mFwl45bWKvAomqJjcamH73sH7JYuNjFU8gFfL/dhTAfbkpyGmyLeal?=
 =?iso-8859-1?Q?K7aCv4cCtf0eYD1jXUb/K8lNP6BEwtyn1lRv1jPbD1WAnRIK8cI1Nf6vqm?=
 =?iso-8859-1?Q?C04vI73IaXyyPH8frVKcU9SAD4P5dXoHsuStMrySZ6Assk+15JWEZJiefs?=
 =?iso-8859-1?Q?wE/gholDI8H3AnFfsH7mXy1RRCsmPQIfTAxGq9mRwPJ4O/iKNBBxD4Rr81?=
 =?iso-8859-1?Q?qUAHmNy6/ZprIi5sMxzi0/802UcS3ebE30TdCRJzWULEOQlIvOxi8Ystbd?=
 =?iso-8859-1?Q?qoSyPkpoe69Q7u8kMuQ30GpLbAOIXCYwjuxZJZuxbdUf0bbrcnTiG5lOYe?=
 =?iso-8859-1?Q?7ErzZwi0ZWZztNPPrXGoHf8FL5NdvZCXsn+OgKdSWKMUJeL4dnCKSVZHis?=
 =?iso-8859-1?Q?NVIc6/Oe+RynAt0OjUD9igg+hG46K1jNa3jfDpvaEjPnKb9MUy2J904KPh?=
 =?iso-8859-1?Q?kduEv28A8Rj2CJaz6PrwmHvReq4t4aWqkN+QuubyGRJYr2zcztWPGJiCvd?=
 =?iso-8859-1?Q?o59Oh4sML5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3dLrU+yrtBeiVbVjgaQTKocJTSXZKaRjXk2vgv4BY4DkNHsoeWvwVTN/BQ?=
 =?iso-8859-1?Q?pcwQLY+NM5Hz/ujH9cGdP2iDsToJake3kqcMh63CEufHztMzDMYGsWegO3?=
 =?iso-8859-1?Q?CExwLIPFcTKG4L/VZeANs30q8KFbupW9R9fJpxA5VuVfZUWhIKX7M1EN+1?=
 =?iso-8859-1?Q?zjD1ZRyc1Qdf73i4lAzdkceckmMdHTOZLzu5JcML0e5xoxGhnXdmpHSLm6?=
 =?iso-8859-1?Q?iX3BZc6pqnlU4VUvtnoVpXA1lTezDv7I1X3NjjyQ4WGO6hoEfjeiTBMEhk?=
 =?iso-8859-1?Q?l6YxjuGKdziHM3K7eqsuMLeD6hUgfgD9dbqAGk9FtjQAAq4GGPTtyn3esm?=
 =?iso-8859-1?Q?E44yqyz7B3GCBoXELkPUbe15hn7GWbD5nZQ3wwStEH/insnsxiJ6gaDQ9Z?=
 =?iso-8859-1?Q?XYsH60EjaPZc7OpJvL03Xl0FT2K9bdqCsIx7RxlGgdQ69eoVv+HMA+tIzj?=
 =?iso-8859-1?Q?UUHUxa5cC/Y3dMJHnV4Qlqt8cYJupMjoqt7QiOOYw/kKeD2XniJYX4qnb3?=
 =?iso-8859-1?Q?WDru8nIQZhajYVnR0cDtXY9qYy1DLl4REQ1zy9wqqH4ZL7cOK2/Bvo4Azz?=
 =?iso-8859-1?Q?qqintFwr+OJ69lgpqU1d8xiU1f5tLnarDT6ihYhJW473iyxHDs1u0yDEmA?=
 =?iso-8859-1?Q?cpd7w3VIO87Pq+Kypagxb3oOe7b0uGTmd2L8ImUAGLFjoRalFHL9zsDtFd?=
 =?iso-8859-1?Q?8R2X3WXWGIP87CGliAphml/oseE4i+R51870QpqYfJEd4gRrvWJJeqMGEa?=
 =?iso-8859-1?Q?CS/EeK2kj4IFc6iQY7kCSxaQba7tRdotA19+AHNWRoFTL16E6WovdP2R2E?=
 =?iso-8859-1?Q?CTU18T3N5eObNOyVS5A1ZeSUz5FscJMQFaYcJoRyx0yd+hswMb87AlbZ6j?=
 =?iso-8859-1?Q?X1h4IxAqX10OWlDDympCSIgvmF2zs4hVHamLsGFrxg6yPTlAi4JxFUOdiY?=
 =?iso-8859-1?Q?MNLJkfTpgo3lFWiOtuwgFIkvtWraFG+ZFZZE2JmvHIalpBT8L8E+yJxK//?=
 =?iso-8859-1?Q?GAMX08sxyoUWkxBtRYdTyONLhRlVyNk7HD3G3F1/6sXGTewFfCqxP6HqwR?=
 =?iso-8859-1?Q?JQLvd1JynIqPxuMIKHzG3lTVa4++cf1idKvEYvoMJR0jiUZ5NvQbMAeC6r?=
 =?iso-8859-1?Q?yxPOve82QkW9YWpXW8d/kkWT9KNFjGyn2rQJkplKfb1hm65KDnTbTonaF2?=
 =?iso-8859-1?Q?fp2+WTauZYx3UWnLUp2/V/NvO5PbkuifCaQ4KA/UwQVR88fVjss03p4O91?=
 =?iso-8859-1?Q?zg1zxEnWsXbtyQ9be3f+pDGRPPjtHN5ynRWn6P38gZ0x/FRaGI0vR8i4Ip?=
 =?iso-8859-1?Q?1nRLXN0Xo6vqDgz0Sz7pRkssa8ocBGK2QuU3Gjze06DALezmFYYPwd0ioJ?=
 =?iso-8859-1?Q?Iq6hkAb5MCbtyL/FKrGo4yEOPi0vUzsrsTizRYfbctb8l6arvqmIXy8Ho8?=
 =?iso-8859-1?Q?eDc6oMbD8FqklPBGPTVSF9doZClCJ9EZGjva1dkyzoo0n0fXLRXQejwJT/?=
 =?iso-8859-1?Q?vdx4bO8g+e3nJ3U0Ot4CB0PebBUTpOwKY1/VQjpaFAKxUgwdK4728W1Iv1?=
 =?iso-8859-1?Q?Gd/1B2G1ddVdigxwuKNtu3q8lVxOKN2OqYceyF0I6MZYqK3tIm6lMbK4kT?=
 =?iso-8859-1?Q?ktrHyb26EDAs5OuibAsfcaMdSwS2y9NCx7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5b55a8-3cbd-47ce-4763-08dc870c2550
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 16:09:01.7875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUzlHP1GMJAsXYuravyFKjd88iSTNAPJPIWy3jN/h0TKAXoqS4TQo4OUPb8ljD5RAdkh+pMUeFh0QwwY9Le3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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

On Fri, Jun 07, 2024 at 05:31:55PM +0200, Michal Wajdeczko wrote:
> The Local Memory (aka VRAM) is only available on DGFX platforms.
> We shouldn't attempt to provision VFs with LMEM or attempt to
> update the LMTT on non-DGFX platforms. Add missing asserts that
> would enforce that and fix release code that could crash on iGFX
> due to uninitialized LMTT.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Fixes: c063cce7df3a ("drm/xe/pf: Update the LMTT when freeing VF GT config")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index f49fc2917f93..694671497f6e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1290,6 +1290,9 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  	struct xe_tile *tile;
>  	unsigned int tid;
>  
> +	xe_assert(xe, IS_DGFX(xe));
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
>  	for_each_tile(tile, xe, tid) {
>  		lmtt = &tile->sriov.pf.lmtt;
>  		xe_lmtt_drop_pages(lmtt, vfid);
> @@ -1308,6 +1311,9 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  	unsigned int tid;
>  	int err;
>  
> +	xe_assert(xe, IS_DGFX(xe));
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
>  	total = 0;
>  	for_each_tile(tile, xe, tid)
>  		total += pf_get_vf_config_lmem(tile->primary_gt, vfid);
> @@ -1353,6 +1359,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  
>  static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> +	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> @@ -1371,6 +1378,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	int err;
>  
>  	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, IS_DGFX(xe));
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>  
>  	size = round_up(size, pf_get_lmem_alignment(gt));
> @@ -1838,11 +1846,14 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (!xe_gt_is_media_type(gt)) {
>  		pf_release_vf_config_ggtt(gt, config);
> -		pf_release_vf_config_lmem(gt, config);
> -		pf_update_vf_lmtt(gt_to_xe(gt), vfid);
> +		if (IS_DGFX(xe)) {
> +			pf_release_vf_config_lmem(gt, config);
> +			pf_update_vf_lmtt(xe, vfid);
> +		}
>  	}
>  	pf_release_config_ctxs(gt, config);
>  	pf_release_config_dbs(gt, config);
> -- 
> 2.43.0
> 
