Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92EACAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 09:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FBC10E53D;
	Tue, 30 Sep 2025 09:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhGU6uX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4FA10E53D
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759225032; x=1790761032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Ez/ZXlnUUgFrz/R6tkEFuMl0uvepilgyNbZpoKYHUOY=;
 b=nhGU6uX4nxQcAjrdEJYxmyVXGWp3sJ4MFlG9zToPT0VAp46x31vURTDF
 Z7XzxotOKRONXaX45/Xga1KkSezHDib3qEA9lh6xqYtqeW8onk4DdfqmS
 qXLnyQhBSEVTIHxLlKs14edoilzGGAXhfQAQkSt054Cdl3+7A7MrfJHrk
 vsHk6mA3qQIIjH4FInFoqCIS/FPA9VVGBkULjWYSnk+5m/er08ABcXreH
 nHkrpmcO5XORKKjz4Q+Af6ZfFBdwtMWXdXZLQ3PoNaVYi6H52rpJucvll
 mwMY7VTk6yohVu9LQ51gSC6fTDpMoXcsl62STRODaqD5ZjF/K5SwO4/wb g==;
X-CSE-ConnectionGUID: XFhmeBdfQseQJB03wXhn+g==
X-CSE-MsgGUID: wXESraOuSMWX1/FvDiJUdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61521098"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="61521098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:37:11 -0700
X-CSE-ConnectionGUID: 3ivXzKYqR3+fM/3ddJUMIA==
X-CSE-MsgGUID: 4DrjV1wISsiLuleL/GZ5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
 d="scan'208,217";a="179246964"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:37:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 02:37:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 02:37:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 02:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blas0qFUp7HXoooIZWv0OH95pi8vjlriStbZA8R2Gfn7wki/af74eBJ8kAjFOc6fleqOG7gAJKgUqijYpKaE7yIbvI0/MPDUD7yBEK5PnX3fcqQKjFpbGtDUGob9IlUUY++8J3dq8lD94xBunsRdi8dbr6xoDNxgHfUW9SfNzRz28cFeo2+dkYDwyGc93kUG4Nb1zuo+Q852zRSZZ7KXXo+DbOakie0ZZcDiAeqWg482S+aG85QO1YewMIB2MF9H6oiogzsSyRlkxqm8SUET3sd1IipXTtCLvY0NCHPxrl2GYpDUk794CZmjRAzI1WB15vXdlpk5btzQxlUaK17kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDmDK4MTwYdNcjIRzGuprhi/BlxDHJJVe8swGiW43Sg=;
 b=A9sjeknEVw8PvV7ZjQx2HVyVNYQu3bfkHg4Z+7t+KQtd7xml/GMkUidAxB0ie5Y0InDdxUX6Y3th28h5dOv0/OUS4Plqs0qX6WKYRRmeWjEcyTvPGf+2h18N3NY/9GWn7JpVTu0AwQytwRaovVQEsDdpUvD8wgV6V9ZKFrqsMBVGAlTTG+uzSDk+nwstG18UzdKhou38GLI51nXYa8ib0YMueahTG5f3ejToDswZVs/dbprkGG92r9De6bxtfTbGPBDDtzMXBgTeQIDzsr/4MuQU75EI2fhjbVZ2r5mWcrQ3ShyxO5d2foiWB5cGrIxYGRZ7diR4w3g+YPkkfBw23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 09:37:01 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 09:37:01 +0000
Content-Type: multipart/alternative;
 boundary="------------fN6Y1dzNJEWhXZJs03x9YO5Z"
Message-ID: <3f7c0d54-b0c8-4e7e-b833-a21b4e75d770@intel.com>
Date: Tue, 30 Sep 2025 15:06:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/ACPI: Per root port allow one Aux power
 limit request
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-acpi@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <anshuman.gupta@intel.com>, <rafael@kernel.org>, 
 <lenb@kernel.org>, <bhelgaas@google.com>, <ilpo.jarvinen@linux.intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <varun.gupta@intel.com>, <ville.syrjala@linux.intel.com>,
 <uma.shankar@intel.com>
