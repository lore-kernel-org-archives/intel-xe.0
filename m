Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B141C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 05:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F47210E364;
	Thu, 10 Jul 2025 05:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5L6opPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D0A10E364
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 05:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752125928; x=1783661928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9vEgO9R1Jn520tLzUp/s6ZnMYPIxW0acqXhFdqB69yY=;
 b=a5L6opPMZajYR+hEQwpbSE5j17R2eJIAYkec/hCOWXAC9SMMUln4gypD
 1COcW0zPSY5zLg7cXHj4Bfkue8TXIEYUEZ6hxI26LJSpMYxfowzz008C8
 QgLolCDKekZrK4BKyMne7oKYAxzKC1pHuxyZFE35FlBa9tSHNpoi49ewH
 69GclKskZrxaw8z/GhwzfZ6K7GLEjzoBXsD4mTGRxOTPwVnGolob/MuuM
 Fl9rAv72gxoye/LU/LrPwrsXktx0CdCePxIKSJ8APX0fS+/oXz1BxzfKQ
 E3wv3rawVbksP8dLxvyOh57h4UXyfOpGCAGbfdfoFbQ6bT+E+dr1aV/rg Q==;
X-CSE-ConnectionGUID: ovm6PF/RSZKJIX7OqknCSw==
X-CSE-MsgGUID: GQwOqq6sSOGjLlwzHNvMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54324686"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54324686"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:38:48 -0700
X-CSE-ConnectionGUID: zdTyTOisS2yqcdUperkv4g==
X-CSE-MsgGUID: q1EsN4o3S5ak4JGl/0p9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="156457687"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:38:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:38:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 22:38:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pODky0GLQM05TKnVyLTvgJYWCjREREtAYgH2kmorw+LDQF6ZQOIqsyJo+DbeLvLa8lvb3XvQM16gp1oF9IAQq0qU5U1TxjgaDSDLzkrspGaP2gOdnt5XsASLNYj1TWtUS4zf7VMlMAWFgpL+SF3rU0uVdw+RHTc/9D4RGsj0vJoYJCW9AdUPuF3P2DFYz46ELPV9zA+jXpItNqVoNDZ9+qVJe2SqSkhNIJHIFNy2Loze8A9ipbAWKppQhgxouai6Lh0PGBn7NXjy+yEySXE2Fr8W7kDJUsmhI2kkSgWa29BQlNI1PFpF6A4mFzQZka5SrAFFVmN1WARL5I6ejFcTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwHYbDkFoPc0kHb+tGNzb3p8m+KjvW05zr7ONAvadgE=;
 b=XoYNMNsCzgEpC2W5jp/6b1kzcUBswqj2GdLpfkxRcrtejNk0IjEhqCIfKnqW4rYvM8ubkDUSh5heCH0f++GYOwjiPVbVaZkLOB/Thydo/Zx8FgimJCGUgFAg+0uqwTiQvHnLBG8CZjfsaF3OETyf0kI7l7Zh++BXDOV575sHJAHQC/qw7JB0y2kaxwICx0CNoxNLzB166oCP99jKpU8fCm4f3VxFEl3NtQrXrSokJXxmACOtXuWVLKmkoxR2WMUBO4CBNMAKh2p6roeFOq4AU7qs/ao/TeU4vwYWk5ReW2rAjQldhadw/TKPsDBPUQmikVPAfdfJZoYXnXpMbOGNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 05:38:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:38:17 +0000
