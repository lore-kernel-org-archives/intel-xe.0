Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ABC27C77
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 22:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CA510E931;
	Wed, 12 Jun 2024 22:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMZkjMSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E0510E931
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718231308; x=1749767308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EGj13nBIA8EsDgiwUq5e3v/Qt7ezNwerPuKOYLa5v5A=;
 b=QMZkjMSWElCHyPnBvLfe2A/meK2RT81L6Av0BEGsjr59SKP1wCSN+yT3
 xMhHA3d2de1CJmkfu7Wg3omvXRVU2Zlu0unbAOypqhCJ2pxdSU+WHmZUK
 v2/qDXtd7GlIbDCj05HqO3ADdalYvtm7HsQRkpHtn//taZBx6B2/ouXJ1
 bbYsYWGzeoDiB8doy53nurqkUdsel2qTf3pMc0rmJaVffD3hWq7uAivEc
 Cc6m1s78rIeg86em+0cs8Y/plc6TjtNn62PLhOI5SO1btCcwQBP9Y7TWQ
 /yCz5Q6UAKqrmVKK9Z2+uVljOVN9hNHOW+fTI1gdIpJWU8SAcxIrk309y Q==;
X-CSE-ConnectionGUID: n5MRKWfeRge/3CQAA/NqHg==
X-CSE-MsgGUID: EntshOpIShaPzgBkoMpHXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25603502"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="25603502"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 15:28:28 -0700
X-CSE-ConnectionGUID: f92pgJYuQSKFLbKEC9lewA==
X-CSE-MsgGUID: xM7bdq8AS7qYpmIMQrQPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39820645"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 15:28:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 15:28:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 15:28:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 15:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdXIzcTSrNO8pP5X7Faek05P+YoiUb4VVFAkvGrBiN6PuOmnXwycDmTp+xBjk81pJqitcfvap8yZULirl28H/M9CxZuf2lzDpXF48pcLcDP7wQnYWTFUQG/y6LdDECK3Fv2SXF9E9+usiTNMUc8mJG9C1pB0u881q8FUU+jsAe6GxJ3odZUyxaQLRCuLRmGGuqs1lUpZtE3D2gHaNcjAu5R51bD4GGcQnxWpEvoBjKpzzVNS6MUp7XMmyKC9R1CwjthpL2xguCAmO4u6J6ZtfZTOBQFGWIz+sj+R1gckdau+iFfmznYQlGP+Tcz4i38KDO5ZoxgKsILpSkGpV8hcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfHzwI5JP7SuPoNe5TT9cm6dlrNW2BKoD1ULYA5cEzY=;
 b=PeKcIfJiVWsiduE6DLlshH+Ni7QF329AciNf5Id8d9in9gQxQM87JxnEnX8z1JHZ0g4/kZZnJ7q6iE872x7dCdAq5kzejnOQokUQAfd1SCeNG2wDOT2lkqa0p0643xI4/YwktbqkICO7cjFAtugE5fIFvJlsS4+MPQ1xC3YD5HMAn9aJMO3zJryoLQYk0sVl/sf9Ov8hUgqPS2xI1YL1F0o9SbEcMa+r+l9b6oZ7lNhoVsuPkuyIT6kXYG/Ikx7+5ZySt8gn6n/DZxGPqKyXRgw+UN9zEJzrLyMJxNxYCy2TA6tUxKfsNDNeF/e6Xm8VlsFEqHeD8OmpsOCRjcUC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 22:28:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 22:28:17 +0000
