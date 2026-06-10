Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B0ACD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7010E48D;
	Wed, 10 Jun 2026 21:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ws0GJu54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9106D10E48D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781127286; x=1812663286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BUYWYF6UYFsAzHGfH6Lix3qOsPAnRYaWPq0fBMkJ4Dg=;
 b=Ws0GJu544Iz7Kx8v3CjeAljxHcOaA/jL+RbL+MLXAqycslDjRtLQDFCz
 Uw0B/xB8pjo4FzX/U1pA4gpcM7HVwSXkdEfLoUn0lgRL+RbUbDypdUDiF
 PSBAGP6/sIBuRtZkXpVoyarp0GwJzMJBv1esGUjEoWH03h/VkbnAW5Mkt
 5v/rsyx0uJyWN9HUYw0uzCRhXs/WnUw0hNfSIG6/6N/xHxKaBR0tVjAMa
 A2oJ7wZD/XCqHxWcNmdCWKXG1FKeklvbmPa+iGa/g8aO1dyl5J0cCd3B3
 InbyQYI6pJOldQ9GmBWE/Tv9Fe05Lem+HQaw64orgJp0rEyY0LYpOqr2S Q==;
X-CSE-ConnectionGUID: nCR+4y08RVGyTp5TpteDtQ==
X-CSE-MsgGUID: EocGmWctR06ctiRIKNgpiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92608139"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92608139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:34:45 -0700
X-CSE-ConnectionGUID: NBJKvT5dS7CzsCrLMQzecw==
X-CSE-MsgGUID: HHIi5lzfRyKjG3Az4m0hzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250199382"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:34:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 14:34:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 14:34:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 14:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWI0x7j3RRzIGhe4B9iMO77AAi7pMmZtrf8V5GbOzYT0SxJxwjrSLL3m4ZCCvABzpCh/q4cFSgpSlN+TpKslVvw9iQyj7i9JLfXVeZw2Gs/y5ko764imoNd1Djswxi6TsX9dGpGXc2pGbrve5p7PUl5bYqTGvIskM0e4ybDXoEhVa+SmyT76p7bOzB79CBTiRCVhhPtA1GWnZnGWzxAETYJO5ReE6lXl0qwYh5/JdXEGUQLpXzC4DDqkXbADiqSJ1fCu6TbYtB86eu/2tOfjHeiijyrtRrXz9VqLIkaorz8o+H12yNPitvTgR39CSOS4Ykd3oeTbrd0StgNhS4AKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edyfpUWrIeN0ayBkdzZ4uoXgI+BY6bGTf9pGdscTHPM=;
 b=ySfXr8q37LdljtP0J6hSDIEjnbZlwag7hUH/u8FHzBwrDto7qEHlcDJnVQ2jb4AvSxwwmUhtWeciMH2RIsUbocUYFpWvxFwa+EcqDMRUW4RcSVWQDzyrPZW2KHWg87gfBUlemGGKCEpBwO9PtBKFyDL0vHOO1cIKOB+x+ZlD/Ey5sXqFYNCrNsed8Wjno0uAZd0bkUxW9VjrPFhQXecnYzmw9vGR6EB+UN3aJwcyo+SyoO7rsUiZrcRUkwsYphF/Yd2rv3/de89k0T6ondeOR9D/ACG17BwXIdseE/5O2VHVpwYf/Uz39kN9ydM65tV+OemhMaMjHR7pDSjG63XNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ5PPF5CBB3CBCE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 21:34:40 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 21:34:39 +0000
