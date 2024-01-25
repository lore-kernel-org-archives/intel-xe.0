Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A240C48260
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FA610E6BD;
	Thu, 25 Jan 2024 16:36:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8856E10E6BD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706200601; x=1737736601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=60DL036eaRlLY/fv/R6R0Cux+BnD1cRRmW0P9H1VN2E=;
 b=K+hp6Dl6t1FolZrpm0WjuXK3srBEkfYkziLY3M8Xzp8dintOawAtvR12
 N29b29NqAAVN+aYCyM0ABuCifTGjKpzdZkKHOrXXMExtXTWKsCixvf6YP
 ajVHo4MGoSy4NfLWtgbXJzIrJYCr6couhGRStfmtoh9Fqy02PYPhX2ck/
 8uoqWGGLa5yYwPPzSgeeDIeZMXVT9lhnvqxpWuMPq8LYj45q9wfVxxQrD
 guNBEi2PHVhEIJ2ZanYuvNjyI++578Nue8sBx/R07QaCzbShbNYNb8k/N
 tTa0zhwSyJFqW/R8LYimtEtveJuuDeW8D9IRPOLERm5dJsAqWOpLB4zXK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9594730"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9594730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35154878"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 08:36:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 08:36:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 08:36:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 08:36:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq9tzqcKKOJq7Yxo7C/HQ9V5u0HTg5dCL87vp6z+RLXW5ku7qH1nywSvxacQZ+LnZ+gY3NFYrsh6XHqbO6hSat5cyMGozCFfuWg/2EqkIZr1FLg08sSabWdsE8VawGl8dlvUOdyByqQEF+UA5O+q4U2IfzqtOLPRVsfHG9YQJ+7s9sTd4xmFuL4OPjmi+xbkMa0h0eNVy/KDBUZT2fmaDZ9AqEntvmluJXTXzFAkjCMc2LhQ2eXbdS/zDNW98kCwMckrJ/+lqh/e8lvBjOe2SNiceWmtZXh62NuwvdJxIB1clUBWT28STvDizDI/LLwLxw+wYdQ6W1iOOQfrlISSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA6KnEDKFpot5gaf2XKWKC+ajxpHpWxa8K2CGuO8j70=;
 b=ByTjC74aU7W0oSG/duTGbZUMZSYndAEZ2iwsqmvezbaNG4ijgrEMxUTAg+2zHTAZt2c4T6GNBUyGJCe5DYH43zCD/pQvhVQtM3/vULaTckP2f24eRhoNw4VuTsxboJDApZ4baF967e94lywOzGn9TWtLKnFuzUpkf/9Px4/8lZgyTf3KMQf50JlVYQDQYtIwuCgnDlDoS2de/XI5eMtssrtHeYgDCJ4qJE1AuITpq3p2+4JnDMw99MXO1Gtx03Hz+RX03DX6WOPVbS3ZtOASQm591m/RV8kHo8/+ud9jA6Ca0IlqAoVey+ZqQkxvlQfwD2VXGM3JQky8EJPckFnyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Thu, 25 Jan
 2024 16:36:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 16:36:36 +0000
