Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B3C61CE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 03:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2E710E142;
	Fri, 13 Jun 2025 03:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml1WqSz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A5F10E142
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749784791; x=1781320791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fsn76gxFu1Y+HTeK7upjgVD/6IjcANVNJZiWacvpWq8=;
 b=Ml1WqSz0Cpb933lp33XzktiUbcnkuqpKhEjyEfq5IuibtBmL3Le6S8So
 lcz3JJgaP+/XVSrvYxl/h2WyPv0i+wCzjq35sNxNNutj4RkwKmp7ES0CZ
 aYVA6e63wDTmDy0R0Okvk+ELKTEBQRvNjmNW3a7j62rt0PhvzmGJcdozZ
 fMAgtO69Xu7My9voUv0s4YovIzavG3XELUr5BrXuSeH1khDa9WZz8cwGA
 lG0m0enOGNgdGsrMERRO1a+TCkv2PCtfByGvxF8EMSbTJ9TnYkdOLaV3W
 YKL5drySm5u3A8PTrb4RcdpmtGOptaNz58qCzqmC7sj+RBEAWfA00Twkj A==;
X-CSE-ConnectionGUID: dWWIJJTLQ/+UVAW6rx5pdw==
X-CSE-MsgGUID: XZqbXaxQQAS9tnxdCmELjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54614973"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="54614973"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 20:19:50 -0700
X-CSE-ConnectionGUID: dH0/Vu32RQ26B2+gmxqmJg==
X-CSE-MsgGUID: 8IZ4ZezfS8auVueJr4LcxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="148595613"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 20:19:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:19:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 20:19:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygzsiaBblzK3OrneGMWTlj6AmUI8ejpshmEyUZcSyTSs1rATVm9tgx6YwrLAnE4Z6xzfFQfGEHU0nMplN/pkxzIVxh1FWO4OvWjpMskxIn1jUZJEfpl513Li4CIg3V8pBFNBFMkFz6lEoDghI+tBD6Udra0FRTrJW4hx/YdwgESlAR18uW9NcfE26B3iuQTkaD7SAjNw8DZeaC/rY0RdVcOwNcpbX8/epf9OpUACskPjeSruyk68aCm2oiEtx0ggFTl/mHupNAfp5EjnxD19REY8+fwHAmf6V/8aLOj0AwY4px1onzEvdC4iWeUUMGwwGkaiSVO82kQhka9ypBCNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahB6rX/NDNqLN7WLdQrJEXvmdlkMWFQNLj9vfTmozLY=;
 b=weSCDgshtQ4SC/9VjYwWHiY3IPz59/zoV/Is5sHX34KRJBByGSc0u0KcKtXfBSFxUYuygahPNRMgrgAe7UWF4sxuMkDB+1KeUJqD0l6x96AxS/uE5ejpNVormJUCMi1C0vV3siLeM4mrIUqTUTYRn9HeN2Cbi8TKpDv2um9lIdhksqjjidG8avAVrhZfoIaMVoG0AJkgV1+u1aVkV9ZcmadKJPNO02HPRYQlAjjBcViKa9iHHf6R6C3FhKJuhfGAKPWj896rguSxSAZnka7n86oT8Al3qZTE2fiuInK5qAkY/Ajga4O8TlyZw797+SRUrfX8IQPjDjRUNOLSF5psYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Fri, 13 Jun 2025 03:19:33 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Fri, 13 Jun 2025
 03:19:33 +0000
