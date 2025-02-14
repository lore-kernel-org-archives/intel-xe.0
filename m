Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DE9C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ED510E032;
	Fri, 14 Feb 2025 22:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtcaEvcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3410E032
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571550; x=1771107550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lPTLNEJ7yDtVpDzRnpoZIsa+RJC18gSvMI1RdTrECzE=;
 b=TtcaEvcMZ87OkZV5H9D5ogJXyK1Kx1sjTSfZJt+hoQy/o2U2iNjfDa+y
 kYj3yrpmRJEqUnNWS1oSBPGOc61yc0OfELN7NAHN1v+hErw+G3eSvTQz7
 XelXDyJPJK/17VpT/erfuN4sVSSu5LdSAU49FGRO1cVWGq7ap637OsMm2
 2ivtDimJxIvA+VnEo0nENDhuON1P7Pgyt6xhPmMJrS6j5dBYIWYhb2H4N
 L5Lkhs70/9F8UEoV4vOHU2Z9R6m4NfEVhaIzWBBKlLS1vmuHmlWJrULcR
 fWo/YXRhakE2DNj6+JWwdgSZYyCj8Hw8AqSGiKJtSPcGoAiDyMozzIfNH g==;
X-CSE-ConnectionGUID: XOFGSEuQQ9+lVVyjXk2wzA==
X-CSE-MsgGUID: YyrHAytvTqmWXa97GvfAEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51312592"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="51312592"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:10 -0800
X-CSE-ConnectionGUID: /h3+FKMbQiOi7k0sa07wvQ==
X-CSE-MsgGUID: A/Q/zJilQ8CaZqD6pL0v9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113298815"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 14:19:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:19:09 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naYNBKN9C/p9wIenWm5jK4QwG5OXIYncJryx8+Nr0OmWU07fkNnEojs2VHRLirmTCnllKTa0s/YLkdWgoz1UYjd8AehjcXjrHyFuMv9A5VHNfkIeKmxJa9BK7/yhgvxB6eISeqa+5HagN9d9L6tCImSamYrYNufMPKMDwdAmlOScHkHWUdrVE0YdYQnUFo8nQrRdiZ45Ea3fxFRSuCQwZ4YpCtII8KezSoz7bBGaEcYPfMtucY92P2s+NGh5CMnMXPHbJmupTucRV3lPyzdsyCZA+wT/69DuaaeRVzLa8I3BfrpZIO+7CDWw13CBFvJ4qgDdmMJZxQSwjJIJWQLlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJb3bzm8aS1JdT+/c533ilgxkvlT8Y73MNwRLYkZQQg=;
 b=gkYV4z2ji/P4dEhYZNWVeMkjXd/HY94YH/s3xOE0Vp1x4NIRnp07Dwy404l25MUvkYyxKZUd2aq5ZbCichJZYZMrqs0TZ8H4vsxcDXZAhXzRU9ekTiBvjLdHvyleKOuGpynazdTZR8yhXLn0Y+ewEJwWtjpGxl9m0kLmcuaQgZTfJhzL8CcAA4I9/AvbidbqKw/11Xro32QyAlHSgU+jU1hdZOClgdtPhs1oX800ZW632g0nAF9X+HG1YW8XEVY0dt/88ZWaqsUPAEG8AeMgOPGqy3oPoAuSSW2CDxCLs8G3NfZ+w/rAbF2snihnNJXwdiBImRmKOrDlarAkCH+XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:18:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:18:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/9] drm/xe: Stop setting drvdata to NULL
