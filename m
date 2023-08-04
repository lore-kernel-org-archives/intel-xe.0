Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A407DC00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 00:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9CC10E22C;
	Fri,  4 Aug 2023 00:28:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AD610E05A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 00:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691108880; x=1722644880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=au3T6UJEOYcMgC0Ur6IMUGD9ihtn/h8E7Kczt9jRgWc=;
 b=ZHmiSqR+ZfhECWyyW/GhPNDiVdoNebiZlNfImcwcPmXhBodZlAEVrIC4
 xVw2NGaG+FdBWCnJGs8GemOrdywMG8FpCy0SD+KbDEpabERMJtBX5RSMZ
 XNj9UPGQy/CSZB75cl5o7FwSsxfgYgWUsgkx2Wv4setwLfO4smegbcpUO
 2y9w0nVnEfz9WUiYNuIbxTXVHxwdDaWmL0ZdtSGgaIgPqx7WHsnj+epXO
 krCQGYD0+2VtFowNhgQzS3j3zDlL/NOr4YXz1mqbpxlOpJMbBPkjkSbRz
 WpoIhUElymVeLIoyfR6kk6gdlz2ZTcoALWJ8dpIhUc1Q8dBhlxsdYr0yk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373669985"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="373669985"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 17:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060508342"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="1060508342"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2023 17:27:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:27:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:27:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 17:27:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 17:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=non9Sm014Iv9z8t1PkycDWHS6mYRn5mKSF7MKg+Sy3Y/Xr/bPKwuC7aTKs89n/exv39efXzcjyN7huyPBiD7Q6oWSGS0w/AY5nDpxg/3Qtecep4Vu318hVas7fpoEk5F5BywKOAzpET+ogsV5xg6MnPMCRANw4ccUUUH/uGOPVea5852q4/MQX9gGMC99BMYu/bGL8DaK1oD0QuvgF/3hSHgzFy8Y1aiyu0HZNlmEaFNPsTjD4JD5TYnVuHiyeE0UrOlm9O+3TSJfZxusMhl7fNfvX8hbj2QqMcJ7N4W+NhwBRx4fFcZnngFRILixQzYJFtESCsZ4ma3tl6po/FeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KzGT9tJ5U/tkTs2vjwYzkZrtdVbMMn1vn7QvjI//A0=;
 b=K/yGEg0f75HWbICEA9gi3sFxcI0q61Oa6B9FaWwLMd/N3ZmkHc+enbFXJjyI0UIUx7QM7vXYkkcbQsuUeOCXtN431VG1Y6+H3XCR8mNlMMAHkx51jsrp4xlszI1Mp/e7+FSJbQD1keZ76Ih15j2i7GMjEsstqG5OnZ80BVAJr00IccvthrdIaK3snoeuBZm7tulZIraRKohkH/O+HDkFBLx6oACCFQqluXMnuwLnyQ6a/e8NieQ02ffRSm0BE8IZgliv2i6C8/6IuEhWIODpNxhcTEzz+ZLaa7yAMTRXBsvMPDubR2DxojZLU7OJChj51rCkxPSiy1wmdcOWEx32kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Fri, 4 Aug
 2023 00:27:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 00:27:55 +0000
