Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C305E81E1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6110E548;
	Fri,  6 Oct 2023 17:16:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F9C10E548
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696612570; x=1728148570;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rxymngSLVnHzYzFDPASSp9N+5IGmoP5FQ3Kh7FgKK4c=;
 b=c7UZcKNNUwHIwfiOw655b6SPz3zwzlHL+nDwL5FwxaMB8vW9n9k8YeUy
 pTnbngXG7dLL8XAlBxgE8wISyIZS4lcwr3qaFBPaUuGkex453LTALWiqA
 vGfIbt6DoNACVO+NRHP4MJSpFmNnVpclXy982ht2LKyz+GLR6mOtS1jlW
 NW718ELz3at8cW7DaVzwZ6Rzz6X52x/hSlg4+Ep8hZsqU1Ft4L2odj+CZ
 TXbzofVhERScx7XXTlUQ3DRT6iSsUCMuA50TSW9i4X5Lpt6ZV9cM+dX2j
 LgA67fapj0l0s3gz6fOnpSJORv4BFwHs+bZyWRNNhDw19sdw2+239AyWv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450281707"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450281707"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="868408569"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="868408569"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:16:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:16:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:16:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W90otFmydWAQeV1ysOAWguJZLdxPLvy9ATmn8taG9NpWUfWukgcRkDmPgDQa6cU088uuaFJVvfDhAvXR4uaSlScZdpOszw3lC1BlfrdMVyFpnbxsos1OPLvpYniUlinc96JGQuO2HkVuSqilbAvgSTi8AnZsAdJ9fV7+QUQ6YFXozp/oexVnlZscxgSak4viR1SeV/SlsVOn2qHPPmxxV93NMqJ1EHYLtXsHDJVL6oi6l01HNsWw7oyRNXA2XqyIn1cmh/aivW8M2MbqyDxaWSivcA6Ixl2hyZ4c0JNX63xIgs7x/9rNZA+g4hX+U89xQwOo++3GAMhV7nYvl5v0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+RE5ksOcXmLhs8uHRnU6lX7MFwjVQxBd+IttKm8Z5w=;
 b=k8eTI99tDzylzifEK19n3NoI3WeSPvC3sdnmYgJI5s/umUvT6Y4dF2JtWUxVV3NjvfcHk5F0sk4LYnZaqNrCwt4ittEHGyhRkF5WxisRCXqaSpEFnPxLogbHnzTilMKMdUMeKvWIC+OSxODw7c2q6Qcy4+26CvqW5vAvrHSNIJIt9Si953Lbflz+gLr0kvWxtCKerQX/qftvCD/IhIvra2QwGZD8bgLHe/TKUsi0a+AeLl8G0eFkDcrcUhEDB7l9tgpuHoM/P8wOWYB8Go/V6KBZWFCgY9+9wUZBo3zILD1E74yVj83rJOw7dP64JlGXKQNzUFshJ5cNQ+7Iq4zG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 17:16:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:16:05 +0000
