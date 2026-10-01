Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF7CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94A10E34C;
	Thu,  1 Oct 2026 11:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDKlmyRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C0010E34C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790854832; x=1822390832;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0f+zrS8Z0/Z4o/bZ9uIVm+hXay/ss6BoOVIoyofnE0w=;
 b=cDKlmyRqgG8atr8IU2sIPkq+HSVvNr/NFX0g638Shorx1f+9W2NOzrIu
 p2zGD+KH285QOMTZJTkBENbyL6/W6TyRLdFoTvC/g3burz304I1UTGTLM
 qhqk0WO4Jy2CgWLu5CTgSLlRy4zbDC/ZkbRRYskrcaQwgg4zD+CzPvNm+
 hLs+c8FWzIxK+qL4JmQSKGHP4oUvYENPSq82yUfI4FbaQIo1ic8iIFkEe
 3vqjhArNnGmcyF3mA/CsRp16FlZT+bPjXmvgkqlJ0ZxTtBu9AqUCM5ss4
 I6x+h56TeWSKNaEzUFk6TPKJtPprZXQRCV+fsD0DB6/SF7IZH7Nzq2k40 A==;
X-CSE-ConnectionGUID: 92Z+Yv9xSd2Ojvyh8pnJGw==
X-CSE-MsgGUID: plSr6v5SS1KDff+VsdY62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102981889"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102981889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:40:32 -0700
X-CSE-ConnectionGUID: 6ItfYapCSzq4x9i+eMoFKA==
X-CSE-MsgGUID: 3d1khvuNT+GWWST1uDU2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="274059458"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:40:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:40:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:40:31 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEhaBgmXeRqVCnYjj7uWmCYiGbPaMMsvXhAS8DLlRoiIzxzLJjnEmmdn5gWHFzUXckPc12aRS4GORc4vb3iz8P8pJa4SXrsYHRBU173DEZtJL/dGmOSGg84V0ntYTmreTNVCWxqhAabh8yJFZtE4HM5k4HR41JalVJktdWeEf+QJp0pwYiwlEKr1mH6c6yaulUF1qBxRFMYcBL7NROJ3ErF42c8CFy3t6NN/ZzvBKtIfQbftnrgLYQ/O4g+2uSt0KfdtVW3gwVQqWEzeVavDOH6QiIoojjAU1apABuuRqIOKygHrrxlODcp/eJLyA+uGdFtYm8KjJIZqNQRRLd30Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gDofwoMqouUOJjSVEopxPJnuUOyBZ+uJFN/h4wEEmw=;
 b=e7RxJpahKBlUQXoZjbUYLpBaEWAw/ltKdRggzYouPCKwEiH+yxHyQLCLST9K/7nVxYE49pKxb7sXh2eKpNQxNowunVjHl5PusbocffbBp9RCLSnDN14++ksfyFvqE9h+mmsIPX/myT5pL0RkJhQ2FheuhViKLcw/EISxotJO/8AgGH1hgoR1gIYuH1lJZD6KSC0VO6sDUQ6d6ht3AjZGRHuSvyvTVogjsVL70ydYb44DjEcNTmVs8/Pm24YbZPhN0dsGCSOluST035Oh3XUOkFrtsBwP3GjXv5+Boold/gmo7I6FUt0XWK886rjoEaDt7TO5S1gCL5BfH66w89Du0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:40:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 11:40:29 +0000
