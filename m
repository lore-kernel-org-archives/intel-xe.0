Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F395C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 13:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923410E41E;
	Wed, 17 May 2023 13:21:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B3910E41E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684329688; x=1715865688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mhxRhtiaWqKNamF5xbv5JoGE2PAL2nEfcH336qdtXkg=;
 b=BxwxExDY1YSQRcmID+LrElC+/sxCT+YyTPHIkeumdCC4Qc+zzVhwbgHf
 2KjXMooxEm/XXtc/uhb41aJRVKiFPko64itJVAEspVWnEs517zec7gKlH
 teFYVOYx5UaHMUHR0wZ59NcYKrln0koAtfZwAAIfpJzVIrokuZGLp9s0d
 YvCf1nOajF6FjKuCkZIt7ggxQOihZE3+lyR0+zO1FgIyUoCnkQR2kOXNG
 Q02VffDnc7wWWcsc0+8zBxmJWF+1Z4hQ9DEnS2gFOfs4Y4OeKbuTJcU7s
 MSN6TcpDrtjgk3r8/A/OKrQ0x/B3c8oYXvCxH26VML+BoMXafso6DA/C1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="331369732"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="331369732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 06:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="679265164"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="679265164"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 17 May 2023 06:21:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 06:21:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 06:21:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 06:21:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 06:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFDdgqiN8dvs8dW51UZf3W1oR1pV4RDVwxb5iWxL0/jWPazG5gph57aYXhWG1lEHjaSJ2k6JHlYqnYO3BC69rIVHCJJDdfAgL7dEEut0zJnWkC0fuqvupY1eT/uOOlQOPRsVviMAa/cNRpv1sKEZKeemzNA4iu/Oc6iwwG0oxEtGf/K68TMq11USJ+OV/clubwMWjOa8tvzgz3FC5kLKsTilLJ9z5vTiihgTFpMt1wG5uyWBkxX0zmWPw66oddnaWByvCdBdhheFWuZl0xWibkH+9ocz739wNy31SVjHNx30n764RS4hdNFIfFE4BoaB2aXNWNeB7hBumjL8eKhDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRSY5J1Zc9FLOWCLtt1GK63l9tcso6WLADUYKid5ywQ=;
 b=PG5ipIr6ev+4rkwCC47lMli8T7SBzPu/kYNVdCGbdq8aqxqA4nnuUhdSNdIfbtEkjw75j9NQqL1QXO7Ig3j17V0a7D0cJL9tXcctz8eWXymjLT0nwaJPfvS9+jLW0Vv6lZ1ES0U89F6+wlL7a7DIk1Ss8Pxh5K3pJIs4TDZIzZou++pKpVQMQuPDM2mEQQ99j78Iii4pH4LonEUYz3q+9omMo2GS6UEWSnnw2Lrq58f9plBY33nI3jn8yN1Qay+mzhC1C1QmP2GpX8Vk3rryV9PPjjK4dAjfJzCiA5XxJJEjhXPVW21xXAIh40ZhdDVQ1rhqtPqRjuxaF6a4/9/HQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Wed, 17 May 2023 13:21:23 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 13:21:23 +0000
