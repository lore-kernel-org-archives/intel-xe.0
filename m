Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6BFC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E365710E0B8;
	Thu, 11 Jan 2024 16:53:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3DD10E0B8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704992015; x=1736528015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5KaJiBIcdlexAbrOLdlNZ5S16fFs49g6z3LIO42Mkvc=;
 b=ZopzXbdJCx4cqdnLyfYyN4u8iNob+dF5MrG6YP98tVt8srnfb7vHxVuV
 wr1VaKqAOA6h5nVa7YiR0faifk1L0MLsY4o3CRQi10CPffAwQK/Qdm20Q
 oIvDJu3g6AnTmTguG6OZ3EudvOY9dK8Ar3x7HY4KAuC+HacFvrwCmhPbD
 2hAzUMCIzKy9s/vW1jHJy3z57bkdvMv3X5pA2cxM8EdB3MeZsqQjVNsJR
 l8tPdNtaKO0r4/UoIYWMta+tWtQgzPDY7uLDhsCRzvpqMcSTCAIGEddAr
 rHJiyUt60qig36jZ7Yo16XcDAWDiXptN5hBKAojWCS0wGEwxm8R7s6n+U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6270224"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="6270224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="31079364"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 08:53:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 08:53:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 08:53:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 08:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhAnTPZJ9kOzjphjcxb+Xj81g4D9CcOYGWI5bpOX/1Yn1oXWCpZiWvAeT5f9pLN9GaoB0FYfHzfiycDxDMeq3Cp34jH51uDKST2/6xo8Mm+GW+gpa6Iw51Mi8KKGDuI4606To3cEnZxPiwa30I+4FBsbMWJhlzR+sVGioIxyardozc6PEGCwo5xCZYQW/kkYAWnd08XZxusT0CNYLmtYOhaBzlpbjr/EHB5jTiHvPzBK4bu48e2B0waRAWeg1gxaZLIvcJtOuYIlHu+SIdrbmMXz4nfvDcRL4YbJqgEKHeF9qExfh/04KkpHfG2xH/p4UULByQZ31AtOEjorWojHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmMfgjmV5WcBqu01NTT+nsh+G3v0HQZjHKHbEJsCgv8=;
 b=lCTxIxpt6d2i1CmB7DYw6tRo45m94VZtrBL8QLFPAvr29FiN914rDQ2xNLbWlxazlrZNbCdVVnI2Tv/S7WLqUvKsqF1/JT8/LRyOiun536aVGFntX+5er1tFLRlXxpGPnPqJ44nA1gwIxTPJLTy87Ggn17+iCjd72lLOtT+EqPsTkzPxP+MnEvBaocrx7IX5Fb9hhaNk7O0SQ3G+RJMiaN06fYI432QKZlYOinllA6HEQLh7A6dTC2bQU6RzHbFN/OsEK5wNr9iWuE26DeJNatlPfEsGSqFToKh3/B22QDB1NOI3bCb8ODNRfaWa7/PUYj7E+vMtHFEcJgJNUXCwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Thu, 11 Jan
 2024 16:53:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 16:53:30 +0000
Date: Thu, 11 Jan 2024 16:52:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Treat non-response message after BUSY as
 unexpected
