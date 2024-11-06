Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6151CD3176A
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 01:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794710E185;
	Wed,  6 Nov 2024 01:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa8cbCHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93610E185
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730856751; x=1762392751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cje6r2AwmYQibuMWsu1URBJVHifHqWqCJfTeFYnxJ9U=;
 b=Pa8cbCHVFZyZcriTH3GkuUKEDU0U2hvD/1VUg1BqNB2+zsY8YjG1QDC0
 GMwVMz1uSsYLIztkkP9HIYwliBUan+rcpXYvAqNjNIr6zsv1iH4I9prvI
 jWxeSNs7dV2NAV6oOYegbUY1HqicuIaLsQkputU2Dly0ODfVDJJtzJ0wD
 cxaFMu3j3smLy2TciccFaydN7nvHOmQem2W2wM1kcOV/NvuZ20zHFTbri
 8kuH6FAu7slvgJy4keajHRwJHsQlFX13iUhCck3PleQeKeDDsg7k/8Qpf
 EmxyQDh2hHnH1w6lfR+iYwB1vU57/ODgFjQ53wD1ODjQEd3flC9E/A42X A==;
X-CSE-ConnectionGUID: 8MSsdMTqS5yVXKl06D5bKQ==
X-CSE-MsgGUID: Kd2y8idOQJGXXQHasotUPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30044743"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="30044743"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 17:32:30 -0800
X-CSE-ConnectionGUID: R4omdQq/SA+1vs88aSeCzQ==
X-CSE-MsgGUID: 061HfhMqRYqQZRMcHGx6Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="83904530"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 17:32:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 17:32:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 17:32:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 17:32:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIL+fSDHHwVmQg7Ff2D0joqCZX4capyo6DmAbv58qdFTL8Jt3jA5j+f2PjrJihI6+2wHhjbrK9XrzPaoNXGUgUdzSu8XT+RGhUoL0Ds0MlSuqawz8E6RtFF5/uDApeo0HUK4J6oWdW8BVFHy5Rg8ebg/yMc8/5+9n1LOfzx7Pb8SAtzg5TzFRGS0xb1/pg/IgAhn/q3VJfgWINCQ5Pg6yRliuWO9XE+p0MyR8g3giD8PD5197k7QL61etdjRfBnZk1nxlhQ0BjhYOBR4sqdgeo+hHspKUehYxom5w2wHKc+pu+W8bOa4y6Zt6/LcYO78xcusmLJYj3CWRK2xjCqaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9vmbZUHkjbHHVdvmw6uO8t8HRRzZf9rYJtwCqvI/fQ=;
 b=F2LEJU0qJX3Oj4FEWnsVbHycowmWQxwhxeA9leL9jxzG3rnsgmgGRY++asPaAwwWq1LJIMk4omwYdghuaL4/u4HDtfCC83Gbl/FnCGSvXf8RdYTMMqZobuZ1efTJH1ChztFUbDXJ97ahaeVdfItlnekN2cfB7aga5vDadGUsRIAw/TWMiXX1qJ/D4PigQSTPMwtBCgzwkWPkqBQn+iLmnA8PdNyLNqEeyvP76QeP5MzQW2+lTqhjicGieyEceAb5MIlbEng0MhZokmY1xdAageqYPnifvQTuMsGpvmIgEmniG9fQnPY8RCTiGjvbFen8cAKX9Wf1TnnGoxyd7wiGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 01:32:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 01:32:15 +0000
Date: Tue, 5 Nov 2024 17:32:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/guc: Don't read data from G2H prior to length
 check
