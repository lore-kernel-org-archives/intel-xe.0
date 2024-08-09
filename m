Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B2AC52D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 08:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921710E0D6;
	Fri,  9 Aug 2024 08:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NA0r0bsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3362710E0D6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723192675; x=1754728675;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YdSIgmUmOOpJM2vNEFBoTlSBeCFGBRuSKsXTzvP2cTc=;
 b=NA0r0bsD/xPrfMByDWZTPcWbSO8k13m9QPoDBD55LGGhgLPKyPgSyhP2
 m21gEuEFc8ctXJBOyvTbL1f8v6bujPKR6KRoAwUfdFN0Q/MgWeP8ZFDq1
 39xCTQ9yuj3NboCmAPrwLw0Z0rZAqv7usTbkgpY/4dY6fakRy2izJKB2S
 +r7ud0sossQm6ySknSw0X+FK2wcpOJPRMr3znQNdxYEqOPyiRUCZw13Cb
 kcfqbaQayMvHQgk06liDMEIAumQz0uucplRvl4GY3IRceoM7O6m5eYUpf
 FreqBsvbMK3M3LhPu26c2WHS+eTd2EGhJs9CvsWGpqz36mJy9ZSVjjHD8 Q==;
X-CSE-ConnectionGUID: 1Hb3InD+TrqlOBbsw+O+Og==
X-CSE-MsgGUID: 1zgslAHATH6iO4Zh2RUiOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38809082"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="38809082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:37:54 -0700
X-CSE-ConnectionGUID: dYx2VdX7QgOVI/+O5ZMD2g==
X-CSE-MsgGUID: GYzNOA01Rcyba9PYo8I0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="80738382"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 01:37:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 01:37:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 01:37:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 01:37:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 01:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st3K7hMxlhNA6woLNXxszOKLDPCwPz5BNfC728nU0tw/43mZ5X1KWx5vvk19zZYQDevOJSb/e9B8j1UEjTtE6yYPVsxGs5A94tz1TPU3ylWBhPsT/KRUsyG128qL7OJeZ6+O4uVzvBM8Raugp8zydvPG/fNZhzEYPJkZtWG4M1vNeGYmjC8UpckanKnEBwbj3H2ayhMaJFCaZHuwOUyQEX9VlVYIIIPvuGSyupXUT/aJEvMK1TiGjqjjFGJT3VVUDj6dx6JMmGBJgVi9v1+G10txvUxG2v/T3tln0ZHSqgLQz7bTnkQj713yoZeNXftDYxhKWCudGSMKxMy7uy5+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JHjaahxVE0U+QGNVoBxG4Ha5obt+SjsRfYnCK7Pm60=;
 b=y/cE4kzEIWVS0CfKIcCeU+GhrlnY3Fe1831JACP+Tmwb83SHenbs6tGLZul9MXgztMVR4nJW9a+AEDUjBOgJsknesK0C2v9qahfaWTlflCD8ALkji0yO08Lq8QUjBgj8tlFYYrjuzkFKuA/eC0KuYq9pAjeOCXxunUF4Cyrrzr/05kazyhfXHUwNrILVoTAMmfCssS5EWKbxPhUPSUqGueVr7YMPNih+Xm0rBvDzjZauAthQyQl9KrNJDtO9/ZBoneTv0pzkQOX7p1FXi6IEk3moz8yg/ZtGd2Mwq/0oj5yaRWqDlY92xYyqMZGLJIPqFNCzOb89QbsnhUFlzhh33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Fri, 9 Aug 2024 08:37:51 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 08:37:50 +0000
