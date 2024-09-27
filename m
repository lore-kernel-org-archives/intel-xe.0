Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35164CF648B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 23:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFEB10ED43;
	Fri, 27 Sep 2024 23:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k66X8X1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384CA10ED43
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727480273; x=1759016273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zKgtA+nRxSUxfqQV6RpRj9z2JAUgnPk4Wy7Hi2okgR8=;
 b=k66X8X1YcXbLlwsu3fr0TQYr+Q7Zwf2yAzL0XAE+jhpnruTSZM/auR9J
 YGPHsldznyXEdQGCeP6wiSdsqzlzTxqIClKKLr9lQsIguTSiX5gDUKNmb
 RZ71tEDo9SsC7rBHjzawlfyrHIiHZkh/haaFvMYFtwMo74iqThtt5rhpW
 aP7PDDc4SAP+3N5DpSA0K1l6bVhBpf1XA2xMOmIwKzIuNI1bMKZ7CgUjt
 nOsENQwi9ScYgxNLYqePVIogILrAWWcIHiouUJs/N543OMVRIp9QXPAna
 AJssiiuawfuQO/AbKnCpEoyM5m3KBIR1yH103SNxPlzPb+xdECz5iLeeN g==;
X-CSE-ConnectionGUID: f+Y2dbbcRF22Ju3xUhY4hA==
X-CSE-MsgGUID: wFRWghiqQ5CoGoaXKc+rBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26151084"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="26151084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 16:37:52 -0700
X-CSE-ConnectionGUID: uVNJSwxgRSawNRAmXIy4Rg==
X-CSE-MsgGUID: hm4G5CfdSe+qo901/LvPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="72361609"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 16:37:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 16:37:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 16:37:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 16:37:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 16:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NK5QyLmRZLoufeHL4JVgFTmF7DDxtcEepWcDBYZh/NtyJmwsHcRQsedjn0TgKabGd5dRwbByjlU+8mHQIxBG3PwcQTlUWEXIPXLdAZhYQWhi3lChGgQbl/3o2LQtxpYO9eNcvjYhU0zRwj1z+l9HdvDgsE0vZ+XtFzLxxLsQ9X8QlLyshcwjOhSki7pv3Vwq+61VOSykR4Bz4LtRCbVF/iAkXR/HihnKLtncy7bWqThPSOM1cjjFSWJJwQHwR83U+ASsvUIoF74Pij2FQxgUdxbuMKBsxBoyFrI4/MDyFnHP0jrWdFU843TzZQ8M3H0qldEH5AyfYV/5FAFlfTBZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKgtA+nRxSUxfqQV6RpRj9z2JAUgnPk4Wy7Hi2okgR8=;
 b=Hs71C8tnvrbM7lSZ21fAMKfMVKt1l82CNtl+mfHGC0Nx7bMFGbtkzkOlMbd8fsndu+ltnJNO9Izx4GMnypHQ1e9b0B1x+FrtdzUvvovFjLaksvzX3W8TV7VVXJEpSf1OXjzV9dNhEzV0Ln+ObDve45tnIoaKzVU9rlAVa1LOVEq+M9m63wVLdusDQTBDFjb6PDp/Dc1eEWiuS25J6af5VK+A8AsrY1iOYwBomEh25B5lmluljhz46NmCuD5Zg0yM68pneGYbQMZO3mmHjul+N7+V+WI8W5Wshtkc4kwaUXmwhruWjelSwT+dsWj65WxNv7B1nrUnKSib+yyiRxhrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 23:37:42 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%3]) with mapi id 15.20.7962.022; Fri, 27 Sep 2024
 23:37:42 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/xe: fix memory leaks on vm_bind_ioctl failure
 paths
Thread-Topic: [RFC PATCH] drm/xe: fix memory leaks on vm_bind_ioctl failure
 paths
Thread-Index: AQHbEHVe/SvG2YGh9kOPABe3/WDMELJsRSoAgAAGZgA=
Date: Fri, 27 Sep 2024 23:37:42 +0000
Message-ID: <5f90f9224ec9ea643684b7d77d12b4ef53b456ce.camel@intel.com>
References: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
 <Zvc8ZgwMqe/4PGV2@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zvc8ZgwMqe/4PGV2@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|DS0PR11MB8666:EE_