Date: Wed, 10 Jun 2026 14:34:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/multi_queue: preempt primary on queue group suspend
Message-ID: <ainYa3M6FkFWUpaG@nvishwa1-desk>
References: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
 <ainBeTIG8DkoxI4G@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ainBeTIG8DkoxI4G@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ5PPF5CBB3CBCE:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c4ce2d-319d-4898-26d1-08dec7381329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 95BoBvmJLIL7YV7789vWer68J8PmDsD253Axx4MihSvEPG9uzdM9aA6TVCxrUOnPkeVjy8By/90VMPnCCs2N3yfp3WSh2fxl2o4/0Gd137N2qon0DjRS33jiEGVitJnhLtE58mpy7TZJlqDjlna85CUTNSY9XNNPfAXSW1v0jZqGulUAL/WfjP+C2o2Cf2zLwpGpu4a24o56+52fIYWPWCvlFCjSMDNYJirnt6WulvverUy1SDBrLzTEXnFlc5pLtBZXu8DIzdHjKAC8WRhlbXAj46IaCk9J+AcXDnCI2ZM9eYylLmYf4gsUVwxn+maosm9VSuXpNmduCfvher5fDDmKfer6q/3+dJP/bItQhPHRHcC/FFdDrcSlBggw7969ia7K+VQqSbfbEQFSCxzYbyOKgVIqfEfOeUS+M+G4msHCRo0OloCM4dl6hxMqb3ljqJlYtNfo90kofyHz62Y/w+9cSsdOrF6EgsQ4CCMqYSrikNET1wWc+cRHQOyeqVmPCrFevkflp7vCEpgQs+TmIF79ajB1Eqn3DUMuEKZBsAkrjwV5UH/F+Phs/0VebX4ggwaux77wLyWxyln9y02gy3z1SJAB94B4HTmykN9ESI05slKEVKiv8VYtgVBMX00ZLe4YnLELV4ZccQ5hwRiADqXxkQjROnrAKjb9oNJwvildzf83M8s0B/BbfVGIowID
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2mDayYUyKUn+rGS3uQl6REeOtChIkpGf3bavWqme/f25fmRfP7WjULvxFgsH?=
 =?us-ascii?Q?FbWifhun+A1XoH2dj2Dc2Ml+MGdwwNEmcVTTk1nrwbKAGTf05QM7HW1ulRPm?=
 =?us-ascii?Q?6i2sx2W0UQ4/HQHpJ6PCCe2TVAb/P2skgWGHfyV06k19DHIemGd/mtOK+A13?=
 =?us-ascii?Q?ETnqRf/+vwcMFnoP2rNytlHeePckWkBegHwMil5te4KOkv6RCk5VIFdnjMhN?=
 =?us-ascii?Q?s8rgAxVDtsP7OjrhpgAh+Wv3MH3eG7JSHA0/pyWkOtpevvjvS8WBBuTgXka/?=
 =?us-ascii?Q?fsC7eJedlFvo05UY/I2Po/hZnkSagdbRhDCWkxp+VslQANArq70Zqd7tojcO?=
 =?us-ascii?Q?2CJCbaNjmtciRe9hidRwDGwocA+7YKQ9xDGuO3sVPDD5UwQRkkS/16mRfnET?=
 =?us-ascii?Q?Spaad3Cp/ztE/SFGgemU5lXbiPmrQy8OV7BwLm/Cx2LHh6b0ca7I7Fenh5RY?=
 =?us-ascii?Q?gsG3D+XwUDVgkppHW/uyFTxuq+rC2i2VLls2VkyJo56Yin40yNvHaIenDTTq?=
 =?us-ascii?Q?uIDHDXI+ZjJ4OgBfUZs8zF8gsAF7+kZ0k/IdnEV8EWDO6/QucZo1FeGw6geI?=
 =?us-ascii?Q?fDryowKoShf7cYP7o4xIqk6eRai24ap/pEusX61SSrdJlG2WDNorcmA42lYW?=
 =?us-ascii?Q?fQRc6oFQkeAH6cJmaa9b+f3dA98euhyXjUFVB7fp3f+zgNuZWh8xJby/HN3E?=
 =?us-ascii?Q?fHlWz/EPSh12agHnCwDivjW+AcWwOSZpqRZ7oBYv6N2KwHBIgoEwxxmtqsk4?=
 =?us-ascii?Q?UF9qrGPzZw3dpOPHPNykijRW0uSEFNvMyiN6WPgb3NoDmxJwyEqx3KNWStbX?=
 =?us-ascii?Q?qsJQoWgTHPNYkHxe8/sMidW/uEceMiWh+3H5xNYC2Fy1FOT7QRhEqj8Xeb6d?=
 =?us-ascii?Q?fz32mXpJC8UmoNpOnz7njAd/kMeMG1XdWgGhg+kkWaM2a1sP5E02CEcsqSz7?=
 =?us-ascii?Q?3t5Gw+Ajep4npWMoprxXodzr4QkCBmp22ERDF9lnnW0naEwBpltg0cgfDHSo?=
 =?us-ascii?Q?/S/2fbaD6XhyUwwx11l/i/ATaOU/Q6NTKRWDgzhRvXV918JHKH6jjFak2Cj0?=
 =?us-ascii?Q?F0zROaY2y9BURGJi9SG7PuWSIs9OVlisfeaeNUi8/e+guXx8EUxOKw5b3ytd?=
 =?us-ascii?Q?IqpwHeMUZjA1Cb0ikJE3vLxUS38inJ4uUl+X3sDr/fD18rgZD0VVO42fNspP?=
 =?us-ascii?Q?enYZbwgMoh94jlMcNszJNbEWF0Xti524Wr3pgcsBFECObpbhUF7QPDZRHuIP?=
 =?us-ascii?Q?sfTW36RqvKu6/iEeYYU+HaLdz7wTWLPY1QshpClFqi5NMkiX9OCdWWjlHabU?=
 =?us-ascii?Q?gIiEZsIHwMlNDNgZYnzjkVxO9NmV48JIb+i4ATOM2peg6M36YxuCqcod2JYI?=
 =?us-ascii?Q?gv3plue2fPbUTVeFBYRxkfZ3jM4xD/O/PtWGrJvEBkoynAk5TxiEKdXADkjc?=
 =?us-ascii?Q?N4kPHY6o0avwu0VbdLOn+GFpScsk6T3DsIr338RtZQzccxsENfz/TMMccgYz?=
 =?us-ascii?Q?dCO3yh02Mr9T9TwdYzQfWhMW8QqjqFV8Rxz6MbhmWOeGKj215Sin53QTaDhm?=
 =?us-ascii?Q?+2l/Wyks6fUESygr+Cy5N1eoKOM6yQDS3xNjEIuaMjEVW+bOjUQteLHPEwjE?=
 =?us-ascii?Q?EX2sQacaPw5ISFwwN9IUlpiMD7YA08s/6DdzSIWILycMZZ+9eWfvan5XYc+0?=
 =?us-ascii?Q?rzUz+EVCNKpFgimM27Wb1D9O5gX/i3pOgBkGb5DvlFSXJx8uNUCF906CTsMx?=
 =?us-ascii?Q?mcZcsUk1puoQAfI6UKuMhLNouM5WsghlNV8pdMv4J5I9gcYJ7uq5?=
