Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04541CD98C5
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 19:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76A10E4C8;
	Wed, 10 Jun 2026 19:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myMi9Zi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3971110E4C8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781121410; x=1812657410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KeqEVBxShTxeOvTxTQF+ItXG91NgO8332paMYtqtO80=;
 b=myMi9Zi8Dd3x++wNRqEh3NX3fGPHLvhryBKVDOHWZIg8nqgCMHlcJ8Zs
 ie+N7BhdV6bdqt/watEcZ9anL9mmeklIv64BOWLR2JfXVprHMxEW4Y2IX
 JHeLSymIZBHDYB/8R+WuyBhbEhW3nh+8SJa2nEE34AZTK1URF3yelq0Ru
 hOC2JWNPho/hPKUzNaEhCmBI2MvCkN5G9SOJldgLPonImIMcrwz9SLskg
 KySqAIRnIlaN1jg/mDMNK0j0psQyWcLD7doAORwi3gwP+57AFkbWQOu+w
 R1DU28ZIzTowxV+byYPsvWmr2vdjSREp99hm7bYKFaObCMvmyBab3OUTe A==;
X-CSE-ConnectionGUID: 97o5C/BuRBaDXRIecqU/Mg==
X-CSE-MsgGUID: Bfw+MGT7SNCsfOJ+rTuT8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81988900"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81988900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 12:56:49 -0700
X-CSE-ConnectionGUID: js5/fcvxSa+7P8lNZPdFCA==
X-CSE-MsgGUID: jG+W7rB7R2qtCUKpyaS0CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251183429"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 12:56:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 12:56:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 12:56:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 12:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT2ceu4M9I9xrxMru8az9xc2aRVlvkjw8pZmXhelniqFjqELOhoZN9N+lroCdzRPl0CIPF4BVEURQVUt957jTXq5WH8UfFo3r+6Swzz8TsXlyOpzWlQBnQTHNTlot6RWnSf6iFBPsyWkzATO9VoSTAJJlaiLuq3REuwj6LTeRiS7fZ4zxB/mWQFxl2148DHH22WSxacCjYhJAfLB3t1flHJuP4R638rJSMvMNri9A5IsQCXNx/QV97kcG1T811BPkN4l1jV4qZH2yhnrckU15sNo2GptFYxCs9Q+83VoD0smk54EmcLOMKZnw9UHE5Vl0qKXZW63Uj0hhUF/YvsZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQBfGJKKdzwfM9uO5wZVIbQHYvTPclvHUut8MLamRJI=;
 b=bdNe/1ocPxk8QieFfm4M2et1rLnji898QWHyODX2X1kJ3L8zxiCd+/9F/ojw9I9ofEqw1ap0jVmR/uZ/TmP0DQppct6kKSiTQ1GZDHqQkVs9VwPykM2n1pb4Xxkn+digjiHWOIgHJDn2o20a930eNFwhCjrPh7n2S6sZ5YVSXs3YSMNAkNhuYPrR1KKHsUB+vMzLy+OAfoJ7q+yseiRHJFHNNjHvsfuQbbXTxioiEaARG7dJXzPSIcTEKruLt2LL6VixxFCFdH5PqFnndJswkqnoD8EEXgi3/gczSkU0mtgJhB/K8SjJxBozbVMEKs/6i2r9hblVPqy2Bjb+uG06lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 19:56:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 19:56:43 +0000
