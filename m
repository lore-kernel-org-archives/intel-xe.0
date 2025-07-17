Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5CC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4B610E321;
	Thu, 17 Jul 2025 21:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kATLaXZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0A810E321
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752787123; x=1784323123;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0aBy9gRmpfdGE9Ro6cUbwaF2dMRJAZbbySRugtoRTno=;
 b=kATLaXZI9AX/AlgFZOFiAhnyuCF9y3kVxkNsIT0KxseDVCsw1aagvnp1
 7rJg6+7VKox+1LnqzcpRrRD+p7JvKebXisvt9+MNghEbgAzp3NEiqQenB
 ZwXfpbtuIZa5XuNtNm8DNp/zBhSitmiZwp/ufmNUt2B2JvGsFbYOAnZRe
 ScLeaOrIY3Nxj7imi3o9zWZ4mYDxKxk5OcIKt0b7ildAX1aqHkn2R2wRV
 /c/ntt/Q/m/WHB1O32pE9uERz1JO0i0YcAj+hx8rk/0/EZDmGN05tiCqP
 iQd27+C4fDu5549I80D6YRfHSXXSKyK9mnP6UoCOfKRulN+txS67OhBjJ g==;
X-CSE-ConnectionGUID: OKCo9JGbR0i0dG34omJALQ==
X-CSE-MsgGUID: /OJ/deggRKmVOd9PJ8B/5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55223328"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="55223328"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:18:43 -0700
X-CSE-ConnectionGUID: +Tt8lNyIQraex0J7Bsjk4A==
X-CSE-MsgGUID: jk+8vzxITFKBfNtcyx5NDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="188879367"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:18:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:18:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:18:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgbgPbRMLoc2ArP9Dk6GfjVS2ofKaioRA9iQojOJDvjFgLUeTvRxKdKtmHxsrE1KicwyNVY7z3K9eno3LZpRhdjLcgssZ6wolajeZ+PHopoTue01uVk1DO0fxA/6OXcOnW2kzkj//ZnZxRf5HHei2KgGhIawwES4qFzpAtcraDLC6pzNgPVFjiaGElHb+e0gT1Dmw7dk2k09mT0ipArPkyqt3+94SJHHx7lNj+MqVX6H6GoFFkMs63+QJJNupnVSKvgE7VhF9qtRjN7Smlt1FrVdF9+zchbHCwZIHNsIh9x6cWtZ+djyH7YfeWuWbOeFUX1Ca8xsd1wx6xAH/gl/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOiECU2cN1cNyug/McBrCXMjaWLdUFKx1NkCdDjky8A=;
 b=AufJ/3jnDjQXJ8rwcZlQT+VdjfE7B5q4mr+UX3rp6J6g31upXH65enlG+7aVam47L7uiIbAIUOBd7K5tGFxLtTZEkd5ZstpWzAJcpWodezVcK4sThEJAKnyDzfM/PNVwlaWeiMMcP9oO8KChrbJakI38v3xZvKHXkbIJ7ZjHE9nrd4h5rqJF5MPKni/FNYd2qmztFPDOIQiQmXMwAS4HCyvbJbVHtrNT6TGnlOAuK9S0DB3MH8NDEpAsntfoa/CZ+9M1YMXeAlxhxl0vTi34IpEeSXFtEND0+wZBloymxErf8s6cW5S/+9q6YO2wMbvMbQ/vfLoRcJa2hYsYILMNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 21:18:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:18:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
