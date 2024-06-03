Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A35BC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 15:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7515010E15C;
	Mon,  3 Jun 2024 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYOY5Nvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B86910E110
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717429508; x=1748965508;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=6ywUPcto6EC3WLtAlVxuJwmgs4KBF1tfRu5qOfwIGp0=;
 b=mYOY5Nvnp7+11RQfn1J5tj0IO+rpoMmsIZgOdRE73uCGGJ3zBx1SBSMm
 6dU44sUKXjcbXyvlh49NHAo4avL8JQCovLhU+k258LH0Y3A6NNnd5UJsg
 eXwTzhh52YcM6bHF7mKsvtpmAGBpIBJQXpH6w2wXhV7FGhxeAPc05PvBs
 HYG1V7b/cyAuKLD/jMysMnzog+Mysg0c2ss192wU9W8yp3Dqqx132pZ9q
 gZG6atZ8P5fsheNk7YDhfyNecXchwgafHQq/c4UdUHAzCv33lKZo6fUFL
 VaNUtn0rL5vNY0nMVR2QuoGgRuksTJKVLowxBGW8BP3dCm/zz+NEXyEsN Q==;
X-CSE-ConnectionGUID: 12Ysq1aGS06zrgCB+yh09w==
X-CSE-MsgGUID: SHyxLwA/RCijCPqhJfit4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17755319"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17755319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 08:45:06 -0700
X-CSE-ConnectionGUID: /dDrgPZZRIKgBNIOuO+b6A==
X-CSE-MsgGUID: ppD44RrsTpWlzDFUGdJASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41831179"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 08:45:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:45:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:45:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 08:45:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 08:45:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf+NuXL0EoedqMB8OAyDN9b1wpMOtw6CxoVVHgnwn3LKu4W9ANruIhQD/rt1ljllWzPgYsAT5DJ4cqgDMroTxMxQ7vu8+/e2lPxw1Cj0uDsbLbUuPPLZqd2kowe0ZnaKDZAyhVmzkiCEZr+yhbObzItJeCSWoweCeFNxizjPIcYFAfi7v2ZN5PkECh6PVNo8tnZzsZtvJRWZCm8MDXcKRS6A2Y9aRdGIDJJnGWax5FhKZd5bCo6ziTXlyo3XemIbfgXKkN06p2d7UBtApkfHF8mo2+sKyaHuU3l0hCWO/w828mpZ+yF1LXlwsBjNe2UWpqGgOibksOZ0/DTmj0+osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ0Hkum4ord7yQmBrOMaO4QEztgR0Q3JP0sf29OqDKE=;
 b=FwtU0KYsdtaebQDqeDV+UaI08H24PmHgOVWlA4naDyAlEnlocx/gjjVs9BLt+I4zNroxps/wZaCypjorGRm7F0R4ynUGiv4YJppuzy3TNho/YQDwinEXa4Zdnpcs7PkOcgORuHOIdLmqJ2pqFAtKf3jqZOttemsLLGf70T0GcfRtxNirFvNx6dXykaHRJigzyYhnJ2rwAm6pgQF9l693JybvASkTcChZi6CmG5OkCCGSgp8xVbs/42U1Uz6fPUBNIr3Dop9SCZeyNfxQ8EmaNIVvGMCqb5xBaUbF2ZBBhx5jrUhyJwSwfcvkxd1xN+GZnv5Z9DKCOlnnHgY+/ubRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 15:45:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 15:45:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-7-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-7-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 6/6] drm/xe: Add reg read/write trace
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 3 Jun 2024 12:44:56 -0300
Message-ID: <171742949605.5170.15045658504264674665@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b3a725-51ac-4503-81c6-08dc83e42123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzlFbUpBRVVuVVJHbkN4RnN2WjBDSzYzQ1BxL2V0S1JkZWUzNkttUlN2NlFw?=
 =?utf-8?B?V3RZNk9RWVpFNkVLU3NlaFJDNytoSW1uNVR1N08rb1VmdXB6cHVIdHNURmU2?=
 =?utf-8?B?M2k5SFYvcG9SRXdmcHVhQjNBRmphVFlONDRyWTZERG91eFdKWG5YWndjczhl?=
 =?utf-8?B?N2tyQnEwZXpmN3d2YzRseUwvSHozOHNPdzV6OS93aHNNK0E4MjhkMG5pcVIw?=
 =?utf-8?B?Sk9NUU1WTXZSdUxRZXJ1TWZtbHYxU2hhb1hUREtUZTB4L01BTHFRc2VzYzdX?=
 =?utf-8?B?OGV4TmM5R096T2FvdGxRN3lKLzBSM3o5Y0NtUzRaMC9NOWpPM29tdU54SFBW?=
 =?utf-8?B?Q3gxUTAzZkpHOTRZMWZ3U0dBTTFrS2lPdW5kUkttRHIwa1F3R0hQSmU0eTBv?=
 =?utf-8?B?cjM5UDVydlgzaVpQaHA3cTNqVlVVVzRRdmhoN1F2YllTVmxEQWlHRWNYL2hu?=
 =?utf-8?B?WmpDS0FPcEc0RmJuZzB5NjRnb20zdHBIZ3VscTBjeHM4OVQ5YkpISnJHRlpn?=
 =?utf-8?B?Y3BUdGtEZXJmSndvS0xaY3I2TWZXSGZxeXNjeXpNUWp5cWNWMjM0S09vVG16?=
 =?utf-8?B?ZWczdFNpY0Zqc0MwNUlmK3BXR3QzdGJZWEVqcDRndElQamNQL3JERmcweUpR?=
 =?utf-8?B?MW5wZ1RPRkcvTU5nUkxFUTk3Nk8vSGtDc0NKSmo1eVpFQldvK2lGSEZmT1Na?=
 =?utf-8?B?eW1rQnI1M2lxc2JaNnhscTNmMDB2WS9ndDdqSGlOMWZ2c3E5ejdGVmJmbTc1?=
 =?utf-8?B?WlN6Q0VjcGIzOTgwblk4VVBRZmJnblJ5WFEyc1FBV0ZRUEx2K0srREdpTlBy?=
 =?utf-8?B?VjhWR09CS0FyaXRQRDh5KzMzenR0MmUwd2dYRHVCUWs1SktXVkgyWWN4VGVv?=
 =?utf-8?B?dERnYTBubzJ1L0dsclB5cHQrQUtjekxEY2JYNFdPZjFsY2czUW9zdWlQMVVZ?=
 =?utf-8?B?WWVlazB6MEpVY2FrVVZmSzNtUVpqclQzQ2NQSXdjaXdMaUdMVjFsZUViZTI2?=
 =?utf-8?B?TndTNXJpOXlvSjFjazg4R2Z6eTNqT2Z1ckhXbjVhV1EwWWM1OGFsaXNDZVdU?=
 =?utf-8?B?MnJ2Vi9rUEJyYlJ2cmdOZHo4S3ZabzBlZjNOSGlxS3dabGwzL0JPM2dTTVNH?=
 =?utf-8?B?ZWwrK2RXTzBHWk1wOGFLYlk1dzdGeEcyVkpjZm10bGU5YzU3U00vb3l2dThZ?=
 =?utf-8?B?b0dYVWZLVmdjTjFmYTRiVWVSUk9pK0xaQnVqeTgwWWVrVWRwTFBxSlRYQlFR?=
 =?utf-8?B?Wmg5ekRBd2dRQTZzYU9yUmF0ekNsUU1uYnZXV0lTeDNnWUFxWGNrSVBDeDBE?=
 =?utf-8?B?MHRnbmdsZlRMcFYzQlN6Z2RGYmcyUlYySVBuNHdOd2ZBTHFpVnFpQStZVEZp?=
 =?utf-8?B?Zm14YlJpZjBpeVE5TnpZc0J3amlXOHNpUGxqRDdBaTcyeHltQTQ4cGs4d21x?=
 =?utf-8?B?YkFnT2U2Zm5ndyt3MmljN2V6TnNJSUVrUFdkOExSWXVTR0ZNSkNFcXcvVHpu?=
 =?utf-8?B?OWkxVEhTRFhhazRxdU1qK1dzNW1Ld1VZcW5aNlNUWDh4NmVjUjA2NmdKbklj?=
 =?utf-8?B?YXA3Zld3NnUwVU1PQnBmbE9EMUNXVVdod0l4RnVhajY0Z2h4cDlXNGVXUnFH?=
 =?utf-8?B?YzF4QzkrcFR2N3VodnB4eDNtK3NKb2RYUGJxclMvbkp5WVhubnJSLzBXaEdj?=
 =?utf-8?B?bWNSNW42Ty81QndXV3cvYjBuM1pnMm9lT2dWNVdpZnE1VkQ1eEpYK1JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhybUxPeEEzRXJPbWhEQWNvMENzVHVkQ3lsT2trMXE5WWZESDN4R0VtVGdr?=
 =?utf-8?B?Ly9NSmt5Uy8yZG9BODFacmJ2b2ZnM1BHZjZ4TDRqT0RoYzlhYXZ3NUtwL20y?=
 =?utf-8?B?NG10VVpZOXpJZFhBeTZNeUs1dDRLamRzMU9VTDRsRFMyTlFNR2NVTjJYNzRt?=
 =?utf-8?B?NndPbDZidTcwNnkvMnNYY1gvOGVuR0NvWG5aVkloTEFZbWFmVHpFYk41eHI4?=
 =?utf-8?B?dHM5b1QrTUVqekxJWjM2QjQ5aVJlWmJUZFhyL25NeXJKNks2RVdGNmF3VHF3?=
 =?utf-8?B?K0RMODVNWjZOVnNmZWx2cktOOE5NbU9LT0FBamdOdGJoTVVPckZpcXpZaVVW?=
 =?utf-8?B?TW0xSDk2ajZqekpueHZvVm96UUt2SVJNNE1HRTM4QiswWHNkdjFod3lHN3dP?=
 =?utf-8?B?bG54VVcvOWhscVY4Z0lhVDNjL0pOS0hmNjJGeS8xNkR6a3ZlSjZuTmNTWmNY?=
 =?utf-8?B?N1FkUkZnbTlwT21LZHRzdG01ejVZT2c4YUtiY2F1TUJDamkvU2RTdk1WdXJT?=
 =?utf-8?B?d3YzMVJSbkNnVjBYVnlyelhIT0NYamVqRVpmKytkclQ2OFhvcFJqWUY3R1RM?=
 =?utf-8?B?WEpBNVR5NHNzSStmMHVXcW9MZm9XaHZxZWxrY282NjVySWFwNXdOVXZUeWgy?=
 =?utf-8?B?LytVc3l2WVcyUFJVYzZmV2F4aCs5WjFyYjVOVU92SXdEak9xQ3BvbnZEVDUr?=
 =?utf-8?B?aGtBN2ZWUHY0VzRNTFVCTWhBdEVrTVhKbVFVMm9yMStEVkVsZ1ppcnNGdXdX?=
 =?utf-8?B?Q0E4ZU9DdjcreEpvQ0ppRk5JMkpLRi8wWUZ2MXBTbng0ZFhEY2E4SGhpYmI0?=
 =?utf-8?B?QnRVeXBnL3NaZHpGK0c4ZVVCcHRNdEVXY0JFSWI4QlEwcUprRXBpNjFqWGdm?=
 =?utf-8?B?TGpjUm8ycG5meGROcG5neW40YlI3WUF6RlB3aENjK2QvN2RFU21NdzhmYWlm?=
 =?utf-8?B?c1YwbEdOMzM3TjA3dnRaYkQ4dmp1Uk1oYmFPZXo0NjBJRkJCSnVDTW5iYXE1?=
 =?utf-8?B?V1lzeXUxM2tsU0dsUHhIeWZTQzFWZFRqSGJab000VjRGWnRFU25aS1BtNHVP?=
 =?utf-8?B?ZXE0d0d3NzlURGh0czhRQWoyZm1nZ1BiNDZnSFhuTHptejRNVmNMdktESHdm?=
 =?utf-8?B?WDhsNmYwcEdMNHl1RHd4WWdYeHZ1R0VWMjFTeTFhWnplVkhSV1hEdW5rNGI1?=
 =?utf-8?B?M3ZCMFZId3N6aXh6OXhrelpTUGlUUXZ6YVBnVmtkWmMzWXhuaENSeGo1bUlB?=
 =?utf-8?B?ZCtIUktybDA1ZUVrdUlZZ0hOcGwvZlYwRHhkdDYzdzZkR3EvU0E0dmFwRlV5?=
 =?utf-8?B?M29MdjJJaVY0Zjg2TTRTRUJFMFdiY3d3bnVJSGNTbXFLZVRUWDBIQWNaVE9X?=
 =?utf-8?B?aWJWQitxR0RiTnBOZXF6SmFJdFQ4WVhLR0c5ZVF1SlJJcGFRTWNhdWVpWFF1?=
 =?utf-8?B?NFZDd0JQK2tLUzVyTzE4N0ZhcDNxUW56MTRWTzhmUWpVaDlHWFdTWS9sZzd0?=
 =?utf-8?B?SzBORjFiUG4wcFNFVmkxNGJEVzRpL2RQcW5GS2VOMzc0L3MxZUR5QmM0S2hq?=
 =?utf-8?B?b0ZKSkxkNzFtczRUMStKdW5leEt3U2l2OE5WWVA0YXBxSndIT2N5YmQ3QXIr?=
 =?utf-8?B?bk5CUHhIa2NXUFNzZVRLcmpjTThMWUpienpxRE4xbzNBdW04QnJiYUZVRTE0?=
 =?utf-8?B?Ny91OENWaFVHNklZYUJSaDYrOU9xZkZHU3lmZ2diZEI1dE81emxueGprczc2?=
 =?utf-8?B?UHJBVlN4QXRQQ3dUOGpVU2xMSHRraHdRWXdGYlZoWDMwUDAyNXBZWVM1Nldq?=
 =?utf-8?B?cENIVjR3UmQ3WjBTd0dKQkxaMVhibHVvUEs4cFJMOEwwUlB2VjMrazYxUHQ0?=
 =?utf-8?B?SHhpSk95K1phbERmU1IyNzN6YjcwU3Z2SUIzckJVL0NuYUpVTWJaNEJLYXJZ?=
 =?utf-8?B?eFJZQ2lGaE5LVHJ6MjNPSTJ3eWQvblJhbVppSjhWZ2ZuTTlNQUZITEpCa2xr?=
 =?utf-8?B?NmFaeUs3VTJybWQ0SkJ0NWVLV2ZVdjRkb1g3RFlQTUJKams0dXlZNEZkM0xm?=
 =?utf-8?B?ek5GdkljcHh2d1l6THIwT1g2aEpkcVBCNEJRNkNCbGZBcGh6bCtZdFNPWWdS?=
 =?utf-8?B?azQwbkQ1YXlMYmY0dmxTeXBCWDFkUTAzYm5laFl3Z0RqV01JNWZ5ckhLZ2xs?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b3a725-51ac-4503-81c6-08dc83e42123
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 15:45:01.5182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo3pS+JvmBAY1LEU/SlBJ1kgEMcW2YyaGE59oJfJUhmK1v8A8F4U99kJq6I3CBkvFIxJCvVEstepnDajJuD93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:13-03:00)
>This will help debug register read/writes and provides
>a way to trace all the mmio transactions.
>
>v2: Fix kunit error
>v3: Print devid to help in multi-gpu setup
>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c  | 22 ++++++++++++++++++----
> drivers/gpu/drm/xe/xe_trace.h | 30 ++++++++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 248e93ec6df7..a44baa349109 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -27,6 +27,7 @@
> #include "xe_module.h"
> #include "xe_sriov.h"
> #include "xe_tile.h"
>+#include "xe_trace.h"
>=20
> #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
> #define TILE_COUNT                REG_GENMASK(15, 8)
>@@ -455,16 +456,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg=
)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u8 val;
>=20
>-        return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        val =3D readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +=
 addr);
