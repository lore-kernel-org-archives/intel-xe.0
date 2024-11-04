Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC32D132D5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5647A10E0AC;
	Mon,  4 Nov 2024 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvHt6yLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6C810E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731623; x=1762267623;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=JYZI/Z5p2RtdttaLq/dOYWJDFDsX4TOB5QEOSh4um54=;
 b=YvHt6yLMn1g5N0MwUkIHbDwzt30iAOdwTHNOb79F9FSWBJ/YtO7AS7/a
 x5mUm7RJRbM27ukiGVWxxlVXWb39yr4Ox/4+Y3MsMZ3hToimn6ShGYKi6
 pofStfnk4VoynzvN4EOYjtabq3DVz0kCXDdtU7NX5KkQ05EgX5h3Gfe2+
 dhJ4AA0i93PbSknbzbLl50X9WNM6RJGYaNj4rs12uwlvE17To/snkjGki
 sVtshuhFWS1SppICE4urV0J7jfURtVOEqSMD/N+vEG38IkKkqIlr+wLBN
 xtYU7VhurhURedxAL/WmlfL7XfqUqcqgSWCk3rTRzo3hmrs8R9BaH9TDv A==;
X-CSE-ConnectionGUID: DaxxHrLITqy5PNLeDahc6A==
X-CSE-MsgGUID: 0tsFD5xMQ92d9FDv9ZAfUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30283817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30283817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:47:03 -0800
X-CSE-ConnectionGUID: YatRjWVVSNu6tAsTbgxzAQ==
X-CSE-MsgGUID: hv+v7K7dT32f1YsIEtuDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83196867"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 06:47:02 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:47:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4p2xR9niXIj3w7EuxuGLhhv0hNLqsh9xKjLluE8OBJMvePOmuuzbJNIev8Jp3YrecCmKO6YhjIEz7xX1bqrIoyPNLV0PQymi1/mv3gegW25fgnVJ7I18RJLrfxQimFQqmB+BWu4QCfQdfw+12ZsNEVjvU7gZ+vTSZumhFCW4urV6ifqpWee7eNI941kl9lppV9gF+8Ct9JtDiwB6iW1/amXzC0WET22JoWkjoUgmyc6MovXi2AwOzVbYzRk2o7tSL4hWQE69umIUDcdK9pcXb5fwfFj0Pi0pWP1PRVYl8hpQHPBkhJFPFN8EzqB/abAC/eg7zJPjZluqTNcz4lTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRWSwukrhSS510I7HQq700qyomBpif9EQmjUFXnqe88=;
 b=jRbIwQsTnoS/Z3KkBfh/5jghShvOXxrTtY+JQ4ZE6Cyp12SXeiFPWfK12CWdv3yvKxqvJHDKc9tI7ti3KW9+/r9wLuagzTTxcRXBUxO1JNUK979XdSjdE+ymYrOxZuB3NOQZcPIZZZseTPGEUAW/+1W+Km8N2SQv4MIwFxBxCLQNjx+ip85GIW2saIZEB9Vs3KVxIuBXldIGevGygpylMMBrWk9XjCT0Qhk8VoXMORbyWJMnRIcWD63GcFZyH9mz2tJgdCAer7YwtkluivHAZR7UQdKY6I2hN9ubU6sqlG2zbUKhTEtDs11hIGYuPoZdqNgC2AAIPb/GBsRTD0QdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:46:57 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:46:54 +0000
