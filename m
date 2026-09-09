Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7AAC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3A310E1C8;
	Wed,  9 Sep 2026 15:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeUxFX47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398510E1C8
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788967981; x=1820503981;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gJpRufp6Z40kl42O+OL6UrJ0IXRzsWNc4svYA4bcLm8=;
 b=CeUxFX47NYPehqPmHbko1pogCCKxxC5oQ0At6QLAG+Nkps2GmHxn1QLa
 GlBGkIIGoIK2M93jJDZwEm3TZO7NrvJqRgbs/xs9xJmzmxI2nfjedU0d0
 MfrhM/f0MFN2hjNTm8nMDKAEVaz1KCYAZrWB+lNC55+GajpeJKE+6pL/u
 ezkGFUlwVUAmE4kpxy+cyoQ6h4DrQCpIYhxbUq/UsbjYKYJef6Xxdi6ps
 k0MxjZTS7olIxCVdbD4hzokW+fouBAwt+RuArvvJJSqK9uwbXZqm5nWhL
 M2AUyrcfoVVtjdp+V0UinX4oRnC/t0QvubwZ7cQ2/bYwwM7SYhA0U8lBC w==;
X-CSE-ConnectionGUID: aRfbjB0aSDeBplYZSLxRsQ==
X-CSE-MsgGUID: LhMcrbGXSuqB286n3/beVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100560550"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100560550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:33:00 -0700
X-CSE-ConnectionGUID: Q+8nTM0iQgWsiubW8MNf7g==
X-CSE-MsgGUID: 1JUn7V2QQUWcc5BvdAfhcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270865257"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:32:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 08:32:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 08:32:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 08:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiIe3XZzlNaoUze/jDTG/04jlbiSfl3Qxp9aS8GDeuRUVM4wfJqNOMo/EaQ2lOTJv/BLmZS6UFoZGvPOmkDchXXFa2FPsLBJrJe2ehml2iuE8zqefkHAWMTGWe2uF5lSaX4f7HQxoe0JpBfEz656QOTnT28bI4i0y1KsK4bs82h5F8EhLjzZD1tLmKtKYry2TG5wdn2OFhBqyGABz2WJ31Sz1T2jeP5VHvVOGbneBOu70TxNvNdQ+5pGPRe6b21qLEWq9z7blB7vyJwd0FoXWu+ShDaatMvOF2kKcqr5NH5t0kb2IsNfD+ZvdpiMGQEgyebj3W7ieW7FuocCccrWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md3Mz1z7gjPK2UDnieA6+RUmbIqxEFlSQ6OxtluYr5I=;
 b=q8nnX+xaNu/KdKxqODjN/mWJAZUuC4ewrFHEvuaSgnTdPhMGhL7cHY9ocuPHW4CYRCMLP2q56XGFm+nSoV+NJv1lxlHcIir89vkiwMTClqNX1fE8bQ4KAkTO2sfCVLIxyn+pII9s2uWv3VzcE462Cqt5go9f7JxslFjlgY8VWOffcxvFnGHpeQ+EeQG2N1302jifVgQEtV7o9E5qE2mXbKEYc27SEQA6RvYOS1yCtK09XGmg0L3nvTWrLuNFHTAio4BvPpaeJPVUx4/++GGe3FbOyM+7ieVe2N50rIGh6rq4G0rL9jLIt7wFN9hmrQEMteYFi8Op+iAu1mMYN0mIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 15:32:55 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:32:55 +0000
Message-ID: <9c8c6067-5dff-4648-b23d-437161a0c043@intel.com>
Date: Wed, 9 Sep 2026 21:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-5-badal.nilawar@intel.com>
 <aqBZXRgr6epDvWmE@intel.com> <570c3776-1157-4d3f-985b-330caa7ca769@intel.com>
