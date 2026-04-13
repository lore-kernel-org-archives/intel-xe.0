Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252DAEBFD1E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB9510E397;
	Mon, 13 Apr 2026 09:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFWHH/hO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19A510E397
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776071186; x=1807607186;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UB7mCUBfuU2DLjWov68biE6XK/N02rz6+c5/pqrIvGA=;
 b=JFWHH/hO5+GUr/J6wZ31y3hXhlu9BEBnT75SfAS6awM3cGirdAjdpeFJ
 PDPKcRLD+rgloNHC7UhNgd3xXOHqwSFSDe/GUfNCQ7QIgpqxOr3nJ8uWd
 uIVrzZ9DO57kk9khfBw5KHQfWVF/yZcJbaJUBLKtM5gj76dIJm5EvGbKG
 TE9KZPLzLDOgvEBzupdo9fTGk72reA+SCWoZ2xVsZ6BjiyvaY7d6TXEwR
 U+mlKAW018j6opbhuzzsQljYJYUSx5Ib5zbqCX0+LSUK8UXrmHhOzK8wx
 jFoptXS9vWlUWQLYAUF3aKLfTORFETaQmDlMBKEZ8UTJANoyYnjHdvpSA g==;
X-CSE-ConnectionGUID: F5fbmyrERAO11dan/bi07A==
X-CSE-MsgGUID: kN6WleTJTQilnHQeZF5sWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76910589"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76910589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:06:26 -0700
X-CSE-ConnectionGUID: WiwaM+vRSPug9iIGaQohug==
X-CSE-MsgGUID: hIyY88D0S368Q6bjsWWvZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="253128836"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:06:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 02:06:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 02:06:24 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 02:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZSuH0/umIP+ez5WFFTr7cMOwxdPmMiylXEbfFzVDX702OI0D5/L9zxVPmh4wMIfBU3KMQ2b9gNfrYXAW9cnjJOqpMgPHRQGHSeAt98wH8jrFLxneu6fJNEdd+mEr9KIfjCwaBCXZVSKqzmLPbhKmRuiFPEggla1dZCrbdXUMysPpWjVnM2UjOjKBgitA3r5GBZ0Zt2eV/HyGuCKU7byMtfPix1b8lLvMqI+EMi90fciznYXi+b3qMnMm/ksgLmWBsdAFcGRONFx5PhdMpJ+fTNwuJQ/HF/q5rErlvz788WiXvOMM6SeM0ZtBltMLoul8HNYVd8lvibNcvaP/5gxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG4T/I9XEfhiq4vgy5FosfwLdIbSw3AqiiyDKmuCZYI=;
 b=R4/3hZDLTexMddvHwBcPpQWCIuwH1yWtqq23YQX6rGX+fhqKTULEvZLnv14+YYGm1UJ21AT3TjhBbGvTvzN78EfBpiVMFf1D3TytkK8XSDGNqwZnZVciI7j60MDFUwSyhi8DX++cV9x8h5Gt4SVu3Q9V3l1VJ08fyv5+HbfU0YMgsay3pIW/xYNHY2rbkldbPZlNbZxYa8iuHxM2ZBwh+hcQAFbpQeC8pMAZ9CgIWOkYBb3b4iOObd1tO1QBJ7GBkLa+TVF8tO86BSulLm/Lan1QbuaZRP6ORAt1lP/EQRcFyivtberpt9H45doCHON/IUgNBbC+ttzL6xYgBz9phA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 09:06:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:06:21 +0000