Message-ID: <301ed83e-8224-4557-8421-4dfa0fea0fac@intel.com>
Date: Thu, 10 Jul 2025 11:08:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-7-riana.tauro@intel.com>
 <f4efe2419d53874cc7a1baa0c60f4c24cd0eeb68.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <f4efe2419d53874cc7a1baa0c60f4c24cd0eeb68.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e90caa-595e-4701-9df5-08ddbf73f8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dU5xejdSSFp0eEo1TXRZby85dFEyZzYxS1FkVGRxK3g3ckQzRGhEM2IyZU5C?=
 =?utf-8?B?ZkFCNE5LckV1aDZHWG9hZWxmUm1iUi93QnV3SHZNUVB0eVVIKzNmRTg5Q21s?=
 =?utf-8?B?T0thYzAwTU05NENGTGlObWxFODUxc09kNG5VckVHVThjZFNHNTk4d1VRaWdZ?=
 =?utf-8?B?RXpMUzFzZVdJNGFNVkZMZlNrYk9UT2dUaWkxRG1iN3hoNGNsYks5Rll0SXVp?=
 =?utf-8?B?RVJ6eFJUYjIwa212SHMzN0R5OE5ZZ0xDelBXQlBOSUpFc3JSYWRsV3Awb1Bt?=
 =?utf-8?B?NmhmMlZsZFh3NEhuRWpqYmxxa1ZRODc1RU9LUklLWlRrVllvYkhGZUdXYk0v?=
 =?utf-8?B?ckx3MGlWaVpMeERXdVo1aVlSMzFrSngraHMyZHNoYXBWVTdLUm1TZEs0bGxH?=
 =?utf-8?B?bitDYmdyTytPSC9tVXROaG9DTmFuaUxqOVliNUovQjBhYWFDVTFpL3g4SFAx?=
 =?utf-8?B?UU5JdnlNeXVWOHpOcGY0dXZOUC9Fclk2VG5yVE9SdEtkZy81end6OHNXbEln?=
 =?utf-8?B?NGFpRjFrRXFYNC90ejdtWitDWENjbFU5SFptSWhxZlFRbzF5N1FJbi9lNy9z?=
 =?utf-8?B?YzhrZ2czb3l2MVhaVHpWNWpnRHlERTU4N2lRYTA2Sk5EZjhNd2hjemRDZmRD?=
 =?utf-8?B?YnFsaEY2MlpUUUxOSjR0Lyt1RVVOanVkdjcybHdYZzExVU1OdUQrQTI3VTZ1?=
 =?utf-8?B?eGg2ZWtuOFl1V21ScjlwQ2Nhc2g3QUNkcHRibk5nZlBmYk5CVytjSFVMd0Iz?=
 =?utf-8?B?emJiMGhpM013VGFPZVZGdHh6YUhGZXFSUjl0aGk0d29aOU1qR0p0ODZxSXpI?=
 =?utf-8?B?UVNGSkVOaFNjMDJOM1g1OGgvTHd0RUFHeVNDOUVuV0JLaE5Zc29uOGpCWGhi?=
 =?utf-8?B?WlgvQzczL1lVb2x2TEl0T00rSzA2L0Evb0Y5TnEzdXlHWmRGb1MvRmZFN0Zt?=
 =?utf-8?B?VHBzTG1aNjBjTXprSkZ5WUVqNXBPVE5zQlFobXNlLzJlOGl4THFoQjVDZ0NS?=
 =?utf-8?B?eWNoWitiTCs0dnF3SmI3QlVaT1g2QmZkbDhOSWU1N0RtOG9MaGd2Zm9LMUdX?=
 =?utf-8?B?RlpIeTdiWlFNSXN2MEtrby9nbGpBemlCV1lQa3VMY3hIeSszWWhUWDYzbUdD?=
 =?utf-8?B?SUVEV3RVYTZzNDJ3MjdpbEtXYWtBWVVpUWZCSklJZUZndTJSaDJ0TkF1d2ho?=
 =?utf-8?B?TE80cHE0OGp4YTBJYng3a3NXNkVDaHQrR0JPelpUQjdVb00wMmMycjZTUGwx?=
 =?utf-8?B?MFRwcU9MY2lweDVZMWdZSC9zOTl5ZURXNGYrVnhDK05WNlhNZmdHMHFMN2xT?=
 =?utf-8?B?RWZORnVvTXdINytvOEFCeG9QUWsyWUhYUTZEQ3lVR2lpS0xVK1I2eGlCc2NL?=
 =?utf-8?B?MUEySVdGMmZERjUwalVvV1I0elI0VU5nY0Z2bzBIaHlleHBlblVZM09YRFBG?=
 =?utf-8?B?ZEJVWUtkRHkvT1VrZFYyaHNXam1GMHhjVjd3NWNuMTZrTWJadkZjQkxNWTVM?=
 =?utf-8?B?czM1ODYyc1g1bUxjT1pnSXgxcHJzN2lDNDc5ZStRZmF3N3hSZjh5cHVPYkY5?=
 =?utf-8?B?QTZkTllGb2pyTThxa2IxSEp6dm4xOHA2YmdJdHVkcnBPQVM2TW1SSEhWQjhw?=
 =?utf-8?B?bGRZMTRWd1ZGWlhQRmlwNndnQW9DYzROdlJhTlVDWVNRbWtDRW84VE5tQnIz?=
 =?utf-8?B?OC94em15ZS9GVTZrblJsK3JRS1dmVncxcXZPRFJpbDlKNitOYlp5aDVlYXFI?=
 =?utf-8?B?ODk5MkoyNklzL0hHT1lnZ3ZkQXlCL0ZJUUJldjg0d0swSTVVb1QrTlJsTGtz?=
 =?utf-8?B?dVRJWGU5citSblVTekc1YkxEQkJONml0K1BqcVBTS0lLYXNqenp4TmhGMDJk?=
 =?utf-8?B?dm1HaXU5QzZWL253R0pJSDM5SkNGcXVTa3p0ZFczbGhxelBOcUV5WldDaE9Z?=
 =?utf-8?Q?U3+UUtOhooE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RqLzltb1ZpSU1jV2NCd3VNTSt4Y1hRbWpFVkxGbGlVSzN5ejhGRVM2MWND?=
 =?utf-8?B?QlhSVnJ5aUd2UHdzWUdwTkZBd2FKd0tST0ZyQzUzZXNFZFpLN3Q4RFgvc0RG?=
 =?utf-8?B?M1l4NlFWbmU3cWhucHRuR21tZE81TXpxendrU2xCdjNLWmV5ZnVkdForbFYy?=
 =?utf-8?B?RHNVZXBTT0lJeEkvaUlYOWxIZlNlcUt2SVFXenFGMk5CZkFoSFA4T0d1Z1Uz?=
 =?utf-8?B?QWIxWkVLZlVsM0JQWFdXUjdrWHprSmpkUUhQOEtKam1QbVZkWWMzSSs2ZDZI?=
 =?utf-8?B?L3hSaGlhZmFXdm5sRHIxZkJFb2VHTWdSU1BJejdzNEJYazI5TjdOVkRhNU1C?=
 =?utf-8?B?cGpITXhhY0RseVNZMFRKdVVpVkRnVXNRRmtRTjJPWWkvWWQrV2NiYytrTkZk?=
 =?utf-8?B?UmJ5d00wS1dkS2NmZEpnK0t0Mm93UmpZdXV5SEQyTTRJK2dFK0g5cWlzbjZO?=
 =?utf-8?B?MVpyc1AzU2R4T0VSbEhmcEhNa0JGV3pRN0I4SGxNejI3KzZWN0RNT3RkK24w?=
 =?utf-8?B?WGVORDFPa1pDREpXRHJNaFdYVWw5UG15ZFpaQ0FpdnhsQTgyQ2Qyai9vTmtz?=
 =?utf-8?B?SnI0dkFWeS9GS1ArTzVidDZnczl6VjhmNzI1eGtKZ0xYYWt2NUJFNUsxeVhp?=
 =?utf-8?B?UWpUbVd3UEhTTk82OFdMZ1NaTHV3K0hubC9PSEx0ZUdmcjVTV3luVFpURDc0?=
 =?utf-8?B?NTNuamlMckloRTNZcE5RVk9ySUl6dUUyemZqcFBMWXovMEV5VnRWcFU5QU8r?=
 =?utf-8?B?YzJHSW5Ca1Bjc3pYSkk0U2JkTDU2bnFSSng3cVRkTTNmT3BMN25wYzFXUEc4?=
 =?utf-8?B?dnRwOUtpY2VneWpqSEhRY1ZWUmtiRWJ3eWtIRG9jZm02dDdXQlNFdHhGM0Jr?=
 =?utf-8?B?SHJjYlRUV3F2c01oWDFZdlNZMHBRYW1NcWsweGFtV3lMR2htQjFRL3IzeXpy?=
 =?utf-8?B?cmw3clJ1blhYK0hQREtDdi90Qktud2JQRlFLTTlNa0VjSkN5Qi9DckhnZURZ?=
 =?utf-8?B?R1Q0cXJvbWJ6Q3pXWTYwTWNuM3VkQmY5SnJqTE5DVXdrUmN0dkpHOWlEUVZv?=
 =?utf-8?B?dFhzTFplOVk2V0IwMXVQaEZDMmE4S05sVnI4dUlwVFl4Rk9KVlBmWlNRaVVR?=
 =?utf-8?B?cjhVcEJQY2E1T3l0K3RoNzZBU3VmalpVWjN2NnBYVXRNQXJCa2RkeGRFa3Z0?=
 =?utf-8?B?azN1bGF6QWovZTAvY0dPekRKRHVpMnIxeHgyMENKdDN0c1NpbHlBbGFPbFhz?=
 =?utf-8?B?TWJydnFwK0c0cmhGUFVUMnV2ZVFyTE5oL01RditMMHRTV2VLTXp3WWRVdkN6?=
 =?utf-8?B?bkNiVTc2MHZjRlV4ZEkwcmJrZVZ5Y0d6aUxKa1dQUmtZK2hqbVAyZDVZNmV0?=
 =?utf-8?B?RmNWeEZ1YTZxdEZtQ0RKRElmY3FyWUNqVWZRSFNhaWs2cTNXS250aWZoQkNy?=
 =?utf-8?B?SHNzakFDbVVjeXR4K2hYQVVZRTY1ZUNiUlZNanlvazhOVlZkUGxEYUpURUJL?=
 =?utf-8?B?QkxsajBNQWN4cWl1cEgvKzNyaVc1ek10bVZKTGVTMVVqS0JSMitiOThCZkgy?=
 =?utf-8?B?TzFaZDVqOUxDMDN5aTAxbTUrQXlXeEMzekhKSThYUStBb3U1bllzN2dkSFVV?=
 =?utf-8?B?SHE4eDdsc2ZMcmxaY3ZKSzQ2K1V6S09ZbnhjOU5DRkNyWlNMYUd2M2ZUbHBu?=
 =?utf-8?B?S0IrVjJhUWRLQzIydE5qZ2VQSnA3Y1R3ZWtNZERkWUFaTjNlN0JDWUZvYUFH?=
 =?utf-8?B?VXpNekV4V2xpWEFTamNVTUNYNEltRTVnOExuMUFWdVdzYUR4bDFRNXRrVkYr?=
 =?utf-8?B?NWExSWdPb096d3VkM0YwZUEzcW5uN08xSHJ3dDY3OUY3WXpuOUkydTV4KzJo?=
 =?utf-8?B?YWlkUzVodlM0ZmpIZDhqOFBudTI3enhvc2dZUDlRcHVOQk5pZ1Y5aUFYaHc1?=
 =?utf-8?B?SHprNGFTdkdaeFhrRGRGSzBqUVZyOVdjQVA0NEV5cVBjcXo4TFJpYjJ1c2l4?=
 =?utf-8?B?SUNrN2xOYmtKaVZVa2R4SDg0ZHNRL3hZRzF3cHhqbkJLOVlRK1ZYRGNvK2x1?=
 =?utf-8?B?T1oremRvOS9VemZlTndUR2g4TnJUYkNhUm5oMVRoM21CWk5NZzA2dnBQUE1G?=
 =?utf-8?Q?ojBuhTkJunf9NMIyT+sUBvRBq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e90caa-595e-4701-9df5-08ddbf73f8c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:38:17.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AN/6m4ZUhJv4FshAap1s/SZhahnoBjFv40O0m7m3mZ2RhEMGUvSlbxamDNz2Pj71wDA9gr2t+yMtXTo9g+V8cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

