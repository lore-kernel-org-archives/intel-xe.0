Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E91606A323
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hD9Dgchx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KedvivCK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71E10FAA0;
	Fri, 27 Nov 2026 05:59:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8A410FAA0;
 Fri, 27 Nov 2026 05:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759187; x=1827295187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bLymXtgnfDhLYj7DE8zUE8suCnyduWNpz0f2irVWrgY=;
 b=hD9Dgchxwn6TDjbm2emPtZ8TRwGsVrG096xL2Wz0s9Saktwm16F/T7i4
 WPYwqnGSSaldg0ztrwZ46P5l7Sz7sGJCf6tCTFsMSiwGojGcod0LUGl1D
 v1N6RqlWDnI0ksTuRchsreY9998dWs9n4purZQVjKLs4njmhNxljRbRVT
 0JpA2IjU1ZYGk2RHgTz93vkOPEp02GfDjawT+GhlSjcojscLup9XijBY/
 igvHf+WFOLZDGBl1zdvEgnPxBxPCcPYdGsjtZBZg0vO+xNeaUd9mccZ2h
 n4woCJCmH1QU8dQYHc+qcPo8i+h0VXS0JbIJuzmBnJypbaJXDRU4Ti+hd A==;
X-CSE-ConnectionGUID: eVFKlOn2Qc6NAZxt9CJ0sw==
X-CSE-MsgGUID: gHFubpqmQzGqOweC+p2RVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4576154"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4576154"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:59:46 -0800
X-CSE-ConnectionGUID: idWyToD0QG+Y+sz08EtC3Q==
X-CSE-MsgGUID: QKMVGoK1SUaFsw7KFgw1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14360495"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:59:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:59:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:59:44 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:59:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX5vPcOzx98cRbZ3lSfNMrCyCVJLwAWOwSDqVUM/OYeLvtREuFZ/PL4bRlKLZQWVeZW6Up+crhh8VOlnotzewJ8BFVjuwAPkDwYdObLG+gNRBKaOGLR4aNAKkO/bo6D5TiCJ87aKZSm09Knlblof4GdpuAsjxLpO9u1Oot7K88mcoy9yggqPZpYUuCLAmrWl7dYEzWAOS5DHavJiyWVMk+7waLF23rcFbp0vYgByqFSHgNDVQnkf1zQA87GMbDeF42aMfF7iRhq4qx7OW3mlJUHD5QAQUMzWNj9236dPL7Np0H3nUUvHGjrU2PAPIIDAfQuMwgChoQbI/6TxLlaWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n865bq+waubeQs5cqx+BfXlSS0IEL/fsITGin2ZtuVk=;
 b=Qk3Bo6SWEM6pCMejqsJhNFWdRyeq0ql6j6pFBYZE/JgXSgppnaF1n8IsLMBRvgh5tjs3TrOllERfB6MVWur/CoCrU4lsf+avNIC23xbgGtLE6Lp/CwFPQ9YZm7AcboVvFYz2LvixN3nlUVKzQKH4UF5m5zD3x7ja1wbCVofROiETZhudnc+lIoIpaZZhZBhMkZ/b+rCtSDr+vgcowRT9fueUAoT6ExZYxxTHu0mOfTcELrflWht7wqRSxmWPiBtaX8FQjZmnWMwyVWNlbhyIlc2ySHT9NEVoQAAg24caPK7gFit6cdQzMDrNrd+8fPLcvYwJjuVrvtrQUUEvDAF9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n865bq+waubeQs5cqx+BfXlSS0IEL/fsITGin2ZtuVk=;
 b=KedvivCKbLDOnZdVsMGFdFXj6FQxsh16BlZkD7VRLWbd+HC+y6lXygDvUgmPia3zwlNWTpLQxlyq1HxTURe3HPXS/rYY+bmtLg1Xg6+bnBoKDu5aoDZKIakDRmpRN6V/lihdyY5rC6lIm1kTCRZeNsKLJpSoNcSsfmlg23OPQhc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:59:41 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:59:41 +0000
