Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3885C05024
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F210E472;
	Wed, 20 Sep 2023 21:15:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502710E472
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244503; x=1726780503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k43UGwkhd5d3cva/cIilce5WN5M/zs8Hrm+xdKTN/sI=;
 b=JZ1OmMhr1ZCice2VAcLoSNsAnDKIM830wisT0IfHhxSukaxGWwh/s/bG
 6vIuP5LiEdsGb5ektzvRvikwlJ7bUBQvHr21gMypRQN7aQNMLaiCJyRpx
 CbiYmxIoF5kZJmZlC8IQoijqRWQu6y9hrm9CgRrv/as0vBzaVOSpJBPH/
 M9BM8BY1ucbis+5eNNI6NkFlYHGPwRZSWPCLv/jnEfV7snALJbMchfaSG
 IFIP5lWhPmUqNQQiuQXK3Nim9iDE3o389I4iQMBkvOkj8nc58yMXYBNH3
 lSAUf2q3K+VddGtQzuPBWz0hyuS2mViuuZJVJsjlKP1oSeeoHlrx9VZ75 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370658077"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="370658077"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750095003"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="750095003"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 14:15:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:15:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:15:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 14:15:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 14:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaFOZzKHFpQAv39Qug9aT6agdWAMm1lbvcibGS6iyGy1MO30elKfq26OKv8H35JF3+2681xhPNLZ9fX2yKFGJKfM+rnUry02gezol7C0QpgVFUx0eGd4ZeQg3CT2dlE0zc07La2plJp84ZvhWttjeFfd/0G6o0dBicvraTDHcvkDS12fOnwMzaLvY7RPvlXCUFfeMFsOu0ye/Iuyh4J+2nmC531JRQw27SFTKck41gR6TK5ZlCaFo51hzNhqXznUF2xrqitPeFUeI288ckbCB0q3VYF/Bq7gaySguepUkOZS5NxIJSG6L0WUFglCAZxNT8sLTGN6PKMXT5fc+j5KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzCK83D2sAaLUkfuK2Dq42ruSgbQLAP4luBQkkB5QZI=;
 b=EgoHqd9dsvutNKBYxNoT4/C6xsmB2fnPJBE4LyxV8Mr2NVoaMfPcYmp0qShSXO5mzYdjD6do9SR86bjuyoS5CdrV8tVi6Vh+zlsuxntFe8BgNTvlQkmVt8U1QnPFBuwll321BXrf7mOy1T5SQNRVMOU8n1ACHH6cLeUupiR9YiSjYfjj2+0WCU2LDwQte7f3NNwR+DrC6QT22J6gUu0yFjfFIHbTezLv34rYC0Y0wyyd05CcSyqXBkQ6MimgiD9oCiJGSMsrwJ9mNbWKeoStJHq/uKzNVlI9dVQgsGCN61KRPpWq+l4o3sSZmlnxd79en+/QjDQkXyYY3gaSKNpxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 21:14:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 20 Sep 2023
 21:14:59 +0000
