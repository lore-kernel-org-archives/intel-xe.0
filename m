Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEA4D2C562
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 14:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEA610E1F4;
	Tue, 22 Oct 2024 14:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aF3RousJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A8E10E1F4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729608953; x=1761144953;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aNTuVrq53wTO0pV/rwu2LicL1fOBT/fFT98AQtTtzr4=;
 b=aF3RousJsVgAAY2p1OoKjd3aOBtXWLGRr398WkVzAMNLW+xq661wk3jC
 4GpBajm+823zuSyazLtobPsg3f1XP40mZ4IsBC/mYW7gDGuBeKDV5Dju2
 NzHj9zTZ05PTDxmsTU1WHYzZHBewxafwapY/8f+0fLn2vIYeEk58M+hna
 GzXdJW2OtrggyqyTBUYqlWo0nZN3mspfM+rhm5Xa0HXHpCZw/FeuLDbVF
 MoR+h3ZaXD3xtiBepmob2dgKI8gVH3pjbgk6tuZ+2uL3KVwJ4gwLYa7lg
 RkBjVrOS0wuQ5IidCNb2/2cG4lFsdnPAJMdE3rzuIqJDkTv/4h3i4KYO6 g==;
X-CSE-ConnectionGUID: 7MhfCu9xSQWy+Uf4Cs0ATQ==
X-CSE-MsgGUID: w9mMr9juSUe2+ifg/Iva9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40542394"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40542394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 07:55:52 -0700
X-CSE-ConnectionGUID: xhGHGyEYTlylc63VQdxBlA==
X-CSE-MsgGUID: wk0FafFKRu+TlFlaYM5HCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84508073"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 07:55:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 07:55:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 07:55:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 07:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNzL1hGFig/yW3TXc36SsPCnGsqPxMaQv4d/pB9U7I4HzzOOklOh70US1gOf45xEcDXL7CxZqZwt+fdk3LG3TU7EPooCiV1WcNMhPgggqUU8oU4RBhdoyN17ETln6OwsNMUGHqU2otFr44VcfpE4+21ncM7XZ/nsZYPdpV8e7KHbaTa7UH6v7NPgxCXIemc+ih7DPHImswnaAVycMvmJPUGfI68z/5EromMIqYNlPuzaaoTOW4JipqTO8ekoviQN5Dvk3ZKeGPGRlKy1o28/zXz6e43MZQbUhoyiQxVMUiuDkPTQLK2K8OVC7lAJvST74L6HkQeX6VastyE8iEizqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMSnCx10EQS6amNgHFWR3VOC3JhJsRpv4kNJXhTpVKw=;
 b=erGaAEXI9pMqZnb9/V7Tn/jNeuVEcAAKJk9eeDD8dq4SsBk2NYnmfj5xyfNSVfyxywinw8R5DesO9M9inc2SogLhS1LcLnsQLVMCV+oT9JzrvT+aLKnZlTV4SuNUJeA7IHMLbNKD1IILNbm0G7ugILh6V+PdyTe1e3Udun/kyla5Dicd8o3jvlpH1VaFBz7btWYpXVruqYfwmtm5rDAS3b4VuYR3X9NALs3MMojumPj31DGJhwV3FIuavkHOnWO7Z5vnUGDT44wv4V1ighwnJSBP98lBcSzrMXdG7HFAjuyuSllJgsS997t3wH8LL16d4Oaa8Cp0hcsU8WcJ4P8z0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 14:55:39 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 14:55:39 +0000
