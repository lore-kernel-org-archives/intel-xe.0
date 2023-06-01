Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0E4C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550F310E08B;
	Thu,  1 Jun 2023 15:10:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9039A10E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632208; x=1717168208;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ndRPD+YEaVBWflritOGAVPWPYTiXvgyaC6QR1vQjJ40=;
 b=A2t10KD5cTqEZpLrx9aWjtTKWVnjlnVaAJfGX4zf+dSCQT9KoOIpar2S
 sazTelgQpSgO+2y2z1JKlHFYrj5xWV+/F0JjXdcFr512dCT1BqKroNQYI
 Ah1KoI9xmQv7LYDV6KB3uUYaODpWPqKugpSP2RiQNE0HEPJdFflDUmYqt
 3niKzUQRxYE71FsZSHV3O6ch/2d7YOrkBu3NCt9HEQO4ffQZ1WKzoReOz
 DvCSFYgXNRiNgGP6xFeOTKVaWJCKrm2RWdvZ6hUEpVOaQtjlRYrEVeeQE
 RtdfmoSoiTHCqKkcWAUf2IEkBng59FfUSCX1dRAqDTW+8KbafXy0RsXzm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335204476"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335204476"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831614968"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="831614968"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 01 Jun 2023 08:09:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:09:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:09:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XULnjJRvNKAoLJXihGmxYxT2JFca1efHAMhB92iFqZ4OgR/ITEJDTkqQYlHq17tsZ/YNn+7/dS9KDphUPzkJ1G0057TgCYiqBKV8I7DrMTjipz71oPzCa6XUJKYS5dK7X/rvrDF9O7Q52NBVcps/T2UzKgj+bAjY6izQ2tTU2YfXyMb7GUCkg8JCfDkE2qTfqRm+92Tfw1XeYX03yebpd+dM6PkcnNYWKz4u+kDY5USKn5JU4ykAUZ0U28cmFl+ZBGyz4zl3jTx0ckin0SfBqeEYNHJVg5ORayWnm070XMCak6KdAehj6aDVpjH4Die1Nbhfh8mLX7gbKcr5fCIC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udpXJstA5RFRmQmL9wY29MhG28AvCIXcFVbPEtGPVWg=;
 b=HQv8dQPSkkCHR9k6UZij04O/eTdnz6wsxAEvx8DSIGmc/cyjC4hx2PfTHOlRVfAdCcQhgJ86j1mUE/vrgArRjRcogIQbDKCZRgEHVJLtFMdwFwcVbsVh5yZn27ZBQ749g/CMCNS8JGYaGES1SfTakQiApozML4y6863QsFHpdV+Jo9wbaXMOjk4jCjvwRTfXlkuDNvPgzencSf1Dhp2wekwM5F+K9Rgog0BIReFuhcz8FsKJxqKISpB+NOym5tdiYugn5YpYMjG4bMdKAxDtcQ8vt/OLWsIhkaV6jAoEav4pifMebfGSFia1W0jgIGzSO8dMZhvrijHR3/ZzcyVerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 15:09:34 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:09:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-6-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-6-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:09:28 -0300
