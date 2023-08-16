Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B2C27C7A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 22:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2A910E3DB;
	Wed, 16 Aug 2023 22:42:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600C10E3DB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 22:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692225732; x=1723761732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b9kFitUm1hyyvdZeRkm7t7nL2AmTjnmKvPTl0PzQFIU=;
 b=FuECh+cPP3NL4D3thC2231OvvpnzXyr6APhuUVbOelu2FpTs+HixrQKL
 v2YCbF5xaczRgar5OMIcjT6J7SPeHpCbUEG19siM0GNWNmeaWXPHc5PN4
 B0xtFT2+tf2k03tfR9aSsLpERTCI0s/0mtuIhRejBVmru1fatjBuIRWMj
 oSPdEYQjXfkljokZn+y5wFGkvlSusbSolgHhyXyc4hXMXf9xV0IKTusLb
 HPmw7KgsU40QgHvG5O/r7LtHkEJAgh+QmHCU8HXx7lcd7DxhZhMOW1CiR
 doCO2LHRZykZy/gpRnU2pwO0vadVfMtAXRfTG30WzquH5lBH1NEtDTrkX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403635842"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="403635842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 15:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857980123"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="857980123"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 15:42:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:42:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:42:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 15:42:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 15:41:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1asM6bnGnG+Db66qD4OjKlhxSnpJIWxlzWVTOud260MXPy+OPi2j2MZEeRLbWMIyNM31xwG0TtKqHTahg3P+MVph9qxLCt/AvsgpD93qM0J2xyvTI82QYBn7a8oMer5K4qFJKXPsf2sBauizEgw8bKxeInlcFn5XUhL1J3iNldvo60tdUSM1WwVM40X/Ba+dWE5lFNI+HpC55RFj6vkFRCmWbF2g0/5tM3vS5m4W0NJD3womoYGN81Lsm+hXNSZN9PxbUhXh9WeqZs3j1Z8DbFxXOAUEUkVLM4gsggtgL3ucXQ03IpSt60zEvqbP28uKr8XVA86gudfYVWOnQ6kXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SvG/ZlVnkoAKxqdMmvR2g6VNrnnt7AT/PymdJDu8BY=;
 b=gNYZzN+qYOz2a+digPVn/Hfy23KlZPduKu5xL1IyCGz7MS4QbHqbZxoin+SFUq790j6zjnwNFqJ3b5hLmU6BgjE1k6jIxv0+dObsgOx2qYS8HxGBy0x3wRbRT+JoFME4d4zAJkumV/FHztYVVjWyArih/j6g699GeoQFqZZYy/RSPQ+8HYTp5HsyLVwpi4AFKiPHplukc+9LWeEIvrj9qDoPPmfUtklkTs5GAPqOa36AQ/LS9HxrHfDsf74/MVIIg45tD41mfQOILS4YM7ZmiR5sRVfEsK0+wzpxVHxEFbqsR+eRmOJSfj/SPVx6K6N8jN1g8anN0J5m+/I2fZWXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 22:41:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 22:41:49 +0000
