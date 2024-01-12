Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E4C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 16:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3AB10EB48;
	Fri, 12 Jan 2024 16:27:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01EA10E130
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705076832; x=1736612832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cud3MJRDLTw1KgFV6Z8rcTad07/R/e4iCfCt3s6FNCg=;
 b=DGTuNo6hg7mvHsmFBb/0Ghfro01XY8sBcG3CfELcxDLR9us3FgBtxooz
 2o1E5i+yMICLwEb8cMjYr2LwU7ZSnsRZT30YFZ3iq3UUQWFoWiJkWR+xW
 gXdoJfVOrHWr4x1vuhxOr6DVVrY7lFL2xRiSzCGben5T+wErvXxv+P9Hn
 ekk2NfLQqzIhDDp1mMrqkmBRI+Ltd6qId56EffJcYTQSMK5S0Hi8UJzPA
 ow95espUmm+wgMVQoLKVmZtaYfWWMxKU88pEW0GWOvwRQlLWcTkt9CC0B
 /s6rzPbtAu09wvL1dQ99Kb3csd9Yp4aXWiTq0wJc4qRm7Y/eRyI6kPo2T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12575688"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12575688"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="873410829"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="873410829"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 08:27:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 08:27:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 08:27:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 08:27:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 08:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXoK74GaRB/Bf0HaqcUeFFHhda7f30uwbBpoTx4GFbI64h1frlIhycLEpFHAuRZSS9+vrpQQtj7Y9jXQB9iZFXlfpk6XFvMcQOMJGa/bUA65kLCXHvEU+uGQHlO5V+1UFDhNxCGWFgQxrQfVF68VBTp0pgYb9U5wz4OfI2+POQLRRucrpEed02RjKRxuLJG/WEMQ/Hbut7MNEdrgoHKhzfg11DGRIqndF/45TY70nTWUlT2IgJO5eIW6EvH1p3NnNZQqp3YluXcPazIH37KAI48RzZjVDdfHzJZ327fpBi2ONZnQtZkfd3Bfbjt3JDvXW6n7KmCpzO3pisKO/+vBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX1T3S6YjoYS/pbdT29HtCY85cUAseTG4ntBFbWl4BU=;
 b=NWzRw6/l8qQ0SOLcHOpG4i68vt1BJCRyVpLiFgTIP81Qjz3T7r2xYJDdK2EOhECUzUO4lzMx+oAE10v4JVEY9eeYztPylpkOICSJ61PSoNmMwPBs8mqvLIcVWjKdV9ZYvRE5mOPbEn3dvmftphxloWRZSP/nvNzLNQxmIB6XmTWtWhSVIzjqsSa3WSjLJfYnonpHVrT9e2o0L1xAYtAM8s9zXObGnHk4J9FnO6OoqPU8lQ6dERdINbFKOs4n8Hgae7vnuTl9Vheo/M+16YVXv4D5xJ7oVdmYVPHT4NBceLIGAHV90zW6Ten3hIrNFdAPXJI6KEh8je/5vMQgYQBAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 16:27:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 16:27:09 +0000
Date: Fri, 12 Jan 2024 16:25:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Allow MMIO communication even if CTB is
 enabled
