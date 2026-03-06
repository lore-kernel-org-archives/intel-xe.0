Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916DEFCC05D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 19:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40510EE0D;
	Fri,  6 Mar 2026 19:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHCPdBJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D810B10EE06
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772823834; x=1804359834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lPzhlNmNBinbPujsBsVIxajtZiE4j24OYDBKglVqvV4=;
 b=dHCPdBJ1p1pNYGWDGdz4xgcN4mbGhgOTH0fID0nv8khcytx6LoJMvH3A
 Mal4i1DsGTgG2EvlC3kK6k7fG4txSSr5U9S8m4aIVDf/Dn+JygiCM3I8M
 e7xnnT2iM6xn/XTGwAB7zVwRVYY8dwJgDJ79qBnYg/1DiD3/1sSdebGro
 mQnJETtUTIEDxzO3dMxi+39mmReRYlOFMZUS3IUtej5GJFNOkXhSlssPq
 WC/H8YMMXNJv1oE80cP4ktPMRQMwzByeSd/U7ZcQl6Da8U8rT6nH8kjHn
 p6ykdRbj+HpXzv2EiURFS6NdoTZ2/ujAzq8nXHamtEa2g3f9LFJLP8P+D A==;
X-CSE-ConnectionGUID: PeiOZXrRRiiKRDPPBj68bQ==
X-CSE-MsgGUID: 65Fn+5HvQdyBfSM0FTk4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73987015"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73987015"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:03:54 -0800
X-CSE-ConnectionGUID: 6Y1N3GFqTomcTG3b9IoIPQ==
X-CSE-MsgGUID: ae0x4uk7TE2bI2Y0USnp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="219213664"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:03:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:03:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 11:03:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:03:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8VCHK/CuCIqxbk975fId6qSpjo0gEsUFa+sHHoYPuGcQ3AZ51KC3NoB5diQdaNZ3oCEHxIKtJtGeQcjFrsxPRxGbQBtO34y0X9OAm0TXf++QqK+QAxF1jXYIyQi9iDabJkntrKxKZnNQW1MHuaMs8UA7SvJYX9GeOUWjhR/bjjGfE0dyQFhWWfFWpGSdArUCA9Lz0EsJUFrdZUf8YwW/MlmaP7o3bkuffyqbc4gXgfZksHJHR6WWUY3tl6mq4K9iAmiEMKT4OtTjpWWTFg/6VmYHE1AbWTJFkic9Duo0rDyg0iKWrj/WA0zC0tLTq3y9BrWwI0SJ/aSmS7bUkj6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjYcCT5Mdj5vkJNT1WJ/sVxZPs1Ivp8n0jQ2mDnn+7A=;
 b=hy1rdnBu9SgZ2rqLRqzowBdQk72cAVVuX0BAbpGoxPXmWaCLJZv1p1nNWaCXmaKnqJpRy7UM4g+ZSsn1E6rhcv/AK38D91JNI8XoUi52/pS2Scsl9TRJJTUCplBQz5UTqr4LNr388CpZ7AIH/34ByCBAjaWpeaKF2wxZJPwfjaC7DGgJdHGWRX85I2uy4bkVIuPbigYBxPtvd5je/MbWPMKIi0YGI4ggqURqY6qnbyCAdoWgDGXF1aVwP7U90QjjA6JT4ms1eR2mUasx5Ht062I9hD/OPb47MdW9Xw69ETcGGtd+4xbIKp0k0N6HBFqiQRGIKfFa4ixAFk8i3olBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 19:03:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 19:03:50 +0000
