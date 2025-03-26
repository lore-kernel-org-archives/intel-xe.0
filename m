Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD1C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 15:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2610E700;
	Wed, 26 Mar 2025 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5pWV0FC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CD110E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743003267; x=1774539267;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xwuac3HNxifa+bUnoThDDEi1SP0V1oTWrs200aAsg64=;
 b=P5pWV0FCcA9I/rYOByuoUOd21J0yvx+Pu1j5D8FEOyb8qXxKONFiqpQc
 aV5pccffcJf7y7WgyWPosYFeGy6UeNx5rHZ4K3Jp47GzuIjcsTtaZG1hV
 caLp5UkFPG1tYJ4QJ/In3Ls7KqAj6iCh69cwyIH8OTeEeojbl9J+yM4Ar
 lsKHbyi9NCmi7lNeSHA01kJyXtjSLdAG8f8yZHXicdmnoPw2zjzOAHFKN
 4d4b3tA3livbhpMrKTehjkb1XhvNyT2rHXAnPDoMXhB9fkKHJpiwdDRPa
 GRYsjtoEmlg141nt31iwFBVRa8aqZFvU0Jd9REfGSWYjlgeSLevYB/V6C Q==;
X-CSE-ConnectionGUID: fvMwtaKhSh6Om02Ak7yGwg==
X-CSE-MsgGUID: kpaMNhT+TweDUstXAwMflQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44401025"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44401025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:34:26 -0700
X-CSE-ConnectionGUID: Z3SbuGglTSqFxQT1cgf7KQ==
X-CSE-MsgGUID: 1r1HqVfiSGWcOfwVDH9TLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125320183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:34:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 08:34:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 08:34:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 08:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnDtTyDRsd1sZ90NcPBGosMlBQsnkcGjWI75+W7KJBECdnPH7Tud/beutyPe+dzLpvvfOQug+oiwfKHmtZNOY8hUgky7HBG++1dnt/er9qcnNTb8izLYvzRVtkpYs+JURv0IT9JgHDNhYKgZSOg45KBBPeBTOre1667qVxj4z+0QPwWoddYat3PeKuZjc0YoPjxqkpoCg8HZuGZhAktZhLsJrClSHP7edla1UySqdaBxucuuVhkoFcOvopUNyGmwuknGnzUh+WFgE9XDswkMOf7G7ykgZvLosRQR3m7xjeik+xwAMj/ZaAJ4znVf4fYf/XKsS2cYBhDYR9+xa8xOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ/drlI4Vqp/RMzWHkotgCSmLBZbT+pG3F9wYL3ENa0=;
 b=hAw7Jx0aZSCw+laOVA/UBTGtyIEcqQOFp1P9/xL6LNnsqIOBJqSGUYkZ3UEAG/Ds4fOzatckmZ8tftH8arnZija7474U+isyvkvxn75BofvRrnK/mPYBy9NydE0I5mLfRyLf5Jn6OsVfWnwmWPaqXp/lBdnbfXB+32OHotbRuZNY5NR8E0VsoBO7ke3Ohjo7Ku7cmssbYT2VV8kNRd/8c44RzaBtSNZ/cProihanwNnf5AtO3VNOy5rSeLYVFlAYJ7xpf79k8kdB37vskwq+Pngirm3vG30kA+uU87Rltk3GOaEC/yEzc030Ltr20VI+8H6LGbHbPGqbIvxQtwsVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 15:34:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 15:34:22 +0000