Thread-Topic: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
Thread-Index: AQHb90t/ud/JmEGjEk2JHSKGaQ6FhrQ2yNSQ
Date: Thu, 17 Jul 2025 21:18:40 +0000
Message-ID: <CH0PR11MB544443198055F40D7E90C1E0E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6495:EE_
x-ms-office365-filtering-correlation-id: 2c63ae6a-10b0-43b7-2976-08ddc5778051
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lKy9eWdnQRPiS7Oiahyky804h/CBw5I2r2KkuRmoASYcYPtIDpet2jw4RPnI?=
 =?us-ascii?Q?asAXdT4doSe8f+ztGmmqpHRXtMNei7edmE4MCkwHiJMW/aArEYZeqhMRa0Jx?=
 =?us-ascii?Q?9ZkuGD8UtrdHUp8gBVaJm6NNSKSnk0BPVEy6gChykbX4enu0nklBEPPpvq+3?=
 =?us-ascii?Q?qUhqso0M7KAIM+uJ4RYhpQrHW+j0VC8NWjZ+Qwug9WUOx5dQk33RHtiGabiP?=
 =?us-ascii?Q?0HMy40Q4qz0Lenn0feR58t93MZeUa8aZ92ypPo7rbfb4Qd7S4lH1CGvFEFAB?=
 =?us-ascii?Q?vctXIYRBzM676JtrOeYUl5ZbKz/OLFZnIqjNezwYQSv2vZF30sQOYQESWn7l?=
 =?us-ascii?Q?YiJpfqgqVe8DeAWX0s03ZQJBHpKvhGQD2vZTUHz/15ZhP8w8QgkgbTSlr8zK?=
 =?us-ascii?Q?4qoMtufTOhfhfzjXJ5f5oxCp3g10znAp+kI06WaAqBIKs3CT+ObUqE16oAW/?=
 =?us-ascii?Q?K3RYGfSeGh0nRBEEuvQv3cVsqHT3eBCBU0edCAsB5Ci/xIsN9l/GefRPReLC?=
 =?us-ascii?Q?kolfyt2Z2wuIU9qT/wBlN7TGkcYLe5DuQ96xUeK7ugJankBXb5gEQzboMxh7?=
 =?us-ascii?Q?BUVt3roJsqaFdJFzO2eRGKEK0J5TP4D38prAHUOrwO8eGZhv0iOajS/m2QDm?=
 =?us-ascii?Q?7i+P7K/Q6H3CiR9AqrQQxnZ7kuLY6AG18l7jk9XWrFv1hJ3PqkXBfYTf/S4S?=
 =?us-ascii?Q?fQUsWqD8sLrdLeSiTz89l+2WB1zGmJ/+IXqns8CfRAtJF0b5Ht1AljZguQrf?=
 =?us-ascii?Q?SydJ6lEKL+to5Je7Ix9K3rZTd+2m8OPUGfEhrQedt+14mBBgOSgvDapBHYlo?=
 =?us-ascii?Q?Yndq8g1XvOdY+MukHf2zWBWXnDd9uci7ZVXxHVnurCCi8UQavmLkUVtJWesN?=
 =?us-ascii?Q?Ghm7g68gPC86uvvwO511668HkqMKxYUHDaL1Bn+e7try7LMxMY+eIT63Tq6J?=
 =?us-ascii?Q?r+tJZB7E7xe5RO/OREAfMcN1SMTd2COPOCA760Q2GVuaDBQ6iXhbhy2kt8VO?=
 =?us-ascii?Q?IL7oCJQfheb+0MrY6E2Lh8ZCL3T/njVS/n3v24SmqTPLMWxsmljhTp6PVGg/?=
 =?us-ascii?Q?k8udwbnvyg/JYYVsM5IeDTLOuFvBX9bh3xC28MGbXkxNmQwKtZ6m27vhsDkj?=
 =?us-ascii?Q?m3teLLAXhUt+wXf4RMwI2c9/mUwaTx/rMXtEjZaehdS0X95kkDZ2UzW1HxpP?=
 =?us-ascii?Q?N6jd4Hwl0q1Q9GFMN4cHw3zmkiCqoAdvzTZ+gJfitvA2kg5KV0YI3XX0p3cl?=
 =?us-ascii?Q?z/8qrGUH9Hj2wOmez98F3wiBk+dYKCFCyWTf7AltO/GjSL6GKBKn89XaliV4?=
 =?us-ascii?Q?qFunVvlIpfRJ87SwlVIKlBDNgP/xwP9vOpx6K/V9I8/hB5e8XobcJhREpzRh?=
 =?us-ascii?Q?5vK3WZnsWuObOLBPrTbreOBzhA0rLZftpeMJdIiUciZ2rmb+9X3ZIlKX5sHW?=
 =?us-ascii?Q?ozZMaWWdsEMjh7wHQZzMJOpOtTWBNoE2puDz5dqm7cN7b/hFyac9Ig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OKtaclJZv8e1Ew4az+icFBhNH3pBFUbweeM729d6SYcz3cHV2OnUmUAjTyNR?=
 =?us-ascii?Q?9NpDUwNUh1bPFS1PWu8EygcxN9wafjFPOegB28ns2uZS51f2v6bRzGYbUejZ?=
 =?us-ascii?Q?hMsQrZzZzE9p5O1locc9kmotsu0KVRPGMx8P5fISq+s9m1sIqKEhjuOwDpZ9?=
 =?us-ascii?Q?pa4pvTAMLo96UijH6HSfXAApoLX/KRgI3dNr3+IKoMGOXzCC+OxxecgdaZCP?=
 =?us-ascii?Q?swxc3IfbnPg7mjKF7UakkQgPfWM5iDWmls8ZMC0Qv5+tv+tRV40NBBzQzywb?=
 =?us-ascii?Q?u/yvmD4G+fK8k2y2D2J15rKrS41Hr6OrP8vOddAP5GnObbYT5SDhk4vIjBYO?=
 =?us-ascii?Q?o/zqBBJ9Qd1JgRVMXjeUCrQ1+nzVcZNnNCHUFVWNQnd/clujMnFezBRrskrq?=
 =?us-ascii?Q?IAwYHyhU9L3RaXl32v47WBHR1MLKGb6Tw0el9uLgCX1iA23hQRy7hbYk4lta?=
 =?us-ascii?Q?Y1eI6eX6xUbAYVfVrnygfIoPIxqth3PXQEon1dGFuaXyESxc3TI2ACKLoN+O?=
 =?us-ascii?Q?eQ0M4BMrYN4CCgbyYuvlraJ69z5fUZ4Km9c4JXkjvHX+2s/dkME41m8VlVz+?=
 =?us-ascii?Q?2yazjGPtajgJR2VDaSW56djNN2N3BEhwkVgpUF00Dq4xTs84I8IBUmxymhT0?=
 =?us-ascii?Q?5PGCNr9RoAQXR1fpzHfl+q8/KsoKFCvEi1/1zuVUhpBuPNHu9eWNbnStFFc7?=
 =?us-ascii?Q?Mp8ijDndZp39TBGjnBIGqRloPXP+a6ApKFEg7EQEXRe0QA4c+SHFp1nyAj2V?=
 =?us-ascii?Q?xybMOCCSnRcxVmrFWeFP1fOcWmZnQa70ef7XmI4K1MDvttnv8fu6wuqun+RI?=
 =?us-ascii?Q?/TsaCahGQ2K/16wCxpqNqaUzakyUSuFvaJLqoQ4LTFiqpSwtmFBE7qPx5jOk?=
 =?us-ascii?Q?CiMmt/7HZ9Cr38sxzKDxN6yjsvHYgdTFuVUqZv55FK4sHiuJo7x2WzKQqsQw?=
 =?us-ascii?Q?h4/xDUv9EgqM6jkaC5OTNz51hpNaxE+81G3jcfJHPx/Xha1lACqzwSuYmz9i?=
 =?us-ascii?Q?Ih4dIi2Y9EbUDN3KA6WrRzzS8mL3F/YrCJljeIjTVuqFmIwFHluQ5qcFotKI?=
 =?us-ascii?Q?8/i8YdTMq3t/E4xBD3cLHyG44XiP5/hZh59X5/jRqBoRET8UrS2YDRWHzjbE?=
 =?us-ascii?Q?AafdtoLrP+RrZBixgx5lu94zxtgihx82XrWzl3rYf+VOHCGEa78NHIrQdSLh?=
 =?us-ascii?Q?cFQSpP7z9n6VOdXs6wLKGA1spYgSHmcDWsOHsXQjcnWC/XlqEpSTLKaJghrm?=
 =?us-ascii?Q?ZfNIlXBt7NjFjKLV8/k+cwpkpTyjgJBnKKjEs+1FBSOwqFnK1IhTnd+/2ZO5?=
 =?us-ascii?Q?YvF73a3WFtbnxgETWADm2Lx+LU0fGBlvGVdoXW1bIoU8ijRxrl5jvKK2WrcC?=
 =?us-ascii?Q?0eEszPIKHvGqWv94BeDZUmWI4heWYzBSO3p11nTE9p78W0MtPVCDzOskepbk?=
 =?us-ascii?Q?ulLj/YBxTyNFgIudHsJyXroVyEbczuoVi6SQ2+g+bCASMAUepi5aJQOOdIFB?=
 =?us-ascii?Q?ZUSTrpe+eHjv3HbHy4B7zQu/Lvo6NzopZQ7F9A+cLZHDVHe4FOPdBvgB8+A+?=
 =?us-ascii?Q?GqCOp0Qmquz6bWIAHFEYlIXDAYMp3/iuZ07UlAPwgkAQbL4fc67TTQ13sbRS?=
 =?us-ascii?Q?knqovYWLAqrgM1QLUQ7mfSmBYYtz9qFgh6QO8AQztaGY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c63ae6a-10b0-43b7-2976-08ddc5778051
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:18:40.0653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUyLMEYV4x7bGNcLapiL8TOTz2l6Jr8WOJsFl1b+PqvVRX1zJxRRmd6BqSdSD/WyT/2/EDR3pNb3i5kQh4ErSnxKqaxHC2dssAJq7BaPsVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Thursday, July 17, 2025 11:48 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas=
.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
>=20
> There is no need to manually build PCI device name from BDF data,
> since it was already prepared and assigned and can be accessed by
> calling pci_name() function.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 90b4fe92a611..00bb4e412c12 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -312,13 +312,9 @@ static struct configfs_subsystem xe_configfs =3D {
>  static struct xe_config_device *configfs_find_group(struct pci_dev *pdev=
)
>  {
>  	struct config_item *item;
> -	char name[64];
> -
> -	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->b=
us),
> -		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> =20
>  	mutex_lock(&xe_configfs.su_mutex);
> -	item =3D config_group_find_item(&xe_configfs.su_group, name);
> +	item =3D config_group_find_item(&xe_configfs.su_group, pci_name(pdev));

Oddly, it doesn't seem like pci_name is a helper function that generates th=
e name we were
previously constructing manually.  Instead, it looks like it returns either=
 pdev->dev->init_name
or pdev->dev->kobj->name.

On the other hand, I can't imagine a function called "pci_name" returning a=
nything other
than what we were looking for prior, so I'm going to trust you did your due=
 diligence
and that pci_name returns the same thing during runtime that the snprintf w=
as previously
constructing.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
=20
>  	mutex_unlock(&xe_configfs.su_mutex);
> =20
>  	if (!item)
> --=20
> 2.47.1
>=20
>=20
