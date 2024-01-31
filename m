Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AD3C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 21:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084F810FABF;
	Wed, 31 Jan 2024 21:56:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152D10FAD5
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706738205; x=1738274205;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0/tfEbjIuPOQvt3F/Cflaw6aNuCoFwJnqPRiK4Ik3VA=;
 b=fKU9Mr7QA9C2tDwjQV4JmRMexhoZxh4Ye3mZAIBdDuG1WL1ItZfhA4fj
 k3g5j4Em9hMsOzMQfE4vwSFk5XmtkNQc8YDnLEjtLY3hdA1NWFqeoVS/f
 elo30VMS3iT/AWdMKVWxjzJ4wxJIeZFp12cnUvdi5OqgEFZ+Ta3/yFrCG
 KSKDGB1f/zaHcFCFCLaF/3oHc1L0n32HeHsFK+3a/Wv6ClXAjJKKqH7/F
 V1yyXqpcbUgL+CZmD3Fp9v592Xu7k0X+5ox8XORq8LfeA6hG9sKM/CdXp
 f6F/7hkn+Dd31Bnr0Tmyq90yPY+yBbv5pG8NwhJ/YWc7/4fMRsFT9e1YY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10390792"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10390792"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 13:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878912336"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="878912336"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 13:56:44 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:56:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 13:56:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 13:56:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlaxT9hR26Az0PyrAkTQuLBL62eM+OpMND2JlSASqheqboBTY+tVZtOjeC12MRgu9lSxReHqK4VyRdC27cly7BAG95E/gUZMoScZi6NR6HmHlV7g/WUQE9D8Ru+gPFT5bg05DAXpimkpjVz62Tf/C7WFh+3CUYO7czKgRFbvI1+dYKeoIBWGzzUgs9RiexsHpym4E7hjpEh2/pJ2wEo2H26lGS8d0Z+MWdCKqeeNt3+HT/eJT8Pzd2/p7IY5+YhHK92ZB6XI4Qxp3w6yznesHSv/ztFZZ4jqxPwQBOgm+K3z5EKcCSi6JrzOuf5biSSLmr1VXZeQ3x1R71s/gNWHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uiq84ih3gLEWO1RUOn0B8bzhzFY8uc96cFitFS/Xu1I=;
 b=bNtWwjeY8NSH7wkMheWDvJ00ja1OQ2G2d0bjaMv5J0rdXuAl9OyLvTNY0rhaVlD4LKaipfARnE+RKEqkBF5Z6cJbjeXT5TMhukkMJNEVeY+sMwmpkOpF9u3U/bM/gzmmfILmPcZ3r3byVi10ePCRJPrWREJ7fzNxHIKzYPgIAt44eeO5HTZ0/+38HRjiSfqCw7VYH3BZmZtVXqtE+OaDY1dIOjzZGyVH1sYVIoaKx8EB7IBAN05f3JdVeVku80/9QRGfWLgeWWoqvRcGekAY5RIsCQAy1JpZQPoO4MKF6+DrzF9N3PklNgIGqtR3gWY8CWbmgTQ/lL0E0VLaza8wBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 21:56:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 21:56:40 +0000
