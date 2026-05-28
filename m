Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D5ACD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8D10F4EB;
	Thu, 28 May 2026 17:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLVg5wzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20210F4EB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779990747; x=1811526747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8fhi2cuex3yWz1WD4BwqLzEojPOS5s3r3FcQ95CiAqk=;
 b=CLVg5wzjB6p81cUzNR4gs8Twz/VeVXHNV2fvGmc0tU7U8YLjJT2jXNjq
 6UkrZmeCik2+Lq3S3276mW87+fNX+F3y9U40RcNjI9Ih7qsap9EbqGvOk
 7slYuW/MRlB5aZNtAItt2Yo10I6tz6xNIS7y86UiUTBdza1h93hN7gmdp
 JbHVpV5oGbIRDj/OELDm1btHM4QfHXWVPvV9R7ONvx7qy52JBlqZUPfWW
 xGVw1w2hG3/+4yrOfsxPHX1ODp2CRXq3kwSxCSNQVDTBNGwT3DcaJHzti
 A21B0i/3pXWlmJnNA0wgMm5RlGGy6p9W/4OhcSiqBbfuJoSIxQD1NSXx5 Q==;
X-CSE-ConnectionGUID: UiooThF1QnK6VBLfvspE6A==
X-CSE-MsgGUID: fNhMCNGARl694DC1t/BoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80901917"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80901917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:52:26 -0700
X-CSE-ConnectionGUID: EvnkCs3xRlOYfGna56oiyg==
X-CSE-MsgGUID: 084I3uBGRXqU4h9y0R2XMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247563920"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:52:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:52:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:52:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqgGjQ8pNzxIGPZn7bWrU4+Tj7IDy7o7lWrMssH8rLDJDIswudOXYrarFR+3XuyaKxN6+jFyL8VleVur1pbsthf0ABHbczSuG/uW3y3xHYhQ558Hq09aBM+gltKZUQArnwjLPsdaZAsFz4gRWUIqDFk+r07DmDxfezjIhE3lTdWYL45cUIPH1Sh5Ynk87MQn77U1hn0Hb+8msEMi3ZNLqqx1j0AcBk/aBQklYhm/FzhZ+2QrGa415wrmtuozm8FJ2c14ZPAYb2yiUG4EJu9lkEA6eohc9IiU29/C1gaKkPhQi7r3eaEjyp+TxRlC/GY6ooLGnNkvQQib4kIOzDv6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fhi2cuex3yWz1WD4BwqLzEojPOS5s3r3FcQ95CiAqk=;
 b=U/Au1E99c1m+Lq/aZDHUE2o9rO/ZamzEBYvVwnvUDf0ysIhEiq2qwdU5l9j+lM66rrmviB44YHxsO7bdbVls9J6LSoU1x1Zh7QITaEBCGRhiNXJcJYOn0JxTgf8XFBdPEL7yxRxe+LXqAbmlNejBPaAltKkEzq8ZdYvKEeQRmzWGQty3mFBpvA9s8RluTJx+07vPPTzZwm1urt2TwdF5USgwGY8H6iQmeVrEC9JmjvnRnfF9xZBavOJvCp5mldG8/RvA+Hl6LlAJXys7xXWbbOVDS2iTDxEzS5psVOTOpY3UxD34nO9GihY275p0eW7K9D/e3hjiAunbJ4Kv+eUqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA7PR11MB9596.namprd11.prod.outlook.com (2603:10b6:806:4d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 17:52:23 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 17:52:23 +0000
Message-ID: <fb36db26-3949-4dd5-88cf-656423f907ea@intel.com>
Date: Thu, 28 May 2026 10:52:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Remove extra newlines from LRC snapshot
 dump
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260511194924.2016315-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA7PR11MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d868ad-f298-4a15-7e42-08debce1df30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: teGPW9pAAHEFdVHEYk3DD0yryobKnTiTkOSr5XF/4/iesl3R1omvC88eMcnLp1lrnS5l51PdlSPzQliCFcQ7DwjGAtvqfG3fdOWhRJz4yHEHrPqq1ZcE4Mar2QBOkW5Ty3KVOV3KTQAa/920JmEZwV3hOuUaNFDX/c9v301uUOClvKG+FJjKowFakTCFmnCkci/AZsWvj3M+W/PN8hh5PnHB4DOqholZygq9r0Oh6vns9ybMzVsrSNZTff2cVxVfzIqd/lQqkinZTphjLgwOd+iyMr2Vh0IfKNzwOlSvGnVClqd2eecGkB8WyqeWl/VQZMWraW6+ivSza6SCh2laOaaBqWs6IXkt6cvFuTpRzH0x9wPM0IRI+U+Vv6rw2oH8zzFxOkeCiNZg1FCKFD97x+ugr3MvdpheK+LUg2jrwY1HvgReGr2ULPa53WbQThYlP7RfUSQYFrIWZQJ1FahfKeybWYXYVR7VPArNt0+3twxfScaByR/YF+YsYZaIp+S26Hv+O/pLcFCyyh4ujzr23Wj2B7t+pa3/79QEUn2eyb8le1ZUM0PNgnHBJXbdJwJvGwKBg6lVT4YwzmPZxom8DvX0vxzwP/04OMUh/UmqSkg+0o6rZpzTLDLnQsQdqYIT7H8048NZnZqZmIWeDxTxQPoKcQIGdu+mCd3tkavA2omV2/3T67BstsKmoZmGJyqZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VmbmlYRTQyL2pHVWdPd3YyZS9tYlIvdUNiSDRoVnVGQUZBOWhsbTRWWFdv?=
 =?utf-8?B?RG1SeVRLZTZqL0ovcWNoZ2hwYjV1aEhydWJLanJNRzdNNWk2SWFlbFRIdG1x?=
 =?utf-8?B?dTJ4VEYvMGdxeEF2QVpZWVpvVnRzSDFrOXppeHBxY3VDL0drQXFkMFZLR1Zj?=
 =?utf-8?B?VXlLeWRZTlBMSWUydys5VUduR245UEd4VUNuMUg5YjU4bU5RM0Q3MUpZUUFz?=
 =?utf-8?B?by9RQ2tNL0kzRGM3T2RvMVZ2R0N0bi80TjdlOGtjTGp2M3hJL3laRGplc1dq?=
 =?utf-8?B?Um5qNEEybEk2SjF0MmtYS0hZeWZIS1BRYm1xSTVmaGNKWVNsMWJaUFkxMWFE?=
 =?utf-8?B?V3lDME1vT3J5eXVUd0trRW5QNExmZW9aY1pqS2JHaHJQWTFDQW4ySTZPMXk2?=
 =?utf-8?B?WEtGQWFaT2Rjd3dkZzByNml4dDMwR3lLMzJubEUyN0o4YzZXaVphOWREejBQ?=
 =?utf-8?B?aERPT0h2UmJZNFBkYTU0cFY5YTRHLzhiM1pPUG9sRDkwaTJUQ245UTVrQ2dk?=
 =?utf-8?B?ZE10Y01nOCtJVFNOOG9pbndPeFp0K1QySzJydFFCMFdTb3RSb2o5LzRMUVZu?=
 =?utf-8?B?ZFAwUEttSGFJRU44SjhSbzlCSWdDQ0ltOEVWM2VEeWVVVms0SXE2WHUyeE1t?=
 =?utf-8?B?ZjU1UVFSUDhpQ1Z4SmRFMitPRTQ4WXpocnJYYVhJaHlVR2wzUXg5bXNCSmlY?=
 =?utf-8?B?bmpyVzAyV3BMazVHRE1BK0pjSzQwNEZzZVl5TzlOeWhrUjhDK3p4L1ErQ0Qr?=
 =?utf-8?B?bFVJNE45eEFiWkNuNjVvMjMwZVRYcHVzRWZrWlg0dGF2My9TREsvWll5Unhp?=
 =?utf-8?B?SmZzaWJTd1MyZVNPVmxVbSsvbWlNUkpaYkp6VUpuSTh4SURPZTJVK0tZN1pk?=
 =?utf-8?B?cjFGMVBkY0IyTDRhRkI1ZDkzRUFhM3h4cmhqdCtqTEQvNmNHaXNacVRDc0Ix?=
 =?utf-8?B?c2ZqNVpoVjJMWk9SYU13Sm1YUG11cEZicExQems3YU8rMElMNGovTFhDeDB4?=
 =?utf-8?B?QVpBUUQ0cTExOHdlQkJhS1ViNnFkd0lsSWxFd1BSRWdmV2VUWUtRRE5tR1Vh?=
 =?utf-8?B?TlN0OTVWR2lESktubEhDYnk5N2ZUMTVqRDdYd2sxTE5GMzJCRGtjbFVSRjhE?=
 =?utf-8?B?cWVVVWZPWk1aNTV6aDAxNFM0L1hBSnlaOURMakFmeEtYN0JIbkpxQVErYzVK?=
 =?utf-8?B?bW5LbDZHaG5GWkFqR1lHVnh5bHg2eEoyM3NXUU5LdGxkME5EM0RCUEhWUlFC?=
 =?utf-8?B?Y0NiOGdtaW9ETXd3RXgrbFZCQXpPL3lQYUQ5MVlUYWd6ZzQ0NEJVWGZTZUhh?=
 =?utf-8?B?MkZpbCt6TzJDZDBWd2xLbi9rWDFYRnByY01FNFZFaFJQUmt6UDdIZXhkelZm?=
 =?utf-8?B?YSs4NnpXbnZMakNDbVdsa0s5SVJJR2wvekQ1NkxqTm0wNGtERmpyQ01DbThD?=
 =?utf-8?B?d0xIZ2l4akVNbGVIOG5nZllSOWxFMVF4bDFvOUpaSC84a0g0OFZwOVplTG51?=
 =?utf-8?B?aTlHemxET3lWZExiREdyem9TVmpZQjNZWUtobmxKOEhqb2lIYlp3YU9yRHNL?=
 =?utf-8?B?b0lWZDJIbDhGZTBvQUtoTDI1N2luN2ZiTXJvaHpUb1Z2Z0ttUWNRMDhEMUNR?=
 =?utf-8?B?TEh6d1NNRHk1Nk1HS2YrYUhmclBzR01QbDJUK0ZocXZobWNhb1FjeUM4SDd4?=
 =?utf-8?B?eHYxYmRtL09PQ1NCcXZ6MVFXMisycHRqT3FtNnl6em0xUWEzY3NnSlozV1VF?=
 =?utf-8?B?emxEWk1VYjF6VlJZR3VuKy9kNVI5WjhrM01wYnFhZnEvL3BWenZWQ3pRTW1Q?=
 =?utf-8?B?eWc0OFJJNEhoZEgxZnVGMHpJNlpJelRQZzN0Skl4Tkg3eVRseW8xbWR0c3ht?=
 =?utf-8?B?aWhWWmNtZ28zQllxVkt4OXo1RFJqQlhzR0xhRVFoVkYwK3Z4RUx6REcrR0Rj?=
 =?utf-8?B?Nng5azZ5Z3dCdnB3bmlhc2hzek5uSmxrc0FJU0JtQTRJTzNIc2lBTXVrb1cx?=
 =?utf-8?B?d1lrMEZTRmtDWjVPWmZlYjlPRXJ4YldTNUFCZWREY3VWNmRDWmlKaE1uaU5W?=
 =?utf-8?B?K1crZHQyWXFWUHZuL04vRVNiSkkwNHdQY3QvNHFiSnMzUi9UWDBQTmZsTXJj?=
 =?utf-8?B?TFliNTVPR0paaDlrU0J5MDhCYkpHNHlPTGtKRUlralRqUExKa3JSSEwwTmlK?=
 =?utf-8?B?YUFFZ1ZPUWZNQ0pGVG9lWmJhNzU3N2EyNDJYaU5PWmdQdktmVW5qalJ3U1R4?=
 =?utf-8?B?S1FnWTh0bitLU2VJQm9Gb2tweExOYmpsWW9hL2hOdUdhbXZheVptRFIxWmQ0?=
 =?utf-8?B?eUxWcGIzUmRiSG1OM01qVVFMUHlPY3pjSzBkVkVMdDEvUis4Lyt4V1g0WEcz?=
 =?utf-8?Q?SYqzV0m35eW06dMA=3D?=
X-Exchange-RoutingPolicyChecked: qsnzhjxiY3rRIZH1efxdHyCbcN1WTaPt98w3vD6rcQHT0/86XCZOtjatbC2RfNJiKVn19PFaLnxCu35XrS2NJL2Iywvah3kA92IqOhRRvvKn/QV5rPxL6Q7aakqdJVrcK1XWZ24ni2c17o32K9qeF2Dth682rmoGWhi9BcewmcH293h+jF0SgccG3N3Lrkkj58NRzfmvEuT1ZXI9Q/h84G7zXFUWyo/l09pvuVYiipuy1X+jYi6iSteths/ugSIUrP+E6vbA6a2EhgantkZP4/7Jt1uNFiGnBErgEmB3UtGLQzN1fpyXBtAWSggLZtCB9501x2EJKJS5uIjuj/P4PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d868ad-f298-4a15-7e42-08debce1df30
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:52:23.3873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lisaMKxMe9ag7aboDSe7ZaYFVQpuFkDLY6PECWMu/mWtSWWHjA9IlMoRPLWYb/fAJGs/5aSJ0NV/k9MtmjLP1emCqdyER0jOOmvtNWz1l7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9596
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

Change looks good.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
