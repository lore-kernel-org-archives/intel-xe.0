Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B232CFC50F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B0010E918;
	Fri, 21 Nov 2025 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyIiyjnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9324C10E918
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 23:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763766231; x=1795302231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dd5TwjBKymmawoAupkPefN94G/0Sn2HMITprEIMPsAs=;
 b=QyIiyjnxAfUDvl41rjKq9bFWUUlMX68SHX0eFoUDZc5KpIGnpb2+NJnJ
 gQljEEAx6tJVhReohRyZj99Z8DxaFbZIGxIE95puTCCXrZT14mC+lz/mf
 D//NltgMOYfs2PvxVjfRBEVCVo02VZTP+9HvJ5rccsbzY7ftR+vrxYDrG
 ixjN0c6SvU1VERdMUIfsv49W6ffbkb+mwhJP6UilsQpO3gnDYq/pYP01d
 vddB0OQeg7ic+YffC0arjNoy5P9xEU0GDx0/JwyTVtVQiq3VHETXKDwRe
 uB0N2UywaLMa6pZnShQgrvyf0VnrOdT7eMti/9i7qhAKS40Cn7/UUF1Ma A==;
X-CSE-ConnectionGUID: fb4st0VmTWWkmw5a04KOjw==
X-CSE-MsgGUID: /LwBtReOQFSWHP6nXIMMaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77338190"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="77338190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:03:50 -0800
X-CSE-ConnectionGUID: Ml7p7lsaReShLckue6ZL/Q==
X-CSE-MsgGUID: +pGi4PZnR/Kct1n8FvROQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191691231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:03:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:03:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 15:03:46 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:03:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITU04VWOgnNlSTvb3wl5Qv8uRvTBRaj5SO8CRxhFAAbc1Tuyek6++SWNKlU38y/ilcjavnxnvVHp/4ktiw+Cvac32eKIhCi9gWFdh2Zw6XO4hJ0GYeOZYNlDWFiK59NDSTf2rEhQbCTYgYeRM4ERVPb1eoVJXHPbY4D1cud2YBMpTwonI7/pHXObovqXJv73szMWijCle0WV0XOU6K8mhXAfWo4p5gIF4vEf0uan7DOmGaPW6zq8VmDLZaqrrf7upM8ndw0iRnif+MYiunXjyVcswe7DsDBJtJDOx7b+k79Ah/FTlu74zEEvy0gLSxGTrUjeTtxAuOu2RfccHmqZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr2yRQuzYCX1eg0jxoqnzXuJlzXSDwqI+iflFmT5e10=;
 b=RI8DCTeZ3/rliJfRTqp6aH73Er8yqVkB3sX2ueozzSCep1h1I9v5CFKrZSm4qwQjiaZQETf77OAD41gWbuLs/Nh+hewnrWUQx8EzjjEC/CQ7w8J3eIUu79NWsB299pqQcVt4Cwxd/87q2T+Iy1aJLultfmdAhjUCyvcxWVaZLLsYuwyxi7wsqFAQTZ8+zq0hu+1Lva9/yj4NowDgz0gHgw/La+AWFRt59oRJ3Qm5lSCPCoRlLBth8j87RCz5j3YfiMXmvw8XRjTX3ddDBCVu4jcIfB4tnFUnFI2YNnYmLeF3sXzcaB6XiMvhTNQwQCNY1dTUxxoMbWb1K4yxOwsVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 23:03:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 23:03:38 +0000
Date: Fri, 21 Nov 2025 15:03:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/18] drm/xe/multi_queue: Handle tearing down of a
 multi queue
