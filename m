Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738CC282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 20:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082D110E932;
	Thu, 13 Mar 2025 20:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/Xak9vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A0210E932
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741898404; x=1773434404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LkBNUN6E4pNcXO5EeEue+xb2gQ+kl5UQlux2suQ6ZDU=;
 b=E/Xak9vzSQlo0fvnZWYi0M+bf5684b/sQ8A4L9ce8/+Vh8YMbQahmD6h
 EcHjOfS2ntAmANuGtWvGwl4d3lCy0Pf1qWK/rXiLTvMY8/qKkBQpil+Ok
 FmZ84qQNawd/F4xvCtp1th8uYNYrDqMBGcriTzPW/TISNYVQUhLHi7zu5
 9gNUl7LOp1bCy/NXZdLTPo1fZLUmhIl3HpCfb0Lwb9LJCXf7oOaWBF7kn
 r+3ym062ym+6eHrmxXzSzpwlLtQQXO9vgZiVVc3xAhKfSqYNByfrlMMMa
 ZMdTWNKQ4s5YFJ7/VRe7HZuShpjLHVfETxdcO2csGJjWqg0p3niJcM/kN g==;
X-CSE-ConnectionGUID: iHeTWfCxQzOmpmfSrNhWDQ==
X-CSE-MsgGUID: 5IvKHmvOQWeVXDyoxqppIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43141820"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="43141820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:40:04 -0700
X-CSE-ConnectionGUID: mFf+i/+RRwqfUVoLrT1UyA==
X-CSE-MsgGUID: EXk/YdstREiNvrRFgnN0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="158215837"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:40:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 13:40:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 13:40:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 13:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ9s0+lWxi7soiQYgt4Iqb2Xrq2DMcBIrsgPrvoKL/kHgQVV6IcN0g0o6/yiVAGXZn3oWqNTfkSVC8RCZA+6V4d+sl0RawJoa5+oKR+wrjbGX3VH5rCzQdvXovJ32dI2wXE2g5gMXh8bcjiVt6tcQjRFqjFZoXtbs13ib4sWxUq7Z1DcBNVE/+5r35S7RZB4QBUzoEMDc0cZuelN79pzmX48YNhDHCBJ4aS2AEBMeDqIoWsrN2eVOovOV8b8VgZpqpxUS0ek0+KdepRcff6MktrQYtBb/eYoVjAn6P19K2rgG5ADTz6WIEtErdR86tNGl9bI2xj/VKEB6gL0GFzo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR/YBRgX3eMAgByHgkareiBc8S3CXbFTFiRtVP1e36M=;
 b=tyjSs8/m/Kd4g7DWe3DVpZ40Atj/9oBZgDP0tlqWYI+wRPEbDJXid1bACidi+ipqju8eJq5gv/ENC1y68P5MRINsICqdu3CfH35c+5qQHdPQkLPb2SvlISClEEVDNDulbL0ewQG8y0VN7fnMJGbtCf22fi7qMYqO/xKTjrI+UJ93PZoVmwzwYaqmjAt39dDX0VIguVFlQHUZzz4deo2LTb2m0I9JN/7ggc4bLh9tuywCs9CTXn4P/WeYJ/71/iAFkUhDNxkS/JYbkBuXkWBvEOtDy9EdA++rAKvuWPWmK91unm5luwtIWBLD06U1+sDL2JdAnr1S8YYaOQNGJ5JXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 20:39:34 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 20:39:33 +0000
