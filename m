Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD2EC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B0710E300;
	Tue, 13 Feb 2024 22:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkW8+zs9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFAC10E249
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707863463; x=1739399463;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Aki0ehgq42xTb5fxb8rh9Z5uadJJ6lbAKpzfX4EPoaw=;
 b=lkW8+zs9PU2y0nlvfkIAWfS8OhlgTwd8RkLRYx/MGagHcIu72/c8zOUE
 xcRa71RyDbrGH/jklVAJ1pTlKrcu9k0RNQmeVtuQW/kAQAtOtWryvOajM
 oGrfXUpljp4Od4oAE/+2cpghIsb40P1SDBqAo29w807FJ/vPHrqrkYJon
 7NJoBYPry3ad9bOUDN0aJI9oUsG+KoiBmGjlS2Ed18QemCAJXNu42JqHw
 JT3JHQL9lsz5Xzqiz5iDWSWH9Jko06+6ab/5r4mq/FnITIdw9P4+0J4fB
 e91sthODWJw4YeTpdR4rBkfwv2vsJgI2FGT5OkN0VfGRzgM95Lt8uNdA/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12442135"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="12442135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7662955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:31:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:31:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:31:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:31:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH/dBRL4F54aJc+pFmlCj1CMCLFmGf5+cRciMKhKqMTQjCAclfudlMNgSOuTFl/fu3giM1nEvptzobCODndfx+DY/EkkZFEgjXlcg0H4SaHxQF4GuQkejru+0atf6PZ8YMSwpusRuagZ+VAP4kVHEzHEzO1hF8pfVIh9C9CsFohUwAcFP+y/+ARva7SCHqJNhQvvFzsBgrwUGsIpZ1aconVLPzitjqAf1ol4hsk1FRXLyutfJ11xcIqSFcGRWy+QErY3CW4/hZ2V2gKInmoj6OMPTirch18Imkovdtzsp6fr++oXDZr0ZFi0fGFJKM0q9a3+BzHTfCiGq5Aw4flUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeF3Yga45n2bjfrT2pcy4AbyOjePFoYko3EqbfeY82w=;
 b=Y/ijaXYJBvxskxxd6Djm2z3ek8QYdpoHfbcMDpHf28xLLGsouMmMOC89PXJ9wizhws3ZPZeBHV3tYQW+LG9lNh6w5YYB89XPOpFCU9zJPmzfGNnYUGj0qA8BTLswrsHKgEMpNIdK0Xz1krJd8x+KftA42NokAiUSl3D6YwzqSuS9CegA5mdKE1VwIQ2XHQRQhmK4w8jcofYxRkm4BHneq5ZQuFDX7qpEgGCOGPNpopDW8yW2ajWEWoNuZ40/xJ8H1pC6X69WaR5YOiN9+qNgSqNOTluwmIgVSRgn6NdvSCVFB0I7ZxzG91K0QvbWsP6lE3tYzLBdosaKEe5JuZlckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.35; Tue, 13 Feb 2024 22:30:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:30:59 +0000
Date: Tue, 13 Feb 2024 17:30:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/pf: Always use Multi-Level LMTT for newer
 platforms
