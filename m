Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA9C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 11:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4564110E22A;
	Mon, 19 Aug 2024 11:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ6W6dRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D510E22A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724066381; x=1755602381;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PgZL6Sq1mZrpUOCy0FBIqi6JRpEoafscz/TfVos5alc=;
 b=SZ6W6dRrQFFefsHyVAagFFaazQtIjHdDYYaONvieWRBnQsHbil4P1sOb
 HcPu8NdOaJczhizka89Vnv7h/xkHpD3uaWipVkXR8TH0jeSXpuzmt94+D
 upVICkLC/UpqhmGrYsT4y7ljAVcFDBrVYL5QXCgr3UxNVWrb7neWTNKwC
 obt05dDpdNVY7XARtQSQNJjwwTp+WGtGJwyp/j+aZR7k9WplPgR+KR0y3
 LTfam7Ul4kfJQvRLICNyZBMwnhIR8LOIToHc7onBo8Yu7OVtIFWvs4/+a
 xHtOXRvH8S/eIU5plFDehRJa4DcTagA+guhXp+PJZOogFWalAkUyoN+rL A==;
X-CSE-ConnectionGUID: IV0JSop3RV+6R85AUFrXqQ==
X-CSE-MsgGUID: JXG6rqCSTWqqsQYe7TXmaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26063448"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="26063448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:19:41 -0700
X-CSE-ConnectionGUID: QmOb16koTZ6lkLE/KTKl2A==
X-CSE-MsgGUID: xOIOX/8NSoyHYoV+oIz85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="97818251"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 04:19:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 04:19:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 04:19:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 04:19:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 04:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K45CDUGf9HcWsANo9TIjs+dBTg8df1iNf5s/d2VVSvq2K06FQFMiiC+3k7miRD17iww2NW1M6WUUyATaTYJ5ES2ZJgrP6jxgOfRjoJFwZfVeOUFYhbyXSRSAEok0PpBK4RCyFhmlH9Mb+TQO2i6N3WJ6p/6+1FNHDsXHsMpuFyYNNH8uYFWmg94GIdYWpabP6Ax3SuvBHlWDYhlKQi+PtGd/6Mew7NHOS/4zVnAznmqk9kqnD8sC6Ux4Kluh4i8MWacpEzX1QByZNumxXbvZlC11mWGFdkWb9zAJ5egmJk8HTq3obJnKEQrh0Y9mzGowt7KolN4mxtETcIuVALIOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgQHVu8cBYUEaslqqJbf5ai753tGalFDtulyS92Kxs4=;
 b=dYRpOwPkqNMlT/zmt2PcMFfiLfPN2ESK1FLFAno7pSFxP9h2LKatm7ZKDNzUQbqWeuyLwgxD1wdZJ9n5SGuYyIlG5NKWcDO9nMnu8nhHdXPqhcfw1o5EOq0xr5xoADADBwfPIMdqxUO+Tq97hGIlXnNpytioI5KdpSWf/ijlPPaKgjrTitNXEWRkem2RcWuztP6R2FnEZtkDc5oazcqQBWeiPNZrQzJThxGj2b3oAG7gossj0kFAqrznrvwwa/MNWjbjw4YKWvx+Bu/a3SxLp4ROih4yzld4FAqgU6C9LzrdLEJAT2Wvl6EANWXxwSoCPt/I2am3QZQZPO+pfkUYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 11:19:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 11:19:38 +0000
