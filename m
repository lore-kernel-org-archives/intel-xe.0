Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504CC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 16:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130F110E515;
	Wed, 21 Aug 2024 16:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXmi0HFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7310E515
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724256240; x=1755792240;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CLlgxC4MTo9j8WmkzRko8PXXOlAFxxaSBtI+r7W6TNY=;
 b=eXmi0HFDfNOb0Skpkz/JUy34Q9qFNcspIHGS5RkSIii0vDgx1q4Mesh6
 2/ZUcietUaIE1h8EjryoxHXO3p64qNIxCqVWe60kbbuwSf7nWrkzw+YDQ
 KFhYGjsrk8WC1BmTJxQ75CjCwAcqrRRW21fAv9O4YJBsPyMqVzoM0nM5H
 RkH+j4U5sQLKD94elkJoPvG4jMwV7DlDjswsdXMy3XUplfLF+GkUXIqhY
 qX7dtdTZNrQcq+IGOdg9GT3ht20sCaEP/s1q+/hOVqBvwyHLX8ozdck46
 0v1uetc1jTI7YDHdzfdNVDbUfEh6jn3KWoPYbNwzqoGaA0Z0bo6N1NlgX w==;
X-CSE-ConnectionGUID: RoO2+yfRQg+69Xp0kHcQgQ==
X-CSE-MsgGUID: RGVeU072RmyZNX6sb9SAZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22760936"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22760936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 09:03:20 -0700
X-CSE-ConnectionGUID: 9U+ti8lmRNG+F1dsD8o6kg==
X-CSE-MsgGUID: 2VFt9r7ORD+MlXY8SH8FRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65342292"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 09:03:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:03:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:03:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 09:03:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 09:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh4z+oMoR/vXPxsL6R7oG6YeKhJd7fryTCwKHQ0pnJYNCa2FXXfCoDT3eGKpJ31+juOzM2YaascajtMNUFoNkFLQ7zoycbgvEbAC28Rj+FOs8pAclXlbRQgPDjlD5A/ybqeSVIrGKyx173+3jWZpCLTsClYrmewbjC0/Gv45qEXP5BfIJfVcJQLFjaUvoluRYzwFGqVs0AXD2aUAjI5jqZAvg5PsEC/glfeSPwBkCSIwZZxdpUnod/tVDmbFSY8hq8Av+2hgyjscEbt7R+OQlZMa60rGH2V7i/A4JxXS5uChB/gXTC6eB10Dczu2yiAUtDamgUwDOzLybr5/Y41eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4eNbfovy0LqFyg3129uZMm7J8VQ9YJ4rrETk3L3IUs=;
 b=sSwLtg6gN92CN4PpRNCSEGSIauzBQv11T1QxqHBKVdo8dilGVbJTUTPqELNR9YfP+hec5vMqeVTY5EI0nTlZiFXaLsYTEvwQ0/3QJBX2S3kR7xdYNHR96/bjuHBIEMEdjEGUFpatnu2W5taZf+TBhK6tXbjQGR11g/tIF3aVfCq8rT8dusCxb5ImkrF7a/ZHP2ExgPK8VsTbcO0Pp2NCOlyIJcs38Jvgiq9e/7vcrh2efIDcve6yAkN+i+2/HHQqR9dbSzKtSaF8ABmUgRswUxr93+/6Oo//jGbX1Y66ViHJuevKQFC6BlJcsLd0PGNbJat9J9GgtIz2sLeQbJOEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 16:03:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Wed, 21 Aug 2024
 16:03:15 +0000