Message-ID: <236dab1a-9962-49af-84e2-c2b0f08f65a4@intel.com>
Date: Mon, 13 Apr 2026 11:06:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] drm/xe/pf: Derive admin-only PF mode from
 xe_device state
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260409154423.2499340-4-satyanarayana.k.v.p@intel.com>
 <20260409154423.2499340-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260409154423.2499340-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: d3186818-3c23-4c36-3875-08de993bee97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info: t7ZUJ4sr6xQ5XYgxMOvQcFmn2LRvRXvLOpCeNpnTjIJ72Ur81CdhCB1E9o8qvohEfRqOvu/H2WqF33l1XlCLvqBkOtg1kDEzIWmpqY1Ku18QkEY8E4WGX0X4NreoX9hy8j5vDJDX8V79dUC3pZOBaCq3nY4b/amYcQCJUq75YLhGYNaAA91iJoPLzl4ClN3I788Sz8gwpWwvnak2/PsKxjbQ2+r28Lb7LxrbAshIYSJM8S4XMIQL85VQcfAkDlBIZ423ubaWfhr3+a2b31xtcr6Jj8yZeVHJZzZDboMCA50WrXVSXc6j1SaT+FherbExVkeLmesfrXgR42teXcZ3U8DexWW0gGcGUdnM7qpgpcuSa8ZpVu5LOg3nK4R3jbZtxkPho405qpXlzWaxdMFJrp5qUMr+O9BhThRzxfQV1enUXCX5dqharqqJ2eIBQY67i9QdAIuyND0TDUgMkrQ5kK6SDS+M9ImI+xnKQSIVnysk/BJiWHbYk9QRQNobWTeD/qICmXiTN/w41QVdiRMiTf3r7PJLVCrjliyhlPvkSAVnzEafE7lEG8SWlZo6GEENx9Dyb40kVo4Wi/g90F4QRP4Hh11OwwUaPa2Df4ccw1iyeMMLIBrAXxmWZp15Gjl+LVu8yVq6vyQfjyTcxarV/qAKb5t4GpL1Y7TUsPnCFx4j4i7AuC7RTLYAyRC8ftfYb6VP/ZfRRcuCUw9yyAGB/9MU98H3UT4narSZvWP+bnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzdjTnU4Qks2U1gwVU1HSWFmVlduOTUzanl6bWpvYmMrVEZ3d1FVa0d6VHhD?=
 =?utf-8?B?VHRycnlHeHFSdTBHdmRVSXhodU5ZZzNCYjE1VU9PZzArNTR4UjhOaG5DSXM3?=
 =?utf-8?B?ZVpqTUNReDRRbW51MUJEYVNSbkNidjBtc2grdkZHSTNuNTh5ZEMzTlJwVUtD?=
 =?utf-8?B?SVpMZm1VV2Y4cUptNUdHaUNJWUtZcUZaTytxS1ZGZVNuYkkyRVBDK2hyZmNu?=
 =?utf-8?B?OWlvVzYvcXRXcFhNc3oxZDJKNVhsbFQ2dEVpUHBYelgwc1RrK0VFdEtFU3dS?=
 =?utf-8?B?RG42Wll4RzY3c3NFbVJMZGJmL0ZiUUl4LzlOYTIxdHlUblpFOGJsRzIvSG9p?=
 =?utf-8?B?Zzl3M2pLdEhTWEVFTlhTblFPVHJHck1STkVrQmRQUHhlaEVjSHBZYUNvOFky?=
 =?utf-8?B?WGNQNFFITXhqeHFBdWxTclJBNCtKbloyUzNBb09ibHlqR1hQa0RydEpHS1gw?=
 =?utf-8?B?NktKSjdnZm1RYkZQZ2tibi84ZmpGQjczVGo5cnAzcE1Ddm9odU1nTGliSkdI?=
 =?utf-8?B?Wm5JQStWS3l0ZlF3VzZXME5idW40VzFpWEtNcllDakZtTVVwMytnVGpCeVRZ?=
 =?utf-8?B?TkJCcVNmL3BpeWhzY3UrUWkzWW1nTU1wdVN4SzNYRU5zTTNabWY3Mm9mMkFP?=
 =?utf-8?B?VU44ZGVQaDZ4NlNzbWhiSU1ZdHZUR29jZXZGWFNqdldjNE50eHFJczFqMGRX?=
 =?utf-8?B?cWxaemFCeDc1TTFmOGIydFBQRklpVGVoUFpaY01xblBXR2RQWnNIVkY1Wmgw?=
 =?utf-8?B?S1FkOFk5dmVZeGZVMWIzOStBYmNtUk9RaDRrTmVHanh3RWxaM3dNcGpzM3Vw?=
 =?utf-8?B?UG5sRFZ6WENzQTVXb2QvQStOc1FDSkNlMFk0Z3Mwakl3bHY0b1doUkpWcUlq?=
 =?utf-8?B?eFpPRnluNE0rVy9VSkQ4T1VSWUpEZ3M0Q0dqNk5Ldi9qcjFMWHM1bWM2S2dh?=
 =?utf-8?B?WjBvNVZoQmZwVVJVRWlyQStKd3BoaXlBcExzcCtWNlp3b1dkNm8wbEd0dWc3?=
 =?utf-8?B?T29pTGdOWDdsQkNDRklXdkNoTXl3N2sxKzFrYWhWWWJZbEh4SWpTb1E4ZXpu?=
 =?utf-8?B?WlRhU1QwSmJ5d0hTYlgxM0V1RWJkbVd5UTdiMktPOG1jQ2t3R3lGZlp1b0Jq?=
 =?utf-8?B?OXN3TkhSY0UveXR3RTJ5Y0s5MXRGVEtyWFYvSytENW9neHpweU1WY1c1Yys2?=
 =?utf-8?B?dG84aXRhTWhITlpmbE5uNEFNdFpWSGMrRVV1SVpuMzFIMHN1eWt5OXIyVHZw?=
 =?utf-8?B?R1FKMU5JWmlXL0U5amVMaUJNdWVZb2MvSVd4U2t6Q1ZPSUkzdTNCaGFQUXk1?=
 =?utf-8?B?RFBtaXBqbVRZSE84empOQnZlNkxtdkhvOFh4M2VwamEraGh1eVNvVkRuRGdq?=
 =?utf-8?B?c3hYSG1sS25BMC9pWi8yWUdRZG1DRndUZEMwK1JqSnlkMmtWQ09hYWJSWnor?=
 =?utf-8?B?T0gvZnFxR01nckhIc0liRkdOZVR2UHFjeHpNMzMyMTZ1QnZRUXd2ck1ldlFj?=
 =?utf-8?B?RHU3NXF6bUJaUzZiQU9nVFdmRk1CUlllZWdYdldHNUJ4dWg5T1pVVU1aMWRp?=
 =?utf-8?B?SWk1NUQrTk94anZDNGhhV0U1SXBnUG1NWkhEenlKY2Zvc3JUTFZ3c3JacG1l?=
 =?utf-8?B?WXUxZllnWXZ4bVhYcGNwb0NnbXZnczJoSHJkTjVKK3NublNEb28xQ2J0SStj?=
 =?utf-8?B?c0R3MWg0dU1Gb0JxQUNOV2NtSHZraTB5MS85ZkRWRC9XMnZEazlsSUZRSUYy?=
 =?utf-8?B?dVB6SmtaS0lpNnlaUUdLaEZjRVVzNHdtRC8xekpBTXhWY2dCVkVIakZpVWJa?=
 =?utf-8?B?ZHp5SktJUS9uZDZGcDRGZHRxRS84L054S3VaSzgvbmxtRUdqeTBabXNsemJl?=
 =?utf-8?B?VEVGWVpjQWl5Nk9FSUpNZlV1VEQvWldGZ1B6ZDluRzRjV0ZycEJzQ2hBQXR5?=
 =?utf-8?B?ZzZWRXJLR3BXUW5pekhkZXdQOUhnYUZTVlVRQUVFai9HU2pqWTdoSWdEQVAv?=
 =?utf-8?B?aXRDYkZZcEQ1TjVCcVZTNzB1Tmx0bnZzTTFtenBJZVIxSlR2aU1uWVFxaUZH?=
 =?utf-8?B?YzQ4bytlUm1LbXN0K2o0M0JTYUUyVzNpMkVrT2ozYjhzcFZzZyttbDExb0FE?=
 =?utf-8?B?UDJSNjBhd0JzZHFQcnFnNFQ2YXp1SEppVDltL0FpTXcrMTd3QUhBWmZjMFc1?=
 =?utf-8?B?c1h3eUM2QkhhMnUzUlNpVy9NOFVXRGRHaTRWcDQxdmRWRk5lQlA3NW9nVEox?=
 =?utf-8?B?NGZzQ2lYVkZsaGdsNWExWlNoNWRqUnVsVDFDKzNFc3J5blRWSTBleTJyekR6?=
 =?utf-8?B?RWJxN2RWanQzM3RsVnRQR0I3ZnB0a2hMb0ZkakxmaVl0V05heDNJZUFOVUNx?=
 =?utf-8?Q?5VjOJj3YgbkkIumk=3D?=
