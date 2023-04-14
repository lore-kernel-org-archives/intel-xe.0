Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0115DC77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 19:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAC410E1EF;
	Fri, 14 Apr 2023 19:53:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA7910E1EA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681501988; x=1713037988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A+lfefsgHtApndyeQP8IK8bDgxVmQbqsgB+etXI3hi8=;
 b=hUcYBxtcEl9ob54aEdyEzpR6LjvSS6yvddfeK3WMCGRD66Kz6XM9dET5
 uTdZA3gN6gKOVRdzYJKWOCT+DEAD43A9Q5XJDMkd27mT6Wb6DeRRwJNpD
 JiOMjU9uv4JKzCIox+4Cok6ZdKFnISRXy2ZXJnBv7FGRJUtYEdzemK9zx
 chqB6/oFX5xWsDiwr0qnS/H9mNhalOhg8+GHTbfKODMwAXhTDfEajCR6/
 m9kqwGr5XtPPsCm1TWrkogH1T/Y0hdvKaMBNmJUOwUNaZw4Rz2LHzNwHi
 pIVI7m8+9/UFzGJ5w8YRuKVw4ZHPIg2wrtuKwDxHPymxlhe5Ol+0V2KJY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="409765745"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="409765745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 12:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833677710"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="833677710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2023 12:53:06 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 12:53:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 12:53:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 12:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldS6prtVEOEp3hM7zXL4GtRC8YgFliqGL9ki1rglyC40Pa8tRtb+XixhM6y8U/QIMgiaLlDJjItPnCHzZs/nX1gT4i7iooOaH+CHrPEH8vsmce8F29vBU5GkOHzXr4EF9CuHdKIi4ynjEB1T3j8WE4nUc7c+E+vIdpd9hAbcEmoVNQ8/KVaoMRVPwAWACT29jgqK4dMAdml5nSUsyZY0/1ATErbz5g9GGlSNRuad3xhFSuvLLTZ8uUlMshkZVh39m2EK0ojVUK+zI8uXbBB/IFCmm/dfRUMdiI9eOjsjtnfFwEkvNHewfDukQe3JbIHp3VYPvmDt4ZDaZaZv6b1z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB5smGHjfVYPNrs+fJngnQKKB8w2FUo4SIguqZEu3bM=;
 b=SJDMHRMaDn6lQT/tU7bC/H9TJvceNZxGghoAjqmF0WSzYUgIr5ijfKluGUkJ5YfixrPImbQq1LH908M4Aspy5/vzuUa/zMUa53iu5NAeCGxGgQeisS4cX3XzMw3rbTJeOngQuOSSlIDY2KcfTRqinS9WhvHoLwQ68sENq+Yi+H+i/IV7/DH1OPgy7CuvkVWqWNb79AXwYxV3j4URvTbI9WPxEXtezDkmMa13wltTzjPli8uo5TjfxY7nXXRCs5y06eJ/l3ig9XsIpGvvYJHCzQTGGB65I9z6h/NL5GDdE29VTR40X18nlvUOiHfycTkcGPVBsajdSNlZdbqjO8QDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 19:52:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 19:52:58 +0000
