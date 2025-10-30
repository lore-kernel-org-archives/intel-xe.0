Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FF7CCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254710E980;
	Thu, 30 Oct 2025 14:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioLPIbIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7010E980
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761833658; x=1793369658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3HPpIduPlnMHCE+91tmTOv1NqX6loU8XCvGMas4vugc=;
 b=ioLPIbIb4hP+dOdSg3z08ic+MCg9MWrSoDO3jjNfSoJpvjxWG0f8qeOY
 7SkIhjWM+HWh3tkKu9ZeAaPpu/c8m1/jZnooEj1JdiLJzWrhPVMgrNWka
 Hw3Ij+sx4P4u+eqZhjTF5nCLi029OIH0fQi2op3Q7LApXQzAS8OUuHnTH
 Caf5Q6ZzNsvZ/rhz0zFxvNkC3Qe/wkVJRc5YI7ahNCebX3in8/sxs98Bd
 KkeLnA7LNPavvNMtp4qWaBK6N5SXwZZfESu/sJQE6KrQF6gQUV2GGi9/Z
 SgwpSi7xP/u3DQmTyxm+9M7Qa9KpJn4Gs+uDsCHjCBP1s6/dQV/19vAAQ w==;
X-CSE-ConnectionGUID: bGywnUupRMe8IRWdJBbgCQ==
X-CSE-MsgGUID: kqsH/9mpR/K0DoV9CaJjJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="62998556"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="62998556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:14:17 -0700
X-CSE-ConnectionGUID: /IOFMQXoROWVsnSMX0x4OQ==
X-CSE-MsgGUID: uGlJxkM4TEelrjOsesIGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="223185674"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:14:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:14:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 07:14:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAOppWI5sRhb++VZiygF6VimsgkkFo1x+NIY48ji9xtY3S6krRc3NyvoMyko4JRH/4wvBHw3s/gTgEWmPDxfN3n69EJ20jX8vUyZAk3IO8fhFpSI6TKe62nfa6pENqYZOiUZ+BcFfSJ/DssdG2PSAda1MKJymMuK4II/cM9NddLsc+Xjsel3xX1URcB05Euxke+eYTCEuCDRomOu23UvZT124yN8zHoPxymhzlRh2Ij4q/nPjpcknNOCY5yJS39Dwpn+VcmUQ5Jf4nqdhDP3IM0AgGB+n7sXbv5+ZZp04eGUdEdbptFiG06faueKaGMPunHo2hpBTVSsiFCZ0utzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HPpIduPlnMHCE+91tmTOv1NqX6loU8XCvGMas4vugc=;
 b=CE8kDTWuR+dTW8kQZNeOsa8Q3v9N/k2PZLnAcqFoS2Ep68BUZ4vYmP9EdZqsy42u6cmznLqj0qX8p1JXwB6g7Jr7BcjZLL/sSXCKlCgjYbrrpkJZRVYtJ1GeLuNX5ZmKWk5AkYJ51wLBHjKIgWWLUVsQxRKQKv8Hf+WKnzAl2zpYtUG26XV4uQKQkM9z4EluskjxPZo5FkF2sReUChzgkEiLIEffOnZQFVVGgZc8Q8SFLocnNyZ7DsNMuYt0nau74edyMYtmdGuv+JPlFSLMq3IvwVsAIy/lcm6FqS/fFoDftf7fXR+GoTrGk7bCPXuOmfLvUqJokl77RtR6v25q5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPFED9C9AC99.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:14:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 14:14:14 +0000
Date: Thu, 30 Oct 2025 09:14:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 16/17] drm/xe/pf: Allow to stop and reset VF using sysfs
Message-ID: <ok3tlwypsbvewiqqprsx4oph7ggii5d2u23ijb2clrxegovog6@4o5w3hev4lrv>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-17-michal.wajdeczko@intel.com>
 <e4gagt4kem37ogz3ccxzlggznmsveh6pfa44ybghma5zav4swe@edlwn47v2kzt>
 <4fd915b1-01b5-4113-947b-ff93a82e75b4@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fd915b1-01b5-4113-947b-ff93a82e75b4@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPFED9C9AC99:EE_