Message-ID: <ZyrHP+gyqK6S5X6R@lstrano-desk.jf.intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-4-michal.wajdeczko@intel.com>
 <ZypzyPc1W/BX9ESg@lstrano-desk.jf.intel.com>
 <18db27f8-8fe0-45ff-828e-87843f2f21be@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18db27f8-8fe0-45ff-828e-87843f2f21be@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: d34b21af-c054-4724-0a5e-08dcfe02d88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/F1gfhiy88jpRG/xv24nqz+mU+EQfU6aCe5QDvH+X1Cw2Ly5mxA3f+gXj/2l?=
 =?us-ascii?Q?4VwMXf2iUaL0nqLqljb5wOu8Fb667b2kMtttNVDbY8sAFMjoQjpQiqggwigb?=
 =?us-ascii?Q?yEM/QtA71Eclebrq9lOxGEo4gHY8oDCUNtiGf1tIxQCPQCDH6mq9SjsqhgOW?=
 =?us-ascii?Q?tcvOHBMqDdwMIBCGW8I+6fV70sa9giA5G20/7Is4fYM6J2c0yVbT7yfHVJe9?=
 =?us-ascii?Q?mz4FtZeIVOuFx5shneCBD2txHUIGXAad2QvgdEm/ar4mTWZu6E9NUqYCyfde?=
 =?us-ascii?Q?6vLcOf4O8SN0OjbJOmQsEGOdql9bJn5zsTyMX4J3QpybcbC6HR7QyPNYW8kh?=
 =?us-ascii?Q?dv4MhgRPsARAhfQ0ws9HXcxpPSCn2T9im8coAvKG8mxgYkwIPvn7pk4wg1Q9?=
 =?us-ascii?Q?YHDNwMVqa411Zaah1Na9Wz0IrTf1afVbOyuamRgF7WSKbcZnedtT8ItpETHM?=
 =?us-ascii?Q?KIWqlSx79AziAo4q9dybcMJ9wNgP6FhilrvqxEpMXwBwsXvQIJ2AYTRvfPbS?=
 =?us-ascii?Q?idkoU8SARIYyY6ZBwRJX3+GCu/sJj08T59BnjTLECEjmn30DPRWfvXwi5z4/?=
 =?us-ascii?Q?mB0mk9n26RBhO7ZSgBVyQZQnbazu3xYzEUSyDZA3ZialTNglEtWJ147uCK9d?=
 =?us-ascii?Q?lo73Lp/LwMbhaJ4Qn93Cj+cj2bz0FFZOcO9pqaxevfdex33+rn++X8Vbp2go?=
 =?us-ascii?Q?uJw48JoBML/3WfZd1fs3sc2/R8HaaJrZmXQOVFNu6g5/iGMAp3eYkJuoqBtn?=
 =?us-ascii?Q?3x1+bEN67ZqVEH5lkt6hQqE8hpTRVWFKfwdTLtSwvV4cjziRD4pB/wU/LYXc?=
 =?us-ascii?Q?PaUSqn/1mYtfWY3Glp032xf+WWGsC5KPofSGtFN8uRyljV5CwiivbgiVWB56?=
 =?us-ascii?Q?vV3jxNmqQqhdnxtAuxm5vIfOd5UFzmHdOYHEhKQBcH5EfFQijjCr++eLmX0l?=
 =?us-ascii?Q?6gS10OS7/GZe9LUNqSCwjfm7pjw4VMKL10KT+0YhMBEWT0NBVXmKsll554ml?=
 =?us-ascii?Q?SEISSQyy3/yW+KAYONfnU0OSxA5HSoBVUs1yNRI0cQpdAVTwaDMSE43m0lI1?=
 =?us-ascii?Q?I+w7aF9aXLU4h5lHq8THiqvOdtphULifh8Gt4Fb1osxPDeagUNYPoNYUGsOj?=
 =?us-ascii?Q?YhZZZ7SbsqRzNW0KD+KqtgLAH9ilAg8oEbJtLhRwNhHbEUeDb63DlT7pYcy+?=
 =?us-ascii?Q?Ihpeiy1nGkyRm4knIt98jSyFgGjloZr3gU9nAxSGQnptOdC98cyld55qDF6V?=
 =?us-ascii?Q?sSuywg3VlNo/VPJLYypvtcgQYyZJS7a2WfFhUfiQp/Gnqn8aI7kpBNmLoynb?=
 =?us-ascii?Q?Z/Pj+tvo9h1cYHByP92bgJP7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OPvcDpkxorE45v4mC7KIjRc9oJGHVBPUa9RXHw5KLrcsf36usF3eeW/Rm8eG?=
 =?us-ascii?Q?xNZkIx0hEST9RalOB2G47DO12MbkB7/abQB5n3rtu9x4vrXorbks1S1YNain?=
 =?us-ascii?Q?AHabPOms/Era3vd9ZRIdmULbnLvf+ZrAibQiZmXqRQFkYpS1u/CJuv1CcSLk?=
 =?us-ascii?Q?JKot7t2uBBlSw6wwiYWW57anMuRCodRUtq7KRG6U+xFTxx3NLEChFaCo30VM?=
 =?us-ascii?Q?PpFw4k6dt3I/J57P8vmwsFOAbx9CJYrQUaW0Wub4QBlXzV5ckIOiw0+m8oxF?=
 =?us-ascii?Q?PSevNrjLpu3IsSEGqvkmlMjJwySuYSa0AK57WayBy1XOnGHv5J+hBd2C768f?=
 =?us-ascii?Q?74S3wOlD74TMacC3Lu/rGiVUtdIZPyDiwOkJyP/E4ELrqcljifN5pcqkd0nG?=
 =?us-ascii?Q?TUeYfrqcq/RN5udt5UGEMna5a/1N8XGjxgSaB7cdsBgCBBMicy0x4lwhxxYh?=
 =?us-ascii?Q?QFGx3vDm5cgasOBoVNRiPy+WkAHqOIcHZPEAW/KcGlHPea+KhK3p18m0OWbU?=
 =?us-ascii?Q?LWLu0HaBnTNhQaG2CO7LGSt5bEiDJnaDdkFWdnUCITg5lJYC8GLCk8aRMKbb?=
 =?us-ascii?Q?VfZ17RbEp3Z0lGCuTcMQo2Ue2Ja81DayOLscEsIpvCzrsR0vayUuK4eaw6K1?=
 =?us-ascii?Q?5+ueMcSr5FnmXd1kvByWBUVdoGHZBab88RxJJW8Z60dmRWuKhYpJj1zXz6q8?=
 =?us-ascii?Q?vCDLF4QYqfpzuWWpqQIv63B1sM3ChofmrxhcAX/YHYsmU8IynLeZpFy94K7a?=
 =?us-ascii?Q?KTj8HbFHH9HesWr+ndWyFiwiRML+kr0Zu+zmupS0qp2D3Ynp430ujwxdFji7?=
 =?us-ascii?Q?ezRfYHbSoR3iF79/P+NYPbtuQAIbpUA0PmJQOhb/xgFd3auj7azB9MVtkb6z?=
 =?us-ascii?Q?xq/6z0SOMODqO+CWupXBysgtHFCeTW0X1SHPKHeeRFP9vm1tJ+rv1o0BqaAW?=
 =?us-ascii?Q?zfsqHPst9kMQFRwKg7CFQurrTK61Q5FtGSjxPMgTBZ1sfcYGvo5yr23lYSw/?=
 =?us-ascii?Q?Gz94sXlJt7ECnUmTQRX8/O3JsNy1SPqb165opuT/eVMAWABQaZFvi/p6yKQi?=
 =?us-ascii?Q?ctcZt/zEsBat9/hne8xybPmd2+fGe9Z9a7jjL4i38jfkIu1hlVyqma1Qpllk?=
 =?us-ascii?Q?F8HCla+HFkxuV9jijAiOyyyhi51aefKzpXfBST3MgQKkvqNQOWTiY0Zn5f8B?=
 =?us-ascii?Q?FhxvFlmUlBQEyVcHmuSqQX3D3Ulvn42tkkk36A2+ybzPhClTh66PwJyJDScx?=
 =?us-ascii?Q?wJVXxoQp1Ddeb+I2RVlotYj7fzO3oBsMFvyIfoMIukLk1jwIUIUD2BN28EbP?=
 =?us-ascii?Q?VHLAsuSSxZvH0VQaedJ7Sk+6mFxmdyGk+AErjec4nrAjnVfjHOdY6HawFuug?=
 =?us-ascii?Q?ogHxMBU+W+ACzQumsYQ1IK8H/Y7LCkXyR78AkaUdy8UR+iukk+msGosN11Bk?=
 =?us-ascii?Q?+kOhNcGfhFamuyTGHgSr5HYi4CWGWwwHAdZxkol+L5/qTDIxzpsiksZIYc6y?=
 =?us-ascii?Q?1eDnVYkLeQYvn2jB4dIEv7JDNlRQsNUuiMrM98Hr+SbQ8N8X1s2UfyULjn7R?=
 =?us-ascii?Q?8+6zENC3fBdm9IwrZTTk+HsQvHOWchPVUVJgUJyStTULUXU1+hCdMu47G2vp?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34b21af-c054-4724-0a5e-08dcfe02d88e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:32:15.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUJN3VHexrvqKX4mRVIEYQiLwRGxz6Hc8s4PzHQlqIuEd4bqFRht1rgMMv1cjHkCY87GcIF0IUONC5hR8dxdkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Tue, Nov 05, 2024 at 09:01:52PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 05.11.2024 20:36, Matthew Brost wrote:
