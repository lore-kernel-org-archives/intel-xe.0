Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F8CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 21:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69610F30A;
	Fri, 26 Apr 2024 21:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu+t4hR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A510F30A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714165380; x=1745701380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cxcQNEnuK6XXhCs1IGs9jiLMNlJuNJwlnRPGJWAEsrU=;
 b=Hu+t4hR4Tdy5qp26JJ+1FAShO4ji3QMNXj48MYXDQqbKgHkIwqLeK3pi
 OAEkkpxaTKpBg5v/opbRA2I2AKDq4eF57AdfUK4D+iQEpJXH7qbvY/fOT
 m5fNQA/TeCmdppGFCgQZdbGmvsdEmg0eOBixEmgXEUFeQ9Hje0sza2LtY
 QJs59Evhn/GwdyEAjcGgeahQJMzbL8i0TY21K68G0DL/CFAj+pmV2r3Lh
 ASEVAMW25yJx886pQfJ7Wct8nqv3yYjVxyGxi5Z4NgGISeLIVFdeh47+C
 VIfVUgF321Gc34BhKJq/nrEim9orwdP4aiHhwxXZJjq0UOIZfeJqHolnO Q==;
X-CSE-ConnectionGUID: 4SbTD9lCR06il2AIkcwbnA==
X-CSE-MsgGUID: ngyBv1a3SfmvdA+4LcSoUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13690050"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="13690050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 14:02:59 -0700
X-CSE-ConnectionGUID: E2S2c7l9RhaBk2nQz7sGzg==
X-CSE-MsgGUID: AylumhS8TsqPW2xKIeU3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="25504754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 14:03:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 14:02:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 14:02:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 14:02:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 14:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLgBYZN/M9P7gmBuiPg7P1Ah1B7VQVVCFJuoDDFYpXjW+7Ch82GTTj7G9FMFuGwp6//ol7AprPmdfvifBF9fleDMfAEXersLkBhT3440dWuxbpd3brhVQ63uoJC5wjDhClv22G2Of8O7cJe5w+1w4hVkeb1zc/f8uynGWRHs2HT26vy8BlneuCNi2RFwndVAvvmMgZBYw4hsnlVYPabP2N3DTK3i7yYxetb/2oqk/woJ/+3XoIc+P1iwi0SUITXxHnq9tw3nIb6b9J0UZLaY2Zn4SDhWiwg2+/eC8axABCSof/UjBrPNcEse197pgrTzlYkQV31xKj9M6lVe5MhcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm8H36Mqg++2XL22FIf0s8hDuaAbNvuJ1nEf4TdE1hs=;
 b=HMZU2lxIBr7NsIfhpVW1xWOtkX3bsDG7uZb10EyU8cLKjoWX0gJDX7wbrtPhwwAYTE3onJlkZeuV7jQwrc+4pova2cMSRonngu1OjAGa5vLD4efJTjnPulU2rc6if92WT3/PWhd6l70mTKzzvo5/gn2cU4SoxtAGLk3Ts+V4XnGXu6dTdCpwE1JNXUVcHW0JnSmumhrjhSqJGB5bC+bRwOsOfMB99eBjqwHTQhKx+2wu8hLuavE56B/SWi9v6hxOxSBz6RG1k9Ruc8US+xC+GnAYy5nu9jI3b7KfvBgkuzc2mbOCcCqpXgi80vWIv5bCErpmMFILoT72wU6X4Of2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 21:02:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 21:02:51 +0000