Thread-Topic: [PATCH 2/9] drm/xe: Stop setting drvdata to NULL
Thread-Index: AQHbfybQ6Y3IBLcGA0uEwojN4Ygcw7NHU0hA
Date: Fri, 14 Feb 2025 22:18:25 +0000
Message-ID: <CH0PR11MB5444D597CF01BE1ED1D1F2A5E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-3-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: 4d575073-fef3-46c4-f370-08dd4d458055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8zGBn9Wo9yCYon5HcQTje5Q+jCZmPpNNdf33wNjvuGHndMrM6IbtAwNY6fzE?=
 =?us-ascii?Q?Oyrh+8xo7Q5rDXB4cxqG3hRQmwNz6U1SiEOFmalFetcOt5qVce5gtfnmYn4d?=
 =?us-ascii?Q?PEaX9ubYVTb+uCUnLoGEV8wxUuB528yphDg3RlHB35CyRWltC+Ty8qheEcKF?=
 =?us-ascii?Q?1zKMCPXQwQiKm9Y6qNXL9p7w0cXeDcpHaeRxu0MlDx9ve/hWgUYQodngjYXw?=
 =?us-ascii?Q?smDtetrYMkbOTzRs3rbAqeNcNMQeRMGCiCQwtGiAx8GalnouPOOYru1qzdEN?=
 =?us-ascii?Q?FCXntHPe6bYfhHOx7NnrFnQ8hvFlhS9s4406XAvay9fswcCsI/klcL28oyCq?=
 =?us-ascii?Q?exXi+aTKG6Sa70ZLD3JjW9xQTsExb7AmwEx6RTFITTx8ljJlJ9Gcse78F3QB?=
 =?us-ascii?Q?0joI3vUx5Uh3P2G48CzWiXq1+1kYYp5rjadPluKJw+bIKNV+sbqBXeHFtI1/?=
 =?us-ascii?Q?38WmnyEHKMu08Kyi2Py4NgTwYhoAE7M9bgarkIkUpcrqRHc3CqY+BzhYozS/?=
 =?us-ascii?Q?VcP0w9yHQ3MTQ3WupJlBfI20MyyVhkRKk0/74cU9uqbkRapvQsBoCb1P2cz0?=
 =?us-ascii?Q?WMfUR0RRorUOh9bKnWFBJaVXaQTn0KqHLIwvXTMXwJc4swyo+Nm/VFM0329N?=
 =?us-ascii?Q?w+eNPCk0AkJoe/cHhq82QBAxiSITfGxetSDl9BO+9SHx33Bh31stuoKk5577?=
 =?us-ascii?Q?uTC5mb29nDQM16N69A4esMO0xtEW6cGCiUbLOHjPn0jMJVf19RV72uYrd0MJ?=
 =?us-ascii?Q?745lRfmTU2hy76RlPo6ln5KNVuKg4BKVzvRYoyiy8BTHc3z33Pr5gG0VZd7o?=
 =?us-ascii?Q?sXN1Eg0KYAk4fx50bG6q7rzEMfp0CjOICbRwtQxMCRdAX5SZlCWRt30bXlka?=
 =?us-ascii?Q?N53Y0pnHRLVIV+iLCYHQTItZvsXLRa5oYMRNDWzEDHPBpqaa6vGXhr3QUvCW?=
 =?us-ascii?Q?gFBSU20Ck4rw5ZxIifBYnLJTGjL4TEIMUBMf7WUGNLhb0HwWc5P+WyMOQFdm?=
 =?us-ascii?Q?/c/Lqr2gdyUYO8agrAtzECWPvU+bFHhY8MfhPr3SvujT1P4vSUkcDPZRxRvb?=
 =?us-ascii?Q?PGUTA8SMYcENtk3GA0V2mln1DWYdWsJLOSmXRN36BtUyU0MdmERzajK9cePm?=
 =?us-ascii?Q?qDmPOyKaAAySsC5U7MUE49UYr+Y6vZG8T59+XnWutUKIWMz9omt2SPG2tPgp?=
 =?us-ascii?Q?Ge1VzEyNDpZWu7+PWGwfEWSP8+jVwtkKpLl7t6r9/Xv/4EDyS3qff2Mpk2D8?=
 =?us-ascii?Q?RLmPFM0ZNgcapBo749JmH3yXqkF2nzH7o0p44ahHl1+ySfn5IHKZeETnlpyY?=
 =?us-ascii?Q?RpsPBMs/DX9EW+4NTqyGRleNI5fJsAxNMQjCxmUFLOQ+Nao7GxWKQwxzrTu2?=
 =?us-ascii?Q?TZpPNJtBmAHmr17WsAjV1ltE7K4CTBX7H7TajYadeQ7uGGR3caVYEzZqI6lY?=
 =?us-ascii?Q?kTWpZWQElIVJZ9klL7M3y50n31W1vYaX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Q/klEF9JBO559iAAlfddeYAdrA26ZT97A2A07pxZobD+vkQdhiek1oz2a8v?=
 =?us-ascii?Q?nKXi/ZOKR1XRfVZk1AtYVQ8ce/6jO5zAq+lBkaGwhfxjjKCusCBRK07ywc09?=
 =?us-ascii?Q?kpQkG8SCDt6igVLGkY/RhCwuB/Oh6r1NNOkpTtG6As16fpotAKh0x0jEGNJ7?=
 =?us-ascii?Q?y6GKSaf4XHDMpGbKdNE2I1w0JtAR9v0g91AJ08LyiB7xYBZW+2vNA79GdWeZ?=
 =?us-ascii?Q?RTl2v2nUvRTX9zBw2DL8ad2XjB8llEYBdu0JmNw0rQkSowb4oHyKmaui0fKs?=
 =?us-ascii?Q?bTUYSLxpNNp5x1Q/vHZ/vT2AcOzoA+S2iVBRmfUfyBDLkKWbr6dQQwZUUCSw?=
 =?us-ascii?Q?vp1Jdj2tDwwomT0I6Mgq5a+AUzREZMmrICQV1K4GVqg2EKokTUAmMQoOAfyE?=
 =?us-ascii?Q?fPn7jmosorYq3TyK14yDMnKSiFvLzRLjkLNFFUGTLbAxPlIibbl8hHb/uTmH?=
 =?us-ascii?Q?hUb6SLe01kq/kgJWX4Iz0y21cubH0FjrZlAAV605yi/op6vUp6AdGPAtxLc/?=
 =?us-ascii?Q?J6BhS/Yr7IFIX9m/2CakDFJhERXYHUVwoZYs62JgpsFYPcZd0hPXM8SqTITr?=
 =?us-ascii?Q?snn7x+BN9aOoTkeavOQJFMtcPO4dLw0pfyKuxW1dqrdRaDgpknSR08k7pxIg?=
 =?us-ascii?Q?gEF9bG5oawW58jp1h53BYSebismmB0atAPYLnqmZc29gv/0u/XX0uwH+2t5N?=
 =?us-ascii?Q?EsmiO3Swm+Nou6WX3JFjNbeLewM57zr9gl9JdwtY7elauDNT98sgaVjY8UEG?=
 =?us-ascii?Q?EBlmWzzvo89f9iQd1GtT3yFnJxB5wUcVDVtEPTgGIjbnZ4B5S0RjnrIE5VQF?=
 =?us-ascii?Q?KGJbfoQM2ohZATvLNchd8jWTZ0cs4Ivkfdqn0XdN2MA2cp5PmAvnS0xuqXlW?=
 =?us-ascii?Q?+BYlQP7N7vlpmUd8l8SFYte21Q5BbHX+jd4M8rslRKTxiNRXWvJbcnX1k/IP?=
 =?us-ascii?Q?Cd5yf1fiPLcyokZZKVSBG0maitLPix1QJGFWLFrbW9AWSVw6IxQHUxa6RO6t?=
 =?us-ascii?Q?cnYlhP19Cwcf9jDIyJb0cWqgprFWNrfDucbqD+Kk4/Go4r83uTGJ8xrSXHg/?=
 =?us-ascii?Q?YHs6jeSN4d/AvvnUS54cIEmKf1ts7ABt7iICyexuzHF1gYcljujzlWYPjOAf?=
 =?us-ascii?Q?oyTH2pxI4ps+Ko0oMmP0nKgGC+dgLn2A9tc6eXkLQ8ot2QzKavFFPcY2oKA+?=
 =?us-ascii?Q?qsUOXwH/I+wtCXADwiVWyPYe1APGNdAXbkaban3+TQEUE8ASAf3zhqp9feQl?=
 =?us-ascii?Q?dmtMBHTihID3qQRxQJQkMR/lcLquPfeZRX6Lvtl0ckiw2rSZLpdcL4ujbtlh?=
 =?us-ascii?Q?e+NPtGKApCmStLrpyVwl8pThGaI7FCK4JttSmkOIcbnjkJeJB6JSXek8l31u?=
 =?us-ascii?Q?LdOZI8qckqOpeONcR8swzG5Xun9YzS+bSyPTjOim73v3N3ti6o6NLkq1vTXK?=
 =?us-ascii?Q?IlSRh96PZ2HJMXpApuWwzTdAdn4apCyVWpHVi5YPpcnsvBH4bFHM6xMEYsmR?=
 =?us-ascii?Q?dG6sWjbpMO3zD0n2fQEXOdJDYUefkntDw04GFJ992/xye4O0DK7hJnksKC36?=
 =?us-ascii?Q?sp8WI3SRHyvOkBKQRK+0xTPWGrnpWr4C2agFAG5t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d575073-fef3-46c4-f370-08dd4d458055
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:18:25.7496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvIkkaXV56G7gM36NdZsgWU9JGXJ+d4KmuI1kgmGBAYD0xIgQZnskvtygPCTyJ5HG5vnft5itraJGNwV+ZAn6nKpdStdEXfdBIo4wDwg+OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH 2/9] drm/xe: Stop setting drvdata to NULL
>=20
> PCI subsystem is not supposed to call the remove() function when probe
> fails and doesn't need a protection for that. The only places checking
> for NULL drvdata, is on 2 sysfs files and they shouldn't be needed since
> the files are removed and reads on open fds just return an error.
>=20
> For this protection the core driver implementation in
> drivers/base/dd.c:device_unbind_cleanup() already sets it to NULL, after
> the release of dev resources.
>=20
> Remove the setting to NULL so it's possible to obtain the xe pointer
> from callbacks like the component unbind from device_unbind_cleanup(),
> i.e. after xe_pci_remove() already finished.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me.  I see that we still have code paths in
pdev_to_xe_device that would cause it to return NULL in some cases,
but if you're certain that we'd never hit those cases with the removal
of the remove() function, then I'll take that at face value.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c       | 6 ------
>  drivers/gpu/drm/xe/xe_pci.c                | 7 +------
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>  3 files changed, 1 insertion(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index 7375937934fae..7efbd4c52791c 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -32,9 +32,6 @@ vram_d3cold_threshold_show(struct device *dev,
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	int ret;
> =20
> -	if (!xe)
> -		return -EINVAL;
> -
>  	xe_pm_runtime_get(xe);
>  	ret =3D sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
>  	xe_pm_runtime_put(xe);
> @@ -51,9 +48,6 @@ vram_d3cold_threshold_store(struct device *dev, struct =
device_attribute *attr,
>  	u32 vram_d3cold_threshold;
>  	int ret;
> =20
> -	if (!xe)
> -		return -EINVAL;
> -
>  	ret =3D kstrtou32(buff, 0, &vram_d3cold_threshold);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 70b697fde5b96..41ec6825b9bcc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -770,11 +770,7 @@ static int xe_info_init(struct xe_device *xe,
> =20
>  static void xe_pci_remove(struct pci_dev *pdev)
>  {
> -	struct xe_device *xe;
> -
> -	xe =3D pdev_to_xe_device(pdev);
> -	if (!xe) /* driver load aborted, nothing to cleanup */
> -		return;
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> =20
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
> @@ -784,7 +780,6 @@ static void xe_pci_remove(struct pci_dev *pdev)
> =20
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
> -	pci_set_drvdata(pdev, NULL);
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 02b4eadf84079..04a341606a7c5 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -202,7 +202,6 @@ void xe_survivability_mode_remove(struct xe_device *x=
e)
>  	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>  	xe_heci_gsc_fini(xe);
>  	kfree(survivability->info);
> -	pci_set_drvdata(pdev, NULL);
>  }
> =20
>  /**
> --=20
> 2.48.1
>=20
>=20
