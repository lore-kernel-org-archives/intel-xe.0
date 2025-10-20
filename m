Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E982CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1587810E188;
	Mon, 20 Oct 2025 22:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmLPdQmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ACF10E188
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760998639; x=1792534639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=60KfFrb1M4F6/TE+3Un6tkEpif06B4xgQE18YJ/43lw=;
 b=cmLPdQmjYYtMqlUI00P9rk5BlWqkMqRNqRxfzr3UOMsT7tCIuUjdwIlM
 L0a/n5BaH5BWsVJRAhYNB8EL2XGYS0dSkQd6WJc0xXqQ99Sp5NbTlJ2NF
 kbjI0BQFGBC9CDt/nE/o49THE8XusyHAzFVXZOQSmStmJqN22d3KqEV1S
 +rsnM+wvxDUsJkX6X7EL4FnNDzaTtnDRAWCSV2R5tFNcRY/BhreaKBWTY
 cRNZn39J0J7VcHOcCSVVA25GgJwjk40p6XTV641IeIztSNwLcW64H/TQQ
 InWNfVOnhYgSCgW7TgsxsuXIgvUTyfwJ8kDSh3yYBfTTUb7vt0KIwzI93 A==;
X-CSE-ConnectionGUID: jtvBXOjqRhSO4cr/6R4+Wg==
X-CSE-MsgGUID: mBL/FoDEQB+FuwnJU8utaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62823975"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62823975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:17:19 -0700
X-CSE-ConnectionGUID: tVkm2mNfSIe+iAnU3xhPVw==
X-CSE-MsgGUID: mLtV7DCMTweYpQ1kZyueNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="188720349"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:17:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:17:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 15:17:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8DQPcO51u5BQIQsuoaGXvlyQLWrkZG+W3v0IhyK7K+sOUcQQhUj7g7hEa6PCCPvhYNXG4pIwvLzqJrAdAS355Qaw0i344hpKPCvIpcxx8r1oz7hgPj3rz44DRcuzoZ5rwGUaqc2XB/2HK20gnhgkwnQr+S+pmSW4mUqmj2qxrCyxqF0vZpCbW6GcNLHY5ihxeYi5DGsw6W7mUr1eqpnP3uGMVa/Zia+yRY9r9RdPqHHu1HSH+fXX3UFRVzEf0hd5b3wfoSMLTGCuQRXSfiXxZkL3Vv3dxuqOmDllh5FAhgGekRxeO1kTUAfhfDsLg+Z7REelxBPZrcTPfzxLJlsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/u27lpVVNVrZJQw+q6yiwJZbTmpxwBjl7GXsp5VtQs=;
 b=h7iLUU/NA2rnNbA2JIhiffJSonvT8ggNuLkegST/kPCMP8lyt3taS1FDPsiFWUnnm94d12mDNMTF6ABoZ1ibRn/Z7hyvR7zXYSggI4ikfYumbnaN45uw5/Qf3i+u/OYfZxTm9XNg0/EebJ4M7lZoULW9kt1zFI8e8lSURuZhacv7aRCDRMijbky/3etJJvDNgKj3O+RNgOYIhOuoYo4xiOJirYZ4T5ZbT3Yy73Lhivv/jKPfNIdW1RfFUKRs9vHVcXtWCFeEY8Rjq4qxrhqWJCq+o6jVB8kFXRP1S1Ab7+fiQ50OXsnS1ZxwX9yHv5zpkoHOqngWXu0RAunAyIuD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.15; Mon, 20 Oct 2025 22:17:09 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:17:09 +0000