Message-ID: <9bc78620-d227-4c44-960a-fc9f0540c6a9@intel.com>
Date: Fri, 27 Nov 2026 11:29:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] drm/i915/vrr: Extract vrr_safe_window_end()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-10-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 304f0a5c-4cf0-4065-c2c9-08df4c4ba0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kmg7WhgORQoN2ioGjSiIqaUIO/vcysZjEx5N66EzhfTNpltrJMhYPHILqBxIZPA9MjkrHMTv+V94zBaShp09Zkr42BHKD5XfXGK0k1uTRKMauzKQpT+ZA+xv4rt1kThOd1Fi8ZVgEf6uJYCjT32rwvU4OXuVb48Mx323uLzGkHiBghtYr56cIW8L1iOflATf848GV2hhCdyK6PeGdqoM+mbIFEtQoG/+uLDsARynvThiJNeagadiJoq8x/uVxnXzjxqLoIJ4lQSq1RIlLRMnS0vzWYVTRjOVO03LBi1M+VS2OBbwWFJIQSTnLEvF3Y8Gqgl9GHVrv904+SnEXqoL+oIXOjL7rGG8pUbjiAHjaXst5lTJPHe5w6/kZnjzgMNOv5pTLohyASlE44uIAWftwJI5A8fFLA/x2x1uc9cFz677hvPzNt2lVlwRLCcXHCcN6O/80V9duySyOTAZKJpb9N6y/nrUgvWdwtQBywIF5gm+USx/8k+KVVvurTLFtbciPZs26Lx1Jkle74h6pTWRySJEMFPj3MrWcKaDZn+rRCZ8a4SYGhU0vcfoK+XHxQtZS02rsxk/ZqT51WEDbikVXZdC40EQgpQmZJNpXA9dHvoUVtYfeg0JiI9fTHfUHxLyjk3F8tPRIeOOcaE1U1KFmFJxN3tXnkXw1cNPg1Olbac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEt1bnB4aWdiNWx3ejhLUGxYbitNZjM0TG5LazQrbHlaQ0Y3eWJacmQ4TnpZ?=
 =?utf-8?B?Q0ZNZkRwejcwT2xJb1poc3ZGOWtzbXJ4ZzloSWduOXVIMC96YmFHTmVXdUlx?=
 =?utf-8?B?OU8zQldpdlFkUVQwQ1pMaXBCMGx3NzJDazdZeXJ2MElaVkdYRk94aU9LRHIz?=
 =?utf-8?B?b2tCUzZ6azBRbHYxcm92bjdmb2hkTFMzZFVEeVlob2plQUNvb0RmaXpHMlJE?=
 =?utf-8?B?Z1ViSEV3THRJeU14R1o3dDYzbVlnQjI5OVovRTcvUmlQdnVaMTg0OU50Z1U3?=
 =?utf-8?B?TWhDd2JOU0l1L3lpeVB1a2UvaldkRy9VV0ZFZjFyQzFvWUNkMEl5anoxUjh3?=
 =?utf-8?B?MWlXODkrY2JYQzA4ZVBlZmU1Wmx1dHhKNER6RW1oRUhZM1FLWjh6dWVMdHg0?=
 =?utf-8?B?U01ESFdkSmZOQ1dja0JoSk4xV3pEcDd4VGNmakxZMXI1d3ZtdlZPQno3L00z?=
 =?utf-8?B?WUUzQVhhRG9ueTZkSXpFZjUzOEwvYXJZSkpKQ0U4dU0xQWwwZWUzWFd4dTVZ?=
 =?utf-8?B?SDJrUkE2S21ISGRhcVNWd2xvK1lML3hKVzkwbEdNOC9aR2hEMlh1R1pvVC81?=
 =?utf-8?B?bWF4WkE0WnpnREt3OGhmMkhzQ3haWXRPbXdjUnBhemZHOHdjNTI4Z3p6bnJw?=
 =?utf-8?B?SXA2TnpXdzNhKzVJRk9aVThHYktFbkhkcTJXbGE4Z3hMdHgwZE1hT0FDNEJH?=
 =?utf-8?B?YXVZZUNRcHJOS3dSOElLQjI5VE5JSUdVUkxuQTk0YTNyOVR1TUw2ZFliaCtZ?=
 =?utf-8?B?ZEZRNjA1Zy95WHZCa1FQcEJ2Vm9PSk50Q0E1SURPWGU4SWZ0Szl6MEJ5eURh?=
 =?utf-8?B?NTRxREFGRitIdnVsQkprbXgydlc4YU45NnFRUE45TjB6ZFdtS2pOemp0L3BN?=
 =?utf-8?B?d2hNZGU0T284TmhybG0vRlJsN2pKMlRhWk5Pa0Z1aHFzRnhQNFNOb2pWYjVH?=
 =?utf-8?B?UGNibkY0QUhjY0JhR2tHU0J0YVN1MStWQ1MrQ2c0c3pwVk9rUkEwY21XODJ2?=
 =?utf-8?B?Q1RtVnhObzBjVDlxaCsxSTVYcGxITTVsVzJBNmR1SEtEZFhzOGlQYjBEcWhp?=
 =?utf-8?B?akFtVUdqYytvZXlxcEZMMUZWYWgrWVg1OTRlNkh0UXhZeWRpQXFaeVVpaXEv?=
 =?utf-8?B?ZThoVzNvQW11ZlFrMDM2aTJsYThteVRLbDhZOTV1eVIyejlnQklZUm00YmRY?=
 =?utf-8?B?enkvdzJvK3VmTkZnMTMvOVJ1RWpNaCtNR1NxUTkvWktNRXhHRlAwbVZOeWV3?=
 =?utf-8?B?NGtrVG9NdlliQzNMUmpiOHJjU3JVSUZVQjlkKzFtSkR2Wkd0RHJWOHl6ZEtV?=
 =?utf-8?B?MHd3R0djQTEzUTlYWDBzTkYzZmVZYTduY0ZIK3ZqS1ppTWk2T1orR2ZKSUNF?=
 =?utf-8?B?SEFnNUlLeHBDWE01Z05HalU3SjE5Zkw4TUZhVXlBajh4bkFydFRRTzR3dlZR?=
 =?utf-8?B?QnJPeFNYRS83eG9MbFpraGpSQnhCcTBodUxYL2NabGYydjJ4MGlGQmtFNlR1?=
 =?utf-8?B?bDBDS0RFZG5GTXlSRE1qSDV6TWtCUGlHaWQxVkttMG9yeTRNWXhENFAycUdN?=
 =?utf-8?B?YklFcXp2ZGFsVkcrcGk0bDVCTm02ckxZRkU4bUZXSkswUkphM05xUEJ3bG9J?=
 =?utf-8?B?eFhxYWZRZTBlYmd4ZUJod3IrNTU4c28xL09RaUdXcXFIOFBJMG5tcWRMQy9z?=
 =?utf-8?B?K3JlU3NnZS80UzJKcG9ScDc4QkNrTE1sUUFGcmQxbUVxUWVRK2Vzb2NUV1Ji?=
 =?utf-8?B?SVBvZ2R5NFdoK1BYNXpWbXdqbzgvMHlSaytmQnpPTEpoYUNCUTJFSVk1cnhY?=
 =?utf-8?B?ajcxNDlwZlB2QlBLUmlGTk1EekEzSGNzcmx2L2QyKzJ6ZStoM1VHK1BsemtU?=
 =?utf-8?B?dldqYjFodGN5S29XcDBoa2RFUjVLd25VM05jRjNhU0hhdWFIZVpuNUlzSm16?=
 =?utf-8?B?VFhlS1dic09kdkgyak1qc04zNXhYWXVGSmlLU2Y0b1RUVVNWajRhcEFZK2ZC?=
 =?utf-8?B?L3hOSkRTQ2k3VVE0ME9XaVE5dHpBUFZBYi9CTGRDb3ZIWnNzam5BS2xUcXk1?=
 =?utf-8?B?ZlNJRTZwMmZNRXlKS1E1RGdtNDJ3TjdlVnhMc3EyTFNGMFNodWNxeHkrNlVF?=
 =?utf-8?B?Tmh4aHBrUDJGM2JnMEZxenVDSFkzUG1qVkVZWmpoVStBVzlGS3VraDMvVHAv?=
 =?utf-8?B?WDA0UndQVFM3dnR1a3RSOHA5OVpIc09BS0RoeElTK05SV0dpZlhnZVB3M2dM?=
 =?utf-8?B?YkFjRUNta3JvSGxzUUxrckxMcU9GV1dUY29GaHFoc1lraHNpUUFRQ3RSU1JP?=
 =?utf-8?B?OUs5bWlabHVFa1Bva0tOUmN4NityclNDOUoyM05VWCtEb3BTeEFRdndWa2U1?=
 =?utf-8?Q?UUwai6vBZqYriboU=3D?=
