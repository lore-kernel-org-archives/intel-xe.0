Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4296C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 16:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF8B10E0BE;
	Tue, 21 Jan 2025 16:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQYCRhvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B74210E0BE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737476843; x=1769012843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FO3Q7o9uNMrcDWMdmaBWXNbF5zxlUvLPvDCa48jKkRI=;
 b=FQYCRhvbNPzus1pPjDmkXWhKeOgYagTV0rYyyz/gWW6IrJFR0elR9Heb
 4YDNpwHhtAGZQmqf+KN49qkJ2Y56h1yzF7ND2ySp0SXq24wOwwhrEn+MJ
 YpvGeDkOpgmHJrGxCVF/1JRNXHHl6v+4L4dfbZwN1CwSrJToSoTuMQNL2
 YZrE0WK9cooyPux4H11tpkmccbklbjEdTG4gbUzza9x0MstnwhrV2Robx
 qiFf2PRkjVx2SiX0WLfg2NnMcNFw8jYfwpMlrS/ofSyjj53+mfGcqfzCj
 CRumWpnLyJitGhHi9+94wm2ZdkRPiW0zlmrvaAIV/+KB1s3SyNvSSl86N Q==;
X-CSE-ConnectionGUID: qP2kmL5ISMqajYbNuM/TPw==
X-CSE-MsgGUID: 0LluM6zeRoSbJmVBtufA7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37594497"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37594497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:27:23 -0800
X-CSE-ConnectionGUID: Zx/LTBsdRv6jCvOOly5Xow==
X-CSE-MsgGUID: ufy0F3GdRXKj7RU+faHkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="111836470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 08:27:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 08:27:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 08:27:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 08:27:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtdEp3aK4bEScRtVvz/u0xQkMTUnMRkuhwM4RjnfLFP9lfQCLdlzEheUllfTcpd9OCOHPfGmPQXz6lvzMRw6EANp/OengomKA/DBs0C2zb5K9EXsF46ttsEI53A4d9IqgwdK8e51Go9SaaKS3k0hwQhiFE+aaLFFMWMRf3S1Xpw07vxtvmWB3l09FchnnOcbhx9zi7PkcvujW7ttc7OmtNSnQ0Dr0lY7P+ZOdfldFst2zkekGmTfh5AF8sdJzBh5Gbh3aEucG83KHjLoXK8bfxdvx3/d8oecvIGP7x7nU/JHxjV1+qOkSQlhNMZe8Iaz6D3P/NIMm6yCxPPypu6PpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZzEiX2HtITeXvY6PRwY4UwacqUW+AD4Ak8H8M5svi8=;
 b=m0pQbzLM8w/hBWCdZUmIW2lcygZBDicVynQ4Kfe5+lVh/JAQrbz3Gdfb52/pVR4rCEuRNZ4wVkerl/8yGchVc25NT8Fc8QPw0msLyfkOF/CG8c/SS7fzxfPAFpwsr3jkWsJ+IOOxykMQ13znklAEbulpHA7MKV1e9E4vsSy+6d4nTLgvVlScvt96DLwe8hwJu+2LDSMVqiIbVPdXJ2tGcwljcQdDkXnPU+TM/HzQ0QiaeY+qcrqQQA32+Q3Hhn+H3d2o+QzAV+ymHcKwWJgYX+b3VisoEcGkj121nWpTKQ34HbGeSCAecZh//uiuVb9/kTvYuaf1/bdPS59YpMksSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 16:26:36 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 16:26:36 +0000
Date: Tue, 21 Jan 2025 11:26:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <vinay.belgaumkar@intel.com>, <szymon.morek@intel.com>,
 <jose.souza@intel.com>
