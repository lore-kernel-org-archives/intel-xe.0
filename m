Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B178ED49C6F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5C10E17E;
	Fri, 30 Jan 2026 08:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOBJUdl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A659510E17E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769761095; x=1801297095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SUsMgYI2AOiqR7rtp3N2M0qJpB33qRFGiACjEJJdpOU=;
 b=IOBJUdl5t/e85sL70FCnRlj+u+/DEt5QKdC1ShfTVvRqCk0pbzfoMZUI
 vQCphVvGn7zmUALFCCFELX0Bul0YNWQiWDz28g/d4Q1Jta3cGHGT/R5JC
 YJe2UXL9zblB360mDQmx4iLUm8zst4Rn0kLn6mPNlu0YITSNvMBuFCtND
 WzfjMLiekqG5cD9FIS+CD3TYtzNhK3bK0qG73ZnvCwoK0WaacDf8uFchU
 YXhp/qLRQJRPiICcDCeNQSf3ZHRYEq7K2Ke1ltkolZFX4rcmyyOu9wjOc
 ZxVGwX/8zX0geIbbQOIemxUyoDE/yVYimOnXPWBRPIUvpLGtd+pzT4ciF w==;
X-CSE-ConnectionGUID: 2ir+s235QI6x1qjRwtA1qA==
X-CSE-MsgGUID: qm6ipiFASoms3gwDpIkR7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74861621"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74861621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:18:00 -0800
X-CSE-ConnectionGUID: tpHkJ8pfSoG7a5TxYmK+rQ==
X-CSE-MsgGUID: Ky35MN0eTTm8Y6PfJzxWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213750601"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:17:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:17:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:17:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCuIN+YynwOMHzqdeDiquqvGe2hpKRMumX1WaV30nwob8Wc8b5Xs6CQteOQWH7SoTJahf2OgH++5jFWDHW2iv5ANY5Oj1HD9t7H/55piXn5+g0jyZDDVsgsbT3mPhKIQwQVcXpXo+McJxebw6MVQCHuwjk9RJL8ppkHLtKlhC495gLmgPvdMEdBXPWkQADMkPXiPu0FH9g8QcCYY7mwuVrZY0v20Vo8YbRwQ4ZXLD0pkq4Rhyh5j3b4F04O8rT6lFLPmuAPJ7fuTHs1fVTn6nDGU9XSYhu0xrn8e4gvepGc461RzZddrpcY11jJ6PvcPus3AWpuAMIWYC8OdedE2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Otq84U/7O5JaD7OKYzeuAl3wiPMtgWbhk8BIYoQwmPo=;
 b=G3kzd7TWVmeeTCbwCOuHpGSWc6V1Qne/eFFSRQKui3H9oVWttrLEjMaDRXqKu9cqdZCMd0X2ibEE+yCEqV4HnShle0PFaNhkO8wCHhxhvQrN3j8JvMKmkahPQ+iukcImzY5lI7e6v9ydnFS+qHnU0uuNQ9cwXR2jcwDCobSE5KWl0hRZ4OxI50D8f68R2FPPPMwhF/L4noJcO6DMAAp+QRrdQv6hjnRb0kCm8SPUZ5l14tvYVRnlZFANYI0nbRo8KkY/xeGQSmJtet1T/eWCkG2kzQPissgaNmmM4jve5omdD/gKmkSd7Sbg3MfdCuvqHGGFpSjr1fdJWyvdSF4Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:17:50 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:17:50 +0000
