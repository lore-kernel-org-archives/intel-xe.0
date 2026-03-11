Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD2C1125842
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B53E10E151;
	Wed, 11 Mar 2026 15:14:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D63E10E066;
 Wed, 11 Mar 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773242079; x=1804778079;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=plP3jIA1ABX1DtXDtLm9KmwqNeuuAykXNSL/gcGKeOk=;
 b=D2DAomjq1wHW7Ve4li8AcTUfPbhJ2kdgJRvuGhaxSJZ7d0v7bgR7suSg
 wCzehH8ztpp92wwcad8VnymqzmUIegfG76YUZrnPJliAgVja/iZ586ELm
 WyoTpi0uzc7TgF/FhTXRt/prkN+yxw0b2FrieJ21MLSkeooif2iN0dGgp
 KonkX7RynnSJ3BY+3mDA0dc1j5zFPdWU+o9eD8m2W0FEcPTRdi2QbPvCW
 EAthJvEpg4VwFPTPSfLkjRUpCuhRuYmsWY4aalMc6OasyvhUEdCaKueAl
 tkbcBJSynKD3PVoHuWSjOYJLduLbfaZZ81TGLCLX9zUKoHI9QeuPecVgE g==;
X-CSE-ConnectionGUID: UnND7NW8Sbm4qPqO2iQwVA==
X-CSE-MsgGUID: McSBuTLTTZWl4I3/YCRt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99781695"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99781695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:14:36 -0700
X-CSE-ConnectionGUID: 2k4Ai+n0StKQ8H3rVbQX0g==
X-CSE-MsgGUID: 1tsUqXU1Sxicn688t76tJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="223022020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:14:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 08:14:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 08:14:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 08:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJzrbExHaJOQzLYkmu5VZZzprSEtb04aBJgBwTeyTE3QrhjwD19f8hoN0Q+ZG2v6uKdb0y2SyQCl7f59M5lYY6qUfeZ+Q58xma+KuEYyRNyCNQXPHobjigiybNiVFFOREdtdJVF4EGR0kabm3MB/R+5JLknYD/Iz7MsL2gp1p1MqQw5VJNBCvCxL38/dQfrT/NOncxhXOX+IL38ZS65hfjigkHAHGdkMX494sfwhhZGyBzuHrT+boVqKrykefewtvRxHZ4TqMd2+6kwDm2o3fmHaHNO95E6PL6Cm6mYB1JK1gAL9ng/AhT1sEZCzDD7XvJfDEMlTmzyJSae5vi9T8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJQ4lYTmY6njG23kxlOgBJGk/AB7TsQp+kPK5jGwmCI=;
 b=DDbYoAnMgV915PBzDvjBFeCdGxnHVX+OX1NycvGL+zFHnEbQFbwYHY/Si2SlO+OBTtmehKQ1/sC3b9DAv3FqL0+eYZ2Z30+axGv1TyqG2IEv0Ip9wX1pct97dg+NC3e3s1TSns2dfuhsaFLyVn8pq0oA38ZUFIDrWhHqAFar7W94GgMkbzHx/Rxn2yP5eeLicnxUJ/mVZN9JAZcoV3k0Mua5/19qAuBRNEXKXUJXZ1Hcb1aTrXSmzKGN3RF62AMJciXRRA+awxcBB2BB2KL39LzpQ7FhAyHO1NdjVGJG39o5oWvt8pjU/jLAF0Njl7XBgXK2V2kwgwKL1K7xxlW3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB5298.namprd11.prod.outlook.com (2603:10b6:610:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 15:14:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 15:14:25 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for drm/xe/pat:
 Extract gt_pta_entry() (rev2)
In-Reply-To: <177278758472.325615.3132792443853457857@a3b018990fe9>
References: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
 <177278758472.325615.3132792443853457857@a3b018990fe9>
Date: Wed, 11 Mar 2026 12:14:19 -0300
Message-ID: <87sea65rg4.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4f36d5-6d59-47c2-41e7-08de7f80e1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2Skhm3r1CqZmUd0+2lI9e6/ZPgIikrX4SGrS1GzC+7r/UF1NTtIRpIYKIrv0YxqHviVRiWKUVy6viTjVazGjClXMCTkRdD5aQKhxyQcjbDLJYUUhL1w7ZAydqRSVSELD9qaq9uMnanmszQrIUJB8tBRugV4vgcnBaDcNGm4zAiO7DU5w8OCQY1haLD9nMsN7hnaZMSj1wDUdjEpfYR2eh3tq9r2/X9LdYK3sncUTDNa2JoodFf9UVzArmvTmGe+7XQEOna1be4zMfmXQpi075cF6lt2J86zCbMZe+CmZYflFT/MxII2C6l1ogAdzKyqfnZWBebp3/Ri+MfpX7yY+pGJTZzFcgX9HdbXUqpDVXkAUXds8STWweuQWX0pjXtIxihBgprscMe7m3DD5rKTfpsd5GdOnR6Az3igBDbX9w8cv1EopCsp851XexmiNF1qF191h6N1q4sjNmK8NjEHmiW2M5wDW6JCdDir+Wxd8WVi2ZwkyKJQQlGsclXBghQvmpcxxc/nffiK6JDhLxQSbOI1u6Z7NjE/JOr5LTsLnzThJ13PSPCu2yPP/0Qe8wM8kTAvnck1lnG4OL0YyS66IEGfXcAyCVNz/vuT4jKLESVcU4yuJhXOFrpdtPJGac616IDEc5THCXqbUsUaQKifKJY9P06RN5dbSTjDZ3WZw5FWlY1UCRl7idjKz6eQcLedW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHNkUcZL48tZ+nXWkG4WQfPI20KkiM7N/UPQ53ufVssb7LRh40rVDdwFQV8J?=
 =?us-ascii?Q?r9KHpcAFGL+AIfeyIpcvXuY+EaOuLJWTREvjiaQVDmhJK95lO0IT/hcShogD?=
 =?us-ascii?Q?zh7gKcOQyzARLwdH2pnJTksD5coqerCKvwpUihJHiNouJN3z+eqlFYwJlXK2?=
 =?us-ascii?Q?pzLOrizJwDiGpQbRt0+Yw3EtoVqFMGeDxjrbsb8ichA7dicLzzBG+CblUiwB?=
 =?us-ascii?Q?qxnAZcgKudGkkR2B3TIw0uUNrLs3vJrWVuSxVqkL0OrWWpxqUu9SuRJo4+cH?=
 =?us-ascii?Q?RMizv2GbXS72WCnzT+T1EJbKQd+RBbIjtlnRxoWm67mNkd+8MpV3I8GbFyo0?=
 =?us-ascii?Q?Zr3FHPrL4CTFrYGvtWsL3aUuuE0Jg4HRynqxUBNu4YBvCy579QFgNWFjXXCo?=
 =?us-ascii?Q?sk44OzsjXR9njwf7/SkG8sBHb+/ONswTBIOp7d5TaF4C+67igbnE9Q15/Oa1?=
 =?us-ascii?Q?ziXqyPjj2vK8Kwg2ln3IqdXjSQlqIbN3CX7mVEqOR3qQKmA1ULEwLsbkPo0c?=
 =?us-ascii?Q?GAoTg0XxhgoynYGiS5GTsY7eshMubTo+FiVFpZazFf26Y5ugryjRZksK5LTS?=
 =?us-ascii?Q?0HPSBWVd8v7R371nlU7VZe/XlxvnVQNhZ+MSvR8BH6ZNukw5NYkNPLsd1Sf2?=
 =?us-ascii?Q?XcX9A0/bbu602+hPN/N7mDGeCdY+qbnxZrsHZ5LbqgR08cInX1XnBb/CLaLj?=
 =?us-ascii?Q?hvHU4PUfREBIomURNnbKyQzd/gskfNKSk1ThBp3ya92mUfmLEMOknz07MOQB?=
 =?us-ascii?Q?rU5ut+rqlmBWSODRfcuOnOg6+ZGY9ZDK/tt91YYlEmcqizbte5lD0i87DDkS?=
 =?us-ascii?Q?azYC0fzIngiajwC7pjSURU15DfM+ZqFh1QXhCBHu0m1BybfnojCNpjttHyUg?=
 =?us-ascii?Q?OGNx3644RRjY8kAQaFbyAZWwF6xb5MAQ6rnKdUd9JJyqK5RaoF8MLK56gp5R?=
 =?us-ascii?Q?XnX7oH5FeAfTlXzlec/gjncZ7yrXuMLRHCgJpZlynnZEUzaMZ9aWZ9EYKxuE?=
 =?us-ascii?Q?dFq+89x5lM49mwRNbAOMq93U2Ua04OfZsRhOMfWVcCpDwSpqlPX5Ci0aRZwg?=
 =?us-ascii?Q?yYfqYwSIkOtRgu55VdwiThJgUzoJpxBNHu66ueZLLK+GbJ48l14DjfRjuhkz?=
 =?us-ascii?Q?CJzWKThvG3BKEaN5HRkGVTOWp/NiqPAZL4XUJtntTfhHIs05QE7KFIYcho5n?=
 =?us-ascii?Q?QeHVx+rSVbRUn7DqRU+5EcTATA0tbSyt2eCjlgYGq0P39t2ou2O3CKEFSpbS?=
 =?us-ascii?Q?tCze/kF9oPrwSZ3wnLT5tPk8dTayV8fzBCDsYGFE0fA2dwUHlCJ+DponLRIf?=
 =?us-ascii?Q?O9EOAZ7zmt0urURi0Fe8W5jSkoQlgwoVeymvGAWybJrN6LrP2iJLzDAWH3w4?=
 =?us-ascii?Q?LdpLJb4xNVF4joAr67EmqEWk3o+LPK+MF+dXrk3sv6ynYdHdLV2JqwD9mzwh?=
 =?us-ascii?Q?11rcy/KO3bQZmk8j6oGLTK3lkc6dzhKy8N8+EozQ5VSglYF7FS5PDdtleb4V?=
 =?us-ascii?Q?p2iwYX6irIBExibLf1XwV6pXqI9/vxb2Lk7dMrC0FjmS85YHNq0kyDNxVzjq?=
 =?us-ascii?Q?mivsIkn2XNvnJDNvvMdPygPB5lsk0qZlytmuSC9dG3hZxLMVhOsXfa9bIP5M?=
 =?us-ascii?Q?Zv1Nw5x1kkzbRirj/EHXdxRK8iF1hYlySKt7dTGLbaL/QjAx0iSj3VzitDcr?=
 =?us-ascii?Q?c2evEFbDf7ib9uSE6664xrIu8ytBRkLmnPWYg/HJc1A4vdsvcVZZHMhCRi1D?=
 =?us-ascii?Q?JlqyjhnvJQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: gg1B1BUuIF9d6+1RApYhvEHP8Mv0mYh0bj1HiezuqeVqQlJoGFDBvHcgwW/6OEgtWf/1sIwyL10Yro+tzRhYF34NbHb2hO/0bMJLprXz1vgkuv0DEb70lX/bNP9+L1u1+QFG7e6ucH622HLKjFDKZbmivCCqUhW6BTJJdxmWiB0IRu9K7c/pru1RlYQWxzkLJB7FnQbnAFL8N/4aM8Z6h0Ic5e67m+PDn6d3w4RBVDrHFSu4ti0Ft6PI7vU0fD6KGAJWfCBf41Ka1d+ELaZ/V7RthJDayrSIu5iKnx+0suzBIcuq6pPEeU9u2Oohd6HvrI0cpEg9zsliH4LyZ+ujGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4f36d5-6d59-47c2-41e7-08de7f80e1c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:14:25.5589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8RSdSUo2Vaw1iXav01CJQhS0CRpvaCCfVEN2okgE727LS2DJRIyK6+m7tc78lMAcxikdGarFNiKfaHU8WbBMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5298
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe/pat: Extract gt_pta_entry() (rev2)
> URL   : https://patchwork.freedesktop.org/series/162522/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9_BAT -> xe-pw-162522v2_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-162522v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162522v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (14 -> 15)
> ------------------------------
>
>   Additional (1): bat-pvc-2 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-162522v2_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_module_load@load:
>     - bat-pvc-2:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162522v2/bat-pvc-2/igt@xe_module_load@load.html

This is unrelated to this series. We don't set PTA_MODE for PVC and the
abort is likely related to the pre-production workarounds error message.

--
Gustavo Sousa
