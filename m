Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D76CEB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D803110E63E;
	Fri, 16 Jun 2023 14:17:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3477E10E63E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686925076; x=1718461076;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=RNXf+MYiA0/Fe803gdez460WoJcdMg1yw70+kpIRrJo=;
 b=lXSeZhujukmSPL6xVuLf031z9VCerhuIq8SBR6/u2AxdtgWPbDpJQh4H
 eLHHNGlE7h5msJfrKn0uAFuweBr7nKk34HJIPh5RO2FrDLKTIjIC1LL74
 rA4ymkhLb3Z7qTVTa9o3L0teT/78Gu9l06SKu1HJA0KgIHtjMmHXcHcO3
 zKqeFTY9NgTB1tRN2V98sJa/s6DuY0S/DodGPu3ZxMAvJh6fb30Mlg/uB
 RAdiEzqSlZAkT0YZ7+3YUsS5quvdhv1wn/Ak+0IycUTamiuPOOIem4phQ
 vqkFWT/bWwBKHpRBjpzJDgnkHkXtVFPEH1WpbdR5ESc4LwlsE/FaaSzCR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343960010"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343960010"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712886923"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="712886923"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 16 Jun 2023 07:17:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:17:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:17:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK15mZJxli1KtKL41/kGali340PQ2x2Acinb33ywNkjI6/yrrHvH8zRpTAQZ53B57J6BXyYVq58LFQlMFaYZmNlsTJKe07S4hW15K6KEwqYvUFjwlW4ymDpIp5oIiAdlyP3BQS+1mxjbrQsRdEAS4a3d5Lg6/YbCMff6kwQrNPgM3f3OC6ioyFeeNfw0UU288SUIKBak05G/ThxudexQU7L5qQf+z4RX6yZtI3hYCJPxt6RXhjy8gQD6TbcZnBZNtgexSsrQULPj2a6/D7OMSpCg8dukVe8Urc3gtedEH/nI7UKocyslawVUjbjAUOV7Q2hX8aVPkQJZChmkCK3r5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIhSqtb1qYrOVkw9QKcBziIgkJByjD1YsFUjPVsWSro=;
 b=eKDM+nk+nPliJULFJaaZr8ZGmBO5oSSWpF0LJA5b+fQpxkrq0wiG8RT4SBAk2wvH9anFPfl25MHU6iGThdXaTXeDPF1EiYYDrgQVelrlF4b2S/lzPDqjsrcFGXLsqpSTqXmBI8fGbK/0GPUQjXcCAiigN4x82hvK203yqZTj6So17P9Cw05gbsaSrTdR3Fg8ypZPmir3FTX4c5pDvMJuhY4fmsK+WYZZAgaGphQCrj2Rx8uPcURI4TjwemhnwA9YjEkRGrS4lkKihaC/JbYSkv3i07z5e8aUW/CNJA3Gl7UZjamDAX7+XY1fG+BgZg53AtnJkv5Pax2aVq4AVmvXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 14:17:53 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 14:17:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230614205202.3376752-5-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-5-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 16 Jun 2023 11:17:48 -0300