Date: Fri, 26 Apr 2024 16:02:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 08/11] drm/xe/xe2: Add workaround 18034896535
Message-ID: <sw42yhgzfjqdvkhwfzyrjh46ncle2zq5mzohnzxlria5xqsgns@li2vup2xf4ea>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-9-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240408170545.3769566-9-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: ab48f673-5806-4666-537a-08dc66343bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7EFm0hm3Y76e9O0w8XhO+hIrz0EeAd3vZb/+KRlLMqH5X6z+qbPKSguMFApj?=
 =?us-ascii?Q?1qMMvyKSM7ICZCj4ifDsEAIluAgpvppCio/fpQ1nYLCqVsuzxwULEKgrbXK3?=
 =?us-ascii?Q?frCx5BS44ksR0HwcEZQwGgV4e14zPe7NQLASJCVvOI0AobPk0ET8XsHOYCFx?=
 =?us-ascii?Q?lAMZ82DjcSw3OPlkCDlQPkqZUDlpP342HGQ27dJfRn15lt1L93S8VPEw4Ef7?=
 =?us-ascii?Q?2AzwDGVrU5+uSwHOw85Wgd6pHaG0k+GKc5VJZsaHTWnC1I6fUbYa79AiojMH?=
 =?us-ascii?Q?AXTnErTS6VndbmUNr9CGhNX9ySJSMot2+XIrvCsFNcbxxqkzhV4opCi+e0pD?=
 =?us-ascii?Q?NW2muSxnh7B+JOMfIMk+vxNb6gZGKCgCsIHXP0DnCE2bORPOqOFJUNqz++mq?=
 =?us-ascii?Q?ICjQKFMXGZ3+xlATqM23Jjv1DogM/ZQg2Jbf963DXIwYFIMhZrBzIqSjLrcL?=
 =?us-ascii?Q?ymvLlCjn6kCvGpFvW67OgLCj6HRHvYU+nmQXhwguwasvVeqYNHUWVrLCGlTy?=
 =?us-ascii?Q?FXwplspFWeqvPsMn80LLbRHzkAiUFWhzwFWNnklKbEV32TsMWiUqV0ZuMIRd?=
 =?us-ascii?Q?3RaaVVQX81mw4GhR+LXRFgDKg8eXFZWGaD/zpxZx09vw81RzTcJDxenTa+SR?=
 =?us-ascii?Q?XM58wFYBvuxsL4WL68+4whunzjtU7tfY4nz2Qkn+6Ywq5THsRm6tME5+kVg1?=
 =?us-ascii?Q?wIv0ckS7wYsxg1Qg8ozGL31yW5DbU0qO7CkBF7gefr2MuRFCoBpkMGE/xqCm?=
 =?us-ascii?Q?5rA0MValDpvlEL5PK1V+gkbZON0VWq44WSPqogUF8ZBPein4aWi5DWfGimG7?=
 =?us-ascii?Q?F82TwxZfgtVYRWgyoxO9TNQ1Y4VYRJc8SnXlDuOG6KKwecx6d2TUOFSLBz82?=
 =?us-ascii?Q?BAFxMiNWWgWmivGeHYENoHQqxD9XgQ2H4Mfg+kEb3mYTFU5j8/yvM20UV1MM?=
 =?us-ascii?Q?1DDzWLEJX3xN6JsqBExOrzeVAeMhe5PCwT/8G0NRZFlS3NnD5JZF6Oalf8hG?=
 =?us-ascii?Q?qHiUvAOfKIYswPwByjup/d/duAIyWhrozyhWhzRgcBYrmW5W/Z4PqGyvWZnl?=
 =?us-ascii?Q?md+0WGPErE//vLRod8PG5ah+kwmwtIG1zReAfN9lTZWYZhieqCFJczUbMwCU?=
 =?us-ascii?Q?YaqfgVrnMkFuD5l6qW5yvfPk2y5MKASdI1i/7rRyGH9N51SJRONVVi0HNa10?=
 =?us-ascii?Q?8OeXKEXL0cYxJuGNNe9H2AJxRPpQgDd5C4Ul04a6uskMBAO5kyrDtg4O78N4?=
 =?us-ascii?Q?EJLqdDsKbyEvEI4bo/hocn5s/6H73TbL2n2Ihk0lYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEt785TYThCRGQWUs7TiWiBSL4iod0V6Mr5lV58RS9XEWejl7Fz1uk/D8fPX?=
 =?us-ascii?Q?Buy3/Okho/UNEg229h32U4hp4DLx/kaLfN0Z9pnqKPAja/j5eHHOUE0SLrQ1?=
 =?us-ascii?Q?lm8Obj3OsFO27x/5FydN9qwNOd4GyvEmFZjwe4YYmCZ8ew8gi/yyZAJKa5mY?=
 =?us-ascii?Q?DSEMePZWQVowc9kxMB25O9dfL6mi9kjyQrKYjJjbUMXZQnZScJvkwlKyrvSX?=
 =?us-ascii?Q?+634LAe28FhaVaJyLtMQ56BhmblgZToNiujNRcoNoww84/9PpjyiTnhnRjUU?=
 =?us-ascii?Q?qCGcAkU9srFpbSoDAnvI6FnqKApZsFBDGQAVAShuOQ8iaY/Heahsoi7YrA/o?=
 =?us-ascii?Q?FSy39BYRHM+uPQ6weQDp0oP3Il070jJv/ia3MJwnXCS4K78S8hKX1ZXkur/H?=
 =?us-ascii?Q?EuoGXtuIEbjkA1Z0IWtBbW8uNheiPyKdX25p4PhKhqxVjV270vlnqqvtlnJk?=
 =?us-ascii?Q?DaRNggKimK7BZk6WgEbaK7JjH8MEuW/A1Z+32Usp04xErDaNkzI6hDZ5km6A?=
 =?us-ascii?Q?xo+O5jMs/4AB9nMxMuuVSKdoP5WEbjXFPV7WZXweZ+/Pw8vQoXA7WxHZNLwJ?=
 =?us-ascii?Q?Lbg+zyslCMKoStThi09U0DNHykgQWbZesmladxarb4MmaEhPjYB+rT0xVM4E?=
 =?us-ascii?Q?xsoJbjrNl/jGPlv8ZfxrSaEpYySkgFN1s5M8AHoY39K/1xUryoPFaILPeoQ1?=
 =?us-ascii?Q?sght1Y7V9aHi1KTBRQQ76z8axLX5ARcJQG/zoOMv8hynY+l67MxlRZ8uNCV5?=
 =?us-ascii?Q?yKAtoHq8P0Jf1UmY66PSlXe2WFcs4wnRFPEezPQetP4JP3R8Le6QM1DifJvH?=
 =?us-ascii?Q?h9k9m1+F4j4j67fBIesrKQQMlsXO3cBTAdBPgIQ9dKWTXg0gVGhTNBOLud/6?=
 =?us-ascii?Q?CTfXDO9Br6MWYSWoocDNgdy/58r6Ph91kDIuWoDiRW9UbeX6rqZl9HDwNDTA?=
 =?us-ascii?Q?jNOjSzDB8pwLA74ieD3mAnoqUPrt+uZZjA8/eqBGADnN0vm/vla8Jp7L3hzP?=
 =?us-ascii?Q?GLr58v5vKxD4lCoYP6tU0WGhZnrnidYahK1hmCzVgT+8QDYJ5+u1v9Y3jMSR?=
 =?us-ascii?Q?2vMNfA00Rl091QZRo9Edg/L9FzxyN+6iFJuoWNkhrX2LS8Xj/JH2TfCdqGU3?=
 =?us-ascii?Q?Skjf210TQRGNGitpam2RGvrWZFcwyORbh9TAsly4+4ebsgsxrI9sbxD/mGIA?=
 =?us-ascii?Q?lNhaVTB8kn/pwGyI+qDp16qzkK0O5bblHMUI8yhuXIdRXeyLh4u/G9ZFV/Ii?=
 =?us-ascii?Q?Taw3s6yophKNXHZRDpep6Vjj1kUs0dU5MT6XhU+tq1w3PRd+vDbTNYHo+DGK?=
 =?us-ascii?Q?780OAcxlgK3XFYoj6jWQa35DVbwMwf5quYa8cffs/5OZ9E/XQufCMdSFDglc?=
 =?us-ascii?Q?SzAk7p8JmsXDPKr2BUZTivi0kHTd5He8JluevU+f7hi/qCG7a31akWXKjel8?=
 =?us-ascii?Q?A/TKGUILPTW7/5TEVACCR2vMgl+tsmI9D6sM6PN/FGBxFGrVuiWVAxnZABw3?=
 =?us-ascii?Q?kA2mtoWuWyZL+XO7BwZOEyTLTyxfykEIpryrrY+MCzuemfIoMkvynR5XE3JS?=
 =?us-ascii?Q?z4hI02OggQ/pUvvHe1VJbT8T0m1k+JVqnOVu2SLI+IKrEuPjB3VqZocGOw/I?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab48f673-5806-4666-537a-08dc66343bf9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 21:02:51.2746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34++nLzYPvXWGGSO3kvgcOq/vB9OsvTpkeEH5rnTsz/c/nbiCvZ53NQDICfdeWwZqjQJrr3Pm5H+WaH7eF86xa16jnRfPKTzxizeuNHYBeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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

