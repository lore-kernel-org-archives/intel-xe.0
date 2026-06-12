Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C6BCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 15:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EB510E558;
	Fri, 12 Jun 2026 15:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biDwo+0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB310E558
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781278356; x=1812814356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SrubMBFtj1Kf9QuTSm6rLI4cb/1gp72GmsGZ/BuPTTM=;
 b=biDwo+0Ks+ZdbFxh+GSnZq0Y5+82F73iRnesCYH246PFPMj0ZHaI7dlE
 8cfMv2nkYf2nL14utMKvSttNVUJyynorqfZ+2JLE4DfcfPe/NYgrLLRfu
 BUKA9zDw1rDzNXc15HCZRb4T6nk9vsJWuqy6FW6n/xTqv8OquRdH3OhV1
 gl3TQM+y+981GIR33Xrc2JBndOKqcmBjCcqjg1Y59SUyEUZbMlZ5tKuWw
 XZujVlTiIT563zO8w93x4Xj3mF14kIBNv2jLH0UiKWa7yTNxVlF1eRs3R
 BugaX+cRmp4+A02c8aMX6gE6wacb2s4AluAuJ2BQBobIxIe5Pu60pABTk Q==;
X-CSE-ConnectionGUID: Ky56R6rjRCWoeIhu7/gpSw==
X-CSE-MsgGUID: QD5xkExwT1S+Lr6ELW+bVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81852337"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81852337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 08:32:36 -0700
X-CSE-ConnectionGUID: i3u2AB4iRu68DTtuDZNp+w==
X-CSE-MsgGUID: rGUD87CkRc+9DtYTQ0yY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="244423774"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 08:32:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:32:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 08:32:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZiCwXojF9bi7PPo8B01tww9MDOFXK+epYdzVvTKqVRaiKeJ6g9vpzbucWFJkP6QbTnwXFNYUf+NPmc8Anf1xQ+Ok+ETxFBLNIcpx5kkj8AsgzzQzPZcS5JjMKyrWfCTKBAeGQWpXDpYgQ5JeD2gSS7AwdXpG+K64t70bgN+BhHerJycX57WiV7R7dxQFIypuO+GN/WQ1ZLVw66DArCwN5G2PbpkRlinZX/WN4jE41tiH0YD2wl9C1+grw6fsZY3IlO8W2RunsbLLpB+8Y2H9ofucg3qxQml3U3Md9LdBT9uFEqhZ42Z+wu4bdicVKamfcBiYNDOrg9QOAuG3usBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrubMBFtj1Kf9QuTSm6rLI4cb/1gp72GmsGZ/BuPTTM=;
 b=UDEP3skj1l2eO/u4W3mjfi8TzTls8Ku/FRtk21WFx52i9micsDvtV+KQAya7Mvs+6QjZ2kNFTZJmIWb4BeOc2SUcBo8lledHLWe4trSvsGabAylr5cRTy/ee37Rq1JY9MbcJ9ePPgroqPwcJ3eXd218MQfW7nt5e8I9NHGKPJe9iB9IPQ/PkQ8ZkPuN6wyLW+9EPXVkDaHRXGnRs87yKyreQyfAq5OKFGDh7xZqtOJXzYkStiUGLKlL1Nn2fRx4/wPIro2Lf2DKMf8rRMk/oHv2e/hHYY4w93LRuzzK9MqhIqFVNwFayZRFv6X3bT7NBg7mgBGwTtWaXaB0lff2kJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 15:32:29 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:32:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
Thread-Topic: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
Thread-Index: AQHc+SAfTXlVFoUcxUCO95DX8tWo0LY5LT4AgADJhwCAAKfuAIAAcGYA
Date: Fri, 12 Jun 2026 15:32:29 +0000
Message-ID: <882bfd70813d75a9cc289c0579e8631ddc21c23f.camel@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <20260610212833.153366-16-stuart.summers@intel.com>
 <cff1c411-59a6-4b1c-acb5-5c3b8762f628@lankhorst.se>
 <33176777e912d36550455b221bac5f4b355c7819.camel@intel.com>
 <218b95a4-5f1b-4aa5-9368-99900771a614@lankhorst.se>
