Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6523BC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 13:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30710E5E0;
	Tue, 28 May 2024 13:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJardq5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3A10E5E0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716903939; x=1748439939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wUh1ToMaN/JLwB8uLFe4k9BaJNTof0ioEQg3m4F16mg=;
 b=jJardq5OL0ObvVB5kopgFr5Rt4Cdi9ravRsa77QeJ0AUpyioRZddFdju
 rOrcdB3YAGPnxsPedzdD81zK95XsuhH6M6LK0A+Xw2aNc1a1Qgh+fIbou
 lWot5SmCRNtGaCdQ/3dqdwEV4BRYHzAD0Zx2AmdqCg7UgIP3n0OdZng/A
 E4bfMUQw87JeXKqDsGqe1Wo60/1XMUd57fy7yENk0jeL/5mTXiNAH2ZtO
 AXfCh0yrnK3NpSsLi1T7lsgOtn023b4eWYfbjM7u8Tyu8z17SK8qA3Lrw
 VerjuCElH6Fiz+txtM/DlVkOqRweANemMu4lmOiCCEwTQkeCyHWHKKfmr w==;
X-CSE-ConnectionGUID: jQO+6TggRzWhUEWVKonFPQ==
X-CSE-MsgGUID: 2L1md3XlT5mN5d/5e2jFNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24661433"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="24661433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 06:45:39 -0700
X-CSE-ConnectionGUID: lmpBViMwS/mYO1toSWczDQ==
X-CSE-MsgGUID: s78rO5f6QQKV8GdxCvsgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39489827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 06:45:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 06:45:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 06:45:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 06:45:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 06:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWYWwBjFxP8nfyorjCnUGknuyPmprbA7Dvh1Y2op7KRhiQjdABSSdS0noTTNret2/HB8+HfwM1l884/i3JZl8Cuxz7iwZNJd1bqCTE5KhFMQIjaPmhGgAKVdJYM9QjRre6CulGoVfmRUJM8IE40CXLYG4WvPjDXTWRbomn19BEF0FBKITO8joJCN67bx7IAp3EvYOHCxzBF4FWpdxsbgXV+OvDUEfjy75awfV+NIUqyUOFn+G67fBQqKbj9SY6GMNap44JpA2Zajfj2pnyIyWHWVMhLAPc5W6W3vbENaYwSt7SAcG9+lw/ppKx6+zmgdTYmARcFvOnTxEkvl4tgExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rW3JorlTGugcKu1NIHLrtt0nJkj5dxy6NumP6YYWwSg=;
 b=Wy2IfA7rQ2/gbwmxOOFvtVV+MstL2uT09vPZOcc9h90VeyDqqm/QRkMuliIav/b9XR4pPyGTrLTf/0s5zJ5ybNJMPYDMvCBWDGIpSdQhHt0uPCCi/XUHI8FMM6LMRW0IA4655BCesVJYNzYskVQytbh1QS7OoozySG6ZR5/IJtSjoFJoEkXAElHhgVXUqpAIl81l35w9YbTLCrjM4LxavxyoXQ9cQgrplhEbjfQhWLAV43NhL5qZTy525JF3X2/aFg01U4BPiWk//PDbM1rkdd+4+szQx2ouFoxpMJfFf6uEAH/b5rQiWI6tetcZQJCcaDsCf0NmkF9WVmEd4Pj1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 13:45:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 13:45:33 +0000