Message-ID: <05e13fdb-cad6-43da-95e2-174ccc919833@intel.com>
Date: Tue, 21 Oct 2025 00:17:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251020205808.1187308-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::35) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdb83d9-880e-4275-369a-08de102668f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWN5WXJoVXBRTTdraWR0N0lhM3AzMEp4dU9pN0haSHkwWHNmdjU3ZW9reG9W?=
 =?utf-8?B?a0hMREZyODVUOElDVldPR0ErSFZUTTVxTjZ5ajNqcFFIcEtOSXJGRUh4UTFL?=
 =?utf-8?B?dFMrSUlOaCtwcGh2Rkk4b2xJblNCa1RCNWdoZUliVlpwSU9sRHlUekxWL0dY?=
 =?utf-8?B?VXl0K3UyZjJDQmJJcTdUcWIvWWJqcEJIVkZ4K3VVNGRNM0hFeW9nVWViaDNl?=
 =?utf-8?B?TEdrQjZ5a1RHQkpld3JmOFA0cmJxOFlvNXV0eTlVcDRPYVZUR054anNCNUpP?=
 =?utf-8?B?QkJtbGRaWWJ5TnU1bXFtUkM5bmE3Qnd4ek5pbGQ5UURtUVJZZ25NMWFVN0Nx?=
 =?utf-8?B?R25VWUxtRW5mMmhMSS9GYVl5bFo0NEFLeHJDTEdhMTFXT052N3QzZVdSR2FE?=
 =?utf-8?B?N1ZXVmhCbXVFNFJjT2ZSakZMYkE5RVpaVUM1NTYrNHgySXJHMHFybUt6U2N1?=
 =?utf-8?B?Sllmckp2bElZWG1PcE1Wa25vMlVyWWYrQ2padDU1bWlFUUk5VnBESURRVndm?=
 =?utf-8?B?M2RNQXJvcjlJR3JLZlJoeFZkZVhXQVdKMkllV0JDL2ZlSmxOaTBrcVFmQVVR?=
 =?utf-8?B?K0NPS3VmMDFXdmRUU25LSDNIZHpiTzlrVW9uQnp5bnBIQkYwc3pMOW45QVlC?=
 =?utf-8?B?NTJ0K0pGM3hJWnN2c2ZSNXZnNTZLVldxRkZGY3VDTjhicm5GUVNXWDBnS09s?=
 =?utf-8?B?ZjhkT25sQXBVTkNPZ2lBRjhpUkdoaHNGV1d2c3ZteFRONnZEQjVuK0ZNVDNt?=
 =?utf-8?B?T2hPZkNxbUdZYmxyUGRVN0UzQTFReUUydTJwNVZEMzdLdE5Qb3ptZUZ6U3Jo?=
 =?utf-8?B?UExqK1BFbFhNV2NOWWxpdHFXRkpWVzZtTWVrSGNXczNBcm9FVUlWOUJJckxJ?=
 =?utf-8?B?bHhpbU1pT3hEbEt1OEw5cDV5b0tEYmxiUEt1MVkzTGZ4VUJnNFo4SmsyM1Er?=
 =?utf-8?B?MUxTNWJFMXlmdFF3Zmh4eFZMS2F4WGVLVmpuNjZiUkNONmFjNGVoZVhwQVc4?=
 =?utf-8?B?R3o3aFc2cE1KdjQzWlFob2k2aEw2dEoraDdIRWFQS1JWNDcrbVF4SWNHVDdp?=
 =?utf-8?B?Y0Q0OTRTRTBObzM4OGlERkh3RmdKdmxnVE8xZmg5OTlUUTNnTEl0dFZVNUNs?=
 =?utf-8?B?ZEh3U2hnMVUvcE9qK1d1cFpxdDlXVmtuN1R0clhjQWNxZ1NpVzI2NE9pK3hw?=
 =?utf-8?B?a2RoeU9UZlBndTRmclRyVnRFNUxjNU5oenBDTHZGUE5nVEV1cC9RYjJyMkFm?=
 =?utf-8?B?UkNFZXkvOFpDeWUybHplR05wVGFGMm4vd3FoTUhiZmtVZlpvRHNBNXJKakZC?=
 =?utf-8?B?MlpnTmU0Sm5YMFR1cHZVdTJyNDlPNXZJVGh5SC9ESVF6QjFJUGdlcHdHQSto?=
 =?utf-8?B?NnRON1RYSkNSSHp3QVlnZjNrM2dKdnlJWUxOckxBZ1BXNkNqT0N2Yi9aS1Uz?=
 =?utf-8?B?TmRQQjB6Nkl2SnUwNXBxNDhpbHdGZEFnMXVrb2ZnWTJ4dThadlY2R1h4Lzhi?=
 =?utf-8?B?anFpeSt3eTBjQWQvWnNHd29Cc09La1hUOUhDRkVzKy8zRHc3dzN6NHRhMlJn?=
 =?utf-8?B?WFVxNHJZYzhidUVyUGR5ZUtCd0o5TVlVNHBHZXlHNzRzK1hLdTJvNUV1dXZ0?=
 =?utf-8?B?RjRQdGRpZDVod0w2R1NWeXo3T0NqeGNXa01sWitOanBRQUloenRCZXAyL1Fz?=
 =?utf-8?B?ektwZDZnV0FROWdNQ2hHL1ZXOXZSUnYxbzYwNmtOTjl6QzJkRDFyY0RlM2dX?=
 =?utf-8?B?c1l1OHZCeVU3Wk5UeW1lUXpyRFkwaEFFZEZvc3ZBSlRCL0xkTFRuWTBDSzdT?=
 =?utf-8?B?ZUg4Zmp3M2xPMnlVajFEc0hjeTJScDFCN3Iwd0c2c2YraXVPNDV1c0Q1cm9x?=
 =?utf-8?B?M3V5eno3RUp0cGV1ckdENGdOeU51UVYvMDZsNzJnWjRIbWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QStTWWJBTm1kRHpLM2tUTzlRVDI3blFDeGdiQnprQjRGVjRQSXhlSE1VVFg4?=
 =?utf-8?B?N3V6a2FxM1FiY3Q5UW5YWk5KVUtrakxvYlFoYzJ2Wjd4MEplS3Z4ZmN5cDA0?=
 =?utf-8?B?UkJESUVsaVc2UGh1VGVwdEowcXFiZVdOQXFsdG9nZ2Q0aGJWWEdRUFBIWk5I?=
 =?utf-8?B?aUQ0M2lRSXNMK0lUNisydXNnc2JaSUlmUHluWGxpZXd1NmNBUU52ZGxDZ0Q0?=
 =?utf-8?B?cHRWZjkxc1JGMnh5WndIK3QrNVZ0YUFlV3FZcnpSVFVDOXN1SVk0dEt1R3p2?=
 =?utf-8?B?ZHJxbjcrRkJ3a1VVTlVqTldrenN2bnVhUHRtNFJLRE5IQkJJdjcrWFVPRUhj?=
 =?utf-8?B?VXFqT2JlZlhTWXY1d2Z5aFBlSEdqZnVaY0tlQkQ1TUw1Z0M5OXg1SmNvK0xx?=
 =?utf-8?B?OHkvTEVhRW5kVVY4a0hrRXpMeGVweTdmQkkrekVNWHBYb0pJUy9lK1U5VFpE?=
 =?utf-8?B?RWJ5Y0RjUThkM0hrZllqamtyUnI1RTRhZnVvYndYWlFNYkcwNG0xYUdsaGxp?=
 =?utf-8?B?VXNuNE9pdXhZY3lRUTBrVElsRzk5U3AvcW1Ib09XK3VSRGxrRGhhWG14RDFq?=
 =?utf-8?B?YXppbVlja242NUpUZnNqTitQbWFRdzN3SVFnbHFBSzFDc0pIZm4yam5jdE9t?=
 =?utf-8?B?SDBEL2lBR08ySGZrZUsrRjNGcnY2M2tUUHdFaGVzQm8vV1N6SzFxQUExUWdr?=
 =?utf-8?B?ViszeUw3bThlbDlZNzNLc0FuOE1BWUd1N2NoMzRKSkJMQUVGV1NpR1FlaktS?=
 =?utf-8?B?OURKRExmTmNYdWxDMHdrSXVtcHYraitOdk9OREp6VHZRMVVqZHdvKzR2THg3?=
 =?utf-8?B?ZlF6TW45QXQvMU1wN2xib1BDUWFkK1VJQmUyRmFFUi9OdHNkZXNIbVFhMWNJ?=
 =?utf-8?B?czNkdU1CSmRMaFB5eW5WaVllWS8xazNRTGdFWVc5U2R4eHJGelEyMStxSzlV?=
 =?utf-8?B?UHVHUmw1eVpFYStnYU1CUzVRY1cxVG1VTUcvTWxPNUFGSGQ4VSt0RWhLKzZ3?=
 =?utf-8?B?MHN1ZHM4OGx4cW9vTS9GMHh0MjRDYUhTeDlZVkdVSUkzaVpIRzdLVVV4bkZj?=
 =?utf-8?B?VGJTb3UrVFRTR1ZDME9YNjBwMDZZaU9TUGlzN1NsQjgzSDBHVjUxUDEvY2sx?=
 =?utf-8?B?NEtTV09lSVhpdDh4clFVdHQrOXg2OUJEcW1nYVNZODJwd0R1emtRQ3dUUmg5?=
 =?utf-8?B?eCtKa1dUTjZrcGNwVy8rSEljVG0vazFoUDdZR3p0RXJKeFpJNjFPMGRBR0s3?=
 =?utf-8?B?OXo1cmdqTnRzWklNQzZvOHk4cEFMa25QNkd3ZkhaQXJJbUxlSlZxSWdKODlL?=
 =?utf-8?B?OU5XMGovL04yUmVJREJrUVlVMWdYZU9CZXREZFUyaStSUnRBdmdOUUEyQVd5?=
 =?utf-8?B?Tk1TSVJUSlo5eFRZaXNkZ2F0cUpwMmxnM0RlUUpjV01tUU5KaG53ZjR3MWJ0?=
 =?utf-8?B?cjU3RjlRNzc3TW54VjlnTjJPdU1oV1orU2NINFlqR2V3NEVpVzNTT0E3Yjkv?=
 =?utf-8?B?SC8zOVZKOXNJUHBxUUkzS1BEWTJON0NsYTVEQ2UvQ2JEVml1ejczRUcveXgw?=
 =?utf-8?B?TzB6ZS95SVAwWlRud2JmMHBYeEVnR3c0T01xUEZLOGduYzlWQlliNXZxbUZW?=
 =?utf-8?B?S29jQzFmZ0dFKytKQlEvZm1KL0pKU0p4MFcrSkpuVThrYXJQcm9ZcHQzMWF6?=
 =?utf-8?B?RW14bTBWeDFVMFZiQ1lpTGhEMlI2MlZQS0JVMFlZVnBVcEZCOTlBV0w0M2hr?=
 =?utf-8?B?SzRWZWJORDQ1b0RVNmY2amhjbzZlVU5DY3NoQUc5aGcyMVB2cUVVeVVrb3Fu?=
 =?utf-8?B?WjRUUFJheVIzamNrdFpjLy81VGJEMU1zNmJsVHZtVWs1UmNFMGxtdVh6cW0x?=
 =?utf-8?B?ZTlHNU1jY256UTlncXg4bmxGUEdvVzhRTHJKL0N0UU9ZZGVzQ0w1T2UxUE41?=
 =?utf-8?B?aXBKYW5TWVZyck9NRndaWDN5NlppUVlESm4xNVBWNDAvTDJFZWs2KzdWRTIv?=
 =?utf-8?B?dHNPL3VZVmFZQ2lvYzlvQUpTekVuSGdNdXROK2I3T21ZM0ZvcUZpOW95cnE3?=
 =?utf-8?B?c21XeTJEbW9XMEt1cEYvUUpsOEhIR1JhZU1mc3hPQmo1YjJJSFpJQjM0TWxZ?=
 =?utf-8?B?MEJONmtxazZZUUowTWxESmxtUCs4cGZ1UjlhZlpqRERnbzkzTGU0dFlKQ0FH?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdb83d9-880e-4275-369a-08de102668f7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:17:09.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxFAWCgdNxmcWrxOo+XXTOJA7jQYH0qf3eWyMbLi6VUv1DqbXIQoA32+0sfOnXURylFfR/bDAZ9jKCcl0Q2KBzvQ+zcVFtgIwxTCcz/5IbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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



