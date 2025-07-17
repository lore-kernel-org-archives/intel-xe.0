Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBACC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7C210E8A9;
	Thu, 17 Jul 2025 21:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpTzX3kc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145DC10E8A9
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752786352; x=1784322352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Eb+jk+8TR+us1L8rgk3/WL2QPayVNE51JsJAFGn70eQ=;
 b=bpTzX3kcMzj+0bdtKQ1Sa8rkJN1cAKESt2WLfsaqSBV45iay7tuGdP4W
 9Co4ZALSb5n3WRG1Aq37kq8pMa1dC/hHxHkjHTWYz8I3SRUF+xAblu6Ss
 y2jm04nTIQAV7irqqCLV47jAIL8QryC65df5t1oWhZQ5WnRfHnK2QdzZj
 8TuPwl1Wye66X+fGTS37C69T8bl+BMN7Zj2Ao+fbUkDHlLEgJubTjDx6S
 R68c//kpfw9fz+n+Lhu70vry+JzO1FtBIRzHYCBKros38MAPY39/V1oSr
 2ATfYEgxx85G6Hzfm5VcxhoVNa3aUsvS9Ag34fQ68tmIRhDAHmoty6rHV w==;
X-CSE-ConnectionGUID: pUJ1IwdvQuWSv5uAN0K1fw==
X-CSE-MsgGUID: Ss03KY3nRN26oz6Rl6jvnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65649351"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="65649351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:05:52 -0700
X-CSE-ConnectionGUID: 6ZKs2qi3RRexhXm0elBHUQ==
X-CSE-MsgGUID: v0KXEVU7QLuG1mGiseuI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181609304"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:05:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:05:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:05:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9jFn4lBfQf+klkAwllwsphjsUoBG5fRvttn3SuXvHyC7CAoQ4urB2FJxm5WjqVFYw97bPcPyWIqykZbdq7fyLpSMHYT0+kzJ47uuu68R3un2Wp1zpwGtlgzrL4CzBSGmSkcTtoObZ221uD38S9QnHYJeUqrJUCOjxddl2i0r7FrpUMFXD4OabEaMqpB8KXQMjMkNhvlyyCrhb5ToRlqmm5M6oEOE4OVdaaCzKszMe3Bu7OqmxwhTeDIwYEXo98rYP5fn8s0eMojyaP3tgaGhn+3eDSW5DaHdmHWcvEXKFqSXpiY8CW5YPm4iRkrJ5atG7uUhUA412qxnPdLrrUOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8dvNOSwvwHbTMQ7WJozR6GdfrQkH/9MgNlanajswYQ=;
 b=lx1vwR633dqBkGRxDpIxjCUFucE22F08AMbE5ERa0EtJaup9ZBXNVkcSt9Os4d1rLRZ+9LSbIKPu4jQg1wN6O13JkI2uXhElNc1w5d07On0Opuj8qFDsTFRENjFYCwEvWVfKgt5O8ltQ3Jr9txf8zbjSPedHg7BTJamVqjMlGGs8Wh/ysAopt9/bhKsBSEH2aAAdwHJZVwCwr89qiXqdYqboe5kcuRFTQ/bw9FsqDWkVvFCE8fQIJXh4CRdjn7R6cvOF3oy/qRGJhJFSnfz5E7m/VLGPMybCe4lbpWrI95pI0qOovOC3rLnkklSpE/eQfOqpKwUye6iM2Ex4Wu2RCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:05:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Thu, 17 Jul 2025
 21:05:19 +0000