Message-ID: <4d153fee-64cf-4110-b5ac-0e0fe9db03fb@intel.com>
Date: Thu, 1 Oct 2026 17:10:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-12-riana.tauro@intel.com>
 <DS0PR11MB8718AB9D11A1EA84670A835D818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718AB9D11A1EA84670A835D818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0329.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e7338f-3ede-4b17-995a-08df1fb0caee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IAyGi0RDg/QPmRu9ssD6/Q76LCtqEo0KTL9N+7+o7K6Ju6QZjN9Kfo2Cjje02xXI9nHhgTYGk5OEhWKxR6cvTkvLJRDzw23mKw6Tw/QlcwZhLoH9jIjAr3vkkVurUZ663Wjb1sgSv1R7uVm63OBqxKM3Hd6sK2e0vXNRBcLCZkERI64drtnmMFmMZg9XPHZwQud8yj4D2j7jfaNM5AISKWo3ilhXP9mkz1OiC04iq3JC+yp8TokVEf7hm/Xtn/mwAFT997N0GgYpwYjwgTlEBekRhM/Ad48t3cXqJm9FVvqrNBsJlLRU/4/5iiQq9jc08Ovj1doxoi4YY/sAp6ujBLGq4iQ02q7cfzr6cLeoJHuigNYD+0CTbKm6CVrFhq+VHZAYOCgHnXdUgHbLSHhZO3eOk5ND7thN8claUVhTp8K/WvTZxq9XU7K0ibwc+kFvF/xeejzzOE/nS2M86ocXPZEKBdL1H6eV/SXPAJiWldbrgcrVYHy2CZBstO6d17Zc+iHh226jfqTyJ02vGozfUkCC6bbvkq6g6jbVVCFtfC/Kg/ux863a6xVzGrAcMijIoGvLRyINjeXykMkXk7eDuV2a80aGjph7goVgaM23tKbc+NNKt5OdGmIrIC3efNJ/tbjjOEjvySpdBuUOHDDpvYk2GqngWkaijGiemJTTTIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTZxZGx3M2RSTnVUQlNQNHZHZGhFaFBaNzJpRFNNU0hzZGw2VHp4TWhQS1hI?=
 =?utf-8?B?cmtSMUVEL2IzTzFBdlFPbmZZQ1UrWG1sRmZETU9IcmIzamFzK3NzOUh1REx4?=
 =?utf-8?B?NGQvZFdYcWFZdEtBUGZQT1lmY3oraVArdzRHRzN2TkQxdktTamdhS1ZTS3BT?=
 =?utf-8?B?MHpzTk9tanhvNGl5elVoUmpONDR6b09ROTJMZkJ3NFlZOEhPK0hxVkpqMmRC?=
 =?utf-8?B?ZEE2L0x0dTR2U2Q5UTR2NEROUU5uWWF5NDczQXkyVjV2TGFCZ3hlVDEvVUVJ?=
 =?utf-8?B?TDV5ZHZkTGpuTmNDTGJ3ZUNNaUgvOS8wdWFEYkNEMFBTK2JSU0x1MFA1L05W?=
 =?utf-8?B?WWRrMDN5K3U3aEZ5ZHVjSUh4b2s4akhJNnNyVXZOMEs3ampRdkFZZnRPU0lT?=
 =?utf-8?B?SXVhMEV1M0E1V1MraVZIem95aGZYeVZPVEY5Q3ZESGUzUTVlTTZZbW1mRkpJ?=
 =?utf-8?B?cERxdHlpeHk1eVdDQ3JLRzdHRzZQT0NmT2FjSDZnbm8yVmxXN3A4eEE5MG4z?=
 =?utf-8?B?eGZZbldBdS9xY09qQlFYd3l4YW93aFhYUHhUTTU2Qnp3WkZhVTFWZ3Ywd2xm?=
 =?utf-8?B?b3l6Wk5Cd2w2RjM2bUJTdjNoeXE4cUQwOHN1b016RnB4aEtoR3lDMU5vZS9U?=
 =?utf-8?B?VlViUjduYmFiT1NEeUovZWFhUFg3WTFQczVORGh0WmthSzhhZ3E2TEI4bHR2?=
 =?utf-8?B?M3N4b3QxcjFKZjFMdythYVlXcmZDdVZrSjlLZldtK1FZRmJKdWhWeWZESjNk?=
 =?utf-8?B?Z1hYQXVhV0hPcmFEYTBTWEpMdjRQa3VzNExuNmFrUzdNS0RiUUdDZW9pQm5l?=
 =?utf-8?B?WHFHWXhGcG9ua3dUeDc0aFNSSks2RFY3WGpGbEpxby8zUUdxdGN5eis0WXFW?=
 =?utf-8?B?aWR5ZWtBL3VVSHJOOHNPbTZYRGlySGttYmJCY1BYSW8wZDBwY0hkWCtsNHM2?=
 =?utf-8?B?TmltTFZDaUpjcDhQeWprVWZ6MkFOcUZYRFlWVXl4bGdFSFZCZURLVG1QLzhL?=
 =?utf-8?B?bVJycVYxRlpnUFRuL2lCcFMvZkJSM0o4cFNQOW1IZW05b1l4MDdBRWxGVnZ0?=
 =?utf-8?B?YUo1bXNSMTFYNWNqU0MzUnRGVnlubFFTWUVrUUQvN25yQXhXOUZBcEtRcXk1?=
 =?utf-8?B?QUttNUprRWEvcGNOakU1SUhITHZ0UzFyREJ1WHEwOVF0bjdVaW5KeWtybG5s?=
 =?utf-8?B?YmZzK0oxVEgzanVEa01qUUVZZjdrK1lwQVlZRTlveFU4OVBNazhpb1NjaTN1?=
 =?utf-8?B?ZUIyZHRlM2RQbmtaVzVoeEVHQ0dHcEZMOHd4YTU2R0J2K1N3bk50L0RNaktm?=
 =?utf-8?B?Z2ZNUVlpV3oxaWlQbGRlaUs2c0dma0VpSG93MGFJbjIzcElnbXltVnhFdTZm?=
 =?utf-8?B?ZHg3UkJIZVhyU1JFZlQ5emlsL0xjSjd2OTJFcEV1ZVlPc25ic0xOK3hVZkFK?=
 =?utf-8?B?d1gwQ3picFpPLzZjL0NtYi92OHNrWW5JTGJuU0FsbC9iVTU1ZEFuN0l0cWtj?=
 =?utf-8?B?WDIrYU5CZ3RaMFQrRHRzZ25mQi81eFBBQnMrVytoU0pRVlduK0p3TW1xVlF4?=
 =?utf-8?B?TlV1NWFaWHJITk9Sb0gzZzRHNlVDRllGRnFubUR2eWF0OUxWOVRqNzVOcDA1?=
 =?utf-8?B?WVlzcjFuTXdyRVB5c2w3ODN2dDM1UW5iajBUbEZWakllU3FSbERjd0xySC9q?=
 =?utf-8?B?VlI4NHJNaTNod3pveVFhN1YwMGdlT1VxdW9abUlZWStkcXZVSFFBU1dxNFcv?=
 =?utf-8?B?SVBnUEo3TGFPS3czc3VvOWN2NU45ZzlyNDlOZUdvUEQwUyt2VlI1UGlhZkZP?=
 =?utf-8?B?SEQxTHNYQTFySGI2NTFsWWpNM0IrYzZkRHZITXhkNHlncm4yOTVOVm1VZVR6?=
 =?utf-8?B?bkVBRXNCSWl4b1N5cjErUlNoMjVLMW5SSTRLcnpkd3UrSFQ3WG9qY0xJcEFF?=
 =?utf-8?B?dHl5QXVFZVZybStjUnc0OGdaNG0rS0hRWHYvYzltbVUzNFhDZDRLeGFJSjNr?=
 =?utf-8?B?L1RYc3R3K3JtZFI5b3BCdHdyTjNOTFZjKzJ4MkRyeEEzcUQ4TDYyNFo1MXc5?=
 =?utf-8?B?NnduUTlxcG41Nml6UitQaDc4TFgxZHN5dExzWlFNYmx6R3d5YmdpUHpxNzFa?=
 =?utf-8?B?cjRjY244aVNZbS9UQjUwRHk0a216b0Ira1MxZ2pjcnhWaGU2dmgyV2w0QXlM?=
 =?utf-8?B?amtmVGEra1huMzFoMldEc2ltOXc5RC9HZGx3ZmJVaC9kUjA0K1llM2kwNDk3?=
 =?utf-8?B?K2hEMERvUDUyM1dvUHQzNHNNQW9Hb0dVQlg2ZmZxS1BUbjJaT3hHbjFDc0dW?=
 =?utf-8?B?b0NoUTRCZ3JDb1FnNHRBZGkrakxCekpjZkdrN05LQlpmK1BtSndkQT09?=
