Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0CC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 14:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D9E10E4B7;
	Mon,  7 Sep 2026 14:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjEi4+t0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E97A10E4B7
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788791076; x=1820327076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDAXuiDPs6whJnRTYuYld3LtLPizJHfzZ6nx6GwHUgo=;
 b=YjEi4+t0m9bAN8Z0DZjdRCcoWPbjU09MBpH37AwCMJcWuMGeOiUDGEfs
 AvRLdJ56SnlVp0BS9wAEhZBiHe3MJK5DxP+vXUQ+nc8ZByoL8VFy+vzfk
 qpjYV7f2Fn6OHMuSY87guLFwjwGM1iF7vsccB+YQAc+19+NtopBxUx50G
 emH4TYkK4KPKQpPI58hAsKw5ZuPCcv/KNa2u1Tg58E9d9R2WtZYu8gFFg
 KYvBZLWqd1GcP5HWeFn3yt6/By7iIXXFtPU7gU3bxldxoboJkpmDdELNI
 xOfY1fzDgB207CKSsv5cYURANWQmwM2D2rNyGNqG2+rZowVILQxvJlWAw g==;
X-CSE-ConnectionGUID: 2RjwTdoJQreDbq9MpUNaYQ==
X-CSE-MsgGUID: 7XCEDMvTS3yFvW6AMsOecw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93013400"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="93013400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:24:35 -0700
X-CSE-ConnectionGUID: ElS5iMrrQXuYGWoh3kynvw==
X-CSE-MsgGUID: IymkY0C6TNW0JmQdIclEAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274240513"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:24:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:24:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 07:24:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsX04f4iVzEluEC7VWYyQie5kfXQ0Ywet+zj2om1PUcAMyJ3N0YpU4WA42SutMIGYLCfOqd39vqIWRMWDwyNJLZO/TCNfZSjKU0c/8MmVwjBZN4CDit1fPhOMauEGDU6qnXSgObsQdcwMnQzMt7T4BSHjg0Rv8/24uepPrJh4TeqkKOZS9QBlbDIGEk8NkMrsPIWHQdG6yfyJjUbZYDjj/bQtCmiSwKbelxOeVBzvCj99ZoNFaUbYyxjbt0wT8RwrTDxGjiD7zWBqqnEYYuHn8Xcjr4/saeM+4mMyTLRHs9MWi+C+bzrbLV1Hm+HZHPwZ6VQ2f43wQxToiixSBfYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKxWKY1Js4/5ioFFi66fCdR6++ovJrTY61LXsAHg2Cs=;
 b=qjZpbLRK3u4JrwhCtlPFaPg7vkq1duH2lPz6zrnKEmHBV9MOhEcctC9F+BYXdlDBtV1iyjF6C746NiseLxHnUwnjs8B5YOVjOwrip3Nrb48hNyCPGfId6wydq/TpMdyHImckwwUTL8GqBlnC2gfwNcPpyPJTUdb6AR8HRkleMauI0BlXRqHyRixyuDW1Q/uTAX3qg5jddn4igvuhUxhZZWqe1ZSBvC+lja73WsOPpn758v5FXnm7yfEmP5ThZ/F3AJxVMBhtIybw9Gtk0cJR52lyOdCzHfh72+WQlasnwxELbM76n0LtVocPMoy+8i7YvF7qstwfhrDq3CdbuSPL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SJ2PR11MB8347.namprd11.prod.outlook.com (2603:10b6:a03:544::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 14:24:31 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:24:30 +0000
Message-ID: <9c0f9a83-436d-4a1a-8192-ef3d4ae34e1f@intel.com>
Date: Mon, 7 Sep 2026 16:24:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
 <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
 <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
 <9d6388b0-ed43-4210-abee-62c6ae3ed2a5@intel.com>
 <bd507d1e-5d61-4d73-858f-1f44f37431c6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <bd507d1e-5d61-4d73-858f-1f44f37431c6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0019.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::17) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b196e1f-a2a9-4466-deff-08df0cebbabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: P5vOccJtfyvjgTQs2UASaX2Ij+Rlb6zr7Pzh9K2HExPCmXj6cr5SYg6vucMKaOvNX7UhZNUU1TfwxEp6Y6hwx1mubp7vZvlT1eTlU9oCDUS1T2OZYD8R0EtJP1hvs5Q/0DFhYFQJzTvLGEfGcfBmE1wcMXTcoaKRPrB6Pt87Fn6hZEeBwRTRMnr+QQhzwmEuqHn07YJsbget0K6BzxnG+3/s3eSNTnDMIJPzTHvSrj/OYvd9gj7SbGY9fgjnEpW1fTzrnMHmGMm35khVb7RFI5yup4LSs+I3eb7MceRc9o9th+He4Q/GDnSgRYlIXf+RpgYLE3uxDbh7Hqe/wEFxrZm209ARXb5ICDO7mBOkALD9jD9WqnXRKE2E6XYl83xnaU8sscxXVmk0/lJSJGiMmMwxaD4JZxirY2bZByHvmTY5dctiYN3w0q7fUJdfb2JVCFpOyMbLwXSwyxPiJrCjuL9zRMepPnppDKckXzooVPG9HWTA56ZAnFWJBdTCmtFqZWcs92hiYN3Vzru4TIL4j6Ce8o6fWFWhQZAzu5xWRt0SSg19kLsihREHzJPxGvl7F7EhHk8Ad+eMX7a5+iQvk8Wck1DpMS/Oi8q6VLF6HC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1BMVThicFNnQ1VMVndVVitia2ZqdUVYZUhoVHBJQW9ZaEtwMW1TNGk0Wk0w?=
 =?utf-8?B?REY3YXdBWTNNZjVzN0VlWTlWWWJOMU93QUhtaEFzT2RrTlJtcTNZZEdZQ1NU?=
 =?utf-8?B?VnFsNU1VaEZnL1g0aG1FaEtCWnNOUSthOVVWRVljNjRucFN0WHlPdmsrNVdq?=
 =?utf-8?B?Q1ZsMWM1a0ZkbnVQVzkyZ0J5OXYzS25yblR1VVY4RE1oME1meXdwbnRYUFB6?=
 =?utf-8?B?NUh5c25pNUZCVWZ1SXhrZmNYc2VSeXZCSkwrVXl1eWNvR2l0bW9MazBPOGRU?=
 =?utf-8?B?Zk50MEROcE14ajFhb0drVlQxekZOU1R1MllmVkpSTTkrOHkwbFdrN0hmV2FF?=
 =?utf-8?B?RzdTYjBMb0o1elFtV1YrKzdKaUlNWVZWRVE3MElYcVcyaE9VUlluSTdxY0xk?=
 =?utf-8?B?NVR2alhMb3ViV2hiYzBBYUxiVVpKOFhyOVhZem5lZjNqMWNvTUo5cUttNEtv?=
 =?utf-8?B?WHBuSUlWZnlSNlNZUlQyYkVUNndWWi9ybE5YWU5yYkVWYmF3YTdacTN0SmJ4?=
 =?utf-8?B?TlpxMUZaVUxNdVFGR24wSlNKV2F5U2IxbkU2emZXL0pzbEtZR1hxT005djla?=
 =?utf-8?B?c3VRQ2FkaURSTnlKcU1MSjN5T2hKSGFCakVkWWZTUWE2eFoycUxZbzR0UDVz?=
 =?utf-8?B?UzczNUs4VURyWHV0MFNDeC81S3VsRXJsVmxubk56UkFIWkd3b2NBNHQwa21l?=
 =?utf-8?B?aEk3bkEzdkw0ZE5NS2h6bk5QajZGL1pXelBPdHd1MEJBSW1qOXZ4c0owNWEy?=
 =?utf-8?B?WTFRNlRlbWxpcThQOVUwdzZyNUZ5WFZ1dm5vblJQWGdVVWd2ejhiRHlONUJQ?=
 =?utf-8?B?RXhiZjJ3eE4ySHBxYWF4ZlFwSzJJVDdONkdIMG13ZG1FVHNveHhJUTJZYnNk?=
 =?utf-8?B?cWNBNmNPRWNrR2ZFT2psejJMbGRyalFJV1NQZmtNN25UK25iZWg0UWRramt1?=
 =?utf-8?B?MkdweFpjbms1Rm5rdFNyV0dsRzBKRTB6RmlKMmpMNW9XZUdqRkMyOWwvVFBD?=
 =?utf-8?B?dWQ5bzd4NVVxRGpycUE1N2c1MEszRTV4SXkvSTM4eEJwZkRRNmw2ZjUyWGNH?=
 =?utf-8?B?b2JDZXhXc1Q5bDBGZUY2UTFpRHRicjNGOUxEK1VUQjlWUjA5NERmRm1hUXFy?=
 =?utf-8?B?Zy9pOFBrU3ZEYjIyb0xJMEV2a2pMQUcwMmhsT2JNNkRsa2h2NXlROE5hU3JF?=
 =?utf-8?B?NDVwL2poZ1RpeTYwMGdoNkwxakN5cEx5V056aFJUKzhXZGQxMHNYejNRQ0dW?=
 =?utf-8?B?Um0xY3F6RG56TnFmWTM1WGpoUVJIUEs1U002TmZnb1J5UVZUdlRjNTJzNS9v?=
 =?utf-8?B?V05EZWJESGJ2b3hFc3NramNCZDI4OW5NNVZQRE11V0hzUDhRRERoei95OTIv?=
 =?utf-8?B?VXNrTEhMRjREV1RJY0pBNHE5T013cFJmbVN1d3pSVGJhZm9rT1lJRnhEa3Nr?=
 =?utf-8?B?bldObjJHOENFbUV5dHhkWkVuMHd5N1lpVzk4eG90MjVBejBVOTZBL090WFNU?=
 =?utf-8?B?cnVyY0tpOVJlN2twNFd3VnprdzZXNmVkcEJ2dTJPbENMNWV2L3h4eVUwWkxV?=
 =?utf-8?B?TEhNNSszbXZLZ2VaWXVWVCtuS1c2SmhETW8rWmRYVnEyamZXUXVnNTJoQzF0?=
 =?utf-8?B?UGNnblBCT01IUU5vWWU5dmE2c1VMQTBCTmZaNWp3c0NWejljQVhZekd1U3RY?=
 =?utf-8?B?cXBYQ3piUGwrNjhKeDBEeGF4RThVZkJJMjJYSXdWY2ppdmJwSHlnRWRLUWVJ?=
 =?utf-8?B?NzZoNDhPSnExcnFVTVFOMFQrclcwVUNSbVdsOXdoY3I4cmhJbEpSWVVSSUVz?=
 =?utf-8?B?V1pLd3NEemVqNHo1d2N3TE9MNEY5VFo3dVd4c1hkU2RkOWRjSEt0cEtvRzMw?=
 =?utf-8?B?NjhRNlVuYkF2b2FNSHlJeDB3VmlrZHNacjRYNWEvQldhYXVTZG52VFNPak9y?=
 =?utf-8?B?R0NpNnk0bFFOMTZGWWY4dXB4RDRLNnRwek9teUVtV3VMeU1KRGlTQWRRY2Vm?=
 =?utf-8?B?N2JEejZKbkpodit2dExrZDJuYy80eVVRVTR6aFE5ekNxbFBIQTM4R3JtWGtO?=
 =?utf-8?B?Q0dDb2loWUx6Y21jeVhFelJHUjIyNVZIOTI4LzBhYnpJL01hMmpzQkVXNHdy?=
 =?utf-8?B?OXRPM0ttRlhsdzU3UWIzMjB6Y29JS1NCQ1JWWUZsbWE3MElMZjQ0a0I5eUdB?=
 =?utf-8?B?V2tyRmFxazRFaHR4VVVmbWhQSzAvclo0Rkt2Nk5PTlY5aU9CbFQ2RWluSFJU?=
 =?utf-8?B?UEhsQ3Nmejl2NVJJeVJ6N2lnSDdjS1ZxUjI2eitJQ0t3K2p6dVRyZUZPeGhN?=
 =?utf-8?B?MEZZUmNhc3JGcG1WMmR4UzVBVS9NRXF2QS9ORHQ5bzNYOG10M0haWkZ0cG9k?=
 =?utf-8?Q?B+Pd10fpnQSlKnPw=3D?=