Message-ID: <fdcaf698-760b-4cda-af60-8b50669c9e0c@intel.com>
Date: Fri, 9 Aug 2024 10:37:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240808091917.5761-1-nirmoy.das@intel.com>
 <ZrWcqcqu/rVyIBZH@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZrWcqcqu/rVyIBZH@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b7b88c-9927-4e43-e558-08dcb84e8dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umh1dzRFNWdLUzNYbDhhQzJkQkpjRzJDSGYxV3pxYzdvaUlUK00wUGJ4S0wx?=
 =?utf-8?B?Zjc3bFgyeWMrUHpDVTUzMmJhckNKV2NyeXpZSXZ6aGx0SWJ5N0NQN3BXaU5n?=
 =?utf-8?B?amh4VUxDQUw0cmVNVmZEcnkvelFjaURpTGlVTHpHaUVJRnlsZXNvNWVRUGFt?=
 =?utf-8?B?TzBRV2VjNEpPRnVEc1ZVRXpEbWY4b2tGQ1VxTGs1NkJkZk1HWDhDTXRsOG9E?=
 =?utf-8?B?dXZMS3Q3clNjSjQ4V2FnQXhaV25LN2xIdkJacENsbGZ3c1BvSC9CbkNwOUxx?=
 =?utf-8?B?VW1OcitVWTBKeVhyTklrZHRncmsyZzFueitQUUh1NFgvbDlWcUE1czZLV0lk?=
 =?utf-8?B?R3RyM1Bic2MwbUtWRURjRkQ1VGRTdFQ1TElHTkw3WDE3OFh3KzVtVWg1TGgx?=
 =?utf-8?B?bmJXVDZTQ1J0ZjhQSmUxYllsblNRVkNLeTFlWXFsVG93UE9YaGFLZVdUNit5?=
 =?utf-8?B?U05kSmJVeElzeFpHU3hZVFJvTTFQeVd5ZVF1dlAvMmd3dzRkTGVsMHB6TVFV?=
 =?utf-8?B?SkRjZHk0OUdHRFNIUTlwQ2dDWmNFUHJjTjdUbUkxSXdnVGF5OGhyb01hU00x?=
 =?utf-8?B?TFFYbDBZUTZkVHk0UDR2cXlDTWZ5OTFzQnowaUY0cHRrZkxFWlcyS3dIbURQ?=
 =?utf-8?B?TXZqYy9WekRkYUtoM0Z0RnI3NjcwMm1MS2RKd0kzdlRMQ1lIV0hnc1gzbC8y?=
 =?utf-8?B?QnZIYjRDVzIwTjZxNURoM000ajNJUnFiS3NaVFZrUUxpVkJTeGNkK0JNSmVD?=
 =?utf-8?B?Yk1mc3pOM0xXV1R3L2tZMUxoOUxFcGxnR0ZYenpFbnV1VDBKcEhFNjlsR29R?=
 =?utf-8?B?OXFwWE1vdGhQT2lSOFkxbUJMajdzSkZOUWJncDBSbFZOaTJxOE9hZHI4czk2?=
 =?utf-8?B?YW1sZlBuUXRlZWh6TEpEMEk5NWFxUHIrWTZnbm5za01BOU5YekZJMHloc2Rp?=
 =?utf-8?B?QXNQb2FNT3Z5SXJIeHdEdThheld3c0tEc3krZS9TSCtYSS9QbTkyYjBUV0F4?=
 =?utf-8?B?L0sxZ3ZlZ25FaDYzTzJtQjVob2VQVjJrdDR0SGxLU05hNzlFZnFjY0VZOGlk?=
 =?utf-8?B?cWtlNTdreU14dDRYdldBbmVjNDNQTEk4RTh6NUc2QlpZMllQeitibXhra1lm?=
 =?utf-8?B?RkIzaHNqZkJHTFRYTUxZc3ZIc2VnRmF6MnRXS3hxYThRNFZ1RndZVmVXdjU0?=
 =?utf-8?B?aFh2RHJEUVhlSWJIdm9pbXNseGh3TCtlMW43bWRUbVN1REliVUozei9zaUox?=
 =?utf-8?B?Zkp6UU8vaWIyaXY5SkRzU3NFSThtd0dPSGhIUXcrY3FIaDJRUWRGM01XN0h4?=
 =?utf-8?B?eEpkdFdTN0JTeEcyd1BSdithVjFpSlRxc3M2VEpuM2VrT1MyRGtHT01kVnJN?=
 =?utf-8?B?T3RhU3VVR0pRR21qWHlJS2hMckp2bVlOZTdzaVB5ODBFMGV2anhMWHgxYnBU?=
 =?utf-8?B?ZW5ubXgyc3ppaWpLWHo1bzJHdXByc2RpcldIZ3kyWE93ZlZ5WGRSNzFrd21r?=
 =?utf-8?B?N3p5YXRsMm5LQWhhbHJlVkpaZWlTMG1haWJqeXlxdWlVQ1VVRjVURmhZMWF4?=
 =?utf-8?B?NEpUZlFaV0JBVWVTMDF4QVdCKzhMcjFuSzJPMmprQXYrQjA4Uk95Qlp0b0JD?=
 =?utf-8?B?LzZCVWswZDJUK0JzcmhZOGx4VEFuOVlxSDVPdExkRFJkc21qOGxjRTVtZUQ2?=
 =?utf-8?B?U0FJSkFGOVVJTlZBVm5GMC9TTmJDVDhyTExLdDJ6SDU5dTZjZDdlelNBZ2Zx?=
 =?utf-8?Q?ooBo0xtXHHgnzMAF/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5VL1Q2LzlyR3JycVpVdFYxYzZySDk1QXA4MlJ6RVE1emhKMC9HV251akhw?=
 =?utf-8?B?aWR0dXZhZWdrWXVYNXBJTjlySyswL2hST0RQWnJVYnlkWnNKSWo3UlhWc2Fq?=
 =?utf-8?B?NGh0b3dNZ0c1TGZHSGM5ZHVzV0I0emx5dXNMT2ZGeTc0QjY5amhKZDZueHBO?=
 =?utf-8?B?amRYWXVQVEM1T1BTMXR3Tkh3SW1IRXN4Z2lGNE9DRGYzYWJGSEpDUXd6azh2?=
 =?utf-8?B?ajFlWnRnUjZob1FEaUlXWndPYVI5cGl6NVhnYllxTFp2Ymc1dTYrMkRFSm8z?=
 =?utf-8?B?M29lWHQ0QWVEREJ6U0hSOXdJU1oxMVVzWFlYRVZ1QTRadUM0UWZwMjdkazMr?=
 =?utf-8?B?RnlmUUpHcjRna05pa1JIU2taZGVHaVplWUxWUDQ3Q1F3S2FLUTZFeEIvRVBM?=
 =?utf-8?B?V3BraC81QTVOZ2tnMnlMSmRkMXpFRUVUS3kyQy90bVo4NzZZS3ltM0YrTGNH?=
 =?utf-8?B?VGVOZk9xNFVRRVRtZkdvZk9XeExEQWFUeTFUcERxYXUxVWx3YUt2YkhSTzEv?=
 =?utf-8?B?Y3NIRkxNbTBSaFVVYzlZU3RVSFlMZGJVb0RrcWMybGZiK3VnUWxGNWQwcEVK?=
 =?utf-8?B?UUhwbUdick5xSGFlSkVrYVl3RjlLMDhlMUliVzhpdWd5ZG9mbjJ4UDREZjVm?=
 =?utf-8?B?T0NPd3FOWjdkNkdjL0Z2Q3VFaHhzeDFOUzZuNDJqYWxsWVJieWNtVTl6Qkpa?=
 =?utf-8?B?T0NBRFlwdExzVXhKTzNmVWdDZFZyamZrOUFzQUZudGhDMzFScWI3SWxxYnlP?=
 =?utf-8?B?OGVhUmtaV2hJOS9CWmc5ME01QVE3cEQ3T3d5VzhLSWIxRDdMWVVlVDQrem1r?=
 =?utf-8?B?N01JN3FXQlZQYStyMlBvMG83TFNENmVJWWMxRnN4N0E5SUFHNExXR0NPTWFN?=
 =?utf-8?B?NzhpcE96TjJXa2FERVNPZ21oWktnSEJ4NGk0SG1TSDNqdkFiODZ3MWhkdDhp?=
 =?utf-8?B?YmRUc1N6L29lS0FUcGYvYjV2YWN6aDBwallENVl3R0pGUXptM2w2dmo0M2ls?=
 =?utf-8?B?R1FHVXkvQS9wVGNCWm90a1hyQUtHNGxUbllCM2RxNUJYSk1TSTREVHluZmFi?=
 =?utf-8?B?RjhYWU1LSU5QdVB4ODhIV1B2TWhiQk95ZG83Y0hwSG1rRjBEMlU0TXJrUTd4?=
 =?utf-8?B?U0syeVd1OWVGbjRTa3BDb0pmenpxT1hEY0RhNnQ1OTl0UTh6V2dxS3A1ZExs?=
 =?utf-8?B?elE5dWdqL3QvQTlWTE41dCsyQ3o0SWttU1FMRTB1UnEydUlQVzFCUTBuby84?=
 =?utf-8?B?MTdMY201dVdDbGo2di9LdFFXM1FyU1pOUjNvSFBuMStBTzBJZGxnbnB2QUVa?=
 =?utf-8?B?c1JZMWZRQ1pEbFRJNXFlVmpCNlQvWFk0OEF4MWtobEs2b0lwY2hhTzhRNXVX?=
 =?utf-8?B?T1lEeVJVaHpFRjBSZlFhTERLVE5acTBtbVJBTlNxOGQ5WTgvSSs3a0VGNW9F?=
 =?utf-8?B?RWlUcXMvdCtqRXpRVnV0T3JEcXRPYmR2eDNqVVR3akVtbFl0b21nbFhHSmJj?=
 =?utf-8?B?TkJDam1yd2FjbG9qeENYOGVjUW52Mms2UVYwTnluMVhFSWY4OENnOVJ0WVYw?=
 =?utf-8?B?N0c1aHl3MzdXcU1CcFpHcnhhdUNxQkhKV2xPSEg3UUJjWGpDZG5iRWtPOEJx?=
 =?utf-8?B?WnIwUVJ5NkRBTmRNNm9pdk5sbG9IaUtFZk1kMlFxVWNLUnk3K3BGRFFURHk5?=
 =?utf-8?B?b2YyYkQ4WW52clNHZzdseVVINTU4RG9KY2JJWFJxUlVKUWJUcXd2MVlPVHlU?=
 =?utf-8?B?VmlZQ2VnZ3FQeDNtcUJMc0J3SlVhd3puSklUa3hSa2JkYkVib3VYYkhBcmhR?=
 =?utf-8?B?aVM1c1A0cjIrR0h6NVRJVUlzL2xCVk1RR2RzUVprWm15V2RaR1l0dnVWWE1I?=
 =?utf-8?B?dVJPcnk3Z0lLNXVTRzNqYS9GS0R1R3NWNWpkRllHR2w0RFRnd3dwRG5MUjJp?=
 =?utf-8?B?LzhDdU9XdjhSNytGa3FvTFVsTFhCRHh0MUh5VmZEVFpNSWRzWUdRN0U5cmdN?=
 =?utf-8?B?UHNwbUNMb1lXQ3JUVzNsOVhacTk0M04rUlZIRUU1anVIWExZLy81eC9oUUgr?=
 =?utf-8?B?WFhFdzlCODVMbkxqQmhGaE1QK3BmQTM1SlhRTzN1Zm9lL3VBNkcyTEw4WVRC?=
 =?utf-8?Q?bP+Lvyg7wILr48VFu/TY0FdFZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b7b88c-9927-4e43-e558-08dcb84e8dbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 08:37:50.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t+txc2ymHzag/DYm14bDe59RmP2vyQtxSrDMCwsaPj7JlIOVbGHl9ClojzDGjdl6sTemX4hD4WzbvM+x6XFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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


