Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D21FCCFA18
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 05:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3A110E05A;
	Thu, 13 Nov 2025 05:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eM+aY3A1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F8610E04A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 05:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763012276; x=1794548276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2IV850zeUdIs949xu/3llthSFngElXD/Xi+S4urwFpk=;
 b=eM+aY3A1Neh5HjnWoS8tg8C6vG5iTE1yhSBgluqfPDRVJNG9QyC8yoDw
 jA8WyP99Kaxr+vPgHsM6OkKFyhP2dfI0zDpSv/iBDJYnAFhl5b2HZMnOF
 wHOhxUEUWnC8vQ35qFjKEvnE5lV5Dm6elR8U5g7fNTusCzEms3p9HMykB
 vLb5+9lFJEHLh28OTsHH15Cj3BQfGYNQlmMpx0NLKnJCbBbM3k5FOumr+
 Yk5nwz2+/um2JrSwRYZJOcw9RzCC94rhE7729knwq3HNDSzefd3ZVpmnc
 pv19yOGUv1KZRT10yyd45EwVKCa/5oN4zoWW7Sms7uj0pC9Oyg74Apono Q==;
X-CSE-ConnectionGUID: c/a4vpL7Tv+2c14TVhPhtg==
X-CSE-MsgGUID: iWLJrFQSRg6Gb1AXeFrq2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65241041"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65241041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:37:56 -0800
X-CSE-ConnectionGUID: JrAsPdWTQ9y+nBq99O2cIw==
X-CSE-MsgGUID: jB5SnUVOSdCQ4pSMtoDuFg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:37:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:37:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 21:37:54 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:37:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9CaGpJsO72YCyCvEyci+yo3QhXNxdIoi8Sq9Gcqm0zKkXoA5hdFhp7ris8AezLIjsEDeHlXhziMQw3uavJuqjxf1IZLW1jVCSlbwq10TcgQD6TQGIXeL+xjYHjxCgJaBNvFfD5HecvkkJK1iaL8VqSi8+dJOCZ8Hvmdb9d1DJdyqTfel95lb73CZMkh+XZiUR38wWsdpI2Yz0jaYPrfXmlVJuP4UdA4RA3ujE+QHY97Dbc9enmSrLoKygtwZRqrGqz7mw7eNSZv3jS8jQSCdJ21h0U7Vk0HApsiQ97CJ4xHNkOmwvq6BT/N6X/vg2de86xe3B2g112iJx/iKFdXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOIYReeSSknuwxE590tiIBw8+xWAY8AtuKkOrxatfP0=;
 b=XpDakomE/zBFpt6i1eqZ8EvUzrV5Pj6O5vBWNdmmttX+KwKa+Fb8w6jT3tHm8y1E1c3aRfp6FNQU3KBHfuJKY4g3XM2+1ARTlkX2DmusqhjPaaG0RlHr7SzDacK8ukKgqba2cL8ducSmhmerL9pOaxp+WY5022XQVixJsgZvrSS8XiXt0Xi/DIQuoedn93T8BxodnG/O94NlFRO5d8X7HlyutuSjGfoZOINLSoVbxTyvM/p+705GCO2xD0KLGyVzTssUSTGQgzSgS0qYlakftJ2tVa6RrXLt3QMRgnb9Qq1eDJi7TKUEVvqa36wiadLKt2dsbuOxBjoN+GmD6N2Rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:37:52 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:37:52 +0000
