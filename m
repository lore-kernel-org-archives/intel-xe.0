Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B1C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 17:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2110E5D6;
	Mon, 10 Feb 2025 17:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBkw+YAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716D10E5D6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739210327; x=1770746327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=avBm3cbjqGYJj4dF+28RjazXEVLQ0/oq9MZJ6Il0PQY=;
 b=nBkw+YAJc+QVhTRaKumg8HXaG8a4L6J3u8Bb59fNyVU6cVRPpHwx3bUJ
 JUjOBp2PcN+d3wIatHsfQBQMsgyD4eJY1vIRVRikCfdyxi9Kq6H/SfxGc
 GGZapvH2zEhj7B8S2JWLPO5PrmXd1ZnActV37Qc1GDM79C+iXZYQtVSUA
 8MsxMF9brrdkPJQT0cDs8DEcxK7sqreN0UigIorfurDXC5rDOfBkJmdVn
 IE0uoq15YePIsaFfHW1EukHQ9STSQTIeCqBFxc6M1Uzpw0aqjb9ANXtHp
 dHPzO83PkU4x9Kaop1z61mxPZIGowflwPVfS7ZQhd0nF2zfCQ3ecYJ/hU w==;
X-CSE-ConnectionGUID: GTnHHRgyRD+UzYP6k3gTLQ==
X-CSE-MsgGUID: EmcXIjwFSlm0tvWDtRMuIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57216963"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="57216963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:58:47 -0800
X-CSE-ConnectionGUID: ugJ3XWMwQyyRQ+2pTtzGVw==
X-CSE-MsgGUID: Qd3N3LjrRsOC9wDY180FPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116854022"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:58:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:58:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:58:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4bJW189dqRis3tgSdkVfkZB49NSGcJnZtobEHfPRrhhsz4IaUxszRUk89LspdPuKIQO24vA8s3XvBEPbG5YMYwIgtavvFKts26l3abPx7gKqb33VIIKHqC/GZNzXpB3mAGjHdhBpyhTOGIDj1OcHGee31S24Y6+Fusms9CsBZbhkDCBmQJaIAKTliRBkiJHGsLpwaBCIoETImz6MlPHOVkjSCkjZcDZ/whmWWbtw1ZlJNKxPMQ4K5gdMB9KY+fX7+JmB2/02Ywyqnp/RaxZeHDLq+J1tomKx3qFkXNoL6IwYrMa3y7SrhIW815nplg2nm9m8AGLzq0GvdJr4HHmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibOLl5pL8ABpdJLg4f+iqXGApBdkQELIqkyVuChLi8I=;
 b=RfSUZJdB1yDGksX1EfzYZKtr9T68+xFidvFn1+sfDN86E4J30d1i8ZtPbkWZpylwPywGIxH+pOpBhfwiFtQ06yXxttJ0BW+mKivSfg9MSJe/sr7F/qixy5vA3N7xoTn1wn94xeZkua/n04d7kq1M5TGtNtUh/zEeHRtrBD9keKfnvxOefmk7BgMFNYJsIVY+DR3+gR+soMXKQhk4GDi6hJv9jHRS48pSxxngvQAulvxHK36sKFi/+S9n5GBWY+WVGK/rLHh/fZg/k0yndoLKYj2gDU8+456occeBihCtw0x8TvlL5QNp/uN5/cgDAsJL8LsEq0PAKun2oineDNlc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:58:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:58:21 +0000