Message-ID: <ZaFoDFQj58S+ODiQ@DUT025-TGLU.fm.intel.com>
References: <20240112132248.805-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112132248.805-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: ba800495-dd38-4778-3740-08dc138b52cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: clGiWF23ApRRR94dqI04aoUYvgDoE6anWot3wG84D6eyL9/5rehlYOppo7qRGwtN11/Bj0jYlzX+3WocgVTLwOYd7Qm0MP39jme+J7GWQuhPN1m7LmTQf+YeiOi6gwKYzjqoFde35OxbPHB6tsjJIZjb2YAtrnChyv0P528ZpJtCzCHSDJnQZvx+3/8EK4bcwAATok5Dws8N2SnPl8sjQd4BxQADRYwQgUiCCsbFMPDqGv/6eWV0F8goK8KrEAfziPWfsdh9nveaCWBPFPjpyjbIBvJQYqcgdEffbSUnUBQX9oICJDTIOubIOkHZVYkBP44fOJ/8cmp/SS/W+xcqx5/CLL+f9m57RF62U5Gf9m+fhqvIHBa3TEK6r1cxbfNd49aq60qynsDeUlHIK3+GELX/IvcnjWPAJ9HmZm6JgYHLy3FgdYd23RPaqDVTLVlvlabRrZUuclvi1KbtjB0KUoBUswSA/E/ZHQdfKpaR1sulDqilC1kIAfSHupAr5q1qJIW347gMe6M2ORbN8qXnRViD8QzS2vpzFAmsJMJ2xovmIEwyxd99YPtatf6uvJTKqp6avsSp0ezvDA5MLWMPpG2HFthKikXXAIfa0aa2MV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(83380400001)(316002)(6512007)(26005)(38100700002)(8936002)(6862004)(44832011)(5660300002)(6486002)(4326008)(6666004)(6506007)(66556008)(478600001)(66476007)(8676002)(2906002)(6636002)(86362001)(66946007)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mF/qLlpYXbaZan7jjg2cg47y7mhaiQX9kvhbH4TfIRzhgD2bAj3fNXfC05V?=
 =?us-ascii?Q?7e/0sJXc8vdde2bSI0/kHdJwQICnYPfrzOfpHhAxTcwDVtsrLd8PSJa0gtsC?=
 =?us-ascii?Q?iYc5V6pvPlfAjcT/lazir9gTqrdoF5OlrGVw7r2E90BFkAFSc2pMDu2lmXlM?=
 =?us-ascii?Q?9yuKM7oWHDSJJk8qLaOMEyQZtqEgRzv3UFASUxnRk/JBGWlYJXNBEhzFol6a?=
 =?us-ascii?Q?ZHMXZ1iUPEVvX5bP20D7x8R089txg6eXX+PcJ4exuZv/WPIsmL5EveprRIDO?=
 =?us-ascii?Q?EVaVGWLZDB+/9xG9QnCrw23ub00QqEOuJWm37Q7usDJ28GBhA+TqgkwgOfBA?=
 =?us-ascii?Q?Dygdb1HlC5CtTC6J2wfx4VPlYR6gxMHC1oEtTJr6AAU0K9J+idp5ksum6KDF?=
 =?us-ascii?Q?TNE6Ja8Te75jrltFGKio1WoiCFnRswzuceLd88CIVAmC0YVymcOVPG/gaIXm?=
 =?us-ascii?Q?eI0RSG5tR40o8IwmEaD1oQVpJlVTA5+W+Bd9hti8vIuVTLc7KGCdcUb7WzDe?=
 =?us-ascii?Q?9Eef/jtKMpN9QL1g2xNauqmaaKzFzxmQ80URtqrQyU2hNUP/VVCxaG/pNSrm?=
 =?us-ascii?Q?TSGV2sdv5dMxlfoheuu49yOMBUl0VlB+pUVqx2RuStRqcR6al9pySIONHLyU?=
 =?us-ascii?Q?4DEKZQ0Ggo5uF7ZNn8Dw1VSN5dkvikHpUt7x8aSQvdtcEUEx2oQH4xQBTgwq?=
 =?us-ascii?Q?8U0bpD05SwHZfrxz3ZTNvlN4DH6QRGLycrbUt99Ld7zOUoEY4LZQYxSdubkb?=
 =?us-ascii?Q?7aboHhHY3lbKMuo8Eu9GbyIzrW9P/TqFZtoMXvZfncimI9ECoXqWhFyVDy1G?=
 =?us-ascii?Q?hK9GReqGRIbGQ0KaLVZ7ebh9lS5sjMS2fhGB9zxrfZmW1/3ivnJgZE7E91mH?=
 =?us-ascii?Q?0ckKeqVqvd1M5ghvhw1aY33fXYhSY4qDTNCth16rv7+K7NngIWoBlAVk84AT?=
 =?us-ascii?Q?l5MEAI1ULEHrDMEPx7YWzlA0d4MGm3g1BlGOqhbAFQ//ithEhurqulyuh1sw?=
 =?us-ascii?Q?0nrWJGy39WHBE2v5k5qSeDimh0Sxl2r0vl5ECyo8qM85oo7KhLVmIp/yHjZa?=
 =?us-ascii?Q?B6l0f/RQOgeK6677yJxmcTDOSep4sU5DEgUf26hJjhBQCXVXLtSoToxTBh8W?=
 =?us-ascii?Q?1M8wWMHMOetxKMZkX5fFFpqxsfEGeu29amzaf9ThoIaTactDnnuutlsvcX89?=
 =?us-ascii?Q?CUDglZ4mKzwRWKSaqjIyHGdq2xrCJG7oPa7Sz/sFdDmNZ8ekRlUTdAbu/DCc?=
 =?us-ascii?Q?4Dt5tUfMIj/nbK2P/W18/niRnkbrGj8if1FfFe5Cw3XfoM49pBi0SbroO+gi?=
 =?us-ascii?Q?qiQPoxzru18EKA6PAxVwiMZdEoyHwd4T6R3o1Qu4jC0TYb9VL7dQ4jSNWu7v?=
 =?us-ascii?Q?Cm3MLQxg1X1AVZ2Zq27SWK5gjK9O2vUlWTaqVFsYjGIoi5WPuOoH6gdND0yj?=
 =?us-ascii?Q?I7xa9Ss3u6Xq/JMl2fu+MOgUmd9A3DKUTuGmJmhVFcK4cFyMg0w7/wWA1/H5?=
 =?us-ascii?Q?qOrm4fZhvTLSzeejL3emDqL6ipLIVZplYUMK1WrOScW6dFjy0Bj6aNmwvt28?=
 =?us-ascii?Q?kYrk8rQkq0ZikP1bdaT5YiKI3hTSa12+po31wOa/oetp72wv1/FviL2pxzGl?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba800495-dd38-4778-3740-08dc138b52cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 16:27:09.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWPa0rH8Q9CmVSNDI80I602kRX9dnWVu20n9/o+qMga4udZXxJq+B4TijKHggXrlbZRlwiFA0uPe1dvzUdWoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 02:22:48PM +0100, Michal Wajdeczko wrote:
> GuC is still able to communicate over MMIO even after we enable CTB
> communication channel.  While there are only few limited cases when
> we might want to use MMIO, we shouldn't block that with assert.
> 

What is the use case for this? I thought GuC arch team said we should
not use MMIO once CTBs are enabled. Maybe I'm misremebering?

Regardless I think we should probably leave it in until we have use
case.

Matt 

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 235d27b17ff9..d4db0a34adbf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -674,7 +674,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	xe_assert(xe, !guc->ct.enabled);
>  	xe_assert(xe, len);
>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> 
> base-commit: 7a20187068bed91b523795a18219e570f1e84eb1
> -- 
> 2.25.1
> 
