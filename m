Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C36C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 09:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6410E73C;
	Wed,  6 Aug 2025 09:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InqpfsiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC9B10E740
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754473386; x=1786009386;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z7n0fieUzlvgg+rdfvODeUoAj32kFdJh/+VFtbJySD8=;
 b=InqpfsiW4tqS2dXqesTEqGUAN07LXb4zF+C4iDxmIsk7HRElDJ/l/zp8
 COtZ0lENYlSmB6uafe6RXpJ8JZRKJ3WCyWjEkKVVCsaTuiUU67ulTuaCR
 NTO8McPdexhQC7qKba4bHgN2bVFFOt6El26Y/TdqVetASHj0qrfhPMGph
 Q5HuF1EBr6IOlw6ZtZKtA09HBl8edLp0BOPd03yMNLHKSoOKV3T9mL3Dw
 BSagtS0S3HxEn7FenQ3qxUcb8789YW+6BjnUN6YkLV7P848TGWmOYEX/C
 NOdZ6Ynj8BXC3LGcBGehgFO0hCW91scK5dWuhVKp4uc/FRpC8H+Lhgdlh w==;
X-CSE-ConnectionGUID: Z9dWq1mCR/q3AH7WnSXJtg==
X-CSE-MsgGUID: LU6nWPH7SCu4W5kMJUhTQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56748252"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56748252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:43:06 -0700
X-CSE-ConnectionGUID: x3Y+AiqFRdGCllnTpMCzHA==
X-CSE-MsgGUID: SoEdKFpZSU2RjD72MhX4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195569460"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:43:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 02:43:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 02:43:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 02:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imiNE/95VZEQyalIpKw3yy8DIXyNEctxEutv1OIftwln/ySzD48azNlnZF2tqlcTg3avddvMgfI88L6eVahQdBELNLG1+HyzIHSWmGqtV12JW0Lygx/1RLUAU8qzyCH0x9Kn2nQcLFrRHBuug1YYUXTZKD/32U+mIOjZZC2WjqLMInlxTAuoyShfRhQt/PVkTWBKrK4lj4cf+6J9PapWluEfjl4O59U/WgP7De1Do6ZicgSQJvPxAi4y6X5EDEDwrqs8rgPblNJ00CkFFZMnKJjSoFai00iZya4abWZstih2TnClPqGf6oPSBbtYq6sYhMDsxcxiQWjFXyFqqN91aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoD11ipOYnLhgQYgSdtftVM3AiYNen8Bg2eTH0EegQ8=;
 b=cAGXU1Cca/4Y1/+DOSW5ZDPw5kj+QWBffasly+9hVvl9QJX1uASocz+WVghhMUvN4TfOUoODBwiOAvRMg7WCxpqNoorOVWvkNLecTbejZVTa+JhK8+r80wMBTwxPQTFSX3AGIvWm+1khKahrYO1aYEDkyH3Xc5XNm7oWwn0r71tG51/W68xnFtVhrRIrCcoJpFD3v9K/p26pkE+6NxPZNCJBZEH0/UvTHXQFxTeo6g0ffWnz4GX5wpgv207rHtuAKKymsugpzhDB/BOMznyz9u6s5VgfA7OGTvQrYJxD7FNPzQINLNPkTGvxsL6jBEhS61aWKXmDHe0klZCYF9tldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Wed, 6 Aug
 2025 09:43:02 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 09:43:02 +0000
Message-ID: <b205a623-aa32-4f2a-a091-27873fb72f0f@intel.com>
Date: Wed, 6 Aug 2025 11:42:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/xe: Don't update wedged mode in case of an
 error
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <matthew.brost@intel.com>
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
 <20250731123756.29259-3-lukasz.laguna@intel.com> <aJKCfFvucbl-7lKN@intel.com>
 <7a670853-0c61-4d8b-adec-41e08594d696@intel.com>