Date: Wed, 16 Aug 2023 15:41:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816224138.GW3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: a017c7c5-ff19-4fc2-68fe-08db9ea9fad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61u/sc23G9Nr5i3TszCO+3tb8H0XxBbtdZD7zwWhXakls7a4qu/EXGH0E4LWb6BlpNluLe2yAtD4ECbSqm0XQQp/eNVYnPW0nVYxzKi5Nao78Po2dGwxLndgNcbaPO9O7RSoLHrLoeT/41wmBbcm/aX8EHnqv2SobO+NBDda6HLzLsdFmFtQBeENbgbiy9rAmYdzRJegTX+xYwblPn04C7BPcFUjpnKIQPLC63oWdhwGIj8QuppiKNlDTmAsZgZtvgORyvnrM4AnNV6xeou0IW6MZrPgOSIxABCIC2oVaGFt1wcyVzyQ9Sezm6hq9Brv9Sc9KftZSQYo4yENZtgiwcgfv+K41VSICejKDXdPskaJe1xIJp6cn9EIT0qe0RpphjVdKCF1z7ipBEMI2K67qME3JOXkw7y3HVTgpqU66Ep/NiSHBOD4FquHwVr9HY0Db8w4bCNVJf/B4zwonAwpISa41vy3jT1ogX6V9PDnr+rDDW10lRJvc35PibfY4InYaM7TdkE9btjnnIao/Jj55LuTddiuDH4XnxdH1vu9dZYfSm9Drcc2i6O42+WQ2iEg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(6486002)(1076003)(33656002)(6512007)(5660300002)(41300700001)(6636002)(316002)(66946007)(66556008)(66476007)(8676002)(6862004)(4326008)(8936002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMmSYjmyW19KyJp7c4Hpqo9/9IKnsGpPNqrwWlyOzM9dJzeDlQrAAk8DBHN4?=
 =?us-ascii?Q?KTuKpUwYQqYV+ydduqSTQXytooAeycHtcJF3j4tUt+PWI1hfHlzIrzf5rQrh?=
 =?us-ascii?Q?ELGtziykg6mzv/aBpdcHwM1bpC1m9P2SWPEzQPyrJtOzuujqLazgZ5WQgygu?=
 =?us-ascii?Q?ivoetpsRSv+36hjzH7MLxiqkz3Gnyzm5RSXwJEpB7ppvmICTQnHL6Tg3Z3Wd?=
 =?us-ascii?Q?ZrcpohHZNpq4FTG7ka6dy55S6bUJ949F211/ftBTjC1qHMVc+RfSu4WYMd4e?=
 =?us-ascii?Q?hiGvVG2huKz6P6NgPPWoYZpkdO3KguVwS7RDpQSh8VK96FULApMIiRtiDe/d?=
 =?us-ascii?Q?DIpGP/Zb0SAr7aJuGl8EFnPlzLxcWIfaiND/YnyRXmxArgQgv58eNa/xcxnT?=
 =?us-ascii?Q?5ob7RY3N7e0Jdx1fE1V/CckagZe1vvKsMMUfSHyf6vVMM/wwx1Eo6fJv3u+J?=
 =?us-ascii?Q?IGA6ZqgzTkFbl7UDgEvCiPlP3+/mwW+qDUB887WHRz6hpd7dCP1gAW6bwYcy?=
 =?us-ascii?Q?/MrNJKUzrYoknhyNBtroJrjeIDFWB0HSWsSUCKAJKmo78wSC6ohIsVYCuwZ8?=
 =?us-ascii?Q?Va70YvyblHhnlUHRDecOF8GTgsdYENkoi0hxLz4/DYEOvk/m5NrKZs45VYZh?=
 =?us-ascii?Q?lfwqrHOVE5p4FrLGS3adfgPk0vqGOFX+RpgCxzk+2StJpvXLkfA8oSQUPPTa?=
 =?us-ascii?Q?LTY6jAb8eND0tXTFsy3HnYszg6kq7WTkFYVnNIH6sLQfWTt4mdVpA0tD8EUt?=
 =?us-ascii?Q?lEL0ZPLfRAr6yZ/K2kxyg8MoPId+6kU0R0d0FWMLfdsPCdvMWB/M72teLCDc?=
 =?us-ascii?Q?aYk6y6OptusclL1J/7TKoQF4VKY6wgRjWirq74fZJ69NxJ6y33inaU15YFHe?=
 =?us-ascii?Q?Pjip62lr3LCP3kkIUFfh0/J+1z/WDuPmme0qXUWVvzURwZab8gW3a8d/vxAK?=
 =?us-ascii?Q?yqk+AcAjWxW/HDK9M2Z8193fdVEl3P8obpZXqtlfAqR8Jk99D5KMk/S1bLIl?=
 =?us-ascii?Q?nq2UEhKKACIZaJ31g93aHIq3aX+1VRMV+RVJ4F+iqU+NkvnOnjU+W+ROdUpN?=
 =?us-ascii?Q?paoibcJ+n25lvUE3/fRamFua7udeM3Cp4XEGGu2TM8MkoNU6WU6qeesnlmYZ?=
 =?us-ascii?Q?zBveNqZZF6YbylVXDeZVMlGXzMvI6PAYcGalJ4B7jkcn9wMrIYq27AF2wPcR?=
 =?us-ascii?Q?rRIt8LuG6nq+9MmYS3vOT1QZTkz+X5yFwA+89aLjyvNGCiIiEaWjO4gEKiQE?=
 =?us-ascii?Q?BrrYhEIVNcic9CGyNzw5G5E4MvafW5H5bVfJuMdDZ4PBQp81Pkq68q4mWiAX?=
 =?us-ascii?Q?JG/vywySjDB5NXg9YvLcjYXomMb/EUpoNdyfkxoWkfANu8w6qFDp2LYzraXc?=
 =?us-ascii?Q?Q/g57MsR4WKh+qR1WquDz/X8pwHL6QwE6T0IzPEQtYxq4I1B/yrqQ7sQPwkp?=
 =?us-ascii?Q?jQTxjhtn8Sk9j7aars8TyQMOj5iDCzmp5OahZUp2/JmfTBhZAC/H63EZ+CQW?=
 =?us-ascii?Q?Z5NZ7s04mzcm0UysuG2PcdWoOfeQZeyaZEApBJS8Po883/5eHp1jvwSI5FR0?=
 =?us-ascii?Q?R7n7JL/T5XohDYEjI5ikFFc35i2DjXD2UyAAgcvXoG9RvvoO7qDUhV6QEk91?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a017c7c5-ff19-4fc2-68fe-08db9ea9fad4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 22:41:49.9177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WeTs0GFjAfxHwWrfac2JduSZPjgIqbEzfksPni1kJqEp6Zk8QM/yA4hKhI4YcgbhLb/9XC+YiObgF7cZELWdVsMZq/B/nPukZajgQN+0QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: base definitions for the GSCCS
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

On Wed, Aug 16, 2023 at 11:04:21AM -0700, Daniele Ceraolo Spurio wrote:
> The first step in introducing the GSCCS is to add all the basic defs for
> it (name, mmio base, class/instance, lrc size etc).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Everything looks good.
 - Engine instance 6 matches bspec 60421
 - Engine base matches bspec 60149
 - LRC size is just the CSFE size according to bspec 63752

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h    | 1 +
>  drivers/gpu/drm/xe/regs/xe_regs.h       | 1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c      | 3 +++
>  drivers/gpu/drm/xe/xe_guc.h             | 1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c         | 8 ++------
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 7 +++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_lrc.c             | 1 +
>  8 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c93d8f8cd93a..69c188999e73 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -379,6 +379,7 @@
>  #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
>  #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
>  #define   OTHER_GUC_INSTANCE			0
> +#define   OTHER_GSC_INSTANCE			6
>  
>  #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>  #define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ec45b1ba9db1..39d7b0740bf0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -33,6 +33,7 @@
>  #define XEHPC_BCS6_RING_BASE			0x3ea000
>  #define XEHPC_BCS7_RING_BASE			0x3ec000
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
> +#define GSCCS_RING_BASE				0x11a000
>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>  #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index bf40154ddd6f..ae5730b2175c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -195,6 +195,9 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
>  	case XE_ENGINE_CLASS_COMPUTE:
>  		sprintf(q->name, "ccs%d", instance);
>  		break;
> +	case XE_ENGINE_CLASS_OTHER:
> +		sprintf(q->name, "gsccs%d", instance);
> +		break;
>  	default:
>  		XE_WARN_ON(q->class);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index f64f22e97169..3addd8fc674a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -51,6 +51,7 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  	case XE_ENGINE_CLASS_COMPUTE:
>  		return GUC_COMPUTE_CLASS;
>  	case XE_ENGINE_CLASS_OTHER:
> +		return GUC_GSC_OTHER_CLASS;
>  	default:
>  		XE_WARN_ON(class);
>  		return -1;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 7d1244df959d..5edee24b97c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -253,9 +253,6 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  	int class;
>  
>  	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		if (class == XE_ENGINE_CLASS_OTHER)
> -			continue;
> -
>  		if (!engine_enable_mask(gt, class))
>  			continue;
>  
> @@ -350,6 +347,8 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>  		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE));
>  	info_map_write(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS],
>  		       engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE));
> +	info_map_write(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
> +		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
>  }
>  
>  static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
> @@ -638,9 +637,6 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>  		u8 guc_class;
>  
> -		if (class == XE_ENGINE_CLASS_OTHER)
> -			continue;
> -
>  		guc_class = xe_engine_class_to_guc_class(class);
>  
>  		if (!info_map_read(xe, &info_map,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b8fcc6e985cf..7ce3e740c508 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -219,6 +219,13 @@ static const struct engine_info engine_infos[] = {
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE3_RING_BASE,
>  	},
> +	[XE_HW_ENGINE_GSCCS0] = {
> +		.name = "gsccs0",
> +		.class = XE_ENGINE_CLASS_OTHER,
> +		.instance = OTHER_GSC_INSTANCE,
> +		.domain = XE_FW_GSC,
> +		.mmio_base = GSCCS_RING_BASE,
> +	},
>  };
>  
>  static void hw_engine_fini(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 97d9ba31b5fc..cd4bc1412a3f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -53,6 +53,8 @@ enum xe_hw_engine_id {
>  	XE_HW_ENGINE_CCS2,
>  	XE_HW_ENGINE_CCS3,
>  #define XE_HW_ENGINE_CCS_MASK	GENMASK_ULL(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
> +	XE_HW_ENGINE_GSCCS0,
> +#define XE_HW_ENGINE_GSCCS_MASK	GENMASK_ULL(XE_HW_ENGINE_GSCCS0, XE_HW_ENGINE_GSCCS0)
>  	XE_NUM_HW_ENGINES,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 09db8da261a3..7a7fdcdadf37 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -46,6 +46,7 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
>  	case XE_ENGINE_CLASS_COPY:
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +	case XE_ENGINE_CLASS_OTHER:
>  		return 2 * SZ_4K;
>  	}
>  }
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