Message-ID: <e9064a7c-b5b0-4a1f-ad72-8b2528eea8ed@intel.com>
Date: Fri, 13 Jun 2025 08:49:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix xe_hwmon_power_max_write
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
References: <20250609061345.3084177-1-karthik.poosa@intel.com>
 <c7231452-78d3-4410-a309-f04d23d7b0f2@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <c7231452-78d3-4410-a309-f04d23d7b0f2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: add942a8-7c2a-45ea-384f-08ddaa291da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGtieE5RS25tazhOT2kvZDhCdWFyeXFwbnZSWVZuU01UYkhvaGRmcWQybmx4?=
 =?utf-8?B?cDludGRIUTdxUDcxNzFmY0Y4aHQvNVM4OUhoS2svUDNVTkQ0dmtOTWdJVHla?=
 =?utf-8?B?VWM0aytaVEVrMVRkYWhsKzhpOUdFbENBQnYwU1RacmtBVWVEaU1hS01kTVpI?=
 =?utf-8?B?OURTNEIzcitLN2VCam83L2lZaHcrT2w3aWVzTWlzaE1BTzZkRTZDNjhhaG9Q?=
 =?utf-8?B?cW1XeGZkV3VEbjZyc2t3MDgxSXg3UGlZQnljY1R4RUhJZ2tPVjNvRlJtaDcw?=
 =?utf-8?B?Qm1TNFZOb25xSE1EQmRkZHR4b3A2QUdhUzZFSG9ldUJhRlRUQ0pCY0RBQWd0?=
 =?utf-8?B?TXR3bUwrMDEwdkhkTjZ1aFVOZE5vdmNSUXVmVnNQV1pGd0x4UGhmUFp5bVZ1?=
 =?utf-8?B?YlpoVjdWS0lMdWpMOGFQS3J4TzhMYkxaVm5QTU9qczdXNi9OQmpZUVQ4STZj?=
 =?utf-8?B?R3BCMmRiR1JldjRWRnVTdlhNZTFWamZENklHdUFEdFhSbGVzMVdqT3VaUDVr?=
 =?utf-8?B?WlhqYkVZT0s0VkRUKzQvQk1URjJVVEZoMmV0V1h3YTBlTS9seVFaR1hKK0Iw?=
 =?utf-8?B?dlpXR3UxeEpqckVXRTgyWXkxUTU5YlZLM0swdHc2VGhJcW4rMUZhTEw0WlR2?=
 =?utf-8?B?OFQrcWdHeks3Z2NFU1NoNG9iY2Q5a2swMXBqNkNzVmdMYUhCcHRrODArMmor?=
 =?utf-8?B?aUNndWQzVC9GR1VkK0ZkSkNWeXVscW05bzhwQTZ0QnZYZUNOWUhTMnNkd1px?=
 =?utf-8?B?dkt2THIzUlhoYURDTWxSdzg2Tkp3cjNVbTVzdjlYZ2RSWkRPWnY5VU96ZHYv?=
 =?utf-8?B?MHdYKzc1Y2xTTVRVVElrYmlrRWs2UURkY1ZwUlZoU2t6QWF1ZDUwQ2Y2ZStz?=
 =?utf-8?B?TU9NK0VLMjJYbkEzVi94Nit4OStlSjF1cUNvYllmVXluVktQQUVFQnhETTdQ?=
 =?utf-8?B?VFZPMHZmOVpSMVY4QkxNQnFIZTY1eDFXYkYvRWVKdGcxbHNKUHBSU3h4K0Zx?=
 =?utf-8?B?U1NTZno1M29sODZpSTJ3TjlHTHcyT1NuWEx1SHZTb3dzL08zUFV1QzhhK0VO?=
 =?utf-8?B?dW9HOThpV2M0OUdhc2d0ak5FM3NSODA2M3RGZy9uYk1wTVBFdFMvaFg4RTYw?=
 =?utf-8?B?Zlo2SlhYMVA0cEVFclZOcGdSUEszazZFUGdCZU5SL1dHNjVEcUdXc0EzYytl?=
 =?utf-8?B?YVc0eVVUQmtTaEJncEdjWnAxcDdicFRJbExGcENJWVNTMytmSXVZNEV3MXhL?=
 =?utf-8?B?Q0pMdDdPY3h4YVhmYnBSNTNHb3JzeTl3QUVPN0tsSDZXMWwvd1pMTG03Wk00?=
 =?utf-8?B?bXhXL3VCSTBXUmNOV3dWdUo4cG9LVng4U3p0ZkNoSFlrMk5kd1dBSDZHSXdv?=
 =?utf-8?B?WjhzTzEzdnRWejNRS2JpcFY5NXRsc01Ndk8yQkl2Z1Q0Q3JTWlZyMUZWYysz?=
 =?utf-8?B?cDJ3MEhHdFdXcWdDVjdQOTJJYjhkQmsvVWljeTcvd3FDUkh0YmZvc2ZLSEsz?=
 =?utf-8?B?Uks1a3JtaDFXRlVFTXNYOUlBcC90Q1BNamNscFlVVFZOYlNsUk9wTm81R3J5?=
 =?utf-8?B?YzBuYnRiUHBLY1VEa3A3VzNleW1DRVY5QWhKUWtlaEQrNDNsVW1PeDA2MHZR?=
 =?utf-8?B?dVVpMDFXZUN3Tnh2ZnY3MGxpcUJPaVNKZXpLeGhvZkx6RzJrZkZ4YTFBODNQ?=
 =?utf-8?B?bzJBT3RCc01tRm1TY3pjbmhncHZQQUx6NVpXdjh1YWczVHVwcE9HNEkxTy9a?=
 =?utf-8?B?VFA3anQ0cUF3bVJIdnJ1UUQ4WXlhOExXMkxYMHVCVVBrTG9sZFVlSzFLNGhO?=
 =?utf-8?B?OTc3bXBBd24rQVVycTA2a0VENjcyaCtGa2h4SnBadlF2UDhQeUw2RG9aR0ZB?=
 =?utf-8?B?dCtwZWRTWmptTkhiQjlnQkNOTUFyZzZyU3NwSGRTQ291L2pxOU5JMTVmdkxw?=
 =?utf-8?Q?eewzuWv1OGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXNFdFFpMnRSVUVhRDIxd29ObUVmdGlLdWZqNHE2Z2J1Z2diWWdKeVlkaDAw?=
 =?utf-8?B?Qjhzd3VyVlJLM09DTjZCbTBreUZxSDVzY2FENTBEay9BUFhvaVp6dEpTVEtF?=
 =?utf-8?B?NXgwYWRRTFo0cTArdm45REZiRmhrSVl5UXdQTWVpZWh1YnoxWEFQZTdFc1J1?=
 =?utf-8?B?U0srZUlJUGhtMThSbE0vUjkwcHlQeWcrMWp4cUQrSXQvMmw0ajJyeWdzRnpu?=
 =?utf-8?B?MUZGdXVjRVlCdmhwQ0VhV0hqQUdpeUVtVGtsT3NUZU53RzFieE1YSVBzcity?=
 =?utf-8?B?U1QxZlVxYStVeDJLaE9qQXAzcUxUM2NMOXZGWHBoQUNWVngxcko0enlhd29E?=
 =?utf-8?B?cDE3NlhFbm5rR29lcDF4SlNTeE5HYmZyYmZSWGpDSE8xdTdJb242UWw5WWVq?=
 =?utf-8?B?amU3NkxtSEZaM1VNRGpXSnAwTklkenVnK2EwSFZsdkhEM3l1VmxsT1JLWVVj?=
 =?utf-8?B?RVBydXB2RWhQWUZUVUFGenFQNVBLYUgwMjZiQktnTDI0Yk1pUEh6RWxwQWsw?=
 =?utf-8?B?S3lWL3pBMEhHMTd4TVUzRGMwR2NQcm5SdlFjVzE1RHRubkRLMW1BRmJ0eWp0?=
 =?utf-8?B?SnFrVU1aL3FQTjRLVVdJbjZKbVF3QUd1VWJIc1YyM0dVNjNMbCszUnkyWFdO?=
 =?utf-8?B?b3lLYUFSQThEWTRCNW9aM09VblhFN1dyKzBEOFUzZ1RqYjJhOERYbnlLb2N6?=
 =?utf-8?B?MmtqNVowaXVYVElaa3hpTlFkQmRoVVRhV1ZjWThYdEhaVlp6NHY4SUJzeXZs?=
 =?utf-8?B?K2RGOHdrVEZrODU4cGM2TDNVTjBzdzBCK1ppZmlFRWdSUG5sNVYrOU0xMThB?=
 =?utf-8?B?QnhKUHZKTzlMcFB6TVdMVDJaQk1ybUMvSnBZSDVVMkhqc29FVkxhR245RHUy?=
 =?utf-8?B?c1FrZThTaFBqNHBFVjZHNmI0UDJid1ZIdHltZHNnYXM4aGU0RXpPRk1vMU9t?=
 =?utf-8?B?N1BNQ0xJaWd1eDJvckxXU3hTQ0FaUmtVSDdwdmVKWS9pMTBTQjZRWjRzUzRL?=
 =?utf-8?B?TTVpZ01pZ2hOV0J0Snd6VlBIOFRhdUxkVnpyOFFLakt3QlU0eEltVlc5VkIx?=
 =?utf-8?B?WjdLbDZWak9mVXFoYU5ET3JLTHdwcEp3bFI5RGJwM0o3em9CRUNkV2RDRi81?=
 =?utf-8?B?aVUvc210SVVjMTRiRFFXZmxJNktqQlMwMVMvcVFHWWgyd1d0bVpGQm9oclpv?=
 =?utf-8?B?Tko0bTYwVE9lY3gzSlFtUWpveGcwS29ZU080V3BvN1l2Q0tGSDFxa2ErZlFH?=
 =?utf-8?B?RUZybWMyUUgyUWlNdWFpWU5OOFNBc0REN2JMK1lxT3dDQk5pWGRONTFIWWEr?=
 =?utf-8?B?RTlCOHdLV1BlNWJLT0d0cGZXd2VSUVlwemtyamcweE1mRGt1Z2xIMHFhdHRJ?=
 =?utf-8?B?MnhlcnRaODBWL2pkaGdjVC9ZUElWVHJzdjVLdUVXenJ0bWRxSmxtc2hxRjBH?=
 =?utf-8?B?bncyaWhiQjFxTVYyQkI2V2E3cXIrajZ3Ty9BZEhJakpWcS9ydHBJS1p4UWNI?=
 =?utf-8?B?RTBCbDR0MVgwM0NEWnkrWE9hWVpqS2M0VVA2NHVMTzZVZGxZVDE0M0VUbnBJ?=
 =?utf-8?B?MStMdzFWVjZpK1ZYU3J6cFlsSjZYb2VFYVFqZFFGK3Nyak00V2cydDNSQ2hG?=
 =?utf-8?B?d2dzZFhQdWtEZFNTNDRIUnd0SUphbjJqSWU3VTNrbHJDMkozMkNnaXhmclA4?=
 =?utf-8?B?OVdsSU5LZXVaY3o2T3NhTzUrbGQ1U0FvcXhvaVgzSHdzNnRzMHAyK2ZLMDBW?=
 =?utf-8?B?M3FzMit3VWRaYTFhdDJ1Tzh3V0dqYWVmdXB5S21Mb2pKUEhZZDNVMkxDWElH?=
 =?utf-8?B?cFJWZnRsSyszQUZyR2U2YzBZSUQ3KzArUi90NTJzOU1ITmFrQWE2NkJtb1di?=
 =?utf-8?B?c3NpWkRNMXllazMrMEFIQmhiampETHR4ZG55SFZFQWlMNWd6cldrUklSaHA1?=
 =?utf-8?B?Rkd3MWtMdlFpVGx0T0FMdEgyOUxFcGRTbnA0QVhEZVFERGtoUFRYMk5ucDBx?=
 =?utf-8?B?Z1ZTY3JVempLV05WVWZSQ04xbWhKWEdlNG5iMUpyK1hQVmFsRTdzODU3K2VE?=
 =?utf-8?B?UE9yQlB4ZDJBNE9xNkczd2V2VytINnphcmMrMmxubkxkWjhla0Q4OUQxTGwx?=
 =?utf-8?B?bE4wbGRtaFRsY2Zwb3FIS25oeWduVG1zMXFHbUpENzdMeUdPZVZxblQrQkI5?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add942a8-7c2a-45ea-384f-08ddaa291da7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:19:33.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBEo0HbHUDh8ozYLANG7rlMcmphOn50X5gQcsuldd+Fk4UPDRdFiMNeM4MKkiuntONz+b1byWdTT44PjdR95lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
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