X-Exchange-RoutingPolicyChecked: Qh2wKTbtVhADX4X1Rw4qE8Y3oKMpsJYPkGoI2ZXAnyeqnl55Nx9L9SDCjXn9xTNZsMumPSwprekHtGSchWQo+B7CPM9FM0c3vwK77XI7NtW1MIfvQkr2hu/yo1the6zhPli/NNsx3QydBbEWSJfyhU8HEpwV6viqiXJvGU6YIqHpr8BOGuPf3hdEPpP8ztojyVU+38h8pPcZ1Ir3hOLcLp4DVZUxyg+H5Xf3JQcwr+c8xg2KKedajrMPHd+ww834Q4ZjvvuizY0nPQT2It7y2dsnyAzsZWZVEGBhg/SQmiUBFyf/GWBJqA8Oy7NgCQj4CnhNYA/s0mNYKs25VkWmNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b196e1f-a2a9-4466-deff-08df0cebbabb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:24:30.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0YjiDfv0ziIJjtd3Wjzizn+dIutSdf+924Y1LPPlXmBT7UsdZTB27/vS79lDuAso9i5tzdH15+MXO1yrAZzgx2RhT1Wv6OPmXxeXlc4aSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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



On 9/7/2026 3:52 PM, Tauro, Riana wrote:
> 
> On 04-09-2026 17:27, Michal Wajdeczko wrote:
>>
>> On 9/4/2026 1:11 PM, Tauro, Riana wrote:
>>> On 04-09-2026 15:48, Mallesh, Koujalagi wrote:
>>>> On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>>>>> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>>>>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>>>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>>>>>> Hi Mallesh/Michal
>>>>>>>>>
>>>>>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>>>>>>>>> and update callers to use xe_log_err() with the propagated error code.
>>>>>>>>> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
>>>>>>>>> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
>>>>>>>>> Am i missing something?
>>>>>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>>>>>
>>>>>>>>    * A single underlying failure therefore legitimately produces a
>>>>>>>>    * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>>>>>>>>    * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>>>>>>>>    * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>>>>>>>>    * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>>>>>>>>    * follow a fault from origin to final effect; it is not a duplicate.
>>>>>>>>
>>>>>>>> so in this case, some sysctrl timeout may eventually lead to a reset and/or
>>>>>>>> wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
>>>>>>>> help in any postmortem triage, and if we don't reach that final state then
>>>>>>>> we can still provide some generic resolution based on site and errno (COLLECT)
>>>>>>> What if the paths are also used in non-critical scenarios for ex: sysctrl commands are used for
>>>>>>> general counter telemetry, gpu health querying and firmware status.
>>>>>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some unrelated failure ..
>>>>>>> Why not only add sigid for critical paths when we are sure it will cause a chain of failure
>>>>>>> instead of these prints on every trivial command failure.
>>>>>> Ops I miss this.
>>>>>>
>>>>>> I agree that we should not add SIGID for every minor or noisy failure. The intent is not to log every non-critical cases,
>>>>>>
>>>>>> but to capture important intermediate failures that can help explain the real root cause. If we log only the final critical
>>>>>>
>>>>>> failure, we may miss the earlier cases that actually caused the issue. That makes triage and postmortem harder, since
>>>>>>
>>>>>> we lose visibility into how the failure occurred. The idea is to use SIGID only for meaningful failure in key execution paths.
>>>>>>
>>>>>> Even when these failure are not fatal, they can provide valuable context, make debugging easier and reduce
>>>>>>
>>>>>> mean-time-to triage (MTTT).
>>>>>
>>>>> Suppose a user uses invalid entries for gpu health or counter management, won't we be polluting the dmesg
>>>>> logs with sig id and cper logs unnecessarily since these are not fatal.
>>>> No, we should not emit SIGID/CPER for bad user input  or invalid query parameters in gpu health/counter management path.
>>> But the system controller interface is same for all where you have added sig id logs. A failure in sysctrl_send_cmd or receive/send frames will be
>>> displayed in general non fatal cases too. And it could be due to invalid request.
>>>
>>> This is not a call chain that leads to a critical failure always. Need conclusion on this because one of my patch has a similar condition.
>> we can discuss what to do in case of explicit error (failure) codes returned by the FW on specific commands, as it looks that unlike the GuC, such errors/failures could be caused by the invalid data provided by the user.
>>
>> but IMO if the FW sends corrupted frames, which I assume is a part of the low-level FW communication channel, or we can't send some random command to FW - isn't that a good indication that there is a problem with the FW communication that should be reported?
> 
> In that case, shouldn't sigid be applicable to guc, huc, i2c and all low level failures.

