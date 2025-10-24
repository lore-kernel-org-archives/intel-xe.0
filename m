Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C3CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1110E00D;
	Fri, 24 Oct 2025 19:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l01ti9iX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8405510E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761334999; x=1792870999;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UHBExQhCKHoOEZ/8hJPYssLtpPbHLoJ5E2Q4sHx6f3A=;
 b=l01ti9iXiOVOjUlpcrzt2yrcBWg8ZZvbtNpy3J6K5O9GGLZSsnoVNLGH
 nzUjAJr942Nls2NWirBlEIziLdvzODDiyErjTYQAk2tUoGR9Z2BshfZRw
 cVVwOraWX8hk6jOgQ5LXOivlCTNjd9VvfsIRSBJ9rTTTg4HTnhVnxGSBE
 7MASov7Y+zol7I+GjyzWRz9hqtS51vIfF5Wmbw3MCHuCyvdZ+riyCVp8x
 n3iNxk9KfuPt/JoEhaiWkJXok216BzW761TUTcuPD4g1K3t0U0Xl3MGYq
 NuTrF4cEEaq+wsYa7eAGfbjg0fATKDc8VC4puevta5hVneXW5hRHZMb8v g==;
X-CSE-ConnectionGUID: xlAXBEowQ3qi1MW73CPdUQ==
X-CSE-MsgGUID: tb+PW3aTQPuZy8GeQYWJkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63615194"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63615194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:43:19 -0700
X-CSE-ConnectionGUID: m5h3Ki1MRByLT2exkJujXQ==
X-CSE-MsgGUID: /xx7iUEbQ3WGXp30WMsTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="215164634"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:43:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:43:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:43:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrYzRnrfY3wU0qGCYW/RcqAWiIXnfmmTsNUtI+DEJWQoLYWMoXXBqEQ2Gkz4JV/D2qDR7yhNdNHHFigK01jedcnpKCCiWAqy0czrYgAqUCVvWzUSaWbVDqkrsWnfNMpnd3PwLtJ9PECrD/1E6rwFRc9kyWjnXsjWyp3LlN/3Id5MormwU9lc8zUvKNqmejAE+JWcCQvf7pbelubY9tugVEj8z/dSP3BOpCnWBS1FzM/AeenGH8M6zfbZ4VOTVWMifwNkLqsbT8ahd9G9FfEH00aAWOa+1FnO6GrmtM8x1QIQN3jxzSAgg18idQqQOBZ7kNGHUOpmEfscC5w/qhVq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW0A/KD5egwHIHF9XsFyz+Z4NCxaPd684LsRLs9vmzw=;
 b=p+5NOAmhdbMo9Zg+JK0mxZYK/rBZGIeFmMaZZCNbqf4xMXrwEuvfeXO0mY+dvVp+tzSq98EiLwQHVBsAsqnZ1vqV025zXLnrZ4qlnYulox6jlgny9ue7NinThi6EE/F4CrmZkBs6NDqJuNUk6Onqleeo1Elo1u2HRUfpbidgN/Pr7Dy9fj83UTx2NVp5mwFU+pb+NIstNp6WZeap6h2Mw3FHjCqhg4PKnIRAfM19aSuwvCOfXIBGnm7K/RZv5Bl2VuYHhfcCgqS2I4LczaC0zooy7fhbIHDNsrbtwklxhM1OdBlgvRmSXVzhY5271/URlB7/mwXLisqXUOspiSKfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:43:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:43:16 +0000
