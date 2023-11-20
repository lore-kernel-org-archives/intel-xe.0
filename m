Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D4C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC7C10E0F4;
	Mon, 20 Nov 2023 20:20:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43610E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700511627; x=1732047627;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qq+ifWSUjlrMtyufFJ1hRrDa+MsHa18ooTYRwe0ej90=;
 b=VOiN8LrhXmv7yEW9HCI22JaibVbLN9RXYqiqj+VKwHQI07TNlvj/w+Re
 4feh/arcVO212GlI1xbfEMPel/bxOEklGmmKWroDxhkAiOtkCYJlcJ60v
 Impmz6bfJfijT+KpINHlbKVHQe6Gz5tMSpC/D0AyAMUJTw6rA75tySC/b
 Y+JQC6FWWRtiiXgNkMFchJrGx0W2yNXPydc5bamWuNXmZEorW92CkPokr
 K1K8xQBZpplSwiZG1yNpxSh+idYzO42xciYz6IkQlSJWaI62rdyo6T0ge
 qcIf9NJOK8+yxKkZxU97SlSyi3/uLG2kDqUcAPb8bKIG25FPpucfW4lX1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371873084"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371873084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="14691414"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:20:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:20:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:20:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:20:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt+9Ev/qf4cLgcYCF558XmqVtAAGgfFOFj8MRD8QsublrmaijdRwAPH8lM0MaJyhQkXDFBoZB91qIijKkDld9WRuZg2Y5G3hGWBIYX8S0KzuqxTGVUmfm+BnhFMXyNZeSOb9nNuGPp8rm4knEbxSjlp6+9JNlgj7Wtz5cy/3uBfJWTtxDgtK1MdgqIvPmQ0olbkMAJpIQniBpg3E9SuKSqdgBLtssX7w+g8LmPn2q765QVpbM61Gvkmb/bgefQFNWyDpc+FpINEofevEtQ3sooF/765vLfqFUBPl5tSvrmIsUq8S8C8W8r7lc2QErlpdRuQkvQbckXOa7CeNZAcolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z4jo9NQr31Mtpjy6y4y7wPC3rTisoY1+6iQew/hZG0=;
 b=dFCcaxuAvf343RYX9li7i96BuO0cGXgvH0b29PEAu5H4r7hp0L4JRZhRaLhrE2Dq5bK2ds/iIiWcKygX4/kuMUomHseFUMEIFXNbxhOztXyts3TWhAUXP+dIpZF2VIohVEh1WQq6QbArJmaKQs5VoAGY6Wx0KSYOHT2knvsDZZZyFVInQLqQjeC6VbeNkYWSgQhOtaBCYXHFUf/0GgpmVY+dhsR3iu27/xafXf4pDvQcNufGibK//U98TyUxZORNFcrY1ZYP2/DG3oCNdcn46THVDZiBaQNeE0Ftf3Fnxb7huOKAEFk3tFgNaklKMRS311tC413/NcEMs6DMA4aZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 20:20:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:20:24 +0000