Message-ID: <4489e6d4-e1b7-42aa-88a0-c189944525a2@intel.com>
Date: Fri, 30 Jan 2026 13:47:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/vm: Prevent binding of purged buffer objects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-6-arvind.yadav@intel.com>
 <aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com>
 <7614efa2-b126-4fa6-8213-a8cd764e4419@intel.com>
 <bedb36f03c7e82ffca688a1ba69929a343bc4f37.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <bedb36f03c7e82ffca688a1ba69929a343bc4f37.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::16) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 328d2cab-7bbf-43e8-8960-08de5fd80eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am9jZVVPRE5mUHdZVURMejAyaUxoOVB6aWg5cUJ5ZW0xcVRYS21tTXZFRVZP?=
 =?utf-8?B?eG9iaHFuWGlpNzY1amtFR2pxNXRWVWQzMys3YVdVcWVMY211cEcyOURuY2g4?=
 =?utf-8?B?SFUyRmRmeEY2aG1HZmFBeWFkS1Qyb2NHMTdhWmlEbS9Rc21oaDBtY0plck5x?=
 =?utf-8?B?bzRiUmtyM0ZrOXg4STlZTHE5NGJLZFdMS2VDMkVnU092b29GamJmTEFRVGNT?=
 =?utf-8?B?OXNwVXdjRVNGcWRPK0ZQRXFWb3VieERtck56Tk1YbDI4bFVEOTBYbW9CYjJI?=
 =?utf-8?B?Tys1bks5S0RpQzFVZFltMGtzcFlKTlFSdWN4cWJoMzJPVmR5MnlNb3ZxUEt5?=
 =?utf-8?B?QmVZK1R0aWZpQTV5Z2xxejlEYnhzSjdKdUN0NWlaSGVWbE9mMGFnYzF0NVYw?=
 =?utf-8?B?anh0d01VeFNsRDNRMTJXNWxiZjl0Mk5Ya2oxUzIrZ3k3RlpmdUhqYlBQTW1I?=
 =?utf-8?B?ellQV3JJcTRlZUZ3VUhhTGJvTjBkYWs0cllBVFA2dW5JTDJ2SDl2QzhRcHZL?=
 =?utf-8?B?akNaaTlrei9qWXF3NzUrMGg4WlVSU2V2Z0swQU5DUFZLQzB4K3o5RVVXUU00?=
 =?utf-8?B?MUxxY1M2MTU2S2NEelFRL0xoQ0dyay9Ra0lyOFh3VEpYZUR0MVJ3MkxiOUNq?=
 =?utf-8?B?cmFzSmJrUE5teXpEamMzd05haVgwQzhHVGVyWGhmejlDNWJBa3U0WmxtVGhW?=
 =?utf-8?B?cXYyRG12RlM4eC84b3dXd0U1VThtVTlFc2dZMVRxY0FuK2dQTno3TUJRQmg2?=
 =?utf-8?B?SGNrcmhRejdrN0piTFJTY0laYnNtREpKN0s1QkRLVTZJWnR3TS8xMUM1dWdG?=
 =?utf-8?B?QnF2OGVyTVRyWi9RSEZ0a0RYZXhXcXJCaGNwQmgyeXVvZXhrUVRxTnZOOTJa?=
 =?utf-8?B?eDI0SzV6RGdJK21lbVd3RU1VMW1hMFhZbTVjYjdPZ2ozWlFrdCtuQ1N3VmR6?=
 =?utf-8?B?dEFlMzlvaDE5S0VwamtjSVJrUHZtcXNYRUcyYkkzSGhEemVxbmg2bmdYelNl?=
 =?utf-8?B?eThSMHphSTIwMFlPSDVpUi9qRmVpYkUveGNwSERxS2pBaDg3Y2pTbzl4ak9o?=
 =?utf-8?B?SXNlQlJlSHZWVWNMdEhUOHVkTXVmWUdWYUNuT3VyNFgzTTBpKzRpTnRmSHkx?=
 =?utf-8?B?Y3dYQ1FPdS9ZNlJtT2lqeEY2S2pIZ3Bpdnl0TkZ2dTA4RngyQzlJc1lBdmFv?=
 =?utf-8?B?UllPM1l6QTZEZmFuVTBXUFpyTDY3c1dhYUxzTkp4d0lQZ3NSRjlXOUNqay9w?=
 =?utf-8?B?cEdCS2tGM3daeFJ3NFdnb2tGNHpISm94OXlwVjB1NkVITHRza2YvSkdJT3J1?=
 =?utf-8?B?ck0ybjBvQ1Axckp3VFVvaWJMTFBSVmdrV1EzdWUxSjVZZ25YS1dJWUJOYmZH?=
 =?utf-8?B?cCtvN2p1QjA0dDIvWjlRZ0FPTWtnSFFpMk5JOEJYUEVEbE1kN0hsR2tjUDdQ?=
 =?utf-8?B?NHU1d2I0WGhmUDhjSE5RRHVHWCtLblhGV3Q1ZCtFWnJEVlp1anVzVXA3NnFp?=
 =?utf-8?B?N0FFS2dBMVJhQVNvekR0WVlwS3RGWlRQYUd2VjhmM3Nhcm5FZ2ZrN2RuL0dv?=
 =?utf-8?B?UnIzNmdBa3Uwc05mTFl1elhaaXlWL0ZkVi9ucHV4OUpGVWEwcUpGLzVaczha?=
 =?utf-8?B?K1hDN1J3b3VEeEJrMEhzZytORzN3THI0V2ZSK3l5emZYK2JuQjFKSFlsUW14?=
 =?utf-8?B?elI1YnlRM0UyZS9Fdk5DdUN3VEdQeERQUjd2VCtYbk92TTdqOExPODg4cWsy?=
 =?utf-8?B?Zm9GdXVFektzTkZrdXpaS0VaUjROS1F0ZkJuY2F0NEN2VytJLzJIYlVZdUNi?=
 =?utf-8?B?Q2NPbWRoRjh1cDRJTlRqczZqMTE2ODJINlRHT0pTRkxXZEduTU9QOVh2NUpw?=
 =?utf-8?B?Mmh5a2lCT09hbzM4U0JBUEwra1dNWGFSalhiUzlnT2pnbGU1YjVPYUFhMlhL?=
 =?utf-8?B?QTlBQ2d6eE1pZXlSVnRZZDlYSmQ1dG1nU3dyMitUNUJjUWQwMGhqWXEwNjFP?=
 =?utf-8?B?alVkYmhEQW5UeVUrMExENmdnOEtDRDhpWXJUbm5tdGVnSlhSa1k2M1F1K3VJ?=
 =?utf-8?B?dHJjZFBZR05Hb0dJLzdHR2ZWck05Vjd0OFdiMWlvTUtocUIrL0dvUjNYcWdX?=
 =?utf-8?Q?bYqc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hCU0FJTVg0S2xDTzNaaEEvVVdrT1ZwQVlkM2QwMWJzTzhxRWVhOGVISk5D?=
 =?utf-8?B?ZkxINDNRYW9wTU5CVGp4WXlydnBQa0Z2TmVpODVmeTZJZHdWVEdybjM5ZWZi?=
 =?utf-8?B?MlVlRVloY1h6R0Q5eVRCQzVKL0tjVXUrRjRJajJpT0pidWRhcGJ5aDByVGY0?=
 =?utf-8?B?TFcwZEFLeHVEaWxOR1FwTGkzbktyakRSUnFHSVJ0WEVoMURNUVVra3ZpbXdD?=
 =?utf-8?B?Nm4wdFhEZFU5d2FpMzBIMm5qQ3NickZiSFlwQ0dDa1lyeFlQVVZ5eXFMZnA2?=
 =?utf-8?B?RmZPUUpCeDZXdTdDRS82VldnMytwNjc0bXhIcTd2Vi82NDk1bk9XbjRLMVU4?=
 =?utf-8?B?aUVlNFFYd2NXbFoxeEM5THRyN1JabEE4NFlYTEFNNm81UE1kd3VyQjZIUzFp?=
 =?utf-8?B?NEJSUmUzQ1J5WndETXRNZGpTTXgzNEIrMy8xR1lKYmFrWXh2MWxXbkZMcWhZ?=
 =?utf-8?B?Vy9pdVdNQkg2bnpWVHhKOXRwQllIdGNsTUhkZjFnQVJoU0JuNHJaczRXMUdo?=
 =?utf-8?B?M1JDb044bFlGSTZsblFZN3piNGxOaG9DbDdRelNUNFZmLzNXQm9la1VNT0Vz?=
 =?utf-8?B?WVozcENMdFBJcW1vbWZzRVJaZW9EVFRZVzYzVllua2xZdUJ3angvREQxUHJH?=
 =?utf-8?B?UzhIZ3ZNMmJUNmM0VGYzZGp4U2ZOMFZ0K0hZMi9vcGxMMWUzZXd5L0tOM0p2?=
 =?utf-8?B?M2lNTjdZckJOMnNlM3NOV1lEc1VJM094bmoySDNNNjVyckttMGJtU2Roa2Mv?=
 =?utf-8?B?WkdKWUNzMG94MmdRZlQ5Zmo0dnJWcmcrK1UreUNyc2FPMXJEUHM4ZFRrbENx?=
 =?utf-8?B?SWVBMUcrUUFOOGEyK1JPazVGOUFIbkppeSt4THZ5RXZrNDg4SnVUUTBPQUZo?=
 =?utf-8?B?amJRMXZkQndnK2hDb09ZbjBLNGNZc0ZzT0NPTkhqeFVVcTZ0WS94cEx5cWU2?=
 =?utf-8?B?eFNSQ2hjNVV6SXVIUmZaUFY3YThjVFlScFBHQVBSOXlnaEFqQ1JSU0RJMEN2?=
 =?utf-8?B?NFgveXoxSDVEekFwK3BRUTRrZHhLT1g0VnU4WjVHWDJkUFBIYnJhQnVWcXpO?=
 =?utf-8?B?Qm1VQ0FMbTJlR0pNVGpOOUNGYkpzbnIwakw3d3lhQ3M3dGx4Y0lmRXhDN29o?=
 =?utf-8?B?VHY5QkpSZERzRmJuTHFyZTI0c0M5L3NvTGdCcEpYcGZ4NmU2alFJbS9VdW5V?=
 =?utf-8?B?ejVETTVVREZMVmpOTk9UdzkzVEZMV2hLNjFyeUhEZVNXeDBFTWJJSk5Vd3E3?=
 =?utf-8?B?WnNlWlZYODFaTThIOWdCVVoyTklxYkNiTUs2d2gzS01qVlR5bEVXYTl2L2Qv?=
 =?utf-8?B?K1g4aVZMTHJhaWhZTnlFUkxaNmJnRzFja0FFSWRSZ0lTUVJ0U0NGTlZJMHY4?=
 =?utf-8?B?TVlQYncrZGd6OUV5THVmc0hzcTh0NEpoTldndmtrRDEwc2ovRU1Zb2JYVmpH?=
 =?utf-8?B?eGdoQWpLamFrS09zTC9FSUpYOHZBUWhjNjFQOXk1bGVrVUhsOHViZ0oxL1E0?=
 =?utf-8?B?dGNFTW9pQjl0N0FpY243UHdURWFwQkhTTEhxaVFvK2dvNFAwM0MraVozSVVU?=
 =?utf-8?B?eGxjMGppUEttVVJMeGRNTTBPdFZ6Sm9RT3c2Y3AvTlJHQ2tlWUowNDN4bjJM?=
 =?utf-8?B?eFh0WHZMYTBLV0pFMk9qQWZkZ0UzYnMzcDUxNDdjZXB0U0kzSVVNRXQzeVd3?=
 =?utf-8?B?cERhMExmbXVzSWZKRDY1U1FhK21Yc3hpbitjbE9rejROWHFYZHpRdEY5azJG?=
 =?utf-8?B?OFd1cmtuR2lsUHhpQms1a3RGTkpCOU9TdVlXYm5NSVkrbWZGM0trZS9UdW56?=
 =?utf-8?B?bWlFNFd0ZEhScDNxU21KTzM2UzRaS21Bek8vbVJJK0Uva0NRZ2xXNGNXRnNT?=
 =?utf-8?B?YnpKQStsdjk2R3NKY0Q0Mm1jVG5odHpEaFNiU090U202eDNOZk1ndXQ1bFZa?=
 =?utf-8?B?b1dTOGlGVVEveDJqY3dPNGdvdWtUTjd5L1pGUnp3V25CK3RmMlNNZWZMNHdY?=
 =?utf-8?B?aUQ0WnE4MWdvb0E1azFpbEV2bnZFbElFU1Q1MzFyQjloS0xOMlZxS3p1RkdC?=
 =?utf-8?B?MW9RUE9ySjBwSWU2dGdsQk0rR2dmaFBkdlZNek5sL2l2dmk2cVY1cFBHYW5L?=
 =?utf-8?B?djcxZDd4RkVoZnNIckptZmcrTFFTQ1gyeHdqaUVDNzhqQ2VJNkwwNWY2OHNK?=
 =?utf-8?B?OG1QUktCZWkwb29RbnRkQnAxZE1FWEpGWndmZExzeDhMbUxBY3Yrc2NEb2Nj?=
 =?utf-8?B?aTVRaW5EeEpOQzZEczZFeWhYUTRQUTUvTlhia3VUTUVMV000VnZxR0h0Z09K?=
 =?utf-8?B?ek95SzYxWnZ1Wk9NK3VKRW1WZVlmZ3U1aXZtam9nNkd2TDh1TlNkQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 328d2cab-7bbf-43e8-8960-08de5fd80eb2
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:17:50.1776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbHj/qkcrT64UcUk5xh8qYVLJIkpDKZ1H/isfipF3tb3SRAGReqzNRZ2Ij2/hA5a5O3DAazad6zc6jmfFrdpLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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


