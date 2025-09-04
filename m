Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1375DCA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 15:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011E10E263;
	Thu,  4 Sep 2025 15:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCmEDk3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49EC10E263
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757001396; x=1788537396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QccDvV4EVtzU4XE4UzTBlWmpV/kSSpAFkkouIxAJkBs=;
 b=jCmEDk3hMDfd1E7vl2s95pjNH17ugL1xI61Z61ePRz1ZCYEzkO/9YUs8
 fx52+DMDgnTe5MOaq7FjAkA/j4ULJ0JZUcUiWteB7reMPqemXxtkfuZTH
 Yt9/Lueh3fdIOT2/hV7VfQyODc0qAlc+bEU3T4o/pOI7H5EvcS7Unei3o
 qQD87OyjZkvyMvjtyR4LrYGq28wPiP2TLz/aH9sjP+gX1zllK1qL1Soy1
 aq3DSTjwBuffs7vs8rly4ker3lch4cWfAde3iji3WwIkNAu7OfqwKPaNy
 06kwV3PbzaHY0Qm6gwdgadCqPYF/kDUJKUqxSC3Is///uB3rez+NSaEF9 A==;
X-CSE-ConnectionGUID: CdKoWAh1SuyC0ygTimtCvg==
X-CSE-MsgGUID: BPsvQOA6Qp6wg6HWXEgXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84775851"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="84775851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 08:56:35 -0700
X-CSE-ConnectionGUID: Dz66aSYSRLqz2BTMi0ZRGQ==
X-CSE-MsgGUID: mTnwdeUDS3OeJc8e7XDFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171216832"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 08:56:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:56:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 08:56:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4eXiVmkq/MqSo+sGB9sCZCNCkGnEs5O1pGkf+IroBAaEX6EK8XTqP9LK4yyn5TikOlfENy8a2hFbld/31V12epXOBLFsrLDh1TCHjGUC4d+g/K1Clo2U1IkIstkKr5zvyK40+8ohfT0blHtxL6jScqadD31OFuMl77tNXGZiibunq6jj3+hzrJVhWmZq32gEW8uJT/5KyyRB3omAbB4Z2wIOQD+/c4h5HTY+e0nHAEp3v76J8G1hT/EOhvBXwgC87b2iydl+0cxDmJSSpNHtZqtfSIdzxBn8vTT5IVQB3CG+AFHfENTliI0PBpTvS9UMIeNrG+rIHXRxrSYkubh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rHr6W8S7Ud2WglQyTf7k5n7lEQTyFvgoTMfmFte9Ws=;
 b=zKQ5ZLOG6Ngse8Qt87xTlvf1odvqS/RRu3hfIM3lYel1wA4FELhGfFyT+Z659rF+GvOVe5h9kFc/laxxdwMLs0Y9dKky2fzRSClqdrdeok3/cHWaf4VNjvqw9dbWdQOC/uNLCAwETlpegKqXJQhU5ejsePot48pOD7acnNeCqKMZBmieUhYgN0d+fR2o/QQskNL9P43JA7Gyw2H4kGarsv5e4e/7DYhUsOVeFNaYDJX/CJLs1/NzEcHt95n5xDMLZ/dlKc1364EELcyMERi6OS/qxgeM0kujP2VW6va937NWoeNUhC3OWf2vb5mYDIVsu4Lx80gcysTYSdY3KRxoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 4 Sep
 2025 15:56:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 15:56:31 +0000
Date: Thu, 4 Sep 2025 10:56:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/configfs: Don't touch survivability_mode
 on fini