Date: Fri, 14 Apr 2023 12:52:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ntbs4l5asnmp36lkkjn2h4i6kgygp4xabx7arp4yp2wfzhhqpw@ioxl3ainmspf>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac75c4e-589a-4357-8db7-08db3d21d8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jE07K5yS0p5Jqy9KFmV05Uy1c+PyAlkttsePkyT25Bic1xtCNrfJM63rWKjmrTMdv0tZjAUJrBJidUCRATn7/ypTMAZfBt5lJ//ZxVMqEtuP9PR/nOAmTej9zDbzSK7Eko65ddeN77S1IYilxCFP+J/yUpDByyXq4J+MiD7mHnef6PuUuwIiigL9xkkAuZgWZwuJqAnU3fUBafsjdIiJPoyNPd+TBAyJHmZbFB44KdWwzoeygtxy5GlIBls69IYeg7m8wllJ0v6Os0zozd4qSbgPN0AOKmHxJOBB0eWtbUBOHGYgWE2WtHziTAIguRe/Yku6VTLs53I0DYr+JmJooylgpC+I3ZLpEXY+3IT0Cl36TDYWEVu6fOwbWDH6+lOHbyuL5Y48UBVVu7V+L80NpYg69Lv3ZaAEV4CfEtJognaq9x86m2qXBCE/jnY9TUAPtJrdkk+g5JV/THhebuIu1qyGXHIpJAXUqI63WyryLmQPYYXj7krMwP2C3ew44bDocDcqgjdl1cT/pYd1lTBu+4hrZS/ch1aKZ+I87iff7ZgGNCKZiI5CycyZY9e/2bpc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(316002)(6506007)(9686003)(6512007)(38100700002)(6486002)(86362001)(186003)(26005)(33716001)(66556008)(82960400001)(66476007)(83380400001)(66946007)(4326008)(6636002)(41300700001)(8936002)(6862004)(8676002)(5660300002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/a9tk2IlbY3uC0voW680QN/njwyoa5IEV44cC1PVl/MQKfBJCs7lSU3et4N?=
 =?us-ascii?Q?fFLfygppngZQp2X9ObTAtCOfZ0kGx8VM0xarbJ6Mf19eWv1aBcIPH7Ja3IVt?=
 =?us-ascii?Q?OMd6CXWA3VUVNrqF+H7Z5GOAQWrqnG+HPnYAHLRa3XGqR2UcfiGEIXu6wE+2?=
 =?us-ascii?Q?8LFfge7BmkzH2q68ukjWf3JNmi7hHZTEDtM3j+Bmi6WgoUsdC/NPwaHnrHfn?=
 =?us-ascii?Q?TMISfgc3KURYYD1aywsGsiiUGVs3ALK0ElUlRzFiCCmA0xhR9i/eaKtnYNsJ?=
 =?us-ascii?Q?irq2MxvHk8HwahFEGkoRjC4bduG9y26AxCM6FqLhW25C09anUIAWYYJGVSLH?=
 =?us-ascii?Q?rvdRjRvUUFZrpJ7piHLXbh3D9eIT5NahljLE8aE30EqgGMRL+RkJ4y9QeSt7?=
 =?us-ascii?Q?HeUxONXFmfBeZHtIzjerXtBFBcnjCtnUzt1y1L+J36VR9soNed8LIlf79r9S?=
 =?us-ascii?Q?di0QDbGBtXL3BEJbVu7IZMmU5mzTnaA6NTXdrAjhXusvJTkrQMc02HChrMYL?=
 =?us-ascii?Q?3D6dVS6ZhQpK0ekeq8qW1CDPRXvIzURS7fF7z3e1NJCioV1yYTZVGz2G7KTS?=
 =?us-ascii?Q?o3B4a2wPND3JKudq/7ho2UtvbeKpse+h/iD4w8jWBeCf6Zbfl0wMReteCoFT?=
 =?us-ascii?Q?J/a8iIlAdrLtf3ZlAI7gfHQ3zh2WStxFmFfZ/7xrQaImci4PU/+6YoCEtfi0?=
 =?us-ascii?Q?IVhplORbhKE8tNJjM1o2TNldDTVAfljErbbms/MUmVVpwF7jIRKOl1Vf4chN?=
 =?us-ascii?Q?ciM05LwUjRwn9eYUEp9S1PdZTzwyKh9ofBY1EjPhiookstFq3vulxwGxAb2g?=
 =?us-ascii?Q?E2ZI/MbPsW+JnmwcvBUOnAE2FXhhDGXn7fCtnuDJVZ+Kmjv+lTSSfgDyQuqe?=
 =?us-ascii?Q?Vz3Yz57TfYD+RGYD6DZCTmJR5EDqEICF47GuR+QLqKc/bIIBtNBZ32HODdzu?=
 =?us-ascii?Q?UEC5VaZLYSHhBMDpNr4GuVcStjM4AR7NS8h1GNcXBG/R3OpvBi31gCWDsGzC?=
 =?us-ascii?Q?xbS/xYyTZkdmsXDgAGzDcBE0xqsdKFuHaKD8ghhD635UWo6SGoY/+oqxbNgS?=
 =?us-ascii?Q?0pX+9SKMbLe9nI9jV3LNncwNtpzbjnIGw/bi+J0uVWXbgtjzvE5oxz3FfOWv?=
 =?us-ascii?Q?ifvpZ2xjUZ8R432ZI/t94FBJ4ANf8zZnqQXl4utROa5KVYmPnln4X3R+O3HQ?=
 =?us-ascii?Q?7flmtatxx+GA3LAHxFLec+2GCwCmf+eytkjJzwE+duOs5GQVJAiN5oOxl5is?=
 =?us-ascii?Q?Z9GSuyh0u0JzcmlJoeU4aLcmye1e0n9LKCRm/nJpcTHTiE5T6YerPXfoZrZd?=
 =?us-ascii?Q?YOf2qK9fSK2QfBdeK9EJP+FmvHYK7QcBB2xOYAfrCRYf6MJsWUIgl6rHeYrr?=
 =?us-ascii?Q?snbf3olUltSnMXm/ts/a61RFCf1NsuAANY/yjRDP9nD9hfwQQuP1ltveqvwO?=
 =?us-ascii?Q?NFhy6ZyO5B0jzmn1szywK+9y6TVcirjKrIWYO7TQ9TOIFwdggPyWGxZ6lzi0?=
 =?us-ascii?Q?9PQcyTurCYJ7yJ9lB7sZX/J/k+5GCBLXSrVTc4YMGMix0lX81u2rl/dREEts?=
 =?us-ascii?Q?j08OeaOBPhaexVJVAK1uEejL1Xhz1HABWSOmfZSCKbBb81uVgqNzJNBW/si9?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac75c4e-589a-4357-8db7-08db3d21d8d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 19:52:58.6686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wThHIbPOmj/dt35FsIJDIm8TTUnhWysTFqvBbxYzjopy5ivj4roHisYVLikHG49/yGN8r+o4/KwbogXhemg0eKw4MOwy3d24QaLJnEgTHCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/8] drm/xe/irq: Improve warnings and
 assertions for GT handling
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