Date: Wed, 21 Aug 2024 16:02:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/oa: Signal output fences
Message-ID: <ZsYPghtaDDxSZEHl@DUT025-TGLU.fm.intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
 <20240820005808.1412649-5-ashutosh.dixit@intel.com>
 <ZsTtIUxkOuPxNlMe@DUT025-TGLU.fm.intel.com>
 <875xrt9a26.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875xrt9a26.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f718768-9d5c-4965-cbdb-08dcc1fac3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g/2dD7gt+JzdM4koAY5FN46ZO7D6pjK8gn7ZnzE9QTr/LJ+c3mHIhWs5BVC4?=
 =?us-ascii?Q?RZg5RV3n/E1yT9Lvnw4oiye6Bwf4bKSagtjkJ03t+BoQ6k8MfbcDy4ZoZi3Y?=
 =?us-ascii?Q?cz5ZGuVj5J9feGBOYU9Y38xZr9e4OLJAej5R/uGMcCutPCuFgLuxa9Juy+k3?=
 =?us-ascii?Q?QwgYZA8r9Xt+fo5ObtqGtIxwEogXCd5dUE11gns5UDhsqDWEl9MJMu27+sjt?=
 =?us-ascii?Q?veZDFrMRhm3+XMtG9FUeMbom6D91BgrZfHneML7ga3mFErkJ2Goh0T5wYcu3?=
 =?us-ascii?Q?eRoj5qgVkusAvvwyvfY32XLOWuNXO2etuFXlaUwkq5EEmi7PJ3Uv5nKCmj6c?=
 =?us-ascii?Q?5q34cRI3EWp+s8qrC4lztLDQAlk8aCokQmsbZig8D6wTEU9JP6fLo6OqR3ax?=
 =?us-ascii?Q?FLot6tedkpXky717NaAVYhwVNk7fBX6xZsYEhbm1kE9ss6xpm3FzEm1utTmW?=
 =?us-ascii?Q?0E9T+Zy0kDZmYwBlJhqKNFXgv2jwYRL2A9Rp17QQq7zcUdlwTjsXzkwRGkGC?=
 =?us-ascii?Q?fp5NVNt3XPfra2It5A91LNQr6Zzu3tCVgnzUCtZlIugLqVTgDNWYL2EYGMaw?=
 =?us-ascii?Q?0+8HVF9iI7hY3iSISyhDXlW4/H6K1oHCor3z6J+lo5xp8S8cMKYCkx82qyrc?=
 =?us-ascii?Q?JRsrhoYvC82RnC4i87P5n1KY/o0XpmG5cFNtXjMqA4E5zRVBep0/6CUl1R7f?=
 =?us-ascii?Q?s5mwaX7amO/vvuOUsDPW0iJjyIFALg0WHy43ee71Q8htXyeYtb00/vfyYlbW?=
 =?us-ascii?Q?GN2+TEKB3uPXV+fmY0dfQjR3rfwKnE73ouewY92gfUjwYLVy6LeyNKqFFbW5?=
 =?us-ascii?Q?XEXmS9qVVHirkPXPRG9p535LClpsJe2uIes9mvz7y3wdj2n4S+QUe7tOnZ5V?=
 =?us-ascii?Q?OgWfOTqiaTuDAU9WbjUtzViB5+hBAUvz8erLjlWoCUK7xH/u/TlfVBpA6jJ4?=
 =?us-ascii?Q?ZQyqDYDmG4xUZPcVVSbwKFRWSe6rQkXwzCvy9g8kWBaCZmjWiy2Mk2Bob5Os?=
 =?us-ascii?Q?A7fLuGaY1pXih3JY3bLSA5hoT7KlJS7MdA7XrhkUqiB1LYXUqvkoy7A4vsOt?=
 =?us-ascii?Q?ZRzhzc2Hq/u/hPX3u6VtitXTzHnK77W2fV5p+2UvceJPskswvPzVRfgSs3St?=
 =?us-ascii?Q?WI3nA9RULtrjAhyavJSDKhXCPTL5ktkGfl4I8fRAJd0ovaQpXH/LVDXvHIPv?=
 =?us-ascii?Q?ixgRsfpV048jMSNDxg/Fi359wGy6QHOaWHlTN4tV7U9RxHoU1gAPI/KK2IND?=
 =?us-ascii?Q?bJDMOZT3v02+CMZHvJ4Q4XmUBtprMWgIa9WWjsg6WvSVIOyy0HQvx1R9n2b8?=
 =?us-ascii?Q?OGpHHdMnCCNEnbwIu/ZauU9L8AFHaPS76EH4ltPREGBYuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rdk/Y/bIgWRTot7ATCTII1QUhPQvmhjnBUrOUFz53lb8AfAfwHAxBFF32i/y?=
 =?us-ascii?Q?J8Okws9+ML+R8Q8W9SraY873Ccjj4KlMoN0YgYDpfoSdQhi6S2AOirtGYIYA?=
 =?us-ascii?Q?x9QabogZffeBrpnDdLx9N84mxru51hYz7Ufbq0wryV1UdX9Wtv0vSc8W9Oiz?=
 =?us-ascii?Q?SUBQIuRAgC0QvOWODdxH6DxcY0Rf6LGVr9AJuxoOTbiV2OqJlMQdoAz0Gmfy?=
 =?us-ascii?Q?4wj+Soel+CW1+lyO6k2Mul1U0967E2fqx/TgpIfWJs48aqOeis/3csArs5sa?=
 =?us-ascii?Q?vmCrPJjtlRFVhGW3H/JVxnheAnOvB7FIFPNgh5pPZbxbiedyGXmuyVSN/8B3?=
 =?us-ascii?Q?zG5jhB5jqdzRloLv8kfjwLO2/8xXj/ndZAwfnMc+imv9eS5p6H2YR7lpW1Hv?=
 =?us-ascii?Q?n93rmMv3Zkmi4SvLBWbd3LE8yQdq8B+nHT4sTitFMDwR6ZNWnsQENdmjIvGM?=
 =?us-ascii?Q?FqM69BNwAgaixeODDTsMtAfXEjx2gtOn6+BvHNlAf7zuDHtZbCDsHYOwead5?=
 =?us-ascii?Q?x6fnspReAP5GvhsKfnEihrCascl4Kup06NAD7gSD0XdUzrTfZgRvRMap+xLx?=
 =?us-ascii?Q?k8Ql7G4INy5LwnqMcaEw4HFGzb229WFwwbrAGtY8iH43TgnyjiopKChXg0dt?=
 =?us-ascii?Q?m7K+5Srmci7GdQNs0INX5eWf/V+uPgci3asLdW+L6u/HJjycpH6GAhsbjr5W?=
 =?us-ascii?Q?YXNSZ0dRT00ONsnGK7smxeULxkhqCy8PESKqD+T9x2El9SKB8uhZDXqZJmOA?=
 =?us-ascii?Q?3kQNBd9E3/pRuBiSotfP7TVPlIA2Lw6u8CdPZcU6e7MG7vQl8P0gwBEocJFD?=
 =?us-ascii?Q?u1ElZqED35wFyaOz9nJTBFXaHryqrEQGKY70Jr+DpwujNIT/QojKy+t9Gw2G?=
 =?us-ascii?Q?233ZEuryp+kNR7sD5c9wmFp4uxksZVMJ5dbn9+2BG1V0nCP6GA3USdWug/97?=
 =?us-ascii?Q?iD+BIiqVJQWZYcNaSLy+NGFXewLiZE+ui1Mk6FgwW5GeNP9YZSl7YdCdRMZP?=
 =?us-ascii?Q?/st6/cACTDuSthMxHhsCC4OTMh9J2aeC2p7aK9TJdBPBoDcCnW7xjxV86FBo?=
 =?us-ascii?Q?HtZefRBVzG1J3VbSqTRZ2p2g9vQqqMviAY0u5YmlDqdWnINrjAZWw742k5VL?=
 =?us-ascii?Q?5bx6mXSKYXwqsKAEss8KwACOjj8axC3dv6r4rdkgzPRZRZFihWc4rwCRSASr?=
 =?us-ascii?Q?k5Bkxecd5UWDW46pJn6g3rIPV1l2yRGi3qdxwuKg2jwNTNpnNhfObqHLXAf8?=
 =?us-ascii?Q?lGcN35n7dgqZMRjeEeI/6Wz+TJDVZfpuwGVULPFSMYHhbHCpMC7tjkl1PlNf?=
 =?us-ascii?Q?cXTVpFH+fOIyf40662RvsMYgrDYSD4N8UpqsV2IxzAUhvNkQfvs+Pc1oSkjM?=
 =?us-ascii?Q?uOJKULKozbyJegg1TC1sun0dYQsql62K2Mm7RbJX3shs6a1ZhywnSVAtb9wx?=
 =?us-ascii?Q?kEgw8sEcwxUJ3ay9MiiNlcPdTZ/meVTkdXYuexlEkmyviYlUMwRxxwqUSMXf?=
 =?us-ascii?Q?DT383zM1bYKHAd2AHd3mbSPw8Vig8ZsuU95Bw+fl/yCUvfbuPzClzpVHH+Sx?=
 =?us-ascii?Q?OZU9UiYXlZ7HEaPp6UqNt+ZWagji71ZBpl92xUjmmwaKsHIy6X01MeZKpEX5?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f718768-9d5c-4965-cbdb-08dcc1fac3e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:03:15.3914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RMGyBtpkWk9luePkdMbEs8waPk5iOhBnZElc4FIPe44muB05E/LPNO89rrsGDSYVndWZa+cl92uDfqqfGyi1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
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