X-MS-Office365-Filtering-Correlation-Id: 525df976-8ef9-44fb-d6f0-08de17be9aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUZseU4xcVg2Y2JGU2JzMHpST1dscWJmSC9aZTZlT0FtR3JJbkF1UFR2UmR2?=
 =?utf-8?B?UDVHVUdma1RmMWlteG5mNnNpR0Zpa0dMcGZxd2Fxa2J5SnlHMkJ3MktkWWdN?=
 =?utf-8?B?dUwvOVI1akMvRHMwVDZuNTg3dmp1NWw4M3k3QTlha1FOVDBJRlRXbGJCRVhi?=
 =?utf-8?B?UDVkR2UvY1J4R1NwM290WkN2VFoyY0R2V3RFQWN4WU5xb3R2TzJaTkNvMVpa?=
 =?utf-8?B?elpJT1BxeFQvSXlVM0NabHFRQ1hUUVZFNThaV2NwSEUvY1YxK0dQS3UvRGV1?=
 =?utf-8?B?NUtBTmtVcXJ2Rk03ZlR0RHJtczhkS01wT1NmVFBZTmR4ekdPM1lycDJjd1Bk?=
 =?utf-8?B?aFliMHlPY052eC95cmR0aHB4ekRHbTlQZTJsWGppQ3VHZ0dUYlkyVFZWbTRi?=
 =?utf-8?B?UXV6ZUpsYWVSc1l3Z1ZWOWFYQncxRWxRTUJPODlwNmx0bjJ4dlQ4US8yc0di?=
 =?utf-8?B?aGZid1pFenh2TDNTbmQ0WXRhTFlXLy9QSVBXajd6TGhlU3UwRXFNalhPS2k2?=
 =?utf-8?B?S2dvTWVXdXNBM1hRaVAvRXlSN2hGNzhPL0g0SUgvc1N6bmdIeXFFb3dVOEtx?=
 =?utf-8?B?WjhXSHdPWnoxS0I3SkpIcDkyZzRZK1craEErdWJqZVhWMFhuSU93YkI0azlT?=
 =?utf-8?B?TldhSS9sNFE0SkVuV0N5WnpNQVJwRW1wejhvZUI5MDdhRU8xbFRONGJ3LzNL?=
 =?utf-8?B?aC9Bdkx2dmRCc0pFaDEzdk1La0oxRUczbFFTZ3lzUXNTZXlRTkk1ekxKenhT?=
 =?utf-8?B?ZDZZaVl2TTBpVmNUeXhPMVIzZGU4MUx2Vkgra1VKYkJKZXdaTGNSdXc3Q1Yz?=
 =?utf-8?B?NTAwckRud0hpYVFoQWpiaVdBZXlhMC93R2RtTHJOdTJRbGh0dVJsVURoTXVF?=
 =?utf-8?B?SFVYSHUwRVI4SFpPM1lMV3RYQ0xwVHlIK2txT05yMGdrWGNaUDduQ0wwQWFO?=
 =?utf-8?B?TXZYWUJzb05iMlluMUJ5OE1wSFA5SFpPMkhoc0FLZVdZbm5paEFoQ3dWSEZE?=
 =?utf-8?B?d0Q3Ky8xS29Yc1NIbm82ZUFNRVJCU04yQ05BN2xaRHd5RlA3SnhZRVdGUXRX?=
 =?utf-8?B?UURRejREa0plZ21RT3k4VFBMYlhpUGtJTGZWUFhaOGhaZytnZ3RzcjJkNFRl?=
 =?utf-8?B?VWNjakpVOHdBaDM4QWRta2dQN2dEOXI2TDZwWmVGazFoajNNWWROcitvV3lq?=
 =?utf-8?B?eXNoQ1Z5N0U5T1gxM3FGM2hmNzdlRHhldHNGOUk4dVZpbUZ1UkxEeWplSGJ5?=
 =?utf-8?B?aUwxRVV4RDB1NGlxWU4rSnBPczc0d2Z6OEJ5cGxTVHZYV2swZjZqK2drSTF5?=
 =?utf-8?B?UFIzbzd0blg4djFTbi9lTE5pc1hSOVpzdEJCc0t6R2p0WGhHU0MrcTcyZzBx?=
 =?utf-8?B?dkowS1NVY2VGZGlSZ3BnRFBlRmJQUEFhTndNeDdOR1JiUzVpWHZCczI0eW1T?=
 =?utf-8?B?UjFHaFQ5Tnd4aUl2RDlvME1QeWhmUTNEdjkrMUdRdUEvN3dKajRqdUdPRGph?=
 =?utf-8?B?ZU83V3h3ZGJ1Y1VaWmJ3YVZ4WmJlYmN6QnNabjJoMDcraUNTVlhrK1ZPc0VN?=
 =?utf-8?B?cCsrZk1rZ2pLN1kyOTFpM3R0Wm5lak94VUNwMzAzQ1kvWEVvK05nclgrRVVY?=
 =?utf-8?B?K3dKOEQrZFdRbUo1RFZkOE1ZSXUwZ3RjaG13LzdXR3AyTzBtM2RVc1VKK3VH?=
 =?utf-8?B?aUNhZkFhRFkxNGJEdWJsL2o3YTdkK2FaK0VPa0IrKzRxKzh4VUsyU3k0SWZJ?=
 =?utf-8?B?NS9Zc1hsdHU0UEdsL2grRmtUYmpBcXlKVTlFL0JPMTBpYzRCdFIzK25SQUdy?=
 =?utf-8?B?Y1BSN2FxYTVmd05NVitvQ1FwWm1GQ2JUblNqNXdTMkFQY0JnaXViNHN3ZkJl?=
 =?utf-8?B?N3hXZS84YkhMUCtPVGNpM09sVzYyeHVhbCtTdnlNZTh3TkEyUFVXeEFkamhY?=
 =?utf-8?Q?2qWMk2NParrc09OoL/s6ToIV9Rexiog7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajF0YTZ0aTlNUDVHWTczaW4yR203Sk5rS3dxQzY4MGdMQzRBYkNWK0MyVGMv?=
 =?utf-8?B?dTJpL1FCT3FTQ3RCRTVSTTVUOHNxaEtETkphR0ZxbjQxaEJ0UjB0akhmVDNN?=
 =?utf-8?B?Tmc2M2ttd2VXL3JTZk1XKzUwVCtqUS9rNFhIcHhrNmpjT3JrUmsybWF5VWUx?=
 =?utf-8?B?ZDNaSUw4VDh1eTcyUmJ1NHRyaXdDbjdaREEzU3ZVcGdxSkY0RVdBQ1hER0Zr?=
 =?utf-8?B?cDhvbTRoY21GMVRCZXdHTGNCYVBnd1JnV3R3TUE2VVZBY0ZBSm51c05Fd2FG?=
 =?utf-8?B?c096dWYxWkt3RVY4YkpUamliTkhsbXlvbVYzbWQxdktSU2l6SzJBMkkwd01Q?=
 =?utf-8?B?QndZZ2NHRWNZMHc1VWg4Q0RCUndxOFA3aWY2TDhaSCtKR0tIV0t6dXlWM2Rn?=
 =?utf-8?B?Zk1mOHF2SDY0OUlSbXhyblRNWWFUVlBycHFlc1FNZ2VZK0Nnd0NEempBdStZ?=
 =?utf-8?B?NDRnbzAwUlQrMTlxaVZKUWdha1Y3a3FxU0lkRzVHSFZ2aFY3Z25sNUlnVEtq?=
 =?utf-8?B?YU1TZ2J1SlJkWTNmL28yZFBKUU4zY0Y4VVVKWlhPTmVsRzR5RzlhbWdCYjln?=
 =?utf-8?B?dC93azhBekpCUC9IalNUa1djdW9pV3F5b0Fpd3ZhVzBvZ1lKT2Nta1NYTll4?=
 =?utf-8?B?RHhQZS9PQXNFNkVNc1hBTnNIY2ppZXlDSERHalRnWjE0NGR4L1FnWlM2UUlI?=
 =?utf-8?B?elFTUFNmZDFnc0dQL3B5R0V0SjdIbzdnclRrb1BTaDc5M1l4QlJRUjZScjV1?=
 =?utf-8?B?ZTM3WlVGYmc2eGJDSDc3cVVua2tReEFJbEFINzBacU9VaTJJWC9kTnhLRFJh?=
 =?utf-8?B?cWVGMXRJRkZhckpIU2lQQTNRT2h4UFE2VmRRVk9HOFpVMkpGTVFxU3Q2YW4x?=
 =?utf-8?B?Vmw4eFE3dy9jK0lXWFlsR0luS0dGZCtsR3BydFBEYXJzUldCTUk0cWZTZ1Z3?=
 =?utf-8?B?VnJPTDF5NDAxbzZMRVo3QzNtVzhTQ2JNODhJOUM3d3JBS0pKOEE1NEFIZEMv?=
 =?utf-8?B?eVBOR0lOd3JHM3pHR3pjU2xBY256SUVUU0JuQ1RJYk84NGNQRHJzKzlKQXEz?=
 =?utf-8?B?UXExZHFoUGh1MUc0VVlKWVQxL256WCs3bkRJcmxYRFluT3ZLN0JIM29JdjFX?=
 =?utf-8?B?U3FjVDR5VzhZWnJIQlBYM2I3VXV6b2d3VkwzaTErQUZtYUNESG5XMytqZGVk?=
 =?utf-8?B?ZU1mdng5UW94YzB6NnV1UllMOGJsa2M3VmFmdzF0ZlNLM2xwMGdNOS9JdWhU?=
 =?utf-8?B?UmlMdFdQUVVGejdHUUR0OThHdjE2VzZvUUlUU0RoMmYya0xqYXdjaC9BZ21k?=
 =?utf-8?B?akgrQjJIL291Tk1uZ0VxNS9Fc1hEek12Tjh1ejU3YmdySEZoN2QycVgxUzZZ?=
 =?utf-8?B?NE81YXl2aExFRzVzSDRzeXF2VjIvWlJRbkNUMHNiMVF0NDFJSTVwK2VVUnla?=
 =?utf-8?B?L2pUNFhReDZCdTE3dnlaT1NycmIvMGwzK0czRzNZOERGcFZYS1Z5SmJtOE5x?=
 =?utf-8?B?UkdTY3BGaEZWYklVcUp3YTJGQVdveDA0ZlpKR25DdDVLU045THJiY293UVVm?=
 =?utf-8?B?aVZYNHNQQ3FXNFVaNzhDNWNvUjZLcThkby9UV0JqRUJESGZGRzlVSit6S3VC?=
 =?utf-8?B?aWF4SDNNUW1uSGRWMXZEbGQ5R25tcGhadlAxdnFiRmFmQ2VFakxwQmRzd2My?=
 =?utf-8?B?OWJHMGRZODh0cVVnL3l5bXQrUHZYUWhzZ2gyMFNJaUs4Kzc5SlZaU0drQTdL?=
 =?utf-8?B?SWtyVW45Qi9VWjd2VVVwS0FqcHkwUHY5YzJwMlMzc2hEL05iTEt1NVBoai9i?=
 =?utf-8?B?MW11Q0Q2WWNJTVBOZHJsdFI1VG95SFVFQ1BYdytrbjYrcWhCK0I3ZkVxTi91?=
 =?utf-8?B?YURTcFNrVVFuL3RsVnBkcXVMNW5ZamxuNzR1TkcyZlFhVkVkd0ZFeUtrR00y?=
 =?utf-8?B?dmdhUFBjQkNaejNHVUl1K0dnZmVYTk5TZ3FmeFlVSkwwd1NTWXNXNlloa1VP?=
 =?utf-8?B?U3RCdUg1VndOY09xZFFMYkhEekZ6THdNV3EwSTFTNHJDSytmVWk4YVk0L0FU?=
 =?utf-8?B?NXlvTG9DUXhmazVDT2JUMENubUpMZ0tiMmQvRk54Q240RnBzM01OVmJiSXBj?=
 =?utf-8?B?cjFlZHh4cjZaY29abDVtd2NmbktTRTlJNkE1c2NoUXc3bDhnc2lBKzRyb1NT?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 525df976-8ef9-44fb-d6f0-08de17be9aba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:14:14.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jmAsj/V1HdfAYZIz2vwksbkKf2aGrdtqZYlpxgRTLJG7Zc/ORIsB/efk5bliTx4+Le6ArYIuScBX7fZTj7GMlzFZ1s1Hfocb9cOQ1nfIsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
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

