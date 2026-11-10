Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B8606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PIT5OSh2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7E910E9A6;
	Tue, 10 Nov 2026 23:25:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1010E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794353115; x=1825889115;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=PIT5OSh24vL+0Kyd+JJ7ZUVTmV5e8DOPyHvQpuPgG1BhKadNc7Wd23wL
 E0dMCVrbwGcP/htNapy4S3Oca6b+s5rilUwJROgG39t+CNNvG5OqnQgSS
 ITSbXrOXP8cqCrBTzWvooF1+zmBDZzZtZiDB4cFa12hsgxiHjsmru59yt
 ljZTdz7GxwoT7NJa5V4PsfccMutZrqXcytULSDD5lcYnYELx4U1B6+rEq
 FCS9CPEvRrKFFS5AGhcSbExUCcdstYZ3UGXx+0b73ZIDeISN1OPE7xqA0
 cfaBeG+VYCgA6xV66XG8O5CNYuXYuYUcwIDtFzD2LppcUSFMtmlSYQDdk A==;
X-CSE-ConnectionGUID: i0PmNP5KRuqP4m73OdyHsw==
X-CSE-MsgGUID: bstFnsdESQ28RInzP32FZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3121588"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3121588"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:25:14 -0800
X-CSE-ConnectionGUID: rm1XO9FwQ6WErm/YummQDg==
X-CSE-MsgGUID: 8SOgV3LuR1eI1i9O4bc2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8136660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:25:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:25:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 15:25:13 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:25:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adjakwXzuSz3kYSVBC1G7m96vjsc+0ighGipgxgKk00VcAa9KM+WVhP5PyzTGi0ayE/RxhprklOkN8l1Mw3pJT68TJNBM2OkjnO3EZZwuHU3XnzfEmX1yC7qUoqwRGodU76zX9tIaWu4KvCMGSVxwpb5vxpFuZQisSc5uhaiuVdOXBbzBPIBgRH0z/mA3bJTaggvAAOjMlyN33yXIi5yj5Cl3Ny8/UjpN1BW/UwWGBwWBBCltYIvU70Cx49Q990ans89zrRMRtODygkrFIwrd8k0r2L6YV8LvugNuBiMf4LTAxjtE4mAfWyZF59Q3OiAoro66U346YwDMP89oAtSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=KGeyI8dggPSht3kuQyeYm04iti13hRG82k6rLPY3ri8W0/KDYX/cSpHTnaRsm7SaI/zuYfAa9ctmO1yGVw3HQG99hCuQ1rTKTYx7SNzfYMURIqFXwt5Meun+L+8rAda/GERFV1dmGL70dkSmX0Q86bgu6NW8eUQ3JtgTsxx+OgzXPJmYfT93T9e1esweodLFzyjxAi+SnicHhj7TG5EusqXhePEbszFrfT+ab2X5Lcc4WpsuYs/hWu+nLMnn+vPOFM0XLTbmgYT7O981RYRXbcHomcsFF7yEcnx72TIJ4+1uQ7Y7aUpFRsPvuHd1NcC4Pvhac34mpOvgSEUUfOI7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA2PR11MB4890.namprd11.prod.outlook.com (2603:10b6:806:117::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:25:11 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 23:25:11 +0000
Message-ID: <396ed80a-7fa4-40b3-a9b0-9dd60c2580cf@intel.com>
Date: Tue, 10 Nov 2026 15:25:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Define GuC firmware for NVL-P
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
 <20261110003553.787861-10-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261110003553.787861-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA2PR11MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a892f68-5ef4-4297-4323-08df3f81dd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CsBWVmadk5m7wu1fEP+SjwvMR9r2FKfWRloXAG0hKWRDwXYx4HW1iNzUSE8x04XxyTJ+rKBPbIURwpPuk0y46znkuKU5ZFvpK7xQQ93xk8fSZtwR8GJ7Ri0YP5aDFr1+eIYLYRl9NGgxZJO3QLSam4gU1wS3talQEabIXhX/EiXXx4LDvFXqdIs/mWxNbcg0D8wipbG6bEgsRT9k4Z6NISTo9B5qX5lWcW/kx+QRI6KxmUg5JK0oVVJ4h+b7SEoCq5GPLR9AUB5iahKtgpMsl+uVBhVRzvfdiBfcJ8nkHYXv8iPmTx2mHGrmyQVzJxFaJSf2dDydNweGsUmv0KFl7ptDK8oNiUEX6wWWFZh7Ykjyl5lWv4ge1upghXVe4OvagMUXoM/wzrmkuS1rvBkTBYsx9xYEAi6zQx4x9iyMe6sAywXARZ5A0iKqBvqtiWw+lwt55Gr7n2SsIbdBQse83o0r5bThF3oQ2ZQzUe3dSQX1GodO7SnGUAkmjKrQYT/ViXNcM92JDwPDb5hWZn8gM+ADvzpjtJt3ITDf3CzusmepADFtU6IW+0fHGHhFRUjk4UXXJkkKm64+tFGP/be/LRy8+AvYSDIOdMJ+wJILxWFpJDZptBou60anSDSy7sXLxEwEIKc/NTxFNDybqCKwzwCdbpAUrbY4SWOCoiqDJ38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0F3UlZoajVlYXkzb0padTRFRjdoQVp1QThmalF3R2xMZjVocDMwRmV3MW11?=
 =?utf-8?B?RG43a0RJZUVvOG1Lc3BiekdPQkRJUm1FRjZuY1IwSWNRUjlTU29rdHNiNDh0?=
 =?utf-8?B?dG5yeVZ6WlhtME12UDlNQkdkbzZwaG9pUnFhZzR0b3VURDdGVmpqcDFBdlVv?=
 =?utf-8?B?VGZiODIvcCt4WE1CbC9Qa1FBSEV0bDFXVEpKVWtpVDJWNi9JTEtWQUNxK29J?=
 =?utf-8?B?azZjZ2pRaTEyVTZCcnZaYUwvMzhxdmt2b3NuTXlpbkdwdUsrRzVsbmsvK2V3?=
 =?utf-8?B?S1ROVUNaZmVwSDFIQUZKc3pCclB1NEcrSVdLVzlxUGJyMi84aFkrd1BUM0Ju?=
 =?utf-8?B?ZnRLa2xYeDdNWVJrVzJnb3hqWVE0Y0VlS0xMcWJoeXVnY3UyK1lVOVBSY1hQ?=
 =?utf-8?B?dFgxanpIOVdrd0MwVFR2alozTW5DU2s4TGI1UUtjR244OUxCd3YxUzZNNy9F?=
 =?utf-8?B?elFwVThPV0N4bjMvMU1vdmZ0cm9rQTdjdDBGcDNiSnVoSkhIL0dPYS9DaG10?=
 =?utf-8?B?MkZuOHQ3R2JmR0RMMFdXUFZlYlEwREtGdXQvNzBZTHZxRzJIWXdXaGRJelJO?=
 =?utf-8?B?OU1mcWRsbmlPYm10M2tyWlE2c0NSQjN1aHViNVZKYXBWMHlQQ0tiUXU4U3Rr?=
 =?utf-8?B?Vko2aDBONG9VWGdhZktlVzVoMFpxN0JSTTB4SzAzU2lGMjRPMG1ic3FJTjdx?=
 =?utf-8?B?UW03aEpIRVVFaUd6enpOYWtRUEREMEl3MlliS2tsRy9OQ2lOVDVwLzZCSVMw?=
 =?utf-8?B?MElrb3FuVkpmUkU5ZkdFampDdldQK3RmK21wNWZaVWh1V3YyNjcyNCtBdHE5?=
 =?utf-8?B?ZFpFeExPSWNHY1NETFlRM0NBNDhYY0pPSjVDTUFneFdPbEZHVjJrT1NHQUkz?=
 =?utf-8?B?cWJUVThndENPY0h0YzAveGUvQzA1U0FsdTNiQ0hLd085VWRtQWlwYXdoNE9R?=
 =?utf-8?B?blMrMG11OG0ra1RMV1VtdGFHblFPVGxrT0RwL0Y1OXpvRjJmKzlscHZHem5E?=
 =?utf-8?B?LzR1eEJZOFkvL0UrTHBoVGpiSTFxc05pR1loM2d3K1ZKRVp2MEJoOTZjbW8x?=
 =?utf-8?B?RmV5KzFabHRGeThMQ09LaldkdHlDT0lsRzA0ZS81aG1xWGhDWHZnN3BLR04w?=
 =?utf-8?B?ZTBpYWZvdnJRWjh3OEducUFMd3p3bTdxNFhGN08ycmRnRnpoeVpQb2hVdk5F?=
 =?utf-8?B?bGxnUDVPZzFialRFVDRIMHNjUGh5QU9vNkorQ0luRTBIVUpWaks4b0F5YzYy?=
 =?utf-8?B?eGpnU0tkaDZUOFJDRjNpN094ZnZnRG85RExkS0dJNWFTTXdNUTZMTVZpZlZr?=
 =?utf-8?B?YXdvRFRrSUtvU2pFZndsQldISEVVb1QyejJ4WHZRQ0QzWERXZnZhT3pteGNT?=
 =?utf-8?B?a1RndWo2ZlJhcmplUmcwaWs2d3g2cDJQLzVZKzV0WFJOcnVXQXpWSHg2Si9V?=
 =?utf-8?B?bkVUSXJWbTJFRHQ2Mk9mWnpUTTdmK0NOV0kwQUVpZXFpWUxhNndobk55YUJW?=
 =?utf-8?B?RjZpK2czOU9veWRDa3ZVaVg3RTRvbytVVndETGNXNWJUdTBjKzFJWWZ1SFd3?=
 =?utf-8?B?OHp1cnhrOUdlMkhlNVo3NGdUd2dieWNxVVpZQTJ5d284SDJpUjBaMWNpc2NE?=
 =?utf-8?B?VDQraWxGQi9YYXpMMnVoNWRsWDhhUjJGWXNIK040Nkl0NXlyOExXMWxDbFc5?=
 =?utf-8?B?SU9HRE9XenlDS3FsVy9GWFFTRjIxcmIrZDI0eXE1blptY0JyWG05MnZBR3cx?=
 =?utf-8?B?cXhMYlpvNW1MaXAwSjRJUUNac0VmVXhsbyt3ZWhlbmxaVnkzOGs2L1E5czlP?=
 =?utf-8?B?MUFYbVZJRldBaGZzQWtRQWdPQmZpYk1OTG56MlFHYWxpalcwa2tnbW9sNEMr?=
 =?utf-8?B?NStsenpCRWdBZXE0YUdISjU3b1Q2NFNneXo4UjMzcC9xVHUvUnpTdUpCbmpx?=
 =?utf-8?B?RElsQlg5TSt0N3ZjU2YzRERxc2YweG9PcFRqeG8wd3ppSE4xNWZhVEFTV0FW?=
 =?utf-8?B?U1lkeHhBZ0gxUDNzdzcvMkRDWjc1Lzh0MG95QmNPZjdreFVHZlpTZ2Q5UzNO?=
 =?utf-8?B?ZElMQ3JYQ3VXLzRDeWxhNDV0TnY1ekdaWDZaYWh4UXA0bUxzUkV3M1IvMG03?=
 =?utf-8?B?YURpZ0FsM3Z5N0IvNmpUbDFDQjIxN2t6VHZ2MmFuc2ZuaFlKY1dKNVJYaGYr?=
 =?utf-8?B?czRGQmRyUG92L3V3M3JaeldUUXdNU1lGakxEY29EVHQybGx6ay9uKzFtUG05?=
 =?utf-8?B?bEdVSkJOaTFEZXRlZWhyYW1VajlrWlFKWmJGZURRWkJSVE1Cd0NPL0V5K0VZ?=
 =?utf-8?B?V1FjcktqdE5GejZhSytHTUs2N3dnR1IyZmtnTGVTYkw5OE9PVnNva1NwVlBl?=
 =?utf-8?Q?VAdaDRPkKmqqxGMA=3D?=
X-Exchange-RoutingPolicyChecked: yOBNVwBahqoNuDDG2ick+OZ18N3O3O9juZlsXZy4HlTY5QjR5x+TDTlFdnljEVK4WGrqYcJArz19HrSsXQxhJ9WJ5aGp56r8SjU7d+iT3Neka05GPEIjAInWS/mu/IpUJGyJBbJ1JT3t45TVuFpgOgJpzY3BCAhbN3miPRrvREWfFJf3qlukRFCuldslbJCtIOuzO5ELtjUVR755q8XrGSvJEzjPqi8B0JybKlPvZTvyhAA9DGwiBsg3O6Wl3aYMKHhM/FWQY+GR9I1yqkaVQoZADt6qP8yz8HKnk6+tbt2GQQnrqls5H/X9vAf60/f3YRFJAk1g1xc4iBgCCUfKKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a892f68-5ef4-4297-4323-08df3f81dd7d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:25:11.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrIITBJslw/1hlzyd3idu41fFINK77x++D22Rnpps9ZAJ1OkAw9tO660VIO9hxLxJAptQ3/awySMjjE48UIlgtswEKYe7OzKq8VBzp4fGko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4890
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