X-Exchange-RoutingPolicyChecked: mMz2jjYI/h7IESvynYHRooNhH9UH3CIiIdlO5b229PbBDkhmXRLNmk437kABpCz+QkpSSTtOBCe46W//Dd3Z2VV+Zi5tPdKv8LnezEQ4wrVM/hyj/hYlZ5ZkARn+rcoPS6V6rd0JROF1/q1GWZ/qjrZFyHoBLGbRVNTsxNzASOi7BI4Gv5JDDM1+s7nLNOK9eslntsGpnf39rhSnGow+x9Dj0zk3qnHR/aI4bjfyJmiQm1t5UZ4rKWL/qHmgEHFL1UwyqK+gS3Ux/yEhXQqr5tmipfOO/nLXfEWG38AHhsFcOeqh5eXyJaqWy9ZDpuWM8f2vJn/6g/s3/rMSW+B3BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3186818-3c23-4c36-3875-08de993bee97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:06:21.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAMWwfpkWzMdAtq/tdQeyalBuwxNktAETQArL14CoJSgVsbY5NrlFXRBmVy7SM3JX/PBw6e/zdas+JbcjmDDEJotrRTlumWWgjDlwzVdjXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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



On 4/9/2026 5:44 PM, Satyanarayana K V P wrote:
> Stop tracking admin-only PF mode in a separate `xe->sriov.pf.admin_only`
> field and use `xe_device_is_admin_only(xe)` as the single source of
> admin mode.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