Date: Fri, 6 Oct 2023 12:16:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <tecwsvc6m7wofukfl2fsroircqfyla6i5rnewl3dzclhyigm3n@ryoralndd7cx>
References: <20231006165053.55479-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006165053.55479-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9df2a0-84ec-4d23-4304-08dbc68fec6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpcV8WFDtDV9OAM4fSdg4Tc5a7x5v1uC1fMzOh6XtqhjCb3NkWghUSp/967ySwnZ5i0ePhuEKKpFz8TITb8Gvcv86Mw9EOm52Ktmucq5BKr3exktlOrh8uH/pXtBQuLXx+gqp1jv6wj3NIe/fyp75rqBbnx/XNJreYH0elF4dbdza5vODnTOXy7Edf3bmxNLoP6k5/PqiBmgKzF7WjKjBAOuDmLd7WA6s6hEcrlEc+wo5tVSQrDQU/CYY+ZJuG+f4MbZQ5d017ePr+k+2PYFG9+CwZ8F5IATtjTpfQOmlifzh0CrnIpj3ErBCJbkTfxl0gmGrTUr8L5vPrk6jrJZ7O0wtvw38r9gndkZub7aQWiPxy3y8bvJugb0k/cKljiZNmW9zmhDcHsCYoRaiQ0FCIJTLOEPeOm0wfXmN0QIYcVbiu07NMtnhVVv5G5WvhwkLzEsZ0edVYcaRxaZUOOjkwk5v+y5FklZIo5iBfEzS9EjMBDPLlLmoowpdCPrzbxAfT8BKWhBLHWZrRmird4Kl/vQWY6/y3PRrpf1bOFnxcT+xQas6UpLMuL97DpRI93U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(6666004)(478600001)(6486002)(6512007)(9686003)(26005)(316002)(33716001)(2906002)(41300700001)(6636002)(66476007)(66556008)(66946007)(5660300002)(4326008)(8936002)(6862004)(8676002)(38100700002)(86362001)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kIeqKTEdq/yUL6OvTyfkOocNtOEMVuS3cR4BczUjruzvXnQC5CThdHF7J3?=
 =?iso-8859-1?Q?WlNePwLG2HGERovXFiJYKT7AlZaVAeIBfZIJ5LVYBamYFJ6j/68Z+o0ASR?=
 =?iso-8859-1?Q?A6GRDwZRLF4zYfmKTgoKPTQHRbvXZBBUafvAUVhiMLyRIEwsG/zuXHdAX3?=
 =?iso-8859-1?Q?bw5N0XwF4VOv4dUUoQJbrcMd/w0LIzAwEJW5pEJMPFCYMpuVim8eAvSjJZ?=
 =?iso-8859-1?Q?7L7cui2hHBlMm1A7yzivfHkXA/g7NXCt03i6odw5ORcgvx+ZAXNDljDhhO?=
 =?iso-8859-1?Q?fbNxfH5oO4zuTkQE5fFa/tN8al/8QNOKr448yBUhDUZ8ITyHsX/yWua3uF?=
 =?iso-8859-1?Q?SIaKWOI2XA3TrQYGRThf+Ekeum/9KUqp3uLg7Hd3f1IyYG9nGPSmEkJv6x?=
 =?iso-8859-1?Q?1UooE4uLlKJGAoFtFLpvWH7a3LE5VTEjfmAiHpA1Aq+l52Tpe3blFwx/sL?=
 =?iso-8859-1?Q?fCVBkjPdoey1UhRH1aVsEhK3WRWFIuPN2RV40Vaeoq97RmoIyAbLGqIvkY?=
 =?iso-8859-1?Q?fNN5AmXzFyvykKUY9CTht5G5FOW8IGeIkzYuNL6NmlHnLlnLM69CVQ/O79?=
 =?iso-8859-1?Q?sRzs+VjRaegZ+Jo/nS9huIYzYj9llyYLskXc6QIbK3X2k8+dpjh6BsdjEo?=
 =?iso-8859-1?Q?XlOdVKsRMCBnbXLRwEr9igelJzw5kOCo7RSXmzAAoOcmLWWv4uEA+aeqa9?=
 =?iso-8859-1?Q?PlM4c3udqTsTsdeqgDrflEIbsYoNa9jnmfpqzr8NKT8OSUJICVLOKgFv0F?=
 =?iso-8859-1?Q?GogZQlhp5aDf8zvBjLfP/bWz+X1SD2Mb+BrD7UJbWKOwu5oAZaQ2B2Xfgi?=
 =?iso-8859-1?Q?Y5iYN3Rntym74TU2htaCNc0Q0Y22dkhfqle1/a7EqouXAWIdwMqvozAcZ/?=
 =?iso-8859-1?Q?cZSFpElznVRcIql1N+L0CSOqKi2gzr4RbaNmBcSkKhCeDkapvCgu0hwcOZ?=
 =?iso-8859-1?Q?J6BhhdKgAPM2zGE92Xe4FHTnh3xs0r38/c56vRYBdoNsl6HsRw0bVyvU9D?=
 =?iso-8859-1?Q?Rk+xkKrfBukdVAZaIDp4s29MAMgVM4WhcGKEjeXx7Z776JvqEnBRb76IHz?=
 =?iso-8859-1?Q?H+LLAFiB/DPXrYkPmPULLzKrQZRHh6hfWcb1TSYFCqifqJh3i4v550HvDA?=
 =?iso-8859-1?Q?nDr5KWeNjVli5fZTy8YdT2Slgs2VbNs4Agzjx5LdKK3OHA0es9cWRt5IFY?=
 =?iso-8859-1?Q?gUoNRK4l8MCZvAYnzBYrHZT96AkSCv0SL7KUpn5FDgozow9y4CsYdAt9xd?=
 =?iso-8859-1?Q?PQUpdbIKKlAsaTKk8fxZiQvSUv5W6XUYh15ipZK/5EhHbVMVfYtEL5Yiwe?=
 =?iso-8859-1?Q?45W65+4H2kU4gWAUjT5OWepk7glVZDcaLMRLJ7jMfGPV1Is1/CugQjE6WF?=
 =?iso-8859-1?Q?ceUzn9yB+0R1Q4YKwnwx02OS/tjLz90An0EVJUmRXo1pOO+eEXq+4Dfqff?=
 =?iso-8859-1?Q?7tAwSwMqNOAdlmqKTTcMke33y3JcucWRJvDP/nOgD36AtdH7FUG2F7lvFY?=
 =?iso-8859-1?Q?KzhrTh1dNHCSIAsz5QdUg5ch3zMdJZOMGpswOYL554DKjAyTUCo9+dm5xD?=
 =?iso-8859-1?Q?tfzTyXq++I9rrbh9y3JIStm7J0o3nTCVhdHezhzBoCjWDD14lSXS4eXMIg?=
 =?iso-8859-1?Q?c1u7hy7gVHB9JkDL1lNDLPI/3l3nd6kmEFrpH9TVZm5xtazKJeVNgJrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9df2a0-84ec-4d23-4304-08dbc68fec6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 17:16:05.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4mR0wSMCHGoEuG7L8/rfo3KLLUkT7kb+oLxXf/06s9MpN9FsHacAjFKgLhDWZRnUDje9fuZ0rZXKy/l9AUPiMoU0mWJrAMmqJ7Y/XszG2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove PIPE_CONTROL_TILE_CACHE_FLUSH
 from PIPE_CONTROL in gfx20+
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