X-Exchange-RoutingPolicyChecked: BckUHS/d9D9r3tV5mvfAt2LlU0KteuOXPyJRTSSqxBhr6B7EZouI6dxCKCzkAcnNt4JRcRHN3g3vNtTWFNizzgrMn7VfbfALyZ9Ogy0wwXfgTuf6/9TZNd77CmOmwmcSZFFNhrZAJuRlkNEfDkYmRZoWLF6v3efUxe9WK6lkt4C5B2ADwx7EbQIf+Mch0iI+lfTX10y39Fouk6vLfk78juLDxZOrcZhWUyBpYjNxuiSQuiT9nf4ixQLkB8yYuIaOKZ8m8jFT5x0JhapOJCJNPPiBs3j/ON5UcjY4AvXXrG+yGXW6+z8fXXmb/Bsbx/5/is1TxDpZTerBgxySkNaQDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e7338f-3ede-4b17-995a-08df1fb0caee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:40:29.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IZzt9bfc6g70Ifo7BqE/p3pBgX9S16wDXxv78X+/5TZMdNrvWu3siXhD7qHCI1RF+4bYryATa038HK5uImGtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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


On 01-10-2026 17:06, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 28 September 2026 11:49
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
>> firmware can store
>>
>> Add function to get maximum number of pages that firmware can store for
>> offline tracking. This will be used to report max pages to userspace.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> v2: fix commit message (Himal)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 15 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |  1 +
>>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 9a1a8190578b..cfc7f07e9ced 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -401,9 +401,13 @@ static void get_offlined_list(struct xe_device *xe)  {
>>   	struct xe_ras_offline_list_response response = {0};
>>   	struct xe_ras_offline_list_request request = {0};
>> +	struct xe_ras_state *state = &xe->ras.state;
>>
>>   	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>> &request, sizeof(request),
>>   			  &response, sizeof(response), &response.common,
>> false);
> Isnt it better to  snapshot max_entries into a local in get_offlined_list() as soon as the first response comes back, not after the whole paginated fetch completes. I mean better to not depend on "whatever's left in resp when the function returns."