small nits below

> 
> ---
> V10 -> V11:
> - Squashed kunit commit into the current one.
> - Cleandup pf_set_admin_mode() as per review comments (Michal).
> 
> V9 -> V10:
> - None.
> 
> V8 -> V9:
> - New commit.
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 21 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.c                |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf.c              |  6 ------
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  3 ++-
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  3 ---
>  5 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index efa8963ec248..524b9f5d2624 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -7,16 +7,33 @@
>  #include <kunit/test.h>
>  #include <kunit/test-bug.h>
>  
> +#include "xe_device.h"

nit: not needed as this .h is already included by the parent .c file

>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
>  #define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
>  
> +static bool xe_device_is_admin_only_stub_enable(const struct xe_device *xe)
> +{
> +	return true;
> +}
> +
> +static bool xe_device_is_admin_only_stub_disable(const struct xe_device *xe)
> +{
> +	return false;
> +}
> +
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {
> -	/* should match logic of xe_sriov_pf_admin_only() */
> -	xe->sriov.pf.admin_only = enable;
> +	typeof(xe_device_is_admin_only) *stub = enable ?
> +		xe_device_is_admin_only_stub_enable :
> +		xe_device_is_admin_only_stub_disable;
> +
> +	kunit_activate_static_stub(kunit_get_current_test(),
> +				   xe_device_is_admin_only,
> +				   *stub);
> +

nit: maybe in addition to below check of xe_sriov_pf_admin_only() we should
also add EXPECT_EQ for xe_device_is_admin_only() that we've just replaced?

>  	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ceddda10f78f..4b45b617a039 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
> +#include <kunit/static_stub.h>
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "display/xe_display.h"
> @@ -445,6 +446,7 @@ static struct drm_driver admin_only_driver = {
>   */
>  bool xe_device_is_admin_only(const struct xe_device *xe)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
>  	return xe->drm.driver == &admin_only_driver;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 47a6e0fd66e0..33bd754d138f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -20,11 +20,6 @@
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> -static bool wanted_admin_only(struct xe_device *xe)
> -{
> -	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
> -}
> -
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
>  	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
> @@ -79,7 +74,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>  
>  	pf_reduce_totalvfs(xe, newlimit);
>  
> -	xe->sriov.pf.admin_only = wanted_admin_only(xe);
>  	xe->sriov.pf.device_total_vfs = totalvfs;
>  	xe->sriov.pf.driver_max_vfs = newlimit;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 0fcc6cec4afc..19f6f8331c8d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_HELPERS_H_
>  
>  #include "xe_assert.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_types.h"
> @@ -57,7 +58,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>  static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> -	return xe->sriov.pf.admin_only;
> +	return xe_device_is_admin_only(xe);
>  }
>  
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 080cf10512f4..b0253e1ae5da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -36,9 +36,6 @@ struct xe_sriov_metadata {
>   * @XE_SRIOV_MODE_PF mode.
>   */
>  struct xe_device_pf {
> -	/** @admin_only: PF functionality focused on VFs management only. */
> -	bool admin_only;
> -
>  	/** @device_total_vfs: Maximum number of VFs supported by the device. */
>  	u16 device_total_vfs;
>  