On 12-06-2025 15:36, Nilawar, Badal wrote:
>
> On 09-06-2025 11:43, Karthik Poosa wrote:
>> Prevent the power limit time interval from being overwritten with 0.
>> This issue was due to a missing read and modify of current power limit,
>> before setting a requested mailbox power limit, which is added in this
>> patch.
>>
>> v2:
>>   - Improve commit message. (Anshuman)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>> limits though mailbox")
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
>>   drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index 5394a1373a6b..ef2bf984723f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -40,6 +40,7 @@
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>> 0x59a0)
>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>   #define   PWR_LIM_EN                REG_BIT(15)
>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0d32e977537c..abb5c3693437 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>         reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>   -    if (hwmon->xe->info.has_mbx_power_limits)
>> +    if (hwmon->xe->info.has_mbx_power_limits) {
>> +        xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
>> +        reg_val = (max & ~PWR_LIM) | reg_val;
>>           ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, 
>> channel, reg_val);
>
> Like xe_mmio_rmw32 I will suggest to write 
> xe_hwmon_pcode_rmw_power_limit() function to handle this.

With few changes, we can update xe_hwmon_pcode_write_power_limit() to 
xe_hwmon_pcode_rmw_power_limit(), as it already does a read modify 
internally, we do not need 2 functions.

>
> Regards,
> Badal
>
>> -    else
>> +    } else {
>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>> PWR_LIM_VAL,
>>                       reg_val);
>> +    }
>>   unlock:
>>       mutex_unlock(&hwmon->hwmon_lock);
>>       return ret;