In-Reply-To: <218b95a4-5f1b-4aa5-9368-99900771a614@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|CH3PR11MB7322:EE_
x-ms-office365-filtering-correlation-id: 460ca932-e562-4eab-762b-08dec897d068
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|3023799007|11063799006|6133799003|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: pHSCW5WnENkD/caS3NOCOjuLrPV4hhd018KhxtzfDIxDQXsEosgsMMflYbU7rHIMPnbCJxeSesX6wJ3oBYhMVzwBoatSxVe4FSclytP3uZQH4PBp4lGYHNlvQBbuoPcvyPLt8ZUpfIeK/USnaDa4El7AoDQldacFiNMwrzYSfmyaoqGl/sLkgP/CMDJkukABsclnt7k8sHsPnRCqAWX9m5qho9avDeI2oXr8ctFSnAzOkQOvqpGD7bxnuM/l8MmXbm+XXfoUWacWnL2qC9BcWhuwz4i7t04Mk2APcVZi+0TEHWyPAO/SW1sDMswKDIvHTaLZAaLJwPlg4iPUkaZCk5hrPmiDZ3kw4/Hk6CRdxIDJfPVMbZLCBtHl9DbAW0FqXRI0CEKgzqrjE1CfEbgjBqQfRcoCpGWGyI+heIyCd9c+YaYAE2hta2z4Fjs3XS5ZxdJEK8+hsebVtzuOiMbU6PL4YDRNicUYWMsLJ8imVARpstUKDJm6DBUaecICVTQ2uJVzPZ89EyRbr5jgWjCFpjukeI8DXxl4KWksYG2n2mg2wLVihT2rIsE4pZaS+w4iFBlQdQB60wVdt30s/ih5JQcKaXZQnsJInML8cXAhfx5PNLo4f4iSfZW8qYHbAB6tZORkBZJSXuQL6Ha2uCBHhK/3o58SdX4dmOQCHhn/EXtZYRhZI0k58ott9txWvQsbL7K4l8XnlAManba3bTM5eExWsAHTu3lEF2orsuYTi6plow8QDsnrfl2mTuhsPvQh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(3023799007)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnIxWVJUcnZEMVFXQ2ZKdm9SVGhic3J0MExEZjhJVlpEWWVXeVFsbTdIZ0l2?=
 =?utf-8?B?bFB4Zm1OWHFuNG8yVVBNa2NITjZjMHF5c3h5S3U0a3hHdVZtNTF1S0hWb3A1?=
 =?utf-8?B?cG9CYUVzTEZUNC9Sam1kYWdsVkdtTFVPTG9FTUNwNkVkNTlmSWtId0luMlg4?=
 =?utf-8?B?ZnpzQURtWlZhMEZIWFgwSk11YUlrMVVBZGs5Y2IxZkRlTmF2elZFRGtWbDRl?=
 =?utf-8?B?VjA5TFlmaUtjOWxoMXJDcFc5emc3UmJkY3EyNlp2bFBsOS9nbWFsaGlodHI5?=
 =?utf-8?B?K1l6WWtiRHFWa2Z1Nm1INDBoZU9KYWl2S2NEVmM3cXBQRTM5U3pJZzNoTzgv?=
 =?utf-8?B?K2p3dE43K1NUT1did2cxMnFEMXluK29tVmZNazFLR3pRbFRXME9iM0ZCTU4v?=
 =?utf-8?B?WTc1Mmt3cTJ5WWdjako0TWhiS3ZyOS9vQldHc0dkd2wvRjlwRG1LcC9wemta?=
 =?utf-8?B?ZnJpMlpkdEFRQ1FHcW5SbDdnMmMzNWxRK0wrS0FxZjFLdTVKL1pIY2t1TzlD?=
 =?utf-8?B?Qm81K1RzZmdXeUE0SFEwb09oMFdTUVpzb0ZSdVA5c005bXRsU2dqeHgrRVI2?=
 =?utf-8?B?NHI5UWxtVERaVDFLUnd0anZwSVgwNEppTzFKTFlBeDBSQllWMldrb3dmTXQr?=
 =?utf-8?B?cGJXb1B6QzdrWGIzRG1vWWpKNmVTelRERnFrWEhGelp0SUlyYTYyMVdQRW9t?=
 =?utf-8?B?OW82V2ZWQWxKUzhvZmV0TG5UUkFaTWlxTUd3MDVjYkdkV3VIWEJ5bGs0Tk9m?=
 =?utf-8?B?eGlKMEk4ZXZHb0hWNTRVU1FJM1VVcUtraGR4aUo4N3B2ZVZhekVqUDNMN08x?=
 =?utf-8?B?NisrMmJabTF1dlJXZkthNEN0MVRjeVV3cXcvd1FDSHgxd29OaFZUbTBGNVVp?=
 =?utf-8?B?bEJhRUhmcEhVRVNJQkxyZ0xuQW5GWjlxcmRJOUVVMmptemNzbXI0eWMrcTd1?=
 =?utf-8?B?TXgzazRBclNIaVBvWEZiaVlHZWFEKzNhWHhBZmdMcUNzbEF6T3ZXTEFXYUdH?=
 =?utf-8?B?aHB2QlRoUHFjOUh2cXlrVE1ia2l5S0F3d3NGb2ZiUEk5OGNoYjNxeTdnZ1Nz?=
 =?utf-8?B?WEMyMysxVlNZeTJpQkJ6bFJlQTlFL1ZmQUVNanRFMHlydDV3YmxZYXRGYjZU?=
 =?utf-8?B?VkYxTUN2UzZERDBxZjJ4THhYTHBjVTlOZU1tNjVhc05XWnFmZ3p5NmdsMmpY?=
 =?utf-8?B?V29kbkltNDJTRnRjSEc0UnViUE5Ldy95RVNZeWN4UlAyQlJOdkFvb09Cak9E?=
 =?utf-8?B?Ri9McERaclphMWVrZWVCclErY00wR3EyUVl4b2VZOG9Qc2lRQU94UkFoZFhG?=
 =?utf-8?B?VC9uWkVlTHVCU3VFQ203N1pNaURVVkRCbHRFQzVnRTRaRkMvVVpyTEloaGRR?=
 =?utf-8?B?cFRxZHJFbDljZVNIOU9NeUgvWTVCSEQzZ0pTMURsck1yRHRkdW5MOGJEd2Zn?=
 =?utf-8?B?L0p2RjVIdGVEMHUzdTBtb29raU5OUldEbzJGZG0rWFpVL084eGFkRkFERU9l?=
 =?utf-8?B?UE1xeGNjRlBST1RvaWs3UHgzR3llaHh0U3VPV0VDSmdKSko4TnF2ZWNZU0hD?=
 =?utf-8?B?Y3FVb0ZuU2dGYjVUTnJIRlpxNzJMUlV5dFFQa2JlNEllZkE4R1VEc2FCWmNq?=
 =?utf-8?B?OFlVa1VLMytLcUlIQU4vQ1JIRENJVUxjK09nQTlPMnFkS2htcjBEMkhXbWZH?=
 =?utf-8?B?czh2a0Q3UlpoTWhwQjdCRTZSU0lsQkFnQU5qOXVseVgwNVlZNzhybnh6REpX?=
 =?utf-8?B?Zy91Z0RMY29ZdHlOc0JzV0N6aFR3KytmNkFqaTE2WFBYOTBBQ1hIMXVNUzBi?=
 =?utf-8?B?SEZFYkpjd2lxMEQyWTlxWlBlWTZQNkVxWC94Sm5DZFFWSXFWeWYzb1VhQ21B?=
 =?utf-8?B?SS9pVWVOTU1WZ1M4OE9IZUl5cGxINzB1TEYyL2FCVDNPR1k5c1NnVGgvWEEy?=
 =?utf-8?B?czgzdmlCVi96WjBueStXMWYvQm1NbFJYVHNpTUdBaGd6WHFtTm9LRldDS3Nu?=
 =?utf-8?B?a1RrYklGZTczTG90T0xUMFQxNlZEU05iT3JtbUpjekNFMHRmMjRsbVRhNXRm?=
 =?utf-8?B?c0ZJRkdiMCtVZGJlRXl1Y3MrVzk4TTRUaFltYkU5QWdHZzZoa3pBczJQcnE4?=
 =?utf-8?B?UUxkRmNncGx0QVZNOVNJdVlQWVdIUHhSRWdOQWJHeGZGd0lHY2swc0UvQXM2?=
 =?utf-8?B?ZFhMQUp4Rjh1d2lnSGlxZmFFMHRLMlFqMGUrY0xQMnQwRTBhRTgrM1pNd2N5?=
 =?utf-8?B?bkF1Y2w1L3NUamFEUUpZeWI4Z3laUmlQKy9MUjA5b2F3aFplSGVHWWxkSDVB?=
 =?utf-8?B?TU12MTg4eGFwSkRlbVZBeDM3WVoyM0g5THNyZVRZS2VsWlQ0RmVUU2xKaHJP?=
 =?utf-8?Q?olvApyWKSxyECQ9c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01351BEDA0ED3E40A54B258D3D49663C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: juG39bOlhs9zOWccKYOTW+6+TNkBi7yUwPnKfbuRnCei/xlpSeTZeDkmQX0Yq/TINu+3ynSVqwbDOvAFOCz+w4sNUMwEp2aIjE0812eRmlxynSUL7xt5tXfdItuvE80LVK1bzXpffC5jw14drQuH1oJhErjtFGvUf8Go7iiIq9USUh+//CrYIhAw3GgKwy7C0N+mJrmSRr8czI0r40PW8iVCB8o2xt2HEJMgXk8gSOdmndftHbU2BTN1klI60daPt4heW5hr6gCxVDb9fMYZFo2ttgleFgvyzSjsExmulXzVF8jj4ouaLSUGAbfz9rSAnxDFgLITKwoJre2MLVrZSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460ca932-e562-4eab-762b-08dec897d068
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:32:29.5017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYRZXqyCg5O9K1QlGHn24+CsaXQPrefu8Puhc/Ca4i4yFPQ10Bio9vvI+m+Kd2x25qhA0kALc/RqYOhr+41eREJXIfSeWFqh+V0sO+jJZc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDEwOjUwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGV5LA0KPiANCj4gT24gNi8xMi8yNiAwMDo0OSwgU3VtbWVycywgU3R1YXJ0IHdyb3Rl
Og0KPiA+IE9uIFRodSwgMjAyNi0wNi0xMSBhdCAxMjo0NyArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6DQo+ID4gPiBIZWxsbywNCj4gPiA+IA0KPiA+ID4gT24gNi8xMC8yNiAyMzoyOCwg
U3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IEludHJvZHVjZSBYRV9NU0lYX01BWF9WRUNT
ICgxMDI0KSBhcyBhIHNvZnR3YXJlIGNhcCBvbiB0aGUNCj4gPiA+ID4gdG90YWwNCj4gPiA+ID4g
bnVtYmVyDQo+ID4gPiA+IG9mIE1TSS1YIHZlY3RvcnMgdGhlIGRyaXZlciB3aWxsIHVzZS4gV2Ug
d2FudCBhIHdheSB0byBjYXAgdGhlDQo+ID4gPiA+IG51bWJlcg0KPiA+ID4gPiBvZiB2ZWN0b3Jz
IHNlcGFyYXRlbHkgZnJvbSB0aGUgUENJZSBjYXBhYmlsaXR5LiBUaGlzIHdheSB3ZSBjYW4NCj4g
PiA+ID4gbW9yZQ0KPiA+ID4gPiBlYXNpbHkgbWFuYWdlIGNlcnRhaW4gc3lzdGVtLXdpZGUgY29u
ZmlndXJhdGlvbnMgdGhhdCBtaWdodA0KPiA+ID4gPiBkaWZmZXINCj4gPiA+ID4gZnJvbSB0aGUg
cGVyLWRldmljZSBsZXZlbCBjb25maWd1cmF0aW9uLg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+
ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLXNvbm5ldC00LjYNCj4gPiA+ID4gLS0tDQo+
ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jIHwgMiArLQ0KPiA+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuaCB8IDcgKysrKysrKw0KPiA+ID4gPiDCoDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+IA0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ID4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ID4gPiA+IGluZGV4IDllNDllMjI0MWRhNC4uMzQy
OWJiMzA1MjkzIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJx
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ID4gPiA+IEBA
IC04OTUsNyArODk1LDcgQEAgc3RhdGljIGludCB4ZV9pcnFfbXNpeF9pbml0KHN0cnVjdA0KPiA+
ID4gPiB4ZV9kZXZpY2UNCj4gPiA+ID4gKnhlKQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBudmVjOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+
ID4gPiDCoA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB4ZS0+aXJxLm1zaXgubnZlYyA9IG52ZWM7
DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHhlLT5pcnEubXNpeC5udmVjID0gbWluX3QoaW50LCBu
dmVjLCBYRV9NU0lYX01BWF9WRUNTKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhhX2luaXRf
ZmxhZ3MoJnhlLT5pcnEubXNpeC5pbmRleGVzLCBYQV9GTEFHU19BTExPQyk7DQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+ID4gwqB9DQo+ID4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmgNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaXJxLmgNCj4gPiA+ID4gaW5kZXggYTI4YmQ1NzdiYTUyLi41ZjQ4MjQ5ZGFlOGEgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuaA0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmgNCj4gPiA+ID4gQEAgLTEwLDYgKzEwLDEz
IEBADQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgI2RlZmluZSBYRV9JUlFfREVGQVVMVF9NU0lYIDEN
Cj4gPiA+ID4gwqANCj4gPiA+ID4gKy8qDQo+ID4gPiA+ICsgKiBTb2Z0d2FyZSBjYXAgb24gdGhl
IHRvdGFsIG51bWJlciBvZiBNU0ktWCB2ZWN0b3JzIHRoZQ0KPiA+ID4gPiBkcml2ZXINCj4gPiA+
ID4gd2lsbCB1c2UuDQo+ID4gPiA+ICsgKiBBbGxvd3MgdGhlIHN1cHBvcnRlZCB2ZWN0b3JzIHRv
IGJlIG1hbmFnZWQgaW5kZXBlbmRlbnQgb2YNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IFBDSQ0KPiA+
ID4gPiArICogY29uZmlnIHNwYWNlIHJlcG9ydC4NCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArI2Rl
ZmluZSBYRV9NU0lYX01BWF9WRUNTIDEwMjQNCj4gPiA+ID4gKw0KPiA+ID4gPiDCoHN0cnVjdCB4
ZV9kZXZpY2U7DQo+ID4gPiA+IMKgc3RydWN0IHhlX3RpbGU7DQo+ID4gPiA+IMKgc3RydWN0IHhl
X2d0Ow0KPiA+ID4gSSB0b29rIGEgcXVpY2sgbG9vayBhdCB0aGUgUENJIGRvY3MgZm9yIHRoZSBr
ZXJuZWwuDQo+ID4gPiANCj4gPiA+IHBjaV9hbGxvY19pcnFfdmVjdG9ycyB3aWxsIHJlcXVlc3Qg
YSBtaW5pbXVtIG9mIDEwMjQgdmVjdG9ycyBpbg0KPiA+ID4gdGhpcw0KPiA+ID4gY2FzZSwNCj4g
PiA+IGJ1dCBpcyBhbGxvd2VkIHRvIGFsbG9jYXRlIG1vcmUuDQo+ID4gPiANCj4gPiA+IEFsdGhv
dWdoIHdlIHNob3VsZCBzZXQgYSBzZW5zaWJsZSBkZWZhdWx0IHVzaW5nDQo+ID4gPiBwY2lfbXNp
eF92ZWNfY291bnQoKSwNCj4gPiA+IEknbSBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSB0byBzcGVj
aWZpY2FsbHkgbGltaXQgdGhlbSBpZiB3ZSBjYW4NCj4gPiA+IHVzZQ0KPiA+ID4gYXMgbWFueSBh
cyB3ZSBsaWtlLg0KPiA+ID4gDQo+ID4gPiBUaGUgcmV0dXJuIHZhbHVlIG9mIHBjaV9hbGxvY19p
cnFfdmVjdG9ycyByZXR1cm5zIHRoZSBhbW91bnQgb2YNCj4gPiA+IHZlY3RvcnMgYWN0dWFsbHkg
YXZhaWxhYmxlLCBzbyB0aGlzIHBhdGNoIGNsYW1wcyB0aGUgYW1vdW50DQo+ID4gPiBhdmFpbGFi
bGUNCj4gPiA+IHdpdGhvdXQgbmVjZXNzaXR5Lg0KPiA+ID4gDQo+ID4gPiBXaGF0IGFib3V0IHRo
aXMgaW5zdGVhZCwgYW5kIGRyb3AgY29uZmlnZnM/DQo+ID4gPiANCj4gPiA+IHhlLT5pcnEubXNp
eC5udmVjID0gZXJyID0gcGNpX2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsDQo+ID4gPiBOVU1fT0Zf
U1RBVElDX01TSVgsIHBjaV9tc2l4X3ZlY19jb3VudCgpKSA/DQo+ID4gPiANCj4gPiA+IEluIHRo
aXMgY2FzZSwgd2UgZ2V0IHRoZSBtYXhpbXVtIGFtb3VudCBvZiB2ZWN0b3JzIGF2YWlsYWJsZSwN
Cj4gPiA+IHdpdGhvdXQNCj4gPiA+IHJlcXVpcmluZyBhbnkgY2FwcyBvciByZXF1aXJpbmcgY29u
ZmlnZnMuDQo+ID4gPiANCj4gPiA+IElmIE1TSS1YIHZlY3RvcnMgcmVhbGx5IHByb3ZpZGUgYSBz
cGVlZHVwLCB3b3VsZCBpdCBiZSBiZW5lZmljaWFsDQo+ID4gPiB0bw0KPiA+ID4gdXNlIHRob3Nl
IG9uIHRoZSBtaWdyYXRpb24gcXVldWVzIGFzIHdlbGw/DQo+ID4gU28gdGhlcmUgYXJlIHR3byBp
c3N1ZXMgSSdtIHRyeWluZyB0byBzb2x2ZSB3aXRoIHRoaXMgYW5kIHRoZQ0KPiA+IGNvbmZpZ2Zz
DQo+ID4gcGF0Y2ggKG1vc3RseSB0aGUgY29uZmlnZnMgcGF0Y2gpLg0KPiA+IA0KPiA+IDEpIE91
ciBoYXJkd2FyZSBtaWdodCByZXBvcnQgYSB2YWx1ZSwgYnV0IGRlcGVuZGluZyBvbiB0aGUNCj4g
PiBnZW5lcmF0aW9uLA0KPiA+IHRoZSBmaXJtd2FyZSBtaWdodCBsaW1pdCB0aGUgYW1vdW50IHdl
IGNhbiByZWFsaXN0aWNhbGx5IGNvbmZpZ3VyZQ0KPiA+IGZvcg0KPiA+IHZhcmlvdXMgcmVhc29u
cy4gSSByZWFsaXplIHdlIGRvbid0IHdhbnQgdG8gbmVjZXNzYXJpbHkgb3ZlcnJpZGUNCj4gPiB0
aGUNCj4gPiBQQ0llIGNvbmZpZyB3aXRob3V0IHJlYXNvbiwgYnV0IHdlIGFsc28gd2FudCB0byBt
YWtlIHN1cmUgd2UgYXJlbid0DQo+ID4gdHJ5aW5nIHRvIGFsbG9jYXRlIG1vcmUgdGhhbiB0aGUg
ZmlybXdhcmUgaGFzIHNldCB1cCBmb3IgdXMgaW4NCj4gPiB0ZXJtcyBvZg0KPiA+IHNlY3VyaXR5
LCBldGMuIFdlIHdhbnQgdG8gY2F0Y2ggdGhpcyBraW5kIG9mIHRoaW5nIGluIHNvZnR3YXJlIGlm
DQo+ID4gcG9zc2libGUgcmF0aGVyIHRoYW4gYWxsb2NhdGluZyB2ZWN0b3JzIHRoYXQgYXJlIG1h
c2tlZCBpbiBoYXJkd2FyZQ0KPiA+IGFuZA0KPiA+IG9ubHkgZmluZCBvdXQgd2hlbiB0aGUgdXNl
ciBhcHBzIHN0YXJ0IGhhbmdpbmcgKGJlY2F1c2UgdGhlDQo+ID4gaW50ZXJydXB0cw0KPiA+IHRo
ZXkgZXhwZWN0ZWQgYXJlbid0IGNvbWluZyBpbikuDQo+ID4gDQo+ID4gMikgVGhlcmUgYXJlIHVz
ZSBjYXNlcyBsaWtlIHZtd2FyZSB0aGF0IGxpbWl0IG5vdCBieSB0aGUgZGV2aWNlLA0KPiA+IGJ1
dCBieQ0KPiA+IHRoZSBlbnRpcmUgc3lzdGVtLiBPdXIgZGV2aWNlIGFuZCBmaXJtd2FyZSBtaWdo
dCBzdXBwb3J0IHNvbWV0aGluZw0KPiA+IGxpa2UNCj4gPiAxMDI0LCBidXQgd2UgYXJlIGp1c3Qg
b25lIG9mIG1hbnkgZGV2aWNlcyBpbiB0aGUgc3lzdGVtIGFuZCBpbiB0aGUNCj4gPiBoeXBlcnZp
c29yIHdlIHdhbnQgYSB3YXkgdG8gbGltaXQgdGhpcyB3aXRob3V0IGhhdmluZyB0byBjaGFuZ2Ug
dGhlDQo+ID4gQklPUyBjb25maWd1cmF0aW9uLg0KPiANCj4gWWVhaCBtYWtlcyBzZW5zZS4gSXMg
dGhlIGZpcm13YXJlIGhlcmUgR3VDIG9yIFVFRkk/DQoNClRoaXMgYW5zd2VyIHdpbGwgYmUgZGlm
ZmVyZW50IGRlcGVuZGluZyBvbiB0aGUgcGxhdGZvcm0uLi4gSXQncyBlaXRoZXINCmEgcHJlYm9v
dCBmaXJtd2FyZSBpbiB0aGUgVUVGSSBzcGFjZSBvciBzb21ldGhpbmcgYXQgcnVudGltZS4gR3VD
IGlzbid0DQpnZW5lcmFsbHkgaW52b2x2ZWQgaGVyZSB0aG91Z2guDQoNCj4gDQo+IElmIG91ciBk
ZXZpY2Ugc3VwcG9ydHMgb25seSAxMDI0IHRoZW4gaXQncyBzYWZlIHRvIGhhdmUgaXQgYXMgbGlt
aXQuDQoNClRoYXQgc2FpZC4uLiBtYXliZSB3aGF0IHdlIHJlYWxseSBzaG91bGQgYmUgZG9pbmcg
aGVyZSBpcyBkcm9wcGluZyB0aGUNCm1hY3JvIEkgaGF2ZSBhbmQganVzdCB1c2UgdGhlIGNvbmZp
Z2ZzPyBUaGVuIHdpdGggYSBkZWZhdWx0IGNvbmZpZ2ZzLA0Kd2UganVzdCB1c2Ugd2hhdCB0aGUg
ZGV2aWNlIHByZXNlbnRzIGJ1dCBnaXZlIGEgc3lzYWRtaW4gdGhlIG9wdGlvbiBvZg0KY2hhbmdp
bmcgdGhhdCBmb3IgdGhlIHJlYXNvbnMgSSBtZW50aW9uZWQgYWJvdmU/IE9mIGNvdXJzZSB3ZSBt
aWdodA0Kc3RpbGwgbmVlZCB0byBjaGFuZ2UgdGhpcyBkZXBlbmRpbmcgb24gc3BlY2lmaWMgaGFy
ZHdhcmUgZ2VuZXJhdGlvbg0KcmVxdWlyZW1lbnRzIChtYXliZSBldmVuIGNoYW5nZSB0aGUgY29u
ZmlnZnMgZGVmYXVsdCwgZXRjKS4gQnV0IHRoYXQNCndvdWxkIG1heWJlIGJlIHRoZSBiZXN0IG9m
IGJvdGggd29ybGRzIGluIHRoZSBtZWFudGltZS4uLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiAN
Cj4gS2luZCByZWdhcmRzLA0KPiANCj4gfk1hYXJ0ZW4gTGFua2hvcnN0DQo+IA0KDQo=
