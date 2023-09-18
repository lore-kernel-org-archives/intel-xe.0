Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC0CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 04:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2569210E0AB;
	Mon, 18 Sep 2023 04:54:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0910E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695012864; x=1726548864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Eo5OjShL38rgUVotCaY+jblz4oq4FPT04X+nrK9jbq0=;
 b=V69tTdfk98Me1DayyJZdvXijLrXnQ43MBePlScq0qoKKmkvVLJCaf+YS
 LYJ/03CBUll0zxKL8CEtQQKOxtJSqTvzw2nqgJmrPQyIS5/oKmY+nfjLe
 5znJOp8N4Yyh2KCpTCliUUc1b78FyGBpcQM6d5EmSwHD3vLh7fzJfLhHi
 Cn4aShyCtePDzfQ5I4bsnZVDdFoBiF+kREmGwmUsTmFr4cNPu852vwenI
 cUY8Ps+9i+thDqSdhQycFOkWnFBs34IpDomCN4851ozwGANf63ZPfeyy1
 /DnacagMIlGinjz/q/BIEoTWyiegiJtxYRBUtzedz2TCw6cdwt0Rs3gI3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359818634"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="359818634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 21:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="919327145"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="919327145"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 21:54:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:54:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:54:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 21:54:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 21:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRDpdiW13tuYhaAL+dmkib1JQmi5AM/40zKpAE38jFYitA2kjtp24KvOSXGsN5b2oUm2IUG9YF4QTeHujkGPxny3otc81r2KsCc1IF9HEjKimAXC+foZwbmUkoeGvaPMgHjJTPmeBp5I9dOEZjf/p4UFJI0RWihcpf6KXrMEV2bVkgNZWYAonlgmXcYhMWiJ5+Gy6oxAh/VKystbrBn0o7NqoeaGNj4QZ9qjPAU0qiIfacV8ukwA8kuNCQA26TKtVCbfMnM+MtM3a4VojIOu6VvnlpmW2OIDJsPhEjCXyxfVDyg5UUEPSvTLg9AR7sjoctPqnnTKIPuh0QipIOl9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jjb5Dv9EaEZjcmz27j7czWw1f9IX4h0fkY+Wkjl0Iw=;
 b=JWdc6lcLUQiC6qiY0GD+Qyr7R7N5pmwzfUTe8eBsNJx/GtaB5HKlYT/DIhSysRs0gSDA8ulDTWFfXrETgsSuZeMOyGC83bWjrQIk9MkpmGKpw23vhxXPuVggDLfp+zT3vGfLe4FE+t65b3zNSQyK/6gvgrO0ouiItZRNRE8Q+fYObtooSI25d9Wb8sXQLMHPMw46UOnJQDy+fIqO1VttAUTR5b6zhBHXCF8SWMBMPQZ50f6AQ3aWDviW++r1xuP5hW8Ms7RMpQhv4tzFGyvK4swfJGLa0Yg4ENsE09o7H9llseO7h41mJbwmngkqM5tcI2JQ5mA6ldnpqC1fRaVsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 04:54:20 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 04:54:20 +0000