Message-ID: <ec7a7f35-ec49-4824-b888-2d28617ba20c@intel.com>
Date: Mon, 19 Aug 2024 16:49:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Invalidate media_gt TLBs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240817210451.278887-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240817210451.278887-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6dbb6a-ff48-4a2e-0491-08dcc040cfda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWw4U0ZWM2s1Wm13WGk1MGFLRDUxSVAxczlzMSt0bVlvbmUvSm9OQVh5U2w0?=
 =?utf-8?B?ekZqbTBSV1VzeTd2ZFNaK0JaaTUzZVFwZTBQdCtvbDlHSktKRnQ4clhkWXZR?=
 =?utf-8?B?R1lWaVcyTkFBNXRZckpHdFlZK0tIcHhQSFV3amh6eWVuUzRHTmVGTGNnOTEx?=
 =?utf-8?B?VldyQlhJSmVEUXRSaHppYndSNkJrdVMyN0E1SlNjSXJBWlJJS20xa2RtUHVh?=
 =?utf-8?B?ZGFBQ2NqWVhRSDJZZmtYMWhSZ0twaE04YWpuNEMrL0JuaVB6UTNSMDExWGNO?=
 =?utf-8?B?N2Zza0NITXNQdW1kNXpoRFF5VFp6d0hjeGtBNEVKOHJwckdLVG1nKzN6RFQy?=
 =?utf-8?B?bGlMdVJ1TlE0eVRhWW5PREM1eHJaeXFEMnFBNzZsNnJOdloyU1c1MWd3K1JL?=
 =?utf-8?B?YmI4Y1VLRkVYSWRWOTlpODlsM3dNVS8vQ1J5ZVBsSm03NHdhbWF1WWMzWUVx?=
 =?utf-8?B?Vk9OVjNvVjloSEVoMkhkdUcwSmRUYldCYTVMQkpjYWZ1R2duTnVaMkg4elZj?=
 =?utf-8?B?SlhwZnJ2Z01DNG9TcHFqRnVNUzMvSWFxVktDazZhRzhVclNEV2plbS9iZFlG?=
 =?utf-8?B?Q3dRK1pmR0hXS29xUWp2ZjdWWXV2SGxuamdKeVlSTVdFUllqdWg1UzVwS3da?=
 =?utf-8?B?amNNbFRjQUFXM2E4QXdEc2pDa2VCbU16eXhXcWYxbDBGTGoyWUkrTHhVL1VE?=
 =?utf-8?B?bFljZWF6RU04eHdxZEp4MWhpZHUydGlkNC93UTNpcWJVQm9xbTZTeWNjcFZt?=
 =?utf-8?B?UzJOeDZKRVhOWUZ6bzB1VTk1ZTRNZHUvVHlHc2t3RS84WnhPY0EzYnpJUXBz?=
 =?utf-8?B?QW8wNFk1WDgrenRQNlRhQWpKMHZ5c0o2c2RjNFVCamM3eVpDNlZHRTVFWDE3?=
 =?utf-8?B?K1RUYlprN0N0SkdsRVpqY3pXeEZ4My92ZjZYMGpWRWZrZ25DcFhXRTlrSyta?=
 =?utf-8?B?NDB0SmsxWFdEVTlOWGhuVEJkendnZ25BWTgyUEpNZWxaZmN6RXFFa3gxeHg0?=
 =?utf-8?B?bFBDZFZkQk1CRlY5aGhWTS9PU0wvcjZxR012N2VjdkRhUk1OeDBLeDVmcWJ5?=
 =?utf-8?B?K09MRDV2YVdacHJZa3lpSXJEeWFxVDlOZk9SVkZQQ0JkcWVHVVFLcTBZZTdX?=
 =?utf-8?B?MjN4b2JCNzNSVnNOdmpRL2MxTWQ4Mm5UdG53eUVsWDBEUmkzYXdVRk1wS25G?=
 =?utf-8?B?VGVOQXgxVzlrNjRDblNOOXFvWmhpQjc5ZGlTZElvZ0JKU2ovTjJ0K3RjeXFt?=
 =?utf-8?B?bEUrbStpRFI2UzZYR2JlUDI1UkRUUG5RYzVCYTBSVUNiSkFMeUVKWjIzWXN4?=
 =?utf-8?B?SWdQUjUyNVFsaGloV3ZzQkM3dklzL1ZHZ2h5ZWtjdUsxbm9xaVRmT2dDZUlz?=
 =?utf-8?B?QnhOZlkvR1dOUzFpUGVHOEZRT3JYcVZjTEhuR25IYnpiejV6RUh0S3gvZyti?=
 =?utf-8?B?QXFVTUt6S2IxdjhBWTkyT0FZWXBmcFlaMmhnL3l0TVc0cEs0eFVwTG1ETjNW?=
 =?utf-8?B?ZjZ6ZXp6SDVFeElySFlYWEY0V3ZKb3NBYVU2Ujl1Uk4xZXNaWWIwaG9QK1N2?=
 =?utf-8?B?QTJucnV2Z3Ryc2J1aVNCK2xsckJ1eWxZRk9zOHBpVlI3aWNGRjlUYmFOZXc2?=
 =?utf-8?B?VnN5V3NlWFRSWENZb3RFWHVnUVZiQXlucUtaRnRhd0YxOGI4ZGRZbndwNmFJ?=
 =?utf-8?B?cU9nUHhPYXFYT21WK1k2TWNJdnR5STBlb3UxUDZwRmhPenNlbU0xbTRsU0VI?=
 =?utf-8?B?UXE3bWVoSDU4WDVRellCVVRPVjkyTmRBeVJ5U1J2bHRGVS9LUkhtVWgrY3dF?=
 =?utf-8?B?dGJDYTZUaHV0UElUSU9LQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkxqVmdTVEFuQkFuSWw0enNwVDU4UFI3TG9meGJnUFBaSS9kbjJUa1ZidEJ0?=
 =?utf-8?B?RXJ1TkNkYmhYZktVM0V3cy9TN3MwUlhJaVJlNWYxaVVwVEtpZC93b2x5K1Jk?=
 =?utf-8?B?ZTFMclhpdXBrZVhLM3hNajBGWFJXenFTVlNSMFJFYUg0QVVHbUtyamR3aFEy?=
 =?utf-8?B?Z0Uvd25wK3FRRXNwUnNodWp1V05BN1c2dFdFRFRQZDVzclRmbWtwZUdjTzBz?=
 =?utf-8?B?WStIK1RiR1EveTVpdEhrVEtxeURPUnJjbkcrZWMzdkdoWnVHVVNHNmhZUG5E?=
 =?utf-8?B?bk5uSnFFZk9KdWV2aTVzL0o2Y0twSi9sbXg1WDlUaEZMY0pjQTZUckt1TUZM?=
 =?utf-8?B?dmZ2UnBkU0ZoejFjTFVEVEpQREZyTEI1RXJMU3BRZGY2WklIWHNBUDBMZ00z?=
 =?utf-8?B?VlJscURRcFRnRm9UWE1pQzN5bnc2b1Z2cXAxaGVJa08xb2RTd1VzK3QvdUYy?=
 =?utf-8?B?MDRVdlhraHZBeEhGTU52RXpBejZxRjMrUjNkTkhpSWZCWDNpS3lBWGpGb0xD?=
 =?utf-8?B?RDFHMERRT3FSSlhRN000dW5YdEpTRXhZUHdnOTdXM2lHQ3FneERsNjVuS29t?=
 =?utf-8?B?ZkUwQmlJNEFwb3VyUS9jUituLzJaUmxmWkVWNGNIcEJGYlFoWkJEakdiWVBq?=
 =?utf-8?B?SDFWUXR2Mm9YRm1kVnJIM25WaEdvVzdGOXZGSTZ6Rno2a1RMZTUvN1c3bGdi?=
 =?utf-8?B?VFMvQlJ4cDFESlFWSEZtbDVzTmh5K09BcHhUaTJjMU1ldFpaVXFHZGhJNHcr?=
 =?utf-8?B?L2ZkMUtZeFR5YlFnclRWZDFoMmZwN1JNK3ZDS0VMQ0xtVHYvNmdYVjlSYjVP?=
 =?utf-8?B?dkJkUlc3YXZVQmJXaEJIVFlBL0kzQUM2ZHgzdVNNZ2NsWkQveTN1YzVpQ1pS?=
 =?utf-8?B?bGZQRTAxTmtKNTdkbWdvWkxLbGRaVXJyN2U3TUJUUEMxOXU1TVcrQzUvdStu?=
 =?utf-8?B?OXgxUGROMU9NMDNLcktZdmRTdmVSa1ZxcEtQZXAvQVlEN0R5RnJ1Z0FzNnRR?=
 =?utf-8?B?MXA1SzBGVVYvQ3NsYnYvYWVkZm8yWFhwVEFqR1JPOFllODgrM3ZNSXczZ2Jx?=
 =?utf-8?B?UWsybkljcXBnZzZLNExMcnczTHJNUkhSblpXS3FMVkZyeUdndkFVRjk4eDdD?=
 =?utf-8?B?ZVBiQTY5dk1NMmFVQTI3RjM4TU9BL0RneDQ2c3ZVMEFocGcrbFl2eitBZ2JI?=
 =?utf-8?B?cTNLVTFZeUYxVWF3b0NpRk9FVzNaQ1plcFUvQVlEVTF2N3NHZUhvY2ZTcFpC?=
 =?utf-8?B?RzdSMGVxK21odkV6ZjhFR2ZoZEVWTXF6eEpnOTVNTWNRc2dqNHZqSTVsNDlW?=
 =?utf-8?B?NXp3OFhrSEkvRGNwdHNoTjhpUklxU2tmQWlXSm9EUEhXRjFEaXhCYllNMTJs?=
 =?utf-8?B?SldmYWQvb0FoNjhJd3RRUjF6QTNhVWhMLzNVTktGV1UzRlVFNkNUZC8rZUhD?=
 =?utf-8?B?YjV3K2FqZmJFQklmcXhVaUNoL3MyMUo5MDhsbEMrdmdkMHRWVEFWUHNKYUY2?=
 =?utf-8?B?UC9xUXZoTEZZYTBPQm5QVm5Xa2NPd2ladUhva29vcW1sQ2t1N0MwWmUwUTlG?=
 =?utf-8?B?Z1N2NUczcUVKMXltcDlIbEphN3llN1l5SlVKekdlWTc1bisrTERzalhJR0ZP?=
 =?utf-8?B?cWJsSElFMEcyQ0FxS1gzcWJqV28yejQrT2pHdG9hTXR6MUxPVWRzc3d1QlFp?=
 =?utf-8?B?NURubThOOVpReFVod2U2c1B2WG1LalEzZ3gveVZOaVFYZW45R3l6QWlCdU9n?=
 =?utf-8?B?MHZJeTJNTXRuT2RIRU56UmV1dm1mREl1YUsvMXVKTjNLS1JmRzdaL2hyVVVD?=
 =?utf-8?B?QmtMUTFtZUY2SVRVTkhBd2xqZWRUM0s0dFpROWRpYUlLcEpBYStYQkk1NnVh?=
 =?utf-8?B?T2FPSnVJdFBYTUQyUVU5bldPMXowVFBvbXZoQytpVlZBRGtNSFVnT1RzQWli?=
 =?utf-8?B?dGVVbHc0bU9UL3cvMUM2ejh5d05NNHByemVuc2x4SnJ0SHJGMjM5UVcvSGxH?=
 =?utf-8?B?L1FIZ1J0TnEwSTZ2STdzQ00xWStQd0tTbWtWTTQ5WFVnQnRJYkRPWmR3Q1l5?=
 =?utf-8?B?R3ZsTHk1RUQreDdaMy9qVVBsWCtKVWhsaTY0MkNlNklOaEpzTkkvay9nK3lB?=
 =?utf-8?B?cklyZnA3Z1RIOTkvWVJUQVRtMkIrNENlbTJRamZmRkVmdVR4d1hMckd1Zklh?=
 =?utf-8?Q?HiK2cLLB561ZKAqcVrMDV2I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6dbb6a-ff48-4a2e-0491-08dcc040cfda
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 11:19:38.0187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcqXRvALB1U5QqLd/wuUTpr0s7/RudZAwBXabVyOlCjSPbYNRZ8/Ck6sI3T0EOv3fe537PoBh0/ng59TU6w1Z8oD8DwBWlQ44vqLP+/CHYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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