>+        trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val=
, sizeof(val), true);
>+
>+        return val;
> }
>=20
> u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u16 val;
>+
>+        val =3D readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +=
 addr);
>+        trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val=
, sizeof(val), true);
>=20
>-        return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        return val;
> }
>=20
> void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>@@ -472,6 +481,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg r=
eg, u32 val)
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>=20
>+        trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), true, addr, val,=
 sizeof(val), true);
>         writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + a=
ddr);
> }
>=20
>@@ -479,11 +489,15 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg r=
eg)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u32 val;
>=20
>         if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-                return xe_gt_sriov_vf_read32(gt, reg);
>+                val =3D xe_gt_sriov_vf_read32(gt, reg);
>+
>+        val =3D readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +=
 addr);

This readl() call needs to be inside an "else" statement, right?

>+        trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val=
, sizeof(val), true);
>=20
>-        return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        return val;
> }
>=20
> u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 41e0b3365876..d56e073560ee 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -342,6 +342,36 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
>              TP_ARGS(fence)
> );
>=20
>+TRACE_EVENT_CONDITION(xe_reg_rw,
>+        TP_PROTO(const char *devid, bool write, u32 reg, u64 val, int len=
, bool trace),
>+
>+        TP_ARGS(devid, write, reg, val, len, trace),
>+
>+        TP_CONDITION(trace),

Looks like trace is always true. Are there plans to have a false value?

--
Gustavo Sousa

>+
>+        TP_STRUCT__entry(
>+                __array(char, devid, 12)
>+                __field(u64, val)
>+                __field(u32, reg)
>+                __field(u16, write)
>+                __field(u16, len)
>+                ),
>+
>+        TP_fast_assign(
>+                memcpy(__entry->devid, devid, 12);
>+                __entry->val =3D (u64)val;
>+                __entry->reg =3D reg;
>+                __entry->write =3D write;
>+                __entry->len =3D len;
>+                ),
>+
>+        TP_printk("dev: %s: %s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)",
>+                  __entry->devid, __entry->write ? "write" : "read",
>+                  __entry->reg, __entry->len,
>+                  (u32)(__entry->val & 0xffffffff),
>+                  (u32)(__entry->val >> 32))
>+);
>+
> #endif
>=20
> /* This part must be outside protection */
>--=20
>2.34.1
>