Date: Sun, 17 Sep 2023 21:54:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQfX+XJ7ylgapgV6@nvishwa1-DESK>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <20230915233445.2241554-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915233445.2241554-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 157d00e2-68db-4e1b-86cb-08dbb8035213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yaAOrFNrz/nsSuguJz+apc8vbiWKwerrx7jFgHXwTEzEtw00iZgWKLtogntL9nHditGh/L06qjRpuNMjKdvE/bwJmrUbiFl64jTCQS9ir6yr8V3m67u+xUyEQEJ5aodLFgmaVYyVO2+QzNY7if1W3aFnnPy0KXo6JkH3Fkh5RJum8siFtazStu6tg1z6bUttOFK28fuMACqDylScmL+QQ8GW2Y6CLAv2iQfDpGWxkMljGimSg1YNBUXTGPuYAensN3sd7M9lw4LWet7D70boRkTzgyudMtNKT2jyBOIuSPURzkxjdqobRWkTWV2ML+marX8e/RRpA5DABE9gEbK71JyKSiuR9PkQG0tGiZQ5sx5hwstPbhl2H4yVphnAp0gGfjfJAuw34z7KtMDM/3HAZVPHdi/tNSfrTUR7UMmZB6JCw60CF2C8TO244Eb6j+zkp5+a6WKtReURAEnzWaL9wb8fZBic+8514lHF7Qp5iqMZaytwaIybfyLcslTO2cHeXUql8BMD+iHHB31YpvpBPJ+v62cLiaxnUopXtgjSG569QTx0aM01QfxLccsUq1J89Xc+bTLUN/5alqyp9lkdcu8mHXQKF8cO4wb7vkBZvfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(5660300002)(8676002)(6862004)(4326008)(6636002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66556008)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXqp6vA1td5EWZ+iiNppLXHid6qPAsNEHQNmNoESs+TZqsxmZyDzcTncHEeK?=
 =?us-ascii?Q?hX9jt+xkfa4agBC710rdxUcEpu+Pp10OkYjE/CyLu7ZDDXtDNmx00x+wX0og?=
 =?us-ascii?Q?TE1d4YERummM46bq6kCetH9R/0q8lyaelpKiDzcy2Cmm49DO/tOILgmQuXa1?=
 =?us-ascii?Q?kXHKbYEuwyaJAHX7VCqSs084R3d8lw6z3NtVw/2+vPsfYP9zO9vo3fY1Maho?=
 =?us-ascii?Q?1l1A/IGMV53ZrStKJD9P+4q/wE7sy1t6RaHULAnxyqg0YKdVAjrSrxYfgO1W?=
 =?us-ascii?Q?zXgvGvT1LpG7d02ZNijWlE11fhBN5VEXt1+BSFXniyjjgJ8yyatUVSHwuR7t?=
 =?us-ascii?Q?7Te9dLJ8QRAC5mZNXTldH6igDfwiDg8ZYJiO0ruMpzAUZAb6TLvjRhNGUho2?=
 =?us-ascii?Q?1XXPEedxV+5eL0m1LtNHE7KRtKTr/U3AjBuRyU1WxsZiywkEgWLA0brjTQv/?=
 =?us-ascii?Q?/boplOnCFL0sA4ElNnlW132ODN2FDu26EK4U9AUQBgievmzElxHbpGQYb6gr?=
 =?us-ascii?Q?Ws5tsROecwrWodqalF2RUHvpDNOxTectJuW8MXSPoYVLjvdKX6ivziZG5BZz?=
 =?us-ascii?Q?Pu/1fM6LxXntENUufSeFSS9/1GtixUNmCq8ly7yd29RACTQSKVXg3cmVMq3t?=
 =?us-ascii?Q?U56WhFjF2JSkuB8TmkAjY6JkGJJ7PRJA4wTAbx7Llbi55yF8cdpOTwVxAa1o?=
 =?us-ascii?Q?e7c1ATy8ZV2hRhO+bZzWo3FWOzW795aNam2Y+wzxev+AQwUiU/m/QiOQlmlh?=
 =?us-ascii?Q?fggHeWBHZjaRmD2ImHTsA13F/uhYgjJc5/ETf1AI54mBc1esXMxo0O5IdTtM?=
 =?us-ascii?Q?/SOZvMrImX4F2NCRTy9SDv93M29sXkcm7d7T/QZTvy03qX9BDU1l00dSR5TO?=
 =?us-ascii?Q?YyX/tSfzC6hU1SsMJ2gEhjAfTiA1gnhLGlDu1mD6BcN5h8UZT6nhl2TyM970?=
 =?us-ascii?Q?QIoAlP/hQkbr22vRz0qI369QvUo6KlNkzBR6gfvYB6Lj1EnkAKH8opmqOutm?=
 =?us-ascii?Q?fKy1VhCOqLnpi9Ve5BmMUZUIRgO4FrMuTPxUTzBFpUElR2KDN/DK7zwESd0u?=
 =?us-ascii?Q?sMEq6ai7hoIUBx0Q0hcarhgG56Bq9EATG5ljKZG5zCJvrEHLizup/YDwipBj?=
 =?us-ascii?Q?aAAJRRjPapZuJudOaTVD7quyBsk6b4leSdOVzhPv4zgbNKrHAJa6vOQlj8BY?=
 =?us-ascii?Q?MXdH4NuKn1KcMZn9aipihZZCXpeObzkQjFeAyGCQhqVnHtAddFvnaelyCPvj?=
 =?us-ascii?Q?lVF8r0qLGNCVML0uDMZ7fIRgJ+8UJbwGOMZBe0jwNw56fQ83qXeYXxYF42B9?=
 =?us-ascii?Q?bzKCJjV2Rp9DMpL+RJfnUu5nhdjORjUcibfCv/Wvg4C6T/xIva/Tk4WNxnqp?=
 =?us-ascii?Q?nrzKM0wFvE5CCIH99ogAW97yQ2Souyg9Vt2Q57PeAkCNRCFK/5ApcOhdqFBy?=
 =?us-ascii?Q?T1RtQGCvMAKMwpusiBEsueZBmnVwGhF2z0UnmA6dAajqUwYWQd6t7h+4/QeX?=
 =?us-ascii?Q?g24bJC0cxGGuQiHFQxdgR68UQsPPy5sAxmT/3x7x2vpw3OWlFtqdfztiDsZH?=
 =?us-ascii?Q?ga3HL0e9ntVGcTblcIAIQIT3V56wyOjzc7RWuhbl1twSUFAJtIBaIx1RBxAv?=
 =?us-ascii?Q?IYM669Ajdy/LFtz/maUZ+Xg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 157d00e2-68db-4e1b-86cb-08dbb8035213
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 04:54:20.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maVZKLCvO1g9zpV74UoAgtgooxpB4AdqnAZquxhp3XcPs99guTbyJFbqegb0uh/IdhdbWkK3eg7Z1P7ilLZtEGMY78dtDsqT3YU+DUjL7ySVfDwKDdzIPShy/USpwEbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/4] drm/xe: Fix xe_exec_queue_is_idle for
 parallel exec queues
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

On Fri, Sep 15, 2023 at 04:34:42PM -0700, Matthew Brost wrote:
>Last little piece to support parallel exec queue is compute mode.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 6725157d8c1d..eee64ba87d50 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -867,8 +867,17 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
>  */
> bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> {
>-	if (XE_WARN_ON(xe_exec_queue_is_parallel(q)))
>-		return false;
>+	if (xe_exec_queue_is_parallel(q)) {
>+		int i;
>+
>+		for (i = 0; i < q->width; ++i) {
>+			if (xe_lrc_seqno(&q->lrc[i]) !=
>+			    q->lrc[i].fence_ctx.next_seqno - 1)
>+				return false;
>+		}
>+
>+		return true;
>+	}
>
> 	return xe_lrc_seqno(&q->lrc[0]) ==
> 		q->lrc[0].fence_ctx.next_seqno - 1;

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-- 
>2.34.1
>