Content-Language: en-US
In-Reply-To: <570c3776-1157-4d3f-985b-330caa7ca769@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 65353d50-2218-4396-4090-08df0e879e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|3023799007|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 6B2zKbKz2EQ6dhFspsarDQrQUgqAb6LEENIjfTlp/vvOhDOipJ2wHKsZSDAhgl8EojQQluJZ7bQGq7FP2VRhQVHRIOjbbFOgjdHkclKu0ufhiA5ctriDpSx9v1LMG2vxaioEj7TX8CFigDF26XXUrgo27MXaVugbBnaq/XMirh8+2fgEm1J0ekXKLk2HD2kmB6EyXQrDoe7itAQAKsBr5eypKbrxna+kOnQfu/lDDx13DrgUmV1G9V7X4nk3B52Pw8NYvw9WH5YjGqgpS9RtWiwA9KJTK9nW24TFvWmA5dgvuGxeuK9d4c7+U22kzZKRyV5wgsA/iOxyC8CEVMHxULYJ+KzpLrvzjOBH7ssVPpWZFW+d3HevMzeQaRECntFLGopXcbF8TS7jkRlrZL2eLljPx2XgjLpiJqrnzEa5J3k/v32ksV2CdrLhAtNQhDI8Xt+V21mrr0HuDfcMmlt5Gfa+5Mdmz10hl8Pvfdrx3fVkdesLaAtRjO36T3opdhArE2koU1uUKDqyWwF7LPEPk27o2roowXsm93LeC6V0BKeFtpDtfDxVvxLck7rk8aG7t2/GW4CyOZg30KyNqAtBmUrLUSWcO+n58XaWohFSsnFsADj+CvYucOSOmnNn6GeG68CRu6WYaW96Qm3t6O4bpP0OhgIN3DgBNp9hnUvRgPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cndNdkpwSDJqamRna0Z0WWllOW9CS3BvYnA4b0hEcGY1d2RMRmZMSjNMUzRh?=
 =?utf-8?B?RHpEbXZOUVNZYjNhSEJTM1M0N1BQMUZCdXI3bU9OK1JWVGg1YjZlck13ODFo?=
 =?utf-8?B?cnBmdkhtZ2VBcU1mWFl3bktYWUhPTUE5QmdITmtWUUljNEd0cU50cGgyVWdl?=
 =?utf-8?B?OVVlbU1leFlZT01OMkFIQmVwYUpjMm13bitjOTJ5VzlqaWRrSmlLU0Q2ZEJF?=
 =?utf-8?B?YkY3dTJLUk9jMTh4a3d6Y1QxRGdjUnRkOWlxdzA0OXJYV2YvbzFGVkIvdFRv?=
 =?utf-8?B?QnozTjA0cDN2NXluOGJFU0dtN2kzSG9TTnRqM2tzRVdvdTNucWlIamVvdGxt?=
 =?utf-8?B?WDNWOUNIem54NVlXeEtFVjNEZkp4cVhYZUxqMndlK0FGa1B5UE5IWklXa2JO?=
 =?utf-8?B?NmFCL0dDV2hBendjUnVCWnhYTHVvZ01LME5WVmpib2JZbmZjVVhTN0p1UUcw?=
 =?utf-8?B?blRHSkNhRGs3ZTZVUkNYQVhwWUp6NHFwSFpQbE5HR1F6SmhTMnhzR3N5c0hE?=
 =?utf-8?B?b2hWdmx3Y2h5bmJQbjVlOUJNRWxLbXBSWGl5Q2U2NFIzQjBGV3JYMGJBM2c2?=
 =?utf-8?B?cW9SN05jaGhraHd3OFpENGRFbVZyb1FWbDVWclVYMi9hYlFjK3BNUmN2MWtO?=
 =?utf-8?B?b2xlY0ZRS2FENXJsREJmR3dZQnZkb0tQTk5BYnFNbTEwelc4WmRGanNaNWJK?=
 =?utf-8?B?MXU1aXMzdUhwbGxtUzE2cG04bU5kUzhweFJKS1VNcjRiQVlWdmZGWTJCenVn?=
 =?utf-8?B?ek8zZ2xPZ2JKbktkWWlZbnI0c1FqakJzMkxOaDF6RFEva2xVQmIwRjN4eHFQ?=
 =?utf-8?B?Z2pHSU1rNG1sVlduKzNtQU1hQktVLzVjcDRMWWxxbmd1M0loc1dkUTI3aWNk?=
 =?utf-8?B?alFaVUc5aUIvL0gxRWxnUXhZOHVCMk9CWDdJSS93OURQdzkzWURiZ0pVbVVK?=
 =?utf-8?B?WXFvV040YzJNelVGUkp4UmsrZTdIRXZ5cUMza2hJQ3dLMDUwZWEwdTN2aG5M?=
 =?utf-8?B?bEN2WW05MWhyN2dqSXJtaEUzRldJbVN1cDVHdlJLSHhGbkJZOEpVd1M1ZDdZ?=
 =?utf-8?B?Q1NjdWMyTGtET1FuRC9VVk5nY25tdkY4MVA4VnJxTk9YVGcwaGRMN3I2WnA0?=
 =?utf-8?B?cmlwUk9tRUQwTmxMS1R6UWZYcDZCRy9SL0lFQWNXSGpLL0Jsa01GKzhiTnZX?=
 =?utf-8?B?RnNBdlRHM1NYYVZOajgzaWZJaGVMNjN2bSszeVRPSTUxZ0xwckJwSWR2UVZN?=
 =?utf-8?B?eGgxbnVNYUo4SDBRR2EvaTFiTDgxbk1pMm1mUUVUWVVvaXVoSGxyL0JyYzNr?=
 =?utf-8?B?NjVjWTBYSjZHeWRsRTZqM1p0d1E4T0RzMHMzWjQ5M2I4Y1YvK2d1V0dRMDYv?=
 =?utf-8?B?aFZPdTlZb3A4ME1rMGdld2w3eis5bktqWXg3RFpVS3pnNElLTGZROU1OaHZh?=
 =?utf-8?B?RHVpd0FzRlNCbUE2VXdiN05vbG9NOGV4V2RHNjdXUmNSYXdSdXFSMy9vVDdy?=
 =?utf-8?B?MzVHazFzSmpTL3Yvdmo1T2VsOTNKMU5EWG9iWHB6Q2Z3ODFzbmxKaTdCcnRU?=
 =?utf-8?B?UWpRekxJc3dBSDd4b3N5SXBqMzNKbmhyd3NIRnZrc2RuMEdYK3dNSHFWUW5o?=
 =?utf-8?B?ZkNBWFFtTWNoV2w1TENCTWorMGRJUXJoY1RKSTlzSjJ4b09uQlVHaGs4eDRM?=
 =?utf-8?B?MjZZaFQvNksrWFd3Z1NNeGt2RU96QTNGMllDUzJOeGt6bnNLRHVjaVdsbUtp?=
 =?utf-8?B?emVQWldMSEM3SXJSUm9Qb05KdjR5aVE4RVhzaHpnNk54RWtMYTdCOFJEdTNW?=
 =?utf-8?B?QkRad3MvbkJObFpVazhJb0g2Ni9PdHc0RnlucnlrRGZpc0k3WUloZFdwaVE5?=
 =?utf-8?B?U1Fid3Vqc0pvRkRJQ3FnRzE5RnNwaTNORTErWUFxRU9yWEM5aDVWZzl3V1Ey?=
 =?utf-8?B?UDlMNjJDRnRnTjFmNUpiTTM3ZGdIeGdYYlJXWC8zbkthbVRvVGN3RjhPZnlQ?=
 =?utf-8?B?RGJhR0U2YTZ1NUxuVDJvRW91SnpOeU9mMDJGdEo3UEVkM1hySklFRlo0RWU1?=
 =?utf-8?B?elBUSENWeFl4LzNEMmdxTU5aNXZSRC9sdzhuZUs4eit6RVBVMEJwOVQvYVVj?=
 =?utf-8?B?RnF2bVNoZ3dOWW9OUUpXMmlkTjk1V3NPUGpHSnZyR0JOMmFOYytpaXBUelFE?=
 =?utf-8?B?UGM2c0xMcEVBVmorQzJHK1hjWDVIcjQ0WCtlN2lNVVZYcFJiUnBaRFU0MzFK?=
 =?utf-8?B?dHlMTGZxMUpkUS9qbjRWcktzTW1jSWo1YVBEMDJrNmFvR01kVi9Lb0tvazkw?=
 =?utf-8?B?R1E3Nk1uN2JXQjYvQ3FJdWE3KzM4UmtHRzZYTkhZQm15S3lVN0VOVjBnZ0tp?=
 =?utf-8?Q?fSxe1xW6mUFsMQkI=3D?=