On 23-01-2026 18:07, Thomas Hellström wrote:
> On Fri, 2026-01-23 at 11:11 +0530, Yadav, Arvind wrote:
>> On 20-01-2026 22:57, Matthew Brost wrote:
>>> On Tue, Jan 20, 2026 at 11:38:51AM +0530, Arvind Yadav wrote:
>>>> Add check_purged parameter to vma_lock_and_validate() to block
>>>> new mapping operations on purged BOs while allowing cleanup
>>>> operations to proceed.
>>>>
>>>> Purged BOs have their backing pages freed by the kernel. New
>>>> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
>>>> -EINVAL to prevent GPU access to invalid memory. Cleanup
>>>> operations (UNMAP) must be allowed so applications can release
>>>> resources after detecting purge via the retained field.
>>>>
>>>> REMAP operations require mixed handling - reject new prev/next
>>>> VMAs if the BO is purged, but allow the unmap portion to proceed
>>>> for cleanup.
>>>>
>>>> The check_purged parameter distinguishes between these cases:
>>>> true for new mappings (must reject), false for cleanup (allow).
>>>>
>>>> v2:
>>>>     - Clarify that purged BOs are permanently invalid (i915
>>>> semantics)
>>>>     - Remove incorrect claim about madvise(WILLNEED) restoring
>>>> purged BOs
>>>>
>>>> v3:
>>>>     - Move xe_bo_is_purged check under vma_lock_and_validate
>>>> (Matthew Brost)
>>>>     - Add check_purged parameter to distinguish new mappings from
>>>> cleanup
>>>>     - Allow UNMAP operations to prevent resource leaks
>>>>     - Handle REMAP operation's dual nature (cleanup + new
>>>> mappings)
>>>>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
>>>>    1 file changed, 13 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>> b/drivers/gpu/drm/xe/xe_vm.c
>>>> index c3a5fe76ff96..f250daae3012 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2883,7 +2883,7 @@ static void vm_bind_ioctl_ops_unwind(struct
>>>> xe_vm *vm,
>>>>    }
>>>>
>>>>    static int vma_lock_and_validate(struct drm_exec *exec, struct
>>>> xe_vma *vma,
>>>> -				 bool res_evict, bool validate)
>>>> +				 bool res_evict, bool validate,
>>>> bool check_purged)
>>> It probably time to add something like this to avoid transposing
>>> arguments.
>>>
>>> struct lock_and_validate_flags {
>>> 	bool res_evict;
>>> 	bool validate;
>>> 	bool check_purged;
>>> };
>>>
>>> Logic in the patch looks correct though.
>>
>> Noted, I will add "struct xe_lock_and_validate_flags" Thanks, Arvind
> Note that if you follow the pattern of struct xe_bo_shink_flags,
> passing the struct as a const and using
>
> struct lock_and_validate_flags {
> 	u32 res_evict : 1;
>          u32 validate : 1;
>          u32 check_purged : 1;
> };
>
> This will be more or less equivalent to passing a bit-field with type-
> checking.
>
> Some reviewers frown on using "bool" in compound types although we
> accept that in the xe driver.