On 10/20/2025 10:58 PM, Tomasz Lis wrote:
> The check whether GuC ABI version meets requirements shall be
> performed after said version is received from GuC.
> 
> Doing it in wrong order was triggering a warning:
> xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
> 
> With this change, dislodge part of the VF migration support check
> and moved it to after GuC handshake.
> 
> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
> 
> v3: Update commit message, move check funct to ccs module (Michal),
>  rename xe_sriov_vf_migration_disable(), remove its duplicate
> 
> Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
> Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")

hmm, but this was likely working fine until this:

commit ff1d2b5e3d28a62e79c89d2b2ab28ef5eaab84d8
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 13 13:09:50 2025 -0700

    drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT

so maybe Fixes: shall point that commit instead? 

@Lucas ?

> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c     | 24 ++++++++----------------
>  drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  4 files changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..3a3cd9c35aa8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -133,7 +133,7 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  	return xe->sriov.vf.migration.enabled;
>  }
>  
> -static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>  {
>  	struct va_format vaf;
>  	va_list va_args;
> @@ -156,25 +156,15 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	 * supported at production quality.
>  	 */
>  	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		return vf_disable_migration(xe,
> -					    "experimental feature not available on production builds");
> +		return xe_sriov_vf_migration_disable(xe,
> +				"experimental feature not available on production builds");
>  
>  	if (GRAPHICS_VER(xe) < 20)
> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
> -					    GRAPHICS_VER(xe));
> -
> -	if (!IS_DGFX(xe)) {
> -		struct xe_uc_fw_version guc_version;
> -
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> -			return vf_disable_migration(xe,
> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> -						    guc_version.major, guc_version.minor);
> -	}
> +		return xe_sriov_vf_migration_disable(xe,
> +				"requires gfx version >= 20, but only %u found",
> +				GRAPHICS_VER(xe));
>  
>  	xe->sriov.vf.migration.enabled = true;