x-ms-office365-filtering-correlation-id: 43507ac1-6149-47b2-bf6e-08dcdf4d61ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MDZ6Q3lveTVWbUVxMEhYVW5taml6MG44eFYzbnZzV1hiYTZRTFQyZ3ViRlYr?=
 =?utf-8?B?ZVVKL2ZlZ29hanI2K2tFdWU2Sk1vYTRqSnNsTkU1VEFlWFMyREFGMldSUWZK?=
 =?utf-8?B?MFVsRmI4RVVPSi9wVG1SWDI0aDhyeXRCL0ZpZkZPQ0xOTU5HMjRhVFMvOXdS?=
 =?utf-8?B?WU5BZkd3allSSEVqd2lmV0tjSHo4d01qOXNkNWRpcSt5UjU4d0d3NndVWEpM?=
 =?utf-8?B?L0dOazhzNnUzeWZINDljMHBXN0Y2MUlJc2daa0ZRa2psVzkxbUNwVjZ2bU1X?=
 =?utf-8?B?ajl1KytvZWNtY2dkb2hKcEpRWm1mN29CZDBFczVJbDA0b3ZybWhDNFRMbTZp?=
 =?utf-8?B?TUVGcDdzRHZLRTlOVHlzQ21MTjMrSXZXZ3ZWNFlqTWxFZGgxSEpxOWJpcWNz?=
 =?utf-8?B?eTJmVkRHRFExWm9uTXd1eEd6SmlzSUNrdS9vdklBeW5tZ00yVWNpUnlVb2Vi?=
 =?utf-8?B?Vms3amlLVGFVQUpxSDFhWkFpQTVpV1FhcnlvUjFvOUplSDY3RlJkZU5UbThj?=
 =?utf-8?B?ek9JZjd5OWxKdU5EeUhEajArMXhZZjFYc1NiWTVPWitwRjZHSllOUlZSaTRi?=
 =?utf-8?B?QnBRbElWV2lvWjJtNnptbVBrc01ldUo0TUpGbCs4aWVvL0JBRG9haTdsd3Nh?=
 =?utf-8?B?Q3VuT1V4UFZwUmZIeitNNmlnVDc2TnVteW5nMGpFNlNheGw4OE9VMGN5OCtO?=
 =?utf-8?B?Zyt6NFYvS0FFMVYxdjB4Y2t2bFY1U3RNOFcrdDdBM21KYU8xRVY5R0I4bmY5?=
 =?utf-8?B?aitGVGkzWmZnSEdibi9aMGR4RDh4UFdyNmw3VUtqbitJcmV5Z0N6TUNIVjBU?=
 =?utf-8?B?QVhucEhSMEpudE01NndHMTB1UFh6OFMzTFNtQkRiNkR5UDA1Wm42NEtjU3hs?=
 =?utf-8?B?dDZhcVJZaTdwbkdsNXlkMVUwUFVhSWUvUlNMME1KZGJDM3EvcytsWDVhaHpG?=
 =?utf-8?B?RGxsLzQrYTZEQkpCNUZHY1UrRnNCZTlkWmVkRXVyOXltcFdxRmRyTjFhNEht?=
 =?utf-8?B?bXpPamtpMWZYeEtkZVNIWGQzcVpoNkxJQnRLUDVyOHVsYWhwcnJBaFVOTkRu?=
 =?utf-8?B?enNrczJ2enlERnYxN3dHUGtrUEFVUjBnLzg1UlUwWEV6TFI2NjMzNE4yVDVa?=
 =?utf-8?B?STJsbUN6UWF2dFdWZXJUbjFuUDdZOXpnZXpNb1VwQmxVd3RHaWIxeVJESXVl?=
 =?utf-8?B?N2NKR2daSjFJUk9RS3JCekx3TDV2cUtlTzNOc2UyYU9QRHdKaDFqYktnUG5W?=
 =?utf-8?B?MmN1N3lKeVZXQi8zTVVGRm9SZ3U3M1lkOXRWSHY1NjJMdUJvWC95OXppUjBk?=
 =?utf-8?B?bTZKL0N3eGI2UGQrY1dvUXlmb1hyLzlsckxhMTFEMTRibmZQVzFTbUt5SkU4?=
 =?utf-8?B?bDFOekMxRm9ZcXRINFFOUCsrbHQyZ2Q0UWVEcnc1Z0Q2cGlNQldRdU1GM0pV?=
 =?utf-8?B?YWhrSW01MGVIZDJtMjB4QktUOGNaMFBJRm51elJSRnQzTUFyTDVqeld0bGNS?=
 =?utf-8?B?TUxtMUlkcGw5Vy9rTnVQN3RpOHZWSkVxNjdBZEdKR1hjZm0zdXdpZkJGaVJV?=
 =?utf-8?B?Zy9DVHBjUlBNQloxUzVkdnQzSTlDWjJNTUlpbDI2aFpGQXVnQUw2RFYrVzZ6?=
 =?utf-8?B?R0FDVUxOaHNzdTVnREI4eWwvbk9hcENMdE94eE1jeVhiaTEyeW9TQWV1YWZI?=
 =?utf-8?B?TENFL2tTZDRSajZvTkF4Vm1uWjkxRVkyajcxeXZoaWx6U25YNE8rQVVjbVo0?=
 =?utf-8?B?WW5NdGhURHhQcndvcW52Wm9YWXlaQ2lYVGpKNDJEVDE0WFhleHV0Sm96czA2?=
 =?utf-8?B?dWdVQ0NKdWphZkh0Q3Mxdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M091cjhVWGN1dDdMZWgwQjQ4UjJlSUlzUkY0QUUvWWgyYjZYVTk0WTlIZHZM?=
 =?utf-8?B?M0NkTTREL2RQYisxaFJXNkg3bzBsT1YremlnaFYvem0rV3hEQllHODRRdUlE?=
 =?utf-8?B?dHR3dUIxUE5Cc2JQLzQvQ0c1aUE2djZFQzhXdEJZaU5McXF3aDQ3aE5WWWYw?=
 =?utf-8?B?UWRxK21aU1grL2p2SlF1STl5VHVPcWNQRytINW5ydkNUUnlXa2JHKy93dC80?=
 =?utf-8?B?ZzJkWUhVTmh5RjRjejgwSEI5LzZqTytaZlBPbkQ4bXZOUDVXUDJpQ1BjREEx?=
 =?utf-8?B?bDFuSHp0QUNnaE5LUEJLVEJYZnhLSkVFdGNyZHBxakZkZzNPWHppN2VZZ1lE?=
 =?utf-8?B?MCtoU29GbDRzemx4SVJoZzhYM0RiaEVCbUVFZUZRRTZGVlpaWkFkV25POUpa?=
 =?utf-8?B?R01VSC9mc0lCeEtFK0ZaVkhQMmQybkJHYnV0OFZCV21lMUJMSU9zT1NneE9F?=
 =?utf-8?B?aVlhNm1XL0xuYW1IL0FTUng4K0FqV2FmN3RWVFp3Y2FSMTBJNDliTXM3ZkFU?=
 =?utf-8?B?R2xLRmcwVUJSV0xUTW1IUFlRcGI4SjVHMFVuZEpqUjFFSTh6TFl6N0c4akVR?=
 =?utf-8?B?SEd2OEx1dUduRloxZ2N3bUJIdVJwbTN1RHZsVzRBNHBlSTlpSm1nSyt6MWlM?=
 =?utf-8?B?anRPK0tiMnJ1dmlDVWM1OG81OGxlWG9TYjVxVVk1K2lzTlhtMXRNTTFEZk5W?=
 =?utf-8?B?UUdCaDN1UHdiRXI0eWJ3YVlFZVBYR1R1L0NrOHd3aE1ZTFBWY29ZdmlLWG5H?=
 =?utf-8?B?RVJjdDlHbzM2RmlyTmZqUEsvbFNNTU10K0hjaGZ1UnZSVWVjSUpuc3RhYngv?=
 =?utf-8?B?M0hZV1IwTWJSckpFMHFZaHpnRTZqclBUcFFyQU8vckNZcmd2SDZCckoxMWdx?=
 =?utf-8?B?ZEtHWk9pYlZFSWp3NU5zUzdYTnBYVFlibW1zcHJRQnFUcVBFNWN3NEJZaWE5?=
 =?utf-8?B?TkRjWHh0U3lqcXBEeElvZExWaHhWUTQxSExpK1lzMGYwVkN2anlqa2FmWXlO?=
 =?utf-8?B?TG1wWmg0alJuWFZ3MExINER1SDlST0JUUitPdjJuZzI0Z0FhaG9ReXAxRUFF?=
 =?utf-8?B?S3NGS2J4QWZRRDl2QjJjT2h0Y2M5WHI4RW9RdUVMcW9VZ2E5WDEzbllxQlpK?=
 =?utf-8?B?dC84ZlJFZmhJb1h5MDFOelZuZHVCdWlqajZkYkE5WERtZU5xQ1V3L1YyVGxn?=
 =?utf-8?B?WkpRT0VGVXZha0RhWVlKRTV4aGJiTHdXR0NvVWgyWGNXNFNRVWtDbmVTRTh6?=
 =?utf-8?B?SnMzK3MrMHZoMzE5Q2RQUEZVY2tndFROYUFDc25FWFBRYUdRZnRaU0ZXRUZV?=
 =?utf-8?B?SzZKQjBjUFJ6VytqcEZtZ1R2NUEyOFVHZXVmTzI4elVKWlhUaFBIY0t5VytZ?=
 =?utf-8?B?bzZZSmI3aGd1ZzBkU05PWERTTGIxbUp1SjNhTC9vZWlWVjd0WXRIbW5reVU5?=
 =?utf-8?B?TUdnNnJWS2lsK09LbnhBQXJ0T2oraUlqRVFZeG9rSk1jSDY1ZWQyZEhHaXlx?=
 =?utf-8?B?WEhmb0xub0JPc3c3SUpPS2kwUDN0dVM1QmNaL1hNd2xiWDZRMGpHZzNVVHg4?=
 =?utf-8?B?ZVV0NmF5VzRVZVRYZnhPdGhaMzVwQ3JuOUJZZFZFdW1vU29mQllFaEJzK0I0?=
 =?utf-8?B?aWdKamw2Um1UMjFtWGtOWUVaKy9nY1o4QXcxMW04cmgyUkxmQUpnVVZWbkZE?=
 =?utf-8?B?ME5WTmhBSXB0SU1aWDBKN2xGVkcwSWJDUmF0YjRQZ1RtUHJXam0rZzZJcm4y?=
 =?utf-8?B?dW5qdkdjTHY1dUtiMXhteFJZbldSTEVpUllCMVFBdGs0TE5zUGVPVlYzanlt?=
 =?utf-8?B?S1dvYjhYeml0MnQrWXlkUkFXT2hyTldNei9ES2ZFZUFYSE9qbFpwa2pyd0VD?=
 =?utf-8?B?RDlqcUg5Q0dDL3NaU0s3cnZZaWdNc0dHYVFUbmcydnFSeGMxWG9pRFVaMmhi?=
 =?utf-8?B?WVhza0Z3aFo1VVdEOU1JNFNQT1BPUHNBOEQ1ZElVVk8zaFdWTUpUQnpyMTBv?=
 =?utf-8?B?aGRUMDFEcldmQnF2cEZhbk9LYStFSWlsRURYNnFkdEMxcHdHZ1pvL0x1dENH?=
 =?utf-8?B?ZklHeUhza2VXNDdxNjh2QkV5L1lid3JySk5QdmNTVEhMeFRBTVhHYko4ZXNw?=
 =?utf-8?B?VFdVMUpkQlUrYzkwZWhDN3l5eHRaNEZWZml1bjgzV2UxaldMVmFpSk1UY2xI?=
 =?utf-8?B?eUdLOWtMdVpxelVRZURhSmt2VGE1RjhUdThDTFppdkppWTczRC9PZVI5NVRx?=
 =?utf-8?B?ZUd6Y0dsSzlMZkxHaWM3QTNwNE53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87AAB2C3F7D42142BCF65441C977EBB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43507ac1-6149-47b2-bf6e-08dcdf4d61ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 23:37:42.3839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94VPwUxhod2MIh5VH89xA7PGkmSTgKd86De1D0SfVRRaO0Ok1ylp3D4Ya7+GYfHslMc8KKRynxpRMJ3ick+mUWvkiy2K9C9ZRJNS+1L1QCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
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

