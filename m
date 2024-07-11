Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AE9C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 18:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184D10EB37;
	Thu, 11 Jul 2024 18:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3VZ9q6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20410EB37
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720722033; x=1752258033;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lk/v0g9BDIebkTglJQLf+pIE9whIliwih/s8jtQVklY=;
 b=J3VZ9q6Tp9ZAEKVw4p0mts8bU64K5ZfHIjfvo+Uf2c5X3avikaCAIVJS
 ihPJfCkOZ9RtsJo78qkEVZDf8Fp1Sqs6LpghHP49Vv4zjU5EKzC5qEMLH
 WiD00HZc4lkZDLzurbVPmJtWLpWTQIJ8gwIYZ+0um4RR5sPeQt6G1OsEU
 k6IEFH7yEOJqWjxqMYPbXv+9DnFCU1XeXLOaYx1FNA89vJXBWKD4QOiNc
 fezUIpkveUAkfeZigBSHeEA0cUh3+0iH7CRggLW6tudUsKVcZLAT1zGmk
 zFhMhVgM3delRQikj+0HnsSkvNeMxi1ziEvgk7VQNDEp9ORexP140Yig/ g==;
X-CSE-ConnectionGUID: dOwOtRBXSfuWlOYdbjgSiA==
X-CSE-MsgGUID: KLCAIck1SoCaI8f4tcYjoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29281346"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29281346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:20:33 -0700
X-CSE-ConnectionGUID: T+4yu19bQF+kpCGjZhCNZw==
X-CSE-MsgGUID: 2NbNPqAFRkOgqm13bKBrCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53041682"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:20:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:20:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:20:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:20:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA8DZgjU1WTrmZgvk94cAzE+PCm0thQqpH6myeQi/uhU8tJv9BfFti2W1AojFcPwm7AtCs/KSAdTSqUvDfoGxZH5aaZJMJHdIREvjIdKDNVZKvOhn09etb5y7ZxjL4a8GdWp8GCv/JXQJThKXHMEO5HBEJtXPbUaYtgB2dOQz+haZ9+aoprrO/Z9Iuk0KSCBsN5ysp8O8F0bpXQHT1zGstbglQSEIyBPf/H1QtuBOje9xsU27+Nzh8E3pSkflabwZa5shZoQS83MG24bJAGZXZgy5iEzn8gruRgSi9Xr35GY/32/M831JKZ10HLSiQV5YlIKcDwekBvZS42ZZ/K80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN+mi5vcBH6VvwtdLyOAEerdpVsHudMb39DdmjI8scE=;
 b=APuG8q7y6x1f9U3Nd0+TkGM+/Kx7BNWrYontbmitJ64j4CZbwyj/eGtW83ItNN0aDv2yrLI4FxVqup/QLTNB6wtYdgEGISv9cFs6FiJAF83o/brZP2EjYlU3Zao2vX4JooFtqDvxjwUf1p4Z2IiXwvczymxCcZQKqROEij6e7QmC+dF4UC4mQKyTGTQy2rGUF8QGIJnRNU+sf+a+SU6RKsW2WXePP0mJR1mzmVERZrLPAYFeeIrOiS8UlPAXxYAJr49yBbtudOFag60z0adYzo4eXgcqvVjOFJ0jcnqSxJj7DoRYtqXEReLz8i/Zzkuk9K79uuUUpn9IeEB0FDWwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 18:20:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 18:20:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHa07jx0Xan/mYymE+J9N36qd91pLHx059g
Date: Thu, 11 Jul 2024 18:20:26 +0000
Message-ID: <CH0PR11MB544480166880B0EE2194EFD1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <cover.1720718987.git.stuart.summers@intel.com>
 <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
