Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749A8C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D071137A0;
	Wed, 17 Apr 2024 21:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4kdcv/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFBC1137A0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713388442; x=1744924442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i4gSUE0GUb4XYiJZJb8pfjcpWaAr80wFW4PH5lqCzHQ=;
 b=X4kdcv/j0PkJxNvxcLu8upjMuZWMsj5AX3oUyoNnrVpvw7cWsDjeoLHN
 N10qm4WnAOHAaRDZxvf+dbTYAw3xK7lAu5gM/zMC1bYtkGi2yHZ3CKXjV
 YKSmsx76Vz0AweZUfMvJli1yK0e+cxLyrt66eMdDfnuqeVaVmxpOtCJjs
 Ws9DxDKuJbC3BPtWJFIf0IGZ/VBoxAgO/ih4hPo8aFrZRrnYW6AMYdP2f
 ikssgcL6iVUD85ldHZp17qaYCMCXabMVsJAbjkhPqzTsZuJHUAPysTXrz
 hANw3hGklib6EwrgJPPR8WTiEr5rD36AmzlS4Y/dHwqvZXyKOPH8aKvoa w==;
X-CSE-ConnectionGUID: 6RRp8Qp7Qvqq5ayGpKrXFA==
X-CSE-MsgGUID: VwB4jvieQIu+VahGlmndMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26364649"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="26364649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:14:00 -0700
X-CSE-ConnectionGUID: OVno3XBXQnOAcGrkQ+lWHg==
X-CSE-MsgGUID: tFri4RQkSFqS3M3gmyIAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22830339"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 14:13:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:13:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:13:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 14:13:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 14:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwzzmZRJP4lVLRdvz+Rhz+2T3tRwokGjUp0u4Uw6EOT3CYoEiAy+tXlOwusY91Wu+aiWvC66mORTBqIr3o8yLIfDN+++vPMx7Ek/FUutaYHdCmOZk3wKucY+Cc6eAXaRqAh0ihsQn4WRDJF3qkWDrt5J0fOKrnIZ2GSy3l2y8PFyZfzjIHXdK9Eg2O6L8qEFUVY5Myy7c2MVHpObsGej4UyBcilGbfGpPyaO2GI36GP4xOXt9WzHF470v9HBqY6QCJj3vuEGrMJctSFXSWp52Z+ZsfqvBCLpzHMKPR5eb0yqvG7/ARSA5gIvVu9mnpxIukpVvZDnzHDFtmGoF4nHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha8L5d9tc76b8lhjovCcl/qS9zpKkqyqdpl5HZABIdU=;
 b=aErCfJHNxuYPKSDD+9/HeYqz3nK6/18uarF3rO+kQ3pOUDYzEjHyQWkAFA9LHs+yBCVYbcjhOtIvSfUlMEt2/PSD4tra/4yKmh5plMONyAjAcIlFMiLHECcEETQR09qNDU2km93LUdYfvqgerq3dmRPKLrvj1+lU900akdysl6nD3RoQ83L3wgEHhHQOsWP4G80yfVa8s+0D9OYb5q+AqBa1GsKtcwENVaUK4q9bIBQJh7tWOPhBRp2yuxqtGpdKB4UONzd45cmA0tUoHuovT557Rj7NWtGJPMcrpWKHCd92yt3z7gAjVaL1YtqXzZD0w8wL22KkyJnuZNuQyGY0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 21:13:55 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::cff4:194c:14e9:446]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::cff4:194c:14e9:446%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 21:13:55 +0000