Message-ID: <7nxfcp73dubr5q5522b5xwcr2zxdnudwo5dwzxm2xfvhuztpr5@n5xck4k6chik>
References: <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <20250904103521.7130-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250904103521.7130-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: c5488ac2-69b2-4758-4e61-08ddebcb9dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eZAMFLIY+iualwCCij/x22MKOcdpFs+AY7fhyQP97DZC7CuHOS0k+ydzyT51?=
 =?us-ascii?Q?6Jdx4XDXxiUimhGoXNqpes6bAg/WCiul+bfse+hCMW9KRj22JXewE+Lt7BLT?=
 =?us-ascii?Q?97eFygDA+Jlddf+km0WrhnmuXYknykn0JgMdSMPqhNUG5EYMWt7RX+6lozVF?=
 =?us-ascii?Q?04yuHAcLHj8P8rx9qOrSVx45bNbnbjFiKNmX7UTZXx4IKb+J4dV0nwSpH2mp?=
 =?us-ascii?Q?ivklkATCJsdcKkOIY6sdQ10QXlrtaY4GjAParBp07+WFPk5xuJ20LbXzQ/Mo?=
 =?us-ascii?Q?bazwG3Ok0EWx5Gkgntz+1zbGHdkGxz+Q9yU7DonnlYOOLDlLomuyxO7rIED5?=
 =?us-ascii?Q?FcYCsLLJ+d/mIKL7bmPFrm9JrGUzkCMLPdLwtKEOm34vxw5YmXignKO09lC2?=
 =?us-ascii?Q?gKkXebbv+QFQk+tDYRz8+PW7a02tWtlGAWg8X45qCwZ0HRQEwtGGkN931A24?=
 =?us-ascii?Q?Emzpi88ljlrr7mzUGJ6htrtotjRWg+Sv/kl0Y6Kt6G7JFLHkrSAASqz7HRav?=
 =?us-ascii?Q?tGicX4tKd5jsWWwCi+zAobiHUJRgMUz0Q2Ek/tTf/R7Vc7sOCJPwM9Q5HnAJ?=
 =?us-ascii?Q?3W7V+gSeOM6CKc4/br1utauZBQpvK8h1RLc6byz3BSRFBtxeCMSbhqMYSM3A?=
 =?us-ascii?Q?0TO14GZOTJApeYfM4xOio3OwC0HMdRKrxpdoqUToPy645X2VeeVl6nhnzq+0?=
 =?us-ascii?Q?BHSaO7YpE8kBDyZ0uODuq5JFtDxX7nV3sijJcEU6JxAZ+32x5krg8BaD8PrI?=
 =?us-ascii?Q?8G43jWDb/db519fzgMZWKVqFpuEmxjt0M7aPZkRg4fIAoWlr6OkXO6vCYUUv?=
 =?us-ascii?Q?qBhNg62J4NF2P6cFd02uLFMob66B6QD8d1pc712j0UolqNNOVo5XaB0TPxTT?=
 =?us-ascii?Q?du9heJbeVUP8iIbE4xD6QjT/iRmErBpjiWXBMt69dChFx3Jp/PvlYdT+BV72?=
 =?us-ascii?Q?fKWG47QjCZ7VHg4orz8PJQepjE0TsEGgmqT5HDStFoyqZ5Ut2FjNqql2J8Xq?=
 =?us-ascii?Q?s24BdPLmp4hc5mDOcV12rwMFnVtzZtZ6nZ/G7UMkY9pSPqzqKDi1e/W7FVFF?=
 =?us-ascii?Q?Xt6yT35weVwhS91QaXzWLhOJH6MLzXpT6dSOgMyFhOiur7hQTQnN2O0tFVxj?=
 =?us-ascii?Q?pOfPfUiiwsGMRDjMnpeIOKZezPt1y6ah0Rt+JcFOzT3YsAnnoezc08b5H+lu?=
 =?us-ascii?Q?5sSrciIGCVr0ADHQByTyl7i4P9xb0FFIbFXBMjNi8T9r+CT3DD4+YuSHEb7a?=
 =?us-ascii?Q?m7MZc+Gzn83HfaylSCCvpAbZNg9zGV3t1aGEEgJWz20/Udz9FOq5km3SmUOs?=
 =?us-ascii?Q?xegdZ3BetHrlyE0JBJJbfgb2t2EqJnu+YCPFzcFa2KhsjymgPc2VY0GFzwwc?=
 =?us-ascii?Q?/JDpcRLlcIMV11N9VnevoFOM+9U+5/ATubzlCHaVSlQFQfb6x5PSLE+8fS9M?=
 =?us-ascii?Q?CGvYetxV19E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WByFASmmrJon1dK28QI4sFkjZsFyQXZeHzzrfOkFkj/q6ymKZWF199m6TdJj?=
 =?us-ascii?Q?Wdpb7zgzcAHuOqBxKkax+vfw5UpbGMTbLU4vCAfwYI4OBIbzcX/g/mqiEtGr?=
 =?us-ascii?Q?vrWOO7VsDWzndsMpZYNw+A6jfT5bbbrocwbXQnGtsORWn0qBkgiy1iOhllWg?=
 =?us-ascii?Q?bI8DVRKaV0MKA1zCnWKRScwKfNH1/G9B10ptmgEMlSlyth87rEfTCkGteWOK?=
 =?us-ascii?Q?TrhsK3Mi667whvTB1DF7NXBbrrQ9Xse5OLdNrYvD/sS7n65B9z3qr+fMibOO?=
 =?us-ascii?Q?cbhnqOsjLNtpWFaARKFr22/I6YDsb/TDAQnXo/EEd/Ni2KJGeTSNTXGzL829?=
 =?us-ascii?Q?WjULtwB54pf1inSeNYPNAJqsSgPZhWZPHEwxgAtvZuJzf86RSyCJ2so/ZlH/?=
 =?us-ascii?Q?sgx5GrsREo6DIibPqJb59KmE6pHo+YPUy2FN+RSmmFsAciCdDLSSkIfwe7ir?=
 =?us-ascii?Q?wuTmfGOQlkA7FrLXf0zChj7dWwKksBLci5POfTwysrPEuWgENGudvFeHRvXM?=
 =?us-ascii?Q?WE7dGF0/RdOYLAPC5oll96ws6Au4ywg512vhKL7ontYnc1aW2XIWzmbr4sqM?=
 =?us-ascii?Q?YHrZDOOyTVv4I/D6C8KoFnBo3GtwNYWjZHAalQUovhTZp8LP8K3Zc6DLtuMF?=
 =?us-ascii?Q?4jiiHM5rRxilwx9kM+cLK92aAazp8QdFOMu+drk95qM7vwvxeV8w3kpfHwE8?=
 =?us-ascii?Q?YC7hgWwEWm4aqHJpeMcwHoP1J6PEH0uh/ulxMmsa2qx5id1fr7TMNmYPtjtY?=
 =?us-ascii?Q?faQZAi81lvk8RzRM2VPmV11UptClce/Rv1QtRdx71CXPy5lvwncl9uJ94nmk?=
 =?us-ascii?Q?oyfU/GsOjPF9BDfeBKjFsUUG5jCAQdeXXngvh2+h35nLq7ltEHCZQ1wg/zwq?=
 =?us-ascii?Q?LDSlSy28R3AbBOS5Jl8l+m/09xxSCkd76hati7fkEHpCoVTSwJcXMmbXBFb/?=
 =?us-ascii?Q?sfiB1bJW+iZd4SB0qJCrMMcqbLrNQOQqX0m/aLEWvfJ9syY1Wzg4Ji1vRYH8?=
 =?us-ascii?Q?378aa280rmsYvjtPsRSD3cKc0yi1UWhHwHrg70UoNur0/junVETEqzs3JUi1?=
 =?us-ascii?Q?DD+4IwB1ORkRCeI7i9J9ck550LTr4sjCG6mlQMJlBTcTYa8XR5OntCu6Jriy?=
 =?us-ascii?Q?QuHVRY3kyiPP6HqwS8HyTwufx7YIGq89OKiq7mp+NTO38OZK0yAj90odF4cf?=
 =?us-ascii?Q?iR7wbHWguZZ1X7TXbLABLLBKIgOdOMAT7z/6i1/hpUrkNsp4bC4Wv6wBDQaE?=
 =?us-ascii?Q?kOJ2quDg5xEMZZ4wGoCHEMdD6JZChr0FP+RQqiYGTCvA0rD2qyx300oQySpR?=
 =?us-ascii?Q?G/Gf7cbekRnlKQ9HnbEj2wri6U3shaoPcvp4D301XX+8ZnbwaZihMa/QAKNY?=
 =?us-ascii?Q?4zzKPSO8wyppJI6YfZhECvPoHMpodb4Wpesu2pL+hRSwiV53b2aSzGfvmbch?=
 =?us-ascii?Q?+1VAi9zXLHOKomhrFPgSTcs7t+D/mYMWgXO2lPHIKXua3UqYVTCSDBzlOBIi?=
 =?us-ascii?Q?8nTjS3cJrtxiA6YlxdTSaE1ji412bVT8ZU+6tYuD/BqSZn/iDticvcdqAigW?=
 =?us-ascii?Q?3Lgpl65ox7PwKtJQoU1z5ycT2MN6hUkcvk6kY+Yk+CGtgSeI0Sf/weIBjCbj?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5488ac2-69b2-4758-4e61-08ddebcb9dbb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 15:56:31.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05wwhbIb6CLTeI+HxOzn85bPf8DfyE07MJyBoq+TJCR4+72lk9wmA9vC6h/mnKu5oIWsuPUbA5hsVqRX5KbiA4GFGuVngosMF3d7o+kPjUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
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

On Thu, Sep 04, 2025 at 12:35:21PM +0200, Michal Wajdeczko wrote:
>This is a user controlled configfs attribute, we should not
>modify that outside the configfs attr.store() implementation.
>
>Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: add Fixes tag (Lucas) and update the doc (Riana)
>---
> drivers/gpu/drm/xe/xe_survivability_mode.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index 53c5af4b810c..7999cc5262a5 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -44,6 +44,8 @@
>  *
>  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>  *
>+ * It is the responsibility of the user to clear the mode once firmware flash is complete.
>+ *
>  * Refer :ref:`xe_configfs` for more details on how to use configfs
>  *
>  * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
>@@ -180,7 +182,6 @@ static void xe_survivability_mode_fini(void *arg)
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct device *dev = &pdev->dev;
>
>-	xe_configfs_clear_survivability_mode(pdev);
> 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> }
>
>-- 
>2.47.1
>
