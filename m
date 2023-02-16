Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0410DC636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282B10E390;
	Thu, 16 Feb 2023 23:17:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3410E390
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589453; x=1708125453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qSQxuUZkHm1mGqxcD+rtB1rsKN+FmCmbMoTJLE+I1HE=;
 b=i2XsIX+GDl+BrRUeS3dIsJspe5YOjvZ+3uahOOpiGieBSzTpIplbQp02
 VRd66s/RPHHI+Exi1ixV9HrEBebX9WUneSbuPd9ghE2jTMFBiNvc8h3bT
 VM+6bm4OUm5wugWGVcQ8Xv7hxQn0zjHz+fxitviy1omCkb+IUMkFn5JGj
 Q+WgB/Sje8y+7Qc2rQiUluxMt3lzIY+0s5jNwBmeWsLbCfnzGNTQ13B0F
 9aM3iguam7b7P7fm2GK+8kz+EbNlsemw8CR1ose9UdUDMOMmB6P2zXXtz
 6seWVzUwZvZsZZT3yxtxM6zOHxg1W8wpy7FUQxzF6LZeJZLTxxZ9v7nq5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220820"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220820"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169175"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 15:17:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 15:17:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 15:17:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 15:17:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxbft4qbHj2XmnPnTBVJHlOnSjF1nl4OlmpF6oRsvc77mC6uHhbLE69Xa1mIE1PmOTpD7kXYM9KGsbJS84yg3m4DpSVMbbZWKZFlWOecRykA6ewKzWm5Q+7+R6J53o7FBlVMUMCveTbpvTwg9hYP8AatfU1GIHaxS2+IgJrWoAwtLzsQs1O0j5pIVn36BAQX7s4qrzepxocqGtP3tZDnAYbtesCyG8eCRhuGqxUyIflEBjjkYqlvERLrMFmEZD7VFibXZMqbnFPKCjGnpDrmelmXBxg0GzvrDOROkx03vaNRm4EaiUiG110+VtTpvfR1D01LY+0fRslhyyE6gR9qrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv3+apCXE7TOzWVlU95GXQoM1cYmUY2sc5GIGlRwA+0=;
 b=Mm2vdowScSE84Zn3y3ow29lek6B7tu/TOC2WgF9UKqHiHOC40KpRcZOQR5mo0jYEBmzlIj0e041jd43XuTc2Dtwt08LaROcrSe8fEZ4mq9Ks+Ym8SeJxcAWKvdImP/RpKN3w0G8SRLrQP09dUyPbJs2wYbkkfXTsZw6tO7f7qc+gfzpzfDQX3VJhKptVsslQRuwkaNJOBzR3+If5hVB3VCee543ZueHTqfwQhOAVcgixGiACs9o2f/PPtXYLK7Gq6q3CW4exclaQEdqM7VstPgPb6LujyRI3h3ewzqLOgAWUid4GU66aA54Rkwc+FLkIqH+oH8X62p42u0+/2L7gDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 23:17:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:17:28 +0000
