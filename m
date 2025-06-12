Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53990C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D98310E762;
	Thu, 12 Jun 2025 10:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV2wbG/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7F010E4B0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749722796; x=1781258796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Y4P5D/021SiCBjQI5XQM4qc5xAy9kb/72huLetRa/Y=;
 b=LV2wbG/hJSQ5NltCPPzSwINy7tIUcJbNdWmg+mOj9D8Ovz9XEUI/o7Bl
 toynHtSx9mHLjBJTeFBTdHsY6d6XzPbc7U46g1PmauHVZ2Ju5UCp8rNM+
 KeglctBG8DHui7MsNT0LVCPXzFB1PwRIt52IX7iMjPG39Y9S4bebJTqEX
 n6+w9iE3xsgZxLCzGd3hzYf0lFGkLpd/k0kOrn5yl9LAwLmtGI1DcDKG0
 6J+bDr3lUHY3lpKmyQk7bTLTcagDM9/Yy6GFEP7jhiUKNTAYGy3aVeKSS
 VkcjS4eZp8iTLOKpWSCSg7Mh5Lxopzto+sx9TYoCFBN7r24txKVWWSers A==;
X-CSE-ConnectionGUID: XPKZI7S+Rb6x+SRvldVffA==
X-CSE-MsgGUID: Bs794K2+QGqvw6vIL15daA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55695593"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="55695593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:06:31 -0700
X-CSE-ConnectionGUID: o+DSboIXSAGXNrV7cGg9DQ==
X-CSE-MsgGUID: zGk3nB7LQISjEPO13zablA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178446986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:06:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:06:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX8Do5Z48LMPHY/y8TVpkGCDhtE4VdmO75dzNUaCP7FBRYmiBn0Nmb7Pn6/cP1lS1pJtVZzV/pKo3nL5tAS5lPBGjJ8RxWqbwjyESza1Ij8JrrmoGIhpF/354jBrhXzOMEVlxMWkqg3wERm+4koL67E7xOPPSA4toVEbbMEJcDaDu5IPcr8qM8MaCscw93ST6uvCzZ0LYO9KxwJVOb+mOIbEx5qonCtwztyC7fXtXWwWCjppr6/gxXOlcmc4X2p5s35oprgrnumHC0vZtLiGg0eyYVHzCybcDjQq3zq2m3nhmJ3LEr7CY3F7Mi3SZxht0XusAqnntWkmE8XXJz9I+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duIBB9J6ZiAZOseD1M7kmzy1DbF9A/KB+N0/zh5Kta0=;
 b=rA+O+98+/Iw8+VxoQTcBi96+726aOlR3mhnAwEl3Cajy3qxPrslF+1etBRKMT1ZT4hnk8KDBW1ceXOlS9HDRpnCKn5y4cJU+fEHo73lqmMrmu92k3EW6NUAUTGNOvdfctaUR+F71zcIRJTvctumLrcmEqOPv33gogoTDd7+4b7m8svJ89IdRxoxUwni6MVilSQE8BCAMuU43HDVG2FGXIG0zp0ivv1zF7nYCXrxH0RAaJlJxddE5HRi5Tlt1jCGZE/Tx2OxJeD0ZMRmZyjVfUQ7cEyD6OI54alfq0g/l2IYpzMeaE3gzYfcZm2s1ihuTNozYye2FadynKnkR5Bjx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 10:06:22 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 10:06:22 +0000