On 8/9/2024 6:35 AM, Matthew Brost wrote:
> On Thu, Aug 08, 2024 at 11:19:14AM +0200, Nirmoy Das wrote:
>> Add skeleton APIs for recording and printing various stats over
>> debugfs. This currently only added counter types stats which is backed
>> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>> on production system.
>>
>> v3: s/CONFIG_DRM_XE_STATS/CONFIG_DEBUG_FS(Lucas)
>> v2: add missing docs
>>      Add boundary checks for stats id and other improvements (Michal)
>>      Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
>>
> This will need to be rebased on Lucas's series [1].
>
> [1] https://patchwork.freedesktop.org/series/137053/
>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_stats.c   | 48 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_stats.h   | 32 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
>>   5 files changed, 93 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1ff9602a52f6..390e5652cd89 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -287,6 +287,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>   		i915-display/intel_pipe_crc.o
>>   endif
>>   
>> +xe-$(CONFIG_DEBUG_FS) += xe_gt_stats.o
>> +
>>   obj-$(CONFIG_DRM_XE) += xe.o
>>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..5125d76ccfac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> @@ -286,6 +287,7 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>>   	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>>   	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>> +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>>   };
>>   
>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>> new file mode 100644
>> index 000000000000..74ed9342af91
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> @@ -0,0 +1,48 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/atomic.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_stats.h"
>> +
>> +/**
>> + * xe_gt_stats_incr - Increments the specified stats counter
>> + * @gt: graphics tile
>> + * @id: xe_gt_stats_id type id that needs to be incremented
>> + * @incr: value to be incremented with
>> + *
>> + * Increments the specified stats counter.
>> + */
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
>> +{
>> +	if (id >= __XE_GT_STATS_NUM_IDS)
>> +		return;
>> +
>> +	atomic_add(incr, &gt->stats.counters[id]);
>> +}
>> +
>> +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>> +};
>> +
>> +/**
>> + * xe_gt_stats_print_info - Print the GT stats
>> + * @gt: graphics tile
>> + * @p: drm_printer where it will be printed out.
>> + *
>> + * This prints out all the available GT stats.
>> + */
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	enum xe_gt_stats_id id;
>> +
>> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
>> +		drm_printf(p, "%s: %d\n", stat_description[id],
>> +			   atomic_read(&gt->stats.counters[id]));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>> new file mode 100644
>> index 000000000000..b97363e99ba7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_STATS_H_
>> +#define _XE_GT_STATS_H_
>> +
>> +struct xe_gt;
>> +struct drm_printer;
>> +
>> +enum xe_gt_stats_id {
>> +	/* must be the last entry */
>> +	__XE_GT_STATS_NUM_IDS,
>> +};
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
> I think Lucas wants this to be s/enum xe_gt_stats_id id/const enum xe_gt_stats_id id/