On Wed, Apr 12, 2023 at 03:52:42PM -0700, Matt Roper wrote:
>Improve the assertions and warnings for GT-related interrupt handling to
>help us catch any areas where we're trying to process interrupts in
>relation to the wrong GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 29 +++++++++++++++++++----------
> 1 file changed, 19 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 7e78eecba62a..ca86c99f8007 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -220,16 +220,22 @@ gt_engine_identity(struct xe_device *xe,
> static void
> gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> {
>-	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
>-		return xe_guc_irq_handler(&gt->uc.guc, iir);
>-	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
>-		return xe_guc_irq_handler(&gt->uc.guc, iir);
>-
>-	if (instance != OTHER_GUC_INSTANCE &&
>-	    instance != OTHER_MEDIA_GUC_INSTANCE) {
>-		WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
>-			  instance, iir);
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (instance == OTHER_GUC_INSTANCE) {
>+		drm_WARN_ON_ONCE(&xe->drm, xe_gt_is_media_type(gt));
>+		xe_guc_irq_handler(&gt->uc.guc, iir);
>+		return;
>+	}
>+
>+	if (instance == OTHER_MEDIA_GUC_INSTANCE) {
>+		drm_WARN_ON_ONCE(&xe->drm, !xe_gt_is_media_type(gt));
>+		xe_guc_irq_handler(&gt->uc.guc, iir);
>+		return;
> 	}
>+
>+	drm_warn_once(&xe->drm, "Unhandled 'other' interrupt on GT%d: instance=0x%x, iir=0x%x\n",
>+		      gt->info.id, instance, iir);


do we need 3 warnings in the irq path? Since we are calling the same
function we could probably reduce it to:

	static void
	gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
	{
		if (likely((instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt)) ||
			   (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt)))
			return xe_guc_irq_handler(&gt->uc.guc, iir);

		drm_warn_once(&xe->drm, "Unhandled 'other' interrupt on GT%d: type=0x%x, instance=0x%x, iir=0x%x\n",
			      gt->info.id, gt->info.type, instance, iir);
	}

the info on the other 2 warnings can be derived from this single one
above and it's not a warning that we want to see really.

likely() is generally frowned upon in i915/xe nowadays, but on the irq
path and situations like this I think it also helps documenting that the
warning is really a rare exception.

Lucas De Marchi

> }
>
> static struct xe_gt *find_media_gt(struct xe_device *xe)
>@@ -307,8 +313,11 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *full_gt,
> 			}
>
> 			hwe = xe_gt_hw_engine(gt, class, instance, false);
>-			if (!hwe)
>+			if (!hwe) {
>+				drm_warn_once(&xe->drm, "Interrupt for unknown engine on GT%d: class=%d instance=%d\n",
>+					      gt->info.id, class, instance);
> 				continue;
>+			}
>
> 			xe_hw_engine_handle_irq(hwe, intr_vec);
> 		}
>-- 
>2.39.2
>
