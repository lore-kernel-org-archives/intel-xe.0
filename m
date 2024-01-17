Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A9C4725D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525110E134;
	Wed, 17 Jan 2024 23:36:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6120C10E134
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534574; x=1737070574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K7S8IKaXxnYLzAW3CzztmR9t/R6sXEi1CkiIOv6uDkA=;
 b=kJpwgExqymPhPNXbI2rPb9jOncGFp5p7vigadWzj/DsK+nWfprTcAXKo
 kQQ3ZIaE413sJJWFmiSBVSyg513QllURq53Zk/QyLIszLKFO0MWK4Ymry
 52xgEt+3UBAzRIrMoR5Lc/Ej2vwXJyEIKaFBrkkg31AnNSyQvXSpdRpds
 bk++DNNOC86GleQINBsACS0RzalYiE49WD3oInoesxd31LyphZD5csgkC
 V6nh/4Y1qebhj/xNXIAZaV9xe5zZSqsVr3X3jZjEBdh9v+EwXyIJYKa6R
 QUUjXPoTHfTVjmw+aWNBopU1K3WDWu0sl3rc80Kz37itJgszkgMXQtp59 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7675386"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7675386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:36:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="18958203"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:36:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:36:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:36:13 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:36:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPQlkJdHZWLiskenlj8PR7JVUS5XS+AaiIIC8yCE6A8YZc5oKRAqZOyLxJDHdo7gY/J8ds0R4ywr4jCSrbiRWzl1mCDHvezAVyELnBKVlsASgmZhdBtH4UwgVCGtnKh2sLGaddK11l6OLHxB0FQ9EIo/SZV5R7xN0q+18myHNagSB7eeclYwIhItFg0moM4MV2kmkT4IH0S+dWB1mNRnbua4FUf6QUExMBPS9EY6qyK/49h0s1+wiDa2j3dPKx4dqAuSEIwB2g83fb12l9/efvOsMDiNSuvy/t+D/L0t7F+I6/x6Ij92OS60Atti7M9EuUs5sFyObWvOAbX16NzdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCPacz2uqrLkSkMDiUH0tkxbvpxT02e/iAXXyftcurM=;
 b=bLJqnl80TYtyejjReiFh6E2LByX4fCWwNyVnE5CQ3mH21QRHP/CEdNHyNQhn121UEFePsZi9ICLD5RUC44qnVvKKvLwY3RFFWPGIByGxFCj8lGONKXlufxgZJIBf26tSHapYNoCw7OgmwlAM6ipoLQfZapMm+L6g/4PjQMVSXl3/UOUIfGX/NQz8+cSU4OtxCyD5A0WWhkSfjv98o08nu4eWWsxK5dcyWaIFYQ38vhJtUBzbHr0Jb6qtNRKoUs8CYH6DQk1Vg/iM/ObHtY1MPLZBCwI/DtvG/FVRbGxed6+0LOwrq+cTz/eJM53zvP6Yc6gsutCRzT/iILkqluLwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 23:36:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 23:36:10 +0000