as said earlier, we should change the logic to

 	xe->sriov.vf.migration.disabled = true;

and set this in xe_sriov_vf_migration_disable()


> -	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
>  
>  /**
> @@ -198,6 +188,8 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
>  	int err = 0;
>  
> +	xe_sriov_vf_migration_ccs_bb_support_check(xe);

why not move that to xe_sriov_vf_ccs_init() called just below?

then you will not have to export 

	xe_sriov_vf_migration_ccs_bb_support_check
nor
	xe_sriov_vf_migration_ccs_bb_needed

as everything will be in xe_sriov_vf_ccs.c

> +
>  	if (xe_sriov_vf_migration_supported(xe))
>  		err = xe_sriov_vf_ccs_init(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 4df95266b261..e967d4166a43 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -14,6 +14,7 @@ struct xe_device;
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  int xe_sriov_vf_init_late(struct xe_device *xe);
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index a2d61b37ff21..02d0fcd26399 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -10,6 +10,8 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
> @@ -275,6 +277,29 @@ bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
>  	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
>  }
>  
> +/**
> + * xe_sriov_vf_migration_ccs_bb_support_check - Check for disable migration due to FW version.
> + * @xe: the &xe_device instance.
> + *
> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
> + */
> +void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe)
> +{
> +	if (!xe_sriov_vf_migration_supported(xe))
> +		return;
> +
> +	if (xe_sriov_vf_migration_ccs_bb_needed(xe)) {
> +		struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +		struct xe_uc_fw_version guc_version;
> +
> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> +			return xe_sriov_vf_migration_disable(xe,
> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +				guc_version.major, guc_version.minor);
> +	}
> +}
> +
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_sriov_vf_ccs_ctx *ctx = arg;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 0e6b27016dac..2844628269d1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -15,6 +15,7 @@ struct xe_device;
>  struct xe_bo;
>  
>  bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
> +void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe);
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);