References: <20250904183659.GA1271032@bhelgaas>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250904183659.GA1271032@bhelgaas>
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 18355c3f-dfde-4175-dc68-08de0004e836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHJURmdvTVRXdnNtd1QyZGJLZytTa01tSnBja0ROWHg1NzNyMHRxZ3Bjd2gx?=
 =?utf-8?B?WkFzZ2daWGFiWjZ4dFFHUlBLd1FWVHA1ek1KZ3Y4MmdwNldBTFpzejVKcEJT?=
 =?utf-8?B?dFlXYzdsZVFwTG01RU1PNWxZeVR6M1FJYVJyVktYRHB2UXR4dndOTUR4SGJz?=
 =?utf-8?B?K29oT3l4MVZENEo1ZCtBSFB6VGt3WVBrcEQva2VEbnlwVUdZcVZBTUU2bXhz?=
 =?utf-8?B?bHZWek95RStxaURqZGVUVUJ5bzJKWG92Y3BkWFRkaWtjZlpITzNMNnJPWkto?=
 =?utf-8?B?UVdhQjBRRzhRd0xjdnB4WjFyY2dtRlhiVnRSUU1VSDRpcUJBM1JxajgyaXBn?=
 =?utf-8?B?OUYrWHBwTGdESGZrSEdyV0sxOENubFBUTzBFTWtrNGlzYkZ4QVVsdU5CVXlj?=
 =?utf-8?B?L1JpSUV4ZUo4Uk5uSGVmRlNHQ0Rod0RFUWdsNFZWZDBsa0lZQkcvam5hTElx?=
 =?utf-8?B?Sm01Q2tRTXVzejNZM3lDUzd6Q2w5eVMrOVl0TnFMaHVQWGFpamx5UTNpM1RR?=
 =?utf-8?B?RzhsZkdWRlB2ZDJVakhlSXBobXNSeFhuUk1kSGpSakwvbXJSZlZWV3BaNnlI?=
 =?utf-8?B?aWJnUzdFOWZ6dVdtSERObGk5STdmNTduUTNQY2FrZVplZzczdENiSGlCa1lQ?=
 =?utf-8?B?WDlmV3NoZlhCUEhpb2daVFJiNG9icGJjS2t5VDl5QUxFdmp4MG5oUXB5bjJD?=
 =?utf-8?B?TTg3dC81MWp6M0tDZVZnMzI0aWhGWEtBOHlyeEN2d00xMmI1V3A0ZUczYVF6?=
 =?utf-8?B?djI1V2s4bFlpUHF3SWNEUWpwYktKdlQrMEYzVzNPUHJrb1BlSGNhL1FKS01o?=
 =?utf-8?B?cU5ZSmdzVkpBSFh4SDhBMUxvMWlQQnFndURUZ28vV081eGdTeUpodW0wWDdn?=
 =?utf-8?B?bjNRQ24xT2ZVT2RwcHplRmp4enAyR2FqbXJiY1B1NWVJQ2RTMlJab3VvTTlV?=
 =?utf-8?B?VnArRkV5V1lNSVRlWmVzKzF1WkJWQlVuWW5OTFV2RC9FVmZlUzFvdFBuNkYx?=
 =?utf-8?B?YnVLTTlRU1dVenhkS3ptRi9lMkhGZWIwbFBCUVpCYURKai8rbmt0cHJxL2lS?=
 =?utf-8?B?VGJVNDdtU3hxVC9hY0poMU1iUU1ZRmUrVnp2d2V6RCtkKzNibWlxQnhSU3M5?=
 =?utf-8?B?MHRKNTVhUlZwVTUvZ1lZbFkzNzFBSFo0b3hybkpxVEV0dm9mcjhCcHRvdEZy?=
 =?utf-8?B?TGVOd1JhM25oUEtiUnNTTmljbDZvL1ViM2pveXp6cXZXOWo5bXhMVkNJaVlO?=
 =?utf-8?B?dHlMdEFyUWF5VVhkcWxSZVowcjBzdmNDbFhFY3JRWEZYcDRxOVhkQUFDTEF3?=
 =?utf-8?B?Nm5zdlYvRlJBL0lQZkVrbHh6eUIraU1FeFVNT3hrTm9XWWxNYWxFY0hSZzEy?=
 =?utf-8?B?UjF3S1BldHh4Y0hJMUdMWGk2QWNZUjR4RDhxbnBzdFlQaUpyNFUzQlJ3K25a?=
 =?utf-8?B?R0N3VUdaNmVrOCtzLzBKT1lhK0xlRkplZ21DS0dhamhlYVVCbTArTGhpMmtx?=
 =?utf-8?B?dWNNZEp3SlkyNkEydk90UUg0cnJWZzk0RHJ4THp1SkFObmlRN3ZqZlVBYmhw?=
 =?utf-8?B?U054VTJMZFRrNStpVyt0M2VYWmFIRTBwM3VURWZKRC9Kak1QQXNnVXhJZjE4?=
 =?utf-8?B?cFJlWHdaSFZxVGRKRmUrZjFmaks1S1BZQmNhY3JwVUZnVjNNK2hCci90NUlk?=
 =?utf-8?B?UmZvUWFMVllWK1RQc01ld2pmZjVZbjNpQk8zRVJiZnB3WDE2TU1Lak85SzFn?=
 =?utf-8?B?UUVMcUZwQm5hOFM4dDlTN0ZNSFVLdUFrOG5RallmcmFiU1hIWmwxRklEdGlN?=
 =?utf-8?B?d0NEWkMwMlBqY2dieHZuZ0VvREplT2RVL05sZmNaM2RObnFhVFEvamZBZ1Qx?=
 =?utf-8?B?Ti9tSk5NL3lHVjFZdmlibFk3dk4xbVBNSnFVY3JJc3NpanBGTFNYN0RGdjhH?=
 =?utf-8?Q?0YBxdffsC8pYLhCp33uvBzdk8JNqnGXI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWVqdjVwL2w5UUhxdnJWaGlWL0ZSNHo0ZW1FVjF6UzhjVUd4c1lxd1NhYjR4?=
 =?utf-8?B?eFE1N0JUWWNYZjBsWm1meUdzdndwdkRWTHp6QSswTUNLYklDcDRVd1NSZFRB?=
 =?utf-8?B?S2ltZml2cjRIZWVhSFcyck9oQ3pBUDc2aU16YWZpd0ZUemYrOFBqN1VlZERy?=
 =?utf-8?B?a1BBV09nUjY5d0lSZjhNbFg3SHJZbzZqSHNrN0JRRjZxV091NVVSNFhFOW1t?=
 =?utf-8?B?N3cwaFZwZFo5U2IrRUVGaTl2cjNsS1NqaUFpdm1rZDAyY3lyVGNzNTNXcW1a?=
 =?utf-8?B?Vk52Q2FJZHZSZW1yK1htYjNUWnJyVGRLbmR4MWpSbXhtaldEQXdqVTJoYmlZ?=
 =?utf-8?B?aFM3WFRCRHhBMmZuZkcyT042QVNNKzBQV3VlSDlUaHJhM1U5andjS2ptbFdo?=
 =?utf-8?B?TTl3N0JpbENqbzdPRGFYenVodzFYZk8vTVBTMVhJeC9NdzRjVEpNUjhVdGw1?=
 =?utf-8?B?ZjhrZ1ZGMHlmR0djWW9yM3Zwc00vT3ZSSlJ5SkY2VXc0VTI2NmlCektuWlZS?=
 =?utf-8?B?cjgyZmliRStWaHUraW1DZ1hJcVRoS05Delk2dXFGNmV1U1JNajFHQWtZdjB1?=
 =?utf-8?B?eGRrTWx0cE5QaGtvU3A3Ujl5Rjh6N1l4STRaNVQwdW5raEJJTTZhL05PMmlP?=
 =?utf-8?B?WExtQ21BVCs4WW8yVDhQZGdtOXFMZjVRd1Z0L1lBemFDWGVWRWpRWlZFRm5r?=
 =?utf-8?B?Z0ZORUVFejZ1T1hSOThLQkgzOGJJUUM4bzN1Z3BlQ1MwdE1jWStaZEFYbzQw?=
 =?utf-8?B?MjZNbEVLVklNNmpnYkxjT3dwMnRGOW03dHNPNktGMlhvZVN1WEhORUlNdm42?=
 =?utf-8?B?YUpKV002V1pHR2k2R1duUmhMV0p5TndDV083RDk0bmxiTlJKS29iYkF2R3dF?=
 =?utf-8?B?VVFpTGQ2dWxkQkxXZkVkajdscEg3V0NnU3RJejlKS3ZJbWI4WGZNWHBQdE5J?=
 =?utf-8?B?eDVsNm9LRHhmbTg2NlNrSnAvSVg2NytzSjdaMlJKVktPbVFLZ1dzRGRHaXc1?=
 =?utf-8?B?aDM4dGRmTUV3TVptOGpNaHRGemVvNUlUYUFLeTJtUit4eEZ6d0hMZ3IxT3ZB?=
 =?utf-8?B?T3lBTnZXK0ZIcFZ0V2FMYko2T01FV0UxRXNyY3hEVTBoY05DWnJFa1lZUS91?=
 =?utf-8?B?N0o3QjhJdzlGRCtWVmpsRitSWUI0TzdPZHRtZlAwMFpHdzhvdkZ2YVBIREVW?=
 =?utf-8?B?dEROOE9nOUpNWno4dFRNSkwyM3BBR3B5c1lwUUR6SWlNbjNOUCtyRHJRUUVH?=
 =?utf-8?B?V0ExYnVpZ3NHSTZ6ZHNWMlM0emtJdzM2ZU8yUEZGbklpdjRHSUJ0R2VRcGVo?=
 =?utf-8?B?YVZUMGhPcEhiZXNWeFNIcTJqMCtBZStETXVDQXVzOHp1c0R5QjNJMDM5eHRX?=
 =?utf-8?B?WFJsd0RIQldEVUdSUHV5Ylp2bTIvQTNaOVc5cWI0YkdFSkhQcmxWVVRDbmU5?=
 =?utf-8?B?SmtHalBDbWtnQUJOeDhCN3dPZUNQMWE4MU5KYUNCY0Q3dVRYSlJhYVZoYVRi?=
 =?utf-8?B?THhyUlVUWDIybjJWOGdoQ2R0RUJqREZRVkZXT0pIOTV3NEp1MGd6U080K21v?=
 =?utf-8?B?TjhjL2ZoSnIzSjI1RGVGVzdicDZkdEtWaFYrckJSTWxZQWx4TU1UYVY4dFRW?=
 =?utf-8?B?TUprS3VHeUVUdkNVS0JVQlRKR0RBSGsxaTBxeCtrWUR3R1FITEVEck9Qb3pw?=
 =?utf-8?B?MTBocFowWlpKczVBR2swNDdLNmovbVdXSk1HZCtidTVHSk4xSUJRbFhoNlF0?=
 =?utf-8?B?SzhvanRWSk5DUHZMc0pyRWtVY29wcVB1Ui9UV2V6Q2REbFVZMVFUcTA4SXRq?=
 =?utf-8?B?SzQ5MEZ2Rm0zUXhnTTZBT2FEZFpXald3eWE5cnJrWlN3RVRWdWFYcWVsSkNP?=
 =?utf-8?B?NjNiTDFsL1hqcnhBVFlvb05xZjdoM0YzUzVoQXVIdHI3YUNwVHBaUTZJN3da?=
 =?utf-8?B?VDdienA4eFN5bk9VWE1YZ3dKNkNFNjI3ajBRaWI5MElEY1hneEpWRUc1aUNQ?=
 =?utf-8?B?dFNsZ0p0d0g2M3ZSL3paWFovN0Y5UXNaVlU1ZEdsaUNDRE10aFFTT3NUT3N2?=
 =?utf-8?B?L2ZMbGlvTXRNMkhvUjNsMDZjMkg1ejRTRlk3eUdqbkdqSGRXOE5VWDJERUEv?=
 =?utf-8?B?VzRBWXU3em4zRFpvOVhtMDdTOHB5MnJQNzYvK3pTWWlpYnVjUllKLzRBckJV?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18355c3f-dfde-4175-dc68-08de0004e836
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 09:37:01.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkPDDIKI95PkIa1u2573qIwQZzEPOTAaFKQxaVvic//FV1JTI5LnVw7RoMrhtf+bR7N5+IB6eA9ixK/b8TsKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

