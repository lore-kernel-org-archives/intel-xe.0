Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84784C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 14:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F3D10E4EC;
	Wed, 31 May 2023 14:36:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2710E4EA
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685543779; x=1717079779;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ldHz72OUml6J3jE+Y9PC5Pxcfw2Q8q1EuT8IHXqORJs=;
 b=mOI79zxORhk2UbtRYFRik9aFkKsK3qO+/+nM0k0DkxL4WBtLECBMH2e2
 xsiMzcNImOwdEvcM8I8uFP+yZwXb1Ok7Ch6afL7zJnWRRGhsUuL9iun/C
 V03e3ggOD4crEoLhsE8Fda+XbGlzFet96Zf4j/RQT4vIpJqOkw029Sl63
 tr8wr+i4AkKnYimuNopgwBDTl4s6iKEqpmBarYEJKFkzd6RNjHpO0iM9e
 vYF+BwTJICJDeE+3NESBl7Nvxi2/zZRRGvrSc5T5373G4G90rJhCHG6R3
 6qLwwFGwN+7ZAESH/jiI9EhPF5cmYQ5taxtpXXJfPpNkrxnMO7oakoel3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441613641"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="441613641"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 07:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710104263"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="710104263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 07:35:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 07:35:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 07:35:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 07:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+WV5m5Hu8zSI30Wq7JMVkBQwY7Zjcg4Zc6MxT9Ec/x9DB/1KzezIKQNWQp4NbMv4IHtZUtbKScEuoiU0CduMb/yAKq2sK3Ya3wNB7ASrZN59+rMWx0S932klDEmCs8QnyoBOItN1UoOvGDz6Cfvid2QSi5xnu7BEQYPqdh+De+pqagfRsauxQyo19HM1mH6HoAp7OidCpw6xTgmLqaT3c0Vk+atoC0a95fSXO5jCERVPnUajOn57YhHP9ZtL34LTP0kIL/kX6zff8ATqqFyV/X9GnoNAn5dcTngS0DaB/BZcg0KeuyXzVyWdsBbujbrPxN4KsK7NyNkpipW9aItug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9InRGReH4CSWEbsUrqeEWnJIngVHMg6qVQ6wbJbZu5g=;
 b=MwXbRlUQV+QxPHNyOAoTLFpBllYQEMdA2jFSPuUPEMspiM7uNsZWe7MMLu7t4tIeflxoGtUo1x65VQZIIFG5bnH2O7ZZTokrtVV5LF7hNKl6oxFd+TNdaueXBK3/9dalxHUo+psEshOxmvF4rLN2s4LSHmT/9h3EUXYGeouUYW+8eT3iqSTHXXLSUcxMpbUbzRZaGMrxhMGGctWb3lfmr7tfr0AiUkfdxEtpK2W3WrDGtK8CPm2OtlNW+1/YwrM2eLJ7fuv6uH09Y6O4gsZquiMZFnh/yZptdWYx8WaZDQopOx1i94Nheeq+wtLasXnSyvfxXyKH+ZWXLiXpDhz+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 14:35:38 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 14:35:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530211549.2632538-6-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-6-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 31 May 2023 11:35:32 -0300