Date: Wed, 10 Jun 2026 12:56:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/multi_queue: preempt primary on queue group suspend
Message-ID: <ainBeTIG8DkoxI4G@gsse-cloud1.jf.intel.com>
References: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 885f70fc-a670-4ccf-3c9a-08dec72a6522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 178olI9ihWvJZMAIxo/cbAvvsnP9wnbdck5DXXEszvpuoR+/XkFfQoOGwHmyPWeZJ8yvGPEyrIVcpLtWDNYRD/3/qRM16QD58QNAfflu5jCct0uS7MzC952r0EyDlP3QchIQF/F5qBMbsYSyPenh8DZDKxD54DhQZcQy2JVRG71xWf8xZ6TcTn9SE6fw+zfwIvwmuxqWbXExHkw92bEtQDbnZtpSGArFuNTf0PPnGKnwk4gFK98Cggvax5UT5BbpcuDLRJ42SRrWABH5KH5Jvk3Stz19vwcUNy9ImQB5Q/Sl6EY+PagM51HN+fwScvVGJSoANhpS0pd9SiePk1NztEKrJWafC3ohWv7eWLvFl1I2FUtiLhvamkXHkRGqF4QBduj5h7I1Gn4/FeHg5qyYtWIitqaY7S11TegJmnmMhw/SBY/PprAheHz3sg8PCC8NJfr9SuKBCLiFUPGR9dj5HAfj/vDHhAq6HMp3vKBLVvOF18nUL7qxrqkLZEBXeH2+/43ZGd+Fs+fx4QlWjqy5yX4wJx9ZimOB1v9o8+Oex8dskqQ29kWo0+g/grvaxcodSvyM4d7C3N7CeKSyGgcs5fbj2RhphW0vyx5ozP+G9ulcR2mVB3V1NXQK0lKS8WFoawpUI1Wh5uNhjQcee3z2oKY4AUpUOP2JkCu7cuno4p4VFqguALAsMtKBK5epXXqE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f94/12Cih3Kk1mHymD8JnfiPOXwycdfOcgQIeaE6u7WAMsoV6K9ywLDedlHU?=
 =?us-ascii?Q?WoJ45F8LAKqKqbXlspo1pGU80avH4RMFaQN+pCoORXWPtLAbbJV5Y3RIWWfW?=
 =?us-ascii?Q?eXncz6rHKkz4I8dnFB3C+bxGy4ijL+aq3UYLitmfeFNN5GYshrqZPoDB1FSk?=
 =?us-ascii?Q?yqk2Bf4FUMDlujLNN23EelDpmwpUqVjxNlipbxEFguASBN8Jyhc/gW/a10AZ?=
 =?us-ascii?Q?0Uu7Yj3qI/cCzRB4wm+u19z72XZ7Zsh7jG0iEYNqialxYF7xlGasDN2jrSil?=
 =?us-ascii?Q?qilHXxl248c42yESsreKzYBNUWJxuZpn8ubDLSYR86ZDnq9hAv34uYwlxMHC?=
 =?us-ascii?Q?n99v4nBW2S1CSfSvJiz8EV3bRcj8heRhptHScva1ewnhxELZhVG17JASmueo?=
 =?us-ascii?Q?5KYE4MWqUvZaiDDgFdopnOcBLBtaeiZDWuwYlWRSvxC1v9x9d4QddBn+8XLj?=
 =?us-ascii?Q?a6UkZQI2NWQIIALvuAEMh69+ZPOGyTLZY/rUJYstC9a1uk0VPWR/Ndrg4Ds1?=
 =?us-ascii?Q?Zwt4cjIeEPlzTGa0TS6jHtr84PyC0VVx3s39VlYiOtf0Fx8MWbv87E2uy7hw?=
 =?us-ascii?Q?8CJQi5TUFVPoSDOrBqDA+SeKM33Ks3iXHhlkpGcW6NnUYKL5E8o8MM4yTU8m?=
 =?us-ascii?Q?CGhFD2ivHVeq1/mm6MucQJJmrb+hc8CiwLoBp/UP73BnBn8hqvXkP1nrSm23?=
 =?us-ascii?Q?KI56GkurKTaWPzr6/pRDRhS09gMGe13p/2MM5k4GgbJYOwV7pOO6VAiZw63j?=
 =?us-ascii?Q?N30iQunil50POBxHR4PqMrvSa2S8LA+ynLTfeixs6Ag1Cp096LJJPJDVQdPF?=
 =?us-ascii?Q?Yt1MwZ3rGlXrb3hr87yrrBpG1UiRu3O4MlWXJgUPeOMDybK7bXdGNaVbPg8K?=
 =?us-ascii?Q?TAdyb1sUObdrkRPFfZxoq3UrH3uNsUndHvysUHaFswY/VxERcnPpUWBMboHB?=
 =?us-ascii?Q?Q71q/Cq/TsWSsxFPA31ADnPa6vSoIRYyDalwcpB9aq8w8rM5fqhxelyh/bVb?=
 =?us-ascii?Q?6E1aj3RuLQxJUsN3/p9xaP0LKjvFWlEEsJA6AUWVA/9CwcoinQIjaYe+fYpi?=
 =?us-ascii?Q?2BPAc0aPrbRc9XrcEEF8/BPZh0TgcnwK1mKLZHqTR/rCujSS5jDcLfXe4RvZ?=
 =?us-ascii?Q?ddM3pZ/e71UkWfEpic+vRg886Ke0obfQpZv/qU/Tl9R3QTamyR8PK3k+K1CJ?=
 =?us-ascii?Q?w+LxMj94Rrdpai9D7WxB9XcYvBYLNW3A/g60khfPDN1huop7QsxHK16MU5oA?=
 =?us-ascii?Q?zbN5mqm0AfMAbeK3fU7tSCEVR1HIUjyz7zaTy14EC5Gl82A7+MPwHWTPbIoZ?=
 =?us-ascii?Q?Vy7RZ6QgDM/8MLjjC7831PLKShAzMtl4GwyNxO2C6SW4QvsA/aNjgapuCTxm?=
 =?us-ascii?Q?GnrOr7pgWzRcue2IAOvlelys6DvPMejLPb48Vh0LjlwJyVB5j/GK6ujSPIac?=
 =?us-ascii?Q?YYqxjZtykZdf14zCFk6ktloHNjMyi3MM89LFJuDMpihZ0DtW+qnDr0TY1Efs?=
 =?us-ascii?Q?nxRMMkndLn3qiNMuztHfy8+MhZ3VMs/Z942JbykicjDFBVhxEZvV9WItLOhy?=
 =?us-ascii?Q?vGzOVH+tHcqBtinV320rHNuZuZ2rk5gH9JEEtEdzBmcG2/V5a/2wwKr4Cg5x?=
 =?us-ascii?Q?LP6bwkT2BtW3gfoAdBDPitZH9TXi/2ZspAZvyoZJCnIA0SGTIzKOD6OJU0Hm?=
 =?us-ascii?Q?Llq5OXFcOdP4QsV5sECUwlRE1gislFw6TkiDeYX51vQRD0sOA9/ts5XlZMXD?=
 =?us-ascii?Q?Ko+CxXISkTvF+H1CWaU/RzrvpIh37PA=3D?=