Subject: Re: [PATCH V4] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <Z4_KuCgUWvM1eBjE@intel.com>
References: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|BL4PR11MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: f18a82d9-b2cc-4680-a83d-08dd3a38600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t9s+3AKRSMra99oOY6qoeoD9WVzCwmaYOCaC9SAvE0tfDFCqENEzGLwPxqJi?=
 =?us-ascii?Q?59Yu73bZ4FX4zvAFUMW60fPUXpS5BK5IzDJWWUV+IQsKOL90v2e3uSydOi4t?=
 =?us-ascii?Q?jYqRWIdzJRfk1QHYVX6eqQsdFjPfNo6PyBn9aJcPZrvc2bB+67JfgAYWeat3?=
 =?us-ascii?Q?1H3GsHwpcaemETcJRCtI3m09ftr4OayGDv1fX681e3AaTk0n2VO+u2fFbfLp?=
 =?us-ascii?Q?vh23xCdsesvbSdZNPaREK837vD91VcW6EgGEQ6b0jqQYpzBVDt+nbQ6vCYNd?=
 =?us-ascii?Q?DCUkXpeyjUwHs/R377PhWkCNRJIggDQ1yQJuxYA705T7ez9A/IIgGCyei8ho?=
 =?us-ascii?Q?GN8LGgxZYzu8PW5UgfOdyjBf7HzsYGdgAKl0DKQDZ2LokMhCVuKjs+fOZ0cS?=
 =?us-ascii?Q?vTKyZfsZ7lRD4C3AKTvfZzn0fYvM0qCrktYiONAwj/V9QD5vhVO9Wjnj36Ov?=
 =?us-ascii?Q?99WIdnrWV8uQNO9AAxySFKJ3OqmFgOb4OUJiw1IzSnI3OU3dD+fuK5bIfQL+?=
 =?us-ascii?Q?vUEmDHpQvzyNiE/wkqycREFwSxHvx4Dwn3QFkCrfxKbMccd3AFBc4r0cYRfN?=
 =?us-ascii?Q?JU2nlr72hyW+bZUvl2+51MiElpVzGpVHXie2Xg9YenFyjVQKAISqmgsJk/Ck?=
 =?us-ascii?Q?13lJSn+izvYKFsxEtiTNH/hUPm2SBmcVXNNyirKq3IiMR3/EZPNTPGZuS/iB?=
 =?us-ascii?Q?DhvInK5A3SQiKYyaXi1ea0fw7RLd6JeWm3YFt0jxsGpL93oa9uqOlU61ztCD?=
 =?us-ascii?Q?6BDZgikI3X4g+/qusZ6HRhn/59d6jS7iWOwJtFdCKeXY+kbYzBxNhj1g+djT?=
 =?us-ascii?Q?ei0R1P3veS+pP5kKlcK2VEhMT95BdD67QLBueDcrGROBx9x/FOF+MQsmi3t2?=
 =?us-ascii?Q?9rSvQJM48IGvZt9eZM0l62VMGJgR0wZWN4S0HiysgKFCq8+F+2RN7ZNUqkYM?=
 =?us-ascii?Q?OHeylHEOGOrcJ3S3xs+PNJ4gX4jDVCHJl1UuMStixVgIiDaNIxhq02zAT+4J?=
 =?us-ascii?Q?XT4iKQsXGB/pw2xErLXRGKT+MScv+/7h+nojhbGAIKsqVzfvxhPv+b3yN5Ug?=
 =?us-ascii?Q?lewV9z+dSLSr64q2v4/J6r2PJc+B4ShaGn2MfwSpQhz97YIV1nqX6F+t+zul?=
 =?us-ascii?Q?eu9I9D4461tvzo9/wgedaJ6LD3Y5/CcK/FkZlmYw6VoCAY+ybP+TOcA2nUa2?=
 =?us-ascii?Q?3Avg9JM1lNx94JQtE0SV7oe5ecVNASsFRUlujKXxqVWafDBKZq+6XL2EAg4U?=
 =?us-ascii?Q?7nQM+MZPrVo7pUb3yh2I1Z+LGUpfyhp7ERFmxdtdvsMALgGKngKvr+njvdmU?=
 =?us-ascii?Q?ykuBqHuGdlbM3elB7dWbh9AyIFjgd49W8MLInO+TjkbSKDf4+3RVaA36fHzs?=
 =?us-ascii?Q?tUFCkwDTgkjjvOOIE77cBT1d7yTz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3nJaOUZQ635VM0VdtD87TwhDKFf0A1mW0gukd2i6unlUdUUwRrCKXxyfBYon?=
 =?us-ascii?Q?UKCINnUoLNHnQYu7cPSWcm/7gHoBX7nU+5FKGh6cP8OyB6E5i44RylmKUJPy?=
 =?us-ascii?Q?W41hi7JEeICjPoPanCWQbIbDuwcpePT/7hl4MVPURYZ/pTYznRzDWv6JQSmk?=
 =?us-ascii?Q?mUFku5LXwihiG8kYpFB9XXcq0R1MGC2P0GvMDmw+8qYvyo6DtPdFC5YhVKd+?=
 =?us-ascii?Q?uNfQdVGhcHPPRA/NJdQatX11SPS+hokHK6in1JbcZyk+hcu3XdkKafWsYTVD?=
 =?us-ascii?Q?+rtTpfB/vCGHhBm6g5A2D4WGIFm4EzAHVycIsrb1eraCt/P71a00HY2tKXmH?=
 =?us-ascii?Q?4fWvrGECLEs2JSrWLLMZRw9Kz/mJMW0/dWGfRRv+CR6GIWuxFot1kA3UAo2O?=
 =?us-ascii?Q?8wqjFYeZJcSrRf8Gb21tSoEeNXr9aAkbLwUYHYmzpfrl2mIhEw/FMeSms/8f?=
 =?us-ascii?Q?mokpVb6rhirioOsGZ7z6zbFtya5MlmuwRLamvN0LHmpyk1hRu4n0LSi0lT2v?=
 =?us-ascii?Q?dW0HHtnoCVSQhV2Zdj+PE/dLDsfG6EicUemwdMnezDEjiJ1kN39eVOp2N2vJ?=
 =?us-ascii?Q?fYF/mJXgg5AuIV0dPJGre50ukbFnKfahZmQuBMJPJ+DW3itfWpReDeIvxa8W?=
 =?us-ascii?Q?Dpka4d7x5tXh8ubjLsefxPhkJ/1l2Q2WpJHh2hwGiqx4xql925/HdGIR8PVB?=
 =?us-ascii?Q?iKtFCWRDL37zS703o1FW0v7LOtNS+7mK0mfdTaB//DJ9nbdr5BdRLvccZ4Dz?=
 =?us-ascii?Q?Dsw7NCruD41DnGsqYD4xmpCZOQ1ljnT5I9WBjEVEEs8+WUPFPILni3zkyZEe?=
 =?us-ascii?Q?kxTvWlDHpe2F1YnXGaCp+tAAlj8GvbxHJXDAgfmnEi6qRfYGlYcVBc3zlAF5?=
 =?us-ascii?Q?DdUS1SxHiVY5fYPjkdFd1yHvKS2pdL9mXCnBRU4dIXuV+1fNef+zzG6BMwpL?=
 =?us-ascii?Q?GrHQTNdpCXQYCQP8f683G85dt/tSunH8x3YYjwlcCo79dfpaVy19FsGLX8jJ?=
 =?us-ascii?Q?sfGGHCNvGOTY3PTACpo7j8VBnBgfLcoVQFoGTAD8UohPWDE3CixUTk4QEuZ8?=
 =?us-ascii?Q?DudLjDETCWMZzTJTWXDUKFVlhOSD7cg77XewEg0u10cdkldo/gE/+r8vLzU+?=
 =?us-ascii?Q?sdb3mxLDKKpkk+MDljaNUVk6sMXByIS2tsJnPs19MvLcUCkmH/JplAv0lOAj?=
 =?us-ascii?Q?/MpwtvG4PHr5QVlxPKC4ET/KIfze34KKqvH8xRqWcD/WLixuE2Hku1up7zgj?=
 =?us-ascii?Q?SlxQmRU7mqmv0Gir8FvrWmYIeEG5+VUcqCyIxKwo7TpgXJVmi7WXUNUxx+Yk?=
 =?us-ascii?Q?5O4i4rIAhLyfjPAa24JpJx7FQiQnCirymPe+QuIGgjyY23LWhHsxt2PffCt8?=
 =?us-ascii?Q?p0OEBno1+WgTp/BfXZMZLICoyugrUq4gjW0yxnYCkCnp6/K2xcoTaHo1XLSx?=
 =?us-ascii?Q?3NEDFKer/6vSdzaURe8q47zgZMi59T506TpxDnbLFUop9tuoMEM5yACW2heR?=
 =?us-ascii?Q?FZoFMHjLtsio8NaCIYyjlZNRbYZ8VhoRN4VTZTRg4zurCQhmbtKOptsRZlam?=
 =?us-ascii?Q?i0C1qKkD0OXBmxiAUQt4fXy01A7JC2JHq+9LDFGEMIOQCIJ3YOiIgjPqTx9j?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f18a82d9-b2cc-4680-a83d-08dd3a38600d
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 16:26:36.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suOjC2X/ZXd2ekeNYPgT5v//PA+gKbx2fePTDHYAfynzp+sMetKUEa0L+yyWfEgmO6Yn+Md7oeWNjxiWJrojmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

