Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326FC27C44
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 17:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E651E10E151;
	Wed, 29 May 2024 17:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbbyWRw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0FD10E32A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717003774; x=1748539774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tItdXDO1n7T3Qkl/e2N7AWYAqR3sULI/+GSvxiFBhLI=;
 b=bbbyWRw6UhIXaX5yvZBEoorv6atNDUzRO6yudBLc308o3VSuKD12J7NQ
 /+aj3QSrzDZ/M887tutfY+cYBgdHoG2wJulYjflzLsfdsvn5QGeLyTA55
 OYPzAsbbo6pgeznlx+d9DE5HEsAh98OmgSdnKkM7g2uRcS7yAdiYoBp3p
 K4HT4q/TBlzadTARdBXLPKTA56KbYeJ5DxFv2EE/rXOhgeu0Wh5nvL3Ob
 BHF6ONnZyGkVUY/fx3D5tYjAsYDl+NzRoio64FLkNuQ8E8c8rxidGQrpd
 l7Y/g/PPBlC6ieAWLm+tDZ7shkgA6KFRhMGSTbF0U/sQWbtvg4RkrFeEO Q==;
X-CSE-ConnectionGUID: N9y+KSXDS1OL3/F5nxxZcQ==
X-CSE-MsgGUID: KLLMoX1HReapJ9sDTg5zNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30950368"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30950368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 10:29:33 -0700
X-CSE-ConnectionGUID: 5WKStsV+RVmYb7HQ8CLbTg==
X-CSE-MsgGUID: jwsVgXWLTDCeOIFzbYvPXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35481336"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 10:29:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 10:29:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 10:29:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 10:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la9xzQ8C6NS/dF9pnwA1qATzNGUUXFPCv3Ox6NrHJ3Y2UzYnLJnsGdLrDiOs2OLiU8shOVuSWVj5QthwRXbalAwDvnScprKI8ENaTrigVdik5j7KMr3ZfJDYs8cvdZWUBR29IAQvO91DVGC98EEITis/louFRNOFLmcubBsUmU8oRWbjKPIy25FHTVJOj/KnceU03FK1sdQim0yAHiPmOsOpfal+eMEC1tRgouJHrcY6EDtdXNpdi92OBiaTbiuPG/tl8uty/dKPjC81U7zsYB2qSzUGVtxVMFvNDV6NJemyLl7BFBbLj17SgmK/RdkQW8pC7PJWbM27AAuu+IkPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JV4c58vdVsBB4cdCQhlGV6vEf75Jaj2EpLnjBN3vd4=;
 b=CCNVaiUWFFiRP9c6QBM0TGKEwNyuvCRmYTVK7kTImsesYWxwqH4yUtcyuT2WxJB/IP94jGozkkHEEPk7khUobmufu80OKjcxsG/zt3/NrT1Ojsf2V/17gCaTbmpreVr2UyA5H04oJov8O/Apv0HEtTH9QVhEOnXYQxnXOlaSI9vupGtci0yV/yXriGmdxVR0ZA4G21lIJ1ohv1fy/5Of1j7x0giYjqPAm/wHKbmpDSUQJzSSr5tY3d+VHX+n/QEDD1f6w3d5RwrsIkNEIXAFTV/NAwKxkJHDTMjs2Tug30GeIYnEFpSxrAVM3yYf6srquD5JcQVrdeK16puHA3ZdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 17:29:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 17:29:29 +0000