On Thu, Oct 30, 2025 at 02:50:09PM +0100, Michal Wajdeczko wrote:
>
>
>On 10/30/2025 2:43 PM, Lucas De Marchi wrote:
>> On Tue, Oct 28, 2025 at 06:58:30PM +0100, Michal Wajdeczko wrote:
>>> It is expected that VFs activity will be monitored and in some
>>> cases admin might want to silence specific VF without killing
>>> the VM where it was attached.
>>>
>>> Add write-only attribute to stop GuC scheduling at VFs level.
>>>
>>>  /sys/bus/pci/drivers/xe/BDF/
>>>  ├── sriov_admin/
>>>      ├── vf1/
>>>      │   └── stop        [WO] bool
>>>      ├── vf2/
>>>      │   └── stop        [WO] bool
>>>
>>> Writing "1" or "y" (or whatever is recognized by the strtobool()
>>> function) to this file will trigger the change of the VF state
>>> to STOP (GuC will stop servicing the VF). To go back to a READY
>>> state (to allow GuC to service this VF again) the VF FLR must be
>>> triggered (which can be done by writing 1 to device/reset file).
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>> v2: drop reset file (Rodrigo, Lucas)
>>> ---
>>> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
>>> 1 file changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>>> index 360b0ffd9cb4..3a8c488d183c 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>>> @@ -13,6 +13,7 @@
>>> #include "xe_pm.h"
>>> #include "xe_sriov.h"
>>> #include "xe_sriov_pf.h"
>>> +#include "xe_sriov_pf_control.h"
>>> #include "xe_sriov_pf_helpers.h"
>>> #include "xe_sriov_pf_provision.h"
>>> #include "xe_sriov_pf_sysfs.h"
>>> @@ -52,6 +53,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>>>  *     ├── vf1/
>>>  *     │   ├── ...
>>>  *     │   ├── device -> ../../../BDF.1
>>> + *     │   ├── stop
>>>  *     │   └── profile
>>>  *     │       ├── exec_quantum_ms
>>>  *     │       ├── preempt_timeout_us
>>> @@ -291,8 +293,55 @@ static const struct attribute_group profile_vf_attr_group = {
>>>     .is_visible = profile_vf_attr_is_visible,
>>> };
>>>
>>> +#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)                    \
>>> +                                            \
>>> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,    \
>>> +                           const char *buf, size_t count)        \
>>> +{                                            \
>>> +    bool yes;                                    \
>>> +    int err;                                    \
>>> +                                            \
>>> +    if (!vfid)                                    \
>>> +        return -EPERM;                                \
>>> +                                            \
>>> +    err = kstrtobool(buf, &yes);                            \
>>> +    if (err)                                    \
>>> +        return err;                                \
>>> +    if (!yes)                                    \
>>> +        return count;                                \
>>> +                                            \
>>> +    err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);                \
>>> +    return err ?: count;                                \
>>> +}                                            \
>>> +                                            \
>>> +static XE_SRIOV_VF_ATTR_WO(NAME)
>>> +
>>> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
>>> +
>>> +static struct attribute *control_vf_attrs[] = {
>>> +    &xe_sriov_vf_attr_stop.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static umode_t control_vf_attr_is_visible(struct kobject *kobj,
>>> +                      struct attribute *attr, int index)
>>> +{
>>> +    struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>>> +
>>> +    if (vkobj->vfid == PFID)
>>> +        return 0;
>>
>> I think this will be the case for the entire group, isn't it?
>> Should we go ahead and just return SYSFS_GROUP_INVISIBLE so even the dir
>> is invisible instead of having an empty dir?
>
>today it can't be empty as at this level there is already a "device"
>link and a "profile" dir - both for PF and all VFs.

I missed that this group didn't have a name, so it's not a separat dir.
Yep, this looks good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