On Tue, Jan 21, 2025 at 06:46:05PM +0530, Tejas Upadhyay wrote:
> Allow user to provide a low latency hint. When set,
> KMD sends a hint to GuC which results in special handling for that process.
> SLPC will ramp the GT frequency aggressively every time
> it switches to this process.
> 
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to processes that set this bit during process
> creation.
> 
> Improvement with this approach as below:
> 
> Before,
> 
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>   Device: Intel(R) Graphics [0xe20b]
>     Driver version  : 24.52.0 (Linux x64)
>     Compute units   : 160
>     Clock frequency : 2850 MHz
>     Kernel launch latency : 283.16 us
> 
> After,
> 
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>   Device: Intel(R) Graphics [0xe20b]
>     Driver version  : 24.52.0 (Linux x64)
>     Compute units   : 160
>     Clock frequency : 2850 MHz
> 
>     Kernel launch latency : 63.38 us
> 
> UMD will indicate low latency hint with flag as mentioned below,
> 
> *     struct drm_xe_exec_queue_create exec_queue_create = {
> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0

or 0 ?!

> *          .extensions = 0,
> *          .vm_id = vm,
> *          .num_bb_per_exec = 1,
> *          .num_eng_per_bb = 1,
> *          .instances = to_user_pointer(&instance),
> *     };
> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);

