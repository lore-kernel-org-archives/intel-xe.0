Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D3CA0FFD
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 05:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8710E08A;
	Mon,  1 Sep 2025 05:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8iaeX3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6297F10E08A
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756704551; x=1788240551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J7h4+vQfyGWglIPgtLxstb+pz0katpdpmW7KpNmQ5Ns=;
 b=R8iaeX3HErrtBsAszccNWQfx+BhOeduqESwyFUNGXv7oy7eQignks7Vy
 N8K8yNuYz+rYYshRMpJZGfyHpNHGOfaguit1NMjV4BW7rIIGzmGIk/53N
 AK+U+oyYCYaxAwyUohybhP1JljiWq1SGbMBE4DzXvmvu+gVjrRx1PMxcK
 QOJfacVkeKLrnutb2wQ1+N4COFcjS8dwNwpGu2z2CI/WfFHIkH9kRgPw4
 dFv+cTCgU8dfQ5oEpn+nofUD4KCjIwp2mIFLm2NMCAhPmFtpIrFU7NpZo
 eIYFNh2V4+popAQAq7Aem9WTIdt/A/iYSpK19YvFxOwHwRlpnJ3WdmmlI g==;
X-CSE-ConnectionGUID: vaSXL2s8QsGBOqMdgEneVA==
X-CSE-MsgGUID: aukWSUm5TlWDhtEEfLWTEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58968958"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58968958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2025 22:29:10 -0700
X-CSE-ConnectionGUID: baUofT6eSACeMVKCqc+3Bg==
X-CSE-MsgGUID: mni8HVfBTfyTOjkYU+zWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="194560121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2025 22:29:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 31 Aug 2025 22:29:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 31 Aug 2025 22:29:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 31 Aug 2025 22:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oca+GocyebuSo9JN8OtpLGod+VDqYZUADC10vh5KlI3W+kHUDy8Yr45wx29RrPxVCxyL6N2kgunxgSdveER2oIp4csyPMZZ2cTWpKAuF9lxApX201P73x8VzbYz68IhZWZV8AtsDPhLPLxyU2Ll0J7XGmit/SWjkuZ8dqdZqn0bAZYY15zlO7TyzTTS5gEYr+dIpQiZEduiU+43U04r40pJfLtO4cHy2h8LklXEGMOyo4gUXkCZU/+I+DQvryf8XwCXCPSOJUT7OyYxi9lPZijiASrTXNUQCTdl/2X6rmyOJeX+DPfQUw7HmNdOUHnlJJuhxR/x/+fc80RAkgPsFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc3g2f+4NLr32SZqilmmBVOXjkNUQXsMedsvYRV4gNA=;
 b=oEthsMykMlHuJwYHc4puagk4ektl3fbWHhU2Ve6JJyEVmQr4Z3wjKsOXkdrxe4fJrmxm46hVuF67p5msyshhu4YhJ1cNRVtfxYQdVXcd8n5aAFmWnRdim09gvpFMJzSWnAoptFD30xbMc7Q3MYLJHJ9SzF7za12M7pyqgwH57CnsinapaS9Asei2Y7rsDBgPeKTiEW+k94j3Wt2+F+hV5/Oi+TqNLEiCxLN6iwz8wkuiIqU48UniZwqhQJXC2xHUwwCtI4sbEgS+ZoB16LffoWsS2kexviRSz4E+r8Pek7Sk9v6FvL072OKLIDOqSk+/Y4OeOrdvlU6pvHMdRDsNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by SA0PR11MB4591.namprd11.prod.outlook.com
 (2603:10b6:806:9c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 05:29:07 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::8435:3b39:7eee:480]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::8435:3b39:7eee:480%7]) with mapi id 15.20.9052.021; Mon, 1 Sep 2025
 05:29:06 +0000