Content-Language: en-US
In-Reply-To: <7a670853-0c61-4d8b-adec-41e08594d696@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0098.eurprd04.prod.outlook.com
 (2603:10a6:803:64::33) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 54750bed-a797-4924-c713-08ddd4cda28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0I5NVNoVGJzN1JxMUJ2QVVqdThLWm1VNE9qMUlHbjdxb2JGMmlPMUhCejVr?=
 =?utf-8?B?Z0tVSzhHQnQyZ2piZnBZazlxNjVlR0oxNlY3aUROU21jTU1QamF6K0pxbThK?=
 =?utf-8?B?TkMwK0FFcDRyeVZKREtuVlVPNjQrTkRsVTVuOWQwVndObTNjYTZrTkFrNk8r?=
 =?utf-8?B?T01XQngwUnpWM2VYNjJnSWJaY3QxVUhOVCs1YUNnS2JSd1JPRlVBbVpmakUw?=
 =?utf-8?B?M0lkYUlTK3c0enhCYWZCTEx1OTBiRHhSbVRzMHJrTXZBYkN0elRReXZWRFpG?=
 =?utf-8?B?eVRucTEwaUJoZzM4TU1KKzUxYW5RTndpNXNDY1BHYnpGaGIyZklXNStjaStI?=
 =?utf-8?B?ZU8zQ0l0bVVuYzJCYTJBQjBHWndmbDFQRzBMTXEzYTVvSGFJaktoVEhSVVI2?=
 =?utf-8?B?RGpWK1E3bHFqdTdhQ3lTK0Zqc1VCWW51QjBJbGFoOER4WU4vUGUwTmpuVjAz?=
 =?utf-8?B?MEk1UzBIWFppNzhLTC9kTVIrNW1OVkVvWHBsZVdQQnI3eUtzUlFFdGx1bkt1?=
 =?utf-8?B?bXVVczlhSXBEVnJKV0pmL0xkd0FaYlZsUmdNR01ZUXFhdjZEZGpJVHFTRUps?=
 =?utf-8?B?aXF6ZjhBM3AyNC80MTdYR1BxUFJLUDlIWFQrK3hueDBPWUxIL2Q5dVl4NmlX?=
 =?utf-8?B?a0lITmhhdUh1QW9VVFhNNDF6VllBVks5eVpLK3lHVXFaZmlmVXVQc3F5Ly8x?=
 =?utf-8?B?S2tiOFI5QVdSOWNTMEJCYytOTXBFM3poUU01bEl0R1ROcStCTzJ5dnQ1UWRG?=
 =?utf-8?B?MjhaaE91QUFOL1pEZjZGcU1xQ2ZZYWN1emFObnhjT1FIb1V1R2JDMFRPcXRy?=
 =?utf-8?B?eGRzaDZnYlE0TStYakd3NkY1Q05uUnhmYW9UcFRWQ0h2aUQwYkU5MStjL2lo?=
 =?utf-8?B?ZXVlWGt0N1l6RnpnODVpLzEvWnRpMG96UHNwRzBMSmhGR3p2YUluck1aZ3Zq?=
 =?utf-8?B?WGoyMTJVV0w0OHgyaU4yMFRRRFg3cEpZYzN6OFh0TFRRTDlBNlFQK2Y2ei9B?=
 =?utf-8?B?R25WejduRjhGVE12V1FFMFA1Z05pMUVCSm9WdU92a3E3SGVtRFlBMXY0OEov?=
 =?utf-8?B?SnQ5RExQQVRTa1JhcS93ZllpSG84OWFHTW1OczdKaTdxcFZpYmNxWDRab1U0?=
 =?utf-8?B?b2ZNUlhQZlErTVdGdjJ5d1h2T0VKaXY0QmphcmdtSEV0ZVFwL0JGcWJGMVIx?=
 =?utf-8?B?V093d1A2TTBYbHpyYTFNMVZ4Yyt6RUhXWDJsbTBFU3hkU1FOM010V09nUWxy?=
 =?utf-8?B?azNFL1hHVVpvV1lpS3B2U0tqcEJwZ1ptVkhhK0U1bnR2UkdDQzlRTVZsT2d5?=
 =?utf-8?B?Y1hZdSs0ZjMyUDQwZW9vQ0JQeEJBSVhLSkIrcWEyUDVOME1BS3FCVEJqMXQ3?=
 =?utf-8?B?MGdYRmE0MlZ3Y041MjNRVGFiTDBSUTdTWGdlWDhOSTEyVTZWQU5HVytMNVRl?=
 =?utf-8?B?VWJDeEJwWnpCUEc4UTd5NjBMZVZoRUlZNk45dkptaGlOZ2J6QTg4a1FKeEdq?=
 =?utf-8?B?UjVEaUtDQXNqSlZkN1pzaVRweWZRcStDOTRxdWJpWXF5alJCTzRzSGZ6Njlk?=
 =?utf-8?B?cWxsU1FzcVlwM093VDNGSzdUMUprV2RhaEErZUVnMU9WUEZ5S3pEdFpob3dN?=
 =?utf-8?B?cHhMMXZMV2FrSGlnbGVrQVlwQ2NNUXBRUWl3VndHc3EyREh6ZnQ0dWdTa1ZJ?=
 =?utf-8?B?YUtGTW9VQVNRYlJpb1o5bDNCTHBXVjNwS09yQ0wvc2xEUDc0QUJmQmdBMVFx?=
 =?utf-8?B?cENkK284b1JSWXljbG5TWEJUUmxBVWRSRXBhNjhUNG5mQnYrdGdwMjlJTXBp?=
 =?utf-8?B?NktuVkdCb1F0Q2w3VWpXbEs2S1hBTU54ckQ2TW5yL3pKOXRLR1did2xaaE45?=
 =?utf-8?B?eEFkOGZRc2ttc2RzM0tYT0xGaG5KdWNNeGw3eWh5ai9YMFBWcVByRDlEeXZ5?=
 =?utf-8?Q?6gkxajlSC5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJWNEhJMktKeTlnSysrMklRb3dHY3lESHZkQ2xWWkhaWjlMdGFtU1pVUU1o?=
 =?utf-8?B?NmFaS0cyVisvSE02TFV5NUVQRWhlaXRBbjFPRVNSVFdSbDZNbGlpaHVRdTVh?=
 =?utf-8?B?c0xIOHFWVFV6c1NzQjN2Ulg5Y0VUaHF5dmttNElhbllyYkdURk5wVkJhL1BD?=
 =?utf-8?B?dmJqb28xZUtUTWdMTmxWNGlMVFF5dmtJNUFHREhVRDRZMDdNdHpGUzcybzll?=
 =?utf-8?B?UDhUTENhUndpb2RXUVZWaHNRcEpLb3BtYS93ZXVsVTgrblV2TGJQTlJFMzIy?=
 =?utf-8?B?MmNvb1dENHY4R1hONUVwaGY3QVRlNU0yaCt2T25OT00zL1RwL3NtZU14aldp?=
 =?utf-8?B?SFZtSG9uMnJxTHhWamZPM3Y5SUxldGRrdjdZNXBPTEVXYjM1SzRqVjdRTjBX?=
 =?utf-8?B?OC9MTDlvYWlKRG5TWURJTWdRV25IeTNVcGx1TmtVK05HVStic2FDSmJ1MXNY?=
 =?utf-8?B?UDBZZStRVndtMGlKYzhscUIrRFpTVkc1N0JzWnBJSmVwSGFkSEhOYUtCOGhU?=
 =?utf-8?B?aGZUaDZ1UWhHdVZBTkFRV1AxTjFYbWl0bC9WVUtIV1dxUGs3OUU3c1hCM3lF?=
 =?utf-8?B?bnBscjRSbTA0d0xYMDZOWnVEOVN3WmtUWkFKUURlbHVhNEN1ZnRCVHRXY0V3?=
 =?utf-8?B?MXFoQnhIaGtJTnB2NUhicmQ1RUdKZVhZbWhsUm94TG1WZ3hjVGJTT01TVC93?=
 =?utf-8?B?bGJvNHYyN2tISGovRFNUR1NpRUNCby9KWEdRN1VIUDNKK0FZZWFiQ2IwRmtj?=
 =?utf-8?B?NzdkOUxYR1VXbDlMa3I4Yk96RlFjR1k0YkxyV0wvb3JpOURFeUZGWFZLd2J3?=
 =?utf-8?B?cDRJSGV3MVQ4UkZ1VjNhMWNCMldJSWRMZExDdUpwYUx6NkZzUStNZmY0MUdY?=
 =?utf-8?B?cXNySHZRQkpWTjFIVmNycS8xdmM2UjFySDhWcHp5a2IvYVYvdW1hMzF1bk5m?=
 =?utf-8?B?UnViYnVJcDBXVnFqcFZMMjhHbE9TT3pwNXo4SmZHL0piZWwwbi9ibUtnTTBH?=
 =?utf-8?B?Q2V2SDUvdCtBZ2JVdlFPYi9BMlNkRm0xdUcveWs5aWZraElwYkpVRm1hMzcw?=
 =?utf-8?B?RDA3VHhRcklEZXduYmhPSDJxa1FuSGhoV1VrOUVuZXI1RnB6SFdIb0lFWlBG?=
 =?utf-8?B?c3habjZGNjU2VzZobHIwT0NieC8vSDJzdUNOc3VIendkTUtIWDVGdUlkUVFC?=
 =?utf-8?B?dVdOR0lPRDlTSkVBZldHZm52QUJpOEl4aklqZGI0eFZGanZTbkhpb21kSlRj?=
 =?utf-8?B?S1Z5U2NHcldTSjlWZHBoc2dTRmxDbjQ4WnRVejVyanR2blFwNXdUZWxtWm84?=
 =?utf-8?B?ZmFFYnRrY1kxV2Qrb3UrM3RoOXpKajAxVndIdDlqUjZ2eU1WQjF1ejRPWWVJ?=
 =?utf-8?B?TWJWNCtzVFRqM2l5THlsNG5UK0dyQXIxMHA5UkpFL2lBaC9mMmI4R1ZJN2F5?=
 =?utf-8?B?cU5qNlpaeXR1NEs2bC9ERmI4UyswMnRHc2xsL2IzSGhnU2d0ZjBHSmtrenow?=
 =?utf-8?B?c0ppeWtJeS9ET0FQSkVSUkRPbWlHZm9aVEpGMWM0azEzMFF1Q2dSbGtLSHFI?=
 =?utf-8?B?ZnRoNTVpTjhTMlRtMnNpbXo5QW8ycHl3SHh2V1JXdndlN0N4QTFmU2FZVk1V?=
 =?utf-8?B?U3RoSGwydVZjVnFPdFUzQWZWaFZ4SW5QRWJSQ3R0VVkyd084STgySVpWNk9j?=
 =?utf-8?B?bVdZZTd5QjYvbXd0YWhZdFdqRzBMVTdldDBRcTMyTERhMGlrZVVYV3NzWHZo?=
 =?utf-8?B?ek1aWmxWdzlxYi9mOG5EY05pOThTR1lhWXQ4bXBQTlBWSjJxc0pUdlhiNkQz?=
 =?utf-8?B?YkxlczlBZytpUm1sbWFnUmI5MnBuWHp3WkFpVFVXUDVaZzRRbHZLQVlQZzJS?=
 =?utf-8?B?Y21Bck9pcHBRd0Z1Qmc3dDlCWHpWSVoxT0Zzc3llMUNjOWlEb1F2Tk9yRTRO?=
 =?utf-8?B?UC9STFBmVEVHc2wyL1pCajNTQng1Q285aEM2MnpSS2NPcnFsdExacUhCbWlU?=
 =?utf-8?B?UjBOcElTS1JXaXhpeUYrQzYwazVRK2gxaHVwSS9DRVZtNEZjUkhKMHN3eENV?=
 =?utf-8?B?REVaL29Ncit4RU5BWXR5ancrR0NHY05rQ3VNVE9mUFp5QzRzZXBhcTVOQjF6?=
 =?utf-8?B?SC9YNUxUc0MyRndyWlNjTHQ5Yi9YdTJsQUhmZ0R2amEyRjlkQ3BHVVdpNkZP?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54750bed-a797-4924-c713-08ddd4cda28e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:43:01.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yU+p/0yp5AAx3nOsg9XHWUMgTkGni5ZWdPAiPAya8DjIfQAYmalWndP4l/E+9JgL+wEfVrnZoO9nZ3D5ANkRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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