Date: Mon, 20 Nov 2023 14:20:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <6tspngnkj5qz7isixbeeb3a4chshdxb3may2lhvpkq4qqwusu4@yfxff2bq4yia>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-19-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-19-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbad875-270d-458f-b516-08dbea06209f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xtipQIgAkHtW3SL0FHulViYfenEoM8eE4jyJ9LG+I7UWH/XGXIajzqqU05nyhI/oEEnQbSJZcVT6j2jJjG8L7p6r29RnXy4odFfPaslJFPn36PlK1Bzx1BKpx4+NiuqVaqnyN4HGvGczPEFLcX6vAWYutlds6ncHM/IziSzl0RpqejusKUjCbROgTKArze1ilofANX3W2lAxcF6sCG60FTQMzXkHbsJbwtfS2OhsZwGGVJKH3UL4mQhNVIO2bO4eP6dEBPXKdT5OAmoqXXkwfeJxiFfXB70O4VYfAMttA2KF8BmKeifg6IBcAuypjeo6YsXpRhYmiSv6z5QVKyESkrbHq9iIcplH4YHLiXnTSFKavjqC1dq6OqsAA8a1tHBGjpT0IMmIc2MO7aTHIzEhrDAt8T88saG8hjBK+4lba7KwTP1Irrkudebb0vx5AeoqME7yBu4pQWIXsmbF4Uvfh2NoJ/K/QyI9yjAD5PZqlI+OPSTWKBn6i4PfXiDwAQmxEr/Ykn4Ucrp2GKNb+LoQ1ld7SKox2+4FvJtcEJpLd89hdK9OJRO4mOkFY0FPZ3+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6486002)(478600001)(26005)(107886003)(82960400001)(6512007)(6506007)(83380400001)(38100700002)(9686003)(66476007)(316002)(6636002)(66946007)(66556008)(5660300002)(86362001)(2906002)(33716001)(41300700001)(8936002)(8676002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2c1aXRpOWoxdGRCbXpKQWRYM1RNN1llVWIzV3pGTlU4YmZOOGJJbHBsMXp0?=
 =?utf-8?B?SnNmOG0wRWN1WndRMnAybjh1dFhPNFlGT2I3UmgwRkZZeWVnYzVEVEkwRDVl?=
 =?utf-8?B?ZGNXSDRZNzlVbmxMNEZZV3ZtWitIRmw1SklWU09PRFgyQ1NwTCtSbm5IQTli?=
 =?utf-8?B?YTEyODNhVlg4aEtWSUpBR0tnYzJMT2hpSWV3aGJNNHFrc3doOE1kTVdGbVRW?=
 =?utf-8?B?MkZBOEt2UHozMlhPei96TkVOR2RCRWgzSVBrcFhYSGc5RDY2U2F4STF3MnpM?=
 =?utf-8?B?cnk5bWtTbGpReTIxaXM3dXNGQ3psdlN6NGVrVi82VHZrcmJwaDE4dGczQytn?=
 =?utf-8?B?cXlxUXFtVGRzZ0NINXQ2WjV1cjI1dW9jRERqa2lISmUwc3VqT2h6WmQzem4v?=
 =?utf-8?B?WDhZaENPRXBwUHdCMmJXZm83VmxCNTNRdjcvTlhSclgrWG9STGtEM0NEbm9I?=
 =?utf-8?B?SmxRQkE3dzU2WUhDMWNSU29zVGlnWHZkV0NPSWtQbUN6Z0E3NjlFeHErV0p6?=
 =?utf-8?B?THpoanU0cWE0cWJyQWtJZTZHNEhCUlhvc0hMODJJQWZrUjYrQzJBWkkzRkFz?=
 =?utf-8?B?b1oxYmwyU0g1VWs3bGg5QXpmMFk3blE3OFV0OGJ1VmM3MUgxQ0Q3WU8wT2xJ?=
 =?utf-8?B?bFloamhaUWRWM1BONDB5aFRNNkErRmRZdGRDZVY0MEIrZFdmdnlBNHI5QUNI?=
 =?utf-8?B?SnlGUlYzekhCd05sc3prcmJzeEpEeXhyK3ZWb2pFek1VeHdOMFB1QUFvdzMv?=
 =?utf-8?B?SmEwNFN2Ymhaa3VxU0Y2MUVmcm9UWi9MOTd2UjIvTldYM2J6VnZZZmMzS1J4?=
 =?utf-8?B?TFQybkVpNE1zZjFWTXRDaGZLdHY4RlNycmkwTzhrQXNEdGRwZHAreCtSNlBt?=
 =?utf-8?B?bUovWjFMc25yMUI4anFVTjEzN1o1Sml6alNQaWZtNlI3ajhaM0FZcmlvdStW?=
 =?utf-8?B?RGdtZStkTHdnNGJHZGhsdkppd2g0b1RyWjZBOTd0YWZlMjFJRWdSUVMzZEJZ?=
 =?utf-8?B?MWNHS2tyUmtobW5pVGpwSkVVRmFkVGZENFgwb0x1bFlxVHB6Yy9qdWJzcGJW?=
 =?utf-8?B?RXBzTDRRTGJLS1o1RlBTRjRFbXNpU3NJaTRhZjhqQjdQWUV4aGVKSnVwYXdV?=
 =?utf-8?B?c1p2RWh5eWFxYlUrNG15ZXhmUlZEUk5PS2ovRld4R0lvZkVJYXFqcnFmSjFG?=
 =?utf-8?B?UzBvL29VVTRBUFZ2R2FkZHhEam1tTEQ1MmlDazBhaUovdDVzd1V2SWJERmpG?=
 =?utf-8?B?NE5mMlZGWi9ZVng4bHZ3K3dvYVpCSjQ4Zy84YzY4c21MYnRDTGVYOWd5dW9J?=
 =?utf-8?B?Q1RJN3RpWXJMaHoyV1ZhZ0ZpL2JsczF2UHg3WXJvYW92dDBGSXBnbDNPZTlv?=
 =?utf-8?B?QS9qcFlPVk9rcnlOYTViTzBIbUFHQU1zS2JTOVFEckQ1NWV6bzBQb1VyYTdn?=
 =?utf-8?B?UXpaWFJDR1BYd0ZidkNxY3A0WStoNTNqOHhxL3VRR3BjNmRKQzJrZDY0eEM1?=
 =?utf-8?B?anErTE1pYjZCK1pWeXlIWEJBL291dVZBNkQrNi9XVTJEOUgvVFFjRjQwTG5w?=
 =?utf-8?B?dm9McWY5NDNNU2o5c2hZLzBFeUV4aUhQVzVpN09hOUViMitIbVN3SWZ2TEtN?=
 =?utf-8?B?Q3FuRjM4VFZFazJiQzlISXRIT1VvZmRhYWlwaG0rK2sveVNCbHJYSXJnSlFO?=
 =?utf-8?B?SjcyU2VIN0pZbU8rSzQxKytyRWlqWUlLdmRDZUtqbER5dlJWUUxQSzBtWUR5?=
 =?utf-8?B?QUtUbmplWndUY1JyekhTYzZaSmNrMDVKNmpEWUJJNWxiZWQ5d3dMQk5QR3dP?=
 =?utf-8?B?cUlOc21HQnVScHFUTnNxVFhsWkdCcGtXYXhWK1pKMWgrVktvdDNFVlkwL0Zy?=
 =?utf-8?B?SlJYcFRQMGhJN29IZHZhNW1Md1U4QXplODNoTzNGVkd5OVZGNmZaQlh0d2t1?=
 =?utf-8?B?ek5LK1dxNGloMVErdGprNmo3WWxUT3kvZWxScDdTZzJoTlRPNmFZenpzdjJa?=
 =?utf-8?B?Nkx3TFFyNUV0YTVuN2JlYk1la0xEalJpWnZDVTJFU1dLdVkwOHF2VnowSUdS?=
 =?utf-8?B?K3dHTWg3N3h2SENCdHAzcFN1M05aRW1mbzZhSm84M2s0SHhsMU9VMVpZNSs3?=
 =?utf-8?B?OEZJZmhqYWR0ZVdoclltUCtQNWRMa1FvbnJLNExCMXBacGtCR1ZVbHBGV0c0?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbad875-270d-458f-b516-08dbea06209f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:20:24.2406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmBHjBoBAhyYnCj6sfJVVNF8/JsgsoDlR4TilV8+EH0yGYYsfRmQZQjo76REg08QO7vygAC2ocyT2BYxrfR3cLU6psWjK4w3M5cCoGWEwe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 18/20] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:29PM +0100, Michał Winiarski wrote:
>GuC load will need to happen at an earlier point in probe, where local
>memory is not yet available. Use system memory for GuC data structures
>used for initial "hwconfig" load, and realloc at a later,
>"post-hwconfig" load, when local memory is available.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c     | 45 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
> drivers/gpu/drm/xe/xe_guc_ct.c  |  2 +-
> drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
> 4 files changed, 48 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index d1181ddf4bdae..3f430d5bc1051 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -251,6 +251,45 @@ static void guc_fini(struct drm_device *drm, void *arg)
> 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> }
>
>+static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
>+{
>+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_bo *bo;
>+
>+	bo = xe_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size, ttm_bo_type_kernel,

in general we should not access a iosys_map like that. Maybe add an
assert above this line:

	xe_assert(xe, !(*src)->vmap.is_iomem);

>+				    XE_BO_CREATE_VRAM_IF_DGFX(tile));

humn... maybe we are missing a XE_BO_CREATE_VRAM(tile)?

Lucas De Marchi

>+	if (IS_ERR(bo))
>+		return PTR_ERR(bo);
>+
>+	xchg(src, bo);
>+	xe_bo_unpin_map_no_vm(bo);
>+
>+	return 0;
>+}
>+
>+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>+{
>+	int ret;
>+
>+	if (!IS_DGFX(guc_to_xe(guc)))
>+		return 0;
>+
>+	ret = __guc_bo_reinit(guc, &guc->log.bo);
>+	if (ret)
>+		return ret;
>+
>+	ret = __guc_bo_reinit(guc, &guc->ads.bo);
>+	if (ret)
>+		return ret;
>+
>+	ret = __guc_bo_reinit(guc, &guc->ct.bo);
>+	if (ret)
>+		return ret;
>+
>+	return 0;
>+}
>+
> int xe_guc_init(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
>@@ -309,6 +348,12 @@ int xe_guc_init(struct xe_guc *guc)
>  */
> int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> {
>+	int ret;
>+
>+	ret = xe_guc_realloc_post_hwconfig(guc);
>+	if (ret)
>+		return ret;
>+
> 	guc_init_params_post_hwconfig(guc);
>
> 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 88789826e7817..88514d09303d0 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -282,7 +282,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
> 				  MAX_GOLDEN_LRC_SIZE,
> 				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+				  XE_BO_CREATE_SYSTEM_BIT |
> 				  XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index a84e111bb36ad..8f190cc0e5527 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>
> 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
> 				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+				  XE_BO_CREATE_SYSTEM_BIT |
> 				  XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index 45c60a9c631c3..6334311a56e63 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -93,7 +93,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>
> 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
> 				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+				  XE_BO_CREATE_SYSTEM_BIT |
> 				  XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>-- 
>2.42.1
>