Date: Thu, 16 Feb 2023 15:17:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230216231726.iwplck7nv6gcpcn2@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230215140329.402916-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230215140329.402916-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: ca155e7c-6bed-4673-c479-08db1073f89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHCfM+nhl1oY+en7SiBalv06SZqD3YScMKsjBbBORJVmqJV9PUspmq/WlJKJwSPXoP9jh5GZglhsGJW8X+G7eiuIrYpSdjcURGO+Se6Qlg4zn1BnbmPOciNVvvSkOTIfAJ3C1f39zXlfqweEyCjui6+wlKwGP2Lirc6stzbmUk4NR5j/NybscGYTLuA8rDdtA6WUDdLn3ci5j4R/HBSCJAc6/jHSfwjQqRtTt2udlH/5kiFZgLsWLKiLFDR9fGbT3ZDY6047I+4FO878LZ7j7eG9SNx8IZVNVvRtQzIiDkHfAEp8/0z5uY7M0MY3SzFdLH1S/gWZwmaYgjtCJF3Rg2MJ0mlGDQsntg//dwDHJoG44fZ2OBURuCVzMIQD+xtVGTqCefMjR1SO/goHrvHKxYu8UwDC+UC+5YDix4WZYYuu8Nr/bLqjRRsJ64CBKEnodiFl/3e4XJd5CBohcAgj1Gl+3/Ldm9ppHXja8Q5bqtKnKESs9iPnZNtXOYTOTHtfrO3g1hRwnu6itUQf7VsEOf9Ka1o768fKnXdont8iat0WB3chxdTEFYX/Co3Ih//BfFSVHRMoCherEVQcIQ4shGI99vD4C0vCGdP+kFkSJ1iy3gz356zYNX7+Peq/Yi26rNscnByZzPUd+C4h6N0ytg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199018)(2906002)(82960400001)(316002)(6636002)(8936002)(5660300002)(66556008)(6862004)(66476007)(66946007)(41300700001)(8676002)(4326008)(86362001)(83380400001)(36756003)(6486002)(478600001)(38100700002)(1076003)(26005)(186003)(9686003)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qeRknXpKHcb86echp0VqW2APl2IWfRrZArv7IQX8DloPhNdwiy5zYhH4R2bO?=
 =?us-ascii?Q?qBtOAu5rWkOPH0RNj96tcg3YjDEeetoHLxZla0u6yxjUk/6ByOc41XwCTbTT?=
 =?us-ascii?Q?6jH+lmoUTcq56ObXO9pULULYi70mmRfBeyHARviQ53c8OdRZI9JJqnbzMvqa?=
 =?us-ascii?Q?W42aolPJY45KR91jHX9jM/y0Kup29/XBhXtwhbCFv/M7LUxWE6g9gZNNJXgT?=
 =?us-ascii?Q?sEVo2/1BZPkhkG/XR0nDdTC+X02D1QV2u0AbXlCArSu36ofRgP8JZ63PC+TK?=
 =?us-ascii?Q?ipRQ+Ppzf/euB3K0yZz7oSuZi8s0U9qNvNnoTKwCgMHFRevwbUfPPCvJp0Kv?=
 =?us-ascii?Q?cb52qltG2YUOIli7+JEx+uRdJDBNaPbjYQZY7HYc2Y/k4a48aAcYeBPqQZgN?=
 =?us-ascii?Q?hvyjdv+GbY2bikv4l6Jy+FQ1SGJYHuUguWCXU9z2UeVP90gT4lzSqu/sbGTR?=
 =?us-ascii?Q?Vftpwp4II8L+H+4OGVRZDWr7fboQ0VRzsAVyhlevpg5b/+1pYrQ332/ENQw0?=
 =?us-ascii?Q?CPJD9u1Co7Ph05ycX+ETXZP6/AqUhXnHs1ygstdEc00JCJtnp98VWyBCbqX3?=
 =?us-ascii?Q?1lfKJTKkmf7lqLVpnz1k3Rv5H4kW/HAWkJ1bqkd7w9h0hs3utmD9WuXxvQRT?=
 =?us-ascii?Q?vKx7hOW2iX1z9jA8ZuYzDtvllNgaEgHVoLf5qNAlhPSij+3n+F9GzFU6ixZV?=
 =?us-ascii?Q?bnTKP8nrIkgtlMujgSbmKLmNxPMIpOxYfCNyMBluSku2XeLh2sxaPXiB3mGY?=
 =?us-ascii?Q?xeKJu/33/SEsL656QCc/S6vLdMKfoZ2fkvEcXsk7Ot5M5k5jZmiY2XMeNJTB?=
 =?us-ascii?Q?l6BHQ8VwSoVvfeyia/eQhFu+mHUnb9Ch6qDgK7KExqKwHGGVbm1EpZiKJE0E?=
 =?us-ascii?Q?NQa15o5egppcxal9gF87f4kvE2/isnDjyTxNKNe8ziAICmSCwkb7X6FMSN0k?=
 =?us-ascii?Q?Os8n3epe+saa6hksXmXE8Kvtg+QPI+Jn0wpsoeNeu7XU/K/B/7Hvwemrriq8?=
 =?us-ascii?Q?QKS3v83+xl/SFCGbIpHzeSa+cm56eDIQExWtb8TbvWzDNWi3DE9iQTD2Zp9i?=
 =?us-ascii?Q?GSKmIhIMdizlZo+kLh1JypmbLFHnPYa/tSfPx+SKmozVf+SDgnMvk/bi/XbC?=
 =?us-ascii?Q?90v15wjPRmK7UhpOJfnn0vNscEIu+LA8sIZndE/ffUiaG1bfoc7p+VomXMAu?=
 =?us-ascii?Q?HKGFfwyfK9SUX+2tmgLMHPNKnI4zb1kRRzqfKf93LvfAGWmlFATCxTJxYEM+?=
 =?us-ascii?Q?k+lyogQiJlGucRpyknX1fNLNhEfAt231blsyLijPTcWlWcPcy3ByexojEr3c?=
 =?us-ascii?Q?Wspu1Kz823f5dgG4M2XTFdmMmLbeXiGxUMwEq37YN+hnIl8cQwOZVXn71Ctj?=
 =?us-ascii?Q?e2MF8XddntmO8/jr1nqRVa+jdMuC9NB9UbQVTAG8/dxjSiIXcPX0TQtEYpbH?=
 =?us-ascii?Q?VBIUaTw1yYLpyFuxaNRTFtZRXD8heUN8vb4XVbAveNIh6jhc7TogkZwT4qr1?=
 =?us-ascii?Q?ImL0JzXm65wnE2b4eE7/mMb/Ht92uxHxI0HoH+yDe+zKC1tcY24HOp4WA+Ie?=
 =?us-ascii?Q?1Po7mx8A/TwaEOc1z29RQH9vGpjHt2cxxZcE/fTcyP2MFNqBq6et7uS/3w1B?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca155e7c-6bed-4673-c479-08db1073f89f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:17:28.3591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 526p1ThXQjWtjatvtUgjJFN+yPtsbGrMedXHLDhmntU3O4IBvOfMtmrV63O3hP5gP8Cz1VO5kR6UsgRyH0UxWYCynlkjrE47Q3usnn0k19w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix wopcm size
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