Message-ID: <c7231452-78d3-4410-a309-f04d23d7b0f2@intel.com>
Date: Thu, 12 Jun 2025 15:36:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
References: <20250609061345.3084177-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250609061345.3084177-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 027076a4-7ba6-42df-00d0-08dda998c85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlR1Q0x1bkR1Z05HN2xMa3VxTXozN21HMlVubElDem5OMzhPUGNHN0pzV3JQ?=
 =?utf-8?B?TmJTcVVPVU0wMkk4Q1k3ZXJGdHJwSzdqTXU2R2h0a0JCQ25xWmIwS2wxNEJX?=
 =?utf-8?B?dThoRnE5azFlTkx0ZEl5YmRmL2RTbTBXSi8wTi92VWFJcVAwbG1vYVJEa2I5?=
 =?utf-8?B?VmhJZUQzWW9adHpZUHNKU0FjOUowTTVRWllXUWQ4UUZJdElrK1BaOUJNSWZW?=
 =?utf-8?B?ai9wUGs1eFJ4VDltTHRVaXZ6c3IzYUo2dmpuUU5ac2J4ZUtDUk9kM1lPL05q?=
 =?utf-8?B?UGlvYVJZcXRzYUN2WGZpTFphdjY5QWVYbFExVnJ2MTBaN1dqeSt1K0VIU1hk?=
 =?utf-8?B?N0ZhOEUrNWlSSzJSaVhQUW56eWloblpPMS9DSUtNeDVRQUpqR0xrZzZHamN5?=
 =?utf-8?B?aGRGT1BhdVI1S0xhRU5BUjVGTzhBQTAvc3JFVVllZkRvQ2dmM1k2MzJCNVJt?=
 =?utf-8?B?cGFsT0Roc0tBMlRmcWUzZEs3N0F2bCsvT01uZmlGZDRXektsU1Yyc0VuUEdq?=
 =?utf-8?B?QldmNWpDNHh1NFUrSzA5ZlQzb1JuUW5YRlFhWExvWjl0aWNYenhLNGJiejlS?=
 =?utf-8?B?N2dDQ0JXdDlsUFJoNjZOcE9ERldjWHpFMEV0WHhSVWNOOFR0c05pR3dzRURC?=
 =?utf-8?B?Rm50Rk1rNTY3N3BCZHVMdlVtMTVlcGhNUnhQck5YL21SeFJ3MDBzRkRYTFBn?=
 =?utf-8?B?SWlVSkNIcWlHd3d2N2ZxWGNCUm80a3ZoZ09MbHppYUF4MXNJTU9IajY4VUJP?=
 =?utf-8?B?SHN1S3JnNzFRV2ZNMm9oT1ZyaldUVStlMElPdWh4SkFVellZVnpJdUlmRGV5?=
 =?utf-8?B?QWtUbTljMnBCS05iMi8xK1hkcEMzTVY5NDVWbEwxUDh4WFYvcEtJWWVITEZm?=
 =?utf-8?B?QWNZbFlmUlBJajk0L2haeWNSYzJaOUpYNzJ0VEJ0dFNDSFhGekx3eDFUMGkw?=
 =?utf-8?B?azRyWWtna2pGKzRLUjdEZEVvTFlKaThKZldpTmIvbnJWQkQ4Z29zU09rT3dw?=
 =?utf-8?B?Ly9zYmhtY3krZmN6V3pMdGQrTlRHQUlxQUtIVVRWUHVKRDVQQUFsRW4vRGw0?=
 =?utf-8?B?RXlOYjMvYWhEVy9yZjdxTkgybGUyNVcvRm5BOHVkMytoa1A5RTVJQjFiclF1?=
 =?utf-8?B?YzBjU1I1Y0E0ampOTlJ1L2RGTWtnNjBwVnROU1VGZHU4SnB3aEdpYmJNM0tN?=
 =?utf-8?B?Q3VRNy9qa0tITkpNeWNoR29UdFV5b2VHaDVXNDlOZ0JhSHdFaGpWcmJhWjNj?=
 =?utf-8?B?UDRwa1NVTlhNUnA0OTU2cVFCcTVQTTloL0s0cldwc2RFQkRVOElGY2lvWG1Z?=
 =?utf-8?B?eTVaUWgwNHZ1QkJISTc3ZEFlUFk2K1M1Y1M0TlVLNkRRbHlQWGFmWVp6T0J2?=
 =?utf-8?B?NkpUbVBQVXNkL0pFQTBlVTgrSFdQMk03K3d3MmIvcjR4d2owdDQzOWt1aHQ4?=
 =?utf-8?B?dmVSVlpGakxUZWF2aTFlUHJLdUNHK2hBeGFDZ2JJSFYzVnM0MCtxSjVtN1dn?=
 =?utf-8?B?L0E4NFUzTmlVd002K09saU5xUStsYnlWR1YzYm5Icy9XNnE2RkFJTnViSTl4?=
 =?utf-8?B?MXNCSG82WXZTQ2JDdHlKZzlNRFdXYWN6WllURXZZNW9EY3hicENUU0w0Qy9l?=
 =?utf-8?B?VnBWWnY5UWdvOW5oYy9KWjNFVVU2WW9WVnpXb3hnTDFLYUNjMmNXRnpJRVB0?=
 =?utf-8?B?MS8ybFJvZmRONTBBek1PZUxYNkVpUXVIMzlwOVJ3VEtxRFE5ZVlObHlBM1ZJ?=
 =?utf-8?B?dU1OdzQ5dzRqTHZaWlloT3JJNUNLN0M1My9aby85djBhd0hETVdQREM3Nk9T?=
 =?utf-8?B?WFFEZGZCY09yN08zZnprVWQxQ3BhTDZpUEFvOTZtYmxxSmlPSm1maU0xbGk0?=
 =?utf-8?B?Wmp0VXdvMksyTVZvMGN3OVUwdG4rMFVVTXBMZmoxcnVtU1BNcHJ2SjQ1eW1y?=
 =?utf-8?Q?6s5yDeMUH84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUExV1JtNVd0L2hiV0VTd2hZYWFRdGVES3d3bEF3ZStMam5vZ2RXSGJDZS9T?=
 =?utf-8?B?SkxXVnFtbHg0aHVjL255VXZuWTYvWnBsb2VQMVRmVDVPYzd0K1cvdWFzazV3?=
 =?utf-8?B?cVMxRXgrUm9pZTA3L1JFS1NRRGQyK1R2SmxTZEZ0RGU5TEs0RlFBVE1CL1E2?=
 =?utf-8?B?d3hlZmFhZXA1SEYwN1RjREdXTUVxL2dMbHgxbWlPSk9lNXBBWUovTURVWWtw?=
 =?utf-8?B?ZVZlcEVXaEdtMHQwR2QyUERSdkppWWNRM0tnajZ3elhxdVpNT1poZmJFSzlP?=
 =?utf-8?B?Wkt3d0VWRWJaaisyczNpaUkvRjN5MS9kRXh4NFc1WVpab2Yva2hLcDBnS3dK?=
 =?utf-8?B?ZkgxcUVkZGFMQmFBK2svajZjVWZ1TUZJOWZZVU9HVWJvVzNuZmxDRzNSK2Vk?=
 =?utf-8?B?TEJNUkU1SU9Nd3NIR2hkSGh6MzlqVXYrMHZ5WUgzV1RkUnNwdnRaZUVpNG5i?=
 =?utf-8?B?SnZYNmZaeWtWSXBIRHhyZGhLZ0l6RDFQc1RFYUNtWFJUUDZRZGZwdlBQNmMw?=
 =?utf-8?B?MkFEWG13dFljYlMxSmtFVlBFZnZ0emtkY0s5TEtqbnZvaDBHYnQxcHNJaXFN?=
 =?utf-8?B?RXdVQmVwZlZ2Y1hJY21ORmxsN2N3RUZOZ2J5M2pndnNBWEl5OVcxZnNOeHZ3?=
 =?utf-8?B?Qi85MHJSVGRPQVlUVjlGSHQyQXR2VHVNOHdlTG9Vc1dFbzRBLzd2UFFJdHJK?=
 =?utf-8?B?OENHMlhudkhsZlRlbWZ4NWpJeDFsMUMxdzdjR1YzUnlXSHFNOHZpQkRUTUt3?=
 =?utf-8?B?bGllZUcrekhzWWtMSnUzQkRUbnVLeFc0anJ5TmdsS3NTNWRmN0lGaStVTGxp?=
 =?utf-8?B?TzRwUnRQM0RWdXdYTHV0WVptRlVuUndwV1JHbHVibTN6dGdTejFWWWRXOXpK?=
 =?utf-8?B?QllDN1BaY0o3b2lOMjJVWWlxWVF5dGJvZHR0VG1xaDVzWEFsRzZ3TjhCZVpB?=
 =?utf-8?B?ZHJDQXFVVVA2dVVjTjdSYXJUZ3Z6ejRxVnpjV0hrUEtKWk9CaytDZmVsc0xL?=
 =?utf-8?B?aU9xSWxxQXJmU1owdWN0cE9jQmRjNVJwbktvbURUaG5VVXIxV3JWdmd5Yk5W?=
 =?utf-8?B?L05zUVl4dW1McWY0VmJEUW85UURIdVp5a0o2ZFE3cDN6MHdjTGhvMmZEUTMz?=
 =?utf-8?B?ZCt4K2tPa1BnNnRVbzhUY1hGWjFxOUNIRUtYaHVwLy9XTkliOUJVMElTeXB4?=
 =?utf-8?B?aG1BOTBjTFhtZ3UwZUFXaWpMSkdFQllJY21iTjFwYU5JZVpIQlZYQ0JmZDZv?=
 =?utf-8?B?ODVDRDh5eGJWMW9pdUVVanBBZnBBZmM0NE1rZ2RmcG1tdHVxSi8wdDNlRmgx?=
 =?utf-8?B?Q1QrcmZjSm83aExOakYvQ2VEaXB3MW9jQndKSlRYMWUrTFd2dUE5bWdxOVhP?=
 =?utf-8?B?Q1FKWGFpcktUNVU0NVJuR3d2dnVoZ3hOSjlnYjdsbFUwb2YyeWtRWkFsbFRL?=
 =?utf-8?B?eUpqSlE3TCtSSkdNbXFYN0xNWVY5aDlyM1pKajZrbHU4S3lzZm5RVktsRzZF?=
 =?utf-8?B?OHdBeUZpYmJRNUxGZzNLQW9MQVBiczR0bk5NZlZYU0w0cXZiQUtYQXMzVVJN?=
 =?utf-8?B?NGt6RzlkbS9jZ2IxbC9uWFZrMWFERHZXZ3VMUTR0eTZFQXBzYjkvS1JiVVo5?=
 =?utf-8?B?WlpObEFtTDhhdVBTQmtUaXVZYkVBSENxVVk3dmZLa1pxZExpV2ZFZnUvWHJW?=
 =?utf-8?B?MEJzK0phUnlkcVlGeXI3dnhEOWVyN3hHb1d6WVphY29ITXg3Y09TbDdsblg0?=
 =?utf-8?B?RlFCcW41WThtRnUrRUxPRHBNL1hMU29xZGhDN0NxNXNiYXR2NVlhODV3THB6?=
 =?utf-8?B?NWxTU21MTm1CT2JLTjdrZU8rWld0d09vNE12WEhzUjBMY3RqNys5NFF5M0Ix?=
 =?utf-8?B?ZEh2cnVNSDc3bkY5ZUd6UG12MGxxZ3FYZlVuSy9GWlZ6TlpzcXp2U1EwY3BB?=
 =?utf-8?B?V1JQWWVXQnY3RVF6aHZudFFtd2tQTmZ1WnB5YnVOMHg3eDFsakVaQXRLRS9i?=
 =?utf-8?B?YXBENjVIN1BOUVc5c0l0TjNWRlI1RGN1ZU51TnRsMWVBTWYyNHoyUWlmRG43?=
 =?utf-8?B?N2daK3pRdEdDQUs2UlVWaFp2d0lrNlQzb05NZUJpMzFYSGtqUFhGSWpPOW85?=
 =?utf-8?Q?8uoV29pqZ9E/xGkXjChft5E/d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027076a4-7ba6-42df-00d0-08dda998c85f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:06:22.2816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErKqojQlgTMVjpHmU0AZ8Q+I7gqReJvmvIdHymK6UYGa+OarXWC9r82L1rwW+xXuHPFqcDEGyU/uzmcEAU1gtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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


On 09-06-2025 11:43, Karthik Poosa wrote:
> Prevent the power limit time interval from being overwritten with 0.
> This issue was due to a missing read and modify of current power limit,
> before setting a requested mailbox power limit, which is added in this
> patch.
>
> v2:
>   - Improve commit message. (Anshuman)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> ---
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 5394a1373a6b..ef2bf984723f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -40,6 +40,7 @@
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
>   #define   PWR_LIM_EN				REG_BIT(15)
> +#define   PWR_LIM				REG_GENMASK(15, 0)
>   #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
>   #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
>   #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0d32e977537c..abb5c3693437 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   
>   	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
> -	if (hwmon->xe->info.has_mbx_power_limits)
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
> +		reg_val = (max & ~PWR_LIM) | reg_val;
>   		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);

Like xe_mmio_rmw32 I will suggest to write 
xe_hwmon_pcode_rmw_power_limit() function to handle this.

Regards,
Badal

> -	else
> +	} else {
>   		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
>   					reg_val);
> +	}
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