X-Exchange-RoutingPolicyChecked: JMZ47WRwAaZp20Gyv5D1Cgexyw+7ZCEzCbyIB2r1MW48des59z7aHkvABfo4cWNH71wSrfd2curjWMZju/IXWtdgx5OHpihUog7TVlM0gzhT4RfeValxfiXP5a54wEw6EljXI2QBraw0K8R46wVUN+mtA4zyDAsbj0poGhb+KKebaf+xp855FN4beeEpdPUuESBDgT43xcT7Yd6IG/7bkAeA2uzQFntOVkZjSV60fiXiw585GKMa8cuFF+enllcwoNqQFCYrRFr0jEwAh+dyBL6+qCNbHzYS/q80oE8VTJfFjuVmEqbBgWzB/77M8wore5GGu3LROktaB7pOtMOshQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 885f70fc-a670-4ccf-3c9a-08dec72a6522
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:56:43.5100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFJHvCj7UpcicAZdmcf/aW4UBvfWU8CMqHV3+tpYZ6cIDKF/8sQ/8m4GIULGKfwYNxqlBQA7CxtXHaMhBinUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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

On Sun, Jun 07, 2026 at 07:11:00PM -0700, Niranjana Vishwanathapura wrote:
> In a multi-queue group only the group's primary queue interfaces with
> GuC for scheduling; suspend/resume of secondary queues is handled
> internally and is not forwarded to GuC. As a result, suspending a
> secondary queue alone (e.g. on its preempt fence signalling) does not
> disable the primary's GuC context, so in-flight GPU work of the group
> is not actually preempted.
> 
> Route group suspend/resume through the primary using a group level
> reference count. The primary's GuC context is disabled on the first
> suspend of any group member and re-enabled only after every suspended
> member is resumed. A per-queue preempt_suspended flag makes the
> resume-all-queues-each-rebind-cycle behavior idempotent and keeps the
> count balanced, including on queue teardown. The secondary's own
> scheduler state machine is still suspended/resumed internally so its
> state stays consistent.
> 