Date: Wed, 17 May 2023 15:21:15 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230517132115.GA130496@kav-xto-001.ka.intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: ab88b8bf-466d-4141-4ec4-08db56d99c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYluMd7B7dQ7Zw2W0Pdi9C6rFVvV7GBo02TSCshI4P8gQ9WoOHxEHKa7AXKInopdG7djTnkjVJ1oM7RDz/2gcLb15qytSkOl7QQA1R3tKv2UcMsqtnCE93y1wKd5GEokrVDtCShDggMOKl7SHBKhjrkif0HbouiNAqrpAdpTzvgJFjSDMYeHpcUMw3n+b41Oz7LB/68EVchu5snYXtiLlwZx4163BO/ix2MEWh2XIRBMnaiy5vCbkZabFvnA+5QKq1VMhgC+H28jz/30h9Ly+KUsb2Puo6r63cyFKGyyKK8MOuj12C8d3DfMCc7sN5cUlPNUlJJ5rwMZ0BS2awb/aTOBuHEx+wbZhYJv30owrVIdEmaxAHTk4TH2EWesSg/asBaCxu35wczvM+uKKbfA+97NeY02VB8jYI0m3+VDTEht25dMEILEq8soM+nRUp85oSuIO7pLn3Cc4UlHbKbgFNFZSHYbcVxhesSaY/T5pN5TaGExJw5ZTD4gLfRISUq6pYeZSQ0fa9/PN2D3zYAPetd+2UBhktpqfAk/PZSROPRpl5AEMHXKcN48bG1rQMSh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(6862004)(5660300002)(8676002)(8936002)(44832011)(54906003)(83380400001)(66574015)(6506007)(1076003)(26005)(6512007)(82960400001)(38100700002)(186003)(41300700001)(478600001)(6486002)(36916002)(6666004)(33656002)(66476007)(86362001)(66556008)(66946007)(6636002)(4326008)(316002)(30864003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZeAVTMqjd690LovEgCXrYPXNmq2hyC+qJsmLBO87Z5wHpioNH9thNW9W3V?=
 =?iso-8859-1?Q?vKazVFxNFye6Mw4gzQSCN2wsy0UlkvX8LRxDrCQgfBJ5XRS5EY+6UdEpZx?=
 =?iso-8859-1?Q?Gw3U/5vhxXLZVxTFU6zOAb+eYrnA9Xf2V/j0DGKYMvwB+nzuyVIyl0go2L?=
 =?iso-8859-1?Q?tzxcI4C4LP/CJgZxYUTUehB6JAoPCHuFrCuDxleGwZnZrV3lOigl7fOmqr?=
 =?iso-8859-1?Q?YHt1Tka0fLMKBBYBLaHYNlZl8i6P2YVlC6N1xyP9DIN9JVVUPblgk47o/4?=
 =?iso-8859-1?Q?wbetnJB2sXIvMIANeRSLNGONc/bgaPP/bN/aPbjiCpL6mgAOdreTvX/IB1?=
 =?iso-8859-1?Q?r3nXSi0QuXpdfl1Cu4p4HAagWcAfxz6gG+uX8wDmeaLNKi6ueRcw56z1lC?=
 =?iso-8859-1?Q?+OZpZ1PgS205sK6cLt7Q6R5A5A2zbDalIMG+XMQ1coQJ7Pz9JGvOrcGjHo?=
 =?iso-8859-1?Q?v3msRyn1pXinTV3QsEMtKWyRfeLChvk5Zd2hmxJ1tZq33IURA35UVKugjj?=
 =?iso-8859-1?Q?DriHfDzaPq0mE7xOWVhHuC0TVvw2bqEt1PoBhor8p3gxaVAQBq+98Y4cUN?=
 =?iso-8859-1?Q?ry+IhXeyxqlBxAsJpm1zg1EStA7cSRd8+xOhHlTNf6lQdvbRKB0WA/pHQO?=
 =?iso-8859-1?Q?rWI1hadZVW9u6ieZHV7PzECnFgZ7pCu8Hv3OQ3TzM+LfxsnLRbtZuurtNj?=
 =?iso-8859-1?Q?wCZCjMAfXu5YfNvFO9CWisLrX7GfQ+dQAiZc45WxEEWWg7uqJgLzrLGlbH?=
 =?iso-8859-1?Q?Lee4U/waVWad4CQjtvNK9ziS/EdrGTHXFwXBQXeNJOmfP9j8wqb1uDmbMN?=
 =?iso-8859-1?Q?WGJKkY15Leq0B0XpQcTYRN2jaaj4HHZJJFHYagWkiZNdF3XAN8kEx7F57I?=
 =?iso-8859-1?Q?letIItctRhzT1pHB8pZBSHwPbath8prMu+0qLq88SDI78tpJkspzxCYG8F?=
 =?iso-8859-1?Q?sFlLX5ZoMAMBR4FxopWL946mdC0vpfguLP1aVQ1/sCBPw5uwelyIeuPHGo?=
 =?iso-8859-1?Q?Cj4vMGpPfmVffLQrKfrvjF5h+IoUfLjWXKOOeNk1cuKhMhd1q374zy1XOE?=
 =?iso-8859-1?Q?I8q30g3Ob2LLIAK45mrUd3XOPc0whrus357FLPsQnNoVzAImV884o82GQv?=
 =?iso-8859-1?Q?jwMzjRi6ltw34VE+5h9wAwsXcI8BeaoPvQHoDvq9xAfbefdP1Ojab1Zbyy?=
 =?iso-8859-1?Q?ue9yG3k4BlQfc/FIjFvieOO3nRq2BSkiv3YNUA7Mo1eMLwkdfmuIE5Odb9?=
 =?iso-8859-1?Q?wIBADNib17AJbS+g1oWfBpft3dA6kVllcHGqPjc8CD+yMv4wRpWe9cl/KL?=
 =?iso-8859-1?Q?4gJI0Tqz3YP2ZhrDCzJP49w/nKHh8DicovFeP1eX9AVZ34+hCNyLjofOQo?=
 =?iso-8859-1?Q?AHZtxmNfwoBWg1Ii3LMO68iGoXnKT4qwpbsuJeEEw0ZZpLUTjrrVWZEIL9?=
 =?iso-8859-1?Q?ertO7ESwIQryNGksPkuXAJESpF/TuUoEUQvC0d4+LV8+DBCgnZTt1UqDfo?=
 =?iso-8859-1?Q?/coXoWmDr1iNUs1JNjs4xgbqE3B1fOidRQjzSPAu1fQ0kTVzSelbxfTISm?=
 =?iso-8859-1?Q?H6DZKCtWeRlLuLJtglLvAf8AtIgJPLI1QP8Si0Mxh3x8yK/1xBXHKWvLpA?=
 =?iso-8859-1?Q?+DcN4ybWelldomoTck9GEvi3Ml00q05eiewq/4eAjG1y0oNPqCd6x6AA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab88b8bf-466d-4141-4ec4-08db56d99c44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 13:21:23.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQVGdyeQpvx6s4JEFFfw3oWUwEja0UCRmjPwgYuEkXniDVcJDFltuVt+eG0TeG164Xd1jMXlhlMTOixmOBC4PjzSvELP31lhLOLVb2K+9go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: intel-xe@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 10:54:06AM -0400, Rodrigo Vivi wrote:
> The goal is to use devcoredump infrastructure to report error states
> captured at the crash time.
> 
> The error state will contain useful information for GPU hang debug, such
> as INSTDONE registers and the current buffers getting executed, as well
> as any other information that helps user space and allow later replays of
> the error.
> 
> The proposal here is to avoid a Xe only error_state like i915 and use
> a standard dev_coredump infrastructure to expose the error state.
> 
> For our own case, the data is only useful if it is a snapshot of the
> time when the GPU crash has happened, since we reset the GPU immediately
> after and the registers might have changed. So the proposal here is to
> have an internal snapshot to be printed out later.
> 
> Also, usually a subsequent GPU hang can be only a cause of the initial
> one. So we only save the 'first' hang. The dev_coredump has a delayed
> work queue where it remove the coredump and free all the data within a
> few moments of the error. When that happens we also reset our capture
> state and allow further snapshots.
> 
> Right now this infra only print out the time of the hang. More information
> will be migrated here on subsequent work. Also, in order to organize the
> dump better, the goal is to propose dev_coredump changes itself to allow
> multiple files and different controls. But for now we start Xe usage of
> it without any dependency on dev_coredump core changes.
> 
> v2: Add dma_fence annotation for capture that might happen during long
>     running. (Thomas and Matt)
>     Use xe->drm.primary->index on drm_info msg. (Jani)
> v3: checkpatch fixes
> v4: Fix building and locking issues found by Francois.
>     Actually let's kill all of the locking in here. gt_reset serialization
>     already guarantee that there will be only one capture at the same time.
>     Also, the devcoredump has its own locking to protect the free and reads
>     and drivers don't need to duplicate it.
>     Besides this, the dma_fence locking was pushed to a following patch
>     since it is not needed in this one.
>     Fix a use after free identified by KASAN: Do not stash the faulty_engine
>     since that will be freed somewhere else.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v3
> ---
>  drivers/gpu/drm/xe/Kconfig                |   1 +
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 128 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h       |  20 ++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  45 ++++++++
>  drivers/gpu/drm/xe/xe_device_types.h      |   4 +
>  drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
>  7 files changed, 201 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f6f3b491d162..d44794f99338 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -35,6 +35,7 @@ config DRM_XE
>  	select DRM_TTM_HELPER
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
> +	select WANT_DEV_COREDUMP
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b6c41cd7dbe3..678c9d84e50e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
>  	xe_debugfs.o \
> +	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_dma_buf.o \
>  	xe_engine.o \
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> new file mode 100644
> index 000000000000..56cda4bf35d8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_devcoredump.h"
> +#include "xe_devcoredump_types.h"
> +
> +#include <linux/devcoredump.h>
> +#include <generated/utsrelease.h>
> +
> +#include "xe_engine.h"
> +#include "xe_gt.h"
> +
> +/**
> + * DOC: Xe device coredump
> + *
> + * Devices overview:
> + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> + * standardized way.
> + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> + * which is linked with our card device directly.
> + * The core dump can be accessed either from
> + * /sys/class/drm/card<n>/device/devcoredump/ or from
> + * /sys/class/devcoredump/devcd<m> where
> + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> + * /sys/class/drm/card<n>/device/.
> + *
> + * Snapshot at hang:
> + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> + * time. For this reason, we need to take snapshots from when the hang has
> + * happened, and not only when the user is reading the file. Otherwise the
> + * information is outdated since the resets might have happened in between.
> + *
> + * 'First' failure snapshot:
> + * In general, the first hang is the most critical one since the following hangs
> + * can be a consequence of the initial hang. For this reason we only take the
> + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> + * at least while the coredump device is alive. Dev_coredump has a delayed work
> + * queue that will eventually delete the device and free all the dump
> + * information.
> + */
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +
> +static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
> +{
> +	return container_of(coredump, struct xe_device, devcoredump);
> +}
> +
> +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> +				   size_t count, void *data, size_t datalen)
> +{
> +	struct xe_devcoredump *coredump = data;
> +	struct xe_devcoredump_snapshot *ss;
> +	struct drm_printer p;
> +	struct drm_print_iterator iter;
> +	struct timespec64 ts;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	ss = &coredump->snapshot;
> +	p = drm_coredump_printer(&iter);
> +
> +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +
> +	ts = ktime_to_timespec64(ss->snapshot_time);
> +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ss->boot_time);
> +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);