Message-ID: <168692506870.4441.15547965765214418755@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::13) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c2f70d-f980-4116-30a8-08db6e7478f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUXm1dxodJOCnXTxgrD9I4W4rx9N9HWPOL539+80DUL1CO+iBuMyDOvs1NBPLMqQr+xNrvzn64laBjUX7SWyfNxm3ew+KXPv1WWTU93mVKvTC3SoGKQz6U9GkaRbVvoONOPhpF8e0nmikk3R8G7IjsR8vWYtzhdKEJSRlcKCoXR2l6ycG0zKJgpMnPdC9cRH9/UhcpAiXU2noAkblbrG3c2eReZOlnXGra1F1zVetIE2dTRdJsP8kfYiFv11BygfwNYonuEnuAteR7d4Fbcderolt29k59bIxPUwdvr/pWjUxGGnYUQACTwtZ8xRurH+Ejm26Q0BoJDLC3kCzZiKcsZm2Wa5/P/EBiaMYpOEhUZkajJwqdIkCSiY1rtogEObRX+Vd8+Z9kcIuDp2JKsOj8oetc1u6kBAToZhMhMljo4bheSkCadtsySnq8o5r2o1BnZHSeoCBR/TAK/M2dA7hCvAnJpjEheQKscZEpkGhfsb0tQNwVB5MqlJt2MB3RiFteue0EEocvh3TVM7Q6hIuw/SIlAFNLpL/pVQk+x09nwFN0iLR50VmGUq86UY6jCo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(5660300002)(82960400001)(38100700002)(83380400001)(186003)(2906002)(6506007)(6512007)(107886003)(44832011)(478600001)(26005)(9686003)(66476007)(6666004)(8936002)(316002)(6486002)(66556008)(66946007)(8676002)(33716001)(41300700001)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnMzTjNGT1YvQWlyL2pGOXhFOG1uWEp6SzBINmgrZ0xIOEE0b3VTcjhYbnVp?=
 =?utf-8?B?SUVMc0xnTU8vV2RjUloxNEM3QTA3YkJtYVpCelVaMGlYTXM4Q0c1RjZ6QWZj?=
 =?utf-8?B?eVRZNGtVRTQzLy9YUXhMN2VhYlA0MXZkVTl6QURhNzFETE9aSkJCRTduV1Nl?=
 =?utf-8?B?Y21WMmNKZk5nMUw5bS9MQkMvYTBGYVpKQUpWR3l6b1F6OGRra3hGa3l1enBr?=
 =?utf-8?B?NXcydXRBUjRoMkJmcVYrazdpZDJLYzl1SkV4QnBrK0hBK2JEeVhmN3IrMGQ4?=
 =?utf-8?B?RDhxY0RMdWVzUVhkbTFkVlFPbklnc01ndWJFL3o1R1lITEhlTUhnRjRXeUJh?=
 =?utf-8?B?V3kvYnZQajZubTJ4VDQ1OVZsYTNTSEpxUFRvZ2hNY0VHR0VhWkFZV0FPNnpt?=
 =?utf-8?B?VzBmU2VIdCtuc1kyQXJDalNITlV1a1U0aFFwVGg4T21FaDBISGxNNFk1N3Bu?=
 =?utf-8?B?ZzlWM2VESTNjVDNYRGVPUGgyaGhXTDZxbkZ1dStqV2YwR3N3QlhZU0FOOUpP?=
 =?utf-8?B?d1NiZTRTY05KRDdGSnZTUHI2d2hjc3hJd1g0MDBNQ1o4V2loSDAxSS8zSUlV?=
 =?utf-8?B?VDQ0c05BNUM3QjY4NUYzT25aaC9Bc1VJcDhvdExRNlZMUEFFQ0ZZS1NjYVha?=
 =?utf-8?B?aFJzdFgzY2VJU3ZDWGorb0Y0REwzMXNQeXV1RmRmdFZJRnZoOUQrdWpUY0cz?=
 =?utf-8?B?Zmllbm82Nk5mN1hLK2U2Nys0aENwMXVlcDJQZDBzQ3RZSVdRMnMrV1FjOHhl?=
 =?utf-8?B?SXdrbUVkbFhVdWlQT2QrMWFveW1RMGd6Z2VGV0xMMitHK0M1TTV1Y1RLbXJM?=
 =?utf-8?B?cGRraVREYTNocEF0ZU9wYlhqR1RpdlJDUmJPOTRUc3g3K3IyQnViSzRRc29T?=
 =?utf-8?B?U3lyOWY5T0RqMWd0U0hreEJjVXJibVVNWTYwWkZZSENkVlFZMUp6QW1vNFNK?=
 =?utf-8?B?bVR1WldwMTdrR1ErZWdmMEpTY1lwQnZyV1F5SWZyb21tVE1JWVlMaTF3TUpD?=
 =?utf-8?B?bW5ZVGNtUG0rU0I3ZDdtTDZVSVZqdUpiVUYxeUxkTDFqMjB4akVYSUJ1cTFn?=
 =?utf-8?B?TWdCaTZXYURZRzlVOUwzWUx5Z2FhaGVYSU9RSnlpenltUUljQnpMMThQTm5D?=
 =?utf-8?B?WVFaOXF1bmJYM1QrclRlLzBncitDVkN0WmxwbExuRXVCeXQ0anlvK0ROQzQz?=
 =?utf-8?B?eWRuTnFBcG5hZEJzNndRK3pIbUptVjVQN3lZMHlJaVpBTDdZVVB3Wjk2Y3Ix?=
 =?utf-8?B?RHBPcDBRMzZwRUdObC9KdDFHNmZIMFNBTE4rbFZvWjdYT2Fxa3JhbUY4SjV1?=
 =?utf-8?B?eHRSMVluai9rQlBoVEQ5MkVnTHpzckQ2UWdlU1l2V2gyY2RHNkRPRXVXdDJZ?=
 =?utf-8?B?a3hlaTFKaDN3Ymp5VFkzaUtIcVVHSGVLWm1mZXg5dHI3SGc2eWJiM0ErVkp2?=
 =?utf-8?B?STZadktBbDd1WGVlMWhRY0Uxclg3VCs2VnNMay9iV2FBZDZva0N4UitWUGpP?=
 =?utf-8?B?K0xWQXdUWWs4QTRqeFd5RHpQRXdhNFB3aUlFNVYrN0ZhSldmWkRMeW9kbXhS?=
 =?utf-8?B?RnBNSTA0WGVvK0lQTUZiNGxPbXNvbVZ3RlhIVXZ1US8yRjdQV1JmRFZlV1da?=
 =?utf-8?B?M0t1NjRNOWVERDRWc0RLdDd1OFVxNlFYQnRZeldraVBRdStaVms5NllFbklH?=
 =?utf-8?B?M3dsc1YvT3RXWUJRNStJaTZlLzl2bU1wTUQrb1c2dW40S2lESjVjdjlqbGJY?=
 =?utf-8?B?M3JZV0cwcVRzYjdyNmM1MG1UbmRQRjN0UWltL0JkOUt5bHFNNnJvd3JQK3Rn?=
 =?utf-8?B?K0lsQmFtSjVLcmZxencwMDJONjg0ejVycDBUV2U0VE5ybEVhSWVaZUdNZlIz?=
 =?utf-8?B?ZVhKTzFHWGVxUTNLeFVwM2tmajkzQ2hoblIwbXFTYmc0RUl3YndKSFJQclc2?=
 =?utf-8?B?MnVydWpHNGtKREpSUU1veDM4RmlUdW5ZV3psQVpkWlBWTHQrbU5ZZTByOEhz?=
 =?utf-8?B?aFl0eGxzMkJXVGJpN0QzU0VQZmZ3Sk5xVU1abW03Rk12WDVVWkpBRGdRQkhr?=
 =?utf-8?B?dldMQWgwU1RRb1c0ZnJYRVFGK1FFQll3M1FoL1hsbWE0eC9IK2lKT2QrS2l4?=
 =?utf-8?B?eEUxYWRickNISHZOeFhXcXBsc2U2aldBUVdHZ2NJSlExOTVmWjNxbnQwakhM?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c2f70d-f980-4116-30a8-08db6e7478f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:17:52.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JuZPwljfy8/bdzC5QHAXJqTdz3AOjvWDLZ0wQvdY2kNxIce4m1OQGReFc5DpQ9IhePtWzieMgncfUTbwXK50g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Enable PCI device earlier
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