--------------fN6Y1dzNJEWhXZJs03x9YO5Z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-09-2025 00:06, Bjorn Helgaas wrote:
> On Thu, May 29, 2025 at 04:46:45PM +0530, Badal Nilawar wrote:
>> For given root port allow one Aux power limit request.
> Please include the reason why we do this.  I don't think we need it.

  This is added as aggregation is not supported. I will add the reason.

>
> PCI Firmware r3.3, sec 4.6.10 says this _DSM function can be invoked
> multiple times with different requests.
>
> We might need a mutex just to avoid concurrent evaluations of this
> _DSM function by different drivers; I'm not sure whether there's a
> requirement to avoid that or whether the ACPI core already enforces
> something like that.  But that would be a separate thing from
> aux_power_limit.

As discussed in patch1 as driver's pci_dev  will be passed to 
pci_acpi_request_d3cold_aux_power(), will save that |pci_dev| in |struct 
acpi_device_power| to support multiple |_DSM| invocations by the same 
driver.

Thanks,
Badal

>
>> Cc: Rafael J. Wysocki<rafael.j.wysocki@intel.com>
>> Cc: Anshuman Gupta<anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>>   drivers/acpi/scan.c     |  1 +
>>   drivers/pci/pci-acpi.c  | 25 ++++++++++++++++++++++++-
>>   include/acpi/acpi_bus.h |  2 ++
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index fb1fe9f3b1a3..9ae7be9db01a 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -745,6 +745,7 @@ int acpi_device_add(struct acpi_device *device)
>>   	INIT_LIST_HEAD(&device->physical_node_list);
>>   	INIT_LIST_HEAD(&device->del_list);
>>   	mutex_init(&device->physical_node_lock);
>> +	mutex_init(&device->power.aux_pwr_lock);
>>   
>>   	mutex_lock(&acpi_device_lock);
>>   
>> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
>> index 87f30910a5f1..d33efba4ca94 100644
>> --- a/drivers/pci/pci-acpi.c
>> +++ b/drivers/pci/pci-acpi.c
>> @@ -1451,6 +1451,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>>   	union acpi_object *out_obj;
>>   	acpi_handle handle;
>>   	int result, ret = -EINVAL;
>> +	struct acpi_device *adev;
>>   
>>   	if (!dev || !retry_interval)
>>   		return -EINVAL;
>> @@ -1464,11 +1465,27 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>>   		return -ENODEV;
>>   	}
>>   
>> +	adev = ACPI_COMPANION(&dev->dev);
>> +	if (!adev)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&adev->power.aux_pwr_lock);
>> +
>> +	/* Check if aux power already granted */
>> +	if (adev->power.aux_power_limit) {
>> +		pci_info(dev, "D3cold Aux Power request already granted: %u mW\n",
>> +			 adev->power.aux_power_limit);
>> +		mutex_unlock(&adev->power.aux_pwr_lock);
>> +		return -EPERM;
>> +	}
>> +
>>   	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
>>   					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
>>   					  &in_obj, ACPI_TYPE_INTEGER);
>> -	if (!out_obj)
>> +	if (!out_obj) {
>> +		mutex_unlock(&adev->power.aux_pwr_lock);
>>   		return -EINVAL;
>> +	}
>>   
>>   	result = out_obj->integer.value;
>>   	if (retry_interval)
>> @@ -1478,14 +1495,17 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>>   	case 0x0:
>>   		pci_dbg(dev, "D3cold Aux Power %u mW request denied\n",
>>   			requested_power);
>> +		adev->power.aux_power_limit = 0;
>>   		break;
>>   	case 0x1:
>>   		pci_info(dev, "D3cold Aux Power request granted: %u mW\n",
>>   			 requested_power);
>> +		adev->power.aux_power_limit = requested_power;
>>   		ret = 0;
>>   		break;
>>   	case 0x2:
>>   		pci_info(dev, "D3cold Aux Power: Main power won't be removed\n");
>> +		adev->power.aux_power_limit = 0;
>>   		ret = -EBUSY;
>>   		break;
>>   	default:
>> @@ -1500,9 +1520,12 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>>   			pci_err(dev, "D3cold Aux Power: Reserved or unsupported response: 0x%x\n",
>>   				result);
>>   		}
>> +		adev->power.aux_power_limit = 0;
>>   		break;
>>   	}
>>   
>> +	mutex_unlock(&adev->power.aux_pwr_lock);
>> +
>>   	ACPI_FREE(out_obj);
>>   	return ret;
>>   }
>> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
>> index aad1a95e6863..c4ce3d84be00 100644
>> --- a/include/acpi/acpi_bus.h
>> +++ b/include/acpi/acpi_bus.h
>> @@ -294,6 +294,8 @@ struct acpi_device_power {
>>   	struct acpi_device_power_flags flags;
>>   	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
>>   	u8 state_for_enumeration; /* Deepest power state for enumeration */
>> +	u32 aux_power_limit;		/* aux power limit granted by bios */
>> +	struct mutex aux_pwr_lock;	/* prevent concurrent aux power limit requests */
>>   };
>>   
>>   struct acpi_dep_data {
>> -- 
>> 2.34.1
>>
--------------fN6Y1dzNJEWhXZJs03x9YO5Z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-09-2025 00:06, Bjorn Helgaas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250904183659.GA1271032@bhelgaas">
      <pre wrap="" class="moz-quote-pre">On Thu, May 29, 2025 at 04:46:45PM +0530, Badal Nilawar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">For given root port allow one Aux power limit request.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please include the reason why we do this.  I don't think we need it.</pre>
    </blockquote>
    <p>&nbsp;This is added as aggregation is not supported.&nbsp;I will add the
      reason.</p>
    <blockquote type="cite" cite="mid:20250904183659.GA1271032@bhelgaas">
      <pre wrap="" class="moz-quote-pre">

PCI Firmware r3.3, sec 4.6.10 says this _DSM function can be invoked
multiple times with different requests.

We might need a mutex just to avoid concurrent evaluations of this
_DSM function by different drivers; I'm not sure whether there's a
requirement to avoid that or whether the ACPI core already enforces
something like that.  But that would be a separate thing from
aux_power_limit.</pre>
    </blockquote>
    <p>As discussed in patch1 as driver's pci_dev&nbsp; will be passed to&nbsp;<span style="white-space: pre-wrap">pci_acpi_request_d3cold_aux_power(),  will </span>save
      that&nbsp;<code>pci_dev</code> in <code>struct acpi_device_power</code>
      to support multiple <code>_DSM</code> invocations by the same
      driver.</p>
    <p>Thanks,<br>
      Badal&nbsp;</p>
    <blockquote type="cite" cite="mid:20250904183659.GA1271032@bhelgaas">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Cc: Rafael J. Wysocki <a class="moz-txt-link-rfc2396E" href="mailto:rafael.j.wysocki@intel.com">&lt;rafael.j.wysocki@intel.com&gt;</a>
Cc: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
 drivers/acpi/scan.c     |  1 +
 drivers/pci/pci-acpi.c  | 25 ++++++++++++++++++++++++-
 include/acpi/acpi_bus.h |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..9ae7be9db01a 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -745,6 +745,7 @@ int acpi_device_add(struct acpi_device *device)
 	INIT_LIST_HEAD(&amp;device-&gt;physical_node_list);
 	INIT_LIST_HEAD(&amp;device-&gt;del_list);
 	mutex_init(&amp;device-&gt;physical_node_lock);
+	mutex_init(&amp;device-&gt;power.aux_pwr_lock);
 
 	mutex_lock(&amp;acpi_device_lock);
 
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 87f30910a5f1..d33efba4ca94 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1451,6 +1451,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 	union acpi_object *out_obj;
 	acpi_handle handle;
 	int result, ret = -EINVAL;
+	struct acpi_device *adev;
 
 	if (!dev || !retry_interval)
 		return -EINVAL;
@@ -1464,11 +1465,27 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 		return -ENODEV;
 	}
 