Date: Thu, 17 Jul 2025 14:07:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 8/9] drm/xe: Use GT TLB invalidation jobs in PT layer
Message-ID: <aHll9/A6QoJEkrjU@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-9-matthew.brost@intel.com>
 <e56fd40f4ad7531fe6cf290ce7251fab521d5d1b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e56fd40f4ad7531fe6cf290ce7251fab521d5d1b.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 1140a5e7-de59-4700-e60e-08ddc575a2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bwpLRKVtjPyslkgq8xL0Dhs4UNJpE0xm97R0L5dLiVSLBUpSqcH30iDbVL?=
 =?iso-8859-1?Q?vrUidkPDbTB6Bkc9ZTA4WmGoPBAmpe0pQEBa/GpK2IAes6Qj7JBf4MdZU3?=
 =?iso-8859-1?Q?N2DQElWMn7uF+1LTrLlRTJLC2CpCIcRKphTgaWU3TiFTGU4uZaueLBWGAW?=
 =?iso-8859-1?Q?X9l8TtvIHAeHTFn3Vy+uWrGfMPwDyieFMIJewxy1uv6NsYD2RQyBGNtLd6?=
 =?iso-8859-1?Q?gZEpms0q9uoi+nqz7k1EmZ0VfN3Ah8zsV5gIbVHcp4x1RZH2l8KPbEAx/g?=
 =?iso-8859-1?Q?EDhcUjkef/8rxglmXXyINBZHd8z4C0VNtk4na0wsJJ7a05B0PIIMW7hhTw?=
 =?iso-8859-1?Q?gI1FdPH2qJrBRHaa7gwUC99nxSwrAqXnn976KaigOWWt9oNb1ybpDWKmDk?=
 =?iso-8859-1?Q?Gazvw+kSMzHpCF4XH3nLn5KLwBWTK6ycr0UNxPF63t+tuNWdXL+pPHiUHe?=
 =?iso-8859-1?Q?3XTkU6JS0oXyLJvOtLC2avHr4HtSPnf0wo3isRkHM2BQ7OdhZ+dgKHjDWx?=
 =?iso-8859-1?Q?LLtFOXolpwnbEzebUq+/Ke6chKR0QYzIWzKMIT/gYHmutTx55kzlPKqA5f?=
 =?iso-8859-1?Q?tbXnds29pr2rZgke62Zny1cQifh4Pov9g0F6yt4uI0s3dNH2/eEKpi5eJF?=
 =?iso-8859-1?Q?9bltv1cjtvCPOb1TBaDeMwNFAGolasZn73oGfeS9SX4Ar2NiQg3zwbLleh?=
 =?iso-8859-1?Q?kRCLB8jh4eYomhBf4KBrTs9VAs+uuBRKTSb7EiwiWj88czCqqibwzjhK2h?=
 =?iso-8859-1?Q?Iok59GDAna13hTilQIy8Yb1B9Vv/SPNZfB5/Zxn6rqA51B9RipYAuEtXw+?=
 =?iso-8859-1?Q?9aYhl0Bws+OWSqozZ0xc8Eg00hqJyVj72Tk5hotCpnYfUGJY/LUhkGTwrF?=
 =?iso-8859-1?Q?y7MKxK9JwqivYBGFfXL2Eru+UDfzqK9BDBdf+IjMW7vqUsA0taUqptRB+U?=
 =?iso-8859-1?Q?5PA6iFl8ux/ihLo2Ii57UvKVqXFhw9nanCiTcjBPDkvBQ58+DRAgMRtb65?=
 =?iso-8859-1?Q?stxULBLhgR+h4u0URCcpe7zHnfMRCe9hf2NAbWk1oAphBYUtwb6CeGe7d7?=
 =?iso-8859-1?Q?/GpTPK8ssI7z4O3UiBAz5eSpfwqTddQGiBfZh8AbrC9NUIBkHZbRTEq8Au?=
 =?iso-8859-1?Q?x8BHxXWxpITFl22I8AJ3B/+ln+tBJ0h8MGn63u+5V/pd9UMlXhb0vezv5i?=
 =?iso-8859-1?Q?zPEILWF8bjeG8TbpFx3vTyk7dFDEWJah4SVVQK2vIMN/MlISrTAbk0TAMl?=
 =?iso-8859-1?Q?ZfmCHFrseOWdlmjvjwX3edzP4hULfqDA6CIotncuMAYCxlqyxhRXaF5aTG?=
 =?iso-8859-1?Q?oBinMTRDitwKGdMA6awmUWPSxv8u+aFCjNOeSK/DvDbtm0jYEQFclnUlxV?=
 =?iso-8859-1?Q?gWH/w7nLSMWxu0QFPOW/BMQXJ5XDEtBHmuHPbg0B+1iJlnnS6rMkawyvhT?=
 =?iso-8859-1?Q?0s1NSEMaRB/G3dK92SrrdmGjW69YoHeQ+24E9v53V+4ipraj69mwG9KCjk?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a+mCdBhrVcDJ1xxTD1jAk/3m+CbCRZAdElKo0GXEnEveRbQspkx9Z23LKt?=
 =?iso-8859-1?Q?3Hhp+4dQtThJ+yqiilYdopgZBlUuhB6GRUV1ZeNu7VtfiqHfhtLCXGMJgz?=
 =?iso-8859-1?Q?89DKEkHbtwhibM1Fvs44tMWdiLjLSxoI85lcrnY2TYpzfi178AkWAG6Knl?=
 =?iso-8859-1?Q?WLturC+JeRTXv8BZjCY9Ga365aFtekmqBZYp9C3MZiAhe5slj6OhikhrWm?=
 =?iso-8859-1?Q?VecqaJwktxUfgOeaI0BwLmzAoWOXilSEwGbayj/BAlWNrV4vHdPPX483fB?=
 =?iso-8859-1?Q?Z5rOkNKPTvQpUbs9d6Bj221ZJmvmwyLc1y98HlujRBeB1RfejWQZBzeirJ?=
 =?iso-8859-1?Q?FL81yvjnnNfu1GQ9e4llUIkeEsgHCFZkC3ohYBLrK0DUSzXCb0qbb57f0m?=
 =?iso-8859-1?Q?DFNEcnJnCF0ArkN4S/aKmTj0Du5HXJCvULKtcHeSVzBqjNusvl4CqXWwbv?=
 =?iso-8859-1?Q?uMzpfc24/cBdaXBenv3vVz8gGgo8NGJrldiY8Q0fT1ejI0jU7NQa495UU0?=
 =?iso-8859-1?Q?ab11cSFoLl6di/eUtb9QIQJwS48ZS+5YBfdU9ZUeirwUJfKQgUJaXCWiW9?=
 =?iso-8859-1?Q?TVKXy07BxqY90ZeWAmeRoN4SiO8fGoIZVzzcfPl1KJ9f3saqdkLl/cqmRS?=
 =?iso-8859-1?Q?njKVm3i3CmWJtpXrZF7yO9dhoxFA8Z3VAl3l2J5BSOKTwSabJzpKtNJaKd?=
 =?iso-8859-1?Q?iI5jlD93ZUpLaUBEEuIww2oveuXiL1JON3KSD/glXIsDmMkSfHIWnUxMP4?=
 =?iso-8859-1?Q?BT+az4Hayiah4EyMUTVitczpbIQFjQxYeOknQUkPZpCLh3I6ES7K3y2J6F?=
 =?iso-8859-1?Q?oeukccFHnO2QBBYc/chwz3qK1NN13titrKMW/+3eQm7TSid63CFN+zNZaM?=
 =?iso-8859-1?Q?t1143O/45VPpMoWI07IsaKKvG02czlGARAV08D9o9wYKyEiwDq+btDuP1s?=
 =?iso-8859-1?Q?2XR+mm9iAG1dZ4N6fOg7LQxkXx3Ed8Q15m2V6iJblBHkD3qwe6SnCNye+H?=
 =?iso-8859-1?Q?CiH5feYv2OZNeQzpjLIIf56W0wyYTstQ5Mx+d/Fkoy82UwQ+tXRPvPT0FQ?=
 =?iso-8859-1?Q?SuxVDn3WeVY09AK3mBJdkx7pE/9uhEWciEInaHol0IHHx/a2nj3FA/hUa7?=
 =?iso-8859-1?Q?jrjK76K2iO1Hcsl6vI6MT+PqM2SjGePA2Eb697KldM96pM5n+Ot/JfXTy/?=
 =?iso-8859-1?Q?mMwOVy6ycD8P3ai7/DKfH8lNJC639kcGq8NujWChENZxeQogMeYy/CUrhC?=
 =?iso-8859-1?Q?t73yLECiPIrG/+nNHYvio8PwRvaCSe7+s/E+67Fm+PeDhHw8Ru/k0RwbIG?=
 =?iso-8859-1?Q?lo6s2UatQRy+4EWDSJZDU1YB41bxexbmczVwXd6ltyMii3fQkBVhXvs5lJ?=
 =?iso-8859-1?Q?8qFo2TCeHKUTU/3mu8HXaKM4T8QDSQxiIP7R9MopOIynVh+t1TyFOwY/7u?=
 =?iso-8859-1?Q?Vz6WXBdtoElX+OPg/7v7829uu/Xp16IGmPfKRaCgWBOXwxYnmD6oiYdZoV?=
 =?iso-8859-1?Q?/O1x2EAU6yADgGJlP7b2zUHAPJQJ3NHL9DhRnuVKb+NiALYTYDXPKJpT/r?=
 =?iso-8859-1?Q?FYZXynJcY19AzZYl5YZEMKTkTG/uZE/1kvnPPMFQowaOFojxTNhL70a9DU?=
 =?iso-8859-1?Q?7m88HsmdlpnXZFt+1S2NpdoeKq17ost/BJAjcXarEPGusiZX9Uu1JLOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1140a5e7-de59-4700-e60e-08ddc575a2e1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 21:05:19.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUEKoNgJhqcBQ1V5FsGA6ZI8rk2VOYEBMdn9EQT00mxOl2OoVRNHqR6Yf5cy+xw2E20B9oomM006nml0VvNvTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
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