Hi Stuart

On 7/9/2025 11:27 PM, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 19:41 +0530, Riana Tauro wrote:
>> Add support to handle CSC firmware reported errors. When CSC firmware
>> errors are encoutered, a error interrupt is received by the GFX
>> device as
>> a MSI interrupt.
>>
>> Device Source control registers indicates the source of the error as
>> CSC
>> The HEC error status register indicates that the error is firmware
>> reported
>> Depending on the type of error, the error cause is written to the HEC
>> Firmware error register.
>>
>> On encountering such CSC firmware errors, the graphics device is
>> non-recoverable from driver context. The only way to recover from
>> these
>> errors is firmware flash. The device is then wedged and userspace is
>> notified with a drm uevent
>>
>> v2: use vendor recovery method with
>>      runtime survivability (Christian, Rodrigo, Raag)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>>   drivers/gpu/drm/xe/xe_device.c             | 11 +++-
>>   drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 70
>> +++++++++++++++++++++-
>>   5 files changed, 88 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> index 9b66cc972a63..180be82672ab 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> @@ -13,6 +13,8 @@
>>   
>>   /* Definitions of GSC H/W registers, bits, etc */
>>   
>> +#define BMG_GSC_HECI1_BASE     0x373000
>> +
>>   #define MTL_GSC_HECI1_BASE     0x00116000
>>   #define MTL_GSC_HECI2_BASE     0x00117000
>>   
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index ed9b81fb28a0..c146b9ef44eb 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,10 +6,15 @@
>>   #ifndef _XE_HW_ERROR_REGS_H_
>>   #define _XE_HW_ERROR_REGS_H_
>>   
>> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base)
>> + 0x118)
>> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +
>> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base)
>> + 0x124)
>> +
>>   #define DEV_ERR_STAT_NONFATAL                  0x100178
>>   #define DEV_ERR_STAT_CORRECTABLE               0x10017c
>>   #define
>> DEV_ERR_STAT_REG(x)                    XE_REG(_PICK_EVEN((x), \
>>                                                                   
>> DEV_ERR_STAT_CORRECTABLE, \
>>                                                                   
>> DEV_ERR_STAT_NONFATAL))
>> -
>> +#define   XE_CSC_ERROR                         BIT(17)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index d6b680abc3ae..fbc50cebfc11 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1154,6 +1154,7 @@ static void xe_device_wedged_fini(struct
>> drm_device *drm, void *arg)
>>    */
>>   void xe_device_declare_wedged(struct xe_device *xe)
>>   {
>> +       unsigned long recovery_method;
>>          struct xe_gt *gt;
>>          u8 id;
>>   
>> @@ -1169,6 +1170,12 @@ void xe_device_declare_wedged(struct xe_device
>> *xe)
>>                  return;
>>          }
>>   
>> +       /* Default recovery method */
>> +       recovery_method = DRM_WEDGE_RECOVERY_REBIND |
>> DRM_WEDGE_RECOVERY_BUS_RESET;
>> +
>> +       if (xe_survivability_mode_is_runtime(xe))
>> +               recovery_method = DRM_WEDGE_RECOVERY_VENDOR;
>> +
>>          for_each_gt(gt, xe, id)
>>                  xe_gt_declare_wedged(gt);
>>   
>> @@ -1181,8 +1188,6 @@ void xe_device_declare_wedged(struct xe_device
>> *xe)
>>                          dev_name(xe->drm.dev));
>>   
>>                  /* Notify userspace of wedged device */
>> -               drm_dev_wedged_event(&xe->drm,
>> -                                    DRM_WEDGE_RECOVERY_REBIND |
>> DRM_WEDGE_RECOVERY_BUS_RESET,
>> -                                    NULL);
>> +               drm_dev_wedged_event(&xe->drm, recovery_method,
>> NULL);
>>          }
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7e4f6d846af6..5daf5ba6bf51 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -241,6 +241,9 @@ struct xe_tile {
>>          /** @memirq: Memory Based Interrupts. */
>>          struct xe_memirq memirq;
>>   
>> +       /** @csc_hw_error_work: worker to report CSC HW errors */
>> +       struct work_struct csc_hw_error_work;
>> +
>>          /** @pcode: tile's PCODE */
>>          struct {
>>                  /** @pcode.lock: protecting tile's PCODE mailbox data
>> */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 0f2590839900..73c788fd0dee 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,12 +3,16 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>>   
>>   #include "xe_device.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>> +#include "xe_survivability_mode.h"
>> +
>> +#define  HEC_UNCORR_FW_ERR_BITS 4
>>   
>>   /* Error categories reported by hardware */
>>   enum hardware_error {
>> @@ -18,6 +22,13 @@ enum hardware_error {
>>          HARDWARE_ERROR_MAX,
>>   };
>>   
>> +static const char * const hec_uncorrected_fw_errors[] = {
>> +       "Fatal",
>> +       "CSE Disabled",
>> +       "FD Corruption",
>> +       "Data Corruption"
>> +};
>> +
>>   static const char *hw_error_to_str(const enum hardware_error hw_err)
>>   {
>>          switch (hw_err) {
>> @@ -32,6 +43,58 @@ static const char *hw_error_to_str(const enum
>> hardware_error hw_err)
>>          }
>>   }
>>   
>> +static void csc_hw_error_work(struct work_struct *work)
>> +{
>> +       struct xe_tile *tile = container_of(work, typeof(*tile),
>> csc_hw_error_work);
>> +       struct xe_device *xe = tile_to_xe(tile);
>> +       int ret;
>> +
>> +       ret = xe_survivability_mode_enable(xe,
>> XE_SURVIVABILITY_TYPE_RUNTIME);
>> +       if (ret)
>> +               drm_err(&xe->drm, "Failed to enable runtime
>> survivability mode\n");
>> +
>> +       xe_device_declare_wedged(xe);
>> +}
>> +
>> +static void csc_hw_error_handler(struct xe_tile *tile, const enum
>> hardware_error hw_err)
>> +{
>> +       const char *hw_err_str = hw_error_to_str(hw_err);
>> +       struct xe_device *xe = tile_to_xe(tile);
>> +       struct xe_mmio *mmio = &tile->mmio;
>> +       u32 base, err_bit, err_src;
>> +       unsigned long fw_err;
>> +
>> +       if (xe->info.platform != XE_BATTLEMAGE)
>> +               return;
>> +
>> +       /* Not supported in BMG */
>> +       if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +               return;
> 
> Again, here and above, why are we specifically limiting this to BMG?

This is CSC error handler and this bit is present only from BMG and the 
heci base here is also specific to bmg. Hence the check
CSC in BMG doesn't support correctable errors.

Thanks
Riana

> 
> Thanks,
> Stuart
> 
>> +
>> +       base = BMG_GSC_HECI1_BASE;
>> +       lockdep_assert_held(&xe->irq.lock);
>> +       err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>> +       if (!err_src) {
>> +               drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported
>> HEC_ERR_STATUS_%s blank\n",
>> +                                   tile->id, hw_err_str);
>> +               return;
>> +       }
>> +
>> +       if (err_src & UNCORR_FW_REPORTED_ERR) {
>> +               fw_err = xe_mmio_read32(mmio,
>> HEC_UNCORR_FW_ERR_DW0(base));
>> +               for_each_set_bit(err_bit, &fw_err,
>> HEC_UNCORR_FW_ERR_BITS) {
>> +                       drm_err_ratelimited(&xe->drm, HW_ERR
>> +                                           "%s: HEC Uncorrected FW
>> %s error reported, bit[%d] is set\n",
>> +                                            hw_err_str,
>> hec_uncorrected_fw_errors[err_bit],
>> +                                            err_bit);
>> +
>> +                       schedule_work(&tile->csc_hw_error_work);
>> +               }
>> +       }
>> +
>> +       xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum
>> hardware_error hw_err)
>>   {
>>          const char *hw_err_str = hw_error_to_str(hw_err);
>> @@ -50,7 +113,8 @@ static void hw_error_source_handler(struct xe_tile
>> *tile, const enum hardware_er
>>                  goto unlock;
>>          }
>>   
>> -       /* TODO: Process errrors per source */
> 
> I still think we should have a print here to show the errors we
> received, especially since CSC isn't the only bit here. We're just only
> implementing recovery support for that case.
> 
> Thanks,
> Stuart
> 
>> +       if (err_src & XE_CSC_ERROR)
>> +               csc_hw_error_handler(tile, hw_err);
>>   
>>          xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err),
>> err_src);
>>   
>> @@ -101,8 +165,12 @@ static void process_hw_errors(struct xe_device
>> *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> +       struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>>          if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>                  return;
>>   
>> +       INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>> +
>>          process_hw_errors(xe);
>>   }
> 