Date: Wed, 29 May 2024 12:29:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] Store platform name in xe_device.info
Message-ID: <gdtydoupnmf46cjjwke7ricbv53sqoquchhhbxdtuz2w4mf6e6@5co3sghhpxk3>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
 <a5058894-0726-4bc5-85a1-78e594cef17d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a5058894-0726-4bc5-85a1-78e594cef17d@intel.com>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: faf5370d-6283-4ea7-8c1a-08dc8004e548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WrYgEtWDS1aYa9Urh1GMBc1CvZTnPcESL3Np9ak4BydbV1rMrmCAkd+2mlpr?=
 =?us-ascii?Q?jM3kZk0zEdoXRxAM2z/naCxum5lansqZm5CBjlriB+FNYm+k+K7b0q39VOcl?=
 =?us-ascii?Q?D7F+ak77ihTnHxKLI9eeICL9HXKUeq+wQWtzdlnu8d2RbJ3AAlI1WHad2qKW?=
 =?us-ascii?Q?WhW5o92pvQ/It9paRM0YmYnhJAP+jeVGsWujc74pRsP+Jlel+P2C39GIiFsp?=
 =?us-ascii?Q?GtZMvrvIWoux0o311pMzI71umLROIAHqOQEV34/Ft22Qf1saczNZVAy0WItQ?=
 =?us-ascii?Q?zmrZ3dn5suZYTIV8esdIzfG6ncfx7rUdZzqEQQhavmpnGD7YFtSvRVtdh3gZ?=
 =?us-ascii?Q?fUBn5IGQPvEVVOmeF/SQ/nvnf78BqAX3cZ3jmA8X+Bdmpxqwz28Vvvd5+jQY?=
 =?us-ascii?Q?rh7LtGTYB5vc/3PaQpSDS/+2lR0xFGgBIKfQ0r2QPdxygaD5ldheHBG8tFf1?=
 =?us-ascii?Q?fZNk3g+y5UujHS/rbWrWLbXcIdPtUZjUDGJ5belnKd0amoJIC5NmtzmoXKmF?=
 =?us-ascii?Q?yovCPNd2Y2fN37RkwJm/E0w2epF1fz3I1z7yh3jlACS2yymyH3l22jCLYxbS?=
 =?us-ascii?Q?/MRukqukncXBPqlbAeBu8t6hnRuWiRkrtNxxwMP7eKjOwySoHoWikRb5t/jk?=
 =?us-ascii?Q?Hfgu70gf54/FItdWRnUWsTuJEmrlvJriXUEHvzJjcdZ9zKOsnSz3cR+53c3M?=
 =?us-ascii?Q?HQjUt5jKtqfOJE6dZIZ4ndAdXulANTmI3KMPa0N6MMO4yLYqxHiGOkkCf9iM?=
 =?us-ascii?Q?qii1YnZJH7TI0XH+P4IkArny1bOFnK7MiH6RMQ3ivMEjPvw5janTAxMpBz0c?=
 =?us-ascii?Q?wCb5PU/Du5dhKt7ANfRVExMlc+9wsh5t7f21wzZW8mk+YXK1hHaCfLWrsa5P?=
 =?us-ascii?Q?GT1bPhb4n+5lYNMTW5fa10/1yZOVXRbjEYCYWnY2SG8By9CY4bOWm/eOsTgw?=
 =?us-ascii?Q?4faBPFcPa+YkaTQIYkxkXfLR1GUkV4iS6ALme6hwyGWFeDjfFDuSFnQoMzre?=
 =?us-ascii?Q?SA1TrHuNW1uwN9uOu6UiIy6lTBlJX8JdeQY2j70fihPG3pqmcUEg9BK1noOn?=
 =?us-ascii?Q?5RITNsZcHBmKrATJiL4DExBi+ctt/wxKCygspBif0cmkX8S2Ka2HtXcG/mKx?=
 =?us-ascii?Q?EUQwRxeI4/vILuKGU057VxZc9KJR+uNjfz//8qI9qsv90vGq7Mtq5OM7qMxW?=
 =?us-ascii?Q?W2RPzusQ4SeGcKnvWAj7s9LhwKkBRn+nHxO/5tc05Klf4vTjrBLh/znHD5ea?=
 =?us-ascii?Q?94gFbMiXjrQcSNALbChdJMMRhJWC7nUstQgrvbNhWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7g/xemqC9krdqI35KFT0AfAJOZTLeBuk2ZuGsL8Z0ezxJb0+ziZJbpgYeTC?=
 =?us-ascii?Q?18h/N00aYSvDs4hirra3DDYIkF3Bgq7UdolvJBbkewv4Tw9GhzUkBwt2HyYw?=
 =?us-ascii?Q?Jj6DDufERXbQwglpD3rAQEUgSRhJVDXAesY95BvER1jHduMcu/OIJMvHVoQ5?=
 =?us-ascii?Q?o7MNxKYHZEYRtcjMhl37Cr/sykChpyJ5r91oAWAhwbgjtokaJ86MJmJuNyKT?=
 =?us-ascii?Q?Rt7RMyuw+kvs6X2fYxslRXUmw3Msj9hzs6GNv9LbDN2DlUxx39yjyBLSR2UI?=
 =?us-ascii?Q?ovCSEFPITC7DWERjzsRXYbUFTxquFsnbGAHjDltXUI/+Nz6i01IwwMEv7TBL?=
 =?us-ascii?Q?8wJaLEneP41uZLAygEwmqRMbXiHRA+Twi9vin366Q8Z0rUCrAy3O+kbXL3Qe?=
 =?us-ascii?Q?1jA70yqdDF8oYOBTUYhDbNQRfZhoTGoZceL6EUnX2dgpY+jad3iOkQepQOsl?=
 =?us-ascii?Q?h2Wq1733G979TF8DaOgtgT2khbG2uQhxJnu7xeYUAoK8GC4Ssdlpdd/StVHx?=
 =?us-ascii?Q?tiNSyRWLrMexWVc2ikXtX+GkOljnf3oOsAR6wahXrDX0yDKykXScs9B7dUng?=
 =?us-ascii?Q?muoZg/IHqWYUJVLs2+WybPYX1CectcP7uRbdiv0JpeZf5GWsL6h9qMHGbZkd?=
 =?us-ascii?Q?Fhmptx09HI/YvXsxwBvJ0brYCx/ONDcDFxklZj6Ce5GrW1kEnEsrrtH5WpxJ?=
 =?us-ascii?Q?+575TJFrJkd5DwahTqvazu5v/98mCmPwHpRqEyJnu5l8IhmS27U9TI4WFBfp?=
 =?us-ascii?Q?Z2TAfFPwCNfwXv1OE20U++Tmxr4qbiASxsyd2X2QkBnhw6Wx1yviTgFNSN1e?=
 =?us-ascii?Q?N3+wMfKUNiYLJaPP0r9A88x0jUW8hQDKZ5xNyM07+NhzBMnagaeZT2+Ndbe3?=
 =?us-ascii?Q?BhsvVbVxFhFsgzZoWtpK84mZYKtYsAg6mbasMN1ZM7YGT3mGh3QcNFa+oVR2?=
 =?us-ascii?Q?LEDUOcvuC2HI2jsqin3ogqHm+zawi83MifI9/2wV1E45m6MZxuNdMIQk3KYo?=
 =?us-ascii?Q?8ybD8W6/L6Jsi8AEyCXrrZb/w2gDxvtg144DmVYS2WURWfwCpHyPwA9OHmF2?=
 =?us-ascii?Q?IQy8kdKRPOofYscbhdB0KeIYjEvqcl2617OQSjd1UydBc2BeimfRbJwRisTU?=
 =?us-ascii?Q?/nq8j/7I1A7QWky0VIgmsAcHeARuG0fypkUOjQuSA6HhtMvcrraZjsA4e2n3?=
 =?us-ascii?Q?cG6LBYLKMg+Kh+4Z2WHhazTCeLciQtArJE/2nUaKhCF03oG8xtYI0LrJS6Ft?=
 =?us-ascii?Q?MWWvQF4NTusL+hAyCS1uOBUP2H5yFkje0SuAFoD3gXae/LUN88RyVd8j12t5?=
 =?us-ascii?Q?5VDAilaG2cRYTsS0Cs5vvT0DT0bdFafXbHBD4N6KVbODv8coqzgKWGg/XBb5?=
 =?us-ascii?Q?uD4v2Pc9gz7uN9xtL6Sd5Kflw8vKSA39A7FSGuse5MQ8eEWE0D6exPZico8e?=
 =?us-ascii?Q?vTkDBS3bki0JbkGiKDuUAfFkpjyKfa2axsceGqe87Bt0+10GYmzBWxj/pWdb?=
 =?us-ascii?Q?gbusWxMwKmNY8YG7KTS3UHX/Q42hbqS2X52dxFC0zbMyEOGzEj0KH1gsGwqL?=
 =?us-ascii?Q?jfQVgfEL3vdwR6VsRJB+82Ld6Suu6UEeKlDS+RDwaFaJ4ZOGenzVeXfin8Lo?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faf5370d-6283-4ea7-8c1a-08dc8004e548
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 17:29:29.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZcjRaHHMYJ4c1l5YHZdgzM87x9XCKC/aAY8nxlKwlzpdIcr9dZCFpC4GcIhbarHwEV8IyPgUCw4ficLh+wavsYoYjzMvt4t7Mtcemb3PG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
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

On Tue, May 28, 2024 at 04:18:29PM GMT, Michal Wajdeczko wrote:
>
>
>On 21.05.2024 16:22, Michal Wajdeczko wrote:
>> Michal Wajdeczko (3):
>>   drm/xe: Store platform name in xe_device.info
>>   drm/xe: Drop undesired prefix from the platform name
>
>pushed all but this one as it needs extra split into topic branch

and now pushed this one.

thanks
Lucas De Marchi


>
>>   drm/xe: Use platform name in xe_assert()
>>
>>  drivers/gpu/drm/xe/xe_assert.h       |  4 ++--
>>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>  drivers/gpu/drm/xe/xe_pci.c          | 25 +++++++++++++------------
>>  3 files changed, 17 insertions(+), 14 deletions(-)
>>