Message-ID: <d0e28830-0ce9-4dc8-a2c8-b4d310779fad@intel.com>
Date: Tue, 22 Oct 2024 10:55:35 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Pr?=
 =?UTF-8?Q?event_GuC_register_capture_running_on_VF_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241022010116.342240-1-zhanjun.dong@intel.com>
 <172958839201.1308984.10805647141787789043@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172958839201.1308984.10805647141787789043@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9c9ce3-61ac-4fd9-f593-08dcf2a997b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnlubkZVMnlGRXAyVmprbFBJYXhFa2NGMFJ5Q1NrMmlyS2JocG01ZjJnRzJy?=
 =?utf-8?B?MHZGYjd5WmF0b2NnU2V1RkgvKzVXOFZFU2lQM09KVEhGSUdnQnJhVlliYUNo?=
 =?utf-8?B?Tkc2N1VGQWlrOE8vOUkvQ3VDZXFVcTFtUDZCT0ZCTjFud3M1cHIrU0tSckpY?=
 =?utf-8?B?QVdPRk5VQ1R0cDlxajRaNzArMHlJaUhaQXdZYy83UmRqWktNVVU0Y3dUNkI4?=
 =?utf-8?B?YWFhV0x1N1JQdUlEN2pMQXo4OWxUb1Z5cktISHdTUE1RbmdtV01ML0ovK2c1?=
 =?utf-8?B?VjBLWThCcktIcEcxS3UxdVUxbU9lTEY0MFhCYlJYQ2ZDbDRlVnFTVDVJTjU4?=
 =?utf-8?B?STIvdjR1eWdxbDBlTTdSamVmVDBsZ1paNU1tc3ozYmY1elk0TnJvQ2tXT3RI?=
 =?utf-8?B?ZXk5eENRYmV6SzhvN09SV2NLZHp3UXQ3Sm1tT1J1dFE1R3FGTGY2RHFEQkxD?=
 =?utf-8?B?VkM1YStrNm5zdEZBa2ZINkJDTmR1ZVZtQnV1QWhlTHp6TGVOcjVLOEpSdHBx?=
 =?utf-8?B?WmFFVnRxd25teCtwVFhzb1lCSGFMTHAwZGZIR2NydWxuOTBYUlBGeEpGWW1V?=
 =?utf-8?B?VFhuNjRJRUdXVDdPcHNpTU1DblptUWJnRlY5Q2RNQmk5QXpObkVlMklCZjlT?=
 =?utf-8?B?Y2pvd1V6R3U0TmgzRVFJejllUnNSQkh6QzhhMEJTNnNTOUIyajd5bVVXUnFZ?=
 =?utf-8?B?dGszTzh5RmJlbWVHOEhzaVk1VXEyc0dHQ011SUZRT0J2NEVVaVBWbSttdDdG?=
 =?utf-8?B?SjVZcWl1UG5MVlBBa0hhYlhUbkZMeHpSa2FDV3FmQjJXYWtVZ0JZb2E4OTkz?=
 =?utf-8?B?THM2ZStOMEJ1WFNYbGJ6UE4xZVRGWFRUZy9EeUFkRm9JWlc3S0hkOGdjWUlo?=
 =?utf-8?B?ajh6K2h6SnB6eHE4MXF4NEJKS3lOTkMwbGlYZytPbE5INnhwd1NmVmVYNU0y?=
 =?utf-8?B?NmxxV3ZMWTM1UFp1M0J1MmFLaUJncFlhWml4VHliMmpUYlVPa0FiZUhhTmhR?=
 =?utf-8?B?V2ZXZS9zbS9PRHVzZDRnZzJ3blBmV1A4YXV2d3BTbCttZ0pMaGR1Zk1Tdi8y?=
 =?utf-8?B?NG55MnZLbkthTjZzZkcrNVJhdmtrdGRPMkMxRWEvWVYvM3Q3QjdIZlphRC9s?=
 =?utf-8?B?SGxlUXI2QjVJSmNPa2VDNUtYd1hGNk8wcGtQRFRwdkpaT3NhbVhsdmtMT1Vn?=
 =?utf-8?B?MGlsSU41OUNoeC90b1lCTXR6eGN3NFc5MjMyREZucVc0Yy84Tzc1dEdGQXB2?=
 =?utf-8?B?bklFalk5b3BseFJXVFVSNTU0MmRQcUFiVGV0SlFkWS9Xc0pOQzFHc05mOHRZ?=
 =?utf-8?B?R0lSV0JDVkxTSjJieENuZDc3TGJMaEJLL3RJOHhrZVNoY3Y5NGs3OWZCRGlz?=
 =?utf-8?B?OG1aeXNqRDNWanY3a3JUdjdqTnpIK3VEcWltMjA3VjNBeWQ1dkRCbHl3YUpu?=
 =?utf-8?B?OXV4Z21qSFByR09xUE9uMzlFSHZYTy9tc2c0L0JrZFVKS1JhV1o1TlA2dThX?=
 =?utf-8?B?K0JtMFh6MjNJUjF6Nis5eE0vcUNkQnRJU0x0QW1Da0g4S25kTEFyakd5Z203?=
 =?utf-8?B?d0dUR1RiMStza3BmaHg2ZDZKdGZIRGpucVZIVFZ5KytyYXI2d2ZTZ284VFg3?=
 =?utf-8?B?c3BCWnZLWWlEcnF6UktXQUNaazArSkZCQ2NhUDlUSjBKSnk3U0lDSkF1WU0x?=
 =?utf-8?B?WWhQdXNKOUdtS0Q3TGlpdDh1NXZhcC9ZK0xaelBnazU3c043WHN1S2F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjFtcDhBT05FK3M3cXFZNkE5UWZVbWtRQ3NaUHpwekZmT2ppV1BTZExSTUg3?=
 =?utf-8?B?SVNWcWcxTGUvUURkOE52NHl6aGxvT1NRS2pRUU1wa0d0cHZNdWh6VDJBMHNS?=
 =?utf-8?B?UzlnQVNmYWl2eUtFOXo1TDZjOVpRNG9qYnBySmk5VGJ5Y0VZQ1dCby9UK0hu?=
 =?utf-8?B?NTRoajM1Y0VDT1VKV3l3Vi9DbUJaN2RpaHpUbmc2V2QrYjQ4NUp3a3NhM3ky?=
 =?utf-8?B?dEFsOWVtZ2RhYmxMemNNVVB5cnlnQ3dnOUR1blBEMmVzaVhtVlJTWVQ1aTdy?=
 =?utf-8?B?bVNwYVh5THlxRDBDb2lTU3E2Sms1d2tkYmdnOGtIeGs3VlIwakxZUmRvUXNh?=
 =?utf-8?B?ZTZyT0hnWGYyc3dqUGlCbW5GcGJpYklaWlR4c0pveXp2SSs5R3BFOGdqY2RD?=
 =?utf-8?B?NnJvaWVtcmpUcEhRemxMOHFYdmI1U2VzZC9qOHlkRW9KbFAzZ3ZTVjREdlNy?=
 =?utf-8?B?OHBqZnd3cW1aa0ZZSitmbXhwTGgyczhLZjhxUldPRFJDdGUzQjZ6M3Z3enc3?=
 =?utf-8?B?SVpYY1FJNmN2TWZBYy9uMEFVeTNjU3RLeTA4MFRCT3JMblMxQ2RpckdjSG5I?=
 =?utf-8?B?Z3Z0VVBnbW1jRGNRMXoxMlpYNWtuLzRTWUFDRW1sckZtV3p6amJSY1MxTFky?=
 =?utf-8?B?Vm9sTWNLMFA0aEtEZXhhM3MvdG9pbnQvVHUzdDhxNlRxd2FEQzdSQVBPY0Jk?=
 =?utf-8?B?TDZOazQyYTZ1YnJCUjdOVTRTMXNCT0taOTJLNTA0aW5BczlPSWRramhOSDcx?=
 =?utf-8?B?Q2hSRzlEanJ4QVJ3MlNQR2xVOTVHMUJnQnNwWEdpTVo3MEZqVk51cGZldkxi?=
 =?utf-8?B?by9CYlo4TFhZV1l0dEJnLzhxaVdjWnhpNUNGSTEwdmVpa2ZCcHRuNU9ROGpo?=
 =?utf-8?B?d3RUdklQdkNHNzN4OEt4UW5uVnBEaDVGa1FjQisyc1JwUDV3aVEyL0pTZW80?=
 =?utf-8?B?Mk5lYnl5aVpNbWtOcWpQaWhsSEdnYWlsMkFBSFlUN0dMRGpibXV5WjFmcVVq?=
 =?utf-8?B?NjBhRGk4QWRsK0lJeW5xQ0JiMERCRXkvb3U2blFPRXUzdmlsU2dlTUxFQ3lF?=
 =?utf-8?B?ZllSKzJEdFlGdmJBejFraTFwSXk0SWVtMW5DZS9xNWRBTURNZUVJTW43ZFV4?=
 =?utf-8?B?dVkvMGJxZGVuYm5xdlEwQ0syUmo4VHZmMzVpZ3NOL0gzTitWb2I0Y204bzZx?=
 =?utf-8?B?QUc4YWhHVFNBSlZ6eTBVWldtckZieU51Tnp3RXFIN0N5RDd1Y3VUVGI2M0U4?=
 =?utf-8?B?RWhwZzJrejNvYTJpaHlGRkFhVDl4L1ZiRlBqaVh5R3dKb1pPdlc4Z3BIVGY0?=
 =?utf-8?B?VnpRQ2ZQMS8yVWxzWG1wUnQzbEllRm4yT2RoaXNvR00rQTFiaExxYjhqVEY3?=
 =?utf-8?B?SVp2MGh2NW1TZHhtRmJPTllpcDMvYkd5aFZOcUZ5SHFrTE5SbDIrSU9NNlpV?=
 =?utf-8?B?bEJGZzlZSXJhV2xVaUwzay9SbDlVb3F6cWo0YUN1Tm5IRnptbFM1Rm5qdGtC?=
 =?utf-8?B?YjI0dXV6L3pKSjJYUkdqYU02UUZwUDdFOXVYa29SNlFza2NuK2haUW1DVHdP?=
 =?utf-8?B?RmMybHVBWU5NTFRWdy9pSFc2NGlCMmkrd1F6NjNSRkpwRXY1d2c1UVVlRmVx?=
 =?utf-8?B?cmRMejFMVlFPNlE2c0dwU0wrcENpRFhVd2syVGZOcmxhLzZPeXE4SGtNOFN0?=
 =?utf-8?B?UkMrRWlZZEZkQzdWK0N4N2RRc3RydUNRNlJRdGswaDNrOFkzQktxckIrbVJz?=
 =?utf-8?B?Sng3VHhxMVMwc1htSG01UEpzTmwySU9QZUtiUkpjYU4weTI3VGVCZUcrVE5S?=
 =?utf-8?B?RWgzbkhRTHBZd3VpUjJaclRQOG81amJJV3R1RFRXMkRKajVGaWhDaVBGOUw3?=
 =?utf-8?B?eFJTaTY0ZVdPVXN5L3ZoRXM4aE1nS2JuTnc5aTNWeWhiRlBmVXlaY2ZYc3Zl?=
 =?utf-8?B?ai9nRURMVkE5Vk5ncnVxSU04SXlqTjBnSnQ4dnFaNjdLejAyVE8rM2JUOGNI?=
 =?utf-8?B?MmV1RUtORG1qVElXVE5GY3gwNmdQTHp1RVhIWlZlanhJcm1WOW9IVitnM1VV?=
 =?utf-8?B?WWdXSS9oUzhqanVSQTlvMmF4VFV5dzVPcUZ0cXliamNjdTV5aU9CVEhGM1po?=
 =?utf-8?B?QmE0RFJWemxaeXNiblY2OUZDbTBJSEZnVndSTVZSTlBFUEFGb2NJRGNuYWNW?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9c9ce3-61ac-4fd9-f593-08dcf2a997b9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:55:39.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1S20FLETysh10ElLg2zpUsx18jDzZMXUKzUSM/S7Q2rTpxxEUfyg48kl2HkSSQkPVu0IbGp3Jz/unALUnZkvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
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