X-Exchange-RoutingPolicyChecked: ht8v6YKkrzpakEC8vNEu1qvQN2H+d72MOuTqmCGrBAJ4ibWjk4jG0kDOO1xzBI6VwXj6QPlwrH8n/edPFZfwc0i+krilQ8GgaurSIlWf9a8OEwanLTdUccGyCwIahmPVbketSAcn0Ms7cnICH3DGPIFtBo+QGrAeuezUkLiRfGSYxJAGvOjw2w13nXfDOjy5jeC9qMJG8xLkmONUIJ75CjPaHccnK4K8lwZd5f90pHCetqDZlMm83V0quKb076t724bCdRMgZCW8PLN2pEHiSHx+iy9OmTXjyaobRBqgKhu5zsVxz/rg72DHaJNaGztR7TmbStI0uMvep3d2O0cmzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c4ce2d-319d-4898-26d1-08dec7381329
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 21:34:39.5049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6hG/qvK3qYMcwbRVhIGI89wOMw/8Nfjw9wV3p4ZXb2W9V3/K/00QUGFXSaXsC+rBoHdbfj6hLucgEg41SEPo4GS6y1LJD3bq4nMtbGbAilKI9l04F+ORiA1TVEdjavU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5CBB3CBCE
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

On Wed, Jun 10, 2026 at 12:56:41PM -0700, Matthew Brost wrote:
>On Sun, Jun 07, 2026 at 07:11:00PM -0700, Niranjana Vishwanathapura wrote:
>> In a multi-queue group only the group's primary queue interfaces with
>> GuC for scheduling; suspend/resume of secondary queues is handled
>> internally and is not forwarded to GuC. As a result, suspending a
>> secondary queue alone (e.g. on its preempt fence signalling) does not
>> disable the primary's GuC context, so in-flight GPU work of the group
>> is not actually preempted.
>>
>> Route group suspend/resume through the primary using a group level
>> reference count. The primary's GuC context is disabled on the first
>> suspend of any group member and re-enabled only after every suspended
>> member is resumed. A per-queue preempt_suspended flag makes the
>> resume-all-queues-each-rebind-cycle behavior idempotent and keeps the
>> count balanced, including on queue teardown. The secondary's own
>> scheduler state machine is still suspended/resumed internally so its
>> state stays consistent.
>>
>
>Overall I believe this makes sense. A few comments below.
>
>> Assisted-by: Github-Copilot:Claude-opus-4.8
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  17 +++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 173 +++++++++++++++++++++--
>>  3 files changed, 181 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 1b5ca3ce578a..df95855a3d61 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>>  	INIT_LIST_HEAD(&group->list);
>> +	spin_lock_init(&group->suspend_lock);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>  	mutex_init(&group->list_lock);
>>  	q->multi_queue.group = group;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 2f5ccf294675..30c5dfcc58fb 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -62,6 +62,16 @@ struct xe_exec_queue_group {
>>  	struct list_head list;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>> +	/** @suspend_lock: Protects @suspend_count and queues' @preempt_suspended */
>> +	spinlock_t suspend_lock;
>
>Can you mention suspend_lock is nested outside of the queue's message lock?

Ok, sure.

>
>> +	/**
>> +	 * @suspend_count: Number of queues in the group currently preempt
>> +	 * suspended (e.g. due to their VM's userptr invalidation). Only the
>> +	 * primary queue interfaces with GuC, so the primary's GuC context is
>> +	 * kept disabled while @suspend_count is non-zero. Protected by
>> +	 * @suspend_lock.
>> +	 */
>> +	u32 suspend_count;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  	/** @banned: Group banned */
>> @@ -176,6 +186,13 @@ struct xe_exec_queue {
>>  		u8 valid:1;
>>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>>  		u8 is_primary:1;
>
>For valid and is_primary, could you mention that these values remain
>static from initialization to destruction, since part of the bitfield is
>dynamic and protected by a lock?

Ok, will mention.

>
>> +		/**
>> +		 * @multi_queue.preempt_suspended: This queue is currently preempt
>> +		 * suspended (e.g. due to its VM's userptr invalidation) and is
>> +		 * accounted in the group's @xe_exec_queue_group.suspend_count.
>> +		 * Protected by @xe_exec_queue_group.suspend_lock.
>> +		 */
>> +		u8 preempt_suspended:1;
>>  	} multi_queue;
>>
>>  	/** @sched_props: scheduling properties */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 4b247a3019d2..8ec3ab24048f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1657,11 +1657,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>>  }
>>
>> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
>> +
>>  static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>  {
>>  	struct xe_guc_exec_queue *ge = q->guc;
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>>
>> +	/*
>> +	 * A queue can leave the group while still preempt suspended (e.g.
>> +	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
>> +	 * which suspends it). Drop its contribution to the group suspend count
>> +	 * and resume the primary if this was the last suspended queue.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		guc_exec_queue_multi_queue_drop_suspend(q);
>> +
>>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>  		struct xe_exec_queue_group *group = q->multi_queue.group;
>>
>> @@ -2147,20 +2158,82 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>  	if (exec_queue_killed_or_banned_or_wedged(q))
>>  		return -EINVAL;
>>
>> -	xe_sched_msg_lock(sched);
>> -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> -		q->guc->suspend_pending = true;
>> -	xe_sched_msg_unlock(sched);
>> +	if (!xe_exec_queue_is_multi_queue(q)) {
>> +		xe_sched_msg_lock(sched);
>> +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> +			q->guc->suspend_pending = true;
>> +		xe_sched_msg_unlock(sched);
>> +
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * For a multi-queue group only the primary queue interfaces with GuC
>> +	 * for scheduling, so the group is preempted by disabling the primary's
>> +	 * GuC context. Route all group suspends through the primary using a
>> +	 * group level reference count: disable the primary's GuC context on the
>> +	 * first suspend so the GPU is actually preempted, and keep it disabled
>> +	 * until every suspended queue in the group is resumed.
>> +	 *
>> +	 * Set the primary's suspend_pending while holding @suspend_lock so a
>> +	 * concurrent suspender of the same group cannot observe a not-yet-pending
>> +	 * primary and have its suspend_wait() return before the GPU is preempted.
>> +	 */
>> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *primary;
>> +		struct xe_gpu_scheduler *psched;
>> +		struct xe_sched_msg *pmsg;
>> +
>> +		if (q->multi_queue.preempt_suspended)
>> +			break;
>> +
>> +		q->multi_queue.preempt_suspended = true;
>> +
>> +		/*
>> +		 * Disable this queue's own scheduler state machine too. For a
>> +		 * secondary this is handled internally (not forwarded to GuC),
>> +		 * but updating its state is still required. The primary's own
>> +		 * state is updated by the GuC suspend issued below on the first
>> +		 * group suspend.
>> +		 */
>> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +			xe_sched_msg_lock(sched);
>> +			if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> +				q->guc->suspend_pending = true;
>> +			xe_sched_msg_unlock(sched);
>> +		}
>> +
>> +		if (group->suspend_count++)
>> +			break;
>> +
>> +		primary = xe_exec_queue_multi_queue_primary(q);
>> +		psched = &primary->guc->sched;
>> +		pmsg = primary->guc->static_msgs + STATIC_MSG_SUSPEND;
>> +
>> +		xe_sched_msg_lock(psched);
>> +		if (guc_exec_queue_try_add_msg(primary, pmsg, SUSPEND))
>> +			primary->guc->suspend_pending = true;
>> +		xe_sched_msg_unlock(psched);
>> +	}
>
>Maybe a static helper for this code? e.g., guc_exec_queue_multi_queue_suspend?
>
>Also assert is multi_queue in the helper.