yeah i am adding this for next rev. The last response can be 0s cannot 
be guarantee to have max entries

Thanks
Riana

>   
> Tejas
>> +
>> +	if (response.max_entries)
>> +		state->max_pages = response.max_entries;
>>   }
>>
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev) @@ -1105,6
>> +1109,17 @@ bool xe_ras_get_disable_page_offline(struct xe_device *xe)
>>   	return xe->ras.state.disable_page_offline;
>>   }
>>
>> +/**
>> + * xe_ras_get_max_pages - Get the maximum number of pages
>> + * @xe: xe device instance
>> + *
>> + * Return: Maximum number of pages that can be stored in flash  */
>> +u32 xe_ras_get_max_pages(struct xe_device *xe) {
>> +	return xe->ras.state.max_pages;
>> +}
>> +
>>   /**
>>    * xe_ras_init - Initialize Xe RAS
>>    * @xe: xe device instance
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h index
>> ac1253d6ead9..561c656e2ad3 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -22,5 +22,6 @@ int xe_ras_set_threshold(struct xe_device *xe, u8
>> severity, u8 component, u32 th  void xe_ras_init(struct xe_device *xe);  enum
>> xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);  bool
>> xe_ras_get_disable_page_offline(struct xe_device *xe);
>> +u32 xe_ras_get_max_pages(struct xe_device *xe);
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 40224db38906..e09b50a6f77b 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -415,5 +415,7 @@ struct xe_ras_set_health_response {  struct
>> xe_ras_state {
>>   	/** @disable_page_offline: cached configfs policy, immutable after init
>> */
>>   	bool disable_page_offline;
>> +	/** @max_pages: Total number of pages that can be stored by
>> firmware */
>> +	u32 max_pages;
>>   };
>>   #endif
>> --
>> 2.47.1