Message-ID: <ZaAcvHnNlblQG9Qt@DUT025-TGLU.fm.intel.com>
References: <20240111154838.541-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111154838.541-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 45237f7e-4180-4ce4-f353-08dc12c5d6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sg5l9qUuhkSQtvaU8XuCr0gw2BEx4n/HFGeHRDNFHUiMdSqxBKWdsOERmqfZn0Em+2ARqKUrsDMxdk0ZfvtQRRh/1qAUygzYLU9lUHpb+BoIO4M3Q6sAk6U0lSKO1oGNDp1H075becOx/Ar3yJug5OwfetBQDbl1bDROhux9T4QEzqB8VSglyaXUWWgGMERw9W2K+92JmL9fStqae7D1e8WwbOtuXZNelZBr2FZVws02qgWMPdhGjEhxeRfCyuvk2kFJ3YhieciTYoI4vhKxFF+h1igJ/yp59ARHFA2SLjpcmDLWHTZd+c4/NdKB2Ns6QtBK+Nbt2j3VdkuknmYkBqfhtZag3ffpMPDDvtZP5zaZAz3XAsaiTStp1N6z2QARCXgP88cSffL+i3EKHsb7krxFMIar+KmvP4mRarQ4x1GW+O/62/qftgvFG7ocslFRFTyuZEAVmva+tWQ3YI9tvCGwmsvRYXMmyfvIOZpcg5aFy3jqGm3se9jnfXpql/HUOlGbnV9GyyuFHv7RyUD9B8SqjtW8wz/gvnjLssey9zdHe7icVN1SfHpcFruS04lG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(4326008)(6862004)(8676002)(38100700002)(316002)(15650500001)(5660300002)(6506007)(6512007)(2906002)(6636002)(6666004)(8936002)(66556008)(66476007)(66946007)(26005)(44832011)(478600001)(6486002)(83380400001)(41300700001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RIqZaN2s+tdwRfvzwMpyAmsGRZ2hBMhBdu8EvrjBgWEMlGuoY1N51rIaATH+?=
 =?us-ascii?Q?a0p9RXkiAaKm546rnQBJ/KYLxqt4HFCE+ux2F9658qs2d2i3bOlATDb4kwbj?=
 =?us-ascii?Q?XAVa8KqrvUhMwBrHE8k/CE4GVYHGvifBCUMaFVY+C4qQslFfg3Ump8iJ6MWH?=
 =?us-ascii?Q?PGMjK13FLFbdpJ9TfQa1a7FxjiXGVQqD7i79+e9WJYhU8KPLJRz+lD4F6Cts?=
 =?us-ascii?Q?Pou1F6N4407flJYxwi8yqrxCw4MzXdDzaHNsdzse6sFvGcvUKt4w0JCPKwNN?=
 =?us-ascii?Q?SL3HOcrxHG+WQiiTv09gIQbr+u+XE491muvCDI1EcCwX+0HyegU5b6sROqZY?=
 =?us-ascii?Q?4R1J//1FlJVYh24/LQ3bAhQZWWul+5nTi1Dminxh7VjCbV7ABna2bweS+taL?=
 =?us-ascii?Q?9J7uKiWAANL42DcX3NwseyQ+eCTu9D2dxJkYbceS8EBKQCwLosNiSqHzXsYp?=
 =?us-ascii?Q?U8P7x4XVt8zDh88VfEZf/9Oa33qfHpLEyTPPkYyFaMoq+afcUwGU2mzZFkX2?=
 =?us-ascii?Q?WDmv7fAnfxSLdjanVQNd+MnPOPwgR/J4Mf4lwur+0cnsa4AIso4uqnZfoOiS?=
 =?us-ascii?Q?xDbywJrzRq182gVVzXROyFyQlGCNxMWkLRFW7D95eUnk68Hpr/RfwyzZXSJj?=
 =?us-ascii?Q?0W1c+YYoSO91eX66r9BoO7SWsUlsS1iBKZnfjNo6rCjgKSUqdIvlX+UTUOs8?=
 =?us-ascii?Q?HtPvk6tXaqgDJtgyY79d568iVvXHg+GlrPjlLV62n1Uz5VaR3YA2D1BrG9fe?=
 =?us-ascii?Q?N5RwjqRAjkdI2dNaKZ6tkH+F8Iujinb7d3OswCtrYw10PgYpTx1B/rUWPb6b?=
 =?us-ascii?Q?AX7cN74HkLzi1PW2WIEFUgxcI26fgHjMzLGknXYNPM/9XhwxjjgyjrqYmzo2?=
 =?us-ascii?Q?WLoAPetrxYzCAKxtQP7XTbcPlrEonA3xOKODdTq0/rMJzDMQzr8Q7ZA2CjbN?=
 =?us-ascii?Q?+VCUIK6kEaK9W3OLkWsukuylVyXLMkUQmBhkSPycmcrYwLC13kd+DQqD41lS?=
 =?us-ascii?Q?2p5odslTSYPAYVSLn6C4DpQAeImz1E/H49qgFbFf6ECPSUPOBPFYW3KPt5M2?=
 =?us-ascii?Q?1kQ1TjUs4/liQdIS69WXoCzmZPDfn/VMHFbV4LHr5sD57yxkzcxZJyrrmM43?=
 =?us-ascii?Q?TGOvsvgdNumSOqPKGPq5PZ2YolOQPZi0X7FBU7y/oMJY27Lenkk7TqyoChbu?=
 =?us-ascii?Q?wxN1c/nSzupRg3F09ZEJRKMWNMXQzBbZjjyIFVYVQ8yGNDm51jAIwHxhIU9/?=
 =?us-ascii?Q?2TCsxq/Pj6iHRubD62yfN0zvxyfBbOL/CxN2GUCk+IRpIfWDtGeMB0haWeFP?=
 =?us-ascii?Q?A7iBMRQclVhV2daZn3dMRzl/bozckQoR0nzjNGRlFXU9SeUZGnQQeMHuv39U?=
 =?us-ascii?Q?+mFodxBXO6tQXQtfyR3qYcF9LMXfZN2pH4rk0Dh3KDx1jqaavC2W8muKWta8?=
 =?us-ascii?Q?f714ECZxhV18BE0khsq8qJJ8rK3NmxhPCAw/yacM/W7eUMUAO9L/VUdm4IuN?=
 =?us-ascii?Q?KSaLIhqfeU891Jzarq766HYkjz9ormDXz4pv2QxlOUEy3rHFphyER+gWgMW5?=
 =?us-ascii?Q?71NYEXzL0liBicygUSzZgZhwkwwzl6J2zpuWPj5mMDi+pWEir8/g+dmM2nSs?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45237f7e-4180-4ce4-f353-08dc12c5d6d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 16:53:30.3749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rlhv28Wgy3QKvKde5NYS8sO2RcCR5qRLD+UI/rbTm18328qPRZ6Fcxn4GcHT9VF540DYFGhhevoQBnkpiabEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
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

On Thu, Jan 11, 2024 at 04:48:38PM +0100, Michal Wajdeczko wrote:
> Once GuC replied with GUC_HXG_TYPE_NO_RESPONSE_BUSY message then
> we may expect that only RESPONSE_SUCCESS or FAILURE message will
> be sent, anything else is a violation of the HXG protocol.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 6e73ebf67251..254c9d3c8c73 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -718,8 +718,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>  			     GUC_HXG_ORIGIN_GUC))
>  			goto proto;
> -		if (unlikely(ret))
> +		if (unlikely(ret)) {
> +			if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
> +			    GUC_HXG_TYPE_NO_RESPONSE_BUSY)
> +				goto proto;
>  			goto timeout;
> +		}
>  	}
>  
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
> 
> base-commit: 79184e72263e91528195db01783148435c7e4fad
> -- 
> 2.25.1
> 
