Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026AFD1D486
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 19:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1410E7C1;
	Thu,  8 Jan 2026 19:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRBYQZSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ACB10E7C1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767899879; x=1799435879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TtoE4fjdyjC5nwH8Uvnlf4qk5ojnbIx+THw1uSqorow=;
 b=IRBYQZSHfH3JPgaYs6hJJiNmi1v4VWvlpX1Xne/y7BbmLgiYw/tv4o3z
 AZ6DmW1CG/wPnqCJ4Pg5JPEgrv81xfQk0VhypJj1RPTMjiQOSNndFHVjU
 R1fhQnPuQKs2rgnEm0z/Iavj/un3fIVkHYvTykr0zVzGNOcWT4MIw5wpJ
 i6dC4ypNjQ5CnBPG73Oj0lYWg7ZUB9ogpnNbk3hNGhNCe1QOPALi3hh+N
 dVVafVxdbzRa/RvBngVyQ2/LVvgwEF2ZOTfb/ExyHMX2fCutzf3EyJKYC
 CC1EwlaqOkNyL2lMA7TnrVyOSIGNEz+mChN/9KK7KJnOvckkFSHN/DMIp g==;
X-CSE-ConnectionGUID: wWiudTR4R7i6mZ3BzKqYyA==
X-CSE-MsgGUID: HmvBuKlpR6aH72ikwgsEdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86702388"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="86702388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:17:59 -0800
X-CSE-ConnectionGUID: XmfD5/lbQB2r8VZd7EEhgw==
X-CSE-MsgGUID: b8r5phaPRf+hSvTXtTxg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203197737"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:17:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:17:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:17:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:17:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo1RBR1Hx1OfbS3xtPrKx+Gr7hTiQh9lOsGpaZ2Z/wUwErsLPk8BiCNWMy3tNcD0vKC/1AIfASPNGFJgxkaLPCfL87uROeooMwHCAM1Rt/krHPfFDrbHhoR4kZp9/gdiAt1hFTyT5MDQONRAYA0kcmpgo4dYxsVoTF9RXVBCdHcIQcVpoMWXOGveC4YW5zd3HyN8U2d8uORoyh1V2woZPA5GoNtOp1ODxkh0ca2l4nU0F9Nf87V4idYgii3x+5qQYisD2CP1RHisA435p5zIY4uVwrh//olrZLcGhHEtopemKFf/eLZiISwVZepoRxZqpIdQbAghu0scbVrjhPolWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBZEtI3EswqO5SypPiiDjvjJHu5SKzttJRro1u2vPDc=;
 b=alwtkcU87hSuh2CqTFuISSYaAmXIXK+70aysqWdBeMVzRMZDH+Wfy4Yj6AGSmWxTMFA5Wohn4YknthpZWtlJcOI/CU8VLJnroipkuJ2+SKZtiE5ZK1vY3ljzlk+mRrurMoQzQ7vWJlKN8yRBIk5Dc0bzyK9Vh16aw/a4jLARnCGpyGnPvgJqCUGMGxONfiObR0aOsvZjLET6AHyBmefnhcccXW7h5qgtsO3FjXG9Vamdbkq/iAU49KEUBFTwkD+uBIyI4Jw4nwQ0r0eCPHLV1jqAcd2CrEbLP1z+owrpRfjldP9WdsEHvoQ0ySHkN9pZra4MYCgPUQDbQ/yVPLapTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFFCBF1B4C7.namprd11.prod.outlook.com (2603:10b6:f:fc02::62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 19:17:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 19:17:55 +0000
Date: Thu, 8 Jan 2026 11:17:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Message-ID: <aWAC4EyhqZZT5tbe@lstrano-desk.jf.intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
 <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFFCBF1B4C7:EE_
X-MS-Office365-Filtering-Correlation-Id: f24d0709-7ba0-4c4f-9801-08de4eeaa023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sK/I+GWenLyiG+BoKO0xdB86e0KdiGXA/k6mlFpE7eMfxTQtSMQosGHK7Xeh?=
 =?us-ascii?Q?TISFGDrbEi21QqvA39RlssusmxX4DYoSJDOnKErYMpeH3ac2vefXuH9o9acD?=
 =?us-ascii?Q?xUsw4Q64YjFS/W8ys8YFgbzyC2XoYmMjS7NfdnAQwEhr5pMnNjwoNaFOWYVt?=
 =?us-ascii?Q?wZwlnkl0B25NdlErWn+d9oGh5Z/Y7qxDcLV6LyWDF3OGcWpMlFPJO1bbEVNR?=
 =?us-ascii?Q?99xYuZg06TM/rEhoi3Dho1L358lAKAsIXJtn4j+eaWcmXl2HGIg7BcVCSCZx?=
 =?us-ascii?Q?qWYfOIQ9fFO643faBuQ9n7p+Nj7ezDDbWzWlsHDu1/948WEPJLBwjOpIXNMv?=
 =?us-ascii?Q?tjhMNmVszoPRiA/Joj+jT3+ke2QIWchblA8BVHeCqNqMlvfUldOnLtGsqiqR?=
 =?us-ascii?Q?AcHD1iI4B4sAiQK7WJ3imtVwPuGEuH0lPJgP5gpBC/gfPSIYjHal8SN47tyT?=
 =?us-ascii?Q?lH+7HUIKbAiPSkRS0Mn04BA5+0R8MdOFucsfSjdmUsnmEKIKs691i9ESu6gG?=
 =?us-ascii?Q?PxYULF4s6AUoJu9w8pf+XsADpmLQiQuhQGsk6Z10pKzSC7sFbrJoVRwlxTBN?=
 =?us-ascii?Q?1PLSwFkhsRad7p7feZnIlKBgEf64PhcrWMAY6tYzzXyYccZq87inPExpaV+I?=
 =?us-ascii?Q?8kHdDk5zRW0zI4pxHF4Gqfz0o95eAKTVq7IzUe3okD8SAT1xpF1OvkuotYEz?=
 =?us-ascii?Q?jdkIuPDvjSO8v6y++ayEJ9Fd75KDmTSvgDahocBmWzX9VimN2me3zoPD0aNW?=
 =?us-ascii?Q?wvldk/q91tSX9uv7slykn5uyJO/vJEJ6R3tKjRUCqTyU/XKyTQ9xaZuK8/Uj?=
 =?us-ascii?Q?PYcwsS4vzAEFwecJOKuKZ+MMgjUnEtpgHYxILmF074MfjH5j4fwIHT5lvKKb?=
 =?us-ascii?Q?06LUL13UNl7OXngZlUmIBEKO4xJUZtc5NzukZ2F9JW72fdnRb1TsEk5OhNq1?=
 =?us-ascii?Q?9fWnoOK5M5p7Gyj3o75xL22RhlRF10XaJoIaKp1OFvPtUKNA0yW5F2GQOPO0?=
 =?us-ascii?Q?qKMG1kkLCEdA4hAEf/db8BMavT2f45RyauCKCJsRAIkmnnFpvQIURC/4vFLn?=
 =?us-ascii?Q?zj89BGlt5703WKCn9Ers5gCE++F12F+x2xAEMiSydWNhzYBD6iu9JmKvSLEb?=
 =?us-ascii?Q?/EGJlATLsWYn3dE06gVXUTde9xUf0U2OBy2MKPpG3Lvf7KyG2i2egZH/PUmc?=
 =?us-ascii?Q?DVlMDL0+1qaHL8gB3NBW3t3Tmog9y0ymYMvJ7Ad6Wxn2fCmwXfNVyxyvOOCE?=
 =?us-ascii?Q?6fdPiqeTuTUP4tI+ue20Uqgdj70TO6PEB0xh5Cv7pDcCDzp46p/M4wQUBmCk?=
 =?us-ascii?Q?fp0quuJJN9n9yy9SnSnUGJxDrAfDFe+bbO4LYgRbmsCaexyP6XgvweSn6loz?=
 =?us-ascii?Q?8olixwNrXd4Gen6L25z5Z26BrrRlMhswcycnhNFOAsOXXpV+Abdl/AgwbQF4?=
 =?us-ascii?Q?vDKBCtTH0nujDD9YITzJZEINvb3ct+nc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MO9QXV0FvRwDFIIPx9q15TX3tFj4hPZZzZiToGEdkv+jrcPExbsd5WxSlc4O?=
 =?us-ascii?Q?JP9kg3e9a0Cc7dsj7YdA/Kg73OxPfBEpt8Pv+qqHsacdApDxPi+TPkAdDsB8?=
 =?us-ascii?Q?J2iXptNAdiytUrmI/QWBoiBInYfsxlxcLdOUDibqS5qypn4E8L+C/ezYrgw8?=
 =?us-ascii?Q?Pot3nEme//wYx5WMYrDiNSWQ90IOj8bcDbvsZwMVUYx1UZRMsl5Wi3mGKLQx?=
 =?us-ascii?Q?ZSr5MRDq0q5VnWbWffGC2rh7RF2jV+NGlCEm2VnWB0nJwQ3ZftTovP2cQLFZ?=
 =?us-ascii?Q?SN2xBV9Cvt8fWvxg/tHL7oDk1ayWDCD1Mc4Up9mwCmS6ygwtjs9MPwCXhZ8F?=
 =?us-ascii?Q?gRYbs6qtlQgz3JzKlDmvba6Lift4RsxwJraH5mn6kkFdoxo/fTaiE8xqK3Pu?=
 =?us-ascii?Q?J9J6qtIyJ25PZHmm/tn07RuBRKIyBv8Qcqi9v1KqMFwI8xN6ypIG7cL675ba?=
 =?us-ascii?Q?8Ig/Lxp66YmArlbWlqPU5oQBsn3GCMO3mWBvTq4jNhfA0dfHGSdoxnpLSYeX?=
 =?us-ascii?Q?lZR5qJ8c3FK5mqZfic4Z8fJda0iRZg5wwnhS0FvlTwWSxW3F9cU9hSWdlhZ3?=
 =?us-ascii?Q?HW+6Ryd7xeVZRcNjrU3gigd0RXHBIwiYOrlnLkS5TSRvkh2duzIlxk03jYnP?=
 =?us-ascii?Q?FbqLbyQufX5kcPJbtku0ZPW2SJIxLQyYWfuh7AZGHJOVjrQvynNSbAAoZLzW?=
 =?us-ascii?Q?KC9iTTN96QE6WUmwi9Ov8bUwJk3NnBzPlYSEi6Mm3q4OSjGh8D6OdDmAPc/y?=
 =?us-ascii?Q?lIx13gol0aVxPg3Ldtwm0J6i6oL1+75XT6zg1v1m6ua8VNtprpb+GUm9OeaJ?=
 =?us-ascii?Q?wCcTsqSdS6X+KdLueEd6IfizQc2wjUI/LiJC/yCmNYnusZocJnLM3gfX0W5a?=
 =?us-ascii?Q?E3o65Qlwonok/n0qq/HlNIwFLvaoXJMeEoczQgvUnxdARL4e5xLtMgm0UVJj?=
 =?us-ascii?Q?k2ANvyZC/DIpoWji0Nmy+xngdhe116Z/lcxlpbwt6nYjq/i3W4cb+3xYUM96?=
 =?us-ascii?Q?6kr+/nJ+P12mi0CwPCiEkyuBHc+3wPf6/eU+IQbA5g+qfseNwlF429QjQ+bu?=
 =?us-ascii?Q?pXXO0jaJr+ym/BF2tRvUCjbGYQNxhdu2sccMEVWNivGaFsOmJsxu4QvbEl+L?=
 =?us-ascii?Q?/ChTjkQ4DIsK6pO6WuSf8j9CebdeWWNF3utd9l0wWEYKlCmtHWx+DeaFwwg9?=
 =?us-ascii?Q?1z1giIbB8utRotx6B32MJ0VJt9Vm2uzH5IJQivhGeN6YMx6ZQqRPqib3CRem?=
 =?us-ascii?Q?jE1btejHWRQkd8++p92phbXufswYNzqC7YKTtR0UDSFLhJLEbj8n2TrTUBUj?=
 =?us-ascii?Q?cmE//XbV9TfeOzPkMG8e0e7O02mq9kKjNKrIsAbwyfdL6+pCmw6bY2xkWYjP?=
 =?us-ascii?Q?mk5ku4vspZ96DH0D9gFnXECGR9VsJdBLg1ZlI6aqMt1Oe1K4RtxHdX3Csrve?=
 =?us-ascii?Q?ANUKra2F7BMdkOYEBorDoKwWQEPjAlenp04BNEDxpWdpoA++/BFsm4kWEPPm?=
 =?us-ascii?Q?YWSm7VhRctCd5624XCDJIyL7K9MZcQU0t0fifN/PAnZEaO8nAusGpA8S0m2E?=
 =?us-ascii?Q?MsXDOxlVYvFfwYaesAwQgTDufpLTWCsAg4hv3xb84lH4ZSTH2ARUvf/Nn2xZ?=
 =?us-ascii?Q?ChhQrvWJUvguyQoenPzPnAlSoQvbfo39pOpibI6jSQ8tvIxa1HVeSCcIlt1P?=
 =?us-ascii?Q?F3mARPoWU92yUgkigARidFyLoiWWEEMHQKpdwSIuSqJFKKg55IhD0PJmpaVd?=
 =?us-ascii?Q?9qqyaiFDyHrHtEmWOxiR3PN4chh30Rk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f24d0709-7ba0-4c4f-9801-08de4eeaa023
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:17:55.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXp0IyC4L5pgWVdy7oqtRiRWwZmBCyeSrz/Dd9+N5eOAbNtHfRYODYrrD+BEj7f5S/lGUNzh6OhrFUH29jCxNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFCBF1B4C7
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

On Thu, Jan 08, 2026 at 02:00:15PM -0500, Dong, Zhanjun wrote:
> 
> 
> On 2025-12-18 4:44 p.m., Matthew Brost wrote:
> > In GuC submit fini, forcefully tear down any exec queues by disabling
> > CTs, stopping the scheduler (which cleans up lost G2H), killing all
> > remaining queues, and resuming scheduling to allow any remaining cleanup
> > actions to complete and signal any remaining fences.
> > 
> > v2:
> >   - Fix VF failure (CI)
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > 
> > This fix will not apply outright to any stable kernel as it depeneds on
> > functions which have added in the KMD since the original commit. Likely
> > will have to manually send out patches to stable for kernel which we'd
> > like to fix.
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
> >   1 file changed, 20 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 071cbfec2401..58ec94439df1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -289,6 +289,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >   		 EXEC_QUEUE_STATE_BANNED));
> >   }
> > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > +
> >   static void guc_submit_fini(struct drm_device *drm, void *arg)
> >   {
> >   	struct xe_guc *guc = arg;
> > @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> >   	struct xe_gt *gt = guc_to_gt(guc);
> >   	int ret;
> > +	/* Forcefully kill any remaining exec queues */
> > +	xe_guc_ct_stop(&guc->ct);
> > +	__xe_guc_submit_reset_prepare(guc);
> > +	xe_guc_submit_stop(guc);
> > +	xe_guc_submit_pause_abort(guc);
> > +
> 
> Tested this series over
> 265d13795b45 drm-tip: 2026y-01m-06d-08h-06m-43s UTC integration manifest
> ===(CI_DRM_17772) and (xe-4335) with (IGT_8685)===
> 
> and run test xe_fault_injection --r probe-fail-guc-xe_guc_mmio_send_recv
> --debug
> got few problems:
> 1. Assertion ct->g2h_outstanding == 0 triggered
> call stack shows:
> [  708.967261]  xe_guc_ct_disable+0x17/0x80 [xe]
> [  709.043382]  xe_guc_sanitize+0x31/0x50 [xe]
> [  709.119557]  xe_uc_load_hw+0x187/0x2a0 [xe]

Above is a different problem. Just delete xe_guc_sanitize from
xe_uc_load_hw, that call is nonsense left over from the i915 port.

xe_guc_sanitize / xe_uc_sanitize everywhere probably needs a look if
those calls make any bit of sense.

> 
> 2. Page fault
> [  740.822070] BUG: unable to handle page fault for address:
> ffffc9000c80fc50
> [  740.828896] #PF: supervisor write access in kernel mode
> [  740.834063] #PF: error_code(0x0002) - not-present page
> [  740.839145] PGD 100000067 P4D 100000067 PUD 100ad4067 PMD 0
> [  740.844738] Oops: Oops: 0002 [#2] SMP NOPTI
> [  740.848880] CPU: 2 UID: 0 PID: 169 Comm: kworker/2:2 Tainted: G S M UD W
> 6.19.0-rc4+xu4335+ #3 PREEMPT(voluntary)
> [  740.859964] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
> [D]=DIE, [W]=WARN
> [  740.867952] Hardware name: Intel Corporation Meteor Lake Client
> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
> 08/28/2024
> [  740.881081] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
> [  740.887820] RIP: 0010:xe_ggtt_set_pte+0x53/0x350 [xe]
> [  740.892900] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 5c
> 24 08 0f 83 a8 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
> 89 38 48 8b 45 d0 65 48 2b 05 e6 41 d1 e2 0f 85 e1 02 00 00 48
> [  740.911428] RSP: 0018:ffffc9000074b9f0 EFLAGS: 00010202
> [  740.916599] RAX: ffffc9000c80fc50 RBX: 0000000000001f8a RCX:
> 0000000000000000
> [  740.923653] RDX: 0000000000000000 RSI: 0000000001f8a000 RDI:
> ffff888132562628
> [  740.930705] RBP: ffffc9000074ba88 R08: 0000000000000000 R09:
> ffff888168188000
> [  740.937758] R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff888132562628
> [  740.944807] R13: 0000000000000000 R14: ffff88816818a768 R15:
> 0000000000000000
> [  740.951861] FS:  0000000000000000(0000) GS:ffff8884ebbe0000(0000)
> knlGS:0000000000000000
> [  740.959850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  740.965534] CR2: ffffc9000c80fc50 CR3: 0000000132923003 CR4:
> 0000000000f72ef0
> [  740.972585] PKRU: 55555554
> [  740.975268] Call Trace:
> [  740.977694]  <TASK>
> [  740.979778]  ? __mutex_lock+0xae/0x1080
> [  740.983583]  xe_ggtt_clear+0xa1/0x260 [xe]
> [  740.987716]  ? lock_release+0x1df/0x280
> [  740.991519]  ? pm_runtime_get_conditional+0x66/0x150
> [  740.996436]  ggtt_node_remove+0xb2/0x140 [xe]
> [  741.000829]  xe_ggtt_node_remove+0x40/0xa0 [xe]
> [  741.005393]  xe_ggtt_remove_bo+0x87/0x250 [xe]
> [  741.009874]  ? _raw_write_unlock+0x22/0x50
> [  741.013927]  ? drm_vma_offset_remove+0x65/0x80
> [  741.018324]  xe_ttm_bo_destroy+0xd4/0x310 [xe]
> [  741.022800]  ttm_bo_release+0x70/0x330 [ttm]
> [  741.027032]  ? vunmap+0x4a/0x70
> [  741.030147]  ? vunmap+0x4a/0x70
> [  741.033260]  ttm_bo_fini+0x3c/0x70 [ttm]
> [  741.037145]  xe_gem_object_free+0x1a/0x30 [xe]
> [  741.041618]  drm_gem_object_free+0x1d/0x40
> [  741.045671]  xe_bo_put+0x136/0x1c0 [xe]
> [  741.049548]  xe_lrc_destroy+0x47/0x60 [xe]
> [  741.053691]  xe_exec_queue_fini+0x85/0xd0 [xe]
> [  741.058172]  __guc_exec_queue_destroy_async+0x7c/0x190 [xe]
> [  741.063770]  process_one_work+0x22e/0x6b0
> [  741.067741]  worker_thread+0x1a0/0x370
> [  741.071456]  ? __pfx_worker_thread+0x10/0x10
> [  741.075683]  kthread+0x11f/0x250
> [  741.078882]  ? __pfx_kthread+0x10/0x10
> [  741.082594]  ret_from_fork+0x337/0x390
> [  741.086315]  ? __pfx_kthread+0x10/0x10
> [  741.090027]  ret_from_fork_asm+0x1a/0x30
> [  741.093909]  </TASK>
> 
> Sounds like call xe_guc_submit_pause_abort here might cause trouble. That's
> why I call it in guc_fini_hw, which make the test passed.
> 

Thanks for the info. guc_fini_hw isn't definitely isn't the right place
though as that is registered before xe_guc_submit_init is called.

If I'm understanding the trace correctly - guc_submit_fini should be on
the devm exit handler.

Want to give my two suggestions a try? Also feel free run with these
patch / take over if you bandwidth. It is unlikely I'll have bandwidth
to pick these back up for at least a week or so.

Matt

> Regards,
> Zhanjun Dong
> 
> >   	ret = wait_event_timeout(guc->submission_state.fini_wq,
> >   				 xa_empty(&guc->submission_state.exec_queue_lookup),
> >   				 HZ * 5);
> > @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	}
> >   }
> > -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >   {
> >   	int ret;
> > -	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > -		return 0;
> > -
> > -	if (!guc->submission_state.initialized)
> > -		return 0;
> > -
> >   	/*
> >   	 * Using an atomic here rather than submission_state.lock as this
> >   	 * function can be called while holding the CT lock (engine reset
> > @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >   	return ret;
> >   }
> > +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > +{
> > +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > +		return 0;
> > +
> > +	if (!guc->submission_state.initialized)
> > +		return 0;
> > +
> > +	return __xe_guc_submit_reset_prepare(guc);
> > +}
> > +
> >   void xe_guc_submit_reset_wait(struct xe_guc *guc)
> >   {
> >   	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> 