Date: Fri, 24 Oct 2025 15:43:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 01/14] drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
Message-ID: <aPvW0UGS5Mas8Xj4@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: afa01f7f-b16f-4dd2-9ef6-08de13359354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3R4cVlub2hkMTA1Q0VncXlqVURVVzV1eE9uSExQYThDcDJ4Q3phMTlJSFpN?=
 =?utf-8?B?ejJSK0tsRkdiaVRpanFDRDhTV093YUdwcW43bzlSNzlBbS9ySCt6MkMxbXcx?=
 =?utf-8?B?OTB2VkFlMFZLK0s3Qjh1QW01TllyOE9PdjBmLzFRejQzWHZOWkd2VFhnZmNs?=
 =?utf-8?B?KzFldlo1Zk9vM2lDZGlHSHhrTnh2enY1RDJuZ2xtbk9jNXlZRzI2bW8zYWY0?=
 =?utf-8?B?bDB4VXlQbFRlQm5kZzYyS292SWpGNzhtdURFQllwMjl6WUFucVg3UE0yMFFZ?=
 =?utf-8?B?UWNXRTNtQ05nOW4wSFNKYjUrenVqTng2L29NdWQxVUI5SmFTMFh5RkhCOXNU?=
 =?utf-8?B?SlYvT3BCdytDc0M3T1pMOEVENjQzc0FNUHZxMFpURWVBdnlvRFBEYlVzTzNj?=
 =?utf-8?B?Mmh6K1dxVUdDcmZsb2RFazhtRTZmdCtQODBoVDh6NE10S1diOUl1VkpyUFMr?=
 =?utf-8?B?dUhxMVJjcUxXN0U1ZTI4VTBkUVpuaFdGaVh5aTNMVmJvNmxGRDI2dkRSRTFM?=
 =?utf-8?B?UUtFa0F2bHdJSUoxL1BJNzZlcm8xWmFGUWNUNk9lNm94M1MxRjFlQTk2U2g0?=
 =?utf-8?B?L1dBQXBpSzdzczZWK2FwMWtYc2R5KzBxK2xjSDUzY3J6Tld4VFd5NSt4K09N?=
 =?utf-8?B?dHNmSitiTEczbG1iMWo3MlRLRHBvcWcwU3laaGtzU3FwWWpJcHhvTEhJZU9P?=
 =?utf-8?B?OG0wN3RiUy9USWx5QU41aWc4N1RDcWxFMGZ0b3cyYU44UktqWlFtM2orcWE2?=
 =?utf-8?B?bW4yQUhvdkpMSmFqa0RzYVB6MUpDRXFHTUs4WmRTVlBzckxSMFR6Y081WmdE?=
 =?utf-8?B?azcyR1hPSWpXNzdIQUVrZ1NpNDZEMTFkK0tUeUZXT3N2dCs0N0JrMXFnaHpv?=
 =?utf-8?B?azNtdHBWcmpOY0dQSkNJMVBsbGx3QWJZUEVqdFJQZGlOT01DOUtwdzQ5cXd5?=
 =?utf-8?B?dnhNVlJWczU1bEloTE8vK2tnaUdzK1NPdW5vbkNTN0RCQnJkUW8wVHJ4Qkhm?=
 =?utf-8?B?bzY3U3RHN2U5RDd3S2ovMGFTMmhUSzVRQTgwWDFTRDJNN01PMmNhRlhmMGxm?=
 =?utf-8?B?REFFbDVEUnlHWHVLT3dVZXVjT1Q5OElDUlNUVzA2S2JmUFBJQWltYkFZRjNR?=
 =?utf-8?B?QlRrdDgweDcyVlZzZEpqeXdpRkVidUhRT1RSVHBnVkNVY1poaHJveUw1b25s?=
 =?utf-8?B?YnJ5RTZEV3plcHBodHZza1plNHp5cWFIZjFBNXoyTnExa1ZFRGlvK2R1ZVpN?=
 =?utf-8?B?Wk9LcWQ2VlZJbW1OVkFBdEdBOG4yMCtxdEVoSHhDK3RvMDhQRWprOWZNa2N0?=
 =?utf-8?B?T2xyZXJBbUFHeVB2Nno4SlcwYWp1aGtVVExGbUtWbEhSb2puS3VmZ0U4ZXNH?=
 =?utf-8?B?RUQ5ak0xSVpMUkl4U1l4ckx2Z3ZKS1VXZnA5bnhPenYzOGw0M21JYkxDYXY1?=
 =?utf-8?B?dnV3Uyt1MFZIN3hRZldZRTdXenk1dnJoWTlHdzhSUjRHT0tFTWd1K1Zpb0pQ?=
 =?utf-8?B?SXVnaEZ6MnZrODlEMGxVa3NCenJJcS9KSEVySit4a2tuS1U4ZFNqd3FuVHph?=
 =?utf-8?B?VjBCVzJ3N3dHaVZJWGR2bU01T0VEWEMrZlJaUlNJSTllandpSHB6QzczTmNP?=
 =?utf-8?B?S08rZWxVcXNoT3pyRmtiNFBUYTQ1c0I0dEpQL0k2NHE4T0QzcUtlTzV6WnE4?=
 =?utf-8?B?U1U2TjRHVDdWcjdKYlN1ckdXQlFqSldFR3dtRlBPbm1sRm1pM09RTGl4OW91?=
 =?utf-8?B?YzZuN3VNTE0zekpmT2g3cm5YcDk1SXlmMHFkaGpvOVNxdlRQbDVCS2VUUzNC?=
 =?utf-8?B?ZWdiNG83TUNlZDVWR1pYejhjTHdmL0c1NlJBYnNDRThmQ2xCQ3ZmU1VLSnhu?=
 =?utf-8?B?YlI5NUxHZkF4QzYvdkdYVExRWThkendEQ2cwTldvRmdEb0RvRkFiNHlDWG5L?=
 =?utf-8?Q?DIMKZ5TTd/xgDDZ0ZjL8Xmtomhsirrcm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUt2L3BLbnpWVVQ1ZklZa21rWjNkYTlKOWpWZndxSmhMd0ViYTBMWFU2ODR0?=
 =?utf-8?B?VTU1K1lIRHQrcnArUmR4WGtLWXpRcnNTSWh3QWpkTURyNHY2cTRWanJ1V2pH?=
 =?utf-8?B?eHA0dEx0R3FUR2JxZ3J0ZFJjbVBFU3hlMXRQNFZ3MDZsQnBBaTFtVXAxcjFG?=
 =?utf-8?B?b1BwM0NjODJoZExCNEJYY2lKTFR0ckhpa0c2amVrY0p5ZytraDlXb2xCR3Y5?=
 =?utf-8?B?eG5nZlFuWUEwTUNUNmUxZ2hjVmRYOVlINHJzOTBnSlpJQWRldEhIeE5kYk83?=
 =?utf-8?B?YXVEcHgxT3ZSc2p3bHNQSGVwVTM1amdmNjlWb2NBOHpESnVyTXozOXhNbG5P?=
 =?utf-8?B?b2tZd0lKR2t4c0dDakI1bEtjMk0wSzhSQndjY0F4bHpYZmpaSkZPdkdUSnpM?=
 =?utf-8?B?MTFCblA5NXhHWms1SmZFckRQaFZjUm9reWdMS1c5THg4Vmo5cndIK2QwVXhN?=
 =?utf-8?B?L2FCOFpRUzB1V00rdkltb0p3OFE5UXk1SnlYQUxLMktWenRmZU92d1kvZjhM?=
 =?utf-8?B?K3BTcmJoT1BnaUd0Z0VyZ3RtcjVNaUtRR253WEVRTWJTT3YzeHF2WWRodU1C?=
 =?utf-8?B?eEEyd3BpTThoNzFOUEF4VXdkWnFsVVVDSzZoZFhkaXBad21PSUt0a0Y2akg0?=
 =?utf-8?B?dmY2S1ZlMlEyekZRdGRLdGR4SENGL2VvVjlQdVlNY2VuM21DeE5nWG9KMjFI?=
 =?utf-8?B?c0RUQVFMTHc2S2FNNkFnV3hKZmdEckNkbE5VV0hlM1QvYVFpazAxOFBqZTA1?=
 =?utf-8?B?YlQ5QnYyOWdQRUNLVWRUNU9TZzFUc0l5VlZJazdzQkZZMmc0Y1VvTzJCc0tv?=
 =?utf-8?B?VEJuN0RieFpta0NpeG9kUWJuSnVuU0ZjQzlRNWsvQXJQakJUVGVYN0M5UGU0?=
 =?utf-8?B?N0R0QUJrQTI5WVA4Z0JuRkR6Q2J6SEIzRG9nNGFnOU4zM2F1UmlWaUdncTV6?=
 =?utf-8?B?WlBmeHdMZUNjM2o2bWZVb0MwbEdsMktYOXUraW00NktTZ0svQi9xY1dkVFhD?=
 =?utf-8?B?TkplakNFaXZ4cGliZVdKT1VUbzUwMkpjVXVaS3pYRlpJdEhLSll1bUNGWndZ?=
 =?utf-8?B?czNQampQTk9zRjlxWlVzalNEU21HVGZ6eks3WFQxaW1KQ1RYYjlEOU5RUE9i?=
 =?utf-8?B?Vjk3aElseCszbDZ3Rm9HMWJvc2Jud1ZhUlFUZ2FrT0tRMEljWmJmY1ZCYnlW?=
 =?utf-8?B?QVYvekZpQUkwMW54Rk5TRkxYb0xVYUh5RUlmT0dYMVpGb2Izbk1ET1I5amJm?=
 =?utf-8?B?VHFYVVhsVmFBS05OV3N1N2t0d1VKTVlUTjNaOWZvT29QdExPSDFrQjFVUDBP?=
 =?utf-8?B?ZU5xUjgzTGNSVkpzWEprYWxib0kvTmJvR3BnZ0xhVFEvd01WLzEwQjcxRHZI?=
 =?utf-8?B?QzZxdUM0dDJKMWV6Q3hNWUhRbEpWSXlnQzNhMXU4L04wdkVYckJsTSs0MHpu?=
 =?utf-8?B?cWtQKzNWTncvU0RqeHFYQ2ZEK3NZajMyalhiU2VodTdHN29oUXdDT0xFUjhE?=
 =?utf-8?B?bjllSEp1QVJWK0xUc283TG9CSW56bGo0SXVyTkVGOUMvYTJ3blVuWW0xK25X?=
 =?utf-8?B?eTJsYmlFUmx6KytnYjJhbjByRCtqaGJlUER1TEwzVHIrSlUrakJMcHZ0Rmpv?=
 =?utf-8?B?ckRhbkJNNFl0ckp0ckZtK0oyS1Ryd3dTSmlMSWl0ckR1REczMnlPWFpaUWlv?=
 =?utf-8?B?M0ZjeW1DdUNrcnhpS2ZoZERyZTBab2lZU2xBb0dKdlZ1TWN4V0liaVN4VW9K?=
 =?utf-8?B?MCsralIya01CNVBpV0UvdEdPZFVnbXNKSlYvRjJiM09wUXQ3dHFUVmkwMDk5?=
 =?utf-8?B?Njdib1lXTU9WZk1XcjAxN2I0b2VwQ0FlM0RvVGdWaWhCaXZYT2Y4SEpBelY2?=
 =?utf-8?B?Ykt5QWg3SEtsM3ZxOS90RU9uNDVXYmRMSG01SEtrdDlaWjhKV0xvQkxJMEpR?=
 =?utf-8?B?ZENweDJERzBFNXowbVVBK0lodVdmaEFyaXdXajBkQVZMNmExL25RTzdUcEM1?=
 =?utf-8?B?c3NIaUhOWFBHTWdDbGtzTFBFbEQvSmpQQ2o4L0FYTTVyQmkvZFlHR1EzR1kw?=
 =?utf-8?B?RmRldDdmeVVCcmw0YmMrWVdmV3VJd2FRWXpPbk0xbHZwSFZJamM4S3NjTnQ2?=
 =?utf-8?Q?eJyy6K+XWUr1ErzTw704oJMZZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afa01f7f-b16f-4dd2-9ef6-08de13359354
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:43:16.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6T+b1Bq4LDV8u5KXucseYVHsKxJGY0Z/K58HS+nGUWJ+aiy8W405YCoWfBca6tQNYFIG1AtlfjEKHL4ZiyL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

