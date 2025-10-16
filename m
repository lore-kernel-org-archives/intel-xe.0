Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E229CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 11:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C6610E06F;
	Thu, 16 Oct 2025 11:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+5vhwKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0062610E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760615082; x=1792151082;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Is0zjktpM6I2u2814e1X4hDsetxmDRmIVo/pEHnE+eQ=;
 b=W+5vhwKWg1pPxSiog9Rb9NM9D3GaFJwU1q0CAuMUT7MB4YtFTAjk5XIu
 XMCGHVV7g1gg2t5I3V4qweF+wCRpMYlkk5opKLfVSR5JLfE8l3AxfdEZl
 GFOvKt//hwhRq4sCT9V6kvSHGvPO2YFeeaoCVC7hWUpn6TjAwgVcvuHJ0
 cWAC51R6XBzY6ac/ZQzangfWx/ZjkuDujrTU/dAvadw4mKlpaQR+FgI6n
 uvD6Cm1hd/e4fXSA02tef7yc5IqrlCYKjFl91E3lIK/NbTlv5vhZ/MJ8N
 0A2cESITWW+3JPMRSSYVmS/YYR8oqv9U6qdxlnzeRjtciFdfYf2KH1N0g Q==;
X-CSE-ConnectionGUID: 7X1MYXy+TqiJcqF+SX8frg==
X-CSE-MsgGUID: dq4keyyCSrGU855wcz6VeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66453257"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66453257"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:44:42 -0700
X-CSE-ConnectionGUID: bOq7UXxZTE+nAuG9DZojKA==
X-CSE-MsgGUID: VTNWyIeWR2SuMI36KQPvwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="219597275"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:44:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:44:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 04:44:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1kosZa82QMc/sefgBzSA9/suMCJHyVCLSDzur/3lc84tTJxfCU8yM5giOKeU1YBiSAMLdI0QNPyCp1G84NlwppBK6nM4quxedyW/KqqNzfAzQvsFA8mSVe4jWzLXasc81DgGRx2HlBvK8n2FE8VoeDxJqJfvc98m13Jt8bDdjg0uNGCbvVQAVfs6Ui8EifGAc7D/1zZnlzAfldO3HdahaRaZHqyRLvfd92mXyg0RFC9CuMkU01v1D+MEOkWG5jOHiyZFjNYYoYxyDxVRkUUqlr3RXdLetI8PxGwOMGgM7ajnJg6eZcX6d0HrGdh94CDQOtX3Nsddb1TMiY1K8ggCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OClLUoQCdmzNkbEOhdqlfGOjawoRv8IRCX2YSjyXXw4=;
 b=RenXx43fD9KVwPqImMFva0qW2jNY+j8rQ5eagJoiN6RrUVtiLnSmiVOZv56ppptz9ZbvvzdVUeVkjOOwsPkxSK2hcWoWoIY4PDH7bnFyLiN2/gQ7LzdFfeAr9EbMHoRp8/3+ltW6Tq58NU9Y7xaSTt/xRvXdHC7DcjnaIxF79bSfk0D9coDKONxgMAO3SYZF0YrKYnKP35p+qLTxp/9j27BOeOEE8shB48AZzDfOnOszEqTd3STpJp/g68ceDZrxtliHe6hUmrllO9tA1L/bl8054Lc7hvVl/tNxEyhvWUU2ouihYzLJmOws8Bn9lxJVG5tKUDNk6TQHq2r9VUn/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM3PPFA4B6D88E3.namprd11.prod.outlook.com (2603:10b6:f:fc00::f41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:44:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 11:44:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015-xe3p-v2-16-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-16-b9189b3056a2@intel.com>
Subject: Re: [PATCH v2 16/22] drm/xe/xe3p_xpc: Add MCR steering
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Oct 2025 08:44:34 -0300
Message-ID: <176061507440.3168.6260974313214537346@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM3PPFA4B6D88E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b41cee-255c-415a-3124-08de0ca9634e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEZqckNTOHVrcC9tdy82djNuZXZ5eVlyTWo2R3c0VE85NjBOZ2orbWlTRDFT?=
 =?utf-8?B?VU5nWWgyUjFPVkdEd2c5cVE4L0diU1RmcEZjaEZRdU5JTGdTRi9oYlN2ZC85?=
 =?utf-8?B?bEJuSXBYUDVWSzRyRCthb2Y3YUtkVE80VjRMWUJvYUFNTyt3UURCaENhSk93?=
 =?utf-8?B?OFhJWngveFlFTm1KWFNVSi9JbXJMWVYxRk5GakhqcTlLeEhhckNxdFV2dE1u?=
 =?utf-8?B?YkxJTjREUjRIREdkNHRWQVJoRG9ERXdSU3VTbG9DRU82RjNuaGhKVFpKdGRm?=
 =?utf-8?B?MUJoUkVkbnhzRzNHOEJObXVML0tLTkw2dG51clFTb0pnMlMvMjQ4TEdyaTdz?=
 =?utf-8?B?TVVQL3lwT0NKZE5GR2RDL1NoU1VvUUhxNnhlZVdvREtQVStKZ1hCVDhZUFRn?=
 =?utf-8?B?eGxqQWk5UEtGb24wcysvNFZvdjkybEI3blRuQlU2bEUwMGE5cWZLbmdGWERI?=
 =?utf-8?B?USswWGJ5MkhiZ3l6d3ozMFc5cDZBaXpqMy9QL3ZvMnhuYk9UMmdLQUwwZUtS?=
 =?utf-8?B?OEt6NnpmSUMrdmNWQzV2d21UcGFEckhyUkpFd1RhSU4wblZyeEkwdXJibTNQ?=
 =?utf-8?B?NmRHM2g4Nk5mdjFEb3U5NGxaUHdjNnF4dGJPREJUdW1OcTVPRUw5aUNQQm5s?=
 =?utf-8?B?T25SRjRtK2ZybVB0RFplNkRYbzh4enZyWmR6aHBCalRKSURNUndoc2VuSmZX?=
 =?utf-8?B?ZWM4RUtoenhiOW9xaWQrNXJSZ0dzSTg1WlFNQWc5SGlmT2ZyNENRVzE2enUz?=
 =?utf-8?B?dm1sSE82V3FKZHRxdjZoTFg5d0JqcEFpMmpWeVBLSnphMGRBZDg5cDNubDJH?=
 =?utf-8?B?b0hyN0J2QVVxT3hEUnRBbFh6V0R2eDJxRUJXRFRYUUdrS0M5SVpMd0M0YkZs?=
 =?utf-8?B?d3VFMmpCQmxWY1ZEaUNRbFJXREhRaUhEQkhNdVNXMEd4VGNLa1pqWXdhZ2hN?=
 =?utf-8?B?S3lRcS9MaHdsekI0cTl0aEl4ZkJlTlMvdk5MQ3NLbFJYWUlGQS9YNjMvVU9H?=
 =?utf-8?B?eE5xN1RDUVBvaWRXY1BLbk5xL2pOeXYvUDU1WjhHVmR1UGtrZm4wZGxQZGky?=
 =?utf-8?B?UmdPbStjZmRPZjRuSWdtMHIwZXliRHhGZHNjN0llanJrQ2dzZ3I5S0k2SVMv?=
 =?utf-8?B?UlkrQiszWlQrRDdFMEZZT3RYTHVFczdZbXJhVCtkenhSbng3YnZSMVFZUHUx?=
 =?utf-8?B?Y25xcWpRQ2c5VCtBOHhURG12Uy93elBBZ2gweTJNYlRSK1E5VkdzS0hLaFZ4?=
 =?utf-8?B?ZnlDdTFGU3NMUkdJaDl4WU1EaFhhNjg3RC9aQlJRRzh4TGtvVmZKOGFPOFNx?=
 =?utf-8?B?U25SZmx2a3VPUmIvMXNReStoeWlzL05DNmJIOEt4NVJqV3lWdUVkc090VDdJ?=
 =?utf-8?B?UVNlMEZMQkUxYWl3YlNHVmVpQ1RvcEFRcml6N0VFZGNhWlVnQXg1dFh0YTI3?=
 =?utf-8?B?Z3BTbEVCazJIZUNvUVlYaXU1a1RUUnhKUlJJY09mRE9KUmplczVpemlmTFQ1?=
 =?utf-8?B?b2lzZ3BTeTl4bUJPSWJjd1BjN0Qyc0tYaUFXSTRUaTlIa1drcmFwbVRxcVo2?=
 =?utf-8?B?TWo1MmVjZWNRaTZBN1dNa1hKS3hTblFVOGNNdGJTeitpOS84SFZnVEU0cmxX?=
 =?utf-8?B?S216QUd0Z25wcGk1b3Q2WG1Yb1VkdEQ5eGdmL3hRdEQ0SWFURy93OUE2eWRD?=
 =?utf-8?B?R0NpZG43TDhmalZaME9ZZ2VRMjVoc2JQekpZaDFyTTdJMDNrdXlIUTBhZm1K?=
 =?utf-8?B?NERhbEdmK3NrVldxMnZ1NFM1RlhQK3U3RUxHRFBwU2VBRk1tOE1mRWZXS3RN?=
 =?utf-8?B?Q1NYanlYYlF4Y2lIalFwanpUc2tyNThqTkpUK3ZRUG1hcnVIV3ZuWW9kTlky?=
 =?utf-8?B?ZGtGZ0VMQjhrNUMzMnFkZXRPbVROZGtKNnUyZTlLZ2IyNFh3NWNuUEQ4T0ND?=
 =?utf-8?Q?NHD+uPbQ+als8bl9niq7p9i556ZaAB9i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czU5R1FObXpYV2FTVlMzeVRLWFlHRTQ0dzdxWHFvZzNXWFNJLzBZMC90OXhC?=
 =?utf-8?B?c25Hd1JYZk9iZ1VtOXdzczQ3aG5iRWtWcWxsc0Y1QnRnKzk5L3lwbTI1R0Y4?=
 =?utf-8?B?MmIwL3pBeVAwT0xaNmRRT1Q4aXhBNlkrUmxLUnIxY05SYmxkQVcwaUNWZkIx?=
 =?utf-8?B?a2xjMTdaOHc5QnVmTWJhSTlINVVtTzRta3huVFUyNU03K0lBQVNzcm9mbkRF?=
 =?utf-8?B?QzRKNWs1UWtKQ3BLcWlyeTFNTDczSysvWE9JZWhwamVkV3NjODVrVkNTYVla?=
 =?utf-8?B?ZkpKR0tuTzZxMU9lY0dZUkNTaWRVL2tsVmtUckY4cmFhSHFpQWRHVXNKazdW?=
 =?utf-8?B?emtqTVJNMkhmcGo5MXIyQWMyaG9KSDhlc1poOUdoUlRXUEE2bEtlTnVJYVBR?=
 =?utf-8?B?TVhjWTc0aXM0S1hHSjc5TjZibFFJRlZFa1Zmblk1UFBCV3pxL0VJMlBBbGRH?=
 =?utf-8?B?eCs5K0xEY3NDSzkwWU1ENG9vMklsUTFzZXBzYVlBcHdjQXFkTWRPTW95Nnpi?=
 =?utf-8?B?ZTMyQTFqTVc3OHZPT1NndzA2NG10dU5qWDBmSHZPZEhtb3RsRHJ4YVhIMnM5?=
 =?utf-8?B?WStzUDQwYzBaZ2s1Tjllc3AzWWMwMjBDZkVaTXN0Um8wU3VMbXh2TVRvWFFo?=
 =?utf-8?B?elBnVWJuVm1zc3JoMVludk9Ya0ZneWx2SmZMRVRnYm9uQU1qU2N5U0ZtdmJp?=
 =?utf-8?B?V3o2RVduWlNla2FYSWtDYitoOXJDVGdDV09BendGMGNTVVk2U3dUS01FcnhT?=
 =?utf-8?B?SVlTZ2QycW5CUlpVdm9qNHMrUnlKdkZvdmxsc0FFdU5VZ1lWWjl2SDRsUkFr?=
 =?utf-8?B?eDVMakl2ZFVnd21iYzFPVEJKZlA3aWdpUXJId3lqRUo4WUFvREZLRmFxRExD?=
 =?utf-8?B?NVQvRDBVa3Fja1hYSlI1VC9uUWNlY0NOSHlqSkdDZFN4YTRPTTBlazZzeGtr?=
 =?utf-8?B?WXZ5ZkNxdU1TQmdadnByQkg2dWJBTEN4bnN0QjVVU2UyckNCTDFXOU92K3h2?=
 =?utf-8?B?cE9OY0FLR0JjaG5nRDBKMlFyZ0hYbklDRVRxY3VKM0l4NitYWndzbEthYThz?=
 =?utf-8?B?aCttdC9uSXF4VDVVVnZaTXJyVEtzK3pianhSa2tlNWkyTWc3WkFUVHNhOWRt?=
 =?utf-8?B?VlZQeVNQbHY4dEdGcXNVYjVjM0pBNlNZdnc0ZFE5bGtNUEkvT1hFbEM3NGsv?=
 =?utf-8?B?TkNDN1pCZDhUUFdkbjAzT1c1by8vWnY2ZjNDZ3NWVTdCMkE3Q2hSWEwxUFp6?=
 =?utf-8?B?K0xXb2N0WU5xMVV3WS8ya3ZUYnREOE5YNG1iKzFVWWVscjF3eHhpSjNjTU8z?=
 =?utf-8?B?UWNaRjdSdWxsdmRUdkwwNWVUZWV1NXJpNlZLNk5kbWs2VWFpeldyRVUrdFdY?=
 =?utf-8?B?TlM5SXV4ck5OOVEvcU1sL0RPYk1zcysrNTJyRW5NVUx1eXZIdXNZcnJ0VE5x?=
 =?utf-8?B?aTVMWVBiaDZUdVdaOGM4amZCRTFoUVc1MzhYMFZBc09iM0M3ZWNzd0VxWW5y?=
 =?utf-8?B?Z1hzT1pBRHQxMm9pNEhWRG9EaGxZbFJjVkxqNmtSYVg1dFhLWG1MaVlLZjJM?=
 =?utf-8?B?aHBxNC9RTkxMb3pRMFZzc1Bud0YzV0ZsWng4Si85MlZqTU1pL1o4MGJnemhR?=
 =?utf-8?B?Nm56TmFkcnk4STlBNjIrZzN3WHd2eUxKVlMwZFdxeXNpSUEyMkUrb28xdXlN?=
 =?utf-8?B?eDM0USsxRE96NTBSQTVsWkw2dnZoc0VxNlRCLzBnOTIzRjd1MGNOMlZGbWlX?=
 =?utf-8?B?S0NZZUY2c2xsbkY4YnowN0dkaWtCR01TTFJrblFtVTFCaGZMMDRzRWZEdXhL?=
 =?utf-8?B?NW01L3FOdUg3MHFWdUFPRXVDYmpoeGJZVU4wSFVjWWpoZitvNlYyZVhXUE0v?=
 =?utf-8?B?eCtCdWFKNWpJQ3JlYXJvQWo1MldLQUZvL3NTL3BtTkdxelhra0ZGZnRRMHZT?=
 =?utf-8?B?S3RLbnQ0cWdRTzFYbi9LYnlVZXE3NHQvLzdkZGR5bFl1OTlxVEJVaGU5dFhM?=
 =?utf-8?B?a1loUE1JRU5LcEUrK3AyOTJmTkpJQ3hXNmNMV0tIWjlrazJVOG11UmJlRzJy?=
 =?utf-8?B?MURveG5KbGxlSWVEeHVzbTlKS2VTZVdjQlBTUDNubzJHN0RhS3g3TnNyOGN6?=
 =?utf-8?B?T2V4bHZQK3NyckR4cjc3UlM4c2ZXZG9wazlXM2J5VjBEKzZYZ09FRUcrczVF?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b41cee-255c-415a-3124-08de0ca9634e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:44:39.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqCMcCmruv9W9cSJZJjYufDgSGz8CqycQDf1c4Vt9Ru8O7/TU+rqHtQ3Sb7r1VoA2ljytxI2NY+JoimftAXjJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA4B6D88E3
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

Quoting Lucas De Marchi (2025-10-15 19:06:31-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Xe3p_XPC's steering has a few changes from Xe3.  Aside from
>minor changes to the XeCore (the new name for what used to be "DSS") and
>INSTANCE0 tables, different rules apply to different subranges of type
>"GAM."  Certain GAM subranges require steering to grp/instance (0,0)
>(and thus use the INSTANCE0 table), while others require special
>steering to (1,0) instead.  Similarly, there are multiple classes of
>"PSMI" steering, with some requiring steering to (0,0) while others
>require (19,0).
>
>FIXME: There's an "L3BANK" range listed in the bspec that needs
>clarification.

I think we also have a NODE range that is also missing termination
details.  I think a TODO/FIXME in the code for those two types of range
would help reminind ourselves about the need to complete the tables.

For the ranges added in this patch, I checked and they match the Bspec,
so:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
>Bspec: 74418
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_mcr.c   | 56 +++++++++++++++++++++++++++++++++++=
+++--
> drivers/gpu/drm/xe/xe_gt_types.h | 15 +++++++++++
> 2 files changed, 69 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr=
.c
>index e1a2b38fc2a86..e5506ec28e147 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -169,6 +169,15 @@ static const struct xe_mmio_range xelpg_dss_steering_=
table[] =3D {
>         {},
> };
>=20
>+static const struct xe_mmio_range xe3p_xpc_xecore_steering_table[] =3D {
>+        { 0x008140, 0x00817F },         /* SLICE, XeCore, SLICE */
>+        { 0x009480, 0x00955F },         /* SLICE, XeCore */
>+        { 0x00D800, 0x00D87F },                /* SLICE */
>+        { 0x00DC00, 0x00E9FF },         /* SLICE, rsvd, XeCore, rsvd, XeC=
ore, rsvd, XeCore */
>+        { 0x013000, 0x0135FF },         /* XeCore, SLICE */
>+        {},
>+};
>+
> static const struct xe_mmio_range xelpmp_oaddrm_steering_table[] =3D {
>         { 0x393200, 0x39323F },
>         { 0x393400, 0x3934FF },
>@@ -247,6 +256,30 @@ static const struct xe_mmio_range xe3lpm_instance0_st=
eering_table[] =3D {
>         {},
> };
>=20
>+/*
>+ * Different "GAM" ranges have different rules; GAMWKRS, STLB, and GAMREQ=
STRM
>+ * range subtypes need to be steered to (1,0), while all other GAM subtyp=
es
>+ * are steered to (0,0) and are included in the "INSTANCE0" table farther
>+ * down.
>+ */
>+static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] =3D =
{
>+        { 0x004000, 0x004AFF },                /* GAMREQSTRM, rsvd, STLB,=
 GAMWKRS, GAMREQSTRM */
>+        { 0x00F100, 0x00FFFF },                /* GAMWKRS */
>+        {},
>+};
>+
>+static const struct xe_mmio_range xe3p_xpc_psmi_grp19_steering_table[] =
=3D {
>+        { 0x00B500, 0x00B5FF },
>+        {},
>+};
>+
>+static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] =3D=
 {
>+        { 0x00B600, 0x00B6FF },                /* PSMI0 */
>+        { 0x00C800, 0x00CFFF },                /* GAMCTRL */
>+        { 0x00F000, 0x00F0FF },                /* GAMCTRL */
>+        {},
>+};
>+
> static void init_steering_l3bank(struct xe_gt *gt)
> {
>         struct xe_mmio *mmio =3D &gt->mmio;
>@@ -419,6 +452,18 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt=
)
>         gt->steering[SQIDI_PSMI].instance_target =3D select & 0x1;
> }
>=20
>+static void init_steering_psmi(struct xe_gt *gt)
>+{
>+        gt->steering[PSMI19].group_target =3D 19;
>+        gt->steering[PSMI19].instance_target =3D 0;
>+}
>+
>+static void init_steering_gam1(struct xe_gt *gt)
>+{
>+        gt->steering[GAM1].group_target =3D 1;
>+        gt->steering[GAM1].instance_target =3D 0;
>+}
>+
> static const struct {
>         const char *name;
>         void (*init)(struct xe_gt *gt);
>@@ -426,9 +471,11 @@ static const struct {
>         [L3BANK] =3D        { "L3BANK",        init_steering_l3bank },
>         [MSLICE] =3D        { "MSLICE",        init_steering_mslice },
>         [LNCF] =3D        { "LNCF",        NULL }, /* initialized by msli=
ce init */
>-        [DSS] =3D                { "DSS",        init_steering_dss },
>+        [DSS] =3D                { "DSS / XeCore", init_steering_dss },
>         [OADDRM] =3D        { "OADDRM / GPMXMT", init_steering_oaddrm },
>         [SQIDI_PSMI] =3D  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>+        [PSMI19] =3D        { "PSMI[19]",        init_steering_psmi },
>+        [GAM1] =3D        { "GAMWKRS / STLB / GAMREQSTRM", init_steering_=
gam1 },
>         [INSTANCE0] =3D        { "INSTANCE 0",        NULL },
>         [IMPLICIT_STEERING] =3D { "IMPLICIT", NULL },
> };
>@@ -467,7 +514,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>                         gt->steering[OADDRM].ranges =3D xelpmp_oaddrm_ste=
ering_table;
>                 }
>         } else {
>-                if (GRAPHICS_VER(xe) >=3D 20) {
>+                if (GRAPHICS_VERx100(xe) =3D=3D 3511) {
>+                        gt->steering[DSS].ranges =3D xe3p_xpc_xecore_stee=
ring_table;
>+                        gt->steering[GAM1].ranges =3D xe3p_xpc_gam_grp1_s=
teering_table;
>+                        gt->steering[INSTANCE0].ranges =3D xe3p_xpc_insta=
nce0_steering_table;
>+                        gt->steering[PSMI19].ranges =3D xe3p_xpc_psmi_grp=
19_steering_table;
>+                } else if (GRAPHICS_VER(xe) >=3D 20) {
>                         gt->steering[DSS].ranges =3D xe2lpg_dss_steering_=
table;
>                         gt->steering[SQIDI_PSMI].ranges =3D xe2lpg_sqidi_=
psmi_steering_table;
>                         gt->steering[INSTANCE0].ranges =3D xe2lpg_instanc=
e0_steering_table;
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_t=
ypes.h
>index 8b5f604d7883a..d93faa1eedef8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -72,6 +72,21 @@ enum xe_steering_type {
>         OADDRM,
>         SQIDI_PSMI,
>=20
>+        /*
>+         * The bspec lists multiple ranges as "PSMI," but the different
>+         * ranges with that label have different grpid steering values so=
 we
>+         * treat them independently in code.  Note that the ranges with g=
rpid=3D0
>+         * are included in the INSTANCE0 group above.
>+         */
>+        PSMI19,
>+
>+        /*
>+         * Although most GAM ranges must be steered to (0,0) and thus use=
 the
>+         * INSTANCE0 type farther down, some platforms have special rules
>+         * for specific subtypes that require steering to (1,0) instead.
>+         */
>+        GAM1,
>+
>         /*
>          * On some platforms there are multiple types of MCR registers th=
at
>          * will always return a non-terminated value at instance (0, 0). =
 We'll
>
>--=20
>2.51.0
>