Date: Thu, 25 Jan 2024 10:36:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Message-ID: <qb7kexb32pyvxdjjm4tvlmsrpfg4e5mxnfxtmuphe27j75adfz@4y24lmzdbdjy>
References: <20240125154647.3743708-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240125154647.3743708-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b0534d-ab6a-472f-8aa7-08dc1dc3cc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibhnALdYNrdT67vKFNclL59WffrL66BrvFezkFPJRKGxtoFLWfI44R42Nc+pe0t4e2wzGDfPTjS5yYZx2IGGa5QY7K+mRsNr95ETLP1yanUKlNqo5rnA4viatPItqnPtP/0fFAskiJU3Ry9p+6sY6VZVUWn5vNqs6yvAN6500a5zgjJUSdCOlp+HSevkhU76REBexkjqOf/sFU5FNGPIY//FjHfvi66D25HasmZ6W0B6fftcfo1b87SPLs5k4pO+bQFwAw0F9qd4CQI7hqzVE5klM5lSe17SuzUHfd2uDW2SCawITo8xFsBqdyWyRhbsiESuXw1oI3zb7+iXMayfjNYFi8fQCfoGFx9UXf63pgqUxTMtcqD4loDNbd8tW7sWFzZhTY0Mz3nB6f4mMtalRED1mZdzBK7I7/EE8fTAcHS1WrVUEyIm/NJx/MKJUoNogXmpRS1b4AqWBaCJUc4Y8zOzbSuNMzz4Akh6WdeYtt6Km9c53P/tsVhJL8IeO5old9Z2n5LaZI9sfL/6X8/uF4FE6N1ztRPVEvqRXr8RxotFZav+dO2hXjPGubIFOxDjI1WbrbaxXFtD18DzmQW3PGUnn191DUuDcdv7wGJsg8/cL/+mZCTaZl/HCuFsEegQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(186009)(451199024)(107886003)(6512007)(6486002)(6862004)(8676002)(8936002)(4326008)(2906002)(5660300002)(316002)(86362001)(66476007)(66946007)(66556008)(6636002)(6666004)(6506007)(82960400001)(38100700002)(9686003)(83380400001)(26005)(478600001)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZzAqnnEeUCeaXXmMQc9yPgNKLDwNin1evxAew+UrMfwZwSI9y9L5Ekw6yL4A?=
 =?us-ascii?Q?nz74vlFKb+0qARgLPC571ko9ZudUkYqdVJTiRAbFzYXLGK76ttU6xhUjneZ6?=
 =?us-ascii?Q?m4spQQ6M+06tyfXGzLbpJQKlnEwQa4cKDYsf8UmztAideLqbaWdmE+6QLfus?=
 =?us-ascii?Q?Ww6UrCnGkg38iCVGZ4dsZInVhNKWFJM5E+fPXuWJzz5GfxLfBYquJMZb4BgM?=
 =?us-ascii?Q?aiIgzyFkd0cTq4GCmLWo+b87baVfs+oBv+Yb4G/e4kez6gNcFFNWO/Yposth?=
 =?us-ascii?Q?mzk9uww0KG91ybJNe4xD01NY56nnghc44rmu61dCgUEM4/PmcC/ja3vgfe+N?=
 =?us-ascii?Q?RDUmUbGSrfSOoA47aGiwIQuk8j5VIihGjvTk9B+XU3H91pzV5ZlFFoEocQl5?=
 =?us-ascii?Q?Om65IogLdmFVKOzKJpeYjnEXIkKB9Show4OC9cWmyJVr2/t1JfZurT64+n2c?=
 =?us-ascii?Q?mwojIWUbPssbpdHp2ir08xXlide5qL7aRDhH7E8nN2PRv3tfUG8ZLNbArGO0?=
 =?us-ascii?Q?W3KCC7tJjapBUkgzwkis2wnyRQRdJw3sNmMADQQjz6jRy1VzRikvwqSQ19vG?=
 =?us-ascii?Q?UaA00Bskqy+pNaabmhjUrYfiaC820XUnWaMx1GSY02TvdKVaDp7NooKs7mBU?=
 =?us-ascii?Q?MS9w+E0T+n2T431L0JoLhFbvS1ezO8VoY43T+p7CAd0f0GKKla2H7f6xWoh9?=
 =?us-ascii?Q?t2Nob7TirtpuBpEg1y1GQ615IAl5K3Zob3CXCNxLGnZyxfl2GoYWxlxsa53w?=
 =?us-ascii?Q?XdUt2SULEd3byi9dgLprpqQ0ZXTDXEgeLV280b8zM0pysDwnrscee678ChGH?=
 =?us-ascii?Q?VXFWjB5S28nmw9OZ32EihFu0aEhbzOc4Lt0CsfuiyKcim5jTaBysNA0Pko8+?=
 =?us-ascii?Q?oHhNChResXBxuak6cxSvF1wisbWXrgnX4SbfIhOtR4bCtYaujTJRMwcnCztz?=
 =?us-ascii?Q?AzkSVcTsmNzTHbtEyPdEtyecH9cFfiMMSQNly8RSJwxlA7xoA20Zqzc2ZISf?=
 =?us-ascii?Q?MwfSZllx8Iz/pGgNCfEgxnZ8Ckx65BtXxWxfxNMdWt6UPlzHLZZZPRZpTZQd?=
 =?us-ascii?Q?iO6N6iY2iUh1IXHWdbrZhgaerl9eWU6LnxLSWTKGICaTRW6sZ0rvSSUZnSle?=
 =?us-ascii?Q?jcKPrTb7fHEu7E1ZwGsogr0CaqCY7Vh+49nfPZQEjrwHqvJO3yuvsC0ftRuY?=
 =?us-ascii?Q?tdcFJPwsikvwfPwQv3/wy1d9gEza/AGdilzoCHHN2LLkghHpkJ3MPR/R3FSh?=
 =?us-ascii?Q?yc7AHyOSMAzwS8Yddb4Rto0OGepMNp3YJeof0YRYxaEaPKGCXR21nymcrO5X?=
 =?us-ascii?Q?F9nJqpQkCE9gzsA1Wy97miSIxudbLhjSZZmNVr2u44r03qR5HL5KY/KmzI2j?=
 =?us-ascii?Q?NBMO9sdi7SQUK5HhgeiAsjiRhV9UJhO3CYk/SGaqHGy3jXx+qsjHoQRJuRBW?=
 =?us-ascii?Q?9KobxnOaX7fGSgNF934vquRPBOA8fGCymWm8rb/+NyzWavu8a3uIPQNOr6Pb?=
 =?us-ascii?Q?LVcKYRUyzH7cDXwxulKMdhlL+qDI6a6aeine9sXqJ1MWXT6Dpxry/g/Fyxpp?=
 =?us-ascii?Q?pEPpIn17l7JZok95lzEQ2DeJ3jIvbyCIhyuLXAVHPfjfqrTbCBtSyI5s4z9U?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b0534d-ab6a-472f-8aa7-08dc1dc3cc0c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 16:36:36.1227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnOZUYGvcGEKQYtN0+7+GIbA5SS6bTE6hlC+j/2Mqkq070cMyFrFXO4kIwxUeLd8etFndxRBo4DYhUpCaRhmzLsV2Z5R5ifJ5XepQzqQ3s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

On Thu, Jan 25, 2024 at 09:16:47PM +0530, Karthik Poosa wrote:
>Reduce debug print from warn to debug to avoid uncessary
>warning message in dmesg (Lucas).
>
>Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 576ff2c1fbb9..6fbeddc557af 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -174,7 +174,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> 		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> 			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> 		else
>-			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
>+			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
> 				 version->major, version->minor, version->patch);

do we even need a debug message here?  Once we upgrade the GuC version,
we will have a message already with the right priority that fw
should/could be upgraded.

I didn't follow exactly how this WA got added, but... does the older GuC
fail if the flag is passed? Otherwise, can we simply ignore the version
check and pass it unconditionally?


Lucas De Marchi

> 	}
>
>-- 
>2.25.1
>