Message-ID: <49b5bb57-c90b-4944-8d90-6ec8582257c3@intel.com>
Date: Wed, 17 Apr 2024 14:13:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/gsc: define GSCCS for LNL
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
 <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
 <pjhjle4cinjblusjsr54ycrcnm6k4c3stseah6dlvymedkoxpo@nswgln7643pe>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <pjhjle4cinjblusjsr54ycrcnm6k4c3stseah6dlvymedkoxpo@nswgln7643pe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 84199995-795f-4482-0e3b-08dc5f234a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIlY3NHDgAm2FEU24BwG2pO2DDdWx9txlD9jI3LQRIi/s9PZ4bgEM9GunWjVy9ZcxPdnA4UbSvvozgUE84WUAgbpvjW1VSuFzoMfwZv6wKaE7bn6AoGdm3onYZT87PffBqOArJ5Cw/9tdZJElBjsH6e2h0gf3orAKqwBghjIlK8tB0caUAMEjRZhTxq/D8Co1PxOYO5Hlr/u/j2f1rxgHA1YMI+TYMUB8VDW77zy9KJW99hyfl5V7qJEKHJMfLoVasvszzWjQBfaB6yaLeV5pXY29Ign691pN7SP26lkP1m4qYU+m2qnBA/8gRXhMbA7n5V32b7stXUAYLFi/qg6nXhLqH/V8afzVO/FT9bjoUCV0hkSva4fuUPizIFijx7HQUzWxcWpUK1vc8VnhcMx8ZH04UdH7z9lDVcHPs59vb8Fn4tBZsDrh9zpjBGahXRFhvpg22BlIQAOqONzVnWU/3EnaAvzrQrdvcfFYpfESovipX6PQYF6hYfM5PzOx7uZEwy7uNaLiAV118DTEUtjRgQKU+kUJRL9gezLNjcyOMu464bhh9IWtgTiclt6TolpWqKVS3Fhsh1vg080/mCcjXEaPdTBParQVIFVJ1g/xeHnCtTg1eQx4sxKhSwemH+3m2xuYxE85i+JfY31tRO6ok+PFckwFMYZwiym9o25Zco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGlMbHl3Z2NxSDdyU2Q0cjNFbEhtWUtlWStUdHQ1YTJ0QTNjRWlMbVFOais0?=
 =?utf-8?B?SUJORHZmMjZjT2UvOHVvSmhIeHhiV1dTWlVjUnkxNjdrMVBGOFVjZUtmVGVu?=
 =?utf-8?B?NnJlRjE2WURUQXZVNC9hNURsVEZMUnBxWU9LS3NwSXFGSU1KeTkwc3FYT0RR?=
 =?utf-8?B?dXJvZG5qUmo0bGQ4c25lVGhaN1FJejRXVnBET1gwclBwcWl4MUtTcVRSdW54?=
 =?utf-8?B?c3hQRG5hdjRiaUZTSkFrUnVXRDRRTHkwb3QzMExnSmpTQjdMM0I5cFF1S3Ny?=
 =?utf-8?B?d003azY0ZHg0M3c4azArVVQ0Y0dOSWNPeGxXUmJWTGVxd2tHNjIyK0haeVZV?=
 =?utf-8?B?c2h3NkMvMkU1cW4ybWR5NEtjQVhIZGpOei9EUEoxeHFPNWhURmpFUFpEcVQ4?=
 =?utf-8?B?bmJQd2lCcS9RN0VMZVg3NCtaakVJaEdNZ2M0cFQ4M1VYYlV3YTlBNFc3K2xV?=
 =?utf-8?B?ZHNwRWx4UEM0Ny9YK3h3akVIOUcvS1ZBT2xnci9vRjQ0QWMxbGc4Mk50dCth?=
 =?utf-8?B?dS9FUktEZGg2d1FYN3ppVXY3WFZQUE5ueXhPL3ZYc1JoNWc4RngzTHV1RzVu?=
 =?utf-8?B?QTB1Rmo2RXpOTjZrM3NQVG9UZDNUbkVmank5TzF6eTZRcHUvUnB6RXY1Z1lw?=
 =?utf-8?B?SjMrS043V0Jodm9VYmIvZ0JacngvcWZKMjBSYnVhVFQ2dnVrSU5UbXZ5bUpZ?=
 =?utf-8?B?SktrM3BXcW5lanNrc3Bla2NZYiszblY3VWlEM1BOMnBzNStwc3N5NU9jcE1N?=
 =?utf-8?B?TFFjY1E1UlowaVNXWWh0MWVlUHZTZ2p4eGlqTnhST3hWcGd2dWdyY25FSll5?=
 =?utf-8?B?MjUrOTBLNEhteFNKdUZtWlM4Ymk5b2NHM0w4UStXZ3VDZk1MK2lLL0d5NEs4?=
 =?utf-8?B?cnVwUjRzTVdCWkVsL2tTcUVwdG1zRHJSYjI0eWFubnlBaTcrQ0wvQWZYMnRP?=
 =?utf-8?B?QlM4Mm5Yd2xHcGFMWVJWVlJ1WGJ2YjVLSEUyekVKYmgweDBNOG14U2Z0aTdL?=
 =?utf-8?B?MENRdTZIUk54K1hkdk5lTFl6MU92VWxPVFEyby9tWXJubHh1bDluOForWXQr?=
 =?utf-8?B?UnBGSnk4S1Avdm9CaEUwRS9sM0lKZTF6bnBpWkVNR3dPY1daVEZ1WmtMcW1O?=
 =?utf-8?B?OEZWZEFobFVGakN3d01CQ3V5U1NsZ1h2YmFrdXRXMThsZTlkT1FwaS9qcWgy?=
 =?utf-8?B?MWJ6dUFlTm5PZ2pMZ0l2QTUvWjRleTcxWjQ0Q01EbmkxeU8yVWRPc2xDRTZw?=
 =?utf-8?B?TWthQ3NKdzJKMnAzQ2d3YTAyVnZ1VElIT0NHRFhOYzNxaG9VZzVFdmwyaU0z?=
 =?utf-8?B?ZXg0enBpZldldHI0Y3JyS2dRQ1lSVHJWVmFvbmp3OWJwVGZCQjl6eE1VN2xz?=
 =?utf-8?B?QmdndHd4ZGJrTVQ4MmJTeGtpck04aEJvaGpvbjVuNlNaTTlUS2NtMGcyUkhp?=
 =?utf-8?B?NmQ1QXd4eGtVVml2QXp6SzB2VEM4UFNqRFdwVkJOUGt1SDE2bGNVRnJ0eFlo?=
 =?utf-8?B?ZWU4MGt0dFptbWZCN0tCWjNwY3R1SUxtcDdiU09XbXkxUnVlVVFMc2o4Vmlk?=
 =?utf-8?B?THpTMUhnY0RlMnlyQ1ZlTUltWnRFQ3RjVnNCN3lWRXJ2N2Y5T2VpTkdGU1Qr?=
 =?utf-8?B?UGJZTjJpWTdFL0FIRmVhekR1bzkzVklKT2o1QU83cVAwTTBEZWVTSlNMbXFJ?=
 =?utf-8?B?MzRVTEdkZ1NybUZNN0NGYU9FQ01CMjZXUXd0Q2tNZ1N4NTNaVjh4eTdQQU9W?=
 =?utf-8?B?Rmc3UTZHNFdIdVd0K2MrNXk2UFhlSm4rekNZVjlPeDYyKzVBelZOVG1NbUNn?=
 =?utf-8?B?cXNRRUxNWFZMRDI5NWJ6WlhNZU02b1VLYzVpam9tVi9XWlB4anZaakZxWTBH?=
 =?utf-8?B?UDRtQmZ2OGFpbWt2bGh6K2Z3cUt2cjNqbEx0WmN4ZlhVNlRSaWxuMXNRUFkw?=
 =?utf-8?B?NDNRTVpLUnNkc3FIdC9iS2hvKzNLUDNYVUdRUnlrSVBjN3ZsMGM5ZXBrL08y?=
 =?utf-8?B?UjZGcDBENDZoSmJXdi9PREF3SDhQa25sdFhnckhMWWJxMjJzZndZUnRFbFN0?=
 =?utf-8?B?bW15TlFSeE9qbWNpdDhQdDlKakxjaFk1UVVaQkNZMGhEdmlveXZubnQ5ZFoy?=
 =?utf-8?B?Vnh2OWJxYTZBSTFLU3hZOTlzZWNteW9PVUxzRlhOekx6YmRZVzFpZTFSdDBV?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84199995-795f-4482-0e3b-08dc5f234a5e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 21:13:55.6761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSif4+veR9J4mha7erBRihfulAPMy9lcOg4PP/KZ2E1plJAm3EjcbduCcCPLV0ZoL/R8V1CYEba2ngRMgVFPEZNcOQKb2sXkb6vdvDcH9Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
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