Date: Wed, 31 Jan 2024 16:56:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
Message-ID: <ZbrCFRpGA3WmZNit@intel.com>
References: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
 <m3dktl4dhsaz6doivscmbmlohgwpwrsp2r4h77jysm23ltptla@zvxbcxzhvyob>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3dktl4dhsaz6doivscmbmlohgwpwrsp2r4h77jysm23ltptla@zvxbcxzhvyob>
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8c319d-d7f6-4428-7b1d-08dc22a78160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGpzbBWO+bkjPCw90v+dhUjdI5NAMCV9bOyy9SXIN1ARZkXoCq48N8xwK3jJIHNwe+ciCaq2nbiP1VrBso3nBQ4AE79F+C3LjofCEML7c8+S1dxoJn7EhkscFJk3Sj0ZvGwvy+vcG9qB99VtPUUSJGD2895MKtGQrp4+TX4aZkhU6gaOr6nObBOY+nfeyPcTWKfjPig/HXkW8o4UWv92GMlOAnOMwbSRK4fRngZkdKW8akn8WTXWTzXyy5zHxYHKPp7FMPnONNvHswPxqQcI7nnewNCnnoBo9bjGtXAuRS6q6HgvwAew6zstR+VOz9TU1NSOOVH9ny3ZYxmLbCC0tKav1BlQRQx3ttPbK7aM4pnN8azZEBaK6IzcIW1d+4nQXofIOTUnBfo9NG4BBE9fvnkuw/6gtN0pIp7aKMq1P1IJeXkMvm9U7lckQuZqM0VpQWm/eHpLEjrrqKZoG1zFJqPHgD9bZRe5F24dPdBlEttfHcRDF0JxnBbJlB+xBKpS0AJKlF39KPcXFd4xOcwGV8aKutaMBaAcFzp0W3dAU0oWaPmgadfj6lxcPH5UU3sl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2616005)(26005)(41300700001)(6486002)(316002)(6636002)(36756003)(478600001)(6506007)(6666004)(37006003)(38100700002)(6512007)(82960400001)(54906003)(86362001)(66946007)(2906002)(5660300002)(66476007)(66556008)(8936002)(6862004)(8676002)(44832011)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tbg2cLWiOIwl6nGn9UNvS6UhsU8vS80LjrT5iZQL9ZqJB/gUjaV9djdpfd?=
 =?iso-8859-1?Q?RydJpTU7SaFvfkagHGPNr1Tjg+UQz3yK7HbO9qsDpvJkVGx9THH9vXkW18?=
 =?iso-8859-1?Q?IAmSPsDSowLEvpbexFORLFJP0ytQi0BRQHd95O/qnN5ju3wGfI+tHz4gSs?=
 =?iso-8859-1?Q?SMXWkyoCMW7Z6TOT8rDiB8vzTLOKlPpkUlV2ahp6s/DjOQZdbv9tdc4ClJ?=
 =?iso-8859-1?Q?izzKYaAzLBftd1EubHTCiN9ZsgJdP6K0jsWZkYcaxIns86M0givkSAiKGz?=
 =?iso-8859-1?Q?pq8mcu3XMvkE7uYXw4RX/Pmq1/BcDl26x3XxpTC5Wuc8AnKEsPNCy19x3D?=
 =?iso-8859-1?Q?T9QnHDyJVhx2saQuyCzHN+JDzjBorxXJ+ABnBWrXkms41UJnMKgFUk9Cip?=
 =?iso-8859-1?Q?AvC9J3XtMxomvEt1EGwIGldDSjdVHxnGpgfKxi1Ieq3GK8+VJYQXM+ro16?=
 =?iso-8859-1?Q?Klqz+n+XEYy3JLj4wChAUfZvKdKPIAaVyUzPv2yOCmCu7il9JysEJcblM8?=
 =?iso-8859-1?Q?N8PHKB3cvSXoqMXEokb8dUrg2u4I8t//Z5eQZFKAKCEx/f3B9lxi/NOLln?=
 =?iso-8859-1?Q?ETwWvTdoCJkKC9j74y4Ch/w+2i659H246wmcE3drCJtCHXspRfZhhuY5KX?=
 =?iso-8859-1?Q?i7LobVIcKURjjdTMosDP+RSQAFdkqW3SS//vHjg7AU84M+gEioidk+31Ib?=
 =?iso-8859-1?Q?wp5IVhEow+qXepH/V1SJBsGtGFcTLQ/ZUxwNRzAG2z0v9f7wkOwJBiTc4R?=
 =?iso-8859-1?Q?gINE7n2JWVa9Z8gg46w8+TGLhR8qIxVVSmGM6RCfWv0KubbdbRylsNhjkl?=
 =?iso-8859-1?Q?WPtIldavOrYIrzQpb4S5aHdbCvHQsP1Q2nJvetXGBhX1eDANdt8bGd6bTH?=
 =?iso-8859-1?Q?WhIKGHrm/avpl16NjqpavckcpCYOzAMLi3KuOy1Q/bE192wNmQZhkFGVFP?=
 =?iso-8859-1?Q?m1jkAsWvi1Bt21nkgjJ500sSGpGU11frSrJKjw53ZpU+mvXyEZ9E/7fl5n?=
 =?iso-8859-1?Q?Ht44crSAoYJ7wgw0pD8l0OukBnjiGthCZkaBosyK+5FlX5Gk9YuUetFjp8?=
 =?iso-8859-1?Q?BUkRRPmUNGj1WDmYqNt64Wct128210YZbfylTFwWWruXVJggGBgSzs54f2?=
 =?iso-8859-1?Q?ZeodvdHNWm0m7FME7EDHwxONl+kzn4GdaeHrqKfRm3yYOnKyc679iRB/Un?=
 =?iso-8859-1?Q?8SbkyuFs0Xumz8//eXvcZr1r97rq3HoYZ0jNS562qOw8vZDMfNkruCIcee?=
 =?iso-8859-1?Q?DqDfLWDswU/ClR6kTAUJuXtu6EB8vCrq7sgV6mj0NzIT3epXwlCGD2ROJ5?=
 =?iso-8859-1?Q?rN1e40ZD6QoW1y8t4otwcvdCc3IoM7HIBZsnI7HDD+txllpeTfGBX43ihu?=
 =?iso-8859-1?Q?kpRlCGzzMrhcznuTLtYD0aX7AK9wgWehjpmuk5tTyCE/+EHzDIR32PN3r7?=
 =?iso-8859-1?Q?vvjXnLulLVEuOJpGHoICwClQTfb20qlDdToH5iVXkQ21yyTpI8kCGknxkE?=
 =?iso-8859-1?Q?rejCIiaqaGEQqhhD51seFKS/3N3NYQxb1kt25DLnlt9uObW8KCqzzrEXms?=
 =?iso-8859-1?Q?msh/2k1byITWzlpdtcX+OBfJDqrv1FM2IyzwFsmxeW8LCfByN4WSnw5orl?=
 =?iso-8859-1?Q?KX9kKQRfn/LFeXjwqAYlC5t7ukDL5ifSRssL9McLo0Cagdz3otBb1kRw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8c319d-d7f6-4428-7b1d-08dc22a78160
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 21:56:40.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbwLJjchGIUv2F/nTHvJbfSQu7fDW0+lO/qxrVOievumc/QH+PFsdXhTET5ZMOfZdU4gVQhYVSBzAUVUl1LNOw==
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 08:24:07AM -0600, Lucas De Marchi wrote:
> On Tue, Jan 30, 2024 at 01:52:20PM +0100, Thomas Hellström wrote:
> > Persistent exec_queues delays explicit destruction of exec_queues
> > until they are done executing, but destruction on process exit
> > is still immediate. It turns out no UMD is relying on this
> > functionality, so remove it. If there turns out to be a use-case
> > in the future, let's re-add.
> > 
> > Persistent exec_queues were never used for LR VMs
> > 
> > Open: Should we renumber the exec_queue properties, or leave a hole
> > as in this patch.
> 
> I think it's fine to leave a hole
> 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 50bbea0992d9..4124284e4cce 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1045,7 +1045,7 @@ struct drm_xe_exec_queue_create {
> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> > +#define   DRM_XE_EXEC_QUEUE_SET_UNUSED_1		        3
> 
> but I don't think we should add this define here. We could eventually
> just use this whole.

Leave the hole and the define and then add checks to refuse the ioctl
if this property number is selected.

> 
> 
> 
> Lucas De Marchi