X-Exchange-RoutingPolicyChecked: ZmL8u+z0wUPeBgQ56GzshgrRUyENd584W+wyfp7eaAzXp1rps2jgiN+HlFIG6oVe3f+X1Hc6VvJGzycRQD96zVXuUlI7HUY31wZ/TzrftX1/iofUtJ3dv0tC4aqDvv8e806HnyC1Vy5nseq1xnwti65HYvuwJkqOEn7ubE94Il+LT+Pb4pOzEhSXto8WgE/Bcq6EOl9fUNztCQH6DloUBMzdoAFb/d7WlWxlXMvhNotnp9xV9yJz877m3PaOxWCyRYOTs99lpWGCMeo/qHVwuq2j3leD2dj+2hgrgEWq7cCwpIn6i1D7KIUPrzwmRoFk6Rd/lQScOc5exize2oy5gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65353d50-2218-4396-4090-08df0e879e53
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:32:55.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlaMY4nx3345pW48IpryBdiZdh+o7fQBigTG1H2Dy2VzeQjuIO/m/OaY8oSA6HH+MCYcki/rGCqDT2fwPC7ghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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


On 09-09-2026 19:57, Nilawar, Badal wrote:
>
> On 09-09-2026 00:22, Rodrigo Vivi wrote:
>> On Fri, Sep 04, 2026 at 09:36:10PM +0530, Badal Nilawar wrote:
>>> AMC raises an SMBUS alert before performing a power removal or
>>> power-cycle operation. The xe driver then places the device into
>>> vendor-specific wedge mode until the recovery is performed.
>>>
>>> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
>>> identify the required recovery action.
>>>
>>> Assisted-by: Claude:claude-opus-4.8
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>> v2:
>>>   - Created sysfs during i2c probe time
>>>   - Fix Documentation (Rodrigo)
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 +++++++
>>>   drivers/gpu/drm/xe/xe_amc.c                   | 61 
>>> ++++++++++++++++++-
>>>   2 files changed, 79 insertions(+), 3 deletions(-)
>>>   create mode 100644 
>>> Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>> new file mode 100644
>>> index 000000000000..4e5389163dbb
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>> @@ -0,0 +1,21 @@
>>> +What:        /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
>>> +Date:        September 2026
>>> +KernelVersion:    7.4
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This file exposes the reason for the most recent Add-In
>>> +        Management Controller (AMC) alert on Intel Xe platforms.
>>> +
>>> +        An AMC alert is delivered via an SMBUS interrupt and causes 
>>> the
>>> +        device to be wedged, requiring vendor-specific recovery. This
>>> +        attribute is created when such an alert is handled and is
>>> +        available to all users as read-only.
>>> +
>>> +        Read returns a single line containing one of the following
>>> +        alert reasons:
>>> +
>>> +            Firmware Download
>>> +            Thermal Trip
>>> +            OOB Request
>>> +            OOB Reset
>>> +            Catastrophic
>> please make this non capital letters and no space
>>
>> firmware_download
>> thermal_trip
>> oob_request
>> oob_reset
>> catastrophic
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
>>> index 8ecadee6eea3..c2d516c76502 100644
>>> --- a/drivers/gpu/drm/xe/xe_amc.c
>>> +++ b/drivers/gpu/drm/xe/xe_amc.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_i2c.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_printk.h"
>>>     /**
>>>    * DOC: Add-In Management Controller (AMC)
>>> @@ -46,6 +47,7 @@ enum xe_amc_alert {
>>>   };
>>>     static const char * const amc_alert[] = {
>>> +    [AMC_ALERT_UNKNOWN]        = "None",
>> shouldn't be unknown?
> It can be unknown.
>> shouldn't be in the list above?
>
> Not required, as only valid alert reasons result in the device being 
> wedged and subsequently exposed to userspace.

I will add both states "none" and "unknown".  "None" will indicate that 
no SMBUS alert has been received so far, while "Unknown" will indicate 
that an AMC alert was received but the alert reason is unrecognized.

Thanks,
Badal

>
>
> Thanks,
> Badal
>
>>
>>>       [AMC_ALERT_FW_DOWNLOAD]        = "Firmware Download",
>>>       [AMC_ALERT_THERMAL_TRIP]    = "Thermal Trip",
>>>       [AMC_ALERT_OOB_REQUEST]        = "OOB Request",
>>> @@ -56,6 +58,8 @@ static const char * const amc_alert[] = {
>>>   struct xe_amc {
>>>       struct xe_i2c *i2c;
>>>       struct work_struct work;
>>> +    u8 alert_reason;
>>> +    bool sysfs_created;
>>>   };
>>>     struct amc_header {
>>> @@ -104,6 +108,45 @@ static const struct amc_request 
>>> amc_get_alert_reason = {
>>>       },
>>>   };
>>>   +/**
>>> + * DOC: AMC Alert Reason
>>> + *
>>> + * On Intel Xe platforms, AMC sends an alert notification via an 
>>> SMBUS interrupt
>>> + * to notify events such as firmware download, thermal trip or a
>>> + * catastrophic error. See enum xe_amc_alert for the full list of 
>>> reasons.
>>> + * Upon an AMC alert the device is wedged and requires 
>>> vendor-specific recovery.
>>> + *
>>> + * The alert reason is exposed through
>>> + * /sys/bus/pci/devices/<BDF>/xe_amc_alert_reason
>>> + *
>>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>>> + * specification.
>>> + */
>>> +
>>> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
>>> +                    struct device_attribute *attr, char *buff)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>> +    struct xe_amc *amc = xe->i2c->amc;
>>> +
>>> +    return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
>>> +}
>>> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
>>> +
>>> +static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
>>> +{
>>> +    struct device *dev = i2c->drm_dev;
>>> +
>>> +    device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
>>> +}
>>> +
>>> +static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
>>> +{
>>> +    struct device *dev = i2c->drm_dev;
>>> +
>>> +    return device_create_file(dev, &dev_attr_xe_amc_alert_reason);
>>> +}
>>> +
>>>   static void xe_amc_work(struct work_struct *work)
>>>   {
>>>       const struct amc_request *request = &amc_get_alert_reason;
>>> @@ -158,10 +201,15 @@ static void xe_amc_work(struct work_struct *work)
>>>       case AMC_ALERT_THERMAL_TRIP:
>>>       case AMC_ALERT_OOB_REQUEST:
>>>       case AMC_ALERT_OOB_RESET:
>>> -    case AMC_ALERT_CATERR:
>>> +    case AMC_ALERT_CATERR: {
>>> +        struct xe_device *xe = i2c_client_to_xe_device(client);
>>> +
>>>           dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", 
>>> amc_alert[alert_reason]);
>>> - xe_device_declare_wedged(i2c_client_to_xe_device(client));
>>> +        amc->alert_reason = alert_reason;
>>> +        xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>> +        xe_device_declare_wedged(xe);
>>>           break;
>>> +    }
>>>       default:
>>>           dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", 
>>> alert_reason);
>>>           break;
>>> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>>>   int xe_amc_init(struct xe_i2c *i2c)
>>>   {
>>>       struct xe_amc *amc;
>>> +    int ret;
>>>         amc = kzalloc(sizeof(*amc), GFP_KERNEL);
>>>       if (!amc)
>>> @@ -185,11 +234,17 @@ int xe_amc_init(struct xe_i2c *i2c)
>>>       i2c->amc = amc;
>>>       amc->i2c = i2c;
>>>   -    return 0;
>>> +    ret =  xe_amc_create_alert_sysfs(i2c);
>>> +    if (ret)
>>> +        kfree(i2c->amc);
>>> +
>>> +    return ret;
>>>   }
>>>     void xe_amc_exit(struct xe_i2c *i2c)
>>>   {
>>> +    xe_amc_remove_alert_sysfs(i2c);
>>> +
>>>       if (i2c->amc) {
>>>           cancel_work_sync(&i2c->amc->work);
>>>           kfree(i2c->amc);
>>> -- 
>>> 2.54.0
>>>