On Wed, Aug 21, 2024 at 08:20:49AM -0700, Dixit, Ashutosh wrote:
> On Tue, 20 Aug 2024 12:23:13 -0700, Matthew Brost wrote:
> >
> 
> Hi Matt,
> 
> Thanks for all the feedback. Yes, my first encounter with dma_fence's so
> not everything is smooth yet.
> 
> > On Mon, Aug 19, 2024 at 05:58:05PM -0700, Ashutosh Dixit wrote:
> > > Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
> > > output fences in the xe_sync array. The fences are signaled
> > > asynchronously. When there are no output fences to signal, the OA
> > > configuration wait is synchronously re-introduced into the ioctl.
> > >
> > > v2: Don't wait in the work, use callback + delayed work (Matt B)
> > >     Use a single, not a per-fence spinlock (Matt Brost)
> > >
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_oa.c       | 110 +++++++++++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_oa_types.h |   3 +
> > >  2 files changed, 100 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index cad8f54500a10..1478d88722170 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -100,6 +100,15 @@ struct xe_oa_config_bo {
> > >	struct xe_bb *bb;
> > >  };
> > >
> > > +struct xe_oa_fence {
> > > +	/* @base: dma fence base */
> > > +	struct dma_fence base;
> > > +	/* @work: work to signal @base */
> > > +	struct delayed_work work;
> > > +	/* @cb: callback to schedule @work */
> > > +	struct dma_fence_cb cb;
> > > +};
> > > +
> > >  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
> > >
> > >  static const struct xe_oa_format oa_formats[] = {
> > > @@ -945,13 +954,62 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
> > >	return oa_bo;
> > >  }
> > >
> > > +static void xe_oa_fence_work_fn(struct work_struct *w)
> > > +{
> > > +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
> > > +
> > > +	/* Signal fence to indicate new OA configuration is active */
> > > +	dma_fence_signal(&ofence->base);
> > > +	dma_fence_put(&ofence->base);
> > > +}
> > > +
> > > +static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > > +{
> > > +	/* Additional empirical delay needed for NOA programming after registers are written */
> > > +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> > > +
> > > +	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
> > > +
> > > +	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> > > +	queue_delayed_work(system_unbound_wq, &ofence->work,
> > > +			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
> > > +	dma_fence_put(fence);
> > > +}
> > > +
> > > +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> > > +{
> > > +	return "xe_oa";
> > > +}
> > > +
> > > +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> > > +{
> > > +	return "unbound";
> > > +}
> > > +
> > > +static const struct dma_fence_ops xe_oa_fence_ops = {
> > > +	.get_driver_name = xe_oa_get_driver_name,
> > > +	.get_timeline_name = xe_oa_get_timeline_name,
> > > +};
> > > +
> > > +static struct xe_oa_fence *xe_oa_fence_arm(struct xe_oa_stream *stream)
> > > +{
> > > +	struct xe_oa_fence *ofence;
> > > +
> > > +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> > > +	if (!ofence)
> > > +		return ERR_PTR(-ENOMEM);
> >
> > I'd split this out so the malloc is done before submitting the job and
> > done dma_fence_init after. This way once the job submitted there are no
> > failure points.
> 
> OK, done in v3, definitely simplifies code flow.
> 
> > Also doing malloc after a job is submitted plays into dma-fence rules
> > too, you have malloc in the path a signaling a user dma-fence too.
> 
> I believe you are referring to this:
> 
>  * * Drivers are allowed to call dma_fence_wait() from their &shrinker
>  *   callbacks. This means any code required for fence completion cannot
>  *   allocate memory with GFP_KERNEL.

Yea basically. Since the fence wasn't published (installed in sync obj)
yet it is actually fine but it a bad practice to do things like this:

fence = foo();

new_fence = malloc()

attach fence to new_fence

publish new_fence

We do this fence arrays in a couple of place which I didn't like to
clean up to use chains so memory allocations can be avoided.

Matt

> 
> > It probably works the way you have it, but best practices we to be follow
> > the changes I suggest.
> 
> Agreed.
> 
> >
> > > +
> > > +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
> > > +	return ofence;
> > > +}
> > > +
> > >  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
> > >  {
> > >  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> > >	struct xe_oa_config_bo *oa_bo;
> > > -	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> > > +	struct xe_oa_fence *ofence;
> > > +	int i, err, num_signal = 0;
> > >	struct dma_fence *fence;
> > > -	long timeout;
> > >
> > >	/* Emit OA configuration batch */
> > >	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> > > @@ -966,18 +1024,43 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
> > >		goto exit;
> > >	}
> > >
> > > -	/* Wait till all previous batches have executed */
> > > -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> > > -	dma_fence_put(fence);
> > > -	if (timeout < 0)
> > > -		err = timeout;
> > > -	else if (!timeout)
> > > -		err = -ETIME;
> > > -	if (err)
> > > -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> > > +	/* Initialize and set fence to signal */
> > > +	ofence = xe_oa_fence_arm(stream);
> > > +	if (IS_ERR(ofence)) {
> > > +		err = PTR_ERR(ofence);
> > > +		goto put_fence;
> > > +	}
> > >
> > > -	/* Additional empirical delay needed for NOA programming after registers are written */
> > > -	usleep_range(us, 2 * us);
> > > +	for (i = 0; i < stream->num_syncs; i++) {
> > > +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > +			num_signal++;
> > > +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> > > +	}
> > > +
> > > +	/* Add job fence callback to schedule work to signal ofence->base */
> > > +	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
> > > +	if (err == -ENOENT)
> > > +		xe_oa_config_cb(fence, &ofence->cb);
> > > +	else if (err)
> >
> > I'd just assert here rather than fail. The only return currently from
> > dma_fence_add_callback is -ENOENT, in other code paths we just assert
> > too. See invalidation_fence_init in xe_pt.c.
> 
> Done in v3.
> 
> >
> > > +		goto put_ofence;
> > > +
> > > +	/* If nothing needs to be signaled we wait synchronously */
> > > +	if (!num_signal)
> > > +		dma_fence_wait(&ofence->base, true);
> >
> > I think you have a UAF here. The worker which signals the fence puts
> > '&ofence->base'. So I think you need an extra ref for !num_signal before
> > calling dma_fence_add_callback which is dropped after dma_fence_wait.
> 
> Good catch, but I think it is safe because the fence cannot really be freed
> till the xe_sync_entry_cleanup() below (even if userspace closes the
> sync handle). But in any case, to be safe, I've added an additional
> dma_fence_get/put.
> 
> > Also since you have interruptable wait here, you likely need to return
> > an error to the user to retry the IOCTL upon interruption, right?
> 
> Good catch, I've changed that to a non-interruptible wait (didn't really
> need an interruptible wait, was just jittery about hangs i.e. fence not
> signaling at all :/ )
> 
> Thanks a lot,
> Ashutosh
> 
> >
> > > +
> > > +	/* Done with syncs */
> > > +	for (i = 0; i < stream->num_syncs; i++)
> > > +		xe_sync_entry_cleanup(&stream->syncs[i]);
> > > +	kfree(stream->syncs);
> > > +
> > > +	return 0;
> > > +put_ofence:
> > > +	for (i = 0; i < stream->num_syncs; i++)
> > > +		xe_sync_entry_cleanup(&stream->syncs[i]);
> > > +	kfree(stream->syncs);
> > > +	dma_fence_put(&ofence->base);
> > > +put_fence:
> > > +	dma_fence_put(fence);
> > >  exit:
> > >	return err;
> > >  }
> > > @@ -1480,6 +1563,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> > >		goto err_free_oa_buf;
> > >	}
> > >
> > > +	spin_lock_init(&stream->oa_fence_lock);
> > >	ret = xe_oa_enable_metric_set(stream);
> > >	if (ret) {
> > >		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> > > index c1ca960af9305..412f1460c1437 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > > @@ -239,6 +239,9 @@ struct xe_oa_stream {
> > >	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
> > >	u32 no_preempt;
> > >
> > > +	/** @oa_fence_lock: Lock for struct xe_oa_fence */
> > > +	spinlock_t oa_fence_lock;
> > > +
> > >	/** @num_syncs: size of @syncs array */
> > >	u32 num_syncs;
> > >
> > > --
> > > 2.41.0
> > >