On Thu, Jul 17, 2025 at 03:00:14PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > Rather than open-coding GT TLB invalidations in the PT layer, use GT
> > TLB
> > invalidation jobs. The real benefit is that GT TLB invalidation jobs
> > use
> > a single dma-fence context, allowing the generated fences to be
> > squashed
> > in dma-resv/DRM scheduler.
> > 
> > v2:
> >  - s/;;/; (checkpatch)
> >  - Move ijob/mjob job push after range fence install
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.h |   9 ++
> >  drivers/gpu/drm/xe/xe_pt.c      | 178 +++++++++++++-----------------
> > --
> >  2 files changed, 80 insertions(+), 107 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index e9d83d320f8c..605398ea773e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -14,6 +14,7 @@ struct ttm_resource;
> >  
> >  struct xe_bo;
> >  struct xe_gt;
> > +struct xe_gt_tlb_inval_job;
> >  struct xe_exec_queue;
> >  struct xe_migrate;
> >  struct xe_migrate_pt_update;
> > @@ -89,6 +90,14 @@ struct xe_migrate_pt_update {
> >         struct xe_vma_ops *vops;
> >         /** @job: The job if a GPU page-table update. NULL otherwise
> > */
> >         struct xe_sched_job *job;
> > +       /**
> > +        * @ijob: The GT TLB invalidation job for primary tile. NULL
> > otherwise
> > +        */
> > +       struct xe_gt_tlb_inval_job *ijob;
> > +       /**
> > +        * @mjob: The GT TLB invalidation job for media tile. NULL
> > otherwise
> > +        */
> > +       struct xe_gt_tlb_inval_job *mjob;
> >         /** @tile_id: Tile ID of the update */
> >         u8 tile_id;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index c8e63bd23300..67d02307779b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -13,7 +13,7 @@
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> >  #include "xe_gt.h"
> > -#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_gt_tlb_inval_job.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pt_types.h"
> >  #include "xe_pt_walk.h"
> > @@ -1261,6 +1261,8 @@ static int op_add_deps(struct xe_vm *vm, struct
> > xe_vma_op *op,
> >  }
> >  
> >  static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > +                                struct xe_gt_tlb_inval_job *ijob,
> > +                                struct xe_gt_tlb_inval_job *mjob,
> >                                  struct xe_vm *vm,
> >                                  struct xe_vma_ops *vops,
> >                                  struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> > @@ -1328,6 +1330,20 @@ static int xe_pt_vm_dependencies(struct
> > xe_sched_job *job,
> >         for (i = 0; job && !err && i < vops->num_syncs; i++)
> >                 err = xe_sync_entry_add_deps(&vops->syncs[i], job);
> >  
> > +       if (job) {
> > +               if (ijob) {
> > +                       err = xe_gt_tlb_inval_job_alloc_dep(ijob);
> > +                       if (err)
> > +                               return err;
> > +               }
> > +
> > +               if (mjob) {
> > +                       err = xe_gt_tlb_inval_job_alloc_dep(mjob);
> > +                       if (err)
> > +                               return err;
> > +               }
> > +       }
> > +
> >         return err;
> >  }
> >  
> > @@ -1339,7 +1355,8 @@ static int xe_pt_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >         struct xe_vm_pgtable_update_ops *pt_update_ops =
> >                 &vops->pt_update_ops[pt_update->tile_id];
> >  
> > -       return xe_pt_vm_dependencies(pt_update->job, vm, pt_update-
> > >vops,
> > +       return xe_pt_vm_dependencies(pt_update->job, pt_update->ijob,
> > +                                    pt_update->mjob, vm, pt_update-
> > >vops,
> >                                      pt_update_ops, rftree);
> >  }
> >  
> > @@ -1509,75 +1526,6 @@ static int xe_pt_svm_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  }
> >  #endif
> >  
> > -struct invalidation_fence {
> > -       struct xe_gt_tlb_invalidation_fence base;
> > -       struct xe_gt *gt;
> > -       struct dma_fence *fence;
> > -       struct dma_fence_cb cb;
> > -       struct work_struct work;
> > -       u64 start;
> > -       u64 end;
> > -       u32 asid;
> > -};
> > -
> > -static void invalidation_fence_cb(struct dma_fence *fence,
> > -                                 struct dma_fence_cb *cb)
> > -{
> > -       struct invalidation_fence *ifence =
> > -               container_of(cb, struct invalidation_fence, cb);
> > -       struct xe_device *xe = gt_to_xe(ifence->gt);
> > -
> > -       trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> > -       if (!ifence->fence->error) {
> > -               queue_work(system_wq, &ifence->work);
> > -       } else {
> > -               ifence->base.base.error = ifence->fence->error;
> > -               xe_gt_tlb_invalidation_fence_signal(&ifence->base);
> > -       }
> > -       dma_fence_put(ifence->fence);
> > -}
> > -
> > -static void invalidation_fence_work_func(struct work_struct *w)
> > -{
> > -       struct invalidation_fence *ifence =
> > -               container_of(w, struct invalidation_fence, work);
> > -       struct xe_device *xe = gt_to_xe(ifence->gt);
> > -
> > -       trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence-
> > >base);
> > -       xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base,
> > ifence->start,
> > -                                    ifence->end, ifence->asid);
> > -}
> > -
> > -static void invalidation_fence_init(struct xe_gt *gt,
> > -                                   struct invalidation_fence
> > *ifence,
> > -                                   struct dma_fence *fence,
> > -                                   u64 start, u64 end, u32 asid)
> > -{
> > -       int ret;
> > -
> > -       trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt),
> > &ifence->base);
> > -
> > -       xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
> > -
> > -       ifence->fence = fence;
> > -       ifence->gt = gt;
> > -       ifence->start = start;
> > -       ifence->end = end;
> > -       ifence->asid = asid;
> > -
> > -       INIT_WORK(&ifence->work, invalidation_fence_work_func);
> > -       ret = dma_fence_add_callback(fence, &ifence->cb,
> > invalidation_fence_cb);
> > -       if (ret == -ENOENT) {
> > -               dma_fence_put(ifence->fence);   /* Usually dropped in
> > CB */
> > -               invalidation_fence_work_func(&ifence->work);
> > -       } else if (ret) {
> > -               dma_fence_put(&ifence->base.base);      /* Caller ref
> > */
> > -               dma_fence_put(&ifence->base.base);      /* Creation
> > ref */
> > -       }
> > -
> > -       xe_gt_assert(gt, !ret || ret == -ENOENT);
> > -}
> > -
> >  struct xe_pt_stage_unbind_walk {
> >         /** @base: The pagewalk base-class. */
> >         struct xe_pt_walk base;
> > @@ -2407,8 +2355,8 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >         struct xe_vm *vm = vops->vm;
> >         struct xe_vm_pgtable_update_ops *pt_update_ops =
> >                 &vops->pt_update_ops[tile->id];
> > -       struct dma_fence *fence;
> > -       struct invalidation_fence *ifence = NULL, *mfence = NULL;
> > +       struct dma_fence *fence, *ifence, *mfence;
> > +       struct xe_gt_tlb_inval_job *ijob = NULL, *mjob = NULL;
> >         struct dma_fence **fences = NULL;
> >         struct dma_fence_array *cf = NULL;
> >         struct xe_range_fence *rfence;
> > @@ -2440,34 +2388,47 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >  #endif
> >  
> >         if (pt_update_ops->needs_invalidation) {
> > -               ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -               if (!ifence) {
> > -                       err = -ENOMEM;
> > +               ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
> > +                                                 tile->primary_gt,
> > +                                                 pt_update_ops-
> > >start,
> > +                                                 pt_update_ops-
> > >last,
> > +                                                 vm->usm.asid);
> > +
> 
> Remove extra line.
> 

Sure.

> > +               if (IS_ERR(ijob)) {
> > +                       err = PTR_ERR(ijob);
> >                         goto kill_vm_tile1;
> >                 }
> > +
> >                 if (tile->media_gt) {
> > -                       mfence = kzalloc(sizeof(*ifence),
> 
> I realize it's the same, but this should probably be sizeof(*mfence).
> 

Well it is getting removed.


> > GFP_KERNEL);
> > -                       if (!mfence) {
> > -                               err = -ENOMEM;
> > -                               goto free_ifence;
> > +                       mjob =
> > xe_gt_tlb_inval_job_create(pt_update_ops->q,
> > +                                                         tile-
> > >media_gt,
> > +                                                        
> > pt_update_ops->start,
> > +                                                        
> > pt_update_ops->last,
> > +                                                         vm-
> > >usm.asid);
> > +                       if (IS_ERR(mjob)) {
> > +                               err = PTR_ERR(mjob);
> > +                               goto free_ijob;
> 
> I think this needs a little more granularity. In free_ijob below, we're
> also doing a kfree for fences and cf, both of which at this point
> aren't yet allocated. I realize you aren't changing anything really
> here, but that looks wrong to me. Maybe we just haven't hit an issue
> here because we've never tested the ENOMEM case?
> 

fences & cf are initialized to NULL, kfree on a NULL is a nop.

Same with xe_gt_tlb_inval_job_put, skips on NULL or IS_ERR.

> >                         }
> >                         fences = kmalloc_array(2, sizeof(*fences),
> > GFP_KERNEL);
> >                         if (!fences) {
> >                                 err = -ENOMEM;
> > -                               goto free_ifence;
> > +                               goto free_ijob;
> >                         }
> >                         cf = dma_fence_array_alloc(2);
> >                         if (!cf) {
> >                                 err = -ENOMEM;
> > -                               goto free_ifence;
> > +                               goto free_ijob;
> >                         }
> >                 }
> > +
> > +               update.ijob = ijob;
> > +               update.mjob = mjob;
> 
> Is there a reason not to put these inline above where the ijob and mjob
> are allocated? That way if we moved this to a loop eventually (not
> here, in a future patch) we could more easily reduce the number of
> indentations here by doing:

Sure, can move.

> if (!media_gt)
>     continue;
> 
> >         }
> >  
> >         rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> >         if (!rfence) {
> >                 err = -ENOMEM;
> > -               goto free_ifence;
> > +               goto free_ijob;
> >         }
> >  
> >         fence = xe_migrate_update_pgtables(tile->migrate, &update);
> > @@ -2491,30 +2452,30 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >                                   pt_update_ops->last, fence))
> >                 dma_fence_wait(fence, false);
> >  
> > -       /* tlb invalidation must be done before signaling rebind */
> 
> Why drop the comment?
> 