Date: Wed, 12 Jun 2024 22:27:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
Message-ID: <Zmog3JDBVPcX71Ru@DUT025-TGLU.fm.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
 <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 547e60fa-bd8f-4646-9154-08dc8b2ef4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6XaKbZ0KcXglHsCaiJ7j/7T8teJGzLGv2cuZw535XAHU2teuAz0gFayQbv5M?=
 =?us-ascii?Q?CgK+yf0QUfWa5EU5dOewAevUaxTnbUGiXcJz4A1xiEme7x9e4c3Nmwla2eoj?=
 =?us-ascii?Q?oyu9cOFZ19/w+P5SBzCHNQXy2cGkWe9O9t2oqbp33AVjeDV49OWjKofpUwo2?=
 =?us-ascii?Q?pu5E9yigRFmziG7IGwHa9eVl0G0NHVcDG9RnSICsEg0TDa2QnsB+/XZbjEDU?=
 =?us-ascii?Q?a44fk04ePq+GKk76UV9qnse7XjgOMjcA0NE/u2hdSotjNkBeK8Z008P9jF0Y?=
 =?us-ascii?Q?MSLtnVlYvB+7AaOcE+/4mTsw3XI2KL/NOCm74mLBBOrTqXAJIVJe3NCj1+TP?=
 =?us-ascii?Q?4tTlC0TxMiMrPKBypEV+njGeuFCmwRNYjh67Nr2BeGo7Rcv/pWhuZaDxiLAc?=
 =?us-ascii?Q?4xiBwR7awKAKDFptvamHoXFqDqZ/sWwqGD2NPc9oSMnpb+RrWI5wbJOJ0Qlc?=
 =?us-ascii?Q?vUG7lzCjI8RoOIENEgQaHfAjWTj/dnweGWqttHcaeeEWxgaIWlTFFwZMPkec?=
 =?us-ascii?Q?AYOl0liRUUtt207vQ+5uhdZpwRhYzzMVjQcxHrEhdEFeqXiaYBZsRew1vwsc?=
 =?us-ascii?Q?bUhWB05tkWu6wAcIL+oEd2zjOmf1r0JWaW+M7oAl0QqgRltm3Us3t9jqdDLw?=
 =?us-ascii?Q?TkDM7Vuj6YEwwpjTqL1gX2/HyHIV0HoS+lcsI2kDTRtCfG8G5QQDxuwi/xbb?=
 =?us-ascii?Q?h2hvaWCBnww9X2L1rnz2qPeq7cj0ot6kwt9zP8+W5UOo7Zdu41G9s6yo2XPP?=
 =?us-ascii?Q?Mm0HjpVPZABwZdtNh9ldG/8Yq/zlZFzdvDPGUaM0+feKW1cE7yXi42HhdP3e?=
 =?us-ascii?Q?ZCpUy5NhWHXOjb51PT6LJxGn1nfuYXW3ZxTHMIqgwN8x35layhvTM14SqHLm?=
 =?us-ascii?Q?H50bXazcub/GA1HDP6uaY3tIPN3JCRAaykpvIZkFEuc/GqSdS5Hac8Krh/e6?=
 =?us-ascii?Q?kxa3U/llZdwE15OI47IudGDo42r7Vi4RKARPWYMO7WbKqZJ70iwtcfVg50yr?=
 =?us-ascii?Q?7PBH9adnQZSqmCYoOblz1VmEUK1c6EYEb72udiB/fO+5Bk1uE0uMlH6TYC/e?=
 =?us-ascii?Q?I37CzUOFTXqVhzhFs2zeUjnzh/bpoxmBGDyHK4KJ/SuXVDEzTm98qR1gCAMC?=
 =?us-ascii?Q?/6jwjfCRfm2L5sBLb8UJAyXSUmo6cXMd8JjEJeQwUP7kUvNJDQ1B2w1djutP?=
 =?us-ascii?Q?XFYn1KDnPUQFF49yU734sWpO7nh15bHMho4iK/MSQO8kJWbTk4DlSnJsMju5?=
 =?us-ascii?Q?RYdybFr+TZGZTnfBjEvegzkdyWO9mWGW2ey1NADI4M5tWsC/lsII3PGAob/8?=
 =?us-ascii?Q?Cq6hcOqpc8mpIRPI742j3V+D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1QhWGyGdY3Dql9mrK0QeMIegjMj/e8K/jE1zYk6X82HPK5MXsVTzbeFwpjj?=
 =?us-ascii?Q?mWGzNXAtKadqFAFrAJl1LQB5FDFT9xBGOMlww3KVAusV5tQhWq+M1iIjNxdz?=
 =?us-ascii?Q?FndTHVsKmywZ5xgIDm1As3Kyq1R+5Uh8/UhOM6kvz2HXoM33ogSvUxhE8xYm?=
 =?us-ascii?Q?fQoHTSUL4Z3LA9js7c5DQtJg/pgFO+52eDeLpM4+zmYU6u1cbLX/AFhbtZm9?=
 =?us-ascii?Q?vDH6xTdxXMU38g5kH4sEf+C69cDnlL70SfdGCrrTUXl5ozn1KR8O1uBZ0Z3V?=
 =?us-ascii?Q?xV97EJAvKKeaV3nOeBAr6bEPFkYlSyGfC0izeQHnD3vHAmjc4RWDpOXnHdtU?=
 =?us-ascii?Q?u3YCsxxSL3Ns28aPPXzlCGOTBoksKqdLWMVtfyfdxEfue2kEl3Lssz4PClOM?=
 =?us-ascii?Q?2IhCnUHqHPcSjW7A+T68EXy4E2aRdYgHTMUucY8/VmZVU4A3iatp0XGjpnGS?=
 =?us-ascii?Q?JQYq3+z7n2UUEkI9xloMwNH7O17oMKHHTwRe+f2Snq2PXjsUUJMQub8yd9A8?=
 =?us-ascii?Q?IJbxNYk8wkaI9FmCGJKGVxT82KJe/uLrTiDKMX3BTJo6OSSLxISh9aJ06DSL?=
 =?us-ascii?Q?gFAL6sL74/BPP62mULddxVXBW3Qk/yb4WhpRyRXl4Ag642Mi1ctU4fUOFioI?=
 =?us-ascii?Q?mEmEwJ/Kb/TydS+hvyM5Abn9o3x83JTifJcOrW5FpHZAL43BysTX62AMDRIg?=
 =?us-ascii?Q?q7z4966pp26bXwnQ+qjvPBunfc43Z6XDZUjAsMUe9dKIFN1HnDr4WBqFBxGq?=
 =?us-ascii?Q?dtdfLZgtC49vpUv2usjxtO7uVPgPLySrG2G7hQbQVVMm3e7C2zhkHn1P64qo?=
 =?us-ascii?Q?tSMqNZWhgl4/sYN/PnSnKKWXEqX+hu76Hq3W0U1NEoE4y/6yAQ8FLbQlcLtp?=
 =?us-ascii?Q?wZ99DhrejrP2262N5IX1MxKRz5Vu0iSsp+lwfkYRy+aB/etdESFs4n2IJcJ1?=
 =?us-ascii?Q?BbDaX9zKhBGgUrXFiSM7lrI/Y+D+MJXk+k1QoF8071ZYw//GjfNY/xe8NH2R?=
 =?us-ascii?Q?F4H1vfN0BtSRiM7stN5s3fz2SZeLfHRaHaEVT1UuauvER3C+KPrnHIoSK6wv?=
 =?us-ascii?Q?ITJwBky5Tv/yNADQzfqXWwwVSWmrG4zf6gcE1MnKY5omgx4jC9p7sgRZ3iql?=
 =?us-ascii?Q?62pZ0dMo4GTqP/YNFx3BEsxtAyzDSZspoUa/9ShXp1WaWn7n58mTIdVKFrjn?=
 =?us-ascii?Q?0is6SVhmFukigbn224JfTVeoMDksl1mtjrQLr+P36dpKMJb0cFLntKxU1XFD?=
 =?us-ascii?Q?g0/EoTCbp9QbubWRTFxPOO4mpxiNXOcZrRbd8pofX62ynNyTdybkBWBjE1Rm?=
 =?us-ascii?Q?oAMv12IR/vikax0PP7bTYb21lHnPco6lkidXb1r+4S61A5EZRXd5jzA2q74N?=
 =?us-ascii?Q?Mb559abZDR21CxVsMM/6281v4S1VRClSa/3OCNbP9EBTOWa2+QvzZKEk+jgV?=
 =?us-ascii?Q?w/6wOIOPt/C11K7gDbzcN+LsA08yI/3EH26bXli2PosZc9l9a+61UqcrEVk5?=
 =?us-ascii?Q?eidduYQleSW0rw4uUXSkYOFIZ43bz1EwHa/48MeazydWlNEr0L0ZsrS3LG0M?=
 =?us-ascii?Q?UcOsxND9K8dXelWmlD1a5q3Qm+zF7oeYZE1T+T1joibC97l/uOvEq/1f8WRW?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 547e60fa-bd8f-4646-9154-08dc8b2ef4a4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 22:28:16.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A91ZayrN+F2Mr4b9TM3PVWl5DrqtrEnXa5U2BdnYnI0bFgwGgxWyfhx/RES4/8ltvnKQBSnLNsKuj3XDLPzv9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

