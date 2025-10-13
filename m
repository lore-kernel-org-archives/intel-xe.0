Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983BECCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 19:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3AF10E078;
	Mon, 13 Oct 2025 19:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXeSvM8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19010E078
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 19:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385469; x=1791921469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wV8o9FqcJpET1JJdEUcVLHfnJiRJA1d5i+MDCsqwd4A=;
 b=LXeSvM8BeCy8oswDAc0NrjQrwYs/7tFwlcK5wPtlHMVMagnE4UHoQ2+0
 vzrnIq9yg4Si9llcXSaKiT6DvbYuHuhAzhWkyr5Z2kPOfo0LcQYZArICV
 SC2rfoXBAL8NKT9M+SGI99X/sUfMGF6vT4hBQgF9rqRKtxov7YJgnLmfu
 NDxHZ9bzQSw0nngB+79HqRpbdeEheezkWElahYDQfHhxB+ayNcMEViueU
 0U+r4nLOezfqIIfGnfyZwhkcJRDhLGG6XrZb9gY2dN3ueAKziZ3zKVUF9
 szxe6AF/vyuxCjR6Th8v8qiYzHqnIjepHpPFLo64PLPcPPwnpgJ5A5kMy A==;
X-CSE-ConnectionGUID: S5ND8TfIRoa5whikWeJD8w==
X-CSE-MsgGUID: /CinJ2M5RjiqaRBBEATL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61744406"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="61744406"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:57:48 -0700
X-CSE-ConnectionGUID: aQROBUHQQSuiTYicXZOxtg==
X-CSE-MsgGUID: 34r0ubEOSHSOofIuj73rRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="205381959"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:57:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:57:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 12:57:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2dzSeXH1w/ebySuAA2EE3mRFxxkaX/zivTJkcqKZPYugstq1MvvSB1TJgSndMRWSAoHh0addAbxlE+vHnlrkjyryJVcCx69Me/4N0vmrEJ+yu67S3z4IkIGpRHtkmiNQKFhQ73S5qpEJTtp8Ocve/ljfJXDVzFQ6P+R8MdEYxuQ7W2sHYB53CYla61WqeQfpwnj6dtx60Pfj4ZkZaDoggkOBuMjf63BfLTKdHwFC1j6/okuVAizeSTOzrax0V+glq/uorZktRvBS8DT6hkVNN5HnMUi8Xc9+WtFRTyHrooofY4DbPv7FUWkm/Gacp/1RwYnU99SG3uPjdpqROdT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2tud/+adhMEoTY3B4K1HQTPjEgC9s90Zja9gobOJls=;
 b=BhLxODDXSz62+3iiIUSNJ+ZjGWmrRrUL+EwabNJ3scA+N65bZbqhSXSsKiS32sfnzXeBmXtWdrqPx4VAjZmAKIbHKs/hldg8gg69PWJyJv7D9yB0YSxh3X701Bh8VEqqYYVmd1mUwHBkdcGKVSTBqxQo4wLhXBF8uFdPNASeMHLx58kr5d8Noye3y6hYNvUL7qnhr+pfsaTO3LpGHy/wqDA0ECFicTvzoIKqJhgHLmwRUAkAH2WIy7aMZ2N44qMK+yEgj0YMCQ6fO2WEhSsOpHzqPcCU7IKpo6qtyJEkukKUwInrUK6+RDwivEiydptlThSnb3wFSK+GUP6JY7M3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH3PPF681F257FD.namprd11.prod.outlook.com (2603:10b6:518:1::d29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:57:44 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:57:44 +0000
Message-ID: <a062933c-9145-4055-be9c-ac73ff1f22de@intel.com>
Date: Tue, 14 Oct 2025 01:27:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com> <694610a1-6735-4875-978f-c626e9300050@intel.com>
 <94d97911-037c-4d9a-a3e4-9b631b30b9b8@intel.com> <aOlnRjVqIxCOV3oM@intel.com>
 <09b5c5c6-ddc7-4dbe-9cb9-b82d386e1138@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <09b5c5c6-ddc7-4dbe-9cb9-b82d386e1138@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0155.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH3PPF681F257FD:EE_
X-MS-Office365-Filtering-Correlation-Id: 519a4b0d-9008-4b25-3c7a-08de0a92c651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVAvRmdndk15RERiZ3pId3RqcHJiRlZGTTl3SjlsdEY3NmUydGVNdXJBdDRj?=
 =?utf-8?B?TnhCMVdReCtSWnhiV0Mzd250QUZtdGlDTHhnVTN6QnNoa1J1eXBXcGdLRkRX?=
 =?utf-8?B?WWZkU1o1NGNZaXB6bEw2NEVhcmFOSjIxU1lJWXYrZm5TaWhNM0cyS2NSKzV1?=
 =?utf-8?B?Q1dIS3pYcjFwQTA5Y1JDc2FHSTVpSGszczNERkVTVFlWdXRNZlFZWE5zaGdR?=
 =?utf-8?B?UE01Q1RBaFRRZTJiT1ArS3RjbnE1TGdGYm5PQVN4dnVMdWE4Ums1K1Q4OHlM?=
 =?utf-8?B?czFsZEZYWDNtQ3lnMHI2SHdQRHhuL3I3RlZlRVBFbW4zT0t5S0dzL0RlVFlH?=
 =?utf-8?B?MitaWXd1aWg3emhtS0VVTG9aUmYvMXk3Vm5TbHJ6OW5ZUHYzL1VkZGJLQ0c0?=
 =?utf-8?B?THR1VXVKYkdMN3h1YVpQUVNueWV2RHR5VGdiYk1PSStkTGNGSHNjcUE5WndD?=
 =?utf-8?B?Y29objZ6RFJFS1FGV2NsVkwyZWNHN2RsMzZhR1hBNmI0bVV6SWVlUlN2Ymda?=
 =?utf-8?B?Z3crY0l1RFI0dWIra0ppamF5eTBaMFFtMExaSzZkYWl2b0lZbGQ1ZTMzL2tC?=
 =?utf-8?B?MUVQWGpsR2U4TkxHUzRDUFNlaEhvOFhaR2V1eHFFNG5kT0lqMzZCQ1V2SklL?=
 =?utf-8?B?d24yRXZVaTNFQ1RaUVlHNXFjMXh3SjVMa0x1VHJERUtGY1VaL0pBaGpYTnRM?=
 =?utf-8?B?bmRNbTZxOWZHaXNiN3J2L3prdGR0MFo4MGlWcW93YjN2eDBBZWQ5OGdyaXFh?=
 =?utf-8?B?ZHJWT0l0K1IveE1Db1owdkFvYkQyclpUZUpieXRDN3c2Y2xEM0pIZGl2UWs1?=
 =?utf-8?B?eU41Mkx6RjRGVjE3b0tyWlRmRjhPa0JaUFp3K1V6L21tclZhS1BaTHp4V1NZ?=
 =?utf-8?B?QThPUG1KZ2s4WUZGQ205OTd4VFAxOVUydGFhT3F6dS82NmJ1eXE3b1FxSmNV?=
 =?utf-8?B?MXZ2Wk5GdWpzTXdVbnpyMTRLSTkrQVRLbWJaK0xYS1ZOL0lqL3pabnIrNFRK?=
 =?utf-8?B?eWtUYlgrZ3pIZHZJR0s5MW5KQWVmWmJ1MklQRmZzWndyeUFjdTBYNGhtSy96?=
 =?utf-8?B?azhJRldQaXd2SkFOZmxaZk9MRlFHWWkvRU5CdWE0UHNud2V6S0Z2ejR1MjZM?=
 =?utf-8?B?UklRUHcwZ2Q4TmZlT1pkYTdIOWdSQUkwN0xTeUpuWWVwaXpWUUd5cE81Y21j?=
 =?utf-8?B?VzRKdmJNbk5DdTByMFZsRmcwWkM0Q2xMSmJMNmExeFUwYlVmdFp0TEsyak9k?=
 =?utf-8?B?cjl6ZmRxU29zZHgvTEdEYkF2Y1paWHdXeTFHdldhOVFNNDJScWNTZHB4Mjlt?=
 =?utf-8?B?SWhZQTRyZmFCTyt1VS9ZcHpPZHlJd2xCakp4M0Exd0dHZjFEQ1JTOTA3SlhB?=
 =?utf-8?B?UG8yczVsVXY5K1Bxd2FRUGkzNUVycUtzdk5wSitVR2FQS213UHpFcVlrTnc0?=
 =?utf-8?B?QzBsa2V6YnZ1OUdpOEJuYjBmQks4MXlGSzArK3pBNHovY29RdXdMYjZOOEds?=
 =?utf-8?B?Mk1kSmszbXRYVHE1cGhiVDBYbjZBVElaYVNmTUhwdmdOZFBONU4wTUlkSWk4?=
 =?utf-8?B?VFVJK0pNYTdtM2FjY2xkeWtqVjh4V0ZvVGlKQy9Ba09GUlQzdVFteDNSSW5z?=
 =?utf-8?B?aFAvcXhlRVd5ZEt0dk13akJITWlnc1I4UW41cjd2VHB6bkRRYkdtMHFzT0Np?=
 =?utf-8?B?VU5GQkxmdE53dHdCR3Y5MjJ0dFJWbjRYV291TUV0TjYxT0Q1K29FaDloNE92?=
 =?utf-8?B?dFJLWmRaK3dkdG82elZCRndQSXN5QjRnQXdvS2lJbTBYVlZPMXV4WUFBa0NF?=
 =?utf-8?B?NkhOS3R1WTM2bnhnOHV6Mlc5eE03dk1kSUF6ODJwTlFWc0dyQkxvVWdZRXQr?=
 =?utf-8?B?Q21xQjR6bmFlUWFtdkx6UzllS3VVRDdrNSt2YXg3YzEvdHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1ZNUY4UlphdHQ2QVRvV0ZhSmVRUkV0V3kzeXVRWjJvOUpMYzFOYjR6V2t2?=
 =?utf-8?B?U2lMOXJhSzZ4MzBQcER5aldZWkUxL29kdG1WQXBiQkVRQUtHdkt6L0RQN1Jo?=
 =?utf-8?B?UE9jdUJtQk03VnpqWHdmeHZqTkVmRUVpYk8zQ0V0LzJsZDM4aU5hWnExSHd4?=
 =?utf-8?B?S1c4V3RGZU9HaVJxTVlQVmFYendGVGtyT2l5dllRSWlqaFI2WUE5eDRnQ2N0?=
 =?utf-8?B?blBkNW5LNmo4a0RrRDRMYlI3RTJVR0JJRE1ieGZhV3dGQVpyNWZUS0tqQnpk?=
 =?utf-8?B?aHRYQ1htd2R2YTdzVGNsczhVRHB0Y1NkUmpYby9sdUgrekk2UVFoS25VbUhE?=
 =?utf-8?B?cjc2RitpclJqMlRiUTNiSFpILzJhbHRrNVQ4a0F1ZzZvbjVjdzZwazAwcTN1?=
 =?utf-8?B?SmpiU3FEeU1YZ28xU21qRU9FNjFqZ21Jcm1iTmV4K05aSFRyQXBrUEU0bFB6?=
 =?utf-8?B?Q29zOHp2c2FJZHZxZkJCcDQ1N2F6dk5NR0pPeUdUYWFUV0NnM3JOUXJ5bE9I?=
 =?utf-8?B?bGowdEpoNm1GcVNJL0hUN3lhTGFaZzkvN3FSQlh4bkQ1VHAxOHJ4SXpVMnlF?=
 =?utf-8?B?WGNWNzZjR0JxaTNEUzZmcVkyTmVUWk83WVBIVTgwTThUc09LaGpaUmpuMzJz?=
 =?utf-8?B?K1AzVWdpWGxlTVh0ZE5TbHE2bUpQQUFvQjd2ZkxCOVI0UG9UNGw2SHZ4VkJC?=
 =?utf-8?B?TmZKU1ZvNzJiWDBwUGlFbWVpUlJRY2UwS0pha3p4Uml2OXJ4OS91RTFGUzhH?=
 =?utf-8?B?dnIvQSsveFdOV1VqdUcwSkppTmYrOXhOYjVzY3ZmZWUvdDIyOThGbjN2RDMw?=
 =?utf-8?B?V0FXaEo1TDFZTmhXU3RZelNyT00vUzcySHF2ekxGMUluV2pZSVNyeWRJUXJ1?=
 =?utf-8?B?NWtWeGM1ek9HQ1M0Sm5tQlI3cU5CNm14U1JoYnlFSDVYZUMwbDdFOCthS2Vj?=
 =?utf-8?B?TFFRLzJBL3VaZWpEMFdIMlZOOG9JWFluQUQxcjdpVWlKaUNNVU9WMDJuWWhG?=
 =?utf-8?B?eGlXakxLYXpEZ3ZHbHY3OFZQVkl3LzlTc3RkbXhTK3NidW15OTJXL2g2elVI?=
 =?utf-8?B?cWUxc1VCbkFKNGdpSXE4elJubDJ2MnNWTkluR0I5bTkxaWpyelFGZ3FxWFB4?=
 =?utf-8?B?ai82KzZ0eDlHQWY5UWxXTEFveHF4S0dxeDR6N1JZbWhDY0V0c2dpZG43Z2Ex?=
 =?utf-8?B?dlBUaGpXZVJwcmdSRGs2TnhrQ1ZKUDRNSFlISXdVenQrQ0YzUy8rZllTYlZu?=
 =?utf-8?B?THlaYmFxL0wvY2x6V0VCY2tlUmxkRktObklUYmkzTnJMcXVDT1NFWU8xbnVa?=
 =?utf-8?B?OXpvczNncXU5RGlXbDBMZ0NhV0FyS1crK3FEYnZkaVR5UU9ha3ljYkt5VUln?=
 =?utf-8?B?dHcvRXRoOE5xTkowS1dwc1VlRUR3SkNlQTZ6SU9lVzlPWnkwL0V1dUF6ZEw3?=
 =?utf-8?B?QUh5QjhodHVOVWZ2YnN1bTVFeXI0YmZ6bFJxRjBOekxmayswdG5BYXFrN1pw?=
 =?utf-8?B?RHJpc1dBTjNNQjdieVdmOTIrVWM0bVI0eWhaQmppY2NqOHhXMUtGRDE3WCti?=
 =?utf-8?B?YnkwR21JRG9UZEhjSk80L1RXRjJaU25OdDNEQkhjM0lDWi9hYjZpSzhFY05U?=
 =?utf-8?B?TlZVbzVSbW5RcTM1TXh4R05QL0FiV3RrV0VxS3JTMFJyemgwREpTQXRXelY1?=
 =?utf-8?B?SVhhcEN4QVlUUmlNc2tNUmIycnVmU01sR0p6cHlHMkZtMG44Q0J3Wloxanlp?=
 =?utf-8?B?YTJzM0lGTkN0VnI5K0RYajZ4bDRYbG1yWi9xZVg5VTNEVVpyT3ErRXU4dTA0?=
 =?utf-8?B?KzJXeDZqcitXWDFTVDNUTEFWZmMvNFllU3Voc0dJRDBlbE0zYjFDSVFNbzVh?=
 =?utf-8?B?eWh3dHI3Zmd1a2hERkFKNXhybndVdDYzUDIvSjd4N2YzNkNvSUU4VWwzV2Nj?=
 =?utf-8?B?V1NYeTdYcnpLZ0owZWJ3RkdTV3plcmpkVkxQblRGZDZybmpXNVNGRDlwbEkv?=
 =?utf-8?B?Ujh5TUc3d0NVN0ZRQnRzZTR3VE5QOFVPemd2ai9RYTlPSGQvS1dBNHpyMmxW?=
 =?utf-8?B?aVNZSENoMDRINi9SRHE3dmw3ZDFwRVQ2ZUlyN2ZCRWtxcWpabEdOTHNNNFFP?=
 =?utf-8?Q?N1TFGKxL2KLN3wwn4kxuFlgmB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 519a4b0d-9008-4b25-3c7a-08de0a92c651
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:57:44.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1Y//aWnXTp+hgRgqlECVKZ0Sg2b4dgJS78wlZxD38SIt1Mh35Io8hCYXjI7PbPM1OsgFJjUAz3lwbCB6EkIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF681F257FD
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

Hi,

On 13-10-2025 11:14, Nilawar, Badal wrote:
>
> On 11-10-2025 01:36, Rodrigo Vivi wrote:
>> On Fri, Oct 10, 2025 at 10:29:10AM +0530, Nilawar, Badal wrote:
>>> On 10-10-2025 02:17, Belgaumkar, Vinay wrote:
>>>> On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
>>>>> On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
>>>>>> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call
>>>>>> to ensure
>>>>>> current RPe values are used when setting
>>>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
>>>>>>
>>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>> index 3c0feb50a1e2..ea1ff96bec32 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
>>>>>> *pc, u32 freq)
>>>>>>         * Our goal is to have the admin choices respected.
>>>>>>         */
>>>>>>        pc_action_set_param(pc, 
>>>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>>>>> -                freq < pc->rpe_freq);
>>>>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>>>>> I believe this is correct... But wondering if we should entirely
>>>>> kill the
>>>>> pc->rpe_freq ?!
>>>>>
>>>>> Vinay, thoughts?
>>>> Makes sense. No point caching something that can change based on 
>>>> thermal
>>>> conditions.
>>> Vinay,
>>>
>>> Consider a scenario where the user increases the minimum frequency,
>>> prompting RPE to adjust accordingly. If the user later lowers the 
>>> minimum
>>> frequency which will be below the RPE value, it will result in
>>> IGNORE_EFFICIENT_FREQUENCY being set permanently until the minimum 
>>> frequency
>>> is raised again above RPE. Is it valid behavior or am I missing 
>>> something?
>> This is the expected behavior and the reason for the flag.
>> Unless I'm misunderstanding your case here.
>>
>> The thing is that if we don't set this flag, GuC will always oscilate
>> between the RPe and Max... If user is manually request a min that
>> is lower then RPe, then it wants the range min-max, not rpe-max.
>
> Agree with this, but the e.g. I mentioned below, with that rpe will be 
> ignored permanently.
> Potentially unintentionally by someone unfamiliar with how rpe works. 
> And at some point of time
> rpe will be settled near min but will remain ignored.
>
>>
>> What I cannot remember by heart is why we cannot just set that as a 
>> policy.
>> Perhaps it is because if we do set that, we lose power savings.
>>
>> Also I can't remember why we don't set when user select a min > rpe.
>> Perhaps we do that to have a way to unset this without having to
>> introduce a separate file?!
>>
>> But what I can remember is that this patch here needs to pass the
>> igt/tests/xe_gt_freq cleanly. That is our API contract for the
>> freq management.
>
> Agree this needed to pass igt cleanly. I am not blocking this.
>
> Thanks,
> Badal
>
>>
>> I hope this is the case and that it was checked.
>>
>> Thanks,
>> Rodrigo.
>>
>>> e.g.
>>>
>>>     min  =  100  ign_rpe = OFF
>>>     min  =  200, rpe adjusted to 200+-y%, ign_rpe=OFF
>>>     min  = 100  which is < rpe , ign_rpe = ON
>>>
>>> Thanks,
>>> Badal
>>>
>>>> Thanks,
>>>>
>>>> Vinay.
A new series has been sent to address this change,
https://patchwork.freedesktop.org/series/155809/ .

Thanks,
Anirban
>>>>
>>>>>>          return pc_action_set_param(pc,
>>>>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>