Date: Tue, 28 May 2024 08:45:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: Re: [CI 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <u5bsgsjzqzvm2cqorgl7uggaiyagpjzwhxv6vl6pmpolgbbivo@nh52juk6ql3f>
References: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
 <20240527211928.1179357-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240527211928.1179357-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 797d229a-f59e-4039-0c71-08dc7f1c7264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jCaeyp1oX6SddlUV0LP1MdyWxemlmld6X2g2kbtZsAFVParP7CFwXML9GjLs?=
 =?us-ascii?Q?EaFmMG8M+m5Rbq/eL6C6jp+rVw+9tBsa8f1y5qZbHb0Yay2z8DvD16WzYaLd?=
 =?us-ascii?Q?QOfK2Dd6g2+MleNKriJ1XP0Pl6sWdH4jhpgksrJocC3pkmOO/1Nww1vDR+Xn?=
 =?us-ascii?Q?peBpF/OZT/XxURUSLcxsGQFDsp9Mu0eaJtQlTniTpAgVLoBYmW0MR1ci47kr?=
 =?us-ascii?Q?qdPUE5ncv/XDcaZmlc9UmDJsZ+FINYduExL0baA+5ncH/NGfeOE0V79iG3AC?=
 =?us-ascii?Q?aJon2NkyvpmkGOGwANS9znnjCDGTk51ETL9rGbW7fcfg5fI7ikfOfATPhY5t?=
 =?us-ascii?Q?oJYSJaiNMdNCZBFC3OCmk7Q9QgLOryL51ebrB5CNFdAJQs2YqGv3SWRi/9Ay?=
 =?us-ascii?Q?WjhzD8ChPLZjGh8uGcp/ns1DYTXmqxgkfi0seE8gcwaIjypW8UlIue+T4uMr?=
 =?us-ascii?Q?HIU7qAcFLmUDApbYY8QMjC7nP5O6u6Z1bevZ5gadOarNJR/yyqDSOZtBEY8T?=
 =?us-ascii?Q?DDTBiSm66t4RJg0XEpkRXy6DF4H7Bljxd9tA8S9dt9b1MqOVrPCo+vc1mVAH?=
 =?us-ascii?Q?Hvr4fCsDKRsj0YD/XCNfPBnqfpeOFtVM8CN5eB+an7i//RCZKeXpJFoFtqzh?=
 =?us-ascii?Q?dC/7d7j9FI3utnl7EnUiPZJO+OUu/mGk9PBZTYHvwaavVtALLjynz8zmiFuC?=
 =?us-ascii?Q?H60rr4fTvlV5aA9FS60GpnmdbOyIt6ChHQAYqeGLfA3GJ6oHKlK8IdCp3TCc?=
 =?us-ascii?Q?e1DnOJydry5aNvep0sf6s7oOJN9ycmYXBXNrSIjYEx3qwEBeEcha5VHAr4hK?=
 =?us-ascii?Q?L3weid3S3GTnmrB8RL/qWMYUf2FKBMqrMWu8xonbXjeFKFbZAle3oyA/j6og?=
 =?us-ascii?Q?8FI3bFSHfDl804/20nap8wF3gdGV9NUtjB0OnY4nYiP509+WkhZlymz/7WRv?=
 =?us-ascii?Q?vmAt1lUgDytYyUncOoonNxxSfeOF/ViLXeNKEEHuHOz53y2qbFkt8mPrZiVQ?=
 =?us-ascii?Q?m8/mWBvhxoS+vdblJ6ol3HeDdyr0AeQRQdQLMQV9nnW0MPl0tbSJ4NFpyx9S?=
 =?us-ascii?Q?Pvwy/YjlXU6Td0SCLjjGT/HoIXwBr93DfC8RHRfcYH6eQVvmwwf/FBxryejt?=
 =?us-ascii?Q?AKoz+DfF+OC9Hwesh7WNYwN9sccZfDnANFQXxFSCrB1RgbLYouk5Ln3SCbLd?=
 =?us-ascii?Q?wRz1/CknaEINtPqoKSkFTwcGClALUOwJ2+BCAXCT/XCiL1bmRaexfeF3i3mR?=
 =?us-ascii?Q?wMxCSEKQBrWHoZPAI0MjvP9pR6/tqvCabhpWN5IWpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M5IadoqBihXeW0nI4nlv14/FkhS5TBwgSbCk+2ZluglXywmxIUjf7532Xu7y?=
 =?us-ascii?Q?Dfmg32z5xqNjuuXLQHsv5yqoo4H6PPFZhXFfOsvtoJPC71NAR48KdDUdguOf?=
 =?us-ascii?Q?rBjQ+lQmom1+sYelGAd54ZLPESzjxBx1KLsE0rhJWgbRWHsY0zF4TJ9GzosD?=
 =?us-ascii?Q?Og1f6UWybtk1+77RQxwedP5xEdXmJyD6DT3v7oUgI/bIySeX+NBU8t4yYmmu?=
 =?us-ascii?Q?YQc+FWMYKTcspbRYSQ8Jgf+I5G/8NAv4eU9j7yrdN7xCUf1J50h+HEpLB4En?=
 =?us-ascii?Q?NsZwnrKmL041VDIzWXosdEjPcL7NOWpO1p4Z5FYTQKnOgNj42gsj4lNaZFry?=
 =?us-ascii?Q?Yjr4VIEqPNYJjPDvShqqyCdz2A4VRVKMTsWFU7lAFWoyhhJSLL+yga+pdHs2?=
 =?us-ascii?Q?H7Mz1w1sMkSJPhgx7NGmX+I2xtYVSB7Mwet8w0SBoxsV6r5JD4xHsV+rKIos?=
 =?us-ascii?Q?uZIFDWGaajpifr5FsKIzeMI923rUXYdnoeNzvmyoyV3B4lRLj70TB5dm9rU1?=
 =?us-ascii?Q?L9SPyQMsb9LzrhJXfrT6bCDXjxAYIY8uO9XaNpwxJMXtW+ozkMR4hMq5lNtz?=
 =?us-ascii?Q?ALXTQPwIK1nUT/ANbwO8MK+jpQR50XM1c27kpyF0Rc2UYtvIcmNY0DnLuZJH?=
 =?us-ascii?Q?8mmyojRCxoTa4+A1CSFMcjaxSOFz9Aha/qH7o8KcKnCa2QDmAF06duQ+87dA?=
 =?us-ascii?Q?vcnNU9OR/XI2ur+hsHqvCCIzVrr3G0jQ623f1Opw8JAzPu7JZmwFbjbxo0L1?=
 =?us-ascii?Q?Z+5mFf+8nKDBxgsvScglImoRpndkC6p2iCt5Qydi7MX9yjK0gov2JGFaxRpY?=
 =?us-ascii?Q?uJ93iizPswNmSNFzWqtRY1Oc/KfnwjapxjCTU4BUeSe/2VC0FGbt5+het3vN?=
 =?us-ascii?Q?Twv47gTqcNQN+d1qhzowapmFyzeysnOtSZOIx8Tk0AWJg9L9yAhlBiw+Mw5F?=
 =?us-ascii?Q?2fIc/rTGThPe9zGv/1ERpOTXBrG1drBUkwTwF/MM/oL7sod0eo/JzQzxD8Vd?=
 =?us-ascii?Q?eEPX8AcBOa6PWyDrK0BArrwX7fiGEOoGATTgFOQooqlE8gJSV7EoJuXcR4l/?=
 =?us-ascii?Q?iL1BMHZEceJSUZPn0pJyYveK8HSVb5tsfvxzCOqk+hOZtUpk6zZBb0Zyzq5+?=
 =?us-ascii?Q?9GlwlefxNA0Dl1Cv/PMTKXOgD/dRPTuQelo3CdJtfT1qmBSzVAB5LbuZO4Eo?=
 =?us-ascii?Q?WoX+ZcbUxTiw/Hg53xiLv9HzeA6anCxd0MTg4ctsvC3vMHNJA2wRK/6AcjZv?=
 =?us-ascii?Q?AfqZiyPbu87m+xIaQ6i9JBDnT6lWemEah8UGSQRzmdD7xPn1PJY5bg2dW/FN?=
 =?us-ascii?Q?FtFGX0XTpsLagjkNqrcJlRf6AQ5Je6uWZllaJCmfenYybbT9aAJAR85XEVTE?=
 =?us-ascii?Q?7UeXkQEjPQOc68xjJmApFZ2+iLuPGVMih3J3wJ1PuCKUpVYbyvG8DAVABXGZ?=
 =?us-ascii?Q?7/qQfiuZd6q/py7U3+12a20md9TfN6aeqp/RH8g6o2fDAVG8JrTUuczSGBuO?=
 =?us-ascii?Q?ha/6TvjtY0P4PGeiEfViWQWQQHIgF0CE1dXRS5L7mTusnEo9POZL02KhgbzH?=
 =?us-ascii?Q?+LwJbL2diU9V4xdJNQJIDH43psnT1R9y75KxTch4LOumXe/u6oI52GtDfrvA?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 797d229a-f59e-4039-0c71-08dc7f1c7264
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 13:45:33.7445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqXFasnz/HmiVlz6J7EYAlEncoRwq7BkloiSKH4JfX3Jd7WKbCLZc/CBc1+0NIgyMkyn5o8NvzPMdZd7V76egbRrkEK09Xb4Qs9lH4QDw10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

On Mon, May 27, 2024 at 02:19:27PM GMT, Daniele Ceraolo Spurio wrote:
>From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>This WA requires us to limit media GT frequency requests to a certain
>cap value during driver load as well as after driver unload. Freq limits
>are restored after driver load completes, so perf will not be
>affected during normal operations.
>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/Makefile        |  2 ++
> drivers/gpu/drm/xe/xe_device.c     |  8 ++++++++
> drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
> drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> 6 files changed, 50 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index d5b137e762ed..3701d1a01e50 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -47,9 +47,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> 	$(call cmd,wa_oob)
>
> uses_generated_oob := \
>+	$(obj)/xe_device.o \
> 	$(obj)/xe_gsc.o \
> 	$(obj)/xe_guc.o \
> 	$(obj)/xe_guc_ads.o \
>+	$(obj)/xe_guc_pc.o \
> 	$(obj)/xe_migrate.o \
> 	$(obj)/xe_ring_ops.o \
> 	$(obj)/xe_vm.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index f04b11e45c2d..85c1b0c406a6 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -16,6 +16,7 @@
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>+#include <generated/xe_wa_oob.h>
>
> #include "display/xe_display.h"
> #include "instructions/xe_gpu_commands.h"
>@@ -37,6 +38,7 @@
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_vf.h"
> #include "xe_guc.h"
>+#include "xe_guc_pc.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
> #include "xe_memirq.h"
>@@ -51,6 +53,7 @@
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
> #include "xe_vm.h"
>+#include "xe_wa.h"
> #include "xe_wait_user_fence.h"
>
> static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>@@ -337,6 +340,7 @@ static void xe_driver_flr(struct xe_device *xe)
> {
> 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	int ret;
>
> 	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>@@ -344,6 +348,10 @@ static void xe_driver_flr(struct xe_device *xe)
> 		return;
> 	}
>
>+	/* Set requested freq to mert_freq_cap before FLR */
>+	if (XE_WA(gt, 22019338487))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));