I will make it const.


I think Lucas also wanted to add a build time check for id but that 
turns out complicated as I have to move this func to

the header file as static inline. Accessing gt members in a header file 
doesn't work without adding xe_gt.h that again

ends with recursive include. So decided to keep this as v2


>
>> +#else
>> +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	return 0;
>> +}
> You don't need this as the only caller will compile out without
> CONFIG_DEBUG_FS after Lucas's series.
>
> With the nits fixed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks, I will rebase and resnd.

Nirmoy

>
>> +
>> +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
>> +				    int incr)
>> +{
>> +}
>> +
>> +#endif
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 631928258d71..8e46c0969bc7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt_idle_types.h"
>>   #include "xe_gt_sriov_pf_types.h"
>>   #include "xe_gt_sriov_vf_types.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_oa.h"
>> @@ -133,6 +134,14 @@ struct xe_gt {
>>   		u8 has_indirect_ring_state:1;
>>   	} info;
>>   
>> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>> +	/** @stats: GT stats */
>> +	struct {
>> +		/** @stats.counters: counters for various GT stats */
>> +		atomic_t counters[__XE_GT_STATS_NUM_IDS];
>> +	} stats;
>> +#endif
>> +
>>   	/**
>>   	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>>   	 * register space, but have their own copy of GSI registers at a
>> -- 
>> 2.42.0
>>
