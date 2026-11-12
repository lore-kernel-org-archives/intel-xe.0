Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8A606A888
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/0ZDRzN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=coU5MEjh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6210EB75;
	Thu, 12 Nov 2026 14:56:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7F11212B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794495368; x=1826031368;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=npfFvVxR4EjRpjknWT7hlUrjvWl6Kmhz60kjoF/Vqnw=;
 b=N/0ZDRzNlFSStSlhVbNu5sR00+1CPj/QXSm4KVZTnV+4I0KVUqr8hety
 Qf8syy7ZCwEWqX2Z4qgbHWwRNtwYQ61b4VX/NfwMdI3C4CiULYkth0HrA
 hM8ucnC/4a2lLNGD36E+Txrv3G+rHCAHf2EfjB+bLXF84kwNoYB/f8rZb
 cZ29AAtjYHb3oMqIqAAFcO2oeZ1jwFpk4xupbhgyMnjw8aiLh/IH/zR7R
 86hj62jQ6jCadMzME1Evu5g1834gAoSazRsbwH7fTZHNnRyL8RJ0g94H1
 Ybu7cSt+yQdqgOQFN00t+2l/MsyYYF/Z1BPeDt//RxzRxeMReJE7HdCHH g==;
X-CSE-ConnectionGUID: MY8o1/enSOa1/i3NaMgpsQ==
X-CSE-MsgGUID: 7U04dozoRyWswP9qMNvrQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3366567"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3366567"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:56:08 -0800
X-CSE-ConnectionGUID: pNLN3CS0S8S6FdGjuq+OFA==
X-CSE-MsgGUID: fh1tQfrxT1ufi+mLb7VBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8625325"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:56:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:56:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 06:56:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:56:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caI5YZXt04Oz8g+Pi0KUqwl+KRKNOUHj08TqTxHdkWKwGlJWsxm0Nl+wyigU/iKBgNZ3jPv/TmPnNkZsWbv2msJuJxv/wvxh9roSrSjm1ozDISt8E7+46tk8a5iIzxUh56lbRy57A5MWiCkyThrQAiy0dzfsqKnm+lF51oNN92uV6TXhs0AfwqJmmf7AUCLPWBpzP8zYbLK4ftBtouSioDaMQFJwuMWSuRfFeZyaTgTpnaOBzkg5NVxGi0E9QJPEO559l5B6lbU1dbJ5r2L9juK4hdzd7aPNiczlAFqatE68jtu7q8WXgsnMVPKRMMnnTl8e35bRuIIPJXB87IVTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7ExuSanJ8GhAAes2qeBvS0JmgEdHNRSwEIfSTlF9XI=;
 b=Pj6lkjpPs7wAEqaKBZlCy33r57fcdWNed7S1LPcw/O0CQeN74W1XMMeJ8shENq/xRKrWR1l3mj2X0lePx2cT4+wCG9rl7fIuppT9UrjT0FurFAIMWWRR5axktWIyA7Q7PcqFc7DNaYllponjnA4tGzi6BSrBgq0UGJhzZt7jIMlIQNmC9WbZy/JiX+axXbvaDXQx7tYueKj114fdg0KVIcItQSTKYKg/sU1mhYRKVV5aaC0NeRy7uCfyT+rPIQk1Z6BUwAZTVRJsEDJ1v1mNIJY8zjWtS+Vc/rwTEpMS4cmZPiuEsYfxgA+wSF+RjjAQdTwGgUUbBfMkTRGJvXbfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7ExuSanJ8GhAAes2qeBvS0JmgEdHNRSwEIfSTlF9XI=;
 b=coU5MEjh+6VSiX1C5L4VqCAZFt/RXUnUEtDpAqews4YU/g1LQCaGRPZ4Vb0SlNu5kqE8hN13qYztOSjfOVF134m5ZqdLJuw0HJrZKVyhxiNj7fK3TqCt1awkvdt6CVWvIxAOAzjBbLAGaJk3Shdwkenm/Pmdj3xoSC0vyy+uBEU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by FT1PR11MB124400.namprd11.prod.outlook.com (2603:10b6:170:c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:55:55 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 14:55:55 +0000
Message-ID: <7e2898c7-d8ec-4be3-925e-6161c30117cd@intel.com>
Date: Thu, 12 Nov 2026 15:55:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
 <20261112115147.2329912-6-piotr.piorkowski@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20261112115147.2329912-6-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|FT1PR11MB124400:EE_
X-MS-Office365-Filtering-Correlation-Id: ae68d01a-9762-4b75-e552-08df40cd0dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261022113327099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6A7SAkhF7bfRRahIobHabBeZdzDaB7eav21DaxGxxYUHT9AaJqBmmMZ49weemw2a/WlyH5Xi5MTOBWZxrSIBjwBGMKl9ed5frZA7hxk/df7Kl0o1WBGGlaP+Z/aAQ2xjWakzNUyvI2nJjNORy66KQIiGdJOoMgdNQIjz3cHJma5GH/lD1uspwRg3GhaNjJHBJ4j1b/zfbe1+EqyiYA9e5ZQr+sFKruw/2bn3MrYCFbGw7Rtbl3Q7vChvBvgmr6f1YjArq8t5itURtcy31y2RvouS5VSCgGKP0aZcg/+1FybAjfHh74eGmomcw3s4FSCFlizcX4lAAQzcgmMN44BnWeY7FPzPTNHEAfpEynTAL8LXVxEwhxD6zjCOJVsyhmlbmMO7lFf5QBiJW0a9SIkavGJK95+a9wCRDT2KmbpYAVAX/FQ61ELwnbxC7ryRAY5EqEbNPrCMsraPQKUian7BkaP/pfwAfrkdXWdcp+8WMmc3NpAWGVsbFxOe9rFh4pc+kpbTcTmpSu37RBt2FedZjAMdPX5Iof+sUVFTd3j8V2xg3FMrDnQe8lfnMAdXz2y2cVX51AE0AzpEtuIz0GyXRyc469rQ6miEl3OCUWwqwuhvDKhu9mf4pE9hkalqiun1Oft+W2mXeATvrrNv4diGKeHAOmT09tCwfZbtscUca+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTd3NjlkSGVsZExXTVVIbnNzNVBoMDBlL1pKQStPeEwzbENQRlpyNjNuRkNM?=
 =?utf-8?B?TUMvMG1zbkJQUlArblQxaXQwWm5Xcng1aWxXSnVsbW1aYW5NQS9yT0tUWFJF?=
 =?utf-8?B?WDRHTXo5WFluQWxtMjZySVdJWjJGWmRSblJ3VnZXM0FrVllUQWUvTUE4S21W?=
 =?utf-8?B?aFZwbS9yZlRlTUVwMzg3eVU5MWhnd2h4anowNWQrTXJLdlFIREhtOVJYam5s?=
 =?utf-8?B?NVZCWjhlUzVET2xMb0podVNFVFRKWHZEbEs5VzNOQmUwd2FkcWlsYkkvcFdT?=
 =?utf-8?B?VXBHKzZ1aG9jTEVuNlphMlVTNkNCMS83Y1BpeTlMaTZCUGpHUUNLcy9EVHpp?=
 =?utf-8?B?azBCSWlSOUQ5UEJ3QzYvSzNiUTNNZUhoeWZQQ1QvTU1kdHo5dlJ2bnZhWFEy?=
 =?utf-8?B?Yk9aREh0TFFpSW5RYUpQMmhqNmJFRlZWNXpONVhNYkFRVkh2c3lpQzYvSWZP?=
 =?utf-8?B?Vzh4ZE1ScW93RU5HOU4raVZObXdCQmNLQ2xWem05bnBKQUx3UG5heGx4ckRK?=
 =?utf-8?B?cDNOYTR0M1lHUU1iUUNUeWZjWVowc1h1Kzc3RllMeUZLdU5XN2ptcVZzSHJl?=
 =?utf-8?B?YlVqb1RDUGlJekJOcWxvcDNCS051RldsMlRqbkppNzFCbDNHZERkRUpSS0Rx?=
 =?utf-8?B?UXpGV1VFakFxTzRvUHdWWm15REtWWk5kK1pnRk5zeEc2VmxncDVqR3RMWXlU?=
 =?utf-8?B?NmlzT0grcG56TlROa2t5ekFMQ3NNZFNzK0psaUVmL21Melg1Q2ppZjRtdy9Y?=
 =?utf-8?B?MzNpaXhPS3NvbjNISkVpYXd5NCsrK1BOVkY0Y0t3L0MwMm5CS1FQT3R6Ymdn?=
 =?utf-8?B?Z3g2OEdsZ0RwQzE2NXRQZ0NVb01ucjRYOWNOcTBxaGs1OUdKVzRyR2s3YUVV?=
 =?utf-8?B?SjVXWW5RYm9EVVJTWTJoR0FZMUdpakxEOTQ0di9YcEtWZ3pBaTJPbDJlMHQ2?=
 =?utf-8?B?RUZJb1lOcnNaMHVKN0RRZEJaQUVrOHVFVmtFN2Q5Nm5XOHlXaE1DUmFRMllJ?=
 =?utf-8?B?YXlvV0lndG56S2RlUnlZYkY0VzVDT2dtN0ZINXI1OUkrblFoOWFpNW5ocW9h?=
 =?utf-8?B?OVF6ckdTV3hPVGNMK3BkemFmRVhDYzVMamRzV21COTQvRnNySmd0bmIyb2Zl?=
 =?utf-8?B?TWNrRCtYQVJNTmlUbE5jREozN3k2NnorQmdwaXRZalg0cjUvTzd6K0NNK3dt?=
 =?utf-8?B?Z3VTOXAvbzZ1YXhKSGQrKzZVbEd5SEVCVXVSdmcxQjNrUU1aREh4cjRJRE5o?=
 =?utf-8?B?c21NZ3p3WFBsc2IwNmQzZGdXZnljR2grMzQ4M1dwY0lFTGtwdnlZMElTVGp4?=
 =?utf-8?B?OXhZU2lpdVJ2UVVOLy9XQm1Pcmw1cnRoU0srZ2dXM1RDQ1pUYkNkT1doLyth?=
 =?utf-8?B?eVZZT0ZIMzBldnJuOXpHMy95SzVtU3RYcFJ4Uk9INndxaGhYaER4Vjd6QnNX?=
 =?utf-8?B?R1Ywd2tMeGdSU0FRQXhYMDdXWVhHNDY1NXRQb3UyUlpxUnZsTmM5MTdOZVg2?=
 =?utf-8?B?ZHdvOEwwcDRzbzFGSEVSSEY5TEcxV0JTVThETXY2MzRtUHpZRnhTb2IrMS8y?=
 =?utf-8?B?VVpZU2FtcUh4Sk1WbFR6NlJiejU0T2hGRXQ3cnBlaDlWNUhQWVhWbjdON0lW?=
 =?utf-8?B?YjVFcWxmNk8vSStHOHBzemRKRWlJZGp2ZHh2Z083Umw5MnVRUHFyb3FmaUVS?=
 =?utf-8?B?YUxrMDBmc05jeDd4Q0c5elpDM0NVZnVvWDJBc0FETkY2eUNpYTBnZEZGRmxR?=
 =?utf-8?B?Uk5IaHRBZWoxQ3BVVnkzeksxMGMzWmpNczZCUHdwNDE1a2RtYWVWK3BQSlh3?=
 =?utf-8?B?VUhDT1lPTEVsajFWSEtDam04NWlOeFJSVTlYVTlvSDJyT3o3RUJiTUUrQmo5?=
 =?utf-8?B?ZUt4ei9ERlByQkE4WHlWb2xxOEJlOGROUDlQOExWTWlXLzFNTXEzYXdxN0FV?=
 =?utf-8?B?NHlQdjZnT0JYS2ZIOG1GMlVsT1JkTnErY25hVzlpSkhraVdLdnZFb2xiNE5B?=
 =?utf-8?B?WVZZN3JCejk1RUxpaHI0Z0k1QW9YdjhWS1IxL01mL0lKV2FNeE4yWGE4aHp5?=
 =?utf-8?B?dktTS0FvU29CWnV2Z0FXd0Y2bld2Sk5QZ3M3b1dhWGFpckdFMFZVRkJMOXZh?=
 =?utf-8?B?NVZjUnpRZGRNVmFETk9aUEtMSE1oMDUxTHFHZDBlaWxQeGVNdEJoY1c1MURp?=
 =?utf-8?B?d29kTHlIWm04c3pUNEpwQVZpQjBXMVJoeGcrTTg1OVpTRk1RSmVFOHdXQ0U4?=
 =?utf-8?B?RE13UXFzOXJ5MkpadTZJL1ErZ2hjTWl3V1p5bkZYZEVPN0pzN3hDR0VJV3ZZ?=
 =?utf-8?B?WTJ3VmJXeUhBTlVLbjl6YWtNTUxrT2RocGhHUTAxblAvWENhUWNydz09?=
X-Exchange-RoutingPolicyChecked: gQKR2Fl6IgkjemW/GEWQ5epuBS1nFqTK2kDSCsGVLJbwM9i64h7YBPCW9xXjSXAmDSnJPQbxg0Eryk9qsaWcjNNv+Sa482m4jKx2gG1IssSioefRqGcVQXLBl6aLtuAsDElF3m5byaQaBBbscFS2lJAQaBo0YJUp4lcofkIWFyc80UYKaQNDW6yBMv1sulea+yD5LGZs+QBZ5JRUkuYFWS5/1r72jkGnay1XwN0Semr6eApm7Mf3BKQioyMYH5OqJg0q9fQXXI6r13pEfPtUIArkQrv7qgA/363bDy3bN2hcEB4FR4MTMNpql8WV09ddF8OEZe/Uz2cP4yy91sOSZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae68d01a-9762-4b75-e552-08df40cd0dc0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:55:55.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pJ11ERDNuEuod+lulJaCo9YayumSfLK7XxtBLHowsbyFbVoRZZ3pJR1EtboBkpGUsx8qxPgFZ3JhZwSMx553w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB124400
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


On 11/12/2026 12:51, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add GGTT KUnit tests focused on the newly introduced usable and
> shareable pools.
>
> Cover range initialization for native and PF modes, including partially
> overlapping pools. Exercise allocation direction and conflicts between
> the pools, as well as the unavailable shareable pool and requests
> exceeding pool capacity.
>
> v2:
>   - Init ggtt.lock with mutex_init() in each test.
> v3:
>   - Rename the test file to use the _kunit.c suffix.
>   - Use shared GGTT setup and cleanup helpers.
>   - Split PCI IOV coverage into a separate KUnit suite.
> v4:
>   - Release allocated nodes through KUnit deferred actions, so that an
>     aborted test does not leak them into drm_mm_takedown() (Sashiko).
> v5:
>   - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
>     the !CONFIG_PCI_IOV build (Sashiko).
> v6:
>   - Use the root tile's GGTT allocated by the fake device instead of
>     a locally allocated one (Lukasz).
>   - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
>     instead of open-coding them in the tests.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 335 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
>   2 files changed, 339 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> new file mode 100644
> index 0000000000000..a1ddf70743352
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +
> +#define GGTT_TEST_START		SZ_1M
> +
> +static u64 ggtt_test_accessible_size(struct kunit *test)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> +
> +	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +}
> +
> +static void ggtt_test_fini(void *data)
> +{
> +	struct xe_ggtt *ggtt = data;
> +
> +	drm_mm_takedown(&ggtt->mm);
> +}
> +
> +static struct xe_ggtt *ggtt_test_ggtt(struct kunit *test)

