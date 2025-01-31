Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068F0C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 07:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A894410E18A;
	Fri, 31 Jan 2025 07:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7hkmuPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D910E18A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738306895; x=1769842895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LOv8XtRI4xmGEeNsHmY9ls4o2szB1Df/sIXETOi+SMc=;
 b=R7hkmuPF/DkJztVLePGG4xmV6RXLgpQnJOaItBKrG6v9JJDyCVgzAXbK
 NaftjG5GzqjkV5TmmLkeLjSgbvw7fuBedngnENk6rWLyxfzS4AGbr7qBH
 wpNow3TSd4mg0RVyNoRjTeZswKiuhImfrvpePrOZTRLLqT4RsJY2duLoP
 s88CX/rGgcn3eKGSxDaE/Z2Lw7uisOzarX2mQ0s55B85ymSPuHMCuHi1d
 oLm8kLBrDWVM/cRgpCETFT9DrjFrWg2b7oPPD60Z1P6uWbFLGPOMddz2n
 /mjkyF8t4OXhQDITusdJXXv4IrY6DMc5GIufza7X7alPPI/Ix8tIoE6qr g==;
X-CSE-ConnectionGUID: ebk8NkVKRzyEtLihijenOA==
X-CSE-MsgGUID: QpfD5wfWTt2keL8nfxXLJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42623238"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="42623238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 23:01:34 -0800
X-CSE-ConnectionGUID: ZdpBFYWLSq2xn8QpKIgNsA==
X-CSE-MsgGUID: Q4VxeVH5ToK9JbIW9J3fbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="109396867"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 23:01:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 23:01:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 23:01:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 23:01:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWC9f6KB/mTxCtneJzUFcom/vJh8uGbGQ+FyxZj1jZZyKXqssbCqmjFCKDoKTbsmjpgDfO3WBXPVKdMznku1tCpO6SWKn0kw8ct4yF7GffFkX+nm0bu2ekwj84+yBY3WKD60kBpkXpHXUieYYImf34ApgKo3X+Ty5UfuirX6+DRgVDu66P5btrTLA/ooPp12jJh+Mpv5aWhtfIZaTf4/k4ckP1zuhUGZ/avyPYB7Kq+0D1M82sSsyXtgiVZNxQu+LbWXtUJltFs3eQkCwkmClBj9EH7dUjgzN6iZqpflDBnN3lVewVTTg7W0nz+GwUvR8Abj0W3mziPjKDkR3R8ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbHn3cu8ZoKstm5iRmxKeJPxmIUVg+4bGmUF4YUEtuA=;
 b=SgnkfwBKGbxSAam6OXfWydiGuylNL1m9hnEM55KSKaFN3Ppeu6NYDpJ6vEH2Ji87yuW48hdC483XqbWvyKg3J1g6awDME05cYDOMTGv9UIdAbemHOaoAvwakmsnirO4zb4+QoyDB/+2DwSu8C3p3UXE0SdJPk7/lpOZnSUPoJqstNSnIeKhqgnaqSFlVMtY28gyJ3hkpxpdnIxayQPSJS7GHdhFho4zc+o2kotUA3Tg1kXPXk9Viw6mFhBaFBsNyQo3uUWNvzr7e0F6i9vamPnOHfBMe+PqQNE52zAxt4IhkpXzIcpJGrOyvgktbN4bfNl05qoEhI8udorJFUQT/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.17; Fri, 31 Jan 2025 07:01:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 07:01:13 +0000