Message-ID: <7eceb569-f048-403e-abc4-2b741d51dd7d@intel.com>
Date: Fri, 6 Mar 2026 11:03:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fixup! drm/xe/nvlp: Define GuC firmware for NVL-P
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20260303213655.241442-3-gustavo.sousa@intel.com>
 <20260303213655.241442-4-gustavo.sousa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260303213655.241442-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ec392b-bfba-475c-f7d7-08de7bb31a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 3s4sOJDDAY+HaHyjWJYvIhxBQvyLjuRbxN/hRO9usXckpx2R3yIaAbBzZA8AjUkbXWyn8rA0uWnCvNmUWs3gS8bkMrbc+eQya8YllkqgGLUxnusSbaVp1XF1rt/rMYrSnaEMrr7tCnV394ihSjt/L3ab8FYdUJEH44I1BcB+QR7U6VXp9jnWhYrdI93aM7bt48yMOJHcgz84KwiUMmcZi5zasuX0xf+x+/IEzSPxQ7+tvhMOG57qJplLnn6vIS3Nr638TfZxie2kisL/XZBnNEtrmLOizyHMDeegTiM2yvVsfyDtObzBV1Y4NUa6DXba/u+cdonEoWb0POpziLShix/Ojm4vdmcGd4zf9gVzaW0ONzfRcXn7oB5DARAHokIIDg85KMkHsQKxKW/ZJ0jw/3IEnB3yYX7ym8TwwsWeATmPhyrk6Z7WOjS2U6xIvoDrKfS2nB5QxtXaY9EdyjLngatuLhTk4oe1DQEiQhKOKW6PiZp05AEKB45lZjXdmQTKdWwGGB9ztGKVFhYm9EjwlD5Z3KfS94g5Y2w7AFBFK1gFsaufszLDyTOfHvo0Ppete/nfPPBxId4nnd2WwE8JsXRnE5jsfzQAwJjqyXM1mrrgPjFEHLwzO977dOrTfBnTl9JKZx+qt1dRx5iYn2YIew+g+SOJSH+JQqRLzcFFydP9icNrkp4QwDhpLGWqYkNvoTlykDaA9v9OyvBQCfyednStdGk06aGBvOoMik29ukg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG5EVktYMWdXbXhwSEJraDZsUDhNZDFXVWxQM043Z2VaSEwrckFaQlNFSS9u?=
 =?utf-8?B?UVVMSXQ3ZEhRSVNVQ1dSTjcvaWdYSGcvazlCRTQ2b1ZiOFZ1YTIzVjhvQm1r?=
 =?utf-8?B?bGp4TnQwcTNreU5NdmlyM28xZ1EyZ1lKVW9mVlNzSjRxdm1uaFJJdGZtbUlS?=
 =?utf-8?B?Y0VraXRzWFY2K2Z4N1JrSzYyU2NiQys2U21EbjdZUHBPeFFLdG5iVkU2SU9T?=
 =?utf-8?B?bXYzUUdhZzl5YTVUQ09tM2VwZ0d4RDBrTXZBOVdSaUdLRHNoc2VFQ0JlRTNl?=
 =?utf-8?B?N3pWSVZIc0VBQThCNktpNnozWFY5Sjk3by9oMnVCSUV4SmZsL3lxN3J1dnh3?=
 =?utf-8?B?aS9UbGE0SEF2dWN0bThRbytrbC95R0V2Rm42UlFtUXBWTVlQUEgwYURNV0ZQ?=
 =?utf-8?B?RzR5ZTY0c3Z1UGUwTVRoUjh3YWNxODdhQ04yVExHcFgycUovdDJxNkppSnAx?=
 =?utf-8?B?WlozVkFKSWdFWjZYRHNHVVBSK0U2czFaT1ErUUE2blBoZUJkeHBSMERZUFhH?=
 =?utf-8?B?TTZxUlJPcE01dVA1K3ZrZ1JXb3NFU21zWTNNZWcvNFlJY2g4dkVZYS9tUXdr?=
 =?utf-8?B?ZEtHczV6dVNILzRzOXJWWnVuZWhwZWpUOHN4dWxEQnVWS3k1VWJUNTFiOU1H?=
 =?utf-8?B?aXFHSFZMZ2x2M281SmRBdUZ3UHZFY3hKZGw3NGVHbEdMZ0ppaUozSnNvazdk?=
 =?utf-8?B?VnplNWlFNFcvTHZ3Y0xpVGRrc0VzUHMzRVA3dEpGcDVuSlR0RVROV1h6Vlhj?=
 =?utf-8?B?cEpqUjBaVGlvdm03dVZoYkdIWG9TMm1Ma0lxOGpweFJwbzhJSWdJRHRIa3R0?=
 =?utf-8?B?VGZ5S3lLY1c3OENLZzN4UVpoV0toSFBHOUw2aGhvZHJUK3RnY2hmKzVrVzN0?=
 =?utf-8?B?MUdxamU1RWpUZ1RGRTIxR1lNQ0VhVWFRTFZ5OXM5aVFCZWxyRWxnT3J6OVdC?=
 =?utf-8?B?UnlNc3FVQ051c3NWYm9ocGxRS3dQRU96MWU1QmlHWHdjRlcxb3F4WC9sSzVV?=
 =?utf-8?B?eG1NUjZpbXp1RGpsN3M4NEFXclAraFY3SzhJSmRCaThZVUJVRTlvdkZRL2dH?=
 =?utf-8?B?SkpRTS8zWXVlU1F0ZmE3eHhnK2JmS3FGaWlndVFKNHNSNHlvQWdQUWhoc0or?=
 =?utf-8?B?bTNRaUIxR0xVdVNsQ1ozRWhyQ0lwOE4yWWc2dG8rVjRXUlB5YmNPc05SaTdZ?=
 =?utf-8?B?NFkyYjBBci8vRndjTjIxcmhxTkFXZDZCSGZ5L2N5TWF3OFNHeFlkZ0wxeTBy?=
 =?utf-8?B?UUg0cFkvKytEWDhiMkdpamZhRkNKQkhBbW5IWjBlZEZWWUNCd3hQV2JZN3k4?=
 =?utf-8?B?YnVNNi9wZEFXc1FxckF4ZzVhQmlFeEo0S2ttamxGdUZnelpZVVFlYUlrN2Vu?=
 =?utf-8?B?UHVDd056TWI3UEFha2Q4WStlUW4xVjBBVDl0aWhiNUlIN1I5VFFsVTZRd2Zx?=
 =?utf-8?B?ZWxpZnh1RkgrYjNRaVJFZFNwZGdJZk0zNFRmWVA5RWxHK3FUcHdqM1pES2Yx?=
 =?utf-8?B?Umh3YlFHejV0aFFWSjhYSW14ZHh2Qm1FRTZTZHlTSlY5YVFjNEdlUEdNc1d3?=
 =?utf-8?B?dmxrZFJEVWxVN000YWpWcEg0WVdXR3NrWlNTMnVrVXBSaWlnbkFoZU1UWDdN?=
 =?utf-8?B?RU5VUzVzeUpIRG04c2lLUVNXR0wvN1ZTcEc2QTdERk82OUc4MFU5czF4Um9l?=
 =?utf-8?B?NXRpeERqMGFabjRuSjE0dVpMVG40bWhnK1VpdkxPNDdTczVrQjBHZi96cHln?=
 =?utf-8?B?em8wYlR6dVgxYXFBOXdlWkc5YmVrWnV5Q3I5OG5ib3pvNlFYeEpOTitJWkpp?=
 =?utf-8?B?QUo3MVJVR1RIYm5QNW5OZ0hvQWI4MDJGOGRHeE5OdGJKamNlTWtVNFZVUFJy?=
 =?utf-8?B?elduY3d2Z1piNXZBWEozZDFRTnZnbG91bkwvcXNJZTMySUJaaHNXL3VIeHg0?=
 =?utf-8?B?WVk0dnQydmdVWW44UG9aZnd4d3F3czhTMHU1TDBUWWE2enl3T1ZTMkpSUjZ2?=
 =?utf-8?B?U3RPT2U1NlZITk84SlQ1TnEyS2ZJUUhIQmp0bmFWRXdGSDc5a1RXUXZzaGZO?=
 =?utf-8?B?SWZVd0IwVjdHdjNXM25yYkpkYktjZkNIb1hZQnh0RW1xcFNNNUlIV0ZHbkdW?=
 =?utf-8?B?clJhWnFXeW44Vm5Jd2xiWTVIZ0Q2NVZSNjU0ZmxpT24vRW1CaDFOY29oQUg5?=
 =?utf-8?B?VXpNSVNsbzgwZG9UWmhmb2JtM2l0eG9GZ0R6YTZxTDlxZ0N0QXE5WHpVVlE0?=
 =?utf-8?B?UUlSbndVbE5SK2x1Ym5mU1BBTHhtSVBHZWFBOE1RamUvS2pTZmdTa2hkeCtu?=
 =?utf-8?B?bEpQTnpSVjM2U3dSN04wSHJOaWFUdTRxcTlQY2Y1bys5K21lQlp2TjZFQ3Fo?=
 =?utf-8?Q?U5sm8ApEZML7atgk=3D?=
