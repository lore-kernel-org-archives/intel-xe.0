Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7FEC61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 14:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5D810F3D5;
	Fri, 28 Aug 2026 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKyCh2FA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BFC10F3D5
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787925988; x=1819461988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uZKIBa7ccPAaGXt5kWv+rwEHBeWLDm3jTanMsTpPYc4=;
 b=FKyCh2FAZ8LF8SvAe30dlz4MyClsQBmi3lK5s319ZCHaULHbbMmvx9uo
 qNXsDnjgrkW3LIUuYBnBQMkdx3MV74CLmE77KQheuwUH1/rClSE8DsVic
 EbZujRzwWqguhAkg6bcC6Sc64fyliTbzNouI7STfapr/h4O5vJ4MpU+Tl
 7uA1rYRoK6bvlUDQld/f+VRwN87dvFswExliju9u+3XEgKYcZVKoz2w1c
 TOoP6ctx5vdfU9s12wSYPf0b7UkUhWGApZZ7DwF/hrtDnEPNpnaJveYlm
 T821DYo19mq0cQLyJt+USP5Cqr+z4WkyiekpNhIgawbAVge59rFobuu4Z A==;
X-CSE-ConnectionGUID: 0kEsAVL5TL6uJ0v0+5P0+A==
X-CSE-MsgGUID: f5rtXckvRbKSksKCqH16Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="90945737"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="90945737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:06:25 -0700
X-CSE-ConnectionGUID: 3GKX/LZXRqCZie7NLp+4ag==
X-CSE-MsgGUID: YM0UH/cqQA+N7ODW1cP/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="262035134"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:06:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 07:06:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 07:06:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 07:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9HuwwsCoZX2H2NERnzwrx8I717+ULL6GQgoFGkGKF0YWqzXAm+RrWtXO9KfzMFKfusyIzrVK+56/t0zULmP9TUVzV/KDj8A0NkSHrPJXDCGUfC9JXpLlUTXukxo6lnYD+FqwMQXoq4fiunnKeuRbX4tFokpoE8vSvLIsxpNMQny9tY57hG8QkFBWw1hnA0RPY9V3ht0+cNvkG9CS69iRRbalz7WV5MedpJndWPIRa+k+s3KYuN1cXA+wG3OHjFHqLOywggDq5h/+ey3MViSMSOplHeBuLBTGMq3GhL1iWRVYPil0YKef6S4iE4qX21INdLzXQvGDhrE7cxqUA+4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgnoDXiC0MEUNPD8zVMtP94Lnbkno/mVI7VIbrX78So=;
 b=jWHr/4/7NrFTFFnldC6ExpSlIxYFOsvC0UlxX0918nI1l/Z2gTIXM2AsWkyEt7GE+B667wGRL2ic63XQo4L43huWqUOzr1QkOrG1wQ4Qf3JPabKqeAWTbAtgzMRoGMJPidZSpiunrCflOV3GkUtKKB0f51AwVDzIWXXQe4DpYoFHq8nGqrha6MHVKrdDZe6ybE7Lmd+l91BjKzQGbbqYVikSD6QnCIdQp9zTgV8fcppcMxl+AedyN9VrP85xMXu59OO1Caqsi/7CNb1+ehjKx5DH4exIFL2AYHjO7a0u0G/RPy1UoNZDL26kZLPSpuhUx5xwwcyXWDxeaO7q+9zHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by DSVPR11MB9960.namprd11.prod.outlook.com (2603:10b6:8:3bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:06:21 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:06:21 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Thread-Topic: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Thread-Index: AQHdNuDKx64l4fZffUaKGTCFh3f20Lazeo3w
Date: Fri, 28 Aug 2026 14:06:21 +0000
Message-ID: <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-5-riana.tauro@intel.com>
In-Reply-To: <20260828113104.319843-5-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|DSVPR11MB9960:EE_
x-ms-office365-filtering-correlation-id: 004c3b4e-82a1-452c-8597-08df050d89a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|4143699003|38070700021|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 5AZxg3IC13Cu/5bszRIV8EiCtqjMzmq1X0H0+vbYHF4AgP82/itFBG/EHxONIxK/ypRJ2qIL6d1qgUvyReYfWe4rosxWblblaOQhu1Bqyi++IrSur6f9bWjePJk5mACsm5jK59vR7htaO/3H5x1AZ6NQMuEn3i9IsJKpOfqw1XYAlFYlzw5ceZzXv36mpFuP+HauNwWBBqIaR/RKTz++YGZ09yddNNeq9Jqo2Ui6Mz/Wy3QS+CEr3bUAxcewy2E6I0NvPsUiT0Vq6iycC7mFVj7q5FW1fhUTCQOlPITMCO+O1OxsmZA+DxnakkO666GS4t0L+8mrOXe+wHnADu/ZTowvoBEZEqX807qoZvZj+EZARjfLpoKN9sn9858n6BZTSkYntFLCDcPIpoJhfBaE/tbw4X9X7tgOBKzsbfGz+KHBBx3vJV+68MX3F6Lrc1+URPpE7+AFA4HpFtrtQZEyeq5JyKeRQaoCMPs9t06ZwAEiR83dmuVmq2TeT1HX81epHFAe04FR1vgcGNyFmvnfPTK5u79S22PAZRgxoZDiBJbIaAsmx9jebOqoWJR99zQzfdulXcuglYtFHCaWTc6i23wY/u6CD9Yn4rAiByAGwuEADF9guQQDwBffKKXyEn9tF9jNYpGU/S/LfJehMqa0QgTMAW671vXRI0+0ULAc1OMWfiqkWGXxVm/uFMbNWqUZ3PQuQnXjyDv1Dejao4wTLnMVAspavOco1nByj3gkgtI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(38070700021)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?50reppu/Sj1CdCUiGZxhu99BxlOqv/RbF0qdsaZOCVirPO7/vlyUsfzGJgD1?=
 =?us-ascii?Q?x8OLQUEgzJJ0cRbcsSPP9/T18FZKDQqDGzBDV3fWVEZQeWSdeicCawQgDV8z?=
 =?us-ascii?Q?VBgYZuz3h7+PNNg2RkUllA/wgKynO0bTOLyBZwK8v0Z7E+4UlpYgZMtwjV7d?=
 =?us-ascii?Q?OJwiFvC+bzItYAdsolsByFkHlb+8b76b6HxV9QJct/zhPxolFZXNnlwZz/Xs?=
 =?us-ascii?Q?mp8j3KdQ1r4LKs05Ist6CxSo1kWzJw2qflc/ewyq/a8XKo/kCaZpRDHjibXa?=
 =?us-ascii?Q?H07t8qztzOnK9SdNq8of6Dm77Jerby5ofO/jqqcZboosCNi8fBehgcMXQOcJ?=
 =?us-ascii?Q?3QrGWjHp0d84WPAJCq62RkSfqXb8AzpFeP7/tJh2ZZyiuyvEp8ZY9M9VCiHR?=
 =?us-ascii?Q?g6BJKX6ge9EeJ2OTJKVvpSLNL8H0QorR0J2i1V1YugZgOd1tviEpUWsfVkF+?=
 =?us-ascii?Q?x8D6OHlyUguJOS8rHoRICDeHHQ9z+61eClkUWrfARqkkK4TWSL/88de6bhSJ?=
 =?us-ascii?Q?tow9uzuKH6555MxVa+VnDXDqTQ1SLMiH3cguvwW2h/JGVze46BcvM0Ivjieh?=
 =?us-ascii?Q?8XE3nI6qj2LqbC4qFN70C8J6ZgKmCLq+ALOokaYdmIFJ44Wi/o+U7UsyD2No?=
 =?us-ascii?Q?LsOYXeiKmdRcHb0qCthXf/RW/4rV4NlIGf+Slup1xrn1lrcsfCWekZ65Uc8a?=
 =?us-ascii?Q?QjvqCrhDhmIn742byYJYQQP8lAXvKOoe2A9AW/D427uhA51aiTjPWB46TQPJ?=
 =?us-ascii?Q?f5/HE5EW94ef/zQpE/KCgq3OYavoHrXAATOPtkLkfl8X1JtDlj8u489PS/Tj?=
 =?us-ascii?Q?aLnDpBJlD9/us1CZwdik7/Brt/boitDQ5bp8FyvXRgkwAwjoBq4rIhEljK9L?=
 =?us-ascii?Q?s9QXtbTkVPakfXuFWkxMOy31qjY86vtyQvcKbOLsO89WIqSOwjuFv7Hvxd1n?=
 =?us-ascii?Q?hwx2K9gxkO0WOtPpOyWiuvWRFNsLcWZBzsbiRH5ve7QV/DIHscJXv9F3YWIa?=
 =?us-ascii?Q?TNhrThbVoEBLPqF39m8VDckv4PKLELOksS+vX4AX5AiUrOEf5EZrxdu5RF2C?=
 =?us-ascii?Q?DCmH/AhUlbtgExV5wSLHBwwLRIFUZSLK78GmAscwV+Rlij4fDgGDLEAI7dwz?=
 =?us-ascii?Q?Bt/UxDgw2vavwCPOp7IoyqMOMDsvD4lIFtenm5dqxQ483BZZKUhliEk3W3+1?=
 =?us-ascii?Q?LEW4ExUtU69ve2EQB++EIeKsBKfxsaS8jx9fBGG0WlvjDwNqbm6/U7Vp+IlU?=
 =?us-ascii?Q?kM8X4MzrpTN8MsZvi4Rhv2ltt92bK+nYNgBBhyElvZ5esF3ym5kvxkVL1FAm?=
 =?us-ascii?Q?Fe1hb8IQZkVK9sZL98s0is1EAMtpF30aJlsbzTWeutSfE5sFJpl4nPf1WpTE?=
 =?us-ascii?Q?O0h4BULQc7LEUXrs9J3hg91nPfKhkrlBoqqkymYSFM7haShzeVqPjU9tQUFk?=
 =?us-ascii?Q?5+bs8s4g0O2zqJJrPv0xoAOoyCHeXKpmW0mEwDA8N8U2FGI99drvlkhwRtJD?=
 =?us-ascii?Q?0RTSZpA5vZGDguGNEu+fkGdl2VACswpzzq/OSeQy+tScfAUDGtAnkUPqhT11?=
 =?us-ascii?Q?UrWyUnjy7RQKFgN+FtX6FRVvg14UqrxrWO9li3nSHFW9ubWfI8NjATlSnwaD?=
 =?us-ascii?Q?wt/gxOmSQ7gqhuucklRg7THWFLraBCGQha5P8NP4bPwjyTGw6RpnHWlbi/MH?=
 =?us-ascii?Q?m1gnYH27xGF57QN4rTaukRG0XOvdVtHvCLrBGEAgTmqS9QUa2S2mEpU5/uU0?=
 =?us-ascii?Q?aMxtVYa84A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rC94jP9peTraHJDArMvAHjiYN/v6RYBI8x1jOrCOwRxCTXKPKb/JG/fki3lyTYcCA/wVwtZY1IjSB+R+vmYIxS0pX4aioNd89BhkErBCrrU18copKsNIqlZTGW28Zy/RubvrqRyZjEMk3j+PZPhltmpXdAjBc2CvCQ4TkjXH7X/Pc0PivIA1vYjjT9NkpE2nH1j7N4Nj5RnLdELRiaSvffRtOyCorqrspvuorAOI0JOvkt0g6pzenbfyoUoPc8zrydIpq9zgoppWnGqnFZ0Xhbcw3nKq8Y5zW09hbn5TuiAhORxFfAC0/DivhJVuC3EnPLnQVrg+RzLjVnYBBfM+ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004c3b4e-82a1-452c-8597-08df050d89a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 14:06:21.1910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt+nyrZNNdlVlZJMGFGEBVMVfPbphcjcqMzJYlpDP7WjielUtG4MRrs1ZVN+YW/SYH+b9CpKdNqL56gJjhb+l4ynS3cPw2oaHsC0G+GpUfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9960
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, August 28, 2026 5:01 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Roper,
> Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
>=20
> Pcode init complete indicates the device is ready, with device memory
> initialization complete. Wait for Pcode init before accessing the device =
post
> Secondary Bus Reset (SBR).
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_error.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c
> b/drivers/gpu/drm/xe/xe_pci_error.c
> index 79ce0c671549..3e9c77f8483d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -9,6 +9,7 @@
>  #include "xe_gt.h"
>  #include "xe_log.h"
>  #include "xe_pci.h"
> +#include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> @@ -109,6 +110,10 @@ static pci_ers_result_t
> xe_pci_error_slot_reset(struct pci_dev *pdev)
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
>=20
> +	err =3D xe_pcode_probe_early(xe);
This can be a 3-minute wait in worst case, after PCIe core pci_bridge_wait_=
for_secondary_bus() is already waited for 1 second*[1].
What will be the impact on already running workload and any worker thread t=
ries to access the mmio or PCIe bar here?=20

[1]
/*
 * Devices may extend the 1 sec period through Request Retry Status
 * completions (PCIe r6.0 sec 2.3.1).  The spec does not provide an upper
 * limit, but 60 sec ought to be enough for any device to become
 * responsive.
 */
#define PCIE_RESET_READY_POLL_MS 60000 /* msec */

Thanks,
Anshuman
> +	if (err)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
>  	/*
>  	 * Secondary Bus Reset causes all VRAM state to be lost along with
>  	 * hardware state. As an initial step, re-probe the device to
> --
> 2.47.1