ggtt_test_get()?

Other than that, LGTM:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> +{
> +	return xe_device_get_root_tile(test->priv)->mem.ggtt;
> +}
> +
> +/* Must be called after the GGTT ranges are initialized. */
> +static int ggtt_test_track_ggtt(struct kunit *test, struct xe_ggtt *ggtt)
> +{
> +	return kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
> +}
> +
> +static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
> +					u64 usable_size, u64 shareable_size)
> +{
> +	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
> +
> +	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
> +
> +	if (ggtt_test_track_ggtt(test, ggtt))
> +		return NULL;
> +
> +	return ggtt;
> +}
> +
> +static void ggtt_test_remove_node(void *data)
> +{
> +	ggtt_node_remove(data);
> +}
> +
> +/*
> + * Release the node on test exit, before the GGTT is torn down, so that an
> + * aborted test does not leave it in the drm_mm.
> + */
> +static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
> +						 struct xe_ggtt_node *node)
> +{
> +	if (!IS_ERR_OR_NULL(node) &&
> +	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
> +		return ERR_PTR(-ENOMEM);
> +
> +	return node;
> +}
> +
> +static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
> +						  struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
> +}
> +
> +static void init_native(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = min_t(u64, SZ_1G, accessible);
> +	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
> +
> +	ggtt_init_native(ggtt, GGTT_TEST_START, usable);
> +	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
> +}
> +
> +static void alloc_usable_pool_high(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
> +			GGTT_TEST_START + usable - XE_PAGE_SIZE);
> +}
> +
> +static void alloc_usable_pool_oversized(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static struct kunit_case ggtt_test_cases[] = {
> +	KUNIT_CASE(init_native),
> +	KUNIT_CASE(alloc_usable_pool_high),
> +	KUNIT_CASE(alloc_usable_pool_oversized),
> +	{}
> +};
> +
> +static struct kunit_suite ggtt_suite = {
> +	.name = "xe_ggtt",
> +	.test_cases = ggtt_test_cases,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +
> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
> +							    struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test,
> +				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
> +}
> +
> +static void init_shared_pf(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
> +
> +	ggtt_init_shared(ggtt, GGTT_TEST_START, accessible);
> +	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
> +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> +}
> +
> +static void init_partial_overlap(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_GT(test, accessible, 0ULL);
> +	KUNIT_ASSERT_GT(test, usable, shareable);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
> +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
> +	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
> +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> +}
> +
> +static void alloc_usable_pool_low(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
> +}
> +
> +static void alloc_shareable_pool_high(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
> +}
> +
> +static void alloc_partial_overlap(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> +}
> +
> +static void alloc_partial_overlap_usable_full(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
> +}
> +
> +static void alloc_partial_overlap_shareable_full(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *shareable_node;
> +	struct xe_ggtt_node *usable_node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
> +}
> +
> +static void alloc_shareable_pool_unavailable(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = ggtt_test_create(test, usable, usable, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static void alloc_shareable_pool_oversized(struct kunit *test)
> +{
> +	u64 accessible = ggtt_test_accessible_size(test);
> +	u64 usable = (accessible * 3) / 4;
> +	u64 shareable = accessible / 2;
> +	struct xe_ggtt_node *node;
> +	struct xe_ggtt *ggtt;
> +
> +	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
> +
> +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> +
> +	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> +}
> +
> +static struct kunit_case ggtt_iov_test_cases[] = {
> +	KUNIT_CASE(init_shared_pf),
> +	KUNIT_CASE(init_partial_overlap),
> +	KUNIT_CASE(alloc_usable_pool_low),
> +	KUNIT_CASE(alloc_shareable_pool_high),
> +	KUNIT_CASE(alloc_partial_overlap),
> +	KUNIT_CASE(alloc_partial_overlap_usable_full),
> +	KUNIT_CASE(alloc_partial_overlap_shareable_full),
> +	KUNIT_CASE(alloc_shareable_pool_unavailable),
> +	KUNIT_CASE(alloc_shareable_pool_oversized),
> +	{}
> +};
> +
> +static struct kunit_suite ggtt_iov_suite = {
> +	.name = "xe_ggtt_iov",
> +	.test_cases = ggtt_iov_test_cases,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +#endif
> +
> +kunit_test_suites(&ggtt_suite);
> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +kunit_test_suites(&ggtt_iov_suite);
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index c987687663596..327f92fe9a04b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
>   {
>   	return node->base.size;
>   }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_ggtt_kunit.c"
> +#endif