Message-ID: <445e6dd7-c204-4795-b7cf-d4929c42e6a7@intel.com>
Date: Mon, 4 Nov 2024 16:46:49 +0200
User-Agent: Mozilla Thunderbird
From: "Levi, Ilia" <ilia.levi@intel.com>
Subject: [PATCH 0/3] MSI-X support
To: <intel-xe@lists.freedesktop.org>
CC: <ilia.levi@intel.com>, niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0dab9d-07c6-4635-3ed9-08dcfcdf8646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFpjRDdiZm1jS1FaUDRncDhlTWJGNXZOWXI3NjRMRW5zS1lGZ1dIeVJQQlh4?=
 =?utf-8?B?MlJZbzBlOHdoQmdTc0NsSU45eE1MemNLVkNHaHBjZWFhbkdmdmNSdnMzMjJk?=
 =?utf-8?B?VkxDU1huOGZnVHY1SDd3RUkydHR3ZTZmTlRSWkYraWpvVUZubDlQOFRTaTJy?=
 =?utf-8?B?SmJ4WTZweEcvTENxWGJISlErSmZwUjhaVDZPRzNBRHlCeVZLRVV4Y29lb1Zq?=
 =?utf-8?B?S1N6UVpiWEJmWTRPZFo5K2dhTUpvbzdtcGx0Y0NJZzZJdDVqYjIxVFdWa3Jj?=
 =?utf-8?B?VGtaRERBQWlsdlBLTVNQYmtMVGU1U0JYbjkxVkdpbU52Lzg2aWJ6SFdVbk11?=
 =?utf-8?B?bGJLdVE1Z3B2NnFEcGVhRUUyTlJ1U3hQTmJvNnRjTnVmaDhFcGthTklKMDFi?=
 =?utf-8?B?WkY1MlFVVjl1eGVJNE5tTUFkWGpnaUdrcCsvMk9ML1pDK0EvK1F1dVY3MmZm?=
 =?utf-8?B?aW9lVGNrUUQ2Q05uazA0ZVBjV25BaDQ5VE5aQVNwOUhxWnozK3hCQnFCang1?=
 =?utf-8?B?NUMwZHFhU3hxMS94OGMzQkovekwrWi9oNDNzNnVna21RVU5Qd1paYnFacWVN?=
 =?utf-8?B?TEcveFRvTG9ZaXZUdEpNM3NPV0hKa2pJeGN3aDROdjJBbTNqbHVpN3cvRGR2?=
 =?utf-8?B?enA1bTF1M3Y0Ulpsc2VJWFV1RnpodFo1RDRhNXhpVXY5WGtZZXhYMExNUU54?=
 =?utf-8?B?ZFIrUjRWYmJYeno0QldCcUMrZWgvR1cwbUZoZ3EyYS9vY2FsL3VSb1hZaUQ4?=
 =?utf-8?B?a1IxQ25aVVhsQTFsME52RHBzTEQ1MlNvRktZcVcwTDE5MU1sY2p0WVBNZVda?=
 =?utf-8?B?MFg2RXcyY1ZFMlQwOS83RXdrSWxwNjVMYnUrNGxHNDNPa1RmMWRzMitUNjBX?=
 =?utf-8?B?bWRkakJtckZCTEVsN0pHOXMzQWFWbjZxSkxjR2hWcTRkNzZ3aHB6WU5hZHJZ?=
 =?utf-8?B?VUs2dHNheDE1cXpxeXYycTIyY0xLZG1qNXQ2QXdxNjdsUVFQaG5FWnFRalNW?=
 =?utf-8?B?aHJvWmRiejdmZHh1cFdkSGozQkpYUXp2c2lQa00vMlNXdzhXWnZ1NlY1S0Ey?=
 =?utf-8?B?SjA0R3JZNXI5Rzkrd2xzK2pqNXVuaXZkSkVHajdHbVRBQnF2Q0QyOG9XUElE?=
 =?utf-8?B?TVVBa2t2R3lvRkNUWWZKaHRIS09vZXp3UUo3SmhRbzMvM0xFRzU3SWExT29P?=
 =?utf-8?B?OW40aDcya0JvMlJWKzgwUkswWlZtaGcyR3BWdTNmT1RnRW50dU9iZVhZRGVh?=
 =?utf-8?B?V1k0WE1wbEhJdk1CWVBTdVNRTlJZZHdBTHEvQUUzd1RhYmlWL1lkVFR6OWNn?=
 =?utf-8?B?U3lQakhMUHZ6dHg0V0hFMHNxRENYVGxRcDI2WUFVTkl5WU85MjR3TE9UbVZC?=
 =?utf-8?B?V2M2bkdYQXJrNXdMRE5vVWNmM0daWUFWZ1RmbHlHRjI0NGpScCsvbDNPTmhR?=
 =?utf-8?B?ZStWNFVRRW9HY1FENDVMT3VMcjN4YmZpeGNnWmVjV2t4aERkbndGZUlVV0xj?=
 =?utf-8?B?OGdhUWFCYW9mTDdhYnlWWWJWd1g2dVlSRDVVRlBzdGpyZWhFVzFoaEFYNjVw?=
 =?utf-8?B?U3UxaTNaRGhwNWZOdzNKZE9mZ1RSNjZodklCQ2dZSkVnV3MzVnZnekxmbW51?=
 =?utf-8?B?YWRjbEZnVVBDZTZHRHF3cUpXbEYzMnpJSytCSkNocU5lT2RNdzZSWjJRMXNB?=
 =?utf-8?Q?pDtsSqbfLsiXWo7vNlD1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlYMlVKMW5QS0xVazlWZHZoT2E3SnAxQ1pyTmJlWUllc0tjNHB6aEF2aW1v?=
 =?utf-8?B?dm9uWnVQYmRTUXVMbWRXUGFnU2xNTjZvSGtvMzU4VXByUVkwTlR4RVFJZkpq?=
 =?utf-8?B?eXkwcUQyMHBNQ0htV2ZXRXAxOEF5L0xYNGFuNjNzUjNvVUxzQmhxK0lkQnRz?=
 =?utf-8?B?M3ljdlFoY25qR2VvQ2l3QmluR1lSRXltZDIwanV3VUdKVVZnN1hMS3R3Z2FT?=
 =?utf-8?B?YXc3VnhvWjlHU0NqSGlRbmcwU2Q5MXkyZ1lIY29xREg3RVFjc28wSXFjMno0?=
 =?utf-8?B?eTRBOXNyNVE2OXR3OTh1ZkhWMVFMbWpNRW5jV3BUUk1zRTc5b29NUGV3Rmtk?=
 =?utf-8?B?QjVoMXhaT2FUUGtBOG5UNGJKZnROT0tHSGtGcFZ4THN3N1k1ZVR1ekZ0ZDhp?=
 =?utf-8?B?eEM0ZzF5MXdyZXY5MXhRQUxpb1RPUlRIa3kzWXFaMlcxb29KTmd5R1VaRVQw?=
 =?utf-8?B?dEl5VmxHMHFnL2xXV3NvOEd0SXJlbGZYL0NIUlEwaUxuNDZVNnQvVDdjak82?=
 =?utf-8?B?MXVlN25PZ0tuZURTNTZQTkU2ZGdvRTVJK29tYWNQcGlqSHlia2Y2MjJLU1hw?=
 =?utf-8?B?WkdGK3Fxd0tpWEk1L1EvTktnaTBVQ3M3cGkzWkpKeGxCa2NZby9CK1BXZG1S?=
 =?utf-8?B?SXNGam55TWV4T1FodldoQ3h2ayt6RGplRUxhRGRTY2FoQllObG5xdnFhWlhh?=
 =?utf-8?B?eENpamtWbVFkOWRxcUxtR3B3Qm52RENqSS95QXJEK1pqRXZXQWhVRGRvTTZ6?=
 =?utf-8?B?azYwQ1NxaW9VN0xXdkFmaXFmOGVHQ0k5M2pHVTNxOHplRExybFBJcnBmSmgv?=
 =?utf-8?B?VEpaOHU3K0VLaGdNYUVsZXJnbkkrNTIyQmlKR1F3eUY2THljbEhrQlFDVTJL?=
 =?utf-8?B?YTRTSnBpcVZnREFLbFUxS1FQdFhYTDFxak1hc2xTWTFHVlViS0tLTStzQ1gx?=
 =?utf-8?B?M2RMcWEzckZZRUtlVEhEWUg4Y0RPZndwalFaeEhzTVdBQ0NxNkV0Z3IyL2pP?=
 =?utf-8?B?UHlOKzRSMlFqTXE3dnhjNkRJUXQyVk1UMlBFL1dJL3c2d3YxUHUwM0ZLOEhY?=
 =?utf-8?B?YWJhVHZZa3d1ZmNSOWFuSlFsVldOai9KL0R2bTNFWkhqM01jRCtlNjAzWXlN?=
 =?utf-8?B?ZisvSHFwSkxNN2JIb016Q2hvRFVlTDdMYUdvTDNiek5JWWE4YXo3QmhjdENs?=
 =?utf-8?B?YzlZNlBQZkhiZkR4OFlBVlpSa3pwUTRoQXFVbTI3ZUloSHZxdzBWd0hDYXlL?=
 =?utf-8?B?T2l6Snd3TEI4UWpITzBzdkZxcWZkV3JkdjBubFJxeWU0OTI0QnFtTkJGejFx?=
 =?utf-8?B?c2ZMWDlFTmdxWkRZVkpERURTaWR5NEN3SHdKZVNSUVhuMFpodUk3NkhnUTVD?=
 =?utf-8?B?Q1VpbzlxdjZnZlhVVGpNdWtSTnE0amNhVnlVbmduWEV5YnhuaDBFZGZSaHhH?=
 =?utf-8?B?aCt4NmdiS1hRbm1kQjhUd1BlN092YXZqclBjTUZ6eHo4OC81NVNkQUtta0Mr?=
 =?utf-8?B?OXJTZXZMbnAya0s3YWhkb2lZRkRoR2paNm5Fc21uMnMwVEY3cUwzZVNGNEtE?=
 =?utf-8?B?YjRiWlpjaG14MTkzT3RmUWp6KzRUQ3BTaUo3ZSt6eFRrMzRtMWg0ZDFTSXdm?=
 =?utf-8?B?RjNiOG9RVUJWWHRxWkk3eUZ1T2FGS1AwTnlXM1ZaTWU0djVoalFHTmNHbWMz?=
 =?utf-8?B?S25zOVVTejJZTUFwaUtDZm52dGVBc1dnQnFKTktlZ0FSK094L0hUK0dEV0JZ?=
 =?utf-8?B?elViYVZBSHRjeGJlblBES0lNbmxpVzNMTUlzMTJtd09aYm9SeXRIM1dGWC91?=
 =?utf-8?B?SmtrcVZOZFl0S2FEcGdLb25mZ0hQOHB1TGlTaGhwTXVHalE0Mit3NVM3a3Er?=
 =?utf-8?B?a2hyVzRTdVB3TnNya094Smo4V3pLNjdaeHFVUE43MjNMVDlvYldQYzNTeDZL?=
 =?utf-8?B?ZEhxcUhoL0k3eTRjYXllbXdVTXJKeUdQSGZ6KytWZld4OFlOR2lLOUlNTGJx?=
 =?utf-8?B?VEpHWWhtMzBtNENkS1ZRZkplcU56dFJ3T2djZEdkdVdFSWs2TGhSM2ZGVjVq?=
 =?utf-8?B?TnB1aXRBMEN3aktnUlNUNVpvWTc3Z0NzQ2w5aS82TUxmLzRPdGJXZnFITS9X?=
 =?utf-8?Q?rEUR+XsQsjhC/xs7YL7wg7XE2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0dab9d-07c6-4635-3ed9-08dcfcdf8646
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:46:54.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWkU2HWBeIwXq+DvKMgRr/+ZDzjitivxCvmhEK9OW/SZNA6zcAUBH6HZMj6UoAMbEEzb2256oHewRH3J47e+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

This patch set introduces MSI-X workflow.
This is a rework of previously published series 135422
(https://patchwork.freedesktop.org/series/135422/).

It includes:
1. Basic MSI-X workflow with GuC-to-host and "default MSI-X"
   interrupt handlers.
2. MSI-X interrupts allocator to allow dynamic resource management.
3. uAPI flag to xe_exec_queue_create_ioctl that allows creating
   an exec queue with its own MSI-X interrupt.


Dani Liberman (1):
  drm/xe/uapi: Support requesting unique MSI-X for exec queue

Ilia Levi (2):
  drm/xe: Initial MSI-X support for HW engines
  drm/xe: Manage MSI-X interrupts allocation

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   4 +
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  12 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  59 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 119 +++++++++----
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 216 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  22 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  23 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 17 files changed, 443 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

-- 
2.43.2