Message-ID: <d3a3c573-307a-430a-8279-ef04ceb8a114@intel.com>
Date: Thu, 13 Nov 2025 11:07:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pcode: Allow checking for mailbox command
 support during driver probe
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <ville.syrjala@linux.intel.com>
References: <20251113044620.537345-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20251113044620.537345-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4c6819-4120-490b-919f-08de2276c979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFg3bW42UDNmQTh5SmlFekhqTWk0YWNHRjczY3BLN3o2OW1FUWtZenlBOU4v?=
 =?utf-8?B?c1l0MjdpUnpZQWR1Ulg0N1ZzQ0dYaC9KM0hiWGVHb0dWaXUvOHU0ZzFORzJw?=
 =?utf-8?B?dllSQ1lKMGkrRk5lcGxvTlVJUS9MelRMbW95Wnh4Q1NDMnE3dmQ5U3AxUEVP?=
 =?utf-8?B?U0pkeWFNdTBKRUdtRlJuTlhoY1J1K0RDc3B6QUFNMHhjUFU5aS8yUmNhN0Ux?=
 =?utf-8?B?L2JzOHl3RUlqa2hXcDYwZnBmS28xTEszZkl4Z1ZpaUQrTVNsUEIzZ1lqLzQz?=
 =?utf-8?B?LzlrZGpRdGhBQnlSMkNvcnd6a25zV25jSmxyZ2MxSElWR2NJZUFzTDdJd2pz?=
 =?utf-8?B?QVZsbExrTnJSb2ZXU3NjYkZDVC9seGhSU25uRytXQ0dzbWVNSHBWMlB5NG1Y?=
 =?utf-8?B?NFJoNkQvd2dDRGlLU1Q4MWxVY0lkVHhYcmtUcm53c3AvVit3NUNteDMyeCtB?=
 =?utf-8?B?NEtqQWZhYmliWmZ0M1UyRTVRSHFFT2RUaFVlL3dscHBZNlVTbFhaL3ltU2Ni?=
 =?utf-8?B?WDNIN3pzVVJaemk3anFKUGhId3lKT3NSdWxtWWRiUkJRSUpWQldDUzBqbTNI?=
 =?utf-8?B?eVNBb2FraWxCN2o0dWs2QVBwVzdqYUJiaExwTmZpYVZNcXdZSjdBM1JBV1cw?=
 =?utf-8?B?SGlxQzBWd0NmMEFTNk9qL2NRQjlQL252aWxMY3NPSXBZSXNTQ3dEaTdHVHVQ?=
 =?utf-8?B?eTNtWmEzclhGdnQ5Zm50MklPRmhNcUtjTmpPc1NzQjdhWlRaZ00rOTdCbXpI?=
 =?utf-8?B?bUY0bjIwZU5lWFZFczRxamZQSTlFYWpsVGpGOHc2ajZhVjlzZy9Ic2ZzakxT?=
 =?utf-8?B?bG9CRG5ZdjBoNFNRNzdsdmRPWEUzcG5kdkJnOW5mTmlOZnRlZjNQNmN4Tmc1?=
 =?utf-8?B?K3pzZ1NzS3J2MUo2U2RFT0ltQ0dzNEFFYzgzZHhqMDRycFJmb2tmSjE3Q0pp?=
 =?utf-8?B?NHB1blZwSEp6MWRqbHIzaFNYRmpyU2d1SDhydEc0aDdETVBWOWFMQTBXVnRG?=
 =?utf-8?B?aUhwS2tPVHBYSlhJVURXTi9hSURzSHF2bHNWSGgwazhlbFRaTzM3M3dETnZJ?=
 =?utf-8?B?cEsyc0taQVJOVDFjK3VDYS9hNGpHZkVyRmRleUx1K09TeVFseGwwMnp2TFVD?=
 =?utf-8?B?WGwrc01kSGd0bGRJWXJScFltdmQ5VDBML1JwaVBLNnRmbllqYnhTaUx3RGZu?=
 =?utf-8?B?eTQ0bVpHN0tHZksxNmtJczdES1J6MEFPMEQwUzIvT3RWRVMrOWZTelp5VDBa?=
 =?utf-8?B?QTZ2ZXVES1kzdWlpT0p6L3dvUDZkeitDRWhab3RVUDR1RFUxU0ZPSEw0NVEw?=
 =?utf-8?B?bUppTDZkdGRDTGVoSGZZQWsyUXE1eUhXcGNLZ3RqbVpiN1BPeFRnbEhnWWRR?=
 =?utf-8?B?aDFQUnY0ZTNxcllleFJLK0o2ZDRIU3dZbjlTSEcvdDlyMHZsblJIQjRtVVpG?=
 =?utf-8?B?bkdwS3J2Z3dDZWV4Qlo3bmRWL2ZFdWhteTdXRnRaRjlWUGgzdkNGcWJ0anFJ?=
 =?utf-8?B?WE8raHBaRG5oRGF4NzhuZVdKTlE4WlRZZDF4a3RkT1NPWHRFdzdoVGlZa3Vj?=
 =?utf-8?B?VGU5ZlFZRTE4SmZ6Nm1RVnZyV1FoVVRMdmZvSHZPbGpOb0ZLUmpzSXRYNE1t?=
 =?utf-8?B?MVRwRStKQzFZdjkvWlFJV085SjlUUGJlMUUxZ1EwNnhXWDZhQUNoS2NWRU9y?=
 =?utf-8?B?VXk0Y2h4eGVqMU1ZbmFHRUF0cVFPaTVxUG5UVW5JZ0xEYm5SbjliTUZwVlVH?=
 =?utf-8?B?Qkg5YXJVT2RPYVFjY0ZLbFhwcWNIY1hHZC9ONm1RY3NsZ2Y5SUVwUEtvK0pN?=
 =?utf-8?B?L05kQVJYZXE2cE1abEVrRGNFalhCeTZFU1BBNzY4ZFNlWXZxRVNFcDBtTWdl?=
 =?utf-8?B?NDlNRXYzZ3VWM2lRZnY3YkdmOFRkcUVRZkdFdmNOcUNNa3J6RDZZVmJXaWRh?=
 =?utf-8?Q?nSRxgpt38Z4xY/Y8OCKhbgBZt5WazX4k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEoyM3NSSVVmdzBOMnd0aFhlbDRheDhSd2tZVmJKTGptbWlDQStiamVjK2Nl?=
 =?utf-8?B?SFp3OTg5TUlUYUduTER5WXBLQUMzRnJoVHM0OXZMUzF4T1pyU3ZMR2FlT0h5?=
 =?utf-8?B?eW9ZTHZ2YmZTVjZZVlhMdENCdDV2OXVYei9HbDlpUVh1ZFU2aWp3WWpqc3N1?=
 =?utf-8?B?d3NSRldjbmtodVAycEZBSDg4czJlQWVHNnVRc1U5SUVTdmMwOEFySE9MNnRs?=
 =?utf-8?B?Ty9ZWitDM2VkM2s2aGtqNThHQW9KUE1KQUdWdDhUWXRSSXM5WjI5WUQ4a3pS?=
 =?utf-8?B?c2dmbXJNR2x6NHV3dW4ybFQzQTVGUzluSlU0K2V5SzJXSmRzMTlqQ2gvQk4x?=
 =?utf-8?B?cjJGVE8wUEhWdFhYWDBXU2hNalpidU5xcG1yelpqTTJwYktUdk4zc1dGb0tL?=
 =?utf-8?B?VzZmVzBOT1VIRVlZQlVMVkVMMW16Q2N4N0FsM0xBSExPUCtLYS9OejBkMmZS?=
 =?utf-8?B?TkJwWm9aMkJ0aU43TnhlbDh1YXh6MHhYUlBWV1hYR2lQVVk2YlNxSGhMcGda?=
 =?utf-8?B?OC9zYkZacDFjbHoySDFhZUNaeUU0eGxXdHpZcVI1YlFWeGZUR01tVDFhbUJN?=
 =?utf-8?B?WlJEMnpiWkdUckpoRUNkWXRpSllzSm0xN053b3M4VHMwMnY0N2VYSlhqcTdj?=
 =?utf-8?B?bVg3bE4vNW4wWFRJS3hBVm4xTmROSlJzVjE3dzRXdFZWY1FxM01VdVBIYTZi?=
 =?utf-8?B?WDdMUDVPR25kV3hGNjgzTytvWjBucE9FbWJRUG5vUGhRNldsT2piWWY1R3hq?=
 =?utf-8?B?b1JLV3hKWWlrTXJIM2l6OEFHZWh5OXJvcUREeDdLUENpaGJ1WjVaZ3hLNSs0?=
 =?utf-8?B?ZDVZdHpYTzhRTWpSUFBpQjVteHdMaFhDNW4xTElhNlllUlltSll0RXVOUlFk?=
 =?utf-8?B?ZURGeitrVFNvYXllYng4WCt1NHFVVFpFbEVLMHZoZkpVTmZVaDJITWJhelZQ?=
 =?utf-8?B?OFV4cEd2eUlPNFdTZlpOdUZ4VUZUaUh2a0hFR2x1ZHlwUHc5dW5Tb29SS2lG?=
 =?utf-8?B?L1d4d0M0SUprZFhWL3JUS0Yvc0xEK09reUFMRlRpV21WaDV4d3JFeXp6UlZz?=
 =?utf-8?B?RExXQkQyTFVkcWRkQ0FIdEVNUjU1NkZFdGJXZlh2TFhCbm5YYmZzbDVsaWoy?=
 =?utf-8?B?eWg4eXhrUnlCRnRxeVF3M252WFVyMG9JY0VkSmN2SWhxamJDc2FTTWtMRzNo?=
 =?utf-8?B?Um9xRGRSd1NhN2J3VHRBdWh0Vmc4bzgrQy83dVdjcmtBc1RkWnNwVHNvTjZp?=
 =?utf-8?B?ZzFkL3hKREttNlBHNWpya1lqaENYM2syZzZzS2RZSjJQQUxwWGxzbDhiK2M0?=
 =?utf-8?B?RHdwTDZoQkUwZmsvbDBDVnJPdTNZSjRsU2NZYUVYWGxpWVhTL1U3dVdEMHo3?=
 =?utf-8?B?ejJncitER2R2bTBqYTgySkY0bXpxbm5rVmhpbjFXZ3I4eXExTm9sL3Y5Y3hE?=
 =?utf-8?B?UmhERGYrQU9lNkZkQnZDQk05Q0c2dWlQWmhPeU1RZ1V2QTN6cCsrMXo2MFdk?=
 =?utf-8?B?TXY2MHdMYWdLS0NwTnk4c2hZd1plaGFUNTNXV2JrYkx3LzhSeUttR2RLcURS?=
 =?utf-8?B?THhmbmNxU05VckpUeld5ZjMvdFJnREovOEdJeHRpb3l4d3pyM0dqRjUrS3VR?=
 =?utf-8?B?RUhJYzBnclcyazVEWE03UjAwMG9Nb1EwZVdJa0JsUEN4VXFTRWxVbU9UWVVw?=
 =?utf-8?B?NWdJWWZISDVTYUVRNkVDV3Y5NnlxRUdRaExibmpCVkhvRjJHaUw5b1dUd2Fa?=
 =?utf-8?B?NkUvWEZSZjhqcFl4dWRlby9NZ3piaDAxa01VWTVwOUhBN3U2ZnFtK1lmZ2x4?=
 =?utf-8?B?aVJMNU9UWExLOTUxSmRrNFBNVHlEYjZGQm5QNjFZeEFYUEszZktCNjhhT25p?=
 =?utf-8?B?ZTRWTjdXSERFWDUweHNsUVJZdHRjeEExRWFmTllydDVVNXZQN0I4REIvQ1Zv?=
 =?utf-8?B?T1poNW42dXZSNm1yRjNOa0hVREFGUlFxcGgzU21RQXpMMFgxT2RLcjIzbnVy?=
 =?utf-8?B?bVZjRFRpQzd1TVdLZGptRExvOWE2azdza1FVTUMvYUtxa1pDMU5lRHBIRWps?=
 =?utf-8?B?UVhDUDZ6T21rOEVZalk2S2RkaGFzeWNXL2dSWUgzNmR2bW51K1A2eEs1elJO?=
 =?utf-8?B?b1Zta3pBVktnZGxJN1JCWjJ0UlR1YUIrK2oxcXhWVDJTTXhHY3BrWDZhZld3?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4c6819-4120-490b-919f-08de2276c979
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:37:51.8860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uULn/W6v1aw6/6Vpm6xdXo2Pj4rU+8WG+Q+B5p1eQWJopoInAMTiN6yN4dyTcpLKPrcs1C2GqJCMIA6aY1zm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
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


