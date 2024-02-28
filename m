Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776FC5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2C10E22E;
	Wed, 28 Feb 2024 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOLXqul5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4310E22E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709138676; x=1740674676;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=+dvRmm3jicZvuarZY9i0KeGIimWkXxaf1vdcOlci0xM=;
 b=mOLXqul5aTrq7q+jOIyhcUkFXFDWsO8f4i8DBqDUSa37HcivQLjNZJNA
 zLKfhaUaJSVsNah62tS8nwHNtbPDIH7weu1JRL9Hv+CRctukvfwhfHejx
 nXvKpN2+gRXIc4wtnaDasw8YZQbHZPN0mCZrLht53llPaorzZv21n5BIl
 QC0mXtgsWTtteu9LNieMub9GrhziMjl8Sp+Yqw5lP0qQF+YttxG0Vq59r
 4ZgpUfByfGtd2NMqRHpou7q7VuhJLiaaRdsXyHtiQzXnb5qVD/0xRyfEc
 Lyg0F8uNumeqLO9Mn1xh17MRFGKI8xtymFpoOuRZ1lxhd+IpoCS9NMYYM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14987502"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14987502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="38334449"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 08:44:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:44:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 08:44:34 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 08:44:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9hsaBpQNaeLUURrcPV/W+PvZk8RGIysG0JfaeMh+jCAvYnXC/ISZlAOthWuGykeBURwIDe1xJPt53x4ROuNuRFqJTPgAYCn/d6A+cOWDp2qW2rGPNK8cf/Uq64z3iAYwBqRfHkaEXjVOiHnJB3c2dTdQnyHqXXMiD577x6vhBSJVlsk45ibJShE7dfCEJlHTI2WDfjGug8Pid9anEDpyS3Uxbfp52OrvOxLh3LGrK1Uxtam4GCRGb9JtJfxKjEG9FrdNY59oWeMmT355Ljb0DgHPJ/I8V8XL3NTD0NPUH+gf+0HNP9L2K1QEMl6qnnH4Vt9eIt7ij0X32lB1JqWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F7CVXyV3SXMfvAu1AB/LPP3w2xRLGLb46Y1Hgcmpjw=;
 b=iuZeobNUgmAqr38+rQakQrf1wJgaIO/aJVNFokefyhHqBXcLvdnhJ/gPMkG6HZXEkRCVPrf3rLDL5fpm/qTcF49tfdP19QD72b6n3vBV9Lno2aAJ3FHXwOZRGEwlvVMUOYhIWsZk3qg1q3LxXzAJo9gETik0G49JScxzX2SsuWq7kfd5XsYWTvzSN3uLOmu/c86P8M99CuApJGurJLZ0eCl4m0O7F+33coZIS6/E3nT5mx7ho/od9ESkOjWYf+K+b+xQswFGj6u+epF23e5vb1YxVPOsH/NAc0/aoGgBtHpq9S4+vP8VcVr20beCLAxWurgcRfzmiaEWL3zMVj7Tgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Wed, 28 Feb
 2024 16:44:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3a8d:b57a:4dae:a25b]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3a8d:b57a:4dae:a25b%7]) with mapi id 15.20.7339.022; Wed, 28 Feb 2024
 16:44:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240228161144.648776-1-shekhar.chauhan@intel.com>