Message-ID: <2f4de33c-8d93-48e4-8024-063e1a11ac43@intel.com>
Date: Thu, 13 Mar 2025 13:39:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <ec7a0352-2b93-4c1c-ae7c-82fe6e33817d@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ec7a0352-2b93-4c1c-ae7c-82fe6e33817d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e392b2-dfff-4311-ddce-08dd626f29b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek4xZVgxazNlQkZpS1g2L2lHUUpZSExzMEhiaktaS1JhRUl0UWc2NnVlN3pY?=
 =?utf-8?B?WksrNGRIN3FxaTIvNVhWeXVERFBvSXFUc1l6M0lJQXVhN2F3WDZ3d3JtWmJO?=
 =?utf-8?B?WmIxTS9sZjNkcEdzREgwdy9XNWdFcXg0WXdUbXFNQVBHdGFHdW05dWVyZ3dw?=
 =?utf-8?B?b2NOWWszUmlDSGhSRnQ4OW9ZbGlOWFhydWd5NlIzQzZubUdqM0p6S3dOZ25C?=
 =?utf-8?B?dnNnNHZMWWFMeVNIU0doYXYzZlNEYXgwUWlld1FramZEVklSSGhNTDRHcjJ3?=
 =?utf-8?B?emx5MVRVeW9ZWDJ2TllWRlFSZjBaMGJmemVOc2tmSXFnRnJaZUJWU3F5VGEr?=
 =?utf-8?B?M0UwUUpwSkJCRTU3cXNVVHhCWjA2cm9TR3dDc1VQQnNtbzUrL1BkNTZOaVpj?=
 =?utf-8?B?ZnpLWXNlVU9IWmYzZkVLVG9rZUJDdlA4MFVlUkw3aTNpenZpZlgzTXY3bFAz?=
 =?utf-8?B?cEZOQTE2VURGRnhXTm9IQWxwdko0MmhEY2NDeXpSN1k1eWJFeFZLMUpDNStl?=
 =?utf-8?B?elVKeVRIT2YwYk1oSnozd1ZRTHJXZUZ0SWNMWXdkSzBOS0lRYkQxZnRoWXNj?=
 =?utf-8?B?aUtQbnErV2xtS3UySVJ0UEtJNWpWNGxzOWZyb09jRGhPY0hCQ0dkYklDREh6?=
 =?utf-8?B?Z0ZBUFNIWTRlU3RCTmN2L3dGOG40RTdBU0xJektSOHAxV0FaTmUyaU5hK2FU?=
 =?utf-8?B?RnNRY0NLcmRNLzJDcmEySEZwYllGZHlieXQvQy9WcExYeW9JVkZwQ3lmK1pC?=
 =?utf-8?B?UXRlMWxrUDEwTnlHNlVJNHA3SnpvQWgrODJ4OGNNQmpJRkVobkxkRnJXd25v?=
 =?utf-8?B?czNheWRYMG5oN05IbEt6NGNPRkVtdW9CbzArRGdscklEdzUvdmlZbk9vT1Vi?=
 =?utf-8?B?cm81OG1WRTcrWllnazVkTWZzVXRQQ0FNSGMzOUV5dGNUR3ZKQ0ZaYklNY1F2?=
 =?utf-8?B?MXQzbU1xNFlka3JoTGdHMlppUHhvYWZ3VWxhQ3pyQVFFRXltNXdyWlVUdDJG?=
 =?utf-8?B?ajVLWE9TcW8xcy9pS1hRZXdVSUY3SitML1dMaFNwS0ZiQXJWRjIzSXpiQmM0?=
 =?utf-8?B?RVBaZ1pFWStUWFp3ZHRNRGZzeWp6WDlqRlBpMmt1aUV3SWtHSXE1YUttckN4?=
 =?utf-8?B?M2h1TVJRMURBZ1U0clBYc1pJWFRIRlRaQVhLZ0wwRXU1NWJIZVVESm5ZVWto?=
 =?utf-8?B?SGZNZm8yTklkYWd5ckR5QzZ3TDNqZU10VG9ieE4xUjgxSUxYajhCYmNnby9r?=
 =?utf-8?B?WUxSSW1CU2NJVzhoM1I1aEJXRGRFeGVtRFBIeDR3TnZKeTc5M1pYcTZBUFJJ?=
 =?utf-8?B?SVJCK0NtZWdxT2Fla2kwNjVxMW43YTNqaDV0ZHg4M3RJS0g2NDNGQWZ6b3o5?=
 =?utf-8?B?RU1EUmVHUDR2a0p5VEZreXcvb0JZRnpLZFdlbThOQVp4eWpTZXRkVkdESmhN?=
 =?utf-8?B?TUN4TE5KT3N6dzRxYTg0cGJDUTlqQ3JoekUvTk53WVVOMTJ2elNEOEhIR0NM?=
 =?utf-8?B?Rm0waVdaS0IvaWc1MFFkekxlVGcrdm8yNHRtbkxPZHc2bjVoRDMrVlh6V0du?=
 =?utf-8?B?b2VzT0pLTEV0aDNZdmd2dm1IVEFseEx4bE9TWGVLYnY5dzJBN21uTTJOWk5j?=
 =?utf-8?B?K1A5UTFQdkZOMWUvcUtFcXMxUkN2QTVlR0VxZWRwdVk2dEJ2eUVWbk1zQXQ2?=
 =?utf-8?B?R1g3RnBIT3dodnVMeHlmMzVqWllXd2dSeDZGTzNHdCtYWjdqb2tLUVBJdE1s?=
 =?utf-8?B?NGFLN1V3c056cVBMMkwwNnRQMzlUYmJGSUVvRnY1VEpyN1dKVjk5cXF0K1hm?=
 =?utf-8?B?cGVBRkFSVEdmbzVJRHBhZTRaMW9RckNBRmxhRzgvME4wajlHSkJCdEdOamNJ?=
 =?utf-8?Q?OF/d5UNedxU3G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JyVUVHMS9vUVp1dzZJY1czVHdIUkhLZE1NTVBubVpURS9mNi9nbllrcTQ4?=
 =?utf-8?B?ZzdYdngwQlNxUmNkSGpiYm1od3VLdjJYVWNjblFKYWtzeDFDYXRRY3J1ZURx?=
 =?utf-8?B?QVlFTTUwYWMvaHdNVHF2RWNjSjB5bXc5TVdwODBIK0xCbWxaU0s0eHV6emI1?=
 =?utf-8?B?UTd0Tm9aZ2tZbTkveitjNjZHdUxlVXJzT2hIdkNWNGVlZXQvU0Zobm1yZ3FM?=
 =?utf-8?B?L1pRdmU4dURDRmNRZUtKYmhOV3pkd3Z6ZHBkbUdWYzFlVVFSTmx5Q3gxOFc4?=
 =?utf-8?B?MG9WZHQ3L1dmd2RLemJRUGc0RHVNTjJZTHRSMU01Ullua09ISitZSS90bWhX?=
 =?utf-8?B?Qzk0bEVCMWtCcktmUFRiS1l5ZW9qRnB6a3pRcnZqQ2F1dlFneDFDaHphSE1H?=
 =?utf-8?B?OUJxdHF5cjVmekZ2SkhxUXZaSUtpQW5KUFUxUEpjU3NSNy9JNTB3dFRSNU5s?=
 =?utf-8?B?TzVTT2wxK09hTkVjdFlFU3dkdjNpdjQ0VW5ET3p1bGxhcSttZG5TdlBRTWNE?=
 =?utf-8?B?RjRiMDBFT0p3bUJ2cE5FQTNNQWZ0djBSVzZaNjJGRUl2bmVpa0hNZEpYeVVS?=
 =?utf-8?B?eXRBZVdmRkt1T3FSbFp5aG9LLyt2aENlUmtXOUxBU3lzVlNyYmF1R252MGVm?=
 =?utf-8?B?MTQ2WXBLK3dMbHZwaXk1WXBhOGlNbndDVzJxdVc0YkVOby91MEhZMkZCYkl0?=
 =?utf-8?B?NkxFUjVrTSt2SjNEUHZ3eFF2eFRaSzVkdUNGdWlpeDdXdU5sU3N2bkxkSHg4?=
 =?utf-8?B?enNWNDFrWCtkYUxORm1IN0hLOUQyWFdmR295MGRpT0VmRnY2UVYyd0pnWnR6?=
 =?utf-8?B?UzBDY21jLytUc0dOYVdveXFaRkcwdHRwbU55SFovb25wb294OGd5NFNEUEo5?=
 =?utf-8?B?cHJnaHdTekFaTEh5Sm1UamdPMFFzVGh3S2NUVkJaZExmaHZabFhpRGFmdE90?=
 =?utf-8?B?d2VmdUt3dFBlbDY0d21MaHl2anlxUGVreDJ6ZnJuS3JaenFXK3FaYTdwNFV0?=
 =?utf-8?B?RWd2akxVc1dtQk8ycVRlLzZMTXlqUkdFRDlaVkllTmpGM3BPTlJmL01zNlZH?=
 =?utf-8?B?QVE2M3NPb0JZeEtOcDA3Z25hNXZzQm1MNjMwR3BoTnFBMHdQSC9zemtpVC8x?=
 =?utf-8?B?QUhUMHFQWjM1eTVoT1FtMlNiZzN3M09tWmxZMXRYMUM0eVVpSzJGVDMzQWQ5?=
 =?utf-8?B?N3A5WVVZUTRyRG55eEVmb1gyYWc4UytRTUEvcmZJY0pqMnVZeWMxWXlWeTNk?=
 =?utf-8?B?cDF2TjFFMU1HL0NMWTVvNWJSZHRnR1hkWUFXUlRjMlRQcE1GU3BDcXdQNHVo?=
 =?utf-8?B?TTE1cFV5WDNMbU5ud0YyZncrRVEvRCtGQTNlc1hTOFRsWVlpSFMybThVb28v?=
 =?utf-8?B?SU4zcXRTQWYvQzBrWngvdEZla3Q4TUJUTUc5MDE3cHpWV2NzbWNlTEdoTHJQ?=
 =?utf-8?B?a1BzU3lVMzZibksvRHBJMWR4TmRVQ2FrcldlVzQvUnhZVDlOREliMUhEV0NS?=
 =?utf-8?B?TmwrOWtaN3FFVVFqeFpHZjlFSVNxT3dQT1ZxOWhMSktibjhHNmk3SFNnUC9T?=
 =?utf-8?B?ZWFYS3VvNFJJRVgrQUtNOWxmSGNiRzIzUWJrS1Zrd1RpdFhTSDhENXlyQTB4?=
 =?utf-8?B?bDVkT2FDTkRlcVBLNnRZbVFvTHhpdWRjTFoyK0J1U2hKblhFQSs5M2FLcE1x?=
 =?utf-8?B?NzVseE5rRlFSOXdVdG94a2ozWlAyeUdHRmt6OURpOVRNZW5BUG1Ic1dmU0tP?=
 =?utf-8?B?b080T2dqbm4wTzIxWC9tMCtUeUtkdlpselNOaVJxVU1pOTBPYXhLYkpxWXNt?=
 =?utf-8?B?alV1NkJpOUs0ZlZsNm9KY1dhdWY3TWN4OW1SN3h0RlpNRFNjTmRGYUh4a3I3?=
 =?utf-8?B?ZFdMaVZXVkIySXNkcHNOeXc4TzNrN1Z6eWFOeEF3c3NyL1ZzeHdFeHR2RmV4?=
 =?utf-8?B?d3F0NFQzRml4KzNlYVcvTzZjM0ZrS0JlUEF1b3JiNHl0RmFFeVdwR2RoNGxJ?=
 =?utf-8?B?dHNtdTZvN081dlA3bG5SNFdzZlI0TVU4V0JRWnZ3WlFnSzVKQ1pMQmxQUTFr?=
 =?utf-8?B?ak9tRnYvODdrcGZhN1Q5VHhrUVBXdXpQZWR0azVWTW1TL1BKU0s5dGFESG9L?=
 =?utf-8?B?OVpUd3RIeUkwYmgrY1Bnd3lEZmVRWE9hOW5QRzJHb3ZldllDTzdIUmVvWHhh?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e392b2-dfff-4311-ddce-08dd626f29b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 20:39:33.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wyDTDKSSoug/FRodF0UAYkdHAO3yNx7ECsOkulP+EMtEXqb504P69UXXFzKUhsVcBTrtqOoHbIjJ0b1Sv47hwpqI6hRtHcvhrmh1AhOBKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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


