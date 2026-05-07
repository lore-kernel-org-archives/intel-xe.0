Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAEECD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9212010E29B;
	Thu,  7 May 2026 16:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRQvIvc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D17110E29B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778171882; x=1809707882;
 h=message-id:date:reply-to:subject:to:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mExAfAQ3+DFSVCFM9196/6DSv3Mk6SdauMmdINCp1aE=;
 b=kRQvIvc4aMaKNPLQ7Zx2KH8gNao5mxZOUmdWcr5c8dc7BvMoO2XuHu/5
 25YLoeTlV/HWXOh4MMBQvFkoOQVeCTV70DzFXUKQ83eOqAUBawQgj9MrA
 hTcf7Nueu+6pOcGwZ4klLfb0Xt7daqaT7yxA/VMCS4XrwUtt87dQRTvlb
 8gwHkvzLAv5LWbwR76tdvT0jpo1F2za3NOl+HJewRwZHZndJ2yqMBb0En
 hSP7jirS7wk0tQgEkflksBiG3R4cuq2yB29ci8rZ9SgDOZM/rf40NIXP+
 hB/OMr5hu1oztfbb7agjDS1RduHtmGWl6s6LOPCSgKBijg11Q5XPhcTa5 A==;
X-CSE-ConnectionGUID: yF5mTAuzQw+NYJYHL7aR3g==
X-CSE-MsgGUID: evJypUFkRuuFlNf5bMfuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79065967"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79065967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:38:02 -0700
X-CSE-ConnectionGUID: +9kYaGJRTbml05IzB58/bQ==
X-CSE-MsgGUID: WQnJUTePSJekR8qzzF+C+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236613890"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:38:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:38:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 09:38:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnIGLqx6et+NC/E5CcdgQbt9u3+DHwj+XNeFGfQX6KBTRnOir267wxUgS8kqtKCfKQKZ0hdK1iaAsLhIDDTfy7FcUmho6RmmHq5lZI74X+Bf0vX9j0ccYFfKtIYEGCLotDQ6g1W6X6CFkPSl2iAtoZGu17C9zahkcJloUB1JnlUQxbYrx9N2uAudOohmfZ0TKOIgMdAM3Q5xnoqv8U/8GTfEZZHaHejbsJY+2BWxdtCN7w5D3kgGHc4f1Rdt90ZgroEVm3iv3wzkx61nmlxFyg29uCs38ItT2zmPTet6zw3phbeNkkqZwwxQJNI51n0NgjU+Xwv3cSeg4Mk65roSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mExAfAQ3+DFSVCFM9196/6DSv3Mk6SdauMmdINCp1aE=;
 b=hrV1E28wiobmVf9UUztHlf+Oc4g3UIAA4Dr4+Kt9zUPjW+i8gkTe75Ygs0B5/cGuda7ue/7bSmK73mHZgoCHQ0IVLXpP0j6OHs4WkngfbyGNTjpKdLt2MrJPwM5OZswd+D05prVEyx15tYP3gMPtj1J/rhVYA1mFiwBuD5KAv2oloC+rbp2BtHdue4opSpvUYch3pwgVKJebZ5B/VSZ8OWLz/FsqkYewrFtwbASxRYnbSK1/ZR2u/CaCW1Qvnvyq827p4RoR02wrgv/tZXQq7iR8qfNCw9DvLy2ej1TND85ClELPu0TISvXe/NvtyNlcv/rGGFBrtIQ2dOSvxT7j2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 16:37:56 +0000