On Wed, Feb 15, 2023 at 07:33:29PM +0530, Balasubramani Vivekanandan wrote:
>The wopcm size returned by xe_wopcm_size function is used in calculating
>the GuC wopcm base offset and the GuC wopcm size. It is also used to
>find the size of the wopcm space to be reserved at the bottom of the
>GGTT address space. So it is the per-GT wopcm size and not the total
>wopcm area used by all GTs.
>Fix the wopcm size to 2MB which is the wopcm size per-GT for platforms
>above Gen11.

Bspec 67948 contradicts this. It says WOPCM may be 1, 2, 4 or 8 MB and
you have to read the registers set up by BIOS to figure that out.

It seems there's some confusion in xe_wopcm between WOPCM_SIZE
(the total size of WOPCM) and GUC_WOPCM_SIZE (the GuC's size in the
wopcm region)?

Lucas De Marchi

>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/xe_wopcm.c | 10 +---------
> 1 file changed, 1 insertion(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index 8fe182afa06c..a88d02357cb6 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -46,12 +46,6 @@
>  */
>
> /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>-#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
>-						   for 2 tile PVC, do a proper
>-						   probe sooner or later */
>-#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
>-						   for MTL, do a proper probe
>-						   sooner or later */
> #define GEN11_WOPCM_SIZE		SZ_2M
> /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> #define WOPCM_RESERVED_SIZE		SZ_16K
>@@ -178,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>
> u32 xe_wopcm_size(struct xe_device *xe)
> {
>-	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>-		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
>-		GEN11_WOPCM_SIZE;
>+	return GEN11_WOPCM_SIZE;
> }
>
> /**
>-- 
>2.34.1
>