Message-ID: <aSDvyLS/vDfpMGMa@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6d5e33-b17b-4908-7664-08de29523503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UuANApSFf/69hWAfw4dskETpFT3HSV9QhOdbLDz/R/cdwaTEbDtTzG9Tm9Rd?=
 =?us-ascii?Q?ExsBpfzFduAicP7E+XC2RnYgnO2dhWFcxeVJC3XOG7VSFvmKCzdP/FpFubOV?=
 =?us-ascii?Q?cc3cZI/i01UsYEVBJP3tHq5u7kQiOgH0NEakuR71IXl3By50hYUJljw62iZC?=
 =?us-ascii?Q?X4RspWi64gA5hAl+K8rgpFRZO2o9r/6Gio1PcPzpiApqgaxrjOYH69y56cY1?=
 =?us-ascii?Q?O/QKn/55Sk2SpkWkKe3fLsl/y+tNBJ73IeLqab8rGQJ6SYLKNrHvYQwozl8+?=
 =?us-ascii?Q?h+ZP2BLlEi4A+o34KreMpjnPiyCcNxcTp2RsTyXrdxovbJZYgeH41lUZH0nc?=
 =?us-ascii?Q?A4oqN9+63D94dZ5E/E+42BwxYbYqgWYLCJAs1yEQSQIXKwb2/1eogSumLcVC?=
 =?us-ascii?Q?S7OGUp0FZx0euSg7lcm6w0GC7CaXx1yQFy1Fhv24O1hUFdjZuTjjAn3xDRmZ?=
 =?us-ascii?Q?y6imVQdtwp75OnqqpqpR8YA06usDvknvOePL5bN5Vo1hr0bzLrsT9GUl4GRn?=
 =?us-ascii?Q?jshTxFZavwqbFyrmzW67YVIhloPRuqtMb5HTg0m4k9KEV4cbIF0Ntp7pNFx1?=
 =?us-ascii?Q?CfPK5n/A0e4Wr+6Bqb8BcNdSSxfLmGVW8c03u6ob3jFjSgyfpGJNSQ5p1xSh?=
 =?us-ascii?Q?DHfXO2TlA2rvijEx7CYPnWNPvxc+PgpFXMSYtI9Ts1ITDYbANs0QjMXhTOp4?=
 =?us-ascii?Q?MsJw803zkYGf/ebP3l045Z9DMvclgxy3DfYk8Hu0SUqiYdwMIS59elZjg2uS?=
 =?us-ascii?Q?PLqA2WfRHu/dYlf5GDaxAYFpUUJSzvT7xJ7YAZnRc48zn0svEffzaDosvBva?=
 =?us-ascii?Q?SI9Q03pEwonpINaQpjzV46ihlmScTEYOWELoyS658aeXG9Lwk1fd2GYVpBQV?=
 =?us-ascii?Q?9HS4uIsSf/+6t8Tb4yZJyodYhjB7k0TeSTNifOwEGO9GRhmylcmjwL7s2Pyu?=
 =?us-ascii?Q?b1u1eTIilFzAfa0zKvCzJAnCbR6YRZ0oNPJd6v1WSFJiyFAILhGHC5IjpK9E?=
 =?us-ascii?Q?PDVD7ZXvG+08DaTbTHU6897smZ5R1VXysbKGP7Ip2BlHL71Y0z4cdxw1fsja?=
 =?us-ascii?Q?Rng7vw8tRdzAB7NHvKxM14ZnUNcUbsEqPB3gsnbcTLO+9Cyh3dBQA8XbvabX?=
 =?us-ascii?Q?z5UDjaWfNNKCxpiWiB710WZRIYDidEnbgUHhAHHyDUt5pNW1CgTyTCBwVGgT?=
 =?us-ascii?Q?0J50lK8hxhw95RJkEL8hmscM32xLPF3yIyTykAs7ajDlewrnsGYXUAMu3Yp0?=
 =?us-ascii?Q?+wsGasqYyzn3W6Qb+flVEebKnGY+CXqD7d1BwMlnOjxpdhwcZn9aiIaXUwXI?=
 =?us-ascii?Q?/s2z8jElVI2Fh8VlKkwvoMwB8QGyu2YYSigF5zHLakTr5FnHzFV34tRpBeOA?=
 =?us-ascii?Q?+EfBXdzgLn6U7Bc/AqRh9uZQEshdLIAQsfdHVWBKDZVfbc3AVPyhRbFqtfps?=
 =?us-ascii?Q?0IGL/VLDy6BoW8iL27ql0Ldm/R7PNTW4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RxoZqYmQPw7T4pOvVxqWoTSrrHaHreZwP0qdXNLQMhmuXSEz79ZxcZiu+qmQ?=
 =?us-ascii?Q?YfVIIpwCdxiJsAtfaby723F1siRMQyk5oNaJSPxi6E4h5TSllq+r4kc3zfi1?=
 =?us-ascii?Q?HzE7SbTZCbFmgvSPHwvK6tpIJ02rU4iEdzWh+U/sffFQtB3ZvQC95ovuoIo4?=
 =?us-ascii?Q?6wDm52Vt4UplWc5z6oxitzC5Ss44WII1qUZldbLKZw3OHylvW9h48h+cg6Mj?=
 =?us-ascii?Q?UZ2BnlygB1j2MX9VCGuKm3XcY8qM8PCCdTBR1+3DwDpoNQxapUpfVG1oVHfj?=
 =?us-ascii?Q?D90/Fa43S9hXYf61ZmTPgcbBnFEbVlp9hut8vVeDZ3MOIkuoAlkyXFjvr0E5?=
 =?us-ascii?Q?ZPjF4NO08zonWJBluDGakbQWpnr9JxvHV56RCimvxEJiXP6SOv0JnBAIqZTb?=
 =?us-ascii?Q?UFBZ+bf6T5t7KddKPOdqHCjvrpS3LJ9z1judH+Y8xS6XVA5S2/IyRec73CtZ?=
 =?us-ascii?Q?DFaqLm7EDnvV9r2aET8DfxIMm+eAZ5ypwL0D17rwKaxNzvw/OOse6H519Sv6?=
 =?us-ascii?Q?BpytrsEhkERIEsbNY0nR6QwuOZLDQj5lVp8ZMsxGLdYW4LWAHWxOMHAwO1d6?=
 =?us-ascii?Q?eUkN8fJxgo1C/38vko+bhFCTlRTCwxBp7eLfKly8SiVZAp31WmwRzsmi6+dS?=
 =?us-ascii?Q?VktSNWEVi6AYOzUdZD9RHr9rNaxxwEl6OMq7mwK4yhYlt8AjO67L9DMcm1AV?=
 =?us-ascii?Q?QUxEmfkMH7WlDuVQv+v1RhR9e7Wcl0FmKtLH0PLF9ZCrj3xaOo0DiFQ0NICH?=
 =?us-ascii?Q?fx2kr5ceWClVzOZEnlQdAnm0hEnxUcRuxYsgL6+fO0OZnSfzjUUDWZaQdvkZ?=
 =?us-ascii?Q?Z957wzHkzgKeNVlHx4wc5T/FFPA23BLhGdi9ybk6fyuKEq/n3540hgd96Zqb?=
 =?us-ascii?Q?8hRRHnPQOXjYXE6pJxbpLra6VGauP5RlXurRlelWoxiHFuGKukCxKC4Bvmhk?=
 =?us-ascii?Q?laYVg4lqG2cEtl1/DvvzCcHTfJ+LkgQASVc/jUPjiNwp1FolomnlGjzvPC+a?=
 =?us-ascii?Q?soXSWSgu9AVHKCVwFpjdm3GRXYUIUA42UXDtoREN8Fk2iRgCHUuF2DlKlyKP?=
 =?us-ascii?Q?jSQ8AFmWm3iu6KOVCqes88BW4Y2F3D4pd9hpL9aMBhvpMtxW64MkEqRV8DG/?=
 =?us-ascii?Q?k8gIdmiNzKwWlpqS/iWbVSI6S3hb6eHrptymBXHpNa7ClCVHKlczVc3FesSe?=
 =?us-ascii?Q?J4Qm6V7Bc7hQhvI1DPajV1WQBEUZN6SJ8EVD6i1oZoA0AoqYPbQunrvwe/Yu?=
 =?us-ascii?Q?Bp/Tyr7MFzjsilUFisYfE4w+4RSCytAEE8s4qP9vzw1MoxCu1jMea5GDY36J?=
 =?us-ascii?Q?Gb0qyZr2H8y04jvRhl4eV82PD8Z28FpcU0mejyU9n+aP8MJuJKPHKRcoyMOU?=
 =?us-ascii?Q?eZbXjKldKzAtioBxjx1b2u/fBuXF3Z/nnYxkscty93JeYM/CKU76BUI1Rx1v?=
 =?us-ascii?Q?lwK5HJZXjb1h5tQ2jhIlQZK1wj//vOYF2S951QRM+Gn09S+Y+s5s77llC3mU?=
 =?us-ascii?Q?cLaPqypgNsq5Fe8CqWEe0sUXT1X6diHfPV27QrY+3QegYs17MtG2FgLJKDVE?=
 =?us-ascii?Q?xsqYF14pgaMIe7nvrsSHAMVvn7+mgWJ+XMtbYsuXwJR+3112Z9OQGrL3K3NB?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6d5e33-b17b-4908-7664-08de29523503
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 23:03:38.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIWa/KlPVjOxAg4xEHZMrEHpEcUGIcxiQk2xYhrUPoYuDGrqMjTLKvOeLxMZCIKV5KzwQx8aUWcubZBBeR0FbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