Noted, I will do the changes as per suggestion..


Thanks,
Arvind

> Otherwise patch LGTM as well.
>
> /Thomas
>
>
>>> Matt
>>>
>>>>    {
>>>>    	struct xe_bo *bo = xe_vma_bo(vma);
>>>>    	struct xe_vm *vm = xe_vma_vm(vma);
>>>> @@ -2892,6 +2892,11 @@ static int vma_lock_and_validate(struct
>>>> drm_exec *exec, struct xe_vma *vma,
>>>>    	if (bo) {
>>>>    		if (!bo->vm)
>>>>    			err = drm_exec_lock_obj(exec, &bo-
>>>>> ttm.base);
>>>> +
>>>> +		/* Reject new mappings to purged BOs; allow
>>>> cleanup operations */
>>>> +		if (!err && check_purged && xe_bo_is_purged(bo))
>>>> +			err = -EINVAL;
>>>> +
>>>>    		if (!err && validate)
>>>>    			err = xe_bo_validate(bo, vm,
>>>>    					
>>>> !xe_vm_in_preempt_fence_mode(vm) &&
>>>> @@ -2990,7 +2995,8 @@ static int op_lock_and_prep(struct drm_exec
>>>> *exec, struct xe_vm *vm,
>>>>    			err = vma_lock_and_validate(exec, op-
>>>>> map.vma,
>>>>    						    res_evict,
>>>>    						
>>>> !xe_vm_in_fault_mode(vm) ||
>>>> -						    op-
>>>>> map.immediate);
>>>> +						    op-
>>>>> map.immediate,
>>>> +						    true);
>>>>    		break;
>>>>    	case DRM_GPUVA_OP_REMAP:
>>>>    		err = check_ufence(gpuva_to_vma(op-
>>>>> base.remap.unmap->va));
>>>> @@ -2999,13 +3005,13 @@ static int op_lock_and_prep(struct
>>>> drm_exec *exec, struct xe_vm *vm,
>>>>    
>>>>    		err = vma_lock_and_validate(exec,
>>>>    					    gpuva_to_vma(op-
>>>>> base.remap.unmap->va),
>>>> -					    res_evict, false);
>>>> +					    res_evict, false,
>>>> false);
>>>>    		if (!err && op->remap.prev)
>>>>    			err = vma_lock_and_validate(exec, op-
>>>>> remap.prev,
>>>> -						    res_evict,
>>>> true);
>>>> +						    res_evict,
>>>> true, true);
>>>>    		if (!err && op->remap.next)
>>>>    			err = vma_lock_and_validate(exec, op-
>>>>> remap.next,
>>>> -						    res_evict,
>>>> true);
>>>> +						    res_evict,
>>>> true, true);
>>>>    		break;
>>>>    	case DRM_GPUVA_OP_UNMAP:
>>>>    		err = check_ufence(gpuva_to_vma(op-
>>>>> base.unmap.va));
>>>> @@ -3014,7 +3020,7 @@ static int op_lock_and_prep(struct drm_exec
>>>> *exec, struct xe_vm *vm,
>>>>    
>>>>    		err = vma_lock_and_validate(exec,
>>>>    					    gpuva_to_vma(op-
>>>>> base.unmap.va),
>>>> -					    res_evict, false);
>>>> +					    res_evict, false,
>>>> false);
>>>>    		break;
>>>>    	case DRM_GPUVA_OP_PREFETCH:
>>>>    	{
>>>> @@ -3029,7 +3035,7 @@ static int op_lock_and_prep(struct drm_exec
>>>> *exec, struct xe_vm *vm,
>>>>    
>>>>    		err = vma_lock_and_validate(exec,
>>>>    					    gpuva_to_vma(op-
>>>>> base.prefetch.va),
>>>> -					    res_evict, false);
>>>> +					    res_evict, false,
>>>> true);
>>>>    		if (!err && !xe_vma_has_no_bo(vma))
>>>>    			err = xe_bo_migrate(xe_vma_bo(vma),
>>>>    					
>>>> region_to_mem_type[region],
>>>> -- 
>>>> 2.43.0
