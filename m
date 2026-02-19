Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC85C531E9
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3D10E762;
	Thu, 19 Feb 2026 23:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl9HLbQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5310E762
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544732; x=1803080732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JbUdc3B0100pG7B2R4/kcl3xy63YUYfMFADd6Iq4T8Q=;
 b=Nl9HLbQV8IcLEL/Xgf8geQSAjhVSBXyZjwKyQRFcHHXGvliqsV5nD9ll
 f+c1kPcIr66YF1C1LnkhZfqkiw8ver9Xq/i6K1swQo3DfGqH49rdz3H0A
 Fk/ub1TGN8sHXuf30L+hrNmuuBdMh25Rj0ZX6Bd+Iylmu/b3EJalSEsz0
 cmO3E+DFVGn0oErWdOqSmoy7GxgwtaVNZfADuZx3IMBE4V4SHnCyXkcok
 mc49NF6szBR6ZVbc/IQJ7OlTbPm7CSGHLlIGo6Ny9ovDmZpc3HZXO/NId
 JOI5FR5stk/qgIsnmBM9FdufIilS7hQR2VAl73CG1OjfZK9hP/M5j2Wxa Q==;
X-CSE-ConnectionGUID: xXb70OoyTwuIAn5r9CPLWQ==
X-CSE-MsgGUID: vb2/cuXSQUOAuOmTQglEVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71850477"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71850477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:45:32 -0800
X-CSE-ConnectionGUID: UZOtPC/gT/qLfbJg/LxUEQ==
X-CSE-MsgGUID: ix2K/jfITpWPMfTnvIeGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="237673969"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:45:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:45:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:45:32 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjmdsG8yncz3vOaCv0ealselbw89VWx964qAe7uEqa37e5uwXmxLzENEzp9xG24+ie57nqC7yMUdrTnNNx4g/g7uA3+zZJgvh3FcBx5hXy6tDAwTRlWYy79l1tqFQ19vi6ya1vvDYK96l1q5lg+fO0UpOqZCOjEExzUZGhDVFrAlCrjUxI+9LuQvHgvEZscxXg1BJMIwSpPz/iSh9q5lxXnLGpd1kqjt/DdxjHiix+FB/CgGLKtLRM3QvZcATpEYo4sDpv5vYAJNV5/0YwA3CLtcovidAUPNfoGoI/lBu4ilXJeJR94OKwfRxYw5d54rqY99pZB35zSDHJE73qqacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8s/t3KM/ibgklyxl0bV8TkR5C7EeNNp82m9WThATsU=;
 b=RmkBKmEeYS5WPajKvfdHneRNixj59EHj7RdWRDu2GMHsudkOFKvpwW36yPIGxv6SI2g0FFxT7/zKA/U5CAAc3vPWcA9y49tnN6j8K03UfODllbzQm5JbiQS+98zG/1QwRRiw5N4oTMqDAV89/oRaXx59S7u54WvMIOWD07Zp10YEPiL7EKbCgSb16q986DgsVdwF4O+V2CZTN442h7uCcBkF4Sgt9V6nO5NrCDz2UYDIbq5AqxB4fVyBozjCx7CiD7aFA/HJmPOqSyopK3zAfmBymLXXJlheKtRiPbFEZXBo0y7H+MxBeiIL/xUfdrnj2Wf9lf6VpWaDf/XF7UZdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 23:45:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 23:45:26 +0000