In-Reply-To: <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7133:EE_
x-ms-office365-filtering-correlation-id: fdafa000-40af-4f7f-55b4-08dca1d62321
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bbXDQFIZFd2ULOncDm1yDdHWDjE8+VRYpUQjHOr6JX35tJDCtkVUBegeoMQR?=
 =?us-ascii?Q?3TAd4/DdhUueCTfeAhLngKf4nLnk1kcsaKuZHj89CkTIolmGEy5tDpM26in+?=
 =?us-ascii?Q?1/C2ZowdeUxcOV1dSeUvDUNxZP4WVPQiW+4S+px+Xgup7KuK1jb3yRaxO9C0?=
 =?us-ascii?Q?/yLkYfLfGge7egVLXkxq1ADzThapEtML0ILsd3cDg7nbuU4sjlaaRxnNHeiE?=
 =?us-ascii?Q?ycvAaaKuKMAZLLp1rU401v2lt035FQOL2SYRMJYZ743hvS3m+iRwTv7Nn8Xr?=
 =?us-ascii?Q?6h6KdGrIjtdku1A9mirSMPS52VuT+1eV0vS3+935cn9BsAcMiVcZehZOwUDL?=
 =?us-ascii?Q?tI1IkP57ztoUJr7wGvf0k+rLG02Aj18EUV9CRE51MU3sh7yBn7cvaSQb9yFw?=
 =?us-ascii?Q?BtwsyuB4u9Xh2+Q4QeJ306OEuKAYNmvxNxUmNzsneTd7Kt26ph36A79rbgpe?=
 =?us-ascii?Q?tTTrNTtytLdw85wDBO2+mPa2Ndq/v7rR9rPovpYVhZ1qSVDptr9wH++1qqIv?=
 =?us-ascii?Q?JiWgDdxkp2bF/YigRs6xhBEqGLCs/3eVK9Jtj0Vn65MCFhWnQWs94a6t5lfn?=
 =?us-ascii?Q?hBmUgo+uhbQgS1vH6oAsvSV3QTPx36QKm/DOzSnoVM270PiQeUwrhwXYe6Fu?=
 =?us-ascii?Q?ANC6PEk5iSnxjNa0nwfRGzxciU8CEHBihLov9+PZQPpEOuxzFqPvWX7bws4c?=
 =?us-ascii?Q?j++HGjJesVVYIiJkRFOplNR9a/RD+FD0M0GQejMSh5KnDI0VzMbICECh9UPO?=
 =?us-ascii?Q?70UPB+JmbKoTD/iV/7er6I50r9MIsBzxjKlsZSMpqGLjR7ixO03NqZygWGZ3?=
 =?us-ascii?Q?3D7WwE8Y3w9d0Voqi66gM6KVDCQ9WRGELdg1qK2ZRQm3M27cO472SaCndhQs?=
 =?us-ascii?Q?xVNjWy2wKZvkxG67fuSy4IPs9y7eWBiqNm/8GxynJ3LjTmn/gyftLLFDALwz?=
 =?us-ascii?Q?u8/3Zh4FwMQgTsFXswewJS2PqUq65HF+PYtbPlTOjjz8RxB1/77Me7YZ8pa8?=
 =?us-ascii?Q?8K2tg3iB19dv9ii7dFGpldwkL4r9Y7XM315QdwSmZl323iuyiv5vOcbkSYCO?=
 =?us-ascii?Q?TYydLZrm7WbyGw4Xx6Gbf2BbXy0JmArsjSWyGTbHhaLEHKXqhFpASwIM/6oU?=
 =?us-ascii?Q?NiB59lOw/3rHD7iHYHRUjiVoIsiM6l3l9trTohQUHzRHGEn7r5Qb9J5M9KCF?=
 =?us-ascii?Q?Ab/wbZeb6hCYiuzq33JuzJ6PvlwAuKi6BpHFCGFmO+OuTveB8iEF3Ls1PkZd?=
 =?us-ascii?Q?Rj2s1iA3zdSh8WivwjM8esBfJEK71ACgTORt5sImvuJYC9CGhqq/MYQkJST7?=
 =?us-ascii?Q?4qECqIs2Hw45qyVZ2bb71COAhS4mFOhbf0JDyCd0/lY/YdsPOUQ8uW6Jd872?=
 =?us-ascii?Q?DZawDSBiDFNnKWKDRanw+rXLsJXISQW67YlUWx1oIFD50eOidQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0lJu5BxM2ZRHsOfleXuIjUbzPQYAQjDwGthptiJs8N+XaoRTIYVmMHzLp4n5?=
 =?us-ascii?Q?XvJQFUtytNGvYY93aIj0RA19YNWE2XvwFz58+Ni/3pioAPV5MnUiMX0wXaq4?=
 =?us-ascii?Q?ELrsoqI6Afw4LmSmVGQruvlfPEqWAq4d/ceM5xPU6bKuIeTac2HGfwtr/FAS?=
 =?us-ascii?Q?lD44B0YRNQA8PjdInRyPPHziOhX2/gM4zzkrbomBphYJX1+0SkQk/auOTzfH?=
 =?us-ascii?Q?yeim8IKeDKASrSNRbrEuLSHjelwr1ujJbjsXAOBB/eSqUnVxYGsI+0wo/ST9?=
 =?us-ascii?Q?hWSZARQMSwVrNmmk9xwpSgNe0GwLzoirESteA52PlbG74ZurB6mCkNlK745S?=
 =?us-ascii?Q?cDId+YxkwJfNhYY95A/zCMOskTmdvf7UXEyLAu2XJdk0jenrsyvTJPzzuI6H?=
 =?us-ascii?Q?l7gWad++wogX3w+Iyq3lJSPoatveR/coHLH++3cIfkg5l24XemaBrpc+Kc9k?=
 =?us-ascii?Q?Lyayt6TSZzDdKarpOMQB8GToU/vF+x1kZYSA7YF2/yHkp+cp8K3NHJh30w/9?=
 =?us-ascii?Q?cpVnlk4r0wG+v1kiVuDLAaS/Mod9U3xhoqiaaD5KQWUS5uimoaGBcE+rtpG0?=
 =?us-ascii?Q?SbqU64zSgwsoXikvgb8ZUrXduQ+zsQ5D0JNCiY4wdWZRqsrs8iN3WwVDKWD+?=
 =?us-ascii?Q?sdGRghYJDhtEfSayILKU8s0G098xLDWe353GE6m7+Sb+E244vevoqEPgIJrk?=
 =?us-ascii?Q?E3t9u7rRggpgTvBIrUH7i0tBcXXMfDh+GT2uG7Z9wmrcxh+2e9l0+OSc+CRB?=
 =?us-ascii?Q?Iq8gZEG2N7rHZH08vi1W97X/hBZTmtGyhPLjEN4zl/Gwbc0zH5PaV9SdeNwB?=
 =?us-ascii?Q?NkxPlcWsHcEj6OCRCoU6CHFqtle7uKFVNCapZn4MXYPI6xQXuiEcO/mUrpuc?=
 =?us-ascii?Q?DyDSS1/ZpoeVw+Qlsg95bVjLof4IdRL43prrqzn+VToh5dQMFNup5cwp6rY/?=
 =?us-ascii?Q?3Q7KbZ7DmgNAQ87mgD8T/w32QqebJdWa/qbhf4lOGyqo/SgAI0sRXEaMQ3X1?=
 =?us-ascii?Q?8XVzV5ok9fYedaKDq1rNCPv8lC55HrGdvvTY++LSeS6krjpNzm2WE3iiD6Mh?=
 =?us-ascii?Q?RgvJAplADtgiJchBiy6dj1O9g2LjGP7s+C8s4VZndwqkurf2yX9+xV5e1Vf5?=
 =?us-ascii?Q?RtkPsulVqlZlH3y1BByI5jIWDTXkjqR0RhGdeHx7+VAQZgCg+P96+pn+zTgE?=
 =?us-ascii?Q?pS/18ftZ1qv08x+0a6ztODtfiVMIjHqVMtOzYJkNSolrsJI0qdcsRkDAsBWU?=
 =?us-ascii?Q?ZgfgNPEmw8NNDML5zqLpHuXeaHjIg1QZdlQnmISMlf4nR9TKqY5W5W2y2sHH?=
 =?us-ascii?Q?hn6D0rlu8CN2PGR8cfFCYxAdDN/GU5S3a60mO2ZdzRmDQe2dywTAB1rQU4fu?=
 =?us-ascii?Q?Uib64lONMm7xzO0BAIyvc+VUc7NZxoCoCfmebHvPGyVF5i3+q+jhv8Gs0tqt?=
 =?us-ascii?Q?+oaPoC8WmxctQHqV1Mcw8ynVMPYguqarUxP8MNQZ5FCQSTP0Og94lFtywhbS?=
 =?us-ascii?Q?pKT0r7JbgB11W+6Ht99bHBr6OwCJFSACOhoga9ExW4xJ+UqTbUXuSLQTwLyO?=
 =?us-ascii?Q?rVbVinE52ul+OMbGEftzZQA+j3vIZAITRc2emZ17?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdafa000-40af-4f7f-55b4-08dca1d62321
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 18:20:26.4058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCI17c/8RWHO/tPzompXvOPSMHH+VsyAnVX/H3ClHikOoDlmBGcY02GAHb/Y0DaOvgVRi7JUv0Eo69mKoB238iu4pxH0WFGVoXVOOA9O2wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Stuart=
 Summers