On Wed, Jun 12, 2024 at 02:25:40PM -0700, John Harrison wrote:
> On 6/11/2024 07:40, Matthew Brost wrote:
> > Ensure G2H and KMD GuC machine match.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index afd22a8d815d..ab0dc93d7740 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> >   }
> > -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > +			      u32 runnable_state)
> >   {
> >   	trace_xe_exec_queue_scheduling_done(q);
> >   	if (exec_queue_pending_enable(q)) {
> > +		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
> > +
> >   		q->guc->resume_time = ktime_get();
> >   		clear_exec_queue_pending_enable(q);
> >   		smp_wmb();
> >   		wake_up_all(&guc->ct.wq);
> >   	} else {
> > +		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > +
> Isn't this the wrong way around?
> 

These asserts are per my testing and CI.

> You made an earlier comment that sounded like it is legal for an enable to
> be queued while a disable is still pending? If so, then you would get in

Other way around, a disable can be sent when an enable is still in
flight in the case of a preempt fence.

Enables cannot be issued when a pending disable is in flight.

So I believe this patch is correct.

Matt

> here for the disable notification but with both enable_pending and
> disable_pending flags set. That would hit the assert. Whereas, if the if
> checks the runnable_state parameter and the assert then checks for pending,
> you will not hit the assert and the code will do the correct thing.
> 
> John.
> 
> >   		clear_exec_queue_pending_disable(q);
> >   		if (q->guc->suspend_pending) {
> >   			suspend_fence_signal(q);
> > @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   		return -EPROTO;
> >   	}
> > -	handle_sched_done(guc, q);
> > +	handle_sched_done(guc, q, runnable_state);
> >   	return 0;
> >   }
> 