All failures is not related to this patch.

Regards,
Zhanjun Dong

On 2024-10-22 5:13 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Prevent GuC register capture running on VF (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/140208/ 
> <https://patchwork.freedesktop.org/series/140208/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56_full ->
>   xe-pw-140208v3_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-140208v3_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140208v3_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-140208v3_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2.html>
>   *
> 
>     igt@xe_exec_threads@threads-cm-shared-vm-rebind:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html>
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-8/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html>
> 
> 
>         Warnings
> 
>   * igt@kms_content_protection@atomic:
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_content_protection@atomic.html> +1 other test timeout
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-140208v3_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@intel_hwmon@hwmon-write.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_async_flips@test-cursor@pipe-a-dp-2:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_async_flips@test-cursor@pipe-a-dp-2.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@kms_async_flips@test-cursor@pipe-a-dp-2.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html> (Intel XE#2436 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) +3 other tests fail
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-multiple:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-multiple.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_content_protection@srm.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-top-bottom:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-bottom.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-1/igt@kms_cursor_edge_walk@128x128-top-bottom.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) +1 other test fail
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_feature_discovery@display-4x.html> (Intel XE#1138 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@cursor:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_pm_rpm@cursor.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-7/igt@kms_pm_rpm@cursor.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-page-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr2-primary-page-flip@edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-7/igt@kms_psr@psr2-primary-page-flip@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_vrr@flip-suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-466/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-rebind:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-rebind.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_pm@s4-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec:
> 
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-8/igt@xe_pm_residency@idle-residency-on-exec.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_pm_residency@idle-residency-on-exec.html> (Intel XE#2655 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655>)
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_enhance:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_enhance.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html> +3 other tests pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>   *
> 
>     igt@kms_color@ctm-negative:
> 
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_color@ctm-negative.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@kms_color@ctm-negative.html> +3 other tests pass
>   *
> 
>     igt@kms_color@legacy-gamma-reset:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-4/igt@kms_color@legacy-gamma-reset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-9/igt@kms_color@legacy-gamma-reset.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html>
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
> 
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html>
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html> (Intel XE#3197 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3197>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_plane_cursor@primary:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471> / Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_plane_cursor@primary.html>
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html>
>   *
> 
>     igt@kms_psr@psr2-cursor-blt@edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-5/igt@kms_vrr@flip-dpms.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_vrr@flip-dpms.html> +3 other tests pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html> (Intel XE#2687 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html>
>   *
> 
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_pm@d3hot-basic-exec:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html> +2 other tests pass
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html> +1 other test pass
>   *
> 
>     igt@xe_vm@large-split-binds-2097152:
> 
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_vm@large-split-binds-2097152.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>   *
> 
>     igt@kms_properties@connector-properties-legacy:
> 
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html> (Intel XE#3189 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html> (Intel XE#3108 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3108> / Intel XE#3189 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
> 
> 
>     Build changes
> 
>   * Linux: xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56 ->
>     xe-pw-140208v3
> 
> IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: 
> aa0898115bcff3eda6d021cc66eb8a1c3b264c56
> xe-pw-140208v3: 140208v3
> 