Quoting Matt Roper (2023-06-14 17:52:02-03:00)
>Newer Intel platforms require that inspect the contents of the GMD_ID
>registers very early in the driver initialization process to determine
>the IP version (and proper init sequences), of the platform.  Move the
>general PCI device setup and enablement slightly earlier, before we
>start trying to peek at the GMD_ID registers.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c | 22 +++++++++++-----------
> 1 file changed, 11 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index b5bea42a458d..c86580eb1b56 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -651,9 +651,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const s=
truct pci_device_id *ent)
>=20
>         subplatform_desc =3D find_subplatform(xe, desc);
>=20
>+        pci_set_drvdata(pdev, xe);
>+        err =3D pci_enable_device(pdev);
>+        if (err)
>+                goto err_drm_put;
>+
>+        pci_set_master(pdev);
>+
>+        if (pci_enable_msi(pdev) < 0)
>+                drm_dbg(&xe->drm, "can't enable MSI");
>+
>         err =3D xe_info_init(xe, desc, subplatform_desc);
>         if (err)
>-                goto err_drm_put;
>+                goto err_pci_disable;
>=20
>         xe_display_info_init(xe);
>=20
>@@ -677,16 +687,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const s=
truct pci_device_id *ent)
>                 xe_step_name(xe->info.step.display),
>                 xe_step_name(xe->info.step.basedie));
>=20
>-        pci_set_drvdata(pdev, xe);
>-        err =3D pci_enable_device(pdev);
>-        if (err)
>-                goto err_drm_put;
>-
>-        pci_set_master(pdev);
>-
>-        if (pci_enable_msi(pdev) < 0)
>-                drm_dbg(&xe->drm, "can't enable MSI");
>-
>         err =3D xe_device_probe(xe);
>         if (err)
>                 goto err_pci_disable;
>--=20
>2.40.1
>