> > On Tue, Nov 05, 2024 at 06:30:31PM +0100, Michal Wajdeczko wrote:
> >> While highly unlikely, incoming G2H message might be too short
> >> so we shouldn't read any data from it prior to checking a length.
> >>
> > 
> > Is this really needed though? The *msg is a per CT member:
> > 
> > xe_guc_ct_types.h
> > 
> > 147         /** @msg: Message buffer */
> > 148         u32 msg[GUC_CTB_MSG_MAX_LEN];
> > 149         /** @fast_msg: Message buffer */
> > 150         u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
> > 
> > 
> > I suppose this good practice but this is not an actual problem though, right?
> 
> it's not a problem in sense that it will not crash per today's
> implementation, hence no Fixes: tag, but if that CT implementation would
> change in the future then per function signature agreement it will be
> the GuC submit code fault to read outside provided message len.
> 
> note that since we are provided with len and msg we shouldn't make any
> further assumptions about implementation, as otherwise it would be
> sufficient to access message directly using already provided guc:
> 
> 	msg = guc->ct.msg;
> 

Fair enough:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt 
> > 
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++++++-----
> >>  1 file changed, 13 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> index 4481890be941..147000fd1177 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> @@ -1885,12 +1885,14 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  {
> >>  	struct xe_exec_queue *q;
> >> -	u32 guc_id = msg[0];
> >> -	u32 runnable_state = msg[1];
> >> +	u32 guc_id, runnable_state;
> >>  
> >>  	if (unlikely(len < 2))
> >>  		return -EPROTO;
> >>  
> >> +	guc_id = msg[0];
> >> +	runnable_state = msg[1];
> >> +
> >>  	q = g2h_exec_queue_lookup(guc, guc_id);
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >> @@ -1924,11 +1926,13 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  {
> >>  	struct xe_exec_queue *q;
> >> -	u32 guc_id = msg[0];
> >> +	u32 guc_id;
> >>  
> >>  	if (unlikely(len < 1))
> >>  		return -EPROTO;
> >>  
> >> +	guc_id = msg[0];
> >> +
> >>  	q = g2h_exec_queue_lookup(guc, guc_id);
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >> @@ -1950,11 +1954,13 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  {
> >>  	struct xe_gt *gt = guc_to_gt(guc);
> >>  	struct xe_exec_queue *q;
> >> -	u32 guc_id = msg[0];
> >> +	u32 guc_id;
> >>  
> >>  	if (unlikely(len < 1))
> >>  		return -EPROTO;
> >>  
> >> +	guc_id = msg[0];
> >> +
> >>  	q = g2h_exec_queue_lookup(guc, guc_id);
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >> @@ -2010,11 +2016,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >>  {
> >>  	struct xe_gt *gt = guc_to_gt(guc);
> >>  	struct xe_exec_queue *q;
> >> -	u32 guc_id = msg[0];
> >> +	u32 guc_id;
> >>  
> >>  	if (unlikely(len < 1))
> >>  		return -EPROTO;
> >>  
> >> +	guc_id = msg[0];
> >> +
> >>  	q = g2h_exec_queue_lookup(guc, guc_id);
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >> -- 
> >> 2.43.0
> >>
> 