Message-ID: <0959ad09-ee58-4e19-b553-6e74434ebd99@intel.com>
Date: Fri, 31 Jan 2025 12:31:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to
 v70.36.0
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-6-riana.tauro@intel.com>
 <04bca992-f221-443e-9da5-3fb235ad52ea@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <04bca992-f221-443e-9da5-3fb235ad52ea@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fccc64-ebbc-48f5-8aa6-08dd41c50cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFR1MFBnTEVQWWdLbURTMkxOUUhwKzRLNENZOCtPMzFFdGhOZGFWSGM5RTVR?=
 =?utf-8?B?K09pQ0FKYWtMbVVKb2JnNkQ2RWwzaXRzODVuUStPZHBVa01qR2hCQUtCaTVn?=
 =?utf-8?B?K09tdk4zcmgvdHAvYjJhWDhueTVnR0VZaXVXeFdWZWFGaWxhbE5FcjMzYWVP?=
 =?utf-8?B?NkNXRlpLVWdaSFBoNmRnRWllTTRoODJXcVh0YnB2bEpEMHlNYnN6OS85RUdT?=
 =?utf-8?B?a01BNzROT1YwNGZXZ2V6c2lSMnpnQlh2RkxxUXd2VVl5UVNQZHV6OW5PRFp5?=
 =?utf-8?B?blNweGJoNXA0VG05WDFSa2I0TGNHS2tWTlE0Ukg2eGdRN3d0QXZPRnJKZEdB?=
 =?utf-8?B?T0NPcEJIaTZ1MzdHZlBpV0pTYXJYVnM3MHlWejNlY3BmTHlOenEvMHc3Yml0?=
 =?utf-8?B?TCtIZ0dydkpSK1c3N1pnSXE2RGVCVndWdHlZcG9WWnE1VHNndEJ2K3loU3ZK?=
 =?utf-8?B?dXd5cWl6U2VrM2t5bnh5NUFncE5qdndkZG51UndORlBnSHJvOHFGdVBtdml0?=
 =?utf-8?B?Z1dDZlFVY2hqZVI0ZHZ6cmt1bXE5SHhYNXk1VXJlMG0wamxlM2VsT3dIcXd3?=
 =?utf-8?B?L0EwWHpPN2puQnhKajJEYXN2d3FFWjhxbi9tZVRENk56MlFJYmRQVmIvSFlN?=
 =?utf-8?B?SDM2ZU1seXN4SjY4djUxRW9oTlJFcklTa0NYaHJNNXJjQk9Jdmc4ancwcG5B?=
 =?utf-8?B?TXVwL0tuUnVERE8xd1RNNkZiNWxlK2k0R1NrVUQxWGxJVzZXTnVEWXlCRDBY?=
 =?utf-8?B?ako3STN3Vm5kN3loWCtYa1FqeVJibzFhVjZxMnVWY3pHbkdVZWxENGNJR3lF?=
 =?utf-8?B?VzlHUURTdDk4NDRydVR5K216TkY5aURYTUhQSTlFRi9YZWlhaWFKa0hTTURi?=
 =?utf-8?B?VGU4Mmk4R0R5a2ZUSlM5M2tzQjR1QXcrNzQ5OS8rWGdTN0VmaVdTaFJZd0ht?=
 =?utf-8?B?SmJydTNDN1l2NTRJQ0dhdnpZbXd4OGg4cTZGenZYUTNTbXp6N1VKK1pDYVp1?=
 =?utf-8?B?WVRKa1ROb0FFanJ4TlZwYnQ2M0gzU2lCV25WQ0wyRE5Jc1JsVXh0MzdJMzFv?=
 =?utf-8?B?Rk81RWxBS3c1cGxxWmFOUEhhbkc0ckpHc0dTdExrZk11NmxEUUJ3SWVVTkEx?=
 =?utf-8?B?QXZaZVhaUDVIVDhRK2F3dmdndWMwQm1tMDlKTHZGMlV1SU5DenJSd0RwTW8z?=
 =?utf-8?B?RngyNjQrSDk3ZXgvbEVpSDZRQ0RQdy9INTZzUFdwN0YzZkUvaU5kaXdXdVNT?=
 =?utf-8?B?SUdZODJ3TXhTbWRRT0NINFFOcGJTam0wN0lHRTZiSTVoWWJFdjVjK0FiUHI0?=
 =?utf-8?B?Tk9GK0xEa3lrangrRU02L1JwVjh0UEMyUnM1UnNtWUpTdlNxc3ZIeTFSVzJU?=
 =?utf-8?B?S1FtdHBZdEFTcU5BOXlxMVNLNTBHdjIvNk82aUtQYkE2cUpXQjlRL0JrcEhx?=
 =?utf-8?B?R0hQOG9icmllc3cwaldHYjFnYzc5OVg3Z1IwbXF5R3J5dnczRW56R25BWU5P?=
 =?utf-8?B?NThiS2h5VENMRUZHb0xTZHVrc3kyMW9vYWxsWFE3c2ZpTFBTRVh5TG90eTlN?=
 =?utf-8?B?NE9DRGN6MXF5b0c1YzZDTGdObmh0Q0RWOUltMTFCaTl1Qm9xcDhDbU9nQy9w?=
 =?utf-8?B?RlJmQ2prOFA4K3ZCUWQwQWJZT2JveTZpQUFYV2ZRM1FDTXBZVnFONG43QnNy?=
 =?utf-8?B?ZmpwNXlXOFFmWGNDNVM1VGppdGN5RHM5bFQ1SHNVTEJaNnpZUXpJcXIza0E5?=
 =?utf-8?B?dVVUZFFURTlxclpsWUdxMTBzYjhOR3FJSEdkMzhTL2dlZFBhcFJhVHBJTTEr?=
 =?utf-8?B?L3JydUJQSzN0T1B5QWVqQ1hKU2E1UkpNNmJIYjRtMEdVWFNFWjJDWFlOSG84?=
 =?utf-8?Q?1WgNWvVG+tfJ6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry9SWlg2NjgydGpla3FxTVhJME9FMmlnSzJxdTJ2bGRuYTY4c05idFI1SFZt?=
 =?utf-8?B?TERPdVY3WFlRSHFRQThIT3NZMGZlWlBweWhuMVA4Zjc3VVhlQjV3QytuKzZV?=
 =?utf-8?B?REJ5cG5FNnhjeEIxYXlmd0xoTlR6Z2U2Z2pZajh6UThJRjZYQmI5dVQyZytp?=
 =?utf-8?B?RmNZOTg3cEx1ZGRLZ2cxb0VkR1lqQmlQMmZwekVqS0V5TWFSVDdtZy9leGlj?=
 =?utf-8?B?YmlwOFZUdmQrL2dZbVMrQnV2VDRtMGZqRWU5SlJDR1hXc2lVa2xLaEJQTWl3?=
 =?utf-8?B?NmRBMGpzd25qK2tmSHRGeS9PODkzazd5bFJBSWhWams3SnRrQW5rZVVNZ0Vi?=
 =?utf-8?B?NkVCRnF1dnlKSzB4dTF3VzMra3dIbTNYZXBPMzRVK05zaFQ0WG91NVRJc3gw?=
 =?utf-8?B?WXV5ZGdIdktza21PSCs2dWRIdndVRkhJTkRuYkRXenkzZzBGZkVLZ1RGdzdx?=
 =?utf-8?B?M09WT1htTGs1V1RJYXgyNjFkcGRtUlB6aDIrVFkxdFdFVlVHUXAzM0x2dDQy?=
 =?utf-8?B?V0NQMDBDd0V3SC9KQTlBRzc0Z1Rpc1Z2MDl2U3UyZ2ZzcFZIM3VCRTBubVR1?=
 =?utf-8?B?bEtGeGozTlRSSzJwL2NUZmxnVGoyejZkVk90V29jejB6RHg5V1ZzcldnZEQ2?=
 =?utf-8?B?OFVVM1ZQaVQyQlJKUXZ6M0h6WGl5Um82WU1Ic3pJMzRTTU45enBtNkNFa2hR?=
 =?utf-8?B?UnlKSUMrSXZKMnJld21SSm03cEtKMTBoK1lMQ1lNQ0FSdlV6N0h0bVRUOWRr?=
 =?utf-8?B?UEh0OUxHNnh2bDU2akFzWnRTNDBKWVNObjN1dzRuZzlYMnM3akFTWHlyOUda?=
 =?utf-8?B?VVY2RVdMUmZSSUZEb1lFanpJSzlzQ3VXbG1rWkoybmFORzZiNjJWN0o1Wkp5?=
 =?utf-8?B?bVNuVkN1NVdyS0VmVXcyK0ZZUFR1bXdrYlNObjhjdXQ5YXBkMGdFQUM4VkUv?=
 =?utf-8?B?RlNVOXI2RENRaTNzdElORFZ5WDdVNFFxSDBpZFhoRllhbHFxT2VNMzNuQXph?=
 =?utf-8?B?M25tWXBvSG91Z3VxK2NnYW1vbHNIOFRXTVlXUGNDZkZPNWxibnlmZk9GYlFh?=
 =?utf-8?B?WVVRalB1ODlsUFl6UnRxZTl3eEFFMytHbWpqNVBkMWpkN2tsVU9lUWc2N0ow?=
 =?utf-8?B?eW5yTWwzZnBiRDR3YU01K0dZdTRNMWR0VjRRdGRQcDhXOS9TY2lDY01xdVY0?=
 =?utf-8?B?YlNUZm5yZDNTRFlCbHJTTExHOUVja2VYUXVzVjg1Qm9rbi94WmVaWjl4L3BO?=
 =?utf-8?B?NkJya0RNMlBnZ2JySVA1aDFRMFNNL2JCVGJwVmdaQjJVeDF5b0pGWllVc0dm?=
 =?utf-8?B?SFNCejVYcm1YNEZsVzhQTTE0OHNKUFhvckdhTkt6eXlFQkkvdTA2ZW9KV2xV?=
 =?utf-8?B?TUdNV2JJN0RiTmJmVUZKellyQ3JERXFaUkZNZElrUnRCRzZYZjZCQmpkR1hO?=
 =?utf-8?B?bEh0U1paSTJYWVcrSk5yUnNxWGQ5MGVRdVBMaWRwUWt1TXpuOFVEUGt5MUpr?=
 =?utf-8?B?ek5MVEZVUEtmcEpkd2xRTnJMVkpGaUdOdWZ4WU90SXh2M1pRZGNGZitHNWND?=
 =?utf-8?B?OEFUNW05TkZXZnRMaFpYVDFZMEVOZ2hadGhxU3lMUjBzdXczRVg1dmFQWC9E?=
 =?utf-8?B?dGFBOWpTWEV5eVBETFg2Mkc5SmZnVXd2YWJBYklCSTJnTEZQZkh4WmF3ekxK?=
 =?utf-8?B?NnRyZ09VTlFaQkV5cm54SCt1UkNuQnhRUzcxZTNoVnhYS2pwYjJuOHlnVEc0?=
 =?utf-8?B?WGpyUko4cEIwM3lhOEh3bEtWaXQrWFZwaW9xdmx2T2UxVjlvMitIRWIzRnV4?=
 =?utf-8?B?Y3o1MFBXU0twSGlkWVNNbEc2aGF5TDNiMDQxdVYxNjQyMWtkWmZPcjA3K21M?=
 =?utf-8?B?dkx1Q2lncURKRHlnYW9YWmZGUVlxM3ZCTWNSUFFLbmhrZzArc0lFMzdRK0pO?=
 =?utf-8?B?VnFpYnpOUG8zVDYxcUlCcHcyUXZYSGd3RDFpTFRJR0Q0K2hEVitIVFNiWVly?=
 =?utf-8?B?czgvTnhRalJJVFNuMnJnVk00MFFOZWsza2dHV1lKd2lDMXAvWFFTZ3lHTzJo?=
 =?utf-8?B?K0VGVFZEWnhFZzN2Tk1wOGlVMXY0TmZYTE5tYTkyY2gybk1iYTFQWkJZR2th?=
 =?utf-8?Q?Na6KrbSrPg+UAZblxiH1kRYwy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fccc64-ebbc-48f5-8aa6-08dd41c50cbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 07:01:13.8039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJkWqN00/RIohCuZgJOJt7Wqp7Iiw/76bIAkk8JXfTvrgFNW0ychtw/hcg/WWeUxtD/sHaUI8RToQ77VKwtmuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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