Date: Fri, 4 Aug 2023 00:27:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMxF2Deq2+fdPXNF@DUT025-TGLU.fm.intel.com>
References: <20230803234209.881924-1-lucas.demarchi@intel.com>
 <20230803234209.881924-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803234209.881924-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e625800-1574-442a-3511-08db9481a57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfqRFJAb5xDO5gyNKHcAdYdJORX9PxGAzB9pEZkhQntvy/kYleNSjfyv7Iae6q03LajdskDj+wJ4izREr1giNA6hQzug0Pfdcwex6xiAMyIcTxU3s8+P2m0+SjL0XjgMeNSt77MVB4+C6FFPoNtf2+oSHhVbwgvdKtO4lnr/x0XlVKl8AxwQulaekk6019973EeCLPtK6Q/F8n+jhVipjFwuvzptN95530Wg3Lf+FRF9D4DG48CYEx41UmM9eUj/Jg8PpjnJ8VlolifFiXWOFBdEzUyqZ8O2cIPP+lYJIeHmlblSnj84V4MFwMnjEaPCPvtOTyU8POxVh6TE76JZGiStHf+I6ZOU5iD9jnRyxv5bTCZLaHPVoWwFJfIm8rFBOgTaCodShwdaPzsHSTDnV7KnBUMCeWP1MHVsyVgC5c3zZ29B06Kel4Ey70wqfrrn9Vv4IoHL6mv0eAY9b83zIUWy2hFbSuQQT2tu1HITYACRidYTJPtEgjkdyGgoCQ9JMCr3k4QUurj5rce1JyTusY1TKZ8Hk2SefFlBdB8C1TPTRFrv1u85dUUBjc75ydOgWkyReFIedTZ8zL9EQRyXFmk/jV26nPL1F2HcsKEX+ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(186006)(1800799003)(451199021)(478600001)(38100700002)(82960400001)(86362001)(6512007)(107886003)(6486002)(8676002)(26005)(6506007)(6862004)(8936002)(66946007)(2906002)(4326008)(6636002)(44832011)(5660300002)(66476007)(66556008)(41300700001)(4744005)(316002)(6666004)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtnH+cEHZEkKxyUsqockcKNiemrYNBrBOwUk3EcTSmoTj71F/bq+kDMvZqhE?=
 =?us-ascii?Q?PBlKQE71kWNxh3njwVn9phMDERboFw93F7iQloZVEYgZHrPaU6m6ZLjozxht?=
 =?us-ascii?Q?w8wfMsdvzbsNnzxJGzQZcdKkg08XQ+XY6wKPG625xCIZJnTomc5YnNsSl2Yr?=
 =?us-ascii?Q?L3eOit+yVpG6m1JoziyvAPchgmimJLnULsjZUuuDiILuDcgd/9Xx4XdUbct6?=
 =?us-ascii?Q?xX2dpgeui8H2pQ9y+nqFK1Xuhwgr0b4INbPp2RQGIvJMJ9hmd4FWFz6bEX3i?=
 =?us-ascii?Q?MNk/RLgTckwCgxdqO4NnBsiwVeC6wZ5Am3fqLT4FmXcnC6BsDW+EH+ok5K3M?=
 =?us-ascii?Q?yx8sYAO7bTg5YqyrU2QGXYn1uyBVTD31M95dIe7FG0TMItd3e51171Jf9Vn4?=
 =?us-ascii?Q?JyQJyNpVXXMMuyQkPPzJL4mAEsIyvIkxoRnHg1DaO7Z7V33gPINwXmINtDZU?=
 =?us-ascii?Q?sL/LjCh2QGfuWRudYRNgZK+U/5H7AqzoWgzbPbRh480z5Vt0HvAJn4rsGc52?=
 =?us-ascii?Q?9C+Q/LBTYIROFCp2cyXG1ShvfXJYj2FH8+pN+RxqD9Pu0NDD5Ej3+BgS1Riy?=
 =?us-ascii?Q?Y++8PnTyXwE7ej/j416cPlE7m07jd48cqSozFYXpqTg8paZODvhmwsxXwGY1?=
 =?us-ascii?Q?POq9jHfBuTBlW7TXCx3wwtjExYUR4xmwMLNtJhW91xKNjFtkkzRfIv4HWFLA?=
 =?us-ascii?Q?JTVRY1ycC6Idj31AGFPMns9x474KTGFCaOFhxsaNskga4O1+6HySi8Kfy0AN?=
 =?us-ascii?Q?sLL4+3ScM4Gj/RUPG/1+OLYrl/GXdrioUmeTU3XCwYNPfDoEqqynf7mgkcvL?=
 =?us-ascii?Q?fBHXcdCVbpybi8Nf0yKdnHWRNkNgMKMx1KpHiWouyhABlilWXqOAyJ5HqtJe?=
 =?us-ascii?Q?KDUKSRvRP3PIL0JCfRDwfItdE2BHxjOObiIdRQ4+p4ri93SfqKLzcHzIiXu2?=
 =?us-ascii?Q?bDrndZ8mVi8xy7iyOMF2Ib/i/9D0sTl7VWWlvlmJCk/yJrEEDz0vJh+4smYm?=
 =?us-ascii?Q?RbGw/REQyDctsxPTXxwkcRFQM7I7B150iHuDrKXTEywLUhISRoVtCAj9RZvs?=
 =?us-ascii?Q?TK5jp+Mi4SqB7kxNdyz9H8U8G9akdogTsmrOhpjFKtPd3TJ4dbNBxc/ydO6b?=
 =?us-ascii?Q?m4QlpBUUDe8bwmRUpozvb+ZiJxYWU8I2B8ua0xQkpbSuhq7h9Tpw/axQwBoa?=
 =?us-ascii?Q?vS8anMJISZFGiIkjMBdoOb7qcxaOh+FJmUExkPxe3L/9yHBCMYGq9QZ/gky3?=
 =?us-ascii?Q?Zyv+l839SAoZnsJHErCfxYXWb0G9Cx6FIZBT1k2hBC5BYwiIIZnoSVa8B2GE?=
 =?us-ascii?Q?DT/ku7MiIHbr5HlVlPORozmaUbCIBsUp20R00Z2Mt97pE8pu9GsTjym18Zhv?=
 =?us-ascii?Q?uyLELLGVTnwzwWGrTf5Z9dhG2dWpYwblNBAsEwTzftbyY8Pt23epSmm4MEU+?=
 =?us-ascii?Q?eaXAGLrRbLF2Gbg7r3F2X8i9Y+xvaNt7KD+iEaLmma/uMDCpG9aqsKiX9wfj?=
 =?us-ascii?Q?tfMPM6nzUH6pOPNSIWdCz+GWjs8gDWZDeAH3IpS30A363wMAGQcqySZB6Sug?=
 =?us-ascii?Q?KDeviU69WvKhbXLmvraFVT034UeO8/2VRm7B1VIqXIKyAsLeUT9TPLQNLv5X?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e625800-1574-442a-3511-08db9481a57f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 00:27:55.2596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQQ2V0mj5eDfkrkB05oxn/TkGh8eeTdKBLHBMApgu4MgLce9AmeV30hstxeMPVIe+xJgBoj/5dZxaYsmJ7qaIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix error path in
 xe_guc_pc_start()
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 04:42:09PM -0700, Lucas De Marchi wrote:
> If the forcewake failed, put xe_device_mem_access.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 19d743f92f43..c03bb58e7049 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -825,7 +825,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
> -		return ret;
> +		goto out_fail_force_wake;
>  
>  	ret = pc_action_reset(pc);
>  	if (ret)
> @@ -851,6 +851,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  
>  out:
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +out_fail_force_wake:
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret;
>  }
> -- 
> 2.40.1
> 