On 3/13/2025 7:27 AM, Riana Tauro wrote:
> Hi Vinay
>
> On 3/12/2025 5:44 AM, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>    xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>    xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>    $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>       1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>       2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>       3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>
>> Actual frequencies will be reported as 0 when GT is in C6.
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>> v3: Review comments (Lucas) and use event counts instead of mask for
>> active events.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pmu.c       | 178 ++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  29 +++++
>>   2 files changed, 197 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 4f62a6e515d6..d4c639369709 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -10,7 +10,9 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_idle.h"
>>   #include "xe_guc_engine_activity.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_macros.h"
>>   #include "xe_pm.h"
>>   #include "xe_pmu.h"
>>   @@ -52,6 +54,7 @@
>>   #define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>>   #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>>   #define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>> +#define XE_HRTIMER_INTERVAL_NS        5000000
>>     static unsigned int config_to_event_id(u64 config)
>>   {
>> @@ -76,10 +79,12 @@ static unsigned int config_to_gt_id(u64 config)
>>   #define XE_PMU_EVENT_GT_C6_RESIDENCY        0x01
>>   #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS    0x02
>>   #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS        0x03
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x04
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x05
>>     static struct xe_gt *event_to_gt(struct perf_event *event)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       u64 gt = config_to_gt_id(event->attr.config);
>>         return xe_device_get_gt(xe, gt);
>> @@ -179,7 +184,7 @@ static bool event_param_valid(struct perf_event 
>> *event)
> event_param_valid also needs to be modified
>
>         switch (config_to_event_id(config)) {
>         case XE_PMU_EVENT_GT_C6_RESIDENCY:
>     case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>     case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY
>                 if (engine_class || engine_instance)
>                         return false;
>                 break;
interesting. Looks like we need a default case here which returns false. 
Seemed to just fall through during my testing.
>
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_gt *gt;
>>       unsigned int *fw_ref = event->pmu_private;
>>   @@ -197,7 +202,7 @@ static void xe_pmu_event_destroy(struct 
>> perf_event *event)
>>     static int xe_pmu_event_init(struct perf_event *event)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_pmu *pmu = &xe->pmu;
>>       unsigned int id, gt;
>>   @@ -219,6 +224,9 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>       if (!event_supported(pmu, gt, id))
>>           return -ENOENT;
>>   +    if (XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES))
>> +        return -EINVAL;
>> +
>>       if (has_branch_stack(event))
>>           return -EOPNOTSUPP;
>>   @@ -239,6 +247,30 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>       return 0;
>>   }
>>   +static u64
>> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>> +{
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    val = pmu->event_sample[gt_id][id];
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void
>> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>> +            uint32_t val, uint32_t period)
>> +{
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);