Message-ID: <3800edca-5eb7-4d73-af5a-d712eaf539e5@intel.com>
Date: Mon, 10 Feb 2025 23:28:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] drm/xe: Fix error handling in xe_irq_install()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-3-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: b143740f-ee3f-4154-b489-08dd49fc81d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNnRWFISFVod2tvNXJTamgvM1dmNGlmSGEvRW14dU40NjNJNzVmT0dTWURD?=
 =?utf-8?B?SlVGdXZyeFg4d3lMa2t2U2c0NEFxVUpFaVBNTDdMMjFKZUNyQno1LzI1TWsx?=
 =?utf-8?B?c0UrOFpONkNSRnVCRTRKYjFxM09IdktUQmcvV0p0SXYrU0EwMU1oMEZIV2Vx?=
 =?utf-8?B?UXJZNTEvYk45VEszWmwvV2tRcnh4bWJiaCsvblJoaVJmYjI5QmVJTVBwYVNQ?=
 =?utf-8?B?Z3o4dzNTTXdjblA0K2hUTWU0TlRXZ1Vac211cWFxYlFGWDdrZHdER01KZWZC?=
 =?utf-8?B?K3NZMzBPamtENVlHTWN3N3gxcTFRTi9DbmV5NWxHVWFzZnJQWkk0UmFhRUc2?=
 =?utf-8?B?d3kyeTVtblZGNUR4bjBkUjNJT085SkZydlpHTWxuNTd2TDRlZ2s5bG1OOUJ1?=
 =?utf-8?B?Z1hNbUtnSmFhT2dqWENsaUQrKzdyMHNOMUJrTE1kb1VVLzhNWSsxNkpJd3cw?=
 =?utf-8?B?S2tGTldIa2NwdHloQUFldWoxVHhrQzIwUVlhQ2pLRnV6VWM3eVFzTGdCSzJa?=
 =?utf-8?B?UGoySlJoVFJmQ0txQ2xRRlRIVEtKYlpjWTFoZ1pyZ1QxQmE1b3NDaVFROHNK?=
 =?utf-8?B?NnRuS2pSN1VVMnBmeGhQa1ZZckYwOURaR2Y5dXA0a0VKb2hTTk1qNk1Vd25j?=
 =?utf-8?B?SVltSXNwSWRHc2duMlFqUUwxMDF2MVZNSGZuRWxCaFVrT055MkF1R0hMWW8v?=
 =?utf-8?B?bWQ5MmozbHloOTRaZVU1UmRVYmRnb0o0Q2NPWGczVkZhdU1aY2lvbWNFSXFW?=
 =?utf-8?B?bi85MVRlNkRrd2JCU3JFSUVVV0xsWW8rSzM4ZVdBSkZacUhmZnhWMTl6cWF3?=
 =?utf-8?B?cUQzUkdoUmJqUTRVMzM1QVloY0lOdkxuZVdTVUR4TWJ4S25FZDU2aGY0a1dZ?=
 =?utf-8?B?QjQxbkNPWFJCNjVZT09RNGpoamZoK3A3T09zVE9rdXlPV2VXVXI5U09DbG1i?=
 =?utf-8?B?NElPRmtnV3liL0JVOFp0R2JYMEM2b3R3aUFIQ09pZnZjK0YwT2NKbS9YWGFL?=
 =?utf-8?B?RjJkdWhqTWJiU3pQVkFFdHJic3lvUjhySjVHRFYxd1ZRTG4xQTNQcjN4OUF6?=
 =?utf-8?B?MFZFZSsyMnR1R3BoOUdkOTdCNjM1eWtaY2JjYjNDZnlQYzlXOU5ZbmsrQ3Vl?=
 =?utf-8?B?ZE9BZENMY1NzSWtMQzdBeUgveGtkSG1IYzBiY3RqM0pydUpJeXEzWDFSM2Ji?=
 =?utf-8?B?ejZ2UnR4L3NkYjRrSEVqUjRFdkhBdnVlYUxYSFdXQi80bHlsdlEydXFJblh2?=
 =?utf-8?B?ekxZNmZUN2J6cVhRc1ljTU5hcVZycHh0V1NoQzNhUjVRNGx2TGUreHlKOHpD?=
 =?utf-8?B?V01URzVSNWoyWGFVMmwzZTAxNzRURFlQU3ozWWVmWDBoYjlHdTRFVjUwdlNF?=
 =?utf-8?B?dG81bWtkS0Nodm84WHlLYlk5MGxmN2lrVE9TUktkOVlZS3R5MWg1czdSWWhR?=
 =?utf-8?B?R25ENHJ0ZllXc3dtUXpvZ2x4endyZ1dBN2VQbzMrR3drVHpnVGFHSEo1STlp?=
 =?utf-8?B?amF3UEFZb1Rmc05Ya2crdWthTlpqOElUTGxIQ1ZtK0FLMFhORHFvSno2bGg0?=
 =?utf-8?B?YVQxNmFlem03U3poSEp3UlErZVJ5WDNGdHA2WU5wcmYwTnhNU2JBejFNYXox?=
 =?utf-8?B?WUtweHhsWlhBYkg3Ymh5L2VzUk5OdldSNm01YmRuMG12ZHJkOFlqaWNpRjB0?=
 =?utf-8?B?QzN0d3NJL2k2ZG5OS0dCaTdYVjM2TkJEQ28xMkVxSExkOXMyU0VpRmRzZG9Q?=
 =?utf-8?B?d1JwRGFSVWRqNWFVZGxXZDZ0K3JJOW4rbEtjNUZYc0ljRDlubnZhZFhVMFNT?=
 =?utf-8?B?dGZWMmd5SjZZTllGSVBEMUFTeWNsTEZEYWlPcm9RYTg1R0FMclRTT0VBK3Fv?=
 =?utf-8?Q?8DB83w4ydRB1W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5MNmZRVUNUbXkvVkRla2VnRGFBaU02blhERXc3L2s4N29vWEoyRU1aWTZS?=
 =?utf-8?B?NFp6YWhEQnNVZlZxZjVWcVJzZjc1N3dxN1lUazBvaGNOUEtuK3JjVU1SZENs?=
 =?utf-8?B?SHRtMjlvN2w5TzMxSDk5UmJTSU92UUh1TmlBN0ZJRGJPcEdtR0o4WFZ0WnNl?=
 =?utf-8?B?Zy9IRFkrT2VMckFFc0tTM0xlRm1tM1VOTGxDbnllTVl6SnUyZk1uVkxoU0ZB?=
 =?utf-8?B?SUVNbWJMZXIzWS92a00xVjlsajRsdWIyWVFVdER5SW1jZ2QvQ2xHWHY1VGhw?=
 =?utf-8?B?ajlmdEVpN1F3UDRFbHFwdS9ZN1dYUWNHbEowd05zSjUwUDA5ZlM5cVdhQWhM?=
 =?utf-8?B?VW5RY2Z2c3l6cVZiazkyZ2hTRk5rVnQrMEJIZjVELzhBMUY2d3N5dzZ5RlA3?=
 =?utf-8?B?ZjNHYVkzOXhYMHd5Q1NnQXFWdi9YSEI5K0ZSZkZBZUc4aGlNNjE1WHVkdUtB?=
 =?utf-8?B?eEIwZWM2YVNiUW8zUEZpRUZnL0M1c2lNYmRrczNHRWdjbDRzN0lFeDEyWnNH?=
 =?utf-8?B?M3IwQmpXenRMS2FWYmxram5iMkpJNmwrbkkzMnpVM3JtU2dCM0lYbkc1eklT?=
 =?utf-8?B?cWhOM0RYNFRzTGRQbjBKKzh6Nys1WDZsNlM3SDFLRDQwU3Y3UWZiZ2Q1Y294?=
 =?utf-8?B?dGUxcE11K092dTBoeWhIZmRDeFJES2dvbWQyWWN0eFc4ak1rYWJ3cFNDemww?=
 =?utf-8?B?SW15OHZBWDhuWTEwZEtzbU1pbThLWHFmT3VJVDBDeXVacmNZRnJpVzlLd3Za?=
 =?utf-8?B?K2JzK3I0MmtTQU9Sb1JGeG5iRGJWWGZWMHpZSmg4RHJGUTFtdTR5R0V0dWVx?=
 =?utf-8?B?N1FoakZlMWg4ZjRVRHYwVG5aazEyZGxsZFN3MlNxUGRsVzBndGlJSFpSOGJr?=
 =?utf-8?B?QnNtZ2RNMXByVnBDdnhYL3Z5SndRem5jVVlhb2c2MjRtdXlaWWo1ZDU2L3hh?=
 =?utf-8?B?VjNUVXlWbGlGVFM2c1ZMNUcrSzVDckJzNVovSXNYdU9ZNDdUaWgrQlAyeCsv?=
 =?utf-8?B?Mnl6YjVEVUFkak44Nmd4Zjc4ZDUrb2Ixa3VESEJaNXp4TlpNdGtocmV4VkZY?=
 =?utf-8?B?eE5XOGRhY1ZhcnZudWFIUGtrZGF5OVZBd1N3TmZuYjJKbmMzcmFsM1IzK0hF?=
 =?utf-8?B?QUkrMGs0eUFIQlZZNVM4TDFlclc2NVZ0b2hHd2QwdzNIYXF6SFRpais3THVG?=
 =?utf-8?B?TVBXNnk5WVdPanpsRGdiVVlybW5teHViU0ZMSGk5ekZHQTFEc2hCaXZzMGpy?=
 =?utf-8?B?L0dubnRlem9iNVp2WmVadXNQWStEdXZLZ3FicDJxZ21PbUl0bUFyQTBXNDVL?=
 =?utf-8?B?eGZSa0Y3aUp1dHdhREVvdzZRSi9lOVlKZU1SNEEzbVQ4RlpTQ3dJZ1FuNlRD?=
 =?utf-8?B?YmdGekFmWCtCd3BxZTVNVzR2azNuSUNPcEptODRHOEdtQXd2TnQxYm5lV1hj?=
 =?utf-8?B?UHEyQk41N2xoRU1sZ1BxaUpGRDBhcUo3U3BhTHF0NFFTc1ArQTZlVmU0ZGxx?=
 =?utf-8?B?TFlxZzNXMlJKV0IrVytVWUdhQUtQRzdkQ3lHNjE3R0hIZjFDN0xpZUFIdUMx?=
 =?utf-8?B?dkx0Z2VPcUxJTE4zdnp0TnoxSUZmYS9raTlBQ2tGZTZFUkZMbEowWUpISFBT?=
 =?utf-8?B?Z2k5SE9XeFdIbmZjMC9uZU5UMHhBZ3E1OEFrQXNSa3pkNjRiZTc0NFEwRTVG?=
 =?utf-8?B?NEJ4T0FzRHB6YksvZ0JOeFRNQ3NZY245ZjVhYlhZbGh4Mlk5L3RseENoTTYv?=
 =?utf-8?B?T2JTalRjdyt2UzAyTWpJZDdOOUpyT0tyd29Mb0Q1UGRRNDB0NFRLLzhqcDM0?=
 =?utf-8?B?ZzlyL1Jzdnh2OStUV1o0VkFvMWQrOFNWRmhtUzlhRC9JaDJySHBQeWk0Q3FU?=
 =?utf-8?B?OTFJbUxiTVNRZkIwTDNlUUUwK09mZFBPaVlNVStueFRJL1FUN1lIOUQzQVFi?=
 =?utf-8?B?ZnI5THBmaTV2aDVoK0o1bWlkVDNpLzkrV3FtSDg2Q3VNT01iYmVzRXNmbCsz?=
 =?utf-8?B?T1M5TExSR2NjREFEWHE3QkVISUdnYi9QSHhVeXh0OWxaZFRBT3dmZFgzN2tH?=
 =?utf-8?B?RWk4UURpWkd2cjhPaU01b0diVmxXVHI5SUgyYXlwanJnYTNFb1lFbVovWjFv?=
 =?utf-8?B?dGRQOXBWME4xRGR2dUs5RFU4YmpLdlduM09pOFVUdW1tWE1SYnJHRjVsM1pP?=
 =?utf-8?Q?kQ0Ip+Nhcfna1AVej/FsdS0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b143740f-ee3f-4154-b489-08dd49fc81d0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:58:21.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4SwCa7Af3VEP9HhNx7Cx8uk+zUcCyArafFamx5aoZ2kxg2ehOcPn6RT70KJsRs3ECAcSM7rtg9O2IxiYZIwCyIcSy++q7xwPZr8Ypyz4vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> When devm_add_action_or_reset() fails, it already calls the function
> passed as parameter and that function is already free'ing the irqs.
> Drop the goto and just return.
> 
> The caller, xe_device_probe(), should also do the same thing instead of
> wrongly doing `goto err` and calling the unrelated xe_display_fini()
> function.
> 
> Fixes: 14d25d8d684d ("drm/xe: change old msi irq api to a new one")
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_irq.c | 14 +-------------
>   1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index bf092e6391c7d..5362d3174b060 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -775,19 +775,7 @@ int xe_irq_install(struct xe_device *xe)
>   
>   	xe_irq_postinstall(xe);
>   
> -	err = devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
> -	if (err)
> -		goto free_irq_handler;
> -
> -	return 0;
> -
> -free_irq_handler:
> -	if (xe_device_has_msix(xe))
> -		xe_irq_msix_free(xe);
> -	else
> -		xe_irq_msi_free(xe);
> -
> -	return err;
> +	return devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   }
>   
>   static void xe_irq_msi_synchronize_irq(struct xe_device *xe)