On Thu, Nov 20, 2025 at 07:51:43PM -0800, Niranjana Vishwanathapura wrote:
> As all queues of a multi queue group use the primary queue of the group
> to interface with GuC. Hence there is a dependency between the queues of
> the group. So, when primary queue of a multi queue group is cleaned up,
> also trigger a cleanup of the secondary queues also. During cleanup, stop
> and re-start submission for all queues of a multi queue group to avoid
> any submission happening in parallel when a queue is being cleaned up.
> 
> v2: Initialize group->list_lock, add fs_reclaim dependency, remove
>     unwanted secondary queues cleanup (Matt Brost)
> v3: Properly handle cleanup of multi-queue group (Matt Brost)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  10 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 154 ++++++++++++++++++-----
>  3 files changed, 142 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cdc044d3c96c..ab161b74fef0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>  		xe_lrc_put(lrc);
>  
>  	xa_destroy(&group->xa);
> +	mutex_destroy(&group->list_lock);
>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>  	kfree(group);
>  }
> @@ -627,9 +628,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  
>  	group->primary = q;
>  	group->cgp_bo = bo;
> +	INIT_LIST_HEAD(&group->list);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
>  
> +	/* group->list_lock is used in submission backend */
> +	if (!IS_ENABLED(CONFIG_LOCKDEP)) {

I believe the polarity is inverted above.

Everything else LGTM.

Matt

> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&group->list_lock);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cafb3ba9a123..5721fb4bad1a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -58,6 +58,10 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @list: List of all secondary queues in the group */
> +	struct list_head list;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  };
> @@ -145,6 +149,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.link: Link into group's secondary queues list */
> +		struct list_head link;
>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>  		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ce870a119800..2e5fff7ad69b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
>  
> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
> +	if (xe_exec_queue_is_lr(q))
> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> +	else
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +}
> +
> +static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		set_exec_queue_reset(primary);
> +		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
> +			xe_guc_exec_queue_trigger_cleanup(primary);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link) {
> +			set_exec_queue_reset(eq);
> +			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
> +				xe_guc_exec_queue_trigger_cleanup(eq);
> +		}
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		set_exec_queue_reset(q);
> +		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -939,6 +978,50 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then start submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_start(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_start(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_start(&q->guc->sched);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then stop submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_stop(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_stop(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_stop(&q->guc->sched);
> +	}
> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> @@ -1117,20 +1200,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> -	wake_up_all(&xe->ufence_wq);
> -
> -	if (xe_exec_queue_is_lr(q))
> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> -	else
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> -}
> -
>  /**
>   * xe_guc_submit_wedge() - Wedge GuC submission
>   * @guc: the GuC object
> @@ -1204,8 +1273,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> -	/* Kill the run_job / process_msg entry points */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job / process_msg entry points.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  
>  	/*
>  	 * Engine state now mostly stable, disable scheduling / deregister if
> @@ -1241,7 +1314,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  				   q->guc->id);
>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>  				       q->guc->id);
> -			xe_sched_submission_start(sched);
> +			xe_guc_exec_queue_submission_start(q);
>  			xe_gt_reset_async(q->gt);
>  			return;
>  		}
> @@ -1252,7 +1325,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  
>  	xe_hw_fence_irq_stop(q->fence_irq);
>  
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  
>  	spin_lock(&sched->base.job_list_lock);
>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> @@ -1410,8 +1483,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
> -	/* Kill the run_job entry point */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job entry point.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  
>  	/* Must check all state after stopping scheduler */
>  	skip_timeout_check = exec_queue_reset(q) ||
> @@ -1568,7 +1645,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * fences that are complete
>  	 */
>  	xe_sched_add_pending_job(sched, job);
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  
> @@ -1592,7 +1669,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * but there is not currently an easy way to do in DRM scheduler. With
>  	 * some thought, do this in a follow up.
>  	 */
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
> @@ -1623,6 +1700,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  	guard(xe_pm_runtime)(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>  
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		mutex_lock(&group->list_lock);
> +		list_del(&q->multi_queue.link);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
> @@ -1913,6 +1998,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	xe_exec_queue_assign_name(q, q->guc->id);
>  
> +	/*
> +	 * Maintain secondary queues of the multi queue group in a list
> +	 * for handling dependencies across the queues in the group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		INIT_LIST_HEAD(&q->multi_queue.link);
> +		mutex_lock(&group->list_lock);
> +		list_add_tail(&q->multi_queue.link, &group->list);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	trace_xe_exec_queue_create(q);
>  
>  	return 0;
> @@ -2140,6 +2238,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> +		return true;
> +
>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
> @@ -2801,9 +2903,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * jobs by setting timeout of the job to the minimum value kicking
>  	 * guc_exec_queue_timedout_job.
>  	 */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> @@ -2882,9 +2982,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