Received: from SJ2PR11MB7619.namprd11.prod.outlook.com
 ([fe80::1768:f463:81b5:b480]) by SJ2PR11MB7619.namprd11.prod.outlook.com
 ([fe80::1768:f463:81b5:b480%7]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 16:37:56 +0000
Message-ID: <9a43e108-53c8-454c-aa7c-bcc9118cbeee@intel.com>
Date: Thu, 7 May 2026 09:38:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260507004631.574300-1-james.xiong@intel.com>
 <878q9v8eqt.fsf@intel.com>
Content-Language: en-US
From: James Xiong <james.xiong@intel.com>
Organization: Intel
In-Reply-To: <878q9v8eqt.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To SJ2PR11MB7619.namprd11.prod.outlook.com
 (2603:10b6:a03:4d1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7619:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e694cb-9171-4fc1-06dc-08deac56fe1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Zx46enotLYNh+cHjewoiGY0v513f3ff5ipxHcwSg40ykhWCZ6/NQ1Oo578Sy+AuBIzmjGReoYUDMZCOO+AVJ7pc/mxuaohuTrt4T6aeqSwuh6nHiS83qb9cY7MGgIjyWTpaLGdBW1ObyZyUbXLXTXG0QqsjrA0fU6ucfP0DU0rm1ANSY85GnOb7Y4SXr1jjEjU9ADuDtft+00Q4bF4pjVIdC8/FqYmfG2P1Ag5l545FDT4jyQzSL3WMyTpr8pYLWR55uS2krZqBWZxShqNEaW6BUcO77zqTY8TQo0pSWVBTJtPVars+Uy6AVG/pWVszzvG0ZQKkCbLGXqHofWC5ZiTsvz5PjzlRv2LDJY9+LLwwIXGRq+uL8HycMNW6CTBE6dmrygpZBBRtAsV3mOIBde5976tzZ2NntFU4+ig0t2jWKPlKkrPfMwjJv4kW3NQ88iwilnap9g37IwCLmegNoVMRw7CWPozB8OoG9RupjNyK9Pk6ttFGu9pHMrsmTrtyxE+TbiJzFUAhiIcptnpjEAy+bFiZehmjXv5ClTE/ixUN/+br8MizHsckixDRhIezh0ylgH3eMvWn3zx49rI21pLySB7yMg/Tt85y0GnOzdM+Gmn84oHLxpCCFEFsjA9jSJIqGLtqHQXTSMqpZM42femYjmwSzoA3rqXvsaRL1cRSVPRSXdoFiB2lNf46M1S2O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGorWVpBV0tLY0tGTHNOd0NWOUk0dkx3dzJObVpydmVjY1BFRm45V0x5WUU3?=
 =?utf-8?B?OGN6RlZPZ3REVU4yOXdvbEJRN2VLNkNKVmdKVDJQckxJcjZUd3BTTHpIMTh1?=
 =?utf-8?B?bjdGV0ZkTmJ5c0V1aS9TQnJONHo0MG5FckdvdzJxYml0dEQ4YkdPWlBjemR4?=
 =?utf-8?B?VUlZTUxMU0daT1RxSE9WeHJGNFl4WUpGU3BaazViaTNkeituNkpIRXlJTS9v?=
 =?utf-8?B?NEdJejI5YzlUdjdKYXJIS1VEbTQzWU9zbXkrZ3VvUXB2NVNMb3ZqK0wzL2Yx?=
 =?utf-8?B?NkJSNUp3dE1nVm81WHVKY0ZXRzdnOEFCZE1mclB2Q3JqSktzYXF5RkNwdnAw?=
 =?utf-8?B?Vmc2VUxTK0UyQURKak5rY2NQUjZpVUE1bklWSkZWRzR2SUZhcUFtaFRkVWVS?=
 =?utf-8?B?RVM0WVRBdldUS1pRa3JZODN5NDBITU5zR3ZodXhWQllsOFVBOURoWkRwUUY1?=
 =?utf-8?B?U2NVdWl3d3hobTVEa2RmNHc0cWFXcnZXMTFnam43ZHNiMWRHZkFLemhibWR5?=
 =?utf-8?B?YkJMeVdwangxaGJhTjdkU0hXYk1NbjhnNm5qeXFRZ0d5VTRZY0dWRkw4SXla?=
 =?utf-8?B?TnVNcVZ5bnRvWkxadUdzT0FXQmt0dTNabmViNE1XWEpHSVZ2d3dHODFwNDMz?=
 =?utf-8?B?TzAwcDZzTHNRVVFnWHZWNTkwWFRTaHVIOHBMSFVMNnBVbDkzTkpVZmFKTm5V?=
 =?utf-8?B?dm5WczRtTGFveGszaVA1WnM0WlVVZjMvQ1VxdENtaGxJOGVMb2ZGRWVPS2Uy?=
 =?utf-8?B?bG5VTkpBWTZSeklzK0d2VWpieG1iWlNLcmxqYUxBT216SXVoWWZCVkhiMFd3?=
 =?utf-8?B?RFhUcWNjMDNjL2IyaGozY0FCUVIwV1hyL0VmS3dVMk9ENG5lTVcxeU9jL3ZC?=
 =?utf-8?B?U3pkam9rUlJCZnFLWkowWXB2U2t5QUN5OFJwR0pER2FvbmZwSFA4bHk3RHFy?=
 =?utf-8?B?TjM5dk9wbSs3UHNqWndRV1NQN0JrUExzQk1kRjNLcVNoS1RZdm9DcWV4aHJU?=
 =?utf-8?B?dlBOb2tNclJGc004Yjd6cnBtT3luUUUvVmFUV0NCQ1I3Z09iVlpZVm00K1lP?=
 =?utf-8?B?M1A3aTZQZW9IdzlqZVhtMkZXcUJlWFpEbU4rbDdVbE44ajVlQnNSQzRNSEhW?=
 =?utf-8?B?L3NWbnRxVFpLS0IyVDd5NWEwYXMwWEgyVjI3MFpodmVvR05oRmFGcldBSzBQ?=
 =?utf-8?B?SHBUbnJvRjF1akRyRVJrT0JRNnhreDlrcDg3dHlaYlI2R1lhM21JeFFibkt4?=
 =?utf-8?B?bWNweXNjQmdrNFdiMlVxQTlvbldUaUd0Y2krcGRNZ1ltcU1YaFk5bitweTV1?=
 =?utf-8?B?blU3QzMwQjQxcjVvVm41TzNDRkd6NWpPbGJFa3VRTEd4R0VtYlVFS0J5VWpS?=
 =?utf-8?B?UTZrTmE2M1RJUnc1YThzemRaQ00ycGQ5TkVoMVlXNlJiaDNqbkdzdVlEeXBI?=
 =?utf-8?B?Wlg3VmxUWmdoeWtwTUg5Q0VLakUwdlprbFpTRFNieERsOFoycVlYblRqUVZa?=
 =?utf-8?B?NUdZaHFJTlU3ZjNrTUFOQStsOS9mdmptdW5SVkEyK21mZWFUQXFWanc1NmRn?=
 =?utf-8?B?UGdJN0tnMFBraEw4K1ozajAxNXljdE9VaXJjdmduUHQvZ1crNjcxSXBva3Nn?=
 =?utf-8?B?b01jWUhhWitxN2RPM3Q4eVJscmlEdms2NU43S3pySXlMUTNBWkQwRzU2MFBG?=
 =?utf-8?B?TUNmM3VYSjRUdVJRNWJKQjN0aHltZUhUVHV2QU1ZV0J0c0J4a3ArUWFOdjFE?=
 =?utf-8?B?WVZCcTVFdG1sOVB2N0xhYjRRdTJjL2lhcVBXbWYwUTVYTTAvRWUwMU1FUUZw?=
 =?utf-8?B?S0xTVXhwQW9CT05KeVdxVjlwQ2loNFFJWWF4MUt0NVR0TDVyTHI2Y2hpZ28w?=
 =?utf-8?B?L01HclRZQnFqdzRCZE92L2FuZnRJZ2ZENy81LzZDWXYxZERKWmUxMnNDcm0r?=
 =?utf-8?B?Z1kwSFpTMi9xWnFBdzZaRlBBQTUxS3ExNWlUNnpFUUVBREgrbVpCSWFMTGVm?=
 =?utf-8?B?WkI4VktEMFBUTlBPOW1BMCs1NzIxTC9OZWRLLzA2cGN0L3RiYzE1MmdBN0Zt?=
 =?utf-8?B?VzgxVTlFYzN5OGZIelU5K1R3c056SHNrdWFrcXhwWkZhWEdnbEs1MGhTMDZk?=
 =?utf-8?B?aSt6Smt1NUxsekgrK0lDd3MvdmFHclFHNGVsVmJ6bnR0YlNFTnE3L3dPOGpL?=
 =?utf-8?B?L1ZTYWtVZTJndWxMcjMySmxEancxRm9EWkVuK2ZNTy8xZDY2UEh0TzZaaCtO?=
 =?utf-8?B?clNrR2xsQXBzSGhoeGhMemQyTkltYXM2UEpvdkFrZnprVG1OTmhtNzN4TEdq?=
 =?utf-8?B?Z0NzL3lxWjVvNjZwZU9iL1paYkdhUjZFNFNXWGVMSTlzL2cwQkRIZz09?=
X-Exchange-RoutingPolicyChecked: wKQGj30o3vEkc9fXCUirO0q1kubcovZfiqRadEstRwFL9KkOSOA0HJkduCnlaBPvPWOg9snaMArQLkNn/uEpsqib5rrrgo4UXU5EJkm21XAlvB0SA3jGB+veU3akAdmgTddfwjEaQdyBIegS2bcvSRtcPmAiqifA1U8ojeMFfhMsuuhJ7bAMNs8ctqOKUS+F51H9r7P11S/Rg2SAWgSljxjOlLh96aVIAYQTEneTaT9taOClPHMME4LKxNjguozMHnzkbgxw4bejtILI8Pc+t1j/gXDSR3m5dBPH7JWMMLveU25WcqsV6/M+Puvdw3zsBwHqQkHRBGdamuF/HfoFPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e694cb-9171-4fc1-06dc-08deac56fe1d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:37:56.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FobSQpiKkPlIgMqh8dr93pqM1DvSXhETZGD3NhKazM0oiwN1I79LwZpflEWLXgtDF8ABP2Kd0kfvxhpA6Whabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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
Reply-To: james.xiong@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/7/26 07:40, Gustavo Sousa wrote:
> James Xiong <james.xiong@intel.com> writes:
>
>> During driver probe, DMC firmware is loaded asynchronously via a
>> workqueue. There is a race between parse_dmc_fw() setting the payload
>> pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
>> writing the firmware to hardware registers. If the probe thread calls
>> intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window, it sees
>> parsed payload but stale HW registers, triggering a ~20% intermittent
>> WARNING on ADL-N warm boot.
>>
>> Fix this by adding a 'loaded' flag to struct intel_dmc, set with
>> WRITE_ONCE() after intel_dmc_load_program() completes. Check it with
>> READ_ONCE() in intel_dmc_enable_pipe() and intel_dmc_disable_pipe()
>> as an additional guard before has_dmc_id_fw().
> Making intel_dmc_enable_pipe() bail if the DMC is not yet loaded doesn't
> look like the correct solution here.
>
> Does the warning come from intel_modeset_setup_hw_state()'s call stack?
> If so, I wonder if adding a call to intel_dmc_wait_fw_load() before
> iterating the crtcs would be a saner approach.
>
> --
> Gustavo Sousa

Yes, the warning comes from intel_modeset_setup_hw_state() →
intel_dmc_enable_pipe() → assert_dmc_loaded().

You're right, adding intel_dmc_wait_fw_load() before the CRTC loop
is a much saner approach. I've updated the patch to do exactly that
— the loaded flag machinery is dropped entirely, and instead
intel_modeset_setup_hw_state() now calls intel_dmc_wait_fw_load(display)
before for_each_intel_crtc(), following the same pattern as intel_flipq_init().

Will send v2

James