Sent: Thursday, July 11, 2024 10:36 AM
Cc: Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harr=
ison@intel.com>; Welty, Brian <brian.welty@intel.com>; intel-xe@lists.freed=
esktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Summers, Stuart <stuart=
.summers@intel.com>
Subject: [PATCH 2/2] drm/xe: Use topology to determine page fault queue siz=
e
>=20
> Currently the page fault queue size is hard coded. However
> the hardware supports faulting for each EU and each CS.
> For some applications running on hardware with a large
> number of EUs and CSs, this can result in an overflow of
> the page fault queue.
>=20
> Add a small calculation to determine the page fault queue
> size based on the number of EUs and CSs in the platform as
> detmined by fuses.
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
>  2 files changed, 49 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe=
_gt_pagefault.c
> index b2a7fa55bd18..6bfc60c0274a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, =
struct pagefault *pf)
>  			PFD_VIRTUAL_ADDR_LO_SHIFT;
> =20
>  		pf_queue->tail =3D (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>  		ret =3D true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  {
>  	lockdep_assert_held(&pf_queue->lock);
> =20
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=3D
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=3D
>  		PF_MSG_LEN_DW;
>  }
> =20
> @@ -312,22 +313,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u3=
2 *msg, u32 len)
>  	u32 asid;
>  	bool full;
> =20
> -	/*
> -	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW =
=3D=3D 0
> -	 */
> -	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> -
>  	if (unlikely(len !=3D PF_MSG_LEN_DW))
>  		return -EPROTO;
> =20
>  	asid =3D FIELD_GET(PFD_ASID, msg[1]);
>  	pf_queue =3D gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
> =20
> +	/*
> +	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW =
=3D=3D 0

PF_QUEUE_NUM_DW was removed in this patch.  I think it would be more accura=
te to say:

/*
 * The below logic doesn't work unless the number of dwords in the
 * pagefault queue is a multiple of the pagefault message length.
 */