it seems pc_set_cur_freq() is violating a layer here. At the minimum it
should have the xe_guc_pc prefix, but it seems we actually want a higher
level call here like  xe_guc_pc_prepare_for_flr(pc). Then the WA is
handled internally to xe_guc_pc.

>+
> 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 80a61934decc..4369e3ff19cf 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -22,6 +22,7 @@
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
>+#include "xe_guc_pc.h"
> #include "xe_huc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>@@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
> 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> 	struct xe_gt *gt = gsc_to_gt(gsc);
> 	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	u32 actions;
> 	int ret;
>
>@@ -370,6 +372,12 @@ static void gsc_work(struct work_struct *work)
> 	if (actions & GSC_ACTION_SW_PROXY)
> 		xe_gsc_proxy_request_handler(gsc);
>
>+	/* Revert the min/max freq limits as we're done with GSC/driver load */

same thing... do we need a higher level call here rather than calling
the set max/min freq?

>+	if (XE_WA(gt, 22019338487)) {
>+		xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>+		xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>+	}
>+
> out:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> 	xe_pm_runtime_put(xe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 8187dfb2ad6c..3ecfbaa75495 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -8,6 +8,7 @@
> #include <linux/delay.h>
>
> #include <drm/drm_managed.h>
>+#include <generated/xe_wa_oob.h>
>
> #include "abi/guc_actions_abi.h"
> #include "abi/guc_actions_slpc_abi.h"
>@@ -24,6 +25,7 @@
> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_pcode.h"
>+#include "xe_wa.h"
>
> #define MCHBAR_MIRROR_BASE_SNB	0x140000
>
>@@ -41,6 +43,8 @@
> #define GT_FREQUENCY_MULTIPLIER	50
> #define GT_FREQUENCY_SCALER	3
>
>+#define LNL_MERT_FREQ_CAP	800
>+
> /**
>  * DOC: GuC Power Conservation (PC)
>  *
>@@ -238,7 +242,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
> 	xe_mmio_write32(gt, RP_CONTROL, state);
> }
>
>-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> {
> 	struct xe_gt *gt = pc_to_gt(pc);
> 	u32 rpnswreq;
>@@ -674,6 +678,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
> 		tgl_init_fused_rp_values(pc);
> }
>
>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>+{
>+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>+		return LNL_MERT_FREQ_CAP;
>+	else
>+		return 0;
>+}
>+
> /**
>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>  * frequency to allow faster GuC load times
>@@ -685,7 +697,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> 	pc_init_fused_rp_values(pc);
>-	pc_set_cur_freq(pc, pc->rp0_freq);
>+
>+	if (XE_WA(gt, 22019338487))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
>+	else
>+		pc_set_cur_freq(pc, pc->rp0_freq);
> }
>
> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>@@ -716,6 +732,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> 	if (pc_get_min_freq(pc) > pc->rp0_freq)
> 		ret = pc_set_min_freq(pc, pc->rp0_freq);
>
>+	if (!ret && XE_WA(pc_to_gt(pc), 22019338487)) {
>+		/*
>+		 * Setting min to RPn disables use of efficient freq
>+		 * which could otherwise interfere with this WA for media GT.
>+		 * We will also bind max to MERT_FREQ_CAP until driver loads.
>+		 */
>+		ret = pc_set_min_freq(pc, pc->rpn_freq);
>+		if (!ret)
>+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
>+	}
>+
> out:
> 	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index 532cac985a6d..4abdefa36b9a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -29,5 +29,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);

        ^

See the other functions in this header. We don't export functions to
the other parts in the driver without a prefix for this component.

Lucas De Marchi

>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>
> #endif /* _XE_GUC_PC_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 12fe88796a49..a6b897030fde 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -27,3 +27,4 @@
> 16022287689	GRAPHICS_VERSION(2001)
> 		GRAPHICS_VERSION(2004)
> 13011645652	GRAPHICS_VERSION(2004)
>+22019338487	MEDIA_VERSION(2000)
>-- 
>2.43.0
>