Date: Wed, 26 Mar 2025 10:34:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
Message-ID: <dreu6pakyejkjxnrmbzozq4crd24i3nlwwv4ynrwo2mzbxxnys@blwouocidlyg>
References: <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
 <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
 <87frj0ivbh.wl-ashutosh.dixit@intel.com>
 <octnzulvdzokmojzeay2zywjaagity3sbsnry243ze3cwnbfx4@wxkgvlptg3el>
 <l7xh5er7uzfnkto2izx2j4ftvbzv5tutolqkms3dddo6tubpwv@j37n3pkkxudn>
 <87ecyjj0mb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ecyjj0mb.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a6c90c-f223-4788-86fc-08dd6c7bae83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y0cnEHdWEzuU56BALSmiPGoZAyNDwl7/xKhQDyh3oN2miWwIisb/XhDPRJ?=
 =?iso-8859-1?Q?JItoQzMMHWtYJO2So2Gp9PSA4bgGKmCEB2MFbwUevp+6fYq4fsu+XNtltB?=
 =?iso-8859-1?Q?v5sVchU7DAmTiifZd5+0iLlpihsuLC74wJa4DRRb5DMK0RY2nNzyP/LnR7?=
 =?iso-8859-1?Q?E1Q5r1nUgLPllN3XtpLkYzZf1M6QYHgMFD8uwJF+r89XA8O9bPdtGmD5mx?=
 =?iso-8859-1?Q?0X4doZognUkSFZxbGrQP/1C4g7AnjxQZyCEl436TSxt5BUEvUmxMAi+/u9?=
 =?iso-8859-1?Q?7jSjauy0kON97WbNU2JS/Hd2W+MXyhYJKGLBxeD/pcD+oPUHi7nEZobwN7?=
 =?iso-8859-1?Q?oQbfs9ca/tvptI4ms6+RSwDydo2DQnTA730akV30aD3eNnaCx4nrzG0XWH?=
 =?iso-8859-1?Q?dclAi/5JEJa9nCSLBTq8Ufq7DdU/UT0o2fehjyWuBreXRnvcs5aHvHgG23?=
 =?iso-8859-1?Q?V12/U3YMZl/kZQe/HumwUkpc4yJfHGMR0E+YyJGGg9q3TcfprMbEhjldc3?=
 =?iso-8859-1?Q?s2R+wPXjET9pqwfAmNxl+WlpwDMeJSWfbkVCfUEXMn9ApWNfGX0XWfK9Hj?=
 =?iso-8859-1?Q?XWHR/M3Y0XD35jV/S19pQy43awguRCN7AAF6xAZiVflGgOLYGAFO3mITO4?=
 =?iso-8859-1?Q?ZRO622B+Gld06mgF/yoxhTHDcpKOo/JpPdddxOrE1Hmb4l/Gzmi6xCJSI0?=
 =?iso-8859-1?Q?tuKIkri1OLPKASlnK1QM89GB5fGaRfnjaXtnMx1iD5hyg23NspfNWCCaZU?=
 =?iso-8859-1?Q?0GaTdbtsGPopGCo5n7qcGZzebkKVT/L9hLHNXTy/9JqlOb9mFaYdBvfz/Z?=
 =?iso-8859-1?Q?lxFht7w7W1CvSYQESx/U+H6essDzoRe3MFK+c2+U8YglnQnAxhEAh6WnCl?=
 =?iso-8859-1?Q?tko6YaULtpc/tQSFC8lwnPIAtyJD6YfP7w6U5ZURXCYYive0mWgA+V2zy8?=
 =?iso-8859-1?Q?qlrc4xypDb2yQQduNEgSPbvPgysqKs4ioif9iqETv8OdLvWqrvGUvYDHGH?=
 =?iso-8859-1?Q?wyHnc/Ao0vyVSCBlVvuQyOd9cTLp9/rCdHyhzfakwFCn5clOBuHE8EFfZD?=
 =?iso-8859-1?Q?pojPe7RpmWt703JdGdWk5MsRjn1O6NN72d+Eq8BoTDgU1XnRuaQ1Lvrez6?=
 =?iso-8859-1?Q?K5eLKX2SuaWSwGGIPHi8sXveHT8sOJ4ZjZD+EF4KmZnnpYsrBO4YbS36W5?=
 =?iso-8859-1?Q?WC9DJyqc4bGDN9NeSS3N1b2NRMGkzQSu8Qmk+4la1mhsFakzD1AsyF9tFX?=
 =?iso-8859-1?Q?/vr6vzTMMl7a3lV5JF0ouAMLojDH48KUzWVJ+A3TErrmUvi14RLgH/pvXh?=
 =?iso-8859-1?Q?DSqZCxm8gCuiuktvIYqRzm+r4Te0nx7Ag1Il9IefQPUvmD0nN+rAZPnE04?=
 =?iso-8859-1?Q?1jwKHyBYGtZaWVIcrO+Ki492Y9R0MKM+WFAda7oTQYTbftlzBVvSCcMR9B?=
 =?iso-8859-1?Q?VHIn1+gydrtUToRULmGmOzSy8sS9aTb1dyqg6nb50mawbQLOITm87wIapb?=
 =?iso-8859-1?Q?tZWkySDu07lhRSnDxMl6bF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3oMOPzpNSKRP7lR69bv3+cHTNHNuFcBUZRV3MwTexmg3H/tfolv4uj9K9p?=
 =?iso-8859-1?Q?09MtSSFCFDOkryxv+6RU9UD03SGTQyifGZpUhvlwPZHbqSxZaFpGwYMZ7y?=
 =?iso-8859-1?Q?urCF1XGUho6UhHmlLZDAtT/pdIh/0kaLOubY+9o7ChU3177VA1TFP4gCvU?=
 =?iso-8859-1?Q?RfmBvGqyI2b75CYd+cmIjvy6Avr6Ax6UEM7qfQNRlGK0OiWV+bc71GGs5o?=
 =?iso-8859-1?Q?ilaU0n/0MoQGDgk916CdKvS/qPR7QSorxWQuX58+ew0wIsLfwWjM3BfMHj?=
 =?iso-8859-1?Q?l4C8+x6kIyIjz/Xea+KNW5sRZ03eBxwVKP0l2DcAGkGdcLIBeWUk9TxMo0?=
 =?iso-8859-1?Q?0yxDeeEEPsfL22rYmgSPM764ciUSRb7+uvq4LAqBbSu306ArIu3734+x3z?=
 =?iso-8859-1?Q?HxuYinHcB1US1fFZicnJYZz7uj+SFgmjB8R5ApJ3yqmPNtJ7izyZI3mf2C?=
 =?iso-8859-1?Q?930VxoA/jISNlbWv4kUK+7QJdoCzq9OCgctKv7u4Y+/xdFx0Ctvg851WDX?=
 =?iso-8859-1?Q?5S91r45WSgIhXCKwBLtAoRrz0FAyXimnkvN2ED39lmpsk9hDTWxKjcudAU?=
 =?iso-8859-1?Q?zsnYLBkTj2g9ZAOOUnxzOQ8xaKMlsUosCaILx6oPmHDr1xoS/ywgvkVd7Y?=
 =?iso-8859-1?Q?QC1ya9dfzjtC3VsSNDio4MjYLksFqlFA5MIYBhQTeenpLp0S1PSiah+jnk?=
 =?iso-8859-1?Q?24zkru9zWkn07NOWbx0lB+gzvddx7TG+nksHPXxeFa8YiIFcOWWvdKrv1a?=
 =?iso-8859-1?Q?Aae998f6AvLtE6cJ5CJa+B+e3wg3WZ2OK4ru/ciy/YqC4IaQTjAlTZ++4R?=
 =?iso-8859-1?Q?jgzickpjuF7x2h4uAOWorEHBkUBCsr8PZ3O975YB3w2r/V0JkfTPWfkQcl?=
 =?iso-8859-1?Q?VED2EEboyaykDFSylvb3I7/VeAxYmJlZ2NDZ9Pli0eBgvHlUDDqv2DLq60?=
 =?iso-8859-1?Q?PWJo8d5NrYI9AdvbH1ZAr1wGwQclrrSqxoAR0gPQnpy0zrpGTI/JwaSWkX?=
 =?iso-8859-1?Q?ep5D9C6itbpkF23rVObVSIT+OMRmzj3MQmF+E+mc2ucsHKZ/HnLzbawFPF?=
 =?iso-8859-1?Q?63zUoa6j3dsiqEbFyH9J24dj87KGdfC0WLZOhGqQVd/VkU8rSIXPpxZzfe?=
 =?iso-8859-1?Q?cfwV8oGUysXRmP+v6tr5+GMiDh5HqMJwbIRsH0PCfh4W5RO0wOlBxgKq5N?=
 =?iso-8859-1?Q?V40Rw7yZIQ6GOR0hClg6ZfukA496/QMxmbFetvRtvY6Y6tW1RmVSg6wPHs?=
 =?iso-8859-1?Q?PaB39vufyWEnUd5jEhEHR/7M9AqTL93uGlB8NCcLrD8JrgW1IgMtLvVB7q?=
 =?iso-8859-1?Q?yy2HW5epsnT151Kb7sGg0heL3D3yX+/3ZRdyj0Y65YzN3RftRKfaghmC0n?=
 =?iso-8859-1?Q?RmEXKHpWLfLDp6d4nyxmZ2K6Qxd9bIN1fB7BkHFu1aGnlzcAOmcn6CipS2?=
 =?iso-8859-1?Q?oCwo3hItduwEv/uyc88n4K+KkH/ClBk3UBmSsbVNA168nfqE7HljIoSrHE?=
 =?iso-8859-1?Q?k+jNgEq7CjzGcXRrtamDkxd0S3UqqRUcw7P/p2B9yHPSgzHtEUJBmtkXAJ?=
 =?iso-8859-1?Q?MGQbj/Ct1OGd0ERHQybQCREqbUlNnSFK1DIDhhul3+iIrailqi15MbklgC?=
 =?iso-8859-1?Q?Nd3F3rBxf58MFZciCpsTdeyQZfcxh5WuAfZtTdQ1sBSTWa7/+VDMBV9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6c90c-f223-4788-86fc-08dd6c7bae83
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:34:22.3366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGUfOt6uLJ9lCn8pv/oez8f+RsAPtbefU1fXojicdMbyDriiO8G1w/P5I0SANR2NI8FUzQOSWU+ljwdI9aTpwxCAVISfUKZOhgAzVWnk1DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