On Fri, Oct 06, 2023 at 09:50:53AM -0700, Jose Souza wrote:
>PIPE_CONTROL_TILE_CACHE_FLUSH/bit 28 is now reserved bit in PIPE_CONTROL
>instruction for gfx20+, so here only setting it for older graphics
>versions.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_ring_ops.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 6eec7c7e4bc56..c2aec32fc46ad 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -157,16 +157,19 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> {
> 	struct xe_gt *gt = job->q->gt;
>+	struct xe_device *xe = gt->tile->xe;

gt_to_xe()

> 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> 	u32 flags;
>
> 	flags = (PIPE_CONTROL_CS_STALL |
>-		 PIPE_CONTROL_TILE_CACHE_FLUSH |
> 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> 		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
> 		 PIPE_CONTROL_DC_FLUSH_ENABLE |
> 		 PIPE_CONTROL_FLUSH_ENABLE);
>
>+	if (GRAPHICS_VERx100(xe) < 2000)
>+		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;

Looks correct that it doesn't exist in xe2. But looking at bspec 56551,
it doesn't seem it can't be set, but rather that it doesn't have any
effect on xe2. Is this not the case?

Lucas De Marchi

>+
> 	if (XE_WA(gt, 1409600907))
> 		flags |= PIPE_CONTROL_DEPTH_STALL;
>
>-- 
>2.42.0
>
