Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAF2EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D732110E628;
	Fri, 16 Jun 2023 14:05:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A64310E62C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924352; x=1718460352;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=3Ws/U3CEd8nudtB9skk5hlvMUjk2lkYy9iJQGUdnAQ4=;
 b=jl24zsgmUd2CHG9zd1lxJzexpY5y0f1rrAulXOxtUx6rExyX/5ldJAZc
 +zQNVu7bLxeHm4iGodO2kSAn0m2OHuSi5w1vdo7XI+KpDXS0YfEHZP4Rl
 bNX7KYuOov1+iPm0XUyKjuCxluXXN11Ro37i9k624rL9mBQly3bCLyJkw
 apoDpF960YBLQ8XZKSBvYZYKRaExCByH9IgMntsmwtd635Rp+MBhrY5Mo
 xhzz5hXmkcLtdIApJ2B7OX+a5vGK2LnEh+F/C5dDH0CGzeG+NV8K5IAbI
 ZCMJywYim/7xgQBE0gbxiCGlIGtemCNtYbxihWf5XUbwQCIvkyChSXRWs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422870596"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422870596"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:05:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707110040"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707110040"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2023 07:05:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:05:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:05:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:05:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejQqlLcndUml0iRQDa22YhO3UbVR30zoyNumOBw1QgsElYeWtu0MUig60mahsbeMC/jp3K1QyupQ3MY9r8S2F7FTUHe/od5BD/1nfBs7v6ZPyCFgPp2NZkXLyT6bx/ZuPbNsJ0ZGWZhOloq19Yrg5zGvCgKCmZrUi2f5hc7DRETW7BFuBTZi+ykYM86ca4PTnM/BHVF1xjy0yt667rFnB9w1/XGWeoucRHm1GFRh7SDog5iu21qR5Vhv+CEK5/ga34/qKOe4Tu+s5ZCt/pJHhkTev5xWL0ENJucz0XmWIJGRKgSFTKSgCx+rNuo+ywd7VB3vNyTy2OSAgPZuJhbJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPXy7M9aURhdHc3yK+gADX8BLrWhkWI0Niahj97eiy4=;
 b=WwuhtIEgLTTVu6uNwzit+Q1ctBQvI4fMGSa8JDJihlzso23O6ZgYTqwOaznoBqqgm1af2qQahfnUTDE0PpRzeNhd+Oi+sxR1cURynSDefF/Jl9h2JVrKGOr3cWZWOxL48taDiDs7X2t5ShzBU6R7G/wJcrniNkWJEJvbbFUh7xplGM+/l4MEEycQtqLGbmZIDcLZvzQpLD9d1DdeJYh5AWyHy6WDhAl7w0ER4sgNlK4yRzlRw1fA4rXIXomZrZ/X9cSc1qHpK9bG548q1+K6IhzJ/9k3R1BiveXxW4HGy4HBBlsypfrojJQRKDPPMqOQBzmrFhzW7nLm2aIOMId/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 14:05:48 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 14:05:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230614205202.3376752-2-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 16 Jun 2023 11:05:43 -0300