X-Exchange-RoutingPolicyChecked: qtmx3bKKq5Eql4qxqijYZUkvC9r5zKNsHNkOWRYoth7sGsoW9hWElieubX573PGjj1fLIFtEo/AbeMn5zC6CxdMeCJuaBmSILEGZm1pRMlHY3s+Z9HMO+/pLXknMztn6CdzYhy2wSzWhIOiGcZZQZzI5Hf9pW/IIxtLY8l4Cl0XzlqejMidnMTeo0FL0BRWlP0mXHKUuWGYqz/A46m+QcCzjNqJmOslmWUnHFZcz/Qac9739ODJf0rqeNOV1sQXym8FIP9g0ROhv7uebUEENkFnet7K6xzywPvu00Yxl4+QOLN6cWHlmaB5E2aeIBPEehWSQtB350V7MnkVVGTIBag==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec392b-bfba-475c-f7d7-08de7bb31a6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:03:50.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNJEbSSI+8RoDNcdChW8R7T/FfplQY7JD0LQDNOUur9Q2+RpPTDfT8XPYTChGXOxfDVbtDcjfmb3BBszXelWEJC64MqcHYzN04o4eA/5zng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

We usually specify it in the patch tag when the patches are meant for 
topic/xe-for-ci

On 3/3/2026 1:36 PM, Gustavo Sousa wrote:
> Update GuC version for NVL-P to v70.60.0.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 60c82b920f47..9aa8deefa6c4 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 55, 4))	\
> -	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 55, 4))	\
> +	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
> +	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
>   	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
>   	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\