References: <20240228161144.648776-1-shekhar.chauhan@intel.com>
Subject: Re: [PATCH] drm/i915/lnl: Modeset sequence change for DP on LNL
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, <shekhar.chauhan@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Feb 2024 13:44:26 -0300
Message-ID: <170913866639.9528.1555853125695537276@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f945e36-e1ab-4fb5-a98d-08dc387c89fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GDuq4tNgfAGdPpAMRvhBd6LQkPcJQ0kJr/enZQfYZktF+I8yIEOVt1cBEt0ZG/TTzeeLbm7ymR/+t10qJjgPYV3GtDXMTDoM5w7N/o9XJU9CZO/2N/2NPL/HUfXpFA9rHWLHbKFtnEE3VU0xuZ1Q49cop+WVXSFytVdaMKGttYNLwropoWdKs9XgrLyVHqMi9yQTAhy/7vQW4qdlKxcV7MR1U3vk+R8ZO2X7dI9GUCEm7FEAsGy3beFWNbiD7JUeWGQUTgNdB/McNc8KsEXW6agVlZgsqyDd0HM1JJEb73jcQiDzb0vpoVi9GnDgeSFWsqm2m4waor8G5pK+jIaD6nPOm2jp56TnamnJmn8EVFuGM6ApwvUS30Uz7EMDraV4gYFRqWy+1h9QOJbLS2ul8URFYa3vvCeqFL9Ji1PpaewlrwsbN0OlIvq7B3P8h9PP+yPh1sh7ZirD0Ym9VMAoWeRk1pfmxrkZFkT2gVzJSfh/8xHLGmsf5rM84JpBDWYZ+hB23WvBjo8pQAUMYzbd+9tBQMMNNef/ERQAYlshtcSPBKf43onnb2PPTayhe0VhqJ2wTgq51aebuvtwv2F3vDWfU63s21Lzi2Enz8TkytKtXm1qDM1qYQEpgyTDqKbk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpIOWRSd2VBb1B1eGptWStDbWtHRnBGUEpabVNXdXRSYWJUakg0V2ZoOXNM?=
 =?utf-8?B?dmZlQUVzSWZ5WGowaytDNFRub09rMTE1cHJOTDRkMzZhNXN4aFJmWHNsUlZX?=
 =?utf-8?B?YzZqeVV2RXd1Qlhxcmx0UFZlWlA1UC9idnFBZzdqTDNaZkZoYytMK0RHSzhV?=
 =?utf-8?B?NTl2eW50am5xRlh3N1pURHF3a2wxWXBqZlZZWnJ2ZlVaNWtIRmVwZVRlR1B4?=
 =?utf-8?B?ZXFWT0ZZeTJpTUpJeWlEQmExTVl2VkJRWmwrOTJvdGphS1hRSlFUdUg0Zm9K?=
 =?utf-8?B?aTkrOThoaGRRaWVCYk80SEtMSll2VXZ3ckVZck4zL3d0RFFKYUcwUUFVQ0U4?=
 =?utf-8?B?SnlZSk1ZVzVaWXpPK0laZC9Ramg2TWRxY21oOWU1YlVsdjBTOE5WQ0VkSG5H?=
 =?utf-8?B?ZlEwQ3VZY201Uys2c1FtSVNJTzNiV25kK1EyZEc5UCtXZ2RhOGRqbDBFeXF6?=
 =?utf-8?B?eGJkWGVwNURRMlhrOXN0SFBZNmhMb1Q5R0FKVHhKUHRFQUc0NzQ2b2tsc0xE?=
 =?utf-8?B?WDZGREkwWGhwSjhiZDFFdFoxY0lMZFpzSUxKdVRZNEQyengxNlZrSldQRHVZ?=
 =?utf-8?B?Z2ROcVk1UFJ5ZDZxeUlHcUpndW1sTEgwVXc5aGpUTHRLY09iOVVNR24rV0dF?=
 =?utf-8?B?K0txaWdMckdBcENrcG5LNGp5dFVjd0MxR3J3Zy9rZ0c1TXlTek8rL09FYjhZ?=
 =?utf-8?B?ZThtZ20wekViVjFndW84c3dWMHZyN2tWaEp6ZUFpZk00SHJINDkzYWw2WXU3?=
 =?utf-8?B?OFZVNGdyb2FjMjNaMkJjSzJEWHN0eFNOZzhRTDVHMDV1WXZla1p6V201RDR0?=
 =?utf-8?B?WnhYWDZhWTNwc0FyRFhYNkNUbm4wV0Fvc1F0N3hGV0RQbVRwYVM5V29QeStX?=
 =?utf-8?B?eXlreTFlcTMzbTgrTUt6YXFlb0gzdEJkbVlraFFBQjdGdXh0NHlVTHN6SUJw?=
 =?utf-8?B?KzlETVJ5T0RYUnVXNmpJSHAweFVTbWNNUkRuSktlNTBCUjVWdEtXVnExempG?=
 =?utf-8?B?d1B0UW01VytLRHl1SWRKcCtGSlR1dktURmFsZTU1azZ3ZjUyMDRIMHZGck5s?=
 =?utf-8?B?WWNONWdQdWZsTHdZbXN5WGV6SGJkN2doZ3IvejZ6RHFDRGpYc2Y1SmdCRUQr?=
 =?utf-8?B?cjBmRVE4Wkh3MGVUZ3hKd0pWKzlJU3N0U3R2b0Y2WEt5QUs4MW5QcWd3L2NN?=
 =?utf-8?B?UDg1ZWI1bXBadUdyUk1DYnBQL1NaNzNtTnBoQUo4eFY0TnBCZEgzeldsVE5C?=
 =?utf-8?B?cEtLUkc2YXhTQUNGZlV1SDE5b2JnS3RiWmdwcndHRGVWOHVHMFdNSm43Qzg1?=
 =?utf-8?B?dGo2cDY2REp1eWRpS211WVZOUWNPSWxZTEtWZUJoSC9DRTkwelg0TFZCdjIy?=
 =?utf-8?B?M2taNzVWdFBCU3NvMXFJZFdNeHIvR2E5MWN6RWFZQnNoY3lPOGNBOHpXaHdT?=
 =?utf-8?B?d2pzNE5UWlU0RnBtRTVuZ2JYUGhCdlV6UERBVDhDeTlybXBBTkVJWE9FaDJH?=
 =?utf-8?B?RGhTeEt1OHk2MHdmVmU4TzlvVDdxTnhnL1E2UndyeEhsUU1TeU05cFVhbjkw?=
 =?utf-8?B?dVdJSHVic25tN09tanpJN2VWcTd2Y3pkVFZ0OFovVTIycHUzZTBOd3hwU1V0?=
 =?utf-8?B?MjFGWTdQZllnWkZtVjdBWDRGT0doT1lsUkdxMXFFY2J2a1pLcDU4bXgrczc3?=
 =?utf-8?B?T0tsb3p2R2k1SFJEbm0yYnlXYVJodEt3V3ZZZERxOXJabUhhdzFDWTdqZENH?=
 =?utf-8?B?WGlTVXVCM2ZVQWZXeFAzSVRYSDZWQ0l0T3hNdTBtSGZpdXZkRGgraSt3TU1D?=
 =?utf-8?B?M1M4OTRFVVowKzM3eDZITjVuVEVGU2dMemdhU3FGejB4MG5YT0VWY2NrZzM1?=
 =?utf-8?B?TEZ4TmxVRm4wTGFVL1B2UXpKd1g5RDBrbzhwOFE1TjJjekluMEZ1SWdMS1Z2?=
 =?utf-8?B?ZUh0dWFtek9LYjZuNkwxWU1PSURGQW1LNjVzMnNCcVh0WGRsbk1yekJZNnpk?=
 =?utf-8?B?WTdzVy9SMStUN2llNSs0UmtMRUt5UWZqQS9rNmdjemZiK0gyTzBKWEtxbCt2?=
 =?utf-8?B?KzM1YVdFTlRVSEJaTjdrTWw2OEhMQk1rZDBFaHVHL1BXTWhER3VYcFpMZGZ3?=
 =?utf-8?B?N0VzV1JPaTl2NEJqczNlMWpnRGl3ZXA3ck5kckpyN3pxUTJncyttTlhmU0pj?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f945e36-e1ab-4fb5-a98d-08dc387c89fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 16:44:32.3027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08yurjHuLZze2UbG29ngNLYlGMe1qvzXcQ0ep9NzTw/Y1KXUW4r2wp4a1FDOXV2O0l+7yhppyt/cy9fRSKodhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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

Drive-by comment: display stuff should be sent to
intel-gfx@lists.freedesktop.org.

Quoting Shekhar Chauhan (2024-02-28 13:11:44-03:00)
>Currently, the driver is only waiting for 1ms for
>idle patterns. But starting from LNL and beyond,
>the MST wants the driver to wait for 1640us before
>timing out (which we round up to 2ms).
>
>BSpec: 68849
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i9=
15/display/intel_ddi.c
>index bea441590204..05ba3642d486 100644
>--- a/drivers/gpu/drm/i915/display/intel_ddi.c
>+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>@@ -3680,7 +3680,7 @@ static void intel_ddi_set_idle_link_train(struct int=
el_dp *intel_dp,
>=20
>         if (intel_de_wait_for_set(dev_priv,
>                                   dp_tp_status_reg(encoder, crtc_state),
>-                                  DP_TP_STATUS_IDLE_DONE, 1))
>+                                  DP_TP_STATUS_IDLE_DONE, 2))
>                 drm_err(&dev_priv->drm,
>                         "Timed out waiting for DP idle patterns\n");
> }
>--=20
>2.34.1
>