X-Exchange-RoutingPolicyChecked: XDASBWujAknqmhccRqfhqoO4TcyVzFEq+eTHEAADm1z9ErngAKqahYhDHugJAmv0vtoUcrdzz8Rrc/gnfUw5LD1hP3vhLcDlfE7k9p9jcVdQ3L7nK2tfqXZa/Jf57ZGa+a+xrRrNxZf+DrbFvlk/ECtqMLGUJN3n5nKLUaMiujQ9G+65rPlwCQn6/8u486xNlqtziNih4GyGJ0WFgppPBpk3pU1VGARcajz/iQFBKj9VdirwR3ddkZEhpmePIJrdsXvZemZ9Hh67YuiJP0srjW8WVuBZe8wWUc6MDj92M78rkrYY01j1CglWOgXhJfVUNrUb5Ruu5POxGiP1LvG89g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 304f0a5c-4cf0-4065-c2c9-08df4c4ba0d7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:59:41.7477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCmOwtcYsLK+YMLk7jYVnWiyw6HLFViiLUvojidnyXnoabTm+gTSzhwvzN7JttfGm83uBheGcAqSHJBr8TeJuAL0x9jn5YiNdiZbGmvXJEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Extract the safe window calculation into a new helper
> (vrr_safe_window_end()). This is analogous to vrr_vblank_start().
> Other uses for this will appear soon.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 528f72f43022..e0b0b9ceb335 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1261,13 +1261,19 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
>   		return crtc_state->hw.adjusted_mode.crtc_vdisplay;
>   }
>   
> +static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
> +			       int vblank_start)
> +{
> +	return vblank_start - crtc_state->set_context_latency;
> +}
> +
>   int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
>   {
>   	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
>   			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
>   			intel_vrr_vmin_vblank_start(crtc_state);
>   
> -	return vmin_vblank_start - crtc_state->set_context_latency;
> +	return vrr_safe_window_end(crtc_state, vmin_vblank_start);
>   }
>   
>   static