On 8/6/2025 10:37, Laguna, Lukasz wrote:
>
> On 8/6/2025 00:15, Rodrigo Vivi wrote:
>> On Thu, Jul 31, 2025 at 02:37:54PM +0200, Lukasz Laguna wrote:
>>> Change driver's internal wedged.mode state only in case of a success 
>>> and
>>> update GuC's reset policy only when it's necessary.
>>>
>>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>> v7: Don't introduce XE_WEDGED_MODE_MISCONFIGURED enum field (Michal)
>>>      Add needs_policy_update helper (Michal)
>>>      Rename wedged_mode_set_reset_policy to set_reset_policy (Lukasz)
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c      | 72 
>>> ++++++++++++++++++++++------
>>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
>>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
>>>   4 files changed, 68 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index 16b2e306559a..8aff93401eb9 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -251,14 +251,64 @@ static ssize_t wedged_mode_show(struct file 
>>> *f, char __user *ubuf,
>>>       return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>>   }
>>>   +static int __set_reset_policy(struct xe_gt *gt, enum 
>>> xe_wedged_mode mode)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>>> +                               !(mode == 
>>> XE_WEDGED_MODE_UPON_ANY_HANG));
>> mode != XE_WEDGED_MODE_UPON_ANY_HANG please
>
> OK
>
>>
>>> +    if (ret)
>>> +        xe_gt_err(gt, "Failed to update GuC ADS scheduler policy 
>>> (%pe)\n", ERR_PTR(ret));
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int set_reset_policy(struct xe_device *xe, enum 
>>> xe_wedged_mode mode)
>>> +{
>>> +    struct xe_gt *gt;
>>> +    int ret;
>>> +    u8 id;
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +    for_each_gt(gt, xe, id) {
>>> +        ret = __set_reset_policy(gt, mode);
>>> +        if (ret) {
>>> +            if (id > 0) {
>>> +                xe->wedged.inconsistent_reset = true;
>>> +                drm_err(&xe->drm, "Inconsistent reset policy state 
>>> between GTs\n");
>>> +            }
>>> +
>>> +            xe_pm_runtime_put(xe);
>>> +            return ret;
>> Why to return on the first GT? perhaps we should continue and just 
>> leave one
>> behind?
>
> But why continue if we already have an error on the first GT? If it 
> succeeds on next GTs, we'll end up with inconsistent state.
>
>> perhaps we should have a 3 times retry attempt logic before giving up?
>
> OK, I'll add retry logic.

After more thinking I'm not sure if it's a good idea. On -EBUSY there's 
internal CTB retry logic, and in case of other errors I'm not sure if it 
make sense to retry. I think it would be better to leave the decision to 
user if he want to retry or restore previous mode in case of 
inconsistent state.

>
>> perhaps both combined?
>>
>>> +        }
>>> +    }
>>> +    xe_pm_runtime_put(xe);
>>> +
>>> +    xe->wedged.inconsistent_reset = false;
>> then move this to the beginning of the function
>> also ret = 0; up there
>
> OK
>
>>
>>> +
>>> +    return 0;
>> and simply return ret; here
>
> OK
>
>>
>>> +}
>>> +
>>> +static bool needs_policy_update(struct xe_device *xe, enum 
>>> xe_wedged_mode mode)
>>> +{
>>> +    if (xe->wedged.inconsistent_reset)
>>> +        return true;
>>> +
>>> +    if (xe->wedged.mode == mode)
>>> +        return false;
>>> +
>>> +    return !((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
>>> +          mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
>>> +         (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
>>> +          mode == XE_WEDGED_MODE_NEVER));
>> This is worst then the one above... please expand this to inside
>> the function instead of this overloaded return full of not-or-and logic.
>
> OK, I'll expand this to inside the function.
> I just realized that additionally this logic can be simplified. Policy 
> update is needed only in case when we change mode to or from 
> XE_WEDGED_MODE_UPON_ANY_HANG, so it's enough to check this.
>
> Thanks for review.
>
>>
>> Some wording about what cases are this in the commit message should 
>> be very
>> helpful
>>
>>> +}
>>> +
>>>   static ssize_t wedged_mode_set(struct file *f, const char __user 
>>> *ubuf,
>>>                      size_t size, loff_t *pos)
>>>   {
>>>       struct xe_device *xe = file_inode(f)->i_private;
>>> -    struct xe_gt *gt;
>>>       u32 wedged_mode;
>>>       ssize_t ret;
>>> -    u8 id;
>>>         ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>>>       if (ret)
>>> @@ -268,22 +318,14 @@ static ssize_t wedged_mode_set(struct file *f, 
>>> const char __user *ubuf,
>>>       if (ret)
>>>           return ret;
>>>   -    if (xe->wedged.mode == wedged_mode)
>>> -        return size;
>>> +    if (needs_policy_update(xe, wedged_mode)) {
>>> +        ret = set_reset_policy(xe, wedged_mode);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>>         xe->wedged.mode = wedged_mode;
>>>   -    xe_pm_runtime_get(xe);
>>> -    for_each_gt(gt, xe, id) {
>>> -        ret = 
>>> xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>>> -        if (ret) {
>>> -            xe_gt_err(gt, "Failed to update GuC ADS scheduler 
>>> policy. GuC may still cause engine reset even with wedged_mode=2\n");
>>> -            xe_pm_runtime_put(xe);
>>> -            return -EIO;
>>> -        }
>>> -    }
>>> -    xe_pm_runtime_put(xe);
>>> -
>>>       return size;
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 1e496845c91f..829252db3a47 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -546,6 +546,8 @@ struct xe_device {
>>>               XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>>>               XE_WEDGED_MODE_DEFAULT = 
>>> XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>>>           } mode;
>>> +        /** @wedged.inconsistent_reset: Inconsistent reset policy 
>>> state between GTs */
>>> +        bool inconsistent_reset;
>>>       } wedged;
>>>         /** @bo_device: Struct to control async free of BOs */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index c4ea4e6d82ce..7f58d77e0ab9 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -1033,16 +1033,16 @@ static int 
>>> guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>>>   /**
>>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>>    * @ads: Additional data structures object
>>> + * @enable: true to enable engine resets, false otherwise
>>>    *
>>> - * This function update the GuC's engine reset policy based on 
>>> wedged.mode.
>>> + * This function update the GuC's engine reset policy.
>>>    *
>>>    * Return: 0 on success, and negative error code otherwise.
>>>    */
>>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads 
>>> *ads, bool enable)
>>>   {
>>>       struct guc_policies *policies;
>>>       struct xe_guc *guc = ads_to_guc(ads);
>>> -    struct xe_device *xe = ads_to_xe(ads);
>>>       CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>>>         if (!xe_guc_buf_is_valid(buf))
>>> @@ -1054,10 +1054,10 @@ int 
>>> xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>>       policies->dpc_promote_time = ads_blob_read(ads, 
>>> policies.dpc_promote_time);
>>>       policies->max_num_work_items = ads_blob_read(ads, 
>>> policies.max_num_work_items);
>>>       policies->is_valid = 1;
>>> -    if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>>> -        policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>> -    else
>>> +    if (enable)
>>>           policies->global_flags &= 
>>> ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>> +    else
>>> +        policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>>         return guc_ads_action_update_policies(ads, 
>>> xe_guc_buf_flush(buf));
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.h
>>> index 2e6674c760ff..9879aadd22d6 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>>> @@ -6,6 +6,8 @@
>>>   #ifndef _XE_GUC_ADS_H_
>>>   #define _XE_GUC_ADS_H_
>>>   +#include <linux/types.h>
>>> +
>>>   struct xe_guc_ads;
>>>     int xe_guc_ads_init(struct xe_guc_ads *ads);
>>> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct 
>>> xe_guc_ads *ads);
>>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads 
>>> *ads, bool enable);
>>>     #endif
>>> -- 
>>> 2.40.0
>>>