Date: Wed, 20 Sep 2023 14:14:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230920211455.GJ233750@mdroper-desk1.amr.corp.intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 056deb9e-9f40-4204-d43e-08dbba1ea52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5csgBp7JdcvYKZtket8Mx5YW/++zpvjobSr6hfCJ8/yE1IsCDaWGVeV5BIaJgcay52RCXq1QL7wa021Dohjzx9Tekan/b5uKIAzHZBL+NBfwgYFBFkZCbqribQoqJRcm/PiNSdjEU/tJb2kYhfUR1N+W50XA3djvPM/A6u1bSrfI0nzf6GK1Q2sYHPJRdusSPCnOLkzf8pnmsh+CQ0Ck3s07xq2Qu20GHMetJcM5DpDCWXhmqeescSqXCNKnNgn7fsy0MII3IT7U8dYrTZas7pc9ad0QAQpZDTWBr+HhvpcBVQzSCf9z4Ik63LOWCsZKpD+ct2KBVE3yiEPf7y71RlBpaOasatep7CgjM+yZLAJfmqXrKbmDaHH7HudKyCverrhwT+IDO29ONVslRUMJ9aNmPXj6dhwJ3NrwfyvmUkviZNbAqlh9RdPrxsdDwDzNI41E6gOVNOq4A7q95L5yh0HEIbMiAYuwr2U9PlpZX73Fjq9sNkJff7hSFMf994nOF3CI12B5SDhhBHWdG/Nj6DuM4T1rzLeHUDPkN2Q0HJdx6Rhb8WhgjYgKPwF7UdYflCh5YD4SANQZdS+NwbRgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(186009)(451199024)(1800799009)(83380400001)(478600001)(6506007)(6486002)(6666004)(6512007)(1076003)(2906002)(26005)(6636002)(66556008)(66946007)(66476007)(6862004)(316002)(41300700001)(4326008)(5660300002)(8676002)(8936002)(82960400001)(86362001)(33656002)(38100700002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JdY55PGjc1bkNE3/jufjyKyUjyyaz4Y8suVkQQyoD4fZZjqZHJN4L4ceR37g?=
 =?us-ascii?Q?AN6WsdQD4zvEKwjWbWvrzmyta90m6KxJQ5iwHXhcVEeHSByd72S7Gmk9+Hpr?=
 =?us-ascii?Q?WUdLGgXdjEIU6YREt+b3IAw3VXfBiMBm8DQ2LKsU2PgjyP+hP5m4tLhCQe+j?=
 =?us-ascii?Q?/nfOTQnOWKKz12hZQ3txg0eJ5GzlOhSmV4dBWARgh0+ou4i2WssoulVCIzO0?=
 =?us-ascii?Q?QHgLJ3YjA7BDFdc4DwcIAmu/CSJQZHGV/ibUPsj8y7b2xGb5CwFRhjXIXu6N?=
 =?us-ascii?Q?Dkp6lLEyrhwZ9PkpiC/kuz+QBvUwxbbNSb+hyB7a7i4F0IOOJ2IawEmJtHpl?=
 =?us-ascii?Q?G9dIaYwVN3tx8FqDDgMa4ongpqkX4FcHweTZI6WidF/cfvLmyAOOx8PFtAXd?=
 =?us-ascii?Q?K9QA3FhhTzB8lhU1kI74Wv3vjr5mRTnFVne/rp/3+mMbb4xwHGoOuhyQoBk5?=
 =?us-ascii?Q?YcWPDzuSkHfCYRcU/Po4y9YCU2L7QuxjFouy36VL2s3VPumkIxU3qrzU0EuJ?=
 =?us-ascii?Q?lDl7XtlbLhVQUs4hh8CVyT0XRL1NA3U365wd+hs6QQfxEPBPD/NxVUyY6iOu?=
 =?us-ascii?Q?q6fqYVDJsc4Vhht0c0u19vGTZlcpf2S4t9VyLPvCCb5hIvC20klBh+3fr/7g?=
 =?us-ascii?Q?PY8RXd0sjWU6rRW2aERQ6fOd/2MAHpDKgLkRh/yAccXViZ3FKnhHrXWdMWmQ?=
 =?us-ascii?Q?aefj9JUTi9MzYFCKTas9fkxQR5WSY7Xs2ONjZ4HdI2DMJjJipENB3oNCksj6?=
 =?us-ascii?Q?W1bPXa0iHG8DEMuOWLXNytQM/qGgP5GiZC7mW6nnNTiHAGL86LGWDcVEylUc?=
 =?us-ascii?Q?nk+gFCh2EOwbCFOoT+mYszFlrxIdFKxHm+pXMYun90eCzvQL3uW4rA1e70ln?=
 =?us-ascii?Q?TTdBHAxGphlnrBQykiHWEk3wAYTt+b6zFnDqPOYBwcHEEjBaPqdywBqUjhLe?=
 =?us-ascii?Q?3DZhYg2fk9aCrsrzT79CAbhT6eE3cMxASVMrdsaI4IJIiHRn1zia6ogRG1HH?=
 =?us-ascii?Q?5TFZGNUB03KkQn4rx7s63J5ReZh1cf45WChdFqLrK1Dea4gG3t84x3Ao1Z7W?=
 =?us-ascii?Q?dRJrh8E6uAw2J5FvNPD3t9UBwIWm92t7/ljIpjMXTMwQbLDx5w7cLiYteBBj?=
 =?us-ascii?Q?CHtRlZMaZAR2+0jGzFTMg2aUAiJ0b+Pr4EZcNMpYtcZEK6CzZGuv/F5sbQ1j?=
 =?us-ascii?Q?OOIoIT7AmbdOujR9BPUrDt+uoopddaINu6SM1koHpjArv9AiEbuPFaH+vVyM?=
 =?us-ascii?Q?UuHhrUhxUHHKct9/KRjYRXNVHHW3cMZdQN26l9zMw0AtZQ1UODoOkVgoOd7i?=
 =?us-ascii?Q?LKSzfQhynDePtMCxpn7SZS/6rFdVIc9qiOnk7R+O7rzd45l3i/jxYdYihZu5?=
 =?us-ascii?Q?4XLoWUV/QAyAym7Ck1DNRVVjOKHylpoBB3GSVZkfLvp+UBY9fU4GFh0Auvov?=
 =?us-ascii?Q?xZYWZgfsjXDAztUs9c3bawFR4V3zZq5vQN9mZV5SUIN42jxFoF9cwQBj7qsq?=
 =?us-ascii?Q?4frA4pQeh50Dm6FEACEZ89BHKlheSZuYLyp7foqLYYW1QSCmzhC8JGYuC5oy?=
 =?us-ascii?Q?Bv+alBnl63DBn4edQTpXF5lfWhlcB5rE4LuiMSL6OPlGsrby5O/9fGQyVZjl?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 056deb9e-9f40-4204-d43e-08dbba1ea52f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 21:14:58.8172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqavpjJ++ubj3ZUpkCRbxuTdf3WfHoLtNVmk0tUhQRIAj4gSNbaVjz4xMqZt5FZ8sgTZZD2ebKu3FSNlfFDAQ61B1mrFdG6BL+LVOkTH3zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/20] uAPI Alignment - take 1 v2
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As a follow-up to this series I just noticed one other uapi thing that
doesn't make sense:

        struct drm_xe_vm_madvise {
        ...
                /*                                                                                                     
                 * Setting the preferred location will trigger a migrate of the VMA                                    
                 * backing store to new location if the backing store is already                                       
                 * allocated.                                                                                          
                 *                                                                                                     
                 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum                                           
                 * drm_xe_memory_class.                                                                                
                 */                                                                                                    
        #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS   0                                                              
        #define DRM_XE_VM_MADVISE_PREFERRED_GT          1
                /*                                                                                                     
                 * In this case lower 32 bits are mem class, upper 32 are GT.                                          
                 * Combination provides a single IOCTL plus migrate VMA to preferred                                   
                 * location.                                                                                           
                 */                                                                                                    
        #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT        2                                                      

memory-specific stuff like madvise should be operating on tiles, not
GTs.  From a quick glance at the code, it seems to be comparing the
value it gets against tile_count (which is good), but we still don't
want someone passing in a GT ID instead of a tile ID for something like
this.


Matt

On Wed, Sep 20, 2023 at 03:29:20PM -0400, Rodrigo Vivi wrote:
> v2:
> This v2 has 3 extra patches that was missing on yesterday's submission.
> But that aligns with the IGT series sent yesterday.
> 
> Also I'm glad that Mesa reacted super fast and we already have the MR
> ready that aligns with v1 sent yesterday:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300
> 
> Thank you Jose!
> 
> v1:
> As a result of the uAPI review efforts started by Thomas[1],
> we have identified many updates on our uAPI that would lead to
> breakage in the compatibility. What it is not acceptable after
> we are merged upstream. So, let's break it before it is too late,
> and start upstreaming a good, reliable and clean uapi.
> 
> Most of this work on putting these patches together for a single
> shot was led by Francois.
> 
> The IGT counter part of this series is available as well[2].
> 
> [1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
> inux.intel.com/
> [2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
> 
> Ashutosh Dixit (1):
>   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> 
> Francois Dugast (5):
>   drm/xe/uapi: Separate VM_BIND's operation and flag
>   drm/xe/vm: Remove VM_BIND_OP macro
>   drm/xe/uapi: Remove MMIO ioctl
>   drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
>   drm/xe/uapi: Add documentation for query
> 
> Matthew Brost (4):
>   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
>   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
>     implementation
>   drm/xe: Rename exec_queue_kill_compute to
>     xe_vm_remove_compute_exec_queue
>   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> 
> Mika Kuoppala (1):
>   drm/xe: Extend drm_xe_vm_bind_op
> 
> Rodrigo Vivi (6):
>   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
>   drm/xe/uapi: Document drm_xe_query_gt
>   drm/xe/uapi: Replace useless 'instance' per unique gt_id
>   drm/xe/uapi: Remove unused field of drm_xe_query_gt
>   drm/xe/uapi: Rename gts to gt_list
>   drm/xe/uapi: Crystal Reference Clock updates
> 
> Umesh Nerlige Ramappa (3):
>   drm/xe: Fix array bounds check for queries
>   drm/xe: Set the correct type for xe_to_user_engine_class
>   drm/xe: Correlate engine and cpu timestamps with better accuracy
> 
>  drivers/gpu/drm/xe/xe_device.c           |   1 -
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  99 ++-----
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
>  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c             | 102 -------
>  drivers/gpu/drm/xe/xe_pci.c              |   4 -
>  drivers/gpu/drm/xe/xe_query.c            | 186 +++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-----------
>  drivers/gpu/drm/xe/xe_vm.h               |   1 +
>  include/uapi/drm/xe_drm.h                | 322 +++++++++++++----------
>  10 files changed, 440 insertions(+), 504 deletions(-)
> 
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