+	adev = ACPI_COMPANION(&amp;dev-&gt;dev);
+	if (!adev)
+		return -EINVAL;
+
+	mutex_lock(&amp;adev-&gt;power.aux_pwr_lock);
+
+	/* Check if aux power already granted */
+	if (adev-&gt;power.aux_power_limit) {
+		pci_info(dev, &quot;D3cold Aux Power request already granted: %u mW\n&quot;,
+			 adev-&gt;power.aux_power_limit);
+		mutex_unlock(&amp;adev-&gt;power.aux_pwr_lock);
+		return -EPERM;
+	}
+
 	out_obj = acpi_evaluate_dsm_typed(handle, &amp;pci_acpi_dsm_guid, 4,
 					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
 					  &amp;in_obj, ACPI_TYPE_INTEGER);
-	if (!out_obj)
+	if (!out_obj) {
+		mutex_unlock(&amp;adev-&gt;power.aux_pwr_lock);
 		return -EINVAL;
+	}
 
 	result = out_obj-&gt;integer.value;
 	if (retry_interval)
@@ -1478,14 +1495,17 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 	case 0x0:
 		pci_dbg(dev, &quot;D3cold Aux Power %u mW request denied\n&quot;,
 			requested_power);
+		adev-&gt;power.aux_power_limit = 0;
 		break;
 	case 0x1:
 		pci_info(dev, &quot;D3cold Aux Power request granted: %u mW\n&quot;,
 			 requested_power);