But this is just a nitpick.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +	 */
> +	xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw % PF_MSG_LEN_DW));
> +
>  	spin_lock_irqsave(&pf_queue->lock, flags);
>  	full =3D pf_queue_full(pf_queue);
>  	if (!full) {
>  		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
> -		pf_queue->head =3D (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> +		pf_queue->head =3D (pf_queue->head + len) %
> +			pf_queue->pf_queue_num_dw;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> @@ -386,26 +388,54 @@ static void pagefault_fini(void *arg)
>  {
>  	struct xe_gt *gt =3D arg;
>  	struct xe_device *xe =3D gt_to_xe(gt);
> +	int i;
> =20
>  	if (!xe->info.has_usm)
>  		return;
> =20
>  	destroy_workqueue(gt->usm.acc_wq);
>  	destroy_workqueue(gt->usm.pf_wq);
> +
> +	for (i =3D 0; i < NUM_PF_QUEUE; ++i)
> +		kfree(gt->usm.pf_queue[i].data);
> +}
> +
> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue=
)
> +{
> +	xe_dss_mask_t all_dss;
> +	int num_dss, num_eus;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	num_dss =3D bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +	num_eus =3D bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +				XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +	/* user can issue separate page faults per EU and per CS */
> +	pf_queue->pf_queue_num_dw =3D
> +		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
> +
> +	pf_queue->gt =3D gt;
> +	pf_queue->data =3D kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> +
> +	return 0;
>  }
> =20
>  int xe_gt_pagefault_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> -	int i;
> +	int i, ret =3D 0;
> =20
>  	if (!xe->info.has_usm)
>  		return 0;
> =20
>  	for (i =3D 0; i < NUM_PF_QUEUE; ++i) {
> -		gt->usm.pf_queue[i].gt =3D gt;
> -		spin_lock_init(&gt->usm.pf_queue[i].lock);
> -		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
> +		ret =3D xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> +		if (ret)
> +			return ret;
>  	}
>  	for (i =3D 0; i < NUM_ACC_QUEUE; ++i) {
>  		gt->usm.acc_queue[i].gt =3D gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 38a0d0e178c8..263a604b76b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,9 +233,14 @@ struct xe_gt {
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
>  			struct xe_gt *gt;
> -#define PF_QUEUE_NUM_DW	128
>  			/** @usm.pf_queue.data: data in the page fault queue */
> -			u32 data[PF_QUEUE_NUM_DW];
> +			u32 *data;
> +			/**
> +			 * @usm.pf_queue_num_dw: number of DWORDS in the page
> +			 * fault queue. Dynamically calculated based on the number
> +			 * of compute resources available.
> +			 */
> +			u32 pf_queue_num_dw;
>  			/**
>  			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
>  			 * moved by worker which processes faults (consumer).
> --=20
> 2.34.1
>=20
>=20