T24gRnJpLCAyMDI0LTA5LTI3IGF0IDIzOjE0ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIFNlcCAyNiwgMjAyNCBhdCAwNTozNjozM1BNIC0wNzAwLCBQYXVsbyBaYW5vbmkg
d3JvdGU6DQo+ID4gQ2F1Z2h0IGJ5IGttZW1sZWFrIHdoZW4gcnVubmluZyBWdWxrYW4gQ1RTIHRl
c3RzIG9uIExOTC4gVGhlIGxlYWsNCj4gPiBzZWVtcyB0byBoYXBwZW4gb25seSB3aGVuIHRoZXJl
J3Mgc29tZSBraW5kIG9mIGZhaWx1cmUgaGFwcGVuaW5nLCBsaWtlDQo+ID4gdGhlIGxhY2sgb2Yg
bWVtb3J5LiBFeGFtcGxlIG91dHB1dDoNCj4gPiANCj4gDQo+IFNvIEkgdGhpbmsgdGhpcyBwYXRj
aCBpcyBjb3JyZWN0IHRoYXQgaXQgd2lsbCBhIG1lbW9yeSBsZWFrLiBJJ20gZ29pbmcNCj4gdG8g
Zml4IGl0IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHdheSB0aG91Z2guIEl0IHdvdWxkIGJlIGdyZWF0
IGlmIHlvdQ0KPiBjb3VsZCB0ZXN0cyB0aGlzIG91dC4NCg0KSSdsbCBzZWUgaWYgSSBjYW4gdGVz
dCBpdCBNb25kYXkuIFRoYW5rcyENCg0KPiANCj4gSSBkb3VidCB0aGlzIHdvdWxkIGNhdXNlIGFu
eSBtYWpvciBwcm9ibGVtcyB0aG91Z2ggYXMganVzdCBsZWFrIGEgZmV3DQo+IHBhZ2VzIGhlcmUg
YW5kIHRoZXJlLg0KPiANCj4gPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjkxMjBiZGY2MjAw
MCAoc2l6ZSA4MTkyKToNCj4gPiAgIGNvbW0gImRlcXAtdmsiLCBwaWQgMTE1MDA4LCBqaWZmaWVz
IDQzMTAyOTU3MjgNCj4gPiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6DQo+ID4gICAgIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDFiIDA1IGY5IDI4IDAxIDAwIDAwIDQwICAuLi4uLi4uLi4u
LiguLi5ADQo+ID4gICAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDFiIDE1IGY5IDI4IDAxIDAw
IDAwIDQwICAuLi4uLi4uLi4uLiguLi5ADQo+ID4gICBiYWNrdHJhY2UgKGNyYyA3YTU2YmU3OSk6
DQo+ID4gICAgIFs8ZmZmZmZmZmY4NmRkODFmMD5dIF9fa21hbGxvY19jYWNoZV9ub3Byb2YrMHgz
MTAvMHgzZDANCj4gPiAgICAgWzxmZmZmZmZmZmMwOGU4MjExPl0geGVfcHRfbmV3X3NoYXJlZC5j
b25zdHByb3AuMCsweDgxLzB4YjAgW3hlXQ0KPiA+ICAgICBbPGZmZmZmZmZmYzA4ZTgzMDk+XSB4
ZV9wdF9pbnNlcnRfZW50cnkrMHhiOS8weDE0MCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhl
YWI2ZD5dIHhlX3B0X3N0YWdlX2JpbmRfZW50cnkrMHgxMmQvMHg1YjAgW3hlXQ0KPiA+ICAgICBb
PGZmZmZmZmZmYzA4ZWNiY2E+XSB4ZV9wdF93YWxrX3JhbmdlKzB4ZWEvMHgyODAgW3hlXQ0KPiA+
ICAgICBbPGZmZmZmZmZmYzA4ZWNjZWE+XSB4ZV9wdF93YWxrX3JhbmdlKzB4MjBhLzB4MjgwIFt4
ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOGVjY2VhPl0geGVfcHRfd2Fsa19yYW5nZSsweDIwYS8w
eDI4MCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhlY2NlYT5dIHhlX3B0X3dhbGtfcmFuZ2Ur
MHgyMGEvMHgyODAgW3hlXQ0KPiA+ICAgICBbPGZmZmZmZmZmYzA4ZWNjZWE+XSB4ZV9wdF93YWxr
X3JhbmdlKzB4MjBhLzB4MjgwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOGU5ZWZmPl0geGVf
cHRfc3RhZ2VfYmluZC5jb25zdHByb3AuMCsweDI1Zi8weDU4MCBbeGVdDQo+ID4gICAgIFs8ZmZm
ZmZmZmZjMDhlYjIxYT5dIGJpbmRfb3BfcHJlcGFyZSsweGVhLzB4NmUwIFt4ZV0NCj4gPiAgICAg
WzxmZmZmZmZmZmMwOGViYWI4Pl0geGVfcHRfdXBkYXRlX29wc19wcmVwYXJlKzB4MWM4LzB4NDQw
IFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOGZmYmYzPl0gb3BzX2V4ZWN1dGUrMHgxNDMvMHg4
NTAgW3hlXQ0KPiA+ICAgICBbPGZmZmZmZmZmYzA5MDBiNjQ+XSB2bV9iaW5kX2lvY3RsX29wc19l
eGVjdXRlKzB4MjQ0LzB4ODAwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOTA2NDY3Pl0geGVf
dm1fYmluZF9pb2N0bCsweDE4NzcvMHgyMzcwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwNWU5
MmIzPl0gZHJtX2lvY3RsX2tlcm5lbCsweGIzLzB4MTEwIFtkcm1dDQo+ID4gdW5yZWZlcmVuY2Vk
IG9iamVjdCAweGZmZmY5MTIwYmRmNzIwMDAgKHNpemUgODE5Mik6DQo+ID4gICBjb21tICJkZXFw
LXZrIiwgcGlkIDExNTAwOCwgamlmZmllcyA0MzEwMjk1NzI4DQo+ID4gICBoZXggZHVtcCAoZmly
c3QgMzIgYnl0ZXMpOg0KPiA+ICAgICA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2
YiA2YiA2YiA2YiA2YiAga2tra2tra2tra2tra2traw0KPiA+ICAgICA2YiA2YiA2YiA2YiA2YiA2
YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiAga2tra2tra2tra2tra2traw0KPiA+ICAg
YmFja3RyYWNlIChjcmMgMjNiMmYwYjUpOg0KPiA+ICAgICBbPGZmZmZmZmZmODZkZDgxZjA+XSBf
X2ttYWxsb2NfY2FjaGVfbm9wcm9mKzB4MzEwLzB4M2QwDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhl
ODIxMT5dIHhlX3B0X25ld19zaGFyZWQuY29uc3Rwcm9wLjArMHg4MS8weGIwIFt4ZV0NCj4gPiAg
ICAgWzxmZmZmZmZmZmMwOGU4NDUzPl0geGVfcHRfc3RhZ2VfdW5iaW5kX3Bvc3RfZGVzY2VuZCsw
eGIzLzB4MTUwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOGVjZDI2Pl0geGVfcHRfd2Fsa19y
YW5nZSsweDI0Ni8weDI4MCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhlY2NlYT5dIHhlX3B0
X3dhbGtfcmFuZ2UrMHgyMGEvMHgyODAgW3hlXQ0KPiA+ICAgICBbPGZmZmZmZmZmYzA4ZWNjZWE+
XSB4ZV9wdF93YWxrX3JhbmdlKzB4MjBhLzB4MjgwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMw
OGVjY2VhPl0geGVfcHRfd2Fsa19yYW5nZSsweDIwYS8weDI4MCBbeGVdDQo+ID4gICAgIFs8ZmZm
ZmZmZmZjMDhlY2UzMT5dIHhlX3B0X3dhbGtfc2hhcmVkKzB4YzEvMHgxMTAgW3hlXQ0KPiA+ICAg
ICBbPGZmZmZmZmZmYzA4ZTdiMmE+XSB4ZV9wdF9zdGFnZV91bmJpbmQrMHg5YS8weGQwIFt4ZV0N
Cj4gPiAgICAgWzxmZmZmZmZmZmMwOGU5MTNkPl0gdW5iaW5kX29wX3ByZXBhcmUrMHhkZC8weDI3
MCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhlYjlmNj5dIHhlX3B0X3VwZGF0ZV9vcHNfcHJl
cGFyZSsweDEwNi8weDQ0MCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZmZmZjMDhmZmJmMz5dIG9wc19l
eGVjdXRlKzB4MTQzLzB4ODUwIFt4ZV0NCj4gPiAgICAgWzxmZmZmZmZmZmMwOTAwYjY0Pl0gdm1f
YmluZF9pb2N0bF9vcHNfZXhlY3V0ZSsweDI0NC8weDgwMCBbeGVdDQo+ID4gICAgIFs8ZmZmZmZm
ZmZjMDkwNjQ2Nz5dIHhlX3ZtX2JpbmRfaW9jdGwrMHgxODc3LzB4MjM3MCBbeGVdDQo+ID4gICAg
IFs8ZmZmZmZmZmZjMDVlOTJiMz5dIGRybV9pb2N0bF9rZXJuZWwrMHhiMy8weDExMCBbZHJtXQ0K
PiA+ICAgICBbPGZmZmZmZmZmYzA1ZTk1YTA+XSBkcm1faW9jdGwrMHgyODAvMHg0ZTAgW2RybV0N
Cj4gPiANCj4gDQo+IEhvdyBkaWQgeW91IGdldCB0aGlzIG91dHB1dD8gSSB1c2VkIGEgY291cGxl
IGtlcm5lbCB0b29scyBidXQgSSB3YXNuJ3QNCj4gYWJsZSB0byBnZXQgb3V0cHV0IGxpa2UgdGhp
cy4NCg0Kc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcva21lbWxlYWsNCg0KKGJ1dCB5b3UgbmVl
ZCB0byBoYXZlIGttZW1sZWFrIGVuYWJsZWQsIG9mIGNvdXJzZSkNCg0KPiANCj4gTWF0dA0KPiAN
Cj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVs
Ly0vaXNzdWVzLzI4NzcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIu
emFub25pQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0
LmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4g
UFM6IEknbSBub3Qgc3VwZXIgY29uZmlkZW50IHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgcGxhY2Ug
dG8gZG8gdGhpcw0KPiA+IHNpbmNlIEknbSBub3QgdG9vIGZhbWlsaWFyIHdpdGggdGhpcyBjb2Rl
IGFuZCBwb2ludGVyIG93bmVyc2hpcA0KPiA+IGNoYW5nZXMgYSBsb3QgaGVyZS4gU3RpbGwsIHRo
aXMgcGF0Y2ggc2VlbXMgdG8gd29yayBvbiBteSBzeXN0ZW0sIHNvDQo+ID4gaXQgbWF5IHNlcnZl
IGFzIGEgZ29vZCBjb252ZXJzYXRpb24gc3RhcnRlci4NCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0K
PiA+IGluZGV4IGQ2MzUzZTg5NjlmMC4uMjEyZjdkZTY0NWRmIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3B0LmMNCj4gPiBAQCAtOTIxLDE4ICs5MjEsMjMgQEAgc3RhdGljIHZvaWQgeGVfcHRfYWJvcnRf
YmluZChzdHJ1Y3QgeGVfdm1hICp2bWEsDQo+ID4gIAkJaWYgKCFyZWJpbmQpDQo+ID4gIAkJCXB0
LT5udW1fbGl2ZSAtPSBlbnRyaWVzW2ldLnF3b3JkczsNCj4gPiAgDQo+ID4gLQkJaWYgKCFwdC0+
bGV2ZWwpDQo+ID4gLQkJCWNvbnRpbnVlOw0KPiA+IC0NCj4gPiAtCQlwdF9kaXIgPSBhc194ZV9w
dF9kaXIocHQpOw0KPiA+IC0JCWZvciAoaiA9IDA7IGogPCBlbnRyaWVzW2ldLnF3b3Jkczsgaisr
KSB7DQo+ID4gLQkJCXUzMiBqXyA9IGogKyBlbnRyaWVzW2ldLm9mczsNCj4gPiAtCQkJc3RydWN0
IHhlX3B0ICpuZXdwdGUgPSB4ZV9wdF9lbnRyeShwdF9kaXIsIGpfKTsNCj4gPiAtCQkJc3RydWN0
IHhlX3B0ICpvbGRwdGUgPSBlbnRyaWVzW2ldLnB0X2VudHJpZXNbal0ucHQ7DQo+ID4gLQ0KPiA+
IC0JCQlwdF9kaXItPmNoaWxkcmVuW2pfXSA9IG9sZHB0ZSA/ICZvbGRwdGUtPmJhc2UgOiAwOw0K
PiA+IC0JCQl4ZV9wdF9kZXN0cm95KG5ld3B0ZSwgeGVfdm1hX3ZtKHZtYSktPmZsYWdzLCBOVUxM
KTsNCj4gPiArCQlpZiAocHQtPmxldmVsKSB7DQo+ID4gKwkJCXB0X2RpciA9IGFzX3hlX3B0X2Rp
cihwdCk7DQo+ID4gKwkJCWZvciAoaiA9IDA7IGogPCBlbnRyaWVzW2ldLnF3b3JkczsgaisrKSB7
DQo+ID4gKwkJCQl1MzIgal8gPSBqICsgZW50cmllc1tpXS5vZnM7DQo+ID4gKwkJCQlzdHJ1Y3Qg
eGVfcHQgKm5ld3B0ZSA9IHhlX3B0X2VudHJ5KHB0X2Rpciwgal8pOw0KPiA+ICsJCQkJc3RydWN0
IHhlX3B0ICpvbGRwdGUgPQ0KPiA+ICsJCQkJCWVudHJpZXNbaV0ucHRfZW50cmllc1tqXS5wdDsN
Cj4gPiArDQo+ID4gKwkJCQlwdF9kaXItPmNoaWxkcmVuW2pfXSA9IG9sZHB0ZSA/DQo+ID4gKwkJ
CQkJJm9sZHB0ZS0+YmFzZSA6IDA7DQo+ID4gKwkJCQl4ZV9wdF9kZXN0cm95KG5ld3B0ZSwgeGVf
dm1hX3ZtKHZtYSktPmZsYWdzLA0KPiA+ICsJCQkJCSAgICAgIE5VTEwpOw0KPiA+ICsJCQl9DQo+
ID4gIAkJfQ0KPiA+ICsNCj4gPiArCQlpZiAoZW50cmllc1tpXS5wdF9lbnRyaWVzKQ0KPiA+ICsJ
CQlrZnJlZShlbnRyaWVzW2ldLnB0X2VudHJpZXMpOw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4gIA0K
PiA+IEBAIC0xNTY0LDEzICsxNTY5LDE2IEBAIHN0YXRpYyB2b2lkIHhlX3B0X2Fib3J0X3VuYmlu
ZChzdHJ1Y3QgeGVfdm1hICp2bWEsDQo+ID4gIA0KPiA+ICAJCXB0LT5udW1fbGl2ZSArPSBlbnRy
eS0+cXdvcmRzOw0KPiA+ICANCj4gPiAtCQlpZiAoIXB0LT5sZXZlbCkNCj4gPiAtCQkJY29udGlu
dWU7DQo+ID4gKwkJaWYgKHB0LT5sZXZlbCkgew0KPiA+ICsJCQlmb3IgKGogPSBlbnRyeS0+b2Zz
OyBqIDwgZW50cnktPm9mcyArIGVudHJ5LT5xd29yZHM7IGorKykNCj4gPiArCQkJCXB0X2Rpci0+
Y2hpbGRyZW5bal0gPQ0KPiA+ICsJCQkJCWVudHJpZXNbaV0ucHRfZW50cmllc1tqIC0gZW50cnkt
Pm9mc10ucHQgPw0KPiA+ICsJCQkJCQkmZW50cmllc1tpXS5wdF9lbnRyaWVzW2ogLSBlbnRyeS0+
b2ZzXS5wdC0+YmFzZSA6DQo+ID4gKwkJCQkJCU5VTEw7DQo+ID4gKwkJfQ0KPiA+ICANCj4gPiAt
CQlmb3IgKGogPSBlbnRyeS0+b2ZzOyBqIDwgZW50cnktPm9mcyArIGVudHJ5LT5xd29yZHM7IGor
KykNCj4gPiAtCQkJcHRfZGlyLT5jaGlsZHJlbltqXSA9DQo+ID4gLQkJCQllbnRyaWVzW2ldLnB0
X2VudHJpZXNbaiAtIGVudHJ5LT5vZnNdLnB0ID8NCj4gPiAtCQkJCSZlbnRyaWVzW2ldLnB0X2Vu
dHJpZXNbaiAtIGVudHJ5LT5vZnNdLnB0LT5iYXNlIDogTlVMTDsNCj4gPiArCQlpZiAoZW50cnkt
PnB0X2VudHJpZXMpDQo+ID4gKwkJCWtmcmVlKGVudHJ5LT5wdF9lbnRyaWVzKTsNCj4gPiAgCX0N
Cj4gPiAgfQ0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjQ1LjINCj4gPiANCg0K