+		adev-&gt;power.aux_power_limit = requested_power;
 		ret = 0;
 		break;
 	case 0x2:
 		pci_info(dev, &quot;D3cold Aux Power: Main power won't be removed\n&quot;);
+		adev-&gt;power.aux_power_limit = 0;
 		ret = -EBUSY;
 		break;
 	default:
@@ -1500,9 +1520,12 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 			pci_err(dev, &quot;D3cold Aux Power: Reserved or unsupported response: 0x%x\n&quot;,
 				result);
 		}
+		adev-&gt;power.aux_power_limit = 0;
 		break;
 	}
 
+	mutex_unlock(&amp;adev-&gt;power.aux_pwr_lock);
+
 	ACPI_FREE(out_obj);
 	return ret;
 }
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index aad1a95e6863..c4ce3d84be00 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -294,6 +294,8 @@ struct acpi_device_power {
 	struct acpi_device_power_flags flags;
 	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
 	u8 state_for_enumeration; /* Deepest power state for enumeration */
+	u32 aux_power_limit;		/* aux power limit granted by bios */
+	struct mutex aux_pwr_lock;	/* prevent concurrent aux power limit requests */
 };
 
 struct acpi_dep_data {
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------fN6Y1dzNJEWhXZJs03x9YO5Z--