Let me pull that back in.

Matt

> Thanks,
> Stuart
> 
> > -       if (ifence) {
> > -               if (mfence)
> > -                       dma_fence_get(fence);
> > -               invalidation_fence_init(tile->primary_gt, ifence,
> > fence,
> > -                                       pt_update_ops->start,
> > -                                       pt_update_ops->last, vm-
> > >usm.asid);
> > -               if (mfence) {
> > -                       invalidation_fence_init(tile->media_gt,
> > mfence, fence,
> > -                                               pt_update_ops->start,
> > -                                               pt_update_ops->last,
> > vm->usm.asid);
> > -                       fences[0] = &ifence->base.base;
> > -                       fences[1] = &mfence->base.base;
> > +       if (ijob) {
> > +               struct dma_fence *__fence;
> > +
> > +               ifence = xe_gt_tlb_inval_job_push(ijob, tile-
> > >migrate, fence);
> > +               __fence = ifence;
> > +
> > +               if (mjob) {
> > +                       fences[0] = ifence;
> > +                       mfence = xe_gt_tlb_inval_job_push(mjob, tile-
> > >migrate,
> > +                                                         fence);
> > +                       fences[1] = mfence;
> > +
> >                         dma_fence_array_init(cf, 2, fences,
> >                                              vm->composite_fence_ctx,
> >                                              vm-
> > >composite_fence_seqno++,
> >                                              false);
> > -                       fence = &cf->base;
> > -               } else {
> > -                       fence = &ifence->base.base;
> > +                       __fence = &cf->base;
> >                 }
> > +
> > +               dma_fence_put(fence);
> > +               fence = __fence;
> >         }
> >  
> > -       if (!mfence) {
> > +       if (!mjob) {
> >                 dma_resv_add_fence(xe_vm_resv(vm), fence,
> >                                    pt_update_ops->wait_vm_bookkeep ?
> >                                    DMA_RESV_USAGE_KERNEL :
> > @@ -2523,19 +2484,19 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >                 list_for_each_entry(op, &vops->list, link)
> >                         op_commit(vops->vm, tile, pt_update_ops, op,
> > fence, NULL);
> >         } else {
> > -               dma_resv_add_fence(xe_vm_resv(vm), &ifence-
> > >base.base,
> > +               dma_resv_add_fence(xe_vm_resv(vm), ifence,
> >                                    pt_update_ops->wait_vm_bookkeep ?
> >                                    DMA_RESV_USAGE_KERNEL :
> >                                    DMA_RESV_USAGE_BOOKKEEP);
> >  
> > -               dma_resv_add_fence(xe_vm_resv(vm), &mfence-
> > >base.base,
> > +               dma_resv_add_fence(xe_vm_resv(vm), mfence,
> >                                    pt_update_ops->wait_vm_bookkeep ?
> >                                    DMA_RESV_USAGE_KERNEL :
> >                                    DMA_RESV_USAGE_BOOKKEEP);
> >  
> >                 list_for_each_entry(op, &vops->list, link)
> > -                       op_commit(vops->vm, tile, pt_update_ops, op,
> > -                                 &ifence->base.base, &mfence-
> > >base.base);
> > +                       op_commit(vops->vm, tile, pt_update_ops, op,
> > ifence,
> > +                                 mfence);
> >         }
> >  
> >         if (pt_update_ops->needs_svm_lock)
> > @@ -2543,15 +2504,18 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >         if (pt_update_ops->needs_userptr_lock)
> >                 up_read(&vm->userptr.notifier_lock);
> >  
> > +       xe_gt_tlb_inval_job_put(mjob);
> > +       xe_gt_tlb_inval_job_put(ijob);
> > +
> >         return fence;
> >  
> >  free_rfence:
> >         kfree(rfence);
> > -free_ifence:
> > +free_ijob:
> >         kfree(cf);
> >         kfree(fences);
> > -       kfree(mfence);
> > -       kfree(ifence);
> > +       xe_gt_tlb_inval_job_put(mjob);
> > +       xe_gt_tlb_inval_job_put(ijob);
> >  kill_vm_tile1:
> >         if (err != -EAGAIN && err != -ENODATA && tile->id)
> >                 xe_vm_kill(vops->vm, false);
> 