Message-ID: <ZcvtoATYo1CiTTHG@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
 <20240213212418.1309-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213212418.1309-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: eae3ed2a-a895-4846-f587-08dc2ce373ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKHI22W0WOLYXrfN43Tv5Cz8x2Jz2crUsyE2tsrR34gMvF7qX0DaU55KdAFSJlBzKfvKDixf4Z7HF7EBS9tz5CDJGKIpPy2PhhZGxpX+Q/npVAcarpRFrtA6R+ErCrT6cWXRc3t/iCeYfxIp/iTEyeLmAuvBoLcFCrW6lTcrRmgFYI4pjSnbZz5ZQ/VIyxszhvpuUPJRVhSirM2+5348SYW+xwqTUxIAEQBQeKXgm7emd4bO5nMWgr69It73NK/ShG7GJmFqD8T658IyQPRLcva3hY0loFuxRrAZZ+SsIuYq6F14Ym0Xo+t6ET2OQQYwN5mQBwVjdlkCG9SqxLvzJHAZT5TRjFJyz7w9w5HxJHh99uGLqgkz5jDx5v73gEtGkTemUyco5g0rPVY1Lz6j+aAsdgEQ0P4fFtwvPwu7b38NZlxMPo3H6tevDxBA+k9ySBE899ww0Kia0ho7T5jtZx5AG4vnNOlzrC/81h4Lx6rv0o3YZ15hY+xx2O/XA2LsMY2qsOPEf6SmZMPv0E4OVrmODunp2LShQL4Ddh16yCjVw5yOHYQzY4Sbh5ugaFdg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(44832011)(4744005)(2906002)(38100700002)(5660300002)(82960400001)(86362001)(107886003)(6512007)(2616005)(26005)(6506007)(6666004)(8676002)(8936002)(36756003)(478600001)(4326008)(66556008)(6636002)(6862004)(37006003)(66946007)(6486002)(66476007)(316002)(83380400001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE8vQW1JMFpLVEtBN2tRQmFvQXZ0a2F4THRKK0JrQlRHTW9UaDZsNEtucEpo?=
 =?utf-8?B?TFVubzRabkl0VGdXd2pTeHVDcW9YOW85ZDNXWjBIRUdGYjhHME8vRjRmaGlj?=
 =?utf-8?B?L3l2TjhrRmZtYnA0d2VtNUJ3VUUrQUNqWkRKa09PcGdhbXVDQkFoazl6clls?=
 =?utf-8?B?MnEvQ25TVDdOWXAwa25CZTU4T29JeU9JTmRldE4rMVhKeXRSTHY2UmMvRDNw?=
 =?utf-8?B?L2MrV2g0TmV1T1YxbzEvT2pYcjdHbXNaTWg4VFdIUHEvL0JwY281T3ZZbnpJ?=
 =?utf-8?B?cDRhNnRqemc5RFhmY1NHTlIrU3oxakVBanBYYVRXNWxSRnBxV0Zvc1ZPdFFi?=
 =?utf-8?B?TGYrUmtJdVhSOGsyR0NmSVI2NXB1THAwRTRYSktGRmE4RU91WFZaVnZLN1Bt?=
 =?utf-8?B?aGZvN0tzbEprdDVjSk9HL3BaaXhOdXkybVBndlhOZDV2SllXU2hzSTlUK2lQ?=
 =?utf-8?B?ZGpnR1FTdmo5ektuaEtVUHhacnNXZnh6Q1Y1amxUSVBPTnRMdTI0RGdrZk84?=
 =?utf-8?B?eXJaOUZIeFo3Y2QyVHVRdFZoUU1NbklDRUZyUjJ6eXp3NTd3QmRDNnV5NGxt?=
 =?utf-8?B?alpzZlZuWkVDTThLRDVVMjBveDlnK3U3NUozL2ZMeVRaanh0ZTBZeHdLdGlw?=
 =?utf-8?B?bjYrZGlTRkRBenJZWDJobksrS2R1L3VuNmJFaHV5Q21GdmFzUy9MSmpMRGhC?=
 =?utf-8?B?ZWpFQlRwLzM1RXl1czVWS0U3Yk0wV2g0a1cvVGg1OFRkaHd5UG5FdTlid054?=
 =?utf-8?B?UFpPdVo4dFQ5eFFka2ZFbHpmNHBPcGVnSDFva2VHYThXbVhLcklwb3NsVmlC?=
 =?utf-8?B?UFowMTRBOGQzVVl3a1dtNDhISGp5Z3czZWE4OCs5Z01aOHZYVFRmWCtBTDJu?=
 =?utf-8?B?NUE1OUIwaVM3K1hTSDB0bEY2TlMwVTJkL09iZENGOEpVeUZsWXIzTjBZekFU?=
 =?utf-8?B?YTN4cVhBekZQQ0lQc0FwSkNMcVNRK0dwQ2UzaWttUlpOaG1JZFlRN0VCZ2h5?=
 =?utf-8?B?MUZnYi9VM25wS2lVcnpMNHVnOGdBUC9UdEVkcHI4SGxCcXUzYitNYmYrY2Fv?=
 =?utf-8?B?YnVwQ08wQVVTYjJ1M3llR0NKbS9SWnlra2ZPQlgwR3RaNE91UEg4S21iOTVl?=
 =?utf-8?B?TVlxUEZVSUlCTzhCemU5ZTNiWmtIRW1ObnJ0YnhzUDFybFV2RWpYKzZhUFdX?=
 =?utf-8?B?b0FMMDZTV2dFWXJnV2prNUIvWDNqZTdabHFwcUF0eDhhcjViTVZGbkRQd2pk?=
 =?utf-8?B?MkgyN1FMRGdydEljVFZza1dXY2tyNzBleGFGWTU1ZnVxYU1Kd3ZVMlJYTUVE?=
 =?utf-8?B?MlY0VkY3dWNCWXBVM0xoSGVqWFQ3Mng0S3l6Y1FvMHhXelp4K1IwNXQ3RkNG?=
 =?utf-8?B?N2pMMU9GMWtvdjRpYnpPRS9aYVV5WWIwMEUwZ2V0emt5Wi90WnFldDFiNjhK?=
 =?utf-8?B?SnR5TURWb3UrN1Z6RjA2T2czWUI0YkxrT2ExMmUycHdNOUFMcEppQmZmN2FD?=
 =?utf-8?B?L0V0STczNVV5blZ6WDJIZnRWR1RrOWxvYjhDcU9CSlB2VEhWMjFQc01DL1Bl?=
 =?utf-8?B?bzJ3WXVOaWNLRTFBUU5CeTRIR1JVcTJJMUxLMHFMaG1wa1pOUFduelJpNytB?=
 =?utf-8?B?U2RwUzdlMXJvNkZrTVg5NzNFZ0NGTENTU1N2N0x3Z2h5V1ZTM29HbUhXL3NG?=
 =?utf-8?B?cDdvUHVKeUhEdTFiSWlhZk02WThxOVRjR0xRb1o5bGoxM3l5RnphL2ViYUt6?=
 =?utf-8?B?aDgwRk5RSmdUd3dLeTdaWVJadWE0MUdhMncveXBUa2JxVkw1cU8wN1owMEtW?=
 =?utf-8?B?YTBMQWl5SEZ4OW5mWEZpU3BGRGpMVnhaU0VhWHlsajBTSXdPUTVYMlFmSkZn?=
 =?utf-8?B?a2pVN0ZoTmR0eTdhUzdSU3o1UCtvOUlsNWNKNnp6Q3NXQTVpclkxd3F2OVJx?=
 =?utf-8?B?MGVLOUtFTDlDNGVCRXJzUFFMM3BGbVhrZm1QYUVEOGVUNXpDNkZtZlRZOEw1?=
 =?utf-8?B?QU56NVRKWEh0aWlqZy8yaW5hZGR6T0VFSWdHazZOc2xZZ2l4OXhGVmpjc3ln?=
 =?utf-8?B?ZXI1NC9md25BbFFJemFIK0lLM094QnJLNndKVnh4NmppcFBSU3VZODFCNlBF?=
 =?utf-8?B?SHF5a0V1bTZlUHcyWmxDN0ZzVHp3b3N3WkU0TXN2NDI4dmdXT3F4YUN3YndN?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae3ed2a-a895-4846-f587-08dc2ce373ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:30:59.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjs+JdzRKlmO5Cbc/MNt0RhQfZPR9c2xSLi8V9tWAEVqa/8H3Nyqf1PyNqKlyWTl+1w8+WW+Jy/k5kmYBIOq/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
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

On Tue, Feb 13, 2024 at 10:24:18PM +0100, Michal Wajdeczko wrote:
> Change function logic to prefer Multi-Level LMTT variant on all
> new platforms.
> 
> Bspec: 52404, 67468
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index dfb0e1887615..ac77e9507f07 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -35,7 +35,7 @@
>  
>  static bool xe_has_multi_level_lmtt(struct xe_device *xe)
>  {
> -	return xe->info.platform == XE_PVC;
> +	return xe->info.platform >= XE_PVC;

We should use GRAPHICS_VER(xe) for greater-then checks and
limit the platform only for specific cases (== only).

>  }
>  
>  static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
> -- 
> 2.43.0
> 