Message-ID: <3409058f-b961-4001-88fc-1fdfab9a1b79@intel.com>
Date: Mon, 1 Sep 2025 10:59:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
References: <aLAa0ZEWi5mGed2S@stanley.mountain>
 <37b7ff75-8931-4244-add9-02cb0e30e02b@intel.com>
 <aLFtanR2J8-uPKuZ@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aLFtanR2J8-uPKuZ@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bf69a1-6f4d-4941-51b2-08dde9187854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFNUVXRmeUlidFFZTGk3Uk8wc1ZTUiszNFhFYzArREFSNFNNTjZ3Y2dyNXFn?=
 =?utf-8?B?UnJuVWNwUkdDU2Q1am1QbmxJQWt2WU1lY01GQlVMOHJlR1ZaTlZQTmN6THlC?=
 =?utf-8?B?ajlsQWw0enhTVkUxZWE5d1NpVXJEOGdFMUxvY25RbzBZQmY0L2EzUk9ILzdt?=
 =?utf-8?B?dTdvT0s4YlJoNzB4b25neWR4Y2VrYnFHRzJRZWhKZVJ3bXJ5WFdPSTc4TXhK?=
 =?utf-8?B?RnAwTHVrelRXUUJoM3VoNjBERFFTOXNiSFY5Q3dGWDJpQXRHSmk1RVR5azky?=
 =?utf-8?B?OWZneElZbzJaVnd3V2M1REQxVEkrRlo1cEhCYlVuT1ZpRTRrRUNhZzcrY3Vh?=
 =?utf-8?B?WDVITUl1WERuQk9QcEVHVHNIRUQ4MHZOMzdZL0xGOWxvNEdqc2xsNFFoTlNa?=
 =?utf-8?B?c3A4L2orWThqbjlnajVRdVVQbkh0Ny82Y0YzZVlQc0I0YlE2L1NsK1hUVDBC?=
 =?utf-8?B?eVdIOVpDNE5yUUcxa3I5TWVIQXBnWUE0czIzVjJVVyt3dkY3SkpobjVUS3Y2?=
 =?utf-8?B?M0RHaXE0WTR2dWhtaHNZTDF6dUh3NmJlQkJjUFY0VldvakdUcFRtYXh2aUZa?=
 =?utf-8?B?ZHBscFRSbFFEeWFCekZZN2xJODB5Wk9adHgrb1gzaEkrRjFTT0pDeFdsV3dq?=
 =?utf-8?B?eEJPYVNQaGxKS2lOMERpcU4reTFuOFlXQ0JyOUhlUk1kK1JVZDZRK2wwN2w5?=
 =?utf-8?B?ejZUazNRbWQxNXNHZTlxK3ZZRnZweXplWHNFWm43QWRyT2VEZDhHemxhWURD?=
 =?utf-8?B?T0JvaHVibm52TEZKWS85VXYyZHFzd1UyWExLNm5pTmIvbzJqMkhIZXlUQ1k2?=
 =?utf-8?B?NjUyWlVDWHYwVkVvVTU4dkJoZTdIbkwvbVBJTVJwT0tzWWJERFpESmZOY0gy?=
 =?utf-8?B?OFJrUGxhc1NzR0ZaS2hpRVVjQUFyWjJVQ24xNHhUR0hPMjZkM0JGbFRiWm1u?=
 =?utf-8?B?b2M5RXZKc2ZKWVl6MEZRN0tqSmovNEpvZVFKaVBibHYyTmt5VHhUQU5SVUhP?=
 =?utf-8?B?L28wcWlEYTBaREcwaVhHQWxKSFNmMmpxU1AySkxBeXpPUXZBRjAyUmw5YWtM?=
 =?utf-8?B?bElHdUJPd3lCMk1idUpLbGFzVE5PcHhPa2JJM0pRVUJEQjhXVGdTVTZSTklr?=
 =?utf-8?B?TWNMTUhUSGdmWTVEWkF6bWliZGRicHpTWUY1dnBnQ0IzZjZ3dytaVzR1anlu?=
 =?utf-8?B?bk43ZHRybElzRkN0eUhnTDdYSk5nSzFnSXhMY2RpOGt3aktibk54bEVqQ3BX?=
 =?utf-8?B?dHgrOGpabVk5dUV4ZDBUaFFiTUhjbDlqaDNRK3JyQmlwakVmWHVyTHJiVkJ4?=
 =?utf-8?B?eTBOOHRoSURDR1FnL2pHeVFHQk1xVll6SW8zRzJKOEdGMDdob2JkUkJQRk5Y?=
 =?utf-8?B?V2thbHBzT1FpY3JqQ1o0d1VNZ3BZZ25lOHA0Y2VDMnFEMUpCUmMzYzdGbnJt?=
 =?utf-8?B?QkltMWZMQ0FkWThZZWtGcTM0WGs2MXkxdHdjaHZkc1FhdDNoTE5oS08ybzEy?=
 =?utf-8?B?cUtNdjkvcEZKSjlLbmw0cjVSM3NOU243dHZCWWdNdEdRcVg5a1o3ZmQyRXQ5?=
 =?utf-8?B?L3VtRXdWd1F6ci9aSlVDSDNqRTFNUFdDdnB1ZVJGU0svQVZ6S29kdTdRK1lm?=
 =?utf-8?B?VFJibFNJeW96dGJxTzdndys2dHVrN29odzZWRklHNTRFRmpLZnFVRVNJRmlU?=
 =?utf-8?B?TmE1OG1pK2lhOXJCa0UyVGpLZ3FlVkx5dnJLTDRrMG1SM3VrTFg0elNPRk9P?=
 =?utf-8?B?RXdXN0dIdGNMMDVtaGR5R0xJRGltcWoxUC9WY20xZDB4NWlvMitCR1oxeFFO?=
 =?utf-8?B?VDkyNVhqeklCdGx6TlNtem9KRXlWamVpNjZHckZ3NVlRZEFWcWQrU2dWTlN2?=
 =?utf-8?B?dVBqbXc4a1hMR2UxSUgzNDlqekJqTUlpTFZMNCtYT2plQVB2ejVidUUzTTRa?=
 =?utf-8?Q?eFnQDYmpOQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2IzODNYb3hDN29xMTBCN3lIT3NDWEhUTmJOSGFkSFUrb3lOaHE3dElHQlRK?=
 =?utf-8?B?eUZwRkxxZmUwcy9vNzA0b1lITnR5ZkVHVjF2cnlsMjdlY3EvMlh4Z3EwQ1A4?=
 =?utf-8?B?bk50c1JPMURYYTBuZWZHSjZ1d1ptdGxtd3lVcDJmb2JtY2gwM251YjQ2ZUlP?=
 =?utf-8?B?UEdwbU1RbFFqcnNwRTJkK0ovSVo2eisvTi9KT3doNCt2Z0FyaWwrTGtBYllL?=
 =?utf-8?B?SXh0VTErWU14eml5bThPcTdUMDErUDFHSHpIN1gyYW1qRGs3NFE5RnFDZFM3?=
 =?utf-8?B?SEZ4WDNqcEFxNG9oU0RZbC9FQk5BWDBVU0xVWkk0aE5jQkoxK096QzZKc0FC?=
 =?utf-8?B?V3RLSVc3WFdDOXZxRm1XRWhlbk55SXBIcnpnSGpaMUV6NUxsdWN1YVN3ZVEx?=
 =?utf-8?B?b1h1RlBUS0NtWElGblZKdUoxMTlVVlUzeGNHdG9xMHZjRjR5aURyaUp0UnJN?=
 =?utf-8?B?c2ZSLzBlVWl4U1FBalhkRThkdmdrOEhCZ1VZbTBGZFJJdno2blR4TGhKeVFL?=
 =?utf-8?B?Q2crckduMGFvQ1djOWp5VnFhalpaWER2UCtCczBPYTRMRnRZbUs3M3NadzIx?=
 =?utf-8?B?U01sRjFHS3JUblRzWWplbVRyK3o1ZU9RUEJ6d3Q5S2tlNytWSmhFT3N5V1V0?=
 =?utf-8?B?U0VFbTdWWSs0dnFnazRQRjJvZDFQSEtILzk0eTY2bkFHZURKemxuOE5INnlt?=
 =?utf-8?B?YXJPK0lpYUNhZ2E4UlozUzNFTjk1TXlWQUNTMXhIOGl3MUVQVkRxbEJTRDNj?=
 =?utf-8?B?U2R5SktiMzY4dnZhcjU4eHRVYjdiejZVU2k2VEtWdlNCbEd5cXVJOHNFMHdw?=
 =?utf-8?B?NENySXJNZUFqc0FnZVZ1Z2FDbDI5cXpVS2tIelg0Z3JvV2ZvQlA0eW1Pc0hy?=
 =?utf-8?B?V3M0bG9TOFJtWWE3djIralZ2ZlBZbkFnQ3pIdnU0UFJhL1NtejdDMXBmWGxw?=
 =?utf-8?B?MmVESkg3bDB3NGZWbTN3Wi9TalBJRDR1bGhiTEN0R0crQUpYU2ZmUDRRU0VH?=
 =?utf-8?B?aGhnM0IySHdsMDl2alJBY1ljRjN2V0NubWxScElHVUgybm4wVkZNZy90VjRh?=
 =?utf-8?B?NVh5MG9tdnZEYWRoMXdZRCs4dnV4aEpldjBWZ0twZ0pjTVdDZCtPUGFFR1hR?=
 =?utf-8?B?OThjblNhY1JEdGdlblgzUDU1YUZ0Q25nRGx3TnZ4aGJOaGx5VDNGdXZIVzZL?=
 =?utf-8?B?OFVXMzhkNng4Q2VaZFNMY0RXQytwbXJVOTZzY0NURzZVTTY5c291TjFxZXJJ?=
 =?utf-8?B?T2FnTUFqLzFVTjlQSnhiQklJQ1lPbmRmNm9DQWQ5WTNkckFoUmJMamZsenp6?=
 =?utf-8?B?WE9KWnNla2R2VGQ4MmhoK3J5OFdrQ0NFWWJMcmRNYnJtclFSRyt0MHc4QWF2?=
 =?utf-8?B?OXFFV0pNMXdZTThvVFQzaVhwdnJYZVRScFJjZDNRK3lCUFJ0cmhmaVgxTFFj?=
 =?utf-8?B?NTFsaTZJc0cvRGUzZ1VQMDBOMGlybHoycE5xWktHbjlkNnF1VHFQTmFPWkRZ?=
 =?utf-8?B?RFhnbkk4TWVoZVFoaitLNnlpdFBYVWhlZmxxbmdwYTdDUk9OQm15RFl0a2I3?=
 =?utf-8?B?VXByZUxmYVA5YlV6YWxXSHJLYkNlMG0rUUhyRmRKK09WYTZnY0N5eEttcEhz?=
 =?utf-8?B?TTBhWG5RMEVoeHN4dzVIQ2VqRjhab2hyNitvWWxxenFKNHJtOXB3ZGtNYlJ3?=
 =?utf-8?B?VFFFZXBobHg0dW82M3huTVYrUEJXVUZDaWpVdHg5SHlpM09RN3luZC9jL2xR?=
 =?utf-8?B?VkMvaUVUSERGdXJtWTI5VXRzalpQWHdZYmxuODJhR3hhcmR6dXJtY2k1Q1g1?=
 =?utf-8?B?aFBGblZ2RmtKL1pzWHpwYXJob3pNTVN4N1crR01BcE8vVEw1aVlLb3RSdVRZ?=
 =?utf-8?B?UTRUdDZndi84eHBWbW1qYVFMRm41bm5aL3NVQkhEYm51LzEvQjJsNHNEQmdL?=
 =?utf-8?B?RFdMZlE5a21ETmwzOGJvQlZLTEkraHNsZVQ0UVJlcXQ4Tjg0Qmx3TFJsZ01p?=
 =?utf-8?B?NG0wTjVGc1M2WGFqTjQ3cDZsRFB4blZQb0NvQ1czcTJXZittQlZDNit4eVZr?=
 =?utf-8?B?Tk85VEY3Zzl0emVDVFZSaThSV2tmV20yOEJIY3pDMXpXSlVraXdzR0hxUjhQ?=
 =?utf-8?B?akw5am94clBNY1hWZ083RnE5U1ZkZTdPR2tMYnZjcU1DR0t1T05mVVhNbHlW?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bf69a1-6f4d-4941-51b2-08dde9187854
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 05:29:06.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOo80FD+jjV7EPWry28KOTdDttgXUv42XeD5h5mNYP3/V/PghNYgYAzHhOaAso+GZ7Uo48XbdpEMsBL8zvlAoOdYosIilQrvizFvIG12Dgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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