Message-ID: <168692434367.4441.4523253323430999428@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5c4272-2f34-4566-b7ca-08db6e72c923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kW5PSCUdLJTpZIr25KHXb4YOjAENXhzaeZq08lWW6h6HQ2sG+f6IqCnvbcYtV8kJkRKTPLkP8KOotq3ItUCubGbcw5HJI7sYhqsp38xmTeyM3ZvxZQQXIch2HI5l7dM/6Z3cKzBhKVPIEpZCa5ieA6t/QYyYJhajwba7eLjAR6LUN7vfD83f5dIadjG6SJ2Y4H3yB3mXorKkeuMmG4isRbAkKhrg5/VMWtvmIKTHgn2xGghHU2FkYNhi3lm/zQxV/FHOKnfZ43SZmuOU6LCHAB3nlxclXGibpdq+HB6CWntoDk4Do3ZYsJT6LIRHeFXQ+lYrXR+n7rgGo+xt0qalrp9s/Qk1kzwXCWftEn+dVF6BZH2SclFGv0Mosop1TMj7NozRhVUw9CZLI8Z+lAaEQ8vCHbTk3zRULcJs1sOQYqBjE3L++/IgK5F6ExQRhIizZdE2nK3dHxc3tYd8G7w7zfDirmIGPkn2bKuk0HTkOSFYj4cGOaUHzaOy9KcP7Ogy2jIL/xPdr04mp0sYNehtUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(86362001)(66556008)(66476007)(316002)(4326008)(966005)(66946007)(107886003)(478600001)(6486002)(6666004)(33716001)(44832011)(41300700001)(8676002)(2906002)(8936002)(5660300002)(38100700002)(82960400001)(83380400001)(9686003)(26005)(6512007)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjIvZ0lkeWEyRVgxR0w5N3BsYWxENEpFS0RQdkhZQTBkaGN1MStiQXhteGhS?=
 =?utf-8?B?R0xTdUtxY2dqNmd1R3dCZ21FR2NGYmpGb1J4cHdwbjNsSUNYRi9PcmFUdG9m?=
 =?utf-8?B?WFV1OCtHc1p1RU5rRjVLbVp3cEYyNTFKN1B0VkIydHZZQzRvYStkRHExUkhm?=
 =?utf-8?B?SE5SVUVXRkl0VVhRUVNPczRkWTVUZkhIa3FXQlJYaTRGS2FLdkdaSVp4NUxv?=
 =?utf-8?B?ZEk2TksvTXltUTJCUzZwZFdYSmw2dUg0U0h6Q0RkWVFkcGlvR3F6VHN6UWRP?=
 =?utf-8?B?UWw1dmtBWS9ZRENTczlweTBZWjJuRDFWNDVzbUZLZE9HbVF3VlVFWGtXYjZw?=
 =?utf-8?B?YzU0VGV2b0JHKytpbEd3SGl5NTJRd3NqSy94ZTVITDFMN09CRnJtRUxpSmlR?=
 =?utf-8?B?bDFDVE9ZRDZGaWMrWlFEbUs0ZG53QzhteUtSblBJd2JxUFR1S2NyMmNLVnpX?=
 =?utf-8?B?b2x2b2hQdVN4WTdnT1JjMS9Tc3FheHVLL2d0a1dqcWgrL0t0Y2hPUWlFT05y?=
 =?utf-8?B?bkFHdmd0dVg0MWVtQTBPNFdYUWpzbDJLbmxlSVhUUE54ZGFMRmRhNmxoYUhZ?=
 =?utf-8?B?djV0NlUwWHh1OTl3V0FXVC9oaGlDUU1qd05EMUVEL1pESCtiQWNGUlZieHh5?=
 =?utf-8?B?NDZzeWUzVG1hVUwwL1RiS0hKT3M4NjBkTGxvNFdNcExjQmI1VmNnNFVBUWp4?=
 =?utf-8?B?alRaRGgxQVVYdGRHRDV1Y2tFcDRlSmhkNkJrSnRBTWxUYThzRDMzOVVSd05Q?=
 =?utf-8?B?RU1wOFlHaTFWQkp0RGpBZHJmTGRLSWJDSzlEaUJuY09COWR5U1crK2pVaVpD?=
 =?utf-8?B?OE1rKzhYQnJrL3loYnJuQXZJbzVPR2VabWxIbUZaZWp3OWppY3BiWnNpS0tv?=
 =?utf-8?B?Sm5kd1FzdWltYk9KS3BKUGJPdXR4TXZVNVlKU3dLYlNvZHB1YXlyMUZRYjhK?=
 =?utf-8?B?ZDRuVlk2V3RnN2hVMkhScGRFZlpxVlZycGJwa1JoZTViV0tDNXcvVHZOUEww?=
 =?utf-8?B?eE12TTVoVTNTRzlWblVWblhiT2l1UWhwVVBEaTNFTHdZZDg2SDhtMGJleHlI?=
 =?utf-8?B?S3Q1NC9veUFoRldvU2hnZFZFYnR3UUdyL1NDT0RUM3FVaEFWS3Zuc25neklh?=
 =?utf-8?B?OWZuZnFtMHk3U2wzYUhoNWN4TStVdUVZbWJqSmhjNDd6Rm5rajJEazhXaGxC?=
 =?utf-8?B?bGJXek9pMTE5SW1XTmlmOElOck5aeUM0MVNRcFo5OWRlS2RBWGdvcnV4WHV4?=
 =?utf-8?B?Tk1iZWNSLzBPTjFBU1M3KzNHMEVZeWQ2OWZlb2crVEFRVHRPVVZhTVBFaGJ3?=
 =?utf-8?B?cEFzV05wRjFWUHloWm81VVczOHZZK1hubUhJNlBzbEJIald4Y1JLdEVEYzg0?=
 =?utf-8?B?YnpCU1dLM0swQnZKYlNEY2tpZ0w5aVJhalVFWW9YSk1iYm1VUjZ5N0xYTzNq?=
 =?utf-8?B?NWZ1MGg0enJtUnY1SjZLZmpiMi9KRGRNYXM3ZWx0OGhZMm1ScGV2bG5TL2FU?=
 =?utf-8?B?RUtyaXNPQzJXbHhtWWlxWHBiOWV4bGRQRSt6UUVYL3M2RGNsMi9hdnZGOTlO?=
 =?utf-8?B?aTU0cWlxODlqdS92RXBwMzdnZ2dxang2TEcvVVlaaGV5dzBIWk9TRnN1OWJw?=
 =?utf-8?B?eThmSE9ITjFRL1VKUUtZQzVaZWRqUGdFZ2tnVksxeFJ2MjdUTnhaWkIvM25G?=
 =?utf-8?B?dFB2anVia2RXdzJGT3hnckRqem8rTUhvNVA4MHYrbEFzaThQRWs2cVozYWRr?=
 =?utf-8?B?MFlHUEIrM3JvL0p5bVhjSnQraHdWVGFBNjRCUUlRVDNIUEU0NjFpOERvLzN3?=
 =?utf-8?B?QkxxTGxNQWF2MkFsdW5xRlpXUlp4VkFwMkQweDVzakhQc2RpY2NodTZWQzJ5?=
 =?utf-8?B?cm1VN1EreWxrZHd3bE1wbDZ5TW9TOTJwRU9IVHpIeGtXMGtlSkVNQVNmUk1Q?=
 =?utf-8?B?MThwTUpuL2hpYS9SZmhrb1dDeFh5R3dqbXc2WjJPRmd5ZzQrZHErSk41dVRC?=
 =?utf-8?B?d3BsOWZUWTVOT2JpMjBwa2xJWXBxT2M2YnRtNUQvaENlRlVGNmdTdzd5dUhr?=
 =?utf-8?B?c2JSVWpnMGQ3bUxhVkFtVTZkYnJiYzdxNmtEQUx2dm10blpiQ2JuNkRXdlNx?=
 =?utf-8?B?bXR0Tjc4OHBab1JYV0F4NVk4eWVIdXl0blFia09NTTV2Qjhtdm5XKzRSREpo?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5c4272-2f34-4566-b7ca-08db6e72c923
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:05:48.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FasbxOYhjrwdnbVTxM+JpM9fBpiMn+gWc1IZuUlBaE9EM+bTFiP4pKk/n4UMa/+VIc/u3Oe61b0tvwk5SeNeBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Return GMD_ID revid properly
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-06-14 17:51:59-03:00)
>peek_gmdid() returns the IP version, not the raw value of the GMD_ID
>register.  Make sure we extract and return the rev_id field as well so
>that it can be used to determine the IP steppings properly.