On 13-11-2025 10:14, Raag Jadav wrote:
> If the device is running older pcode firmware, it is possible that newer
> mailbox commands are not supported by it. The respective functionality
> isn't useful in that case but nor is error logging, since it doesn't
> particularly signify anything wrong with pcode firmware or device as a
> whole. Log such failures as debug messages during driver probe which allows
> the caller to check for mailbox command support without it being reported
> as an error. This is useful in cases where we want to make a decision on
> driver functionality based on pcode return codes and a relatively simpler
> design choice compared to other solutions like checking pcode firmware
> version, which comes with additional complexity of binding every single
> command to a specific version and deems pcode commands useless in case the
> driver fails to obtain it for reasons unrelated to pcode.
>
> This only silences command related failures and still reports other
> failures as errors, so we don't end up hiding the genuine ones.
>
> v2: Split unsupported command cases
> v3: Add device bound check
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>
> I've not followed the documented device_lock() rule here because
>
> 1. It'll deadlock in ->probe() path.
> 2. I don't know the code well enough to tell if it's really needed for
>     our case.
>
> So feel free to weigh in.
>
>   drivers/gpu/drm/xe/xe_device.h | 7 +++++++
>   drivers/gpu/drm/xe/xe_pcode.c  | 8 ++++++--
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..e8f997546ae1 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -12,6 +12,13 @@
>   #include "xe_gt_types.h"
>   #include "xe_sriov.h"
>   
> +static inline bool xe_is_bound(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +
> +	return device_is_bound(dev);
> +}
> +
>   static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>   {
>   	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 0d33c14ea0cf..0f1edf5155c4 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>   	}
>   
>   	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> +		if (err_decode == -ENXIO && !xe_is_bound(tile_to_xe(tile)))
> +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> +				err_decode, err_str);
> +		else
> +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> +				err_decode, err_str);
>   
>   		return err_decode;
>   	}

This looks fine, as the commands to verify pcode supports for it would 
be there in device probe flow

and we need not log them as errors then, it can be drm_dbg.