Date: Thu, 19 Feb 2026 15:45:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/sync: Fix user fence leak on alloc failure
Message-ID: <aZeglApCiHaIeYHn@lstrano-desk.jf.intel.com>
References: <20260219233516.2938172-4-shuicheng.lin@intel.com>
 <20260219233516.2938172-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219233516.2938172-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3cf767-6be3-4727-89f0-08de7010f51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kCFGlcYENJjVnAni3efrB4hcqN6MkUi630AjJAG/AFp+GNAIfan+maUc/Rsi?=
 =?us-ascii?Q?RuL6CB2KY7lKENTArw6VsXtGBmZBFBW2doKKrHE6PZmNKibZrRwH1xWDIoyO?=
 =?us-ascii?Q?jyf+RyEcaEIAi1/nGZwgOlgiXrUj2+TXHPeFE9cdzizo5aN9HSjKn9nGjHE7?=
 =?us-ascii?Q?+mEjFpbh+t00kAdwoYSpciXXnB8oKZKe7zBcNcPz9u4K+kzKI9GVO4WGRCBK?=
 =?us-ascii?Q?9l8L27YDLKyNRljS75YMdR0liZLultX+EQyB3bkbRKnePNoCnaHMfuxIV7qB?=
 =?us-ascii?Q?3Ydn4HSW0dgIBs92wNtnXxa/+g9lnEos3pSp7Blr5yzG5JFuPz9KNfEdpsEC?=
 =?us-ascii?Q?81p5iaSGMOPCXZ9msUIvOvfS31S1gn+6Hfuoy8tNqJZSL5m12MT/TeNLoCuV?=
 =?us-ascii?Q?Y9tZonDAmbdsx8YqodDD0k4KPnkzmP18bpdDfqu7YjCCMScCmnX2JPwFDBVh?=
 =?us-ascii?Q?S7Z8JeNmMzgO2b4qqYFetg/RM3lbcHngijSl9ECmJVb9MNyfIPwza49iwFtW?=
 =?us-ascii?Q?H116yW2A6Re4yG3WoIMRSlyGHESktFGu22cvWFOz3ZtF8iezPRbAt/EDDZ1V?=
 =?us-ascii?Q?yEHIvt81Nt9TIoFwj7v0vEXlprDaky+Oz2xS1RSLzfoEgOwtSJcMLyI8cZMx?=
 =?us-ascii?Q?gP1712a//vlUWU7ywnUXhuoupxHqt0avnGQ9IHsTqLuVDfNY+7CwNB8WhanL?=
 =?us-ascii?Q?i8DcapDO9OOGdDX4gvujPtMx/8RqBgLrdDIeByIfhz3QrbCGziXXBW2Q5cxl?=
 =?us-ascii?Q?KJ2DIfefJYqAM8YyvMpRChX12gKd72DsFS2lWCAt6u1r61UpWTDZr1Rx8mNl?=
 =?us-ascii?Q?pjM/sn0mUAokjL8gMIX57nOHDPF2BEg/UcowkjWQJ8hPlSzGH34ymtECADyu?=
 =?us-ascii?Q?TwgiBz41MVdSu+6+npiJ/ymexy6Me8spVaGjG7Pk/XMta8wHjxV86gZOmWzR?=
 =?us-ascii?Q?Gw4YLpm49KQ1q2czvdu9whEUQ9hpsj6Q0e4RDoY8fw4TnEAeINDXj0+99znL?=
 =?us-ascii?Q?EQrjwGJzGFToLD1ExeRY//FmzW/5Sv03kZ1FP8bBDlgJtUgDhJ1mSuFecCzi?=
 =?us-ascii?Q?rshmLfcRvgzbnqX6BR/Stbjk13O9xBnrXriBhcrsa5YZgLqxQNlC9Gmub3i0?=
 =?us-ascii?Q?uVExjbA8D1p3oXDaGzoUNe1lThPhMwtR8jt5GNIPQ2RScpISZKZ6AFUdYpyW?=
 =?us-ascii?Q?bNJBf4IW8XNNT8tc77DjH/mbSmzMX8aKexSnCGS9gjghNxvwwJDPwlzb5J/U?=
 =?us-ascii?Q?yNEWAY8T1OAloR6UpKOdo7p35mZR/G5NsCGwRocKwJ1Xia0MpmaQ+u5gWRw0?=
 =?us-ascii?Q?pf9UoTiDCs/ahzfBO6VWm4Fx9VaSV0RhLeH3c8N5FHU9eaCrzzOcqVm9YmcZ?=
 =?us-ascii?Q?bvUz2WNLnb3Z+wiTigMD09k7Xx7/OTq7UR+ldibOEj3NSwqqRZR4oWrCHXz/?=
 =?us-ascii?Q?OqDf3Lqwd8t7SG78YqaxaVsfTqF18Y3CBm6FQLHxUK+faJV57BHlpt1e4Ir3?=
 =?us-ascii?Q?vSObvbwoX09QjJ6r48Y57ZoMs/1jQsHbKPiNfNuirywvflS7n3+QG34Scyrv?=
 =?us-ascii?Q?QHQLUCWfBQCJ7w8LD6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YP7dWDfcCvISZpbo7z2HSjEHce8a5RarlFC4jljd/AeQXEOAqud4blLjS6YC?=
 =?us-ascii?Q?d5mLm0h3g0rwEtSMPN/hlHUfDqArXS9WUhOvN+y+5iFtggSkvMivF29yiUzb?=
 =?us-ascii?Q?xcUYveMnZImeYMIYAcC4xOnNQT5iym15cGsws8O1ui6NJR9K6VuZxkxS4ykF?=
 =?us-ascii?Q?4IwrEFo+fYK/Qqb2W0BzjJTcPIZhGOjV22UFhLa9oJpPRrw30HSI4CArCV9I?=
 =?us-ascii?Q?rY2x/woblb/8upwOhrl9QlF2Pfc03JyzgngmFt508QfMBM4le5qW+dRoIOoN?=
 =?us-ascii?Q?9XHv9whtDaqDU7BmKH6jMY0urZqgwE86TfSTmtoAKqely7/TjK8pZPKXBgVX?=
 =?us-ascii?Q?kVO5hpPXFXTkOM/SZIZrH3nFpf+OXpe45WTpt27ZGYwg4tUB+S3w51MTOztk?=
 =?us-ascii?Q?Gp0zSpyOh+PCVgfEChjx4gEyoz65ZMnyO3kCsXQhbYKnjd8AD052OPSYptNQ?=
 =?us-ascii?Q?J0F7JXngKh3FKQtzjbhSOybVF3Qpjd22MqwoBcO/hF27TT5Tx/TozUWrprlQ?=
 =?us-ascii?Q?/fecuNVIo0M5IPklkUyqjUCI3qskFVemCYhPVyFVVb+ntmmalLiwh4K6usqd?=
 =?us-ascii?Q?nS9eHFjbZOB2wyzCtpxWOIGEv9SwKm9qk9z4jk5WwJ8ilbRBzPAkHMIhTueo?=
 =?us-ascii?Q?jbmDhywSBf0y2Gv2marv0d4/T2JpdlC6TYkKd0/DhVi7JvoUmuDIUicta3+A?=
 =?us-ascii?Q?IiKxN81ov2SNdV/Z+TmiF34mYzJZJzLgaVh+1SRmhNh0d0Em9yIK2Q8/FWe1?=
 =?us-ascii?Q?dEbSHtq6dMtVnR4kLyfNW8WQxwSX/jA8c/1+HKRRdNdvlShh5wOhBhBdEX7I?=
 =?us-ascii?Q?MB/f9CffV3bJvm6owvq3YN/qg+pvI0xeT1jEL+UeaIJtae9lo4DM5LvJTxRY?=
 =?us-ascii?Q?k2Wjwl4WpTWBmS//39v4AFzLh4bWsO1OJnAXSpwRqVd7oRWJFmD7jAywpybq?=
 =?us-ascii?Q?bwfiiXZ1ON64aYFspC5YVI6gykUMx03VenLBKHtNs/dsXvCoX9+tQ0IFoszL?=
 =?us-ascii?Q?zyr6gE98Q+wOI86yF6zVfFDxTQTe4ag1GR/u7N/Rx0kk3hCK9dHEhDQdlNhK?=
 =?us-ascii?Q?+r3/s5o8XBFs43sJpPYeGgC/gqugRtmIW37dhsIxSNO5S1SuKKhjc1MuwYaW?=
 =?us-ascii?Q?bqjV5MU7ovN0vR7nzXPgvtuXPJSLIVzuWhh8fh4Aezu2XvVcJ0e2qmKWJ1ON?=
 =?us-ascii?Q?cjggIXbNK3ITADpNhAZLsCoeHM+c+PLjJW1g586AEcEHT2IXUTdqavf6VZ0Y?=
 =?us-ascii?Q?0uXapkkY44BCMq/5aHnsabW0159hJ9XzVM8/GbPo+gsDzavN6JKqbKLRkKjF?=
 =?us-ascii?Q?0NDSFdAIK5KOQWk1uswMUVxpkwzA+QggCmgAjPWw6Sg0hz+ph6axDne51IjB?=
 =?us-ascii?Q?gJkjSLBSYJ3/9G4DG1wFVbT6JRVYLWiKDH2Ez2TfQCfViLZCiolCCvn5t5y6?=
 =?us-ascii?Q?2a2d9peUfaRp28mt0cZBy3WnSQ5VL2yNYs+VcqS94XqLEgnhc09g6oMGMqbL?=
 =?us-ascii?Q?T6Nuo1hbT2POwGtrQ3ELLziJ6UZjF1oGCaX3zQ5Bm3QTL09neD+hQBP2a31O?=
 =?us-ascii?Q?c9EfNXOGN+GN6egJTnFf0QvS5qQFjrnXPaxCWTUGYoQeoWfjdv2mALvjhrOd?=
 =?us-ascii?Q?TvsLusRNNA3WJf9Or3uy2+ojXxN2bz1z96Vet4o8TkTIWfv7Dbtob3gP94Zj?=
 =?us-ascii?Q?dSK1YXzDqm3lbCJzNPFx5v1NB9cGTNZ9hAYgi/1BcdN8ScAGv25pS8TH5yEC?=
 =?us-ascii?Q?3vWiHvo3Xb2e9m7rLolGgIhReqp1vEg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3cf767-6be3-4727-89f0-08de7010f51a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:45:26.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKZ+9SW/DdjUA6NHQVwnc4koVaCMGRaceTQ9DkyfMK6FEve6vKfgE7Z+Y4NMMkLbLa6NKTACJ00VxJ7j+rDhmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

On Thu, Feb 19, 2026 at 11:35:19PM +0000, Shuicheng Lin wrote:
> When dma_fence_chain_alloc() fails, properly release the user fence
> reference to prevent a memory leak.
> 
> Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling order using")
> Cc: Matthew Brost <matthew.brost@intel.com>

Opps, missed this on last patch but also please add the below tag when
submitting fixes patches:
 
Cc: stable@vger.kernel.org

Anyways, I can add this when merging after CI passes...

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index f03ab2e27284..52cefbd985ac 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -206,8 +206,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
>  				return PTR_ERR(sync->ufence);
>  			sync->ufence_chain_fence = dma_fence_chain_alloc();
> -			if (!sync->ufence_chain_fence)
> -				return -ENOMEM;
> +			if (!sync->ufence_chain_fence) {
> +				err = -ENOMEM;
> +				goto free_sync;
> +			}
>  			sync->ufence_syncobj = ufence_syncobj;
>  		}
>  
> -- 
> 2.50.1
> 