it is applicable, see pending series [1]

[1] https://patchwork.freedesktop.org/series/173177/


>  What would be the documented recovery mechanism in case one of these fails especially if it is a one time occurence?

in case of GuC I assume we already trigger a GT reset, which logs its own SIGID
and if that fails, then we wedge, again logged with its own SIGID
so all 3x SIGID reports gives us a better picture what just happen

> Wouldn't this approach result in excessive numeric logging and sigid being used in the entire driver ? 

in general we don't expect any failures, but if something fails, IMO we should report any abnormal situation
so yes, all FW/HW errors that we today report with xe_err() should likely be converted to xe_log_err() family

> From what i understood in the initial series and mallesh's response, this was meant for errors that require a recovery
> or fatal errors. Am i missing something here?

then we would just need either PROBE or WEDGED/SURVABILITY logs, as only those are fatal, no?

but since we have RUNTIME/DEVICE FW SIGIDs, when should we use them if not for the error conditions related to code that interacts with that FW?

> 
>>
>>> Riana
>>>
>>>> These are usage errors, not real device or firmware failures.
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> -/Mallesh
>>>>
>>>>> Thanks
>>>>> Riana
>>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> -/Mallesh
>>>>>>
>>>>>>> Thanks
>>>>>>> Riana
>>>>>>>
>>>>>>>>> How do these errors indicate the need for a resolution.
>>>>>>>>> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>> Riana
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>>>>>>>>>     1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>>>       #include "regs/xe_sysctrl_regs.h"
>>>>>>>>>>     #include "xe_device.h"
>>>>>>>>>> +#include "xe_log.h"
>>>>>>>>>>     #include "xe_mmio.h"
>>>>>>>>>>     #include "xe_pm.h"
>>>>>>>>>>     #include "xe_printk.h"
>>>>>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>>>>>     #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>>>>>         FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>>>>>     -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>> -                   unsigned int timeout_ms)
>>>>>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>> +                  unsigned int timeout_ms)
>>>>>>>>>>     {
>>>>>>>>>> -    int ret;
>>>>>>>>>> -
>>>>>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>>>                      timeout_ms * 1000, NULL, false);
>>>>>>>>>> -
>>>>>>>>>> -    return ret == 0;
>>>>>>>>>>     }
>>>>>>>>>>       static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>>         struct xe_device *xe = sc_to_xe(sc);
>>>>>>>>>>         u32 ctrl_reg, total_frames, frame;
>>>>>>>>>>         size_t bytes_sent, frame_size;
>>>>>>>>>> +    int ret;
>>>>>>>>>>           total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>>>>>     -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>>>>>> -        return -EBUSY;
>>>>>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>>> +    if (ret) {
>>>>>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>>>>>> +        return ret;
>>>>>>>>>>         }
>>>>>>>>>>           sc->phase_bit ^= 1;
>>>>>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>>               xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>>>>>     -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>>>>>>>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>>> +        if (ret) {
>>>>>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>>>>>>>>>                 sc->phase_bit = 0;
>>>>>>>>>> -            return -ETIMEDOUT;
>>>>>>>>>> +            return ret;
>>>>>>>>>>             }
>>>>>>>>>>               bytes_sent += frame_size;