On 29-08-2025 14:35, Dan Carpenter wrote:
> On Thu, Aug 28, 2025 at 03:10:40PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 28-08-2025 14:31, Dan Carpenter wrote:
>>> Hello Himal Prasad Ghimiray,
>>>
>>> Commit 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count
>>> and memory attributes") from Aug 21, 2025 (linux-next), leads to the
>>> following Smatch static checker warning:
>>>
>>> 	drivers/gpu/drm/xe/xe_vm.c:2298 xe_vm_query_vmas_attrs_ioctl()
>>> 	warn: maybe return -EFAULT instead of the bytes remaining?
>>>
>>> drivers/gpu/drm/xe/xe_vm.c
>>>       2240 int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>       2241 {
>>>       2242         struct xe_device *xe = to_xe_device(dev);
>>>       2243         struct xe_file *xef = to_xe_file(file);
>>>       2244         struct drm_xe_mem_range_attr *mem_attrs;
>>>       2245         struct drm_xe_vm_query_mem_range_attr *args = data;
>>>       2246         u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
>>>       2247         struct xe_vm *vm;
>>>       2248         int err = 0;
>>>       2249
>>>       2250         if (XE_IOCTL_DBG(xe,
>>>       2251                          ((args->num_mem_ranges == 0 &&
>>>       2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
>>>       2253                          (args->num_mem_ranges > 0 &&
>>>       2254                           (!attrs_user ||
>>>       2255                            args->sizeof_mem_range_attr !=
>>>       2256                            sizeof(struct drm_xe_mem_range_attr))))))
>>>       2257                 return -EINVAL;
>>>       2258
>>>       2259         vm = xe_vm_lookup(xef, args->vm_id);
>>>       2260         if (XE_IOCTL_DBG(xe, !vm))
>>>       2261                 return -EINVAL;
>>>       2262
>>>       2263         err = down_read_interruptible(&vm->lock);
>>>       2264         if (err)
>>>       2265                 goto put_vm;
>>>       2266
>>>       2267         attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
>>>       2268
>>>       2269         if (args->num_mem_ranges == 0 && !attrs_user) {
>>>       2270                 args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
>>>       2271                 args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
>>>       2272                 goto unlock_vm;
>>>       2273         }
>>>       2274
>>>       2275         mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
>>>       2276                                    GFP_KERNEL | __GFP_ACCOUNT |
>>>       2277                                    __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>>       2278         if (!mem_attrs) {
>>>       2279                 err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
>>>                                  ^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> This is a weird check.  If args->num_mem_ranges is zero, then kmalloc()
>>> will succeed with the ZERO_SIZE_PTR.  If it's 1, then
>>> args->sizeof_mem_range_attr is quite small.  64 bytes.  The allocation will
>>> succeed as well.  In real life err will never be set to -ENOBUFS.

if kvmalloc_array fails for num_mem_ranges  > 1 error can be -ENOBUFS, I 
am not sure why -ENOBUFS will never be set if mem allio >>
>> This is false error.
> 
> This wasn't from static analysis it was just from observation.  At the
> start of the function we ensure that if args->num_mem_ranges is > 0 then
> args->sizeof_mem_range_attr must be == sizeof(struct drm_xe_mem_range_attr).
> 
>>>       2250         if (XE_IOCTL_DBG(xe,
>>>       2251                          ((args->num_mem_ranges == 0 &&
>>>       2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
>>>       2253                          (args->num_mem_ranges > 0 &&
>                                          ^^^^^^^^^^^^^^^^^^^^^^^^
>>>       2254                           (!attrs_user ||
>>>       2255                            args->sizeof_mem_range_attr !=
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>       2256                            sizeof(struct drm_xe_mem_range_attr))))))
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>       2257                 return -EINVAL;
>>
> 
> I guess maybe the thing I didn't explain well enough is that in the
> kernel small allocations always succeed.  Otherwise I'm so puzzled by how
> my analysis could be wrong.

Thanks for taking out time on responding to this.

We do ensure that args->sizeof_mem_range_attr == sizeof(struct 
drm_xe_mem_range_attr), which guarantees that the structure size is 
correct. However, I’m struggling to understand how this check leads
to the conclusion that -ENOBUFS can never be returned.

UAPI behaviour:
If memory allocation fails for a single range, we return -ENOMEM.
If allocation fails for multiple ranges, we return -ENOBUFS.

While I agree that allocation for a single range is typically small and 
unlikely to fail, I believe the error handling logic is still valuable 
and does no harm. In fact, it seems prudent to retain it for robustness.

If there’s a kernel guideline or kernel-doc reference that explicitly 
recommends not adding error handling for small allocations, I’d be happy 
to remove the check. Otherwise, I’d prefer to keep it for completeness 
and safety.

> 
> regards,
> dan carpenter
> 