On 18-08-2024 02:34, Matthew Brost wrote:
> Testing on LNL has shown media TLBs need to be invalidated via the GuC,
> update xe_vm_invalidate_vma appropriately.
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6dd76f77b504..ac98973a90cc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3184,8 +3184,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   {
>   	struct xe_device *xe = xe_vma_vm(vma)->xe;
>   	struct xe_tile *tile;
> -	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
> -	u32 tile_needs_invalidate = 0;
> +	struct xe_gt *gt;
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];


XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE is not really needed.
Current driver code is with assumption that multi tile and multi gt (on 
same tile) are mutually exclusive.

But I see no harm with this and patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> +	u32 gt_needs_invalidate = 0;
>   	u8 id;
>   	int ret = 0;
>   
> @@ -3211,29 +3213,45 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	}
>   
>   	for_each_tile(tile, xe, id) {
> +		u32 fence_id = id * XE_MAX_TILES_PER_DEVICE;
> +
>   		if (xe_pt_zap_ptes(tile, vma)) {
>   			xe_device_wmb(xe);
>   			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[id], true);
> +							  &fence[fence_id],
> +							  true);
>   
> -			/*
> -			 * FIXME: We potentially need to invalidate multiple
> -			 * GTs within the tile
> -			 */
>   			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> -							 &fence[id], vma);
> +							 &fence[fence_id], vma);
> +			if (ret < 0) {
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> +				goto wait;
> +			}
> +
> +			gt_needs_invalidate |= BIT(fence_id);
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			++fence_id;
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id],
> +							  true);
> +
> +			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> +							 &fence[fence_id], vma);
>   			if (ret < 0) {
> -				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
>   				goto wait;
>   			}
>   
> -			tile_needs_invalidate |= BIT(id);
> +			gt_needs_invalidate |= BIT(fence_id);
>   		}
>   	}
>   
>   wait:
> -	for_each_tile(tile, xe, id)
> -		if (tile_needs_invalidate & BIT(id))
> +	for_each_gt(gt, xe, id)
> +		if (gt_needs_invalidate & BIT(id))
>   			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>   
>   	vma->tile_invalidated = vma->tile_mask;