What about moving this block to the uapi documentation?
we shouldn't miss a good opportunity to document our uapi ;)

> 
> Link to UMD PR : https://github.com/intel/compute-runtime/pull/794
> 
> V4:
>   - To make it clear, dont use exec queue word (Vinay)
>   - Correct typo in description of flag (Jose/Vinay)
>   - rename set_strategy api and replace ctx with exec queue(Vinay)
>   - Start with 0th bit to indentify user flags (Jose)
> V3:
>   - Conver user flag to kernel internal flag and use (Oak)
>   - Support query config for use to check kernel support (Jose)
>   - Dont need to take runtime pm (Vinay)
> V2:
>   - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>   - Add motivation to description (Lucas)
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
>  drivers/gpu/drm/xe/xe_query.c                 |  3 ++-
>  include/uapi/drm/xe_drm.h                     |  7 ++++++-
>  7 files changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 85abe4f09ae2..c50075b8270f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>  	};
>  } __packed;
>  
> +#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)

I understand why you did that, but I don't believe we should use Xe
terminology in the GuC ABI... It should follow the SLPC naming and
likely SLPC_CTX_FREQ_REQ_IS_COMPUTE seems the right choice here...

Vinay?! thoughts?

> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>  struct slpc_shared_data_header {
>  	/* Total size in bytes of this shared buffer. */
>  	u32 size;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8948f50ee58f..bd33fb318677 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -544,6 +544,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_engine_class_instance __user *user_eci =
>  		u64_to_user_ptr(args->instances);
>  	struct xe_hw_engine *hwe;
> +	unsigned long flags;
>  	struct xe_vm *vm;
>  	struct xe_gt *gt;
>  	struct xe_tile *tile;
> @@ -553,7 +554,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	u32 len;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> +	if (XE_IOCTL_DBG(xe, args->flags &&
> +			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> @@ -570,6 +572,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> +
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -578,8 +583,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  		for_each_tile(tile, xe, id) {
>  			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>  
> +			flags |= EXEC_QUEUE_FLAG_VM;
>  			if (id)
>  				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>  
> @@ -626,7 +631,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>  					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..30dc129a6b09 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,7 +85,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>  /* kernel exec_queue only, set priority to highest level */
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> -
> +/* flag to indicate low latency hint to guc */
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
>  	 * bit
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 44b5211066ef..e926f89e4ce9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1014,6 +1014,17 @@ static int slpc_set_policies(struct xe_guc_pc *pc)
>  	return 0;
>  }
>  
> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret = 0;
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_STRATEGIES,
> +				  val);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1077,6 +1088,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	}
>  
>  	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> +	if (ret)
> +		goto out;
> +
> +	/* Enable SLPC Optimized Strategy for compute */
> +	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
>  out:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..be7551756eb9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>  MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>  MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>  MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
>  #undef MAKE_EXEC_QUEUE_POLICY_ADD
>  
>  static const int xe_exec_queue_prio_to_guc[] = {
> @@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	struct exec_queue_policy policy;
>  	enum xe_exec_queue_priority prio = q->sched_props.priority;
>  	u32 timeslice_us = q->sched_props.timeslice_us;
> +	u32 slpc_exec_queue_freq_req = 0;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> +		slpc_exec_queue_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>  	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> +							     slpc_exec_queue_freq_req);
>  
>  	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..136280c0c6b9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -334,7 +334,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		xe->info.devid | (xe->info.revid << 16);
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM |
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index cac607a30f6d..1abad0c6e242 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> + *      has low latency hint support
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1124,6 +1127,7 @@ struct drm_xe_vm_bind {
>   *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>   *     };
>   *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>   *          .extensions = 0,
>   *          .vm_id = vm,
>   *          .num_bb_per_exec = 1,
> @@ -1150,7 +1154,8 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>  
>  	/** @exec_queue_id: Returned exec queue ID */
> -- 
> 2.43.0
> 