On Mon, Oct 20, 2025 at 08:24:01PM +0200, Michal Wajdeczko wrote:
> We already have some SR-IOV specific knobs exposed as debugfs
> files to allow low level tuning of the SR-IOV configurations,
> but those files are mainly for the use by the developers and
> debugfs might not be available on the production builds.
> 
> Start building dedicated sysfs sub-tree under xe device, where
> in upcoming patches we will add selected attributes that will
> help provision and manage PF and all VFs:
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── pf/
>       ├── vf1/
>       ├── vf2/
>       :
>       └── vfN/

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Add all required data types and helper macros that will be used
> by upcoming patches to define actual attributes.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c       |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 295 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h |  11 +
>  5 files changed, 325 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 82c6b3d29676..e84811783115 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -178,6 +178,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_debugfs.o \
>  	xe_sriov_pf_provision.o \
>  	xe_sriov_pf_service.o \
> +	xe_sriov_pf_sysfs.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
>  # include helpers for tests even when XE is built-in
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d9..b8af93eb5b5f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -16,6 +16,7 @@
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_service.h"
> +#include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> @@ -128,6 +129,10 @@ int xe_sriov_pf_init_late(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	err = xe_sriov_pf_sysfs_init(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> new file mode 100644
> index 000000000000..91962155f80b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_sysfs.h"
> +#include "xe_sriov_printk.h"
> +
> +/*
> + * /sys/bus/pci/drivers/xe/BDF/
> + * :
> + * ├── sriov_admin/
> + *     ├── ...
> + *     ├── pf/
> + *     │   ├── ...
> + *     │   └── ...
> + *     ├── vf1/
> + *     │   ├── ...
> + *     │   └── ...
> + *     ├── vf2/
> + *     :
> + *     └── vfN/
> + */
> +
> +struct xe_sriov_kobj {
> +	struct kobject base;
> +	struct xe_device *xe;
> +	unsigned int vfid;
> +};
> +#define to_xe_sriov_kobj(p) container_of_const((p), struct xe_sriov_kobj, base)
> +
> +struct xe_sriov_dev_attr {
> +	struct attribute attr;
> +	ssize_t (*show)(struct xe_device *xe, char *buf);
> +	ssize_t (*store)(struct xe_device *xe, const char *buf, size_t count);
> +};
> +#define to_xe_sriov_dev_attr(p) container_of_const((p), struct xe_sriov_dev_attr, attr)
> +
> +#define XE_SRIOV_DEV_ATTR(NAME) \
> +struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
> +	__ATTR(NAME, 0644, xe_sriov_dev_attr_##NAME##_show, xe_sriov_dev_attr_##NAME##_store)
> +
> +#define XE_SRIOV_DEV_ATTR_RO(NAME) \
> +struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
> +	__ATTR(NAME, 0444, xe_sriov_dev_attr_##NAME##_show, NULL)
> +
> +#define XE_SRIOV_DEV_ATTR_WO(NAME) \
> +struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
> +	__ATTR(NAME, 0200, NULL, xe_sriov_dev_attr_##NAME##_store)
> +
> +struct xe_sriov_vf_attr {
> +	struct attribute attr;
> +	ssize_t (*show)(struct xe_device *xe, unsigned int vfid, char *buf);
> +	ssize_t (*store)(struct xe_device *xe, unsigned int vfid, const char *buf, size_t count);
> +};
> +#define to_xe_sriov_vf_attr(p) container_of_const((p), struct xe_sriov_vf_attr, attr)
> +
> +#define XE_SRIOV_VF_ATTR(NAME) \
> +struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
> +	__ATTR(NAME, 0644, xe_sriov_vf_attr_##NAME##_show, xe_sriov_vf_attr_##NAME##_store)
> +
> +#define XE_SRIOV_VF_ATTR_RO(NAME) \
> +struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
> +	__ATTR(NAME, 0444, xe_sriov_vf_attr_##NAME##_show, NULL)
> +
> +#define XE_SRIOV_VF_ATTR_WO(NAME) \
> +struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
> +	__ATTR(NAME, 0200, NULL, xe_sriov_vf_attr_##NAME##_store)
> +
> +/* device level attributes go here */
> +
> +static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
> +	NULL
> +};
> +
> +/* and VF-level attributes go here */
> +
> +static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
> +	NULL
> +};
> +
> +/* no user serviceable parts below */
> +
> +static struct kobject *new_xe_sriov_kobj(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_kobj *vkobj;
> +
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	vkobj = kzalloc(sizeof(*vkobj), GFP_KERNEL);
> +	if (!vkobj)
> +		return NULL;
> +
> +	vkobj->xe = xe;
> +	vkobj->vfid = vfid;
> +	return &vkobj->base;
> +}
> +
> +static void release_xe_sriov_kobj(struct kobject *kobj)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	kfree(vkobj);
> +}
> +
> +static ssize_t xe_sriov_dev_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
> +{
> +	struct xe_sriov_dev_attr *vattr  = to_xe_sriov_dev_attr(attr);
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +	struct xe_device *xe = vkobj->xe;
> +
> +	if (!vattr->show) {
> +		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
> +			     attr->name, "readable");
> +		return -EPERM;
> +	}
> +	return vattr->show(xe, buf);
> +}
> +
> +static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct xe_sriov_dev_attr *vattr = to_xe_sriov_dev_attr(attr);
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +	struct xe_device *xe = vkobj->xe;
> +
> +	if (!vattr->store) {
> +		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
> +			     attr->name, "writable");
> +		return -EPERM;
> +	}
> +	return vattr->store(xe, buf, count);
> +}
> +
> +static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
> +{
> +	struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +	struct xe_device *xe = vkobj->xe;
> +	unsigned int vfid = vkobj->vfid;
> +
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	if (!vattr->show) {
> +		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
> +			     attr->name, "readable");
> +		return -EPERM;
> +	}
> +	return vattr->show(xe, vfid, buf);
> +}
> +
> +static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +	struct xe_device *xe = vkobj->xe;
> +	unsigned int vfid = vkobj->vfid;
> +
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	if (!vattr->store) {
> +		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
> +			     attr->name, "writable");
> +		return -EPERM;
> +	}
> +	return vattr->store(xe, vfid, buf, count);
> +}
> +
> +static const struct sysfs_ops xe_sriov_dev_sysfs_ops = {
> +	.show = xe_sriov_dev_attr_show,
> +	.store = xe_sriov_dev_attr_store,
> +};
> +
> +static const struct sysfs_ops xe_sriov_vf_sysfs_ops = {
> +	.show = xe_sriov_vf_attr_show,
> +	.store = xe_sriov_vf_attr_store,
> +};
> +
> +static const struct kobj_type xe_sriov_dev_ktype = {
> +	.release = release_xe_sriov_kobj,
> +	.sysfs_ops = &xe_sriov_dev_sysfs_ops,
> +	.default_groups = xe_sriov_dev_attr_groups,
> +};
> +
> +static const struct kobj_type xe_sriov_vf_ktype = {
> +	.release = release_xe_sriov_kobj,
> +	.sysfs_ops = &xe_sriov_vf_sysfs_ops,
> +	.default_groups = xe_sriov_vf_attr_groups,
> +};
> +
> +static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
> +	return err;
> +}
> +
> +static void action_put_kobject(void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	kobject_put(kobj);
> +}
> +
> +static int pf_setup_root(struct xe_device *xe)
> +{
> +	struct kobject *parent = &xe->drm.dev->kobj;
> +	struct kobject *root;
> +	int err;
> +
> +	root = new_xe_sriov_kobj(xe, PFID);
> +	if (!root)
> +		return pf_sysfs_error(xe, -ENOMEM, "root obj");
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
> +	if (err)
> +		return pf_sysfs_error(xe, err, "root action");
> +
> +	err = kobject_init_and_add(root, &xe_sriov_dev_ktype, parent, "sriov_admin");
> +	if (err)
> +		return pf_sysfs_error(xe, err, "root init");
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, !xe->sriov.pf.sysfs.root);
> +	xe->sriov.pf.sysfs.root = root;
> +	return 0;
> +}
> +
> +static int pf_setup_tree(struct xe_device *xe)
> +{
> +	unsigned int totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct kobject *root, *kobj;
> +	unsigned int n;
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	root = xe->sriov.pf.sysfs.root;
> +
> +	for (n = 0; n <= totalvfs; n++) {
> +		kobj = new_xe_sriov_kobj(xe, VFID(n));
> +		if (!kobj)
> +			return pf_sysfs_error(xe, -ENOMEM, "tree obj");
> +
> +		err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
> +		if (err)
> +			return pf_sysfs_error(xe, err, "tree action");
> +
> +		if (n)
> +			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
> +						   root, "vf%u", n);
> +		else
> +			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
> +						   root, "pf");
> +		if (err)
> +			return pf_sysfs_error(xe, err, "tree init");
> +
> +		xe_assert(xe, !xe->sriov.pf.vfs[n].kobj);
> +		xe->sriov.pf.vfs[n].kobj = kobj;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_sysfs_init() - Setup PF's SR-IOV sysfs tree.
> + * @xe: the PF &xe_device to setup sysfs
> + *
> + * This function will create additional nodes that will represent PF and VFs
> + * devices, each populated with SR-IOV Xe specific attributes.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_sysfs_init(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = pf_setup_root(xe);
> +	if (err)
> +		return err;
> +
> +	err = pf_setup_tree(xe);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> new file mode 100644
> index 000000000000..1e6698cc29d3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_SYSFS_H_
> +#define _XE_SRIOV_PF_SYSFS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_pf_sysfs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index c753cd59aed2..b3cd9797194b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -12,10 +12,15 @@
>  #include "xe_sriov_pf_provision_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
> +struct kobject;
> +
>  /**
>   * struct xe_sriov_metadata - per-VF device level metadata
>   */
>  struct xe_sriov_metadata {
> +	/** @kobj: kobject representing VF in PF's SR-IOV sysfs tree. */
> +	struct kobject *kobj;
> +
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
>  };
> @@ -42,6 +47,12 @@ struct xe_device_pf {
>  	/** @service: device level service data. */
>  	struct xe_sriov_pf_service service;
>  
> +	/** @sysfs: device level sysfs data. */
> +	struct {
> +		/** @sysfs.root: the root kobject for all SR-IOV entries in sysfs. */
> +		struct kobject *root;
> +	} sysfs;
> +
>  	/** @vfs: metadata for all VFs. */
>  	struct xe_sriov_metadata *vfs;
>  };
> -- 
> 2.47.1
> 