On Wed, Mar 26, 2025 at 08:02:52AM -0700, Ashutosh Dixit wrote:
>On Tue, 25 Mar 2025 21:14:53 -0700, Lucas De Marchi wrote:
>>
>> On Tue, Mar 25, 2025 at 11:09:55PM -0500, Lucas De Marchi wrote:
>> > On Tue, Mar 25, 2025 at 03:45:06PM -0700, Ashutosh Dixit wrote:
>> >> On Tue, 25 Mar 2025 15:01:47 -0700, Belgaumkar, Vinay wrote:
>> >>>
>> >>>
>> >>> On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
>> >>>> On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>> >>>>> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>> >>>>>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>> >>>>>> Hi Vinay,
>> >>>>>>
>> >>>>>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>> >>>>>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>> >>>>>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>> >>>>>>>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>> >>>>>>>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>> >>>>>>>>>		return read_engine_events(gt, event);
>> >>>>>>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> >>>>>>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> >>>>>>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> >>>>>>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>> >>>>>>>> This is unconditionally taking the forcewake and waking the card up just to
>> >>>>>>>> get the sample. Do we really want to do that?
>> >>>>>>>>
>> >>>>>>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>> >>>>>>>> is in C6.
>> >>>>>>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>> >>>>>>>
>> >>>>>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>> >>>>>>>
>> >>>>>>> HW will report 0 when GT is in C6.
>> >>>>>> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
>> >>>>>> to requested freq.
>> >>>>>>
>> >>>>>>> The requested freq register is a
>> >>>>>>> shadowed register (0xa008), so that will not accrue fwake either.
>> >>>>>>>
>> >>>>>>> static const struct i915_range mtl_shadowed_regs[] = {
>> >>>>>>>           { .start =   0x2030, .end =   0x2030 },
>> >>>>>>>           { .start =   0x2510, .end =   0x2550 },
>> >>>>>>>           { .start =   0xA008, .end =   0xA00C },
>> >>>>>> So this still doesn't make sense because:
>> >>>>>>
>> >>>>>>     1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>> >>>>>>     2. And that is in accord with the following comment in i915/intel_uncore.c
>> >>>>>>
>> >>>>>>        * Shadowing only applies to writes; forcewake
>> >>>>>>        * must still be acquired when reading from registers in these ranges.
>> >>>>>>
>> >>>>>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>> >>>>>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
>> >>>>>> need to do use the equivalent in xe.
>> >>>>> Hi Ashutosh,
>> >>>>>
>> >>>>>    As part of a previous decision, in the Xe PMU implementation, we are
>> >>>>> doing a runtime_get() during pmu_init for all PMU sessions. So, device is
>> >>>>> going to be awake anyways. In this case, it does not make sense to just
>> >>>>> read the register without a fwake.
>> >>>>
>> >>>> Even if that is ok... Let us take a completely idle device. What should the
>> >>>> actual and requested freq's be for this case? Both should be zero, correct?
>> >>>> Now, what are we going to show if we are taking fwake? At least the
>> >>>> requested freq will be non-zero? Is that ok? Or the requested freq will
>> >>>> show zero even if we take fwake? Thanks.
>> >>>
>> >>> If we take fwake before reading, requested frequency will not be zero even
>> >>> if GT is idle. HW always retains the last requested frequency in that
>> >>> register, never zeroes it like it does for actual_freq. So, showing the
>> >>> non-zero value is the correct thing to do instead of artifically zeroing
>> >>> it.
>> >>
>> >> So now, this I disagree with. For an idle device, hopefully in C6, there
>> >> should be no reason to request a non-zero freq. So the requested freq
>> >> should show 0. As i915 does (using gt parked and unparked states and using
>> >> with_intel_runtime_pm_if_in_use()).
>> >
>> > wrt locking and interaction with runtime_pm and forcewake, the perf
>> > implementation in i915 is completely broken. You can't take a runtime_pm
>> > or forcewake when you are in an atomic context. And when you have a
>> > raw_spin_lock taken like is the case with perf, you can't even look at
>> > it (if it involves taking a spin_lock, which it does).
>> >
>> > perf is holding a raw_spin_lock at that time. The only reason why the
>> > CI isn't on fire over there is because we are papering it over with this
>> > commit in topic/core-for-CI:
>> >
>> > dc17a830ffb5 ("Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."")
>> >
>> >>
>> >> If we are already "doing a runtime_get() during pmu_init" (as mentioned
>> >> above) we need to devise some other way of making this happen (maybe by
>> >> looking at xe_force_wake_domain ref field?).
>> >
>> > you can't do that safely.
>>
>> which reminds me... Vinay can you test this patch directly on
>> drm-xe-next? By code inspection it seems we are doing:
>>
>> __xe_pmu_event_read()
>>   xe_guc_pc_get_cur_freq()
>>     xe_force_wake_get()
>>       spin_lock_irqsave(&fw->lock, flags);
>>
>> and that spin_lock can't be called at this point.
>
>Hi Lucas, sorry, didn't follow why the spin_lock can't be taken at this
>point? Because we should be able to take a spin_lock in an atomic

you can, unless you have a raw_spin_lock taken.  With PREEMPT_RT
spinlocks can sleep, raw_spinlocks can´t.
See https://docs.kernel.org/locking/locktypes.html#spinning-locks,
https://docs.kernel.org/locking/locktypes.html#raw-spinlock-t-and-spinlock-t

The read call from the perf side is coming with a raw_spin_lock taken,
has always been and will not change. See
https://lore.kernel.org/intel-gfx/20241212093123.GV21636@noisy.programming.kicks-ass.net/

>context. The actual waiting for the domain to wake up also seems to be
>atomic friendly. Thanks.

are we talking i915 or xe here?

For xe, I'd say it's a hack-friendly way. Waiting up to 50msec like that
is not a design I like and we only get away with that because we don't
really wait that long unless the device is faulty.

For i915, it pretty much isn't as the intel_ref_tracker implementation
tries to allocate memory.

I've been going back and forth on the i915 side on how to fix it, but
there are multiple changes needed and AFAICS we will need to balance
some locks moving to raw_spin_lock and some other things moved around.

Lucas De Marchi

>
>>
>> >>
>> >> Let us wait for a second opinion on this. Thanks.