Overall I believe this makes sense. A few comments below.

> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  17 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 173 +++++++++++++++++++++--
>  3 files changed, 181 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a..df95855a3d61 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> +	spin_lock_init(&group->suspend_lock);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 2f5ccf294675..30c5dfcc58fb 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -62,6 +62,16 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @suspend_lock: Protects @suspend_count and queues' @preempt_suspended */
> +	spinlock_t suspend_lock;

Can you mention suspend_lock is nested outside of the queue's message lock?

> +	/**
> +	 * @suspend_count: Number of queues in the group currently preempt
> +	 * suspended (e.g. due to their VM's userptr invalidation). Only the
> +	 * primary queue interfaces with GuC, so the primary's GuC context is
> +	 * kept disabled while @suspend_count is non-zero. Protected by
> +	 * @suspend_lock.
> +	 */
> +	u32 suspend_count;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  	/** @banned: Group banned */
> @@ -176,6 +186,13 @@ struct xe_exec_queue {
>  		u8 valid:1;
>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>  		u8 is_primary:1;

For valid and is_primary, could you mention that these values remain
static from initialization to destruction, since part of the bitfield is
dynamic and protected by a lock?

> +		/**
> +		 * @multi_queue.preempt_suspended: This queue is currently preempt
> +		 * suspended (e.g. due to its VM's userptr invalidation) and is
> +		 * accounted in the group's @xe_exec_queue_group.suspend_count.
> +		 * Protected by @xe_exec_queue_group.suspend_lock.
> +		 */
> +		u8 preempt_suspended:1;
>  	} multi_queue;
>  
>  	/** @sched_props: scheduling properties */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..8ec3ab24048f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1657,11 +1657,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
> +
>  static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
> +	/*
> +	 * A queue can leave the group while still preempt suspended (e.g.
> +	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
> +	 * which suspends it). Drop its contribution to the group suspend count
> +	 * and resume the primary if this was the last suspended queue.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q))
> +		guc_exec_queue_multi_queue_drop_suspend(q);
> +
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
>  
> @@ -2147,20 +2158,82 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  	if (exec_queue_killed_or_banned_or_wedged(q))
>  		return -EINVAL;
>  
> -	xe_sched_msg_lock(sched);
> -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> -		q->guc->suspend_pending = true;
> -	xe_sched_msg_unlock(sched);
> +	if (!xe_exec_queue_is_multi_queue(q)) {
> +		xe_sched_msg_lock(sched);
> +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> +			q->guc->suspend_pending = true;
> +		xe_sched_msg_unlock(sched);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * For a multi-queue group only the primary queue interfaces with GuC
> +	 * for scheduling, so the group is preempted by disabling the primary's
> +	 * GuC context. Route all group suspends through the primary using a
> +	 * group level reference count: disable the primary's GuC context on the
> +	 * first suspend so the GPU is actually preempted, and keep it disabled
> +	 * until every suspended queue in the group is resumed.
> +	 *
> +	 * Set the primary's suspend_pending while holding @suspend_lock so a
> +	 * concurrent suspender of the same group cannot observe a not-yet-pending
> +	 * primary and have its suspend_wait() return before the GPU is preempted.
> +	 */
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *primary;
> +		struct xe_gpu_scheduler *psched;
> +		struct xe_sched_msg *pmsg;
> +
> +		if (q->multi_queue.preempt_suspended)
> +			break;
> +
> +		q->multi_queue.preempt_suspended = true;
> +
> +		/*
> +		 * Disable this queue's own scheduler state machine too. For a
> +		 * secondary this is handled internally (not forwarded to GuC),
> +		 * but updating its state is still required. The primary's own
> +		 * state is updated by the GuC suspend issued below on the first
> +		 * group suspend.
> +		 */
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			xe_sched_msg_lock(sched);
> +			if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> +				q->guc->suspend_pending = true;
> +			xe_sched_msg_unlock(sched);
> +		}
> +
> +		if (group->suspend_count++)
> +			break;
> +
> +		primary = xe_exec_queue_multi_queue_primary(q);
> +		psched = &primary->guc->sched;
> +		pmsg = primary->guc->static_msgs + STATIC_MSG_SUSPEND;
> +
> +		xe_sched_msg_lock(psched);
> +		if (guc_exec_queue_try_add_msg(primary, pmsg, SUSPEND))
> +			primary->guc->suspend_pending = true;
> +		xe_sched_msg_unlock(psched);
> +	}