Message-ID: <168563216882.3435.12572718622081309876@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 937416a5-2d93-42bf-778e-08db62b2355f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WkdrM5L3sltv92Cfdt7A9t9QVYLZQ1DXAYdN6VzJfdpnwbP9YIKh2YFrrSO9HGulbJgbesalO1fF7qyF38Bn+26T8shr0ePAjR03SdcyACUvj6P6GWRhazKscMMQs5h3RjJaPVm6gGdSuqqk4iOCBAhwgNCzOLZBG/CmCPEeztG25joLwbvLUopRHBEjhVhoqD4ZUZkPsghW7h27GTl6xlzetQ58l8o8t1o6y9dOTqzswFNms9IFLUEHCye7dSj00NKmsEiC/LpLA6tO6JD/gQNQK2opVSGnYmz5AB9bXTb36EvSQceu8VyhPyXT3+cQnjuY1OvBUPJ+A/xgk0et32J+0wWX+X2YpVcW2p1jd2ekBDe8sDesBoA/jM0OIbLvJhw4iksYDDlIYZzHT3SXZfXTTgee3eUu4W6Fsq8WldkHYTwDvU6533Pc/MKIxl6m9qxO1nwe9QDZbBEqdYCG352/W5FVlCb6zyaePFV3GcUmmYfbAeSsvxo4Vl8QWfaAn29Elj1bLilXzVrnz9XqVW/kk0Fyfy9nyIzyMQFifl+yUtWQ+BA72CT/okjKJGo1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(6666004)(478600001)(6506007)(33716001)(83380400001)(9686003)(38100700002)(86362001)(82960400001)(107886003)(6512007)(186003)(26005)(316002)(41300700001)(66946007)(66476007)(66556008)(4326008)(44832011)(8676002)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2NBRWI0SWRyZm1zZ2lka2c3ZHI3OFRyTE9UTWRiSVo1YUJIREN3Zng5QU1J?=
 =?utf-8?B?UTgzZGtNTU4vTjNQRXgyREduTWw2Um9yb2kzSG1iSElMd2NvVWJFRE9laFlB?=
 =?utf-8?B?WWR4aloxbm5FVzNraDBMWlY4ZlJaU3VZVlJPcFhvMHg1K2tTdXVjVGd2V0Jx?=
 =?utf-8?B?MjRtcXIrZ01SU29EVlZoNDhFTElDY0twcnNOSGtYQURybHQvS3pLTUJ0em0x?=
 =?utf-8?B?c29vY2ZWUmFsZFFpQVpKamJoSTdIUm5meUNBTWF0S2xscm5UNEVUOFV0TDRa?=
 =?utf-8?B?V0VUTUtwcENMQ2hJeE9tQWVxcUNQeXN3L1FSQVZNNTQ1QnFTcXZ0ZWVjcXdO?=
 =?utf-8?B?bXI4VHlXOTI1QnpTWTFSUFBoUFI2UmQvYXNDV1hBUDlZRFJBTmduS0IvWlN1?=
 =?utf-8?B?RzJDV3J5N2xYSDY3RSs1bDNEMjRPNU9VQml4Um1FRWFzbDI2R082Y1ZGMlls?=
 =?utf-8?B?UmxkLzVweG1DVFdPWFlMV0llL1V4VEgyUlhhVFN3RmJPOHRORGxybnp6R1gr?=
 =?utf-8?B?QmxqclppKzhWa3VPTDM4dERxanRNSWVySW1JSHRhMUdMZnFuQTdzY1M5ZEZ3?=
 =?utf-8?B?eHlIZEVwdzB5U0tsbGl4UWNud3VISW9aU05pTWZNbWJVZkl3TnB0a3g5RVVL?=
 =?utf-8?B?VmRnb09UNllwd2ZnU205UnJDVzJGMEtkVkFWV01BVElLL3hQY0l2cWJqU2hy?=
 =?utf-8?B?TndqZStOcTh4M3JENWwvWDV4SlpnWDRpVmxwZjIvb1Q3OXZOdmlnZzVJTDZJ?=
 =?utf-8?B?ZEdXMVR3MVZDQzJYM3BVVU4vRk80cnRhRE1YRDF4Z1U0VXk3ZFhUQ3Rka09D?=
 =?utf-8?B?OG0rUEpTejR1TGl1Rk5RR2s2WW5WQ1ZzSGFBMENNV0VOS215YjJNTmZSNEV0?=
 =?utf-8?B?aklVSXBKVGhZREpjdEhkK04wNDdMcmdxaWRwc2tGbGppRVNacVZoTGpUMEVn?=
 =?utf-8?B?VmNWd0ZUM0Jrdk5tTTY1dW9XM3VNN3J4bm9ldGh4enY3KzlCWGhSTzFIbTZq?=
 =?utf-8?B?N2oxLzBOZys0QmJoaDE2eG1VUlc1RXVVY2tzeW1jUVo4MGFRWHVvWHhZRUlW?=
 =?utf-8?B?ZFN3dytCZ1U1dFhacFJtck10MStObUZHdVpRbS9qR3JXb2hEUWFIMVprZ3Vn?=
 =?utf-8?B?QVVHaTlzMmRoVndZMHdqNnM4UlRpbGZ6MmpSUitwYitTUlR2WDhHampPQkNv?=
 =?utf-8?B?dEk3dEhhZENOY25Jd0tjZEF6WnNXNDA3WkU2K3dqNWsvdEo3NlVHbUhNbjFj?=
 =?utf-8?B?RTE3UXZnQnRPd1N4VU5sMjJJTllyTHdEcFRIZUpNRUpTNmlPTzkyMC9FL05o?=
 =?utf-8?B?aXlLMzBNOUZwL3JUT3JWSnlHRjRUNnl4aDVjczlnRElEaE1rMTRybkhqbUNS?=
 =?utf-8?B?WHN3OG1laEVkM0NvT054Nm9QdG8yck9RZ3QzWGZkcVcrdTJhaGZZMFYwUWU2?=
 =?utf-8?B?Z2QxUkZrMDQ5azFFd1VVZWtMMlpoNzdGbDBNN2hKOVAzakhsNWR6ZHVSSzVW?=
 =?utf-8?B?YUVTMXN6b3dWaDg0K1doMU1sNm5TOXFNM0oySGZGMlNnNnFRUzVXQzg1b0l6?=
 =?utf-8?B?T3ZiMTdpcVJuV1hhWWxJSGpGWTM2d09GQzFCcjdDM2JkRFF3cllsMFE2bTdB?=
 =?utf-8?B?WXB4cUl6cjA1QTFweDFCRFBPK2JtbDVmKzUybXd1dHdDMnkyRFJKaFUzVWZB?=
 =?utf-8?B?emFSYWI1QVNjekdPbkNPNjk5Z0NpTmtEZnE2azFlaGFPVEVRV1VpdzdBOGk4?=
 =?utf-8?B?bzBoLys2K2JtWHNTMzc5QitDcDlESjZURGc5U0s2cHIrb2NkYi9ORXdhcXhR?=
 =?utf-8?B?a2taYUlTTHdHM04rcXd6Q2RXMFhuVTVzVTN1UWhRdE96c2VQY1NDUlBmZFNH?=
 =?utf-8?B?c3VGQjVRU3IwVHJUT3NubnIvbG1meFY0djc5UlIzT1h6OUk5Ynd6NzlkM1R2?=
 =?utf-8?B?cnN3ZDFnbWw4WjM5Zkc2aG5zRjBpS3VIamJLNU9sUjc2dzJZNkF1OEFFTDY3?=
 =?utf-8?B?c0lhNWRLVWl3Y2Y1dEtXNGF4ZE9hWGhsdTdBQ0NLRFN2MTdldzQ5eHllQTJM?=
 =?utf-8?B?U21NTEsxU3hiaEkyUmVJLzhGUXVkZ0tVUnJkV1IyclM0ZVNXQ2M4TzBWMFJI?=
 =?utf-8?B?dTE2ajZJVE8xY05XbGdKRlpOUW9kbWxFaEl0VGdLeDRIcjRWWDcvV01IbDZp?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 937416a5-2d93-42bf-778e-08db62b2355f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:09:34.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz5NkQxBtXcmkk8OOxUiEpjjAZ0FNvnlp68imQjHC9nq1BU4uaIzdaU5ycLbUuGUxApcNbkuTDclS7Ncuxm/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 05/31] drm/xe: Add for_each_tile iterator
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-31 21:03:37-03:00)
>As we start splitting tile handling out from GT handling, we'll need to
>be able to iterate over tiles separately from GTs.  This iterator will
>be used in upcoming patches.
>
>v2:
> - s/(id__++)/(id__)++/  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device.h | 4 ++++
> drivers/gpu/drm/xe/xe_pci.c    | 3 +--
> 2 files changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device=
.h
>index f7acaf51a1fc..3516ac1dcbc4 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(str=
uct xe_device *xe)
>         xe->info.enable_guc =3D false;
> }
>=20
>+#define for_each_tile(tile__, xe__, id__) \
>+        for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>+                for_each_if ((tile__) =3D &(xe__)->tiles[(id__)])
>+
> #define for_each_gt(gt__, xe__, id__) \
>         for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__++)) \
>                 for_each_if ((gt__) =3D xe_device_get_gt((xe__), (id__)))
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 2e5a15219964..9e0d26329dd7 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -558,8 +558,7 @@ static int xe_info_init(struct xe_device *xe,
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