Date: Wed, 17 Jan 2024 17:36:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Define XE_REG_OPTION_VF
Message-ID: <yqbpo4pnh3fwybnrbszpyihx3yi7qh4tu732ygqwag4fwtxcph@545afghzligx>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: e34860cd-cc97-4c49-bd76-08dc17b515b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iY5X4dUgw/Erss588BIl48qS4Qumy5/4k+cuXXiEVX9XWqVIjrkYvp1PfgZ3z2X1SaNO12ANZK8N/nNHNLdMv5ByE2MhMzJZORvatRAyKvR1f2jYIvoF7LEQcg+IIM4zJiPdwh0mbAeWi7aiC8LJm3fb/eDqsji+LKRrrVOnAwfUg71dajh7OcsMWHhEvkGTH9+K0zUl9NpBvgE7V2FE0VAL+XL0MUvC0sAomB2hViqQSwxtba1eUKjDHrF4Kq3V/zYVf2ql1kXQy83ITrPJs4ApWub8xdgAc34gEI1JLWQRVwp3++AROf+i+F5lPF9lcRj3FfCDmw0skIdsLdvm3xa6aRdJIjTQl+HluADm5ayNIAzWLvtpVplcb1IibCguFjEcwPS2m3b3ODI3dmCRYrqYT1c5AXiFIKaq6lWeQUxPHi0IKdYDeWXHsTRZYqL7AcXcnihWnhIPMddBFgA0odcsOCq2WIbf9vskAvSMC9yp0SFXIysyzDuFjskkCBeVGNZpYlvES5/4UMQhXAT2veG1No5ZmjeD7ikP42P22GCS5Qk7Vnh8M6GNJn3kT/7H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(8936002)(8676002)(5660300002)(6862004)(4326008)(6512007)(316002)(6506007)(66556008)(9686003)(66946007)(66476007)(2906002)(6636002)(6486002)(33716001)(41300700001)(478600001)(38100700002)(86362001)(82960400001)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnhRk++UvxwCSaxoKCtKgkyAx+kps7paaA4dVB0J+SOmHoYkqy2E0jy+o3Qi?=
 =?us-ascii?Q?Y+ecmGyt8CGLEMJ+OFjc/HYMmwx6wLfSFgYgWhItel8+2buUcGT540N3jb7H?=
 =?us-ascii?Q?W7ALR81uY4exTm4L9MTdcfh//apgJ/egQjBdx5ssPl6M/asxCVPhu1mUSN4F?=
 =?us-ascii?Q?3Wh+puEbhdraxxC0RO4LkETOaI6JdBXjWZXsWDf3zY3UExlLqM3E3lmbXjgD?=
 =?us-ascii?Q?nidMVgCGEWz/oPNbP1tS5f0Au5R5uMctAkUQ/1XfMCM5nBYVgV0nFmlKSoMB?=
 =?us-ascii?Q?dUXU0ihUy1pOacrCYdpIBJtPsTQWUN5vLiWV6vQ1qqyFsEogEMk3Npc2sJfl?=
 =?us-ascii?Q?UGaznXk7iJQkPxL0kIOhtW/zBhKNb5S61p/IQ/TTmgTh8yC9gScoWTQpARsC?=
 =?us-ascii?Q?j6MnrpaXsfP3phLCza5Ku7LQR11Q4jiU1orFuhUBnWhUVBO10QervEqRDb0d?=
 =?us-ascii?Q?w8Ypto8Wd9n0P4nsB4MZxCmqZ8U7fD3fiIb9S2iHP/8FjYuoQt0gN8mMgfLy?=
 =?us-ascii?Q?KpbvDUq/KURh0xGHClAXRMULulo0RM76XJg9Hbq6O00OKAuz12TL3L4+YUKs?=
 =?us-ascii?Q?W+lVvPE+F1Gfvfp0rW5O9ERQ2/jaHSnsBk2N8s9haIj1jCdQuDZm1Sb0MwZV?=
 =?us-ascii?Q?uDYcyg9rUnjI/yxjP+jO55i1VNl2aD46C5UZj0uH9Qz8rOEHYk4QNqppCp9o?=
 =?us-ascii?Q?8MUhJiMNld6klhjfVJi9poJutAjqdlW5S22uSq6Rytk5KihKVE9v+idLasXh?=
 =?us-ascii?Q?UVhJim8r6JCucmU5Hg9zfqALmkUhthIVCI6jFn7BJYb41DpC5DqClRlCGIOl?=
 =?us-ascii?Q?0QlOMmswavXucmnKQP6G2q8QFidYFoB18B+lgyerJP6k88ttK7wXo61F2VXd?=
 =?us-ascii?Q?ZPUyleutU9/Ru8ltZHC3PhUN1C9UqrJ5NbdByeBbo78WraIF3PZ60enDn3hk?=
 =?us-ascii?Q?munO2OU0KlxHRxCjr/99qGtBijWPm59vDkjhd4JBhfvqTRJ/kTXNCiZkzMRb?=
 =?us-ascii?Q?9d+8k5iFZs1HdtqIkxCa4534l7xbg9ZbgOyT6HYbCeyaj6WGCgfCXFysGoVP?=
 =?us-ascii?Q?sKL1CkQS0uykdXkS7+Wqo4UAX5Y6h+U1aQa4al9sBZB09uBaRut/odDMHyyj?=
 =?us-ascii?Q?TiOA0kyGCVEYp35mSHJI9iX/a5Q0bVuJCaCisODwZudFKASMzgXWVKIzgSWw?=
 =?us-ascii?Q?nxzbE/IDOfQr/RQiTT4H/8O+vKdDtE95V+gT60EVOuiabGtpMXySokcivmPS?=
 =?us-ascii?Q?8SJpi5k1eMVLpb8FU0WTcTDOecxC9JArTehpbeAnc6iHG6AqBaS3GBcNnoNA?=
 =?us-ascii?Q?tOjHF/IEGKqAQpU+pFy5Py+mzIOfpht4PAXecmGN+zLkeM7G5vSAngym2yL5?=
 =?us-ascii?Q?L6xdp41PLktROjm5MpS2cl/LPhV8uryL3yXb0fC37+5JJ1i8VaN2cuHhcTOC?=
 =?us-ascii?Q?E37n6nkjgHjJoF42GsInY6HBrxjaYiXqSzmCDPkJ232yj1cZFNxHaCX5TcB+?=
 =?us-ascii?Q?2D8ki7GfYsCVYkMPi6cb52QTcuuqoxF1xG1mckxYauBhlVEWJv5aQs87hE8M?=
 =?us-ascii?Q?drTY3PUB+QGFgtBdy3XndzJL18FVoK1xAjMAVlZpogc7Q1cP0VIcbA5sYfKR?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e34860cd-cc97-4c49-bd76-08dc17b515b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:36:10.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI0xLTb01GAV267W+u2T8Kq26lmMetKP/Ogp+B//KDzBIDOUJMajcj9ycujdTcxKnhPSYYLbG+m1b+q/mVksnMNtJY73rXAVWlQnw9lRF5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

On Tue, Jan 16, 2024 at 03:56:13PM +0100, Michal Wajdeczko wrote:
>We will tag registers that SR-IOV Virtual Functions can access.
>This will help us catch any invalid usage and/or provide custom
>replacement if available.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>index 114b07db962f..c89ef2b79a3f 100644
>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>@@ -37,6 +37,10 @@ struct xe_reg {
> 			 * value can inspect it.
> 			 */
> 			u32 mcr:1;
>+			/**
>+			 * @vf: register is accessible from the Virtual Function.

how random dev adding a new register will know if the register is
accessible by VF? Something to document here?

Lucas De Marchi


>+			 */
>+			u32 vf:1;
> 			/**
> 			 * @ext: access MMIO extension space for current register.
> 			 */
>@@ -78,6 +82,13 @@ struct xe_reg_mcr {
>  */
> #define XE_REG_OPTION_MASKED		.masked = 1
>
>+/**
>+ * XE_REG_OPTION_VF - Register is "VF" accessible.
>+ *
>+ * To be used with XE_REG() and XE_REG_INITIALIZER().
>+ */
>+#define XE_REG_OPTION_VF		.vf = 1
>+
> /**
>  * XE_REG_INITIALIZER - Initializer for xe_reg_t.
>  * @r_: Register offset
>-- 
>2.25.1
>