Maybe a static helper for this code? e.g., guc_exec_queue_multi_queue_suspend?

Also assert is multi_queue in the helper.

>  
>  	return 0;
>  }
>  
>  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_guc *guc;
> +	struct xe_device *xe;

This should be able to left as is given guc, xe shouldn't change based
secondary vs primary, right?

>  	int ret;
>  
> +	/*
> +	 * In multi-queue mode the primary owns the GuC scheduling context for
> +	 * the whole group, so wait on the primary's suspend to complete.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +	guc = exec_queue_to_guc(q);
> +	xe = guc_to_xe(guc);
> +
>  	/*
>  	 * Likely don't need to check exec_queue_killed() as we clear
>  	 * suspend_pending upon kill but to be paranoid but races in which
> @@ -2204,11 +2277,91 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
> -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> +	if (!xe_exec_queue_is_multi_queue(q)) {
> +		xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>  
> -	xe_sched_msg_lock(sched);
> -	guc_exec_queue_try_add_msg(q, msg, RESUME);
> -	xe_sched_msg_unlock(sched);
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, RESUME);
> +		xe_sched_msg_unlock(sched);
> +
> +		return;
> +	}
> +
> +	/*
> +	 * Resume is called for every queue of the VM on each rebind cycle, so
> +	 * only act if this queue was actually suspended. Re-enable the primary's
> +	 * GuC context once the last suspended queue of the group is resumed.
> +	 */
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		struct xe_exec_queue *primary;
> +		struct xe_gpu_scheduler *psched;
> +		struct xe_sched_msg *pmsg;
> +
> +		if (!q->multi_queue.preempt_suspended)
> +			break;
> +
> +		q->multi_queue.preempt_suspended = false;
> +
> +		/*
> +		 * Re-enable this queue's own scheduler state machine that was
> +		 * disabled on suspend. For a secondary this is handled
> +		 * internally (not forwarded to GuC); the primary's own state is
> +		 * re-enabled by the GuC resume issued below on the last group
> +		 * resume.
> +		 */
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			xe_sched_msg_lock(sched);
> +			guc_exec_queue_try_add_msg(q, msg, RESUME);
> +			xe_sched_msg_unlock(sched);
> +		}
> +
> +		if (--q->multi_queue.group->suspend_count)
> +			break;
> +
> +		primary = xe_exec_queue_multi_queue_primary(q);
> +		psched = &primary->guc->sched;
> +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
> +
> +		xe_gt_assert(guc_to_gt(guc), !primary->guc->suspend_pending);
> +
> +		xe_sched_msg_lock(psched);
> +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
> +		xe_sched_msg_unlock(psched);
> +	}

guc_exec_queue_multi_queue_resume?

Matt

> +}
> +
> +/*
> + * Drop a leaving multi-queue member's contribution to the group preempt
> + * suspend count and resume the primary if it was the last suspended queue.
> + * See guc_exec_queue_fini().
> + */
> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
> +{
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *primary;
> +		struct xe_gpu_scheduler *psched;
> +		struct xe_sched_msg *pmsg;
> +
> +		if (!q->multi_queue.preempt_suspended)
> +			break;
> +
> +		q->multi_queue.preempt_suspended = false;
> +		if (--group->suspend_count)
> +			break;
> +
> +		primary = xe_exec_queue_multi_queue_primary(q);
> +		if (primary == q ||
> +		    exec_queue_killed_or_banned_or_wedged(primary))
> +			break;
> +
> +		psched = &primary->guc->sched;
> +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
> +
> +		xe_sched_msg_lock(psched);
> +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
> +		xe_sched_msg_unlock(psched);
> +	}
>  }
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> -- 
> 2.43.0
> 