we could, but not really needed. We are storing samples of freq * 
time_diff in there (multiple times a second), and measuring the 
difference, so it gives consistent values even after a disable/enable 
sequence.

Thanks,

Vinay.

> Shouldn't event sample be reset on disable?
>
> Thanks
> Riana
>> + raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>>   static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>> *event)
>>   {
>>       struct xe_hw_engine *hwe;
>> @@ -256,16 +288,23 @@ static u64 read_engine_events(struct xe_gt *gt, 
>> struct perf_event *event)
>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>       struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = container_of(event->pmu, typeof(struct 
>> xe_pmu), base);
>> +    unsigned long id;
>>         if (!gt)
>>           return 0;
>>   -    switch (config_to_event_id(event->attr.config)) {
>> +    id = config_to_event_id(event->attr.config);
>> +
>> +    switch (id) {
>>       case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>           return xe_gt_idle_residency_msec(&gt->gtidle);
>>       case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>       case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>           return read_engine_events(gt, event);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return div_u64(xe_get_pmu_sample(pmu, gt->info.id, id), 
>> NSEC_PER_SEC);
>>       }
>>         return 0;
>> @@ -286,7 +325,7 @@ static void xe_pmu_event_update(struct perf_event 
>> *event)
>>     static void xe_pmu_event_read(struct perf_event *event)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_pmu *pmu = &xe->pmu;
>>         if (!pmu->registered) {
>> @@ -297,8 +336,89 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>       xe_pmu_event_update(event);
>>   }
>>   +static void xe_pmu_start_timer(struct xe_pmu *pmu)
>> +{
>> +    /* Timer is per device */
>> +    if (!pmu->timer_enabled) {
>> +        pmu->timer_enabled = true;
>> +        pmu->timer_last = ktime_get();
>> +        hrtimer_start_range_ns(&pmu->timer,
>> +                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>> +                       HRTIMER_MODE_REL_PINNED);
>> +    }
>> +}
>> +
>> +static void
>> +xe_sample_gt_frequency(struct xe_pmu *pmu, uint32_t period_ns)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    uint32_t act_freq, cur_freq;
>> +    int ret;
>> +    int i;
>> +
>> +    /* Sample each event type once */
>> +    for_each_gt(gt, xe, i) {
>> +        if (pmu->active_count[i][XE_PMU_EVENT_GT_ACTUAL_FREQUENCY]) {
>> +            /* Actual freq will be 0 when GT is in C6 */
>> +            act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +            xe_store_pmu_sample(pmu, i, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>> +                        act_freq, period_ns);
>> +        }
>> +
>> +        if 
>> (pmu->active_count[i][XE_PMU_EVENT_GT_REQUESTED_FREQUENCY]) {
>> +            ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +            if (!ret)
>> +                xe_store_pmu_sample(pmu, i, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>> +                            cur_freq, period_ns);
>> +        }
>> +    }
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    u64 time_diff_ns;
>> +    ktime_t now;
>> +
>> +    if (!READ_ONCE(pmu->timer_enabled))
>> +        return HRTIMER_NORESTART;
>> +
>> +    now = ktime_get();
>> +    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +    pmu->timer_last = now;
>> +
>> +    xe_sample_gt_frequency(pmu, time_diff_ns);
>> +
>> +    hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> +static bool is_gt_frequency_event(uint32_t id)
>> +{
>> +    return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>> +           (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +}
>> +
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = container_of(event->pmu, typeof(struct 
>> xe_pmu), base);
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (is_gt_frequency_event(id)) {
>> +        pmu->active_count[gt->info.id][id]++;
>> +        /* Start a timer, if needed, to collect samples */
>> +        if (pmu->n_active++ == 0)
>> +            xe_pmu_start_timer(pmu);
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>       /*
>>        * Store the current counter value so we can report the correct 
>> delta
>>        * for all listeners. Even when the event was already enabled 
>> and has
>> @@ -309,7 +429,7 @@ static void xe_pmu_enable(struct perf_event *event)
>>     static void xe_pmu_event_start(struct perf_event *event, int flags)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_pmu *pmu = &xe->pmu;
>>         if (!pmu->registered)
>> @@ -319,21 +439,43 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>       event->hw.state = 0;
>>   }
>>   +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (is_gt_frequency_event(id)) {
>> +        pmu->active_count[gt->info.id][id]--;
>> +        if (--pmu->n_active == 0)
>> +            pmu->timer_enabled = false;
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>>   static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_pmu *pmu = &xe->pmu;
>>   -    if (pmu->registered)
>> +    if (pmu->registered) {
>>           if (flags & PERF_EF_UPDATE)
>>               xe_pmu_event_update(event);
>>   +        xe_pmu_disable(event);
>> +    }
>> +
>>       event->hw.state = PERF_HES_STOPPED;
>>   }
>>     static int xe_pmu_event_add(struct perf_event *event, int flags)
>>   {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>       struct xe_pmu *pmu = &xe->pmu;
>>         if (!pmu->registered)
>> @@ -419,6 +561,10 @@ static ssize_t event_attr_show(struct device *dev,
>>   XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>>   XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>   XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, 
>> XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>     static struct attribute *pmu_empty_event_attrs[] = {
>>       /* Empty - all events are added as groups with .attr_update() */
>> @@ -434,6 +580,8 @@ static const struct attribute_group 
>> *pmu_events_attr_update[] = {
>>       &pmu_group_gt_c6_residency,
>>       &pmu_group_engine_active_ticks,
>>       &pmu_group_engine_total_ticks,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>       NULL,
>>   };
>>   @@ -442,8 +590,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>>       struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>       struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>   -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>           pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>>         if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>>           pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> @@ -463,6 +614,8 @@ static void xe_pmu_unregister(void *arg)
>>       if (!pmu->registered)
>>           return;
>>   +    hrtimer_cancel(&pmu->timer);
>> +
>>       pmu->registered = false;
>>         perf_pmu_unregister(&pmu->base);
>> @@ -491,6 +644,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>       if (IS_SRIOV_VF(xe))
>>           return 0;
>>   +    raw_spin_lock_init(&pmu->lock);
>> +
>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +    pmu->timer.function = xe_sample;
>> +
>>       name = kasprintf(GFP_KERNEL, "xe_%s",
>>                dev_name(xe->drm.dev));
>>       if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..59ed9d8b4ed8 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/spinlock_types.h>
>>     #define XE_PMU_MAX_GT 2
>> +#define XE_PMU_MAX_EVENT_TYPES 64
>>     /**
>>    * struct xe_pmu - PMU related data per Xe device
>> @@ -34,6 +35,34 @@ struct xe_pmu {
>>        * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>        */
>>       u64 supported_events;
>> +    /**
>> +     * @lock: Lock protecting enable counts and sampling.
>> +     */
>> +    raw_spinlock_t lock;
>> +    /**
>> +     * @n_active: Total number of active events that need timer.
>> +     */
>> +    unsigned int n_active;
>> +    /**
>> +     * @active_count: Counts per GT/type of event that need timer.
>> +     */
>> +    unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> +    /**
>> +     * @timer: Timer for sampling GT frequency.
>> +     */
>> +    struct hrtimer timer;
>> +    /**
>> +     * @timer_last: Timestmap of the previous timer invocation.
>> +     */
>> +    ktime_t timer_last;
>> +    /**
>> +     * @timer_enabled: Should the internal sampling timer be running.
>> +     */
>> +    bool timer_enabled;
>> +    /**
>> +     * @event_sample: Store freq related counters.
>> +     */
>> +    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>>   };
>>     #endif
>