On Mon, Apr 08, 2024 at 10:35:42PM GMT, Balasubramani Vivekanandan wrote:
>From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>
>Add 18034896535 as driver permanent workaround.
>
>v2: 18034896535 and 16021540221 are two independent workarounds
>that just happen to have the same implementation, hence keeping it.

that doesn't work though. Now we get an error in LNL:

	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] discarding save-restore reg e48c (clear: 00000200, set: 00000200, masked: yes, mcr: yes): ret=-22

That's only visible on stepping A* in LNL. I'm seeing it on a LNL I
have:

	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64a0:0001 dgfx:0 gfx:Xe2_LPG / Xe2_HPG (20.04) media:Xe2_LPM / Xe2_HPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0 cscfi:0
	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:A1, M:A0, D:**, B:**)

It looks like in CI we have B0, so we don't see the issue.

	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64a0:0004 dgfx:0 gfx:Xe2_LPG / Xe2_HPG (20.04) media:Xe2_LPM / Xe2_HPM (20.00) display:yes dma_m_s:46 tc:1 gscfi:0
	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:B0, M:B0, D:**, B:**)

We may need to revisit 2 things in the RTP matching:

	1) The stepping is non-inclusive, while the version is
	   inclusive.... this is confusing
	2) Maybe we should just log rather than giving an error if the
	   value is exactly the same?

	   Currently we do:

	   /*
	    * Don't allow overwriting values: clr_bits/set_bits should be disjoint
	    * when operating in the same register
	    */
	   if (e1->clr_bits & e2->clr_bits || e1->set_bits & e2->set_bits ||
	       e1->clr_bits & e2->set_bits || e1->set_bits & e2->clr_bits)
	   	return false;

	I remember this was useful to find duplicate workarounds though
	(or some that we were implementing both as WA and tuning)

For now I'm thinking to just merge the entries and add a comment.

$ git diff 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d9b7fa7a8f0..db7c7c7875c5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
           XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
           XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
         },
-       { XE_RTP_NAME("16021540221"),
-         XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-                      FUNC(xe_rtp_match_first_render_or_compute)),
-         XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
-       },
-       { XE_RTP_NAME("18034896535"),
+       { XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
                        FUNC(xe_rtp_match_first_render_or_compute)),
           XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))


Lucas De Marchi

>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index c904e55ced9c..43fac92e5d20 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -428,6 +428,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> 	},
>+	{ XE_RTP_NAME("18034896535"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
>+		       FUNC(xe_rtp_match_first_render_or_compute)),
>+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>+	},
> 	{ XE_RTP_NAME("14019322943"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
>-- 
>2.25.1
>