Ok, will do.

>
>>
>>  	return 0;
>>  }
>>
>>  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>>  {
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_guc *guc;
>> +	struct xe_device *xe;
>
>This should be able to left as is given guc, xe shouldn't change based
>secondary vs primary, right?
>

Yah, makes sense.

>>  	int ret;
>>
>> +	/*
>> +	 * In multi-queue mode the primary owns the GuC scheduling context for
>> +	 * the whole group, so wait on the primary's suspend to complete.
>> +	 */
>> +	q = xe_exec_queue_multi_queue_primary(q);
>> +	guc = exec_queue_to_guc(q);
>> +	xe = guc_to_xe(guc);
>> +
>>  	/*
>>  	 * Likely don't need to check exec_queue_killed() as we clear
>>  	 * suspend_pending upon kill but to be paranoid but races in which
>> @@ -2204,11 +2277,91 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>>
>> -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>> +	if (!xe_exec_queue_is_multi_queue(q)) {
>> +		xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>>
>> -	xe_sched_msg_lock(sched);
>> -	guc_exec_queue_try_add_msg(q, msg, RESUME);
>> -	xe_sched_msg_unlock(sched);
>> +		xe_sched_msg_lock(sched);
>> +		guc_exec_queue_try_add_msg(q, msg, RESUME);
>> +		xe_sched_msg_unlock(sched);
>> +
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * Resume is called for every queue of the VM on each rebind cycle, so
>> +	 * only act if this queue was actually suspended. Re-enable the primary's
>> +	 * GuC context once the last suspended queue of the group is resumed.
>> +	 */
>> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> +		struct xe_exec_queue *primary;
>> +		struct xe_gpu_scheduler *psched;
>> +		struct xe_sched_msg *pmsg;
>> +
>> +		if (!q->multi_queue.preempt_suspended)
>> +			break;
>> +
>> +		q->multi_queue.preempt_suspended = false;
>> +
>> +		/*
>> +		 * Re-enable this queue's own scheduler state machine that was
>> +		 * disabled on suspend. For a secondary this is handled
>> +		 * internally (not forwarded to GuC); the primary's own state is
>> +		 * re-enabled by the GuC resume issued below on the last group
>> +		 * resume.
>> +		 */
>> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +			xe_sched_msg_lock(sched);
>> +			guc_exec_queue_try_add_msg(q, msg, RESUME);
>> +			xe_sched_msg_unlock(sched);
>> +		}
>> +
>> +		if (--q->multi_queue.group->suspend_count)
>> +			break;
>> +
>> +		primary = xe_exec_queue_multi_queue_primary(q);
>> +		psched = &primary->guc->sched;
>> +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
>> +
>> +		xe_gt_assert(guc_to_gt(guc), !primary->guc->suspend_pending);
>> +
>> +		xe_sched_msg_lock(psched);
>> +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
>> +		xe_sched_msg_unlock(psched);
>> +	}
>
>guc_exec_queue_multi_queue_resume?
>

Ok, will add.

Thanks,
Niranjana

>Matt
>
>> +}
>> +
>> +/*
>> + * Drop a leaving multi-queue member's contribution to the group preempt
>> + * suspend count and resume the primary if it was the last suspended queue.
>> + * See guc_exec_queue_fini().
>> + */
>> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
>> +{
>> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *primary;
>> +		struct xe_gpu_scheduler *psched;
>> +		struct xe_sched_msg *pmsg;
>> +
>> +		if (!q->multi_queue.preempt_suspended)
>> +			break;
>> +
>> +		q->multi_queue.preempt_suspended = false;
>> +		if (--group->suspend_count)
>> +			break;
>> +
>> +		primary = xe_exec_queue_multi_queue_primary(q);
>> +		if (primary == q ||
>> +		    exec_queue_killed_or_banned_or_wedged(primary))
>> +			break;
>> +
>> +		psched = &primary->guc->sched;
>> +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
>> +
>> +		xe_sched_msg_lock(psched);
>> +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
>> +		xe_sched_msg_unlock(psched);
>> +	}
>>  }
>>
>>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>> --
>> 2.43.0
>>