Message-ID: <168554373252.1068887.17195142640775667800@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c08239d-dcb0-476b-5b10-08db61e44d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFTgusVFj83UJVw+tO7HKXcHltx+wfHFS7HoDYuhFEc6c21jIfGM71zl7GduQbgDx1vhAq+rw9eM/8NeoTq7rblx/Kjzt5NU3hhi0BXs9Qyj5ACREO8RgrGSE57cHeIeI5Z36V+EmlFLGrTnpJK/yenVRNvFP5Cz5pXnFjj5zYRr21MvjdeLDQs6SCL6kc0OIRgNyP+9NY2SNIUta8j8bkfzSSmVLieoNvx+4LLzpRxV8uu/3nTYg3tW3DpKpywOBRTWjmcu50r7grvuX16x+okTy9KDEfBNq1Yc4ZMX0IipucLM2d0BSXW3w5+FWwkXSw8ZO0lr4tPpbftnV89spOO5VjS4vnHlScknmgrGr1cybwS3owtLxJ8oFpXUuiNIKIOJsMQeZVTSFSlvhZgxqTCchqE3yzXlnoY0NwxeBvfTTZLqs2ARDp16/Q3QvTv82JAuFXl9CuMInAa6VqxLtHvIHbdoTPBwlc9yepw8a82xo0R7DhxIy5vuadmRonVok3QPWUVcpooKE/kNDVOHZbO1UcqV07FPKc9X6IzeSeznhAKqatioMqpKWEnZe6DO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(316002)(6666004)(26005)(6506007)(6512007)(9686003)(82960400001)(44832011)(4326008)(66556008)(66946007)(66476007)(38100700002)(6486002)(33716001)(5660300002)(41300700001)(8936002)(8676002)(83380400001)(478600001)(86362001)(107886003)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXQ5Z0wyMEdMdzF0QVBhUnFFZnM3UGQ1NXppRWhKcUJoaUV0Rm05VU8vY1Ra?=
 =?utf-8?B?amw0T1lDcitUSEc4blBaODA1NFBPOGIzSnVsUVZzVTJQMjcrbVNHYUs3T2M0?=
 =?utf-8?B?dlUvTlZPTGZPY3FWMEJIZ3F4c1c5cGZUemcrTHAvcnE2aG1FRVNSdzVDMSs5?=
 =?utf-8?B?Z3AwZEQwYnIrcVByN3g3T0pKck55OGEvSE9aNGFtVHYxL2NzYm4zZ092eEEr?=
 =?utf-8?B?TkoxaEp0ajJXYWMrYlBScm9NUzJwQS9rZlFmSUhuS0Vtd0tpU0lNenBBTU8r?=
 =?utf-8?B?cnYvVlkvRklpRUhCeFNZNVhBNWxwc1l0UGJjeFlFL01GTWcyZWhoK3VLcnVu?=
 =?utf-8?B?WEFkT1pMTDNFZjAwMDNzQ0lEODB3WVczcys0NmVpUUluS2tSVEkwT0puWmJF?=
 =?utf-8?B?eU1BUXdmaGxNSGQ1bEpQWGpaL2RXK1ZsYjBqNEtGbktFTlhhKzRybU9hR0th?=
 =?utf-8?B?QkdNZTcxSkVUNCtPbmxLVldVMTlmbk9QazhzL2RwUTJSeEh3a2VqaHFnWVZr?=
 =?utf-8?B?NU41TFFiR1NNak00Z1hscW41NkRTOTQxaVpZWXZQL0NDbTRucmZVd1AwdG1y?=
 =?utf-8?B?Mlo0bkp4elcrQXp6SmZIK2Vhb1MvbWFXWmZETUtYOStlZlUvVzczRk0yTyt0?=
 =?utf-8?B?d3lnUmtEZzJ1Ynp3ZzQyL3hpUFdpUDR0bkZpU0RXTUo0YlI4NWpPU2pKS09x?=
 =?utf-8?B?WktZdUZUNXR3MXl3SnRzOUZBZ0VHb1VKK29oM3U1WEhaZ2QvV3BkMy8xS2Ro?=
 =?utf-8?B?MU9kK2huaVVsSkVqWXNuY3VpNFRmRmRUbG10bWRCdk9kcGYwVitqZ0tPaW0y?=
 =?utf-8?B?N3FEN0lqODMxZytIcEJqM0FUYm9XTTcvTmlaSnZPdjRUcElqUGlHMm1Ga3hu?=
 =?utf-8?B?RkU3dDZzeE15TmZ1ME13TGhWbXJzVjI0MjNIbHk5Wkg3RC9ISG5iRkI2V1A5?=
 =?utf-8?B?NzQ4cDVaTGJYditWOHI3eVlCYy9BU3c3Q2dFWGFrL3g3VzJMOWg5WTU3Kytr?=
 =?utf-8?B?eUNKclorVUxIUitkUkg5ams0Y3JMSTlINmR6dzgvRnhyaW5tTitTRlRDNnVI?=
 =?utf-8?B?aEp4Z016ZURmdzdEdmg0anhZMmcrYkRNS1AveWlwOTVQbFJLTXFJaUpGNHJp?=
 =?utf-8?B?TGF2MStiaEFRclVlT3NvSFk0akcxUyt0MDNSelpQM054c0Vjcy9SVnRsTXUr?=
 =?utf-8?B?OFFuYUgyR3pFbEtRS2hIUkIzU29yQUVQZWMySWVRNmdZdDhSVmNOK294TmlH?=
 =?utf-8?B?c1lyZEZWMGlDTG52ZTloOVAwNVdZekxCenNEUFlMMXZjblFpRDY0b1VjTDNz?=
 =?utf-8?B?YjFjMGs0T3kwbjdmdDlvdFpxNXY0Mkx4VmpxSVFta1hBMWoveW5MZEVZaFBL?=
 =?utf-8?B?U25WcDc4NWcyZG5BeWlhOGZEZmtZcVJsWHFDZ3RSMkpYUDJSRXVDaGw0VFJy?=
 =?utf-8?B?Q1lnQ0tYdEZxN3F6V3JWdXBYTXVkVnNzWlpibDVHYlhNNlJlbmRmMng4UXRl?=
 =?utf-8?B?WDlyaUNua01sYzFZNVhCejQ0SmNoUllFaXhxTzFSakxaZi9nUFdGM1psUzdH?=
 =?utf-8?B?VXZGWVVQSGpIQ3NPbFpScno3UXI2TGUvbmhDQTlKalJ5TXNZK2FWQkYvU1Uy?=
 =?utf-8?B?SUM4ZTBhRmY2VnFtSUdmYmVMY3MxOU5TSmlQK2VTa2dRMnNhUUR0RDRIQmtY?=
 =?utf-8?B?Q051NzN0TWd6clJEY1JGTVNNU0hqai9YMkFiN1Fma2UzTG9NRzRtK3UyWTZM?=
 =?utf-8?B?bjR4NC8zdkJGRHBMY2pmc1V2NVZnN29wdWxLcHpzZDdxSzgzZ2pab0hqdzg0?=
 =?utf-8?B?ZHdCRjFMZ3gzc3V6dFBJNEZZNVpSY2IxK3pSTE9PM0pIajlmU0RiczFVbzly?=
 =?utf-8?B?S1g2SW1FakRTK1dJbXl0Tjg0S1doNE1BdzFnR3ZhZ0p0TlQzOStRNzVrZ3hX?=
 =?utf-8?B?N1p6bTVmcTRRSzNMc0taRnFTenp6cEZhTXltZHFITEdXNzMzSUhFSmVCN01t?=
 =?utf-8?B?bTFib2ZiSGtOcHk4a2UvZUVrakxzN0J5UVFDOUZPTWJFNmRydWVQUndGSjFF?=
 =?utf-8?B?ZVFkMWJPcXd5ZHhFVmxmbE5UNGhGRDVydGhXdGoxcDU0Yk91M25TMXJLR2Rx?=
 =?utf-8?B?TVlkcjdnaE9vbzBpbXNaeWVQWGE1QlArdnN6ZFpUTXcxSUhmNmU2RGZMdWRq?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c08239d-dcb0-476b-5b10-08db61e44d8e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 14:35:38.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ga3DHLnUNIEyQQ4oUugIzmw2Vh5FIljMsFFaggwaG1ymvcKb099FKixjTk/ONkxj+ubfRW8MDuPIQXCtm5/w+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 05/31] drm/xe: Add for_each_tile iterator
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
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-30 18:15:23-03:00)
>As we start splitting tile handling out from GT handling, we'll need to
>be able to iterate over tiles separately from GTs.  This iterator will
>be used in upcoming patches.
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h | 4 ++++
> drivers/gpu/drm/xe/xe_pci.c    | 3 +--
> 2 files changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device=
.h
>index f7acaf51a1fc..745dbb16d417 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(str=
uct xe_device *xe)
>         xe->info.enable_guc =3D false;
> }
>=20
>+#define for_each_tile(tile__, xe__, id__) \
>+        for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__++)) \

Wouldn't it be safer to use (id__)++ above?

--
Gustavo Sousa

>+                for_each_if ((tile__) =3D &(xe__)->tiles[(id__)])
>+
> #define for_each_gt(gt__, xe__, id__) \
>         for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__++)) \
>                 for_each_if ((gt__) =3D xe_device_get_gt((xe__), (id__)))
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 551ba20083b9..91d5dc59aa7e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -559,8 +559,7 @@ static int xe_info_init(struct xe_device *xe,
>          */
>         xe->info.tile_count =3D 1 + graphics_desc->max_remote_tiles;
>=20
>-        for (id =3D 0; id < xe->info.tile_count; ++id) {
>-                tile =3D &xe->tiles[id];
>+        for_each_tile(tile, xe, id) {
>                 tile->xe =3D xe;
>                 tile->id =3D id;
>=20
>--=20
>2.40.1
>