Hi John

On 1/31/2025 1:34 AM, John Harrison wrote:
> On 1/29/2025 02:16, Riana Tauro wrote:
>> The VF API version for this release is 1.17.1
>>
>> Bump the minimum required version to v70.36.0 to support
>> engine activity.
> We can only bump the minimum recommended version, not the required version.
I took the reference of 70.29.2 patch for this.
> 
>>
>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/ 
>> xe_uc_fw.c
>> index 18e06ee9e23f..d9ff285c5d1d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -108,17 +108,17 @@ struct fw_blobs_by_type {
>>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)            \
>>       fw_def(PANTHERLAKE,    mmp_ver(xe,    guc,    ptl,    70, 38, 
>> 1))    \
>> -    fw_def(BATTLEMAGE,    major_ver(xe,    guc,    bmg,    70, 29, 
>> 2))    \
>> -    fw_def(LUNARLAKE,    major_ver(xe,    guc,    lnl,    70, 29, 
>> 2))    \
>> -    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl,    70, 29, 
>> 2))    \
>> -    fw_def(PVC,        mmp_ver(xe,    guc,    pvc,    70, 29, 2))    \
>> -    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 29, 
>> 2))    \
>> -    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 29, 
>> 2))    \
>> -    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl,    70, 29, 
>> 2))    \
>> -    fw_def(ALDERLAKE_P,    major_ver(i915,    guc,    adlp,    70, 
>> 29, 2))    \
>> -    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl,    70, 29, 
>> 2))    \
>> -    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl,    70, 29, 
>> 2))    \
>> -    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 29, 2))
>> +    fw_def(BATTLEMAGE,    major_ver(xe,    guc,    bmg,    70, 36, 
>> 0))    \
>> +    fw_def(LUNARLAKE,    major_ver(xe,    guc,    lnl,    70, 36, 
>> 0))    \
>> +    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl,    70, 36, 
>> 0))    \
>> +    fw_def(PVC,        mmp_ver(xe,    guc,    pvc,    70, 36, 0))    \
>> +    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 36, 
>> 0))    \
>> +    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 36, 
>> 0))    \
>> +    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl,    70, 36, 
>> 0))    \
>> +    fw_def(ALDERLAKE_P,    major_ver(i915,    guc,    adlp,    70, 
>> 36, 0))    \
>> +    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl,    70, 36, 
>> 0))    \
>> +    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl,    70, 36, 
>> 0))    \
>> +    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 36, 0))
> This part is technically fine, but note that we have just discovered an 
> issue with recent GuC releases which means we need to wait for a bug fix 
> before updating.
I added this as per your suggestion in the last rev. Should i drop this 
from the series till the guc release with the bug fix comes in?
> 
> Also note that the purpose of the minor/patch version numbers in this 
> table is just to provide a notice to the user that they should update. 
> So after the update to 70.36.0, if a user boots a LNL with 70.29.2, they 
> will get a line in dmesg saying "please update". But the driver will 
> still load and run with no negative effects.
> 
>>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)        \
>>       fw_def(PANTHERLAKE,    mmp_ver(xe,    huc,        ptl, 10, 2, 
>> 1))    \
>> @@ -320,9 +320,9 @@ static int guc_read_css_info(struct xe_uc_fw 
>> *uc_fw, struct uc_css_header *css)
>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>> -    /* We don't support GuC releases older than 70.29.2 */
>> -    if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
>> -        xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer 
>> is required\n",
>> +    /* We don't support GuC releases older than 70.36.0 */
>> +    if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 36, 0)) {
>> +        xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.36.0 or newer 
>> is required\n",
> This is definitely not allowed.
> 
> Once a GuC has been released for a given platform, it must be supported 
> forever on that platform. Which means that LNL and BMG must forever be 
> able to run on 70.29.2.
> 
> If we really need to, we can add a per platform variant of this check 
> for new platforms. E.g. PTL must be at least 70.39.42 or whatever. But 
> we can't ever change the Xe global base line version. And there isn't 
> much point in adding a new platform baseline because we just don't push 
> the firmware upstream for new platforms until we are ready to do an 
> official release. So there simply aren't any other versions available to 
> warrant a baseline version check.
> 
> Rather than bumping the baseline here, individual features must check 
> for a suitable GuC version. Which is what you have in patch #3 - the 
> check for GUC_VER(1.14.1). That ensures that the new feature will not 
> try to run if a new enough GuC is not available on the user's system.

Sorry about that. I took the reference of the patch 70.29.2. Looks like 
that was intended for baseline update.

I will drop the baseline update.

Thanks
Riana
> 
> John.
> 
>>                 release->major, release->minor, release->patch);
>>           return -EINVAL;
>>       }
> 