Wondering if the terms are not mixed up: here "Uptime:" shows the time at
boot while "Boot time:" shows ktime_get_boottime, which is used as uptime
for example under /proc/uptime.

> +
> +	return count - iter.remain;
> +}
> +
> +static void xe_devcoredump_free(void *data)
> +{
> +	struct xe_devcoredump *coredump = data;
> +
> +	coredump->captured = false;
> +	drm_info(&coredump_to_xe(coredump)->drm,
> +		 "Xe device coredump has been deleted.\n");
> +}
> +
> +static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> +				 struct xe_engine *e)
> +{
> +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> +
> +	ss->snapshot_time = ktime_get_real();
> +	ss->boot_time = ktime_get_boottime();
> +}
> +
> +/**
> + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> + * @e: The faulty xe_engine, where the issue was detected.
> + *
> + * This function should be called at the crash time within the serialized
> + * gt_reset. It is skipped if we still have the core dump device available
> + * with the information of the 'first' snapshot.
> + */
> +void xe_devcoredump(struct xe_engine *e)
> +{
> +	struct xe_device *xe = gt_to_xe(e->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +
> +	if (coredump->captured) {
> +		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> +		return;
> +	}
> +
> +	coredump->captured = true;
> +	devcoredump_snapshot(coredump, e);
> +
> +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> +	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> +		 xe->drm.primary->index);
> +
> +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> +		      xe_devcoredump_read, xe_devcoredump_free);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> new file mode 100644
> index 000000000000..854882129227
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_H_
> +#define _XE_DEVCOREDUMP_H_
> +
> +struct xe_device;
> +struct xe_engine;
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +void xe_devcoredump(struct xe_engine *e);
> +#else
> +static inline void xe_devcoredump(struct xe_engine *e)
> +{
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> new file mode 100644
> index 000000000000..52bd27ca1036
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> +#define _XE_DEVCOREDUMP_TYPES_H_
> +
> +#include <linux/ktime.h>
> +#include <linux/mutex.h>
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_devcoredump_snapshot - Crash snapshot
> + *
> + * This struct contains all the useful information quickly captured at the time
> + * of the crash. So, any subsequent reads of the coredump points to a data that
> + * shows the state of the GPU of when the issue has happened.
> + */
> +struct xe_devcoredump_snapshot {
> +	/** @snapshot_time:  Time of this capture. */
> +	ktime_t snapshot_time;
> +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> +	ktime_t boot_time;
> +};
> +
> +/**
> + * struct xe_devcoredump - Xe devcoredump main structure
> + *
> + * This struct represents the live and active dev_coredump node.
> + * It is created/populated at the time of a crash/error. Then it
> + * is read later when user access the device coredump data file
> + * for reading the information.
> + */
> +struct xe_devcoredump {
> +	/** @xe: Xe device. */
> +	struct xe_device *xe;
> +	/** @captured: The snapshot of the first hang has already been taken. */
> +	bool captured;
> +	/** @snapshot: Snapshot is captured at time of the first crash */
> +	struct xe_devcoredump_snapshot snapshot;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..197ee4090fed 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/ttm/ttm_device.h>
>  
> +#include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> @@ -55,6 +56,9 @@ struct xe_device {
>  	/** @drm: drm device */
>  	struct drm_device drm;
>  
> +	/** @devcoredump: device coredump */
> +	struct xe_devcoredump devcoredump;
> +

Do we need this if CONFIG_DEV_COREDUMP is disabled?

Other than that this LGTM.

Francois

>  	/** @info: device info */
>  	struct intel_device_info {
>  		/** @graphics_name: graphics IP name */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..231fb4145297 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_lrc_layout.h"
> +#include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>  		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
>  		simple_error_capture(e);
> +		xe_devcoredump(e);
>  	} else {
>  		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> -- 
> 2.39.2
> 