Hm... This has been fixed in a different way by Lucas in [1]. Adding him
here so we can choose one of the fixes. Both look good to me.

[1] https://patchwork.freedesktop.org/patch/542422/?series=3D119292&rev=3D1

As suggested in Lucas', I would also take this opportunity to rename
GMD_ID_REVID to GMD_ID_REVID_MASK for consistency.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

--
Gustavo Sousa

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++----------
> 1 file changed, 13 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 2991cf5365d5..7926c2fa1433 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -392,23 +392,27 @@ find_subplatform(const struct xe_device *xe, const s=
truct xe_device_desc *desc)
>         return NULL;
> }
>=20
>-static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>+static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, =
u32 *revid)
> {
>         struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>         void __iomem *map =3D pci_iomap_range(pdev, 0, gmdid_offset, size=
of(u32));
>-        u32 ver;
>+        u32 val;
>=20
>         if (!map) {
>                 drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI B=
AR.\n",
>                         gmdid_offset);
>-                return 0;
>+                *ver =3D 0;
>+                *revid =3D 0;
>+
>+                return;
>         }
>=20
>-        ver =3D ioread32(map);
>+        val =3D ioread32(map);
>         pci_iounmap(pdev, map);
>=20
>-        return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>-                REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>+        *ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
>+                REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>+        *revid =3D REG_FIELD_GET(GMD_ID_REVID, val);
> }
>=20
> /*
>@@ -444,8 +448,7 @@ static void handle_gmdid(struct xe_device *xe,
> {
>         u32 ver;
>=20
>-        ver =3D peek_gmdid(xe, GMD_ID.addr);
>-        *graphics_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>+        peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
>         for (int i =3D 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>                 if (ver =3D=3D graphics_ip_map[i].ver) {
>                         xe->info.graphics_verx100 =3D ver;
>@@ -460,8 +463,8 @@ static void handle_gmdid(struct xe_device *xe,
>                         ver / 100, ver % 100);
>         }
>=20
>-        ver =3D peek_gmdid(xe, GMD_ID.addr + 0x380000);
>-        *media_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>+        peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>+
>         for (int i =3D 0; i < ARRAY_SIZE(media_ip_map); i++) {
>                 if (ver =3D=3D media_ip_map[i].ver) {
>                         xe->info.media_verx100 =3D ver;
>--=20
>2.40.1
>