On 4/17/2024 1:00 PM, Lucas De Marchi wrote:
> On Tue, Apr 16, 2024 at 03:21:57PM GMT, Daniele Ceraolo Spurio wrote:
>> LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
>> we have a GSC FW defined, but having it in the list of engine is a
>> requirement to add such definition.
>
>
> ... which means we could have gone with it defined instead of the TODO?
> If so maybe good to adapt the patches for next platforms.  We already
> define other engines and rely on fuses to handle things correctly (even
> more after 
> https://lore.kernel.org/intel-xe/20240417152621.3357990-2-matthew.d.roper@intel.com/
> is merged. Just letting the firmware absence do the right thing would be
> the equivalent of that I think.

Agreed. There is a small potential issue with interrupts, but I've just 
sent a fix for it (together with this patch on its own so we can get it 
merged while we wait for mei).

Daniele

>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> Lucas De Marchi
>
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pci.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 3b30353dbc09..ad46ed6a2de7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -209,7 +209,8 @@ static const struct xe_media_desc media_xelpmp = {
>> static const struct xe_media_desc media_xe2 = {
>>     .name = "Xe2_LPM / Xe2_HPM",
>>     .hw_engine_mask =
>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: 
>> GSC0 */
>> +        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0) |
>> +        BIT(XE_HW_ENGINE_GSCCS0)
>> };
>>
>> static const struct xe_device_desc tgl_desc = {
>> -- 
>> 2.43.0
>>

