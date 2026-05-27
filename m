Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA84CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CDA10E2A6;
	Wed, 27 May 2026 21:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2u8+8Uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96E510E2A6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915659; x=1811451659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tT+4aKPmWzgx9u0W3ZgGMxjfJtBfd5T07ctM2tZKrRo=;
 b=g2u8+8Uj9EUp2iShwCdaUAT1Y2bSxCUdyhP9nfnVM12AZvgOkUKaRHvo
 qoYydqxz7eFA5PkIM09l/hm7aZN6oRPbwKsKL+M5FJk0wsTxyg1wjuz4+
 Oew9g9rL5ZzOmbqJcqzZLRujCvdo18M9sHPEP/yHrmtiJ6FsvGvvuOfhp
 nwdJJLvDc4MYuM+GttVNva3kbCJceMEhhjQzWPKQEuABxK2biucmchlDX
 cWRDjpuSw/BuyIOSCje4ZvFdOXaHnk3vr4ExBtpHndQy0kwcxDUzSGsVk
 S4uqLLN8HGlpmy84I67nRQ2vZkra6JHtKhAYVgZu38Dd6DsfGoHIaf9ZT Q==;
X-CSE-ConnectionGUID: jJ7wh3SaQn6sQtJnI4Yvxw==
X-CSE-MsgGUID: LUi8at0CRouplZ/mM3+CVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80610821"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80610821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:58 -0700
X-CSE-ConnectionGUID: uOCOKF2eS0mA/wg8LTb04Q==
X-CSE-MsgGUID: Sd1kIprMQuegCQytq53eVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="247301454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:00:57 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuDcmnmAfHx/Il5bFJ3tSgZrrSdiHunxnupaJnrcLaa0Uc3Da9z7J6nLpxBBDoyDlW2bktM8sAnIE03ZyV+hTKpQKbcAp4Haw0ansjlQkfF+hYZsl5U339YLaZMj6TTiuv+iDPM289DTkq6MXDpc05+jG6nsJDXP723oQRt4v0u7XZ2zqhDNbhS3IY522JwUCyqrOhk0EuD8oEmCPgjlDXHj/956ZEhShJAck3soms/zzN77sstyEu67W7xhk0E2S5bRg9dSUUCQfXKuTE82DsVKUU+rgLvk5p5YEQWsq+kbkOJObYVQswXs8YIO3GeJMlZkreBkh9tUwG/fykJbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFrClPxc8FqJYJEpbQBJgp5vA6TDVhrOaF1t0tyW9mQ=;
 b=jtrEyvBbREb5Vs8ZHxXTPOr3+yUQUEug/8GL7NG5tJ84ffSkwA3txNG+kXp04IrWJuHEtiz74XAMd35HUnDkjgs0TuPx147Y/n8uEWTWbtVktLiC4826N1XLoiHSL7GGk6XQpgOe6RKPKOySzMhDDskQLKtr30XSE5NGWefQS+Xbf9VrXxhmNDT/S5RQOBZQanyJs/Hbmjun+SraZuTF5zS/Apfao1xKUG/5Didg4xAM14AmOqZYlm6ls1XZVv4dxiIbo8uTDuJaJV9PpEejbBi8MOfu2qn1iK+rVL1hU3pLAvsSuB7eBrj60LSlOriqI645MkN+8cDHs7Vu5rYVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 21:00:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:00:50 +0000
Message-ID: <ad542fa7-9fd8-4edf-9db8-4dbf66f017ea@intel.com>
Date: Wed, 27 May 2026 14:00:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] drm/xe/uc_fw: Allow re-initializing firmware
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-2-raag.jadav@intel.com>
 <de56fd4c-8e41-43de-930d-9115b14356c1@intel.com>
 <ahaE06LrK52qE-Yp@black.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ahaE06LrK52qE-Yp@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 948c0542-b85e-4774-abe9-08debc33086a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099006|4143699003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: c4vfuoBjQOVGvDA96sG4Qm4nWpM5ETcYXWBgmvpIV3uF1x40nsv0sHyUHOPOFoRfaiEnenJ2LLzoX7389+JknAPmCaE3WcO7MEshwfzxS5yaFXT+GDc3Dqnw6l6oSrkKflY82AIN2fR9NLEFisRID0KmniYeYXugHhFlzHE6dFfJKUE8hRcRsKojUw2EQy5MHDEWzXAp8zyfwH6z4Mj1aF8WsJvrJFcfJ9ImFjsILS/BJSKeLyUmEeXh/9DkaB8LDK0zn2ZmMl0cDC5J+9s4mPY1CpuV/1+wtbci98ktRtVdc2Nu+UapOdZDGIahpw0EjLBPWG+jY4IsYhaDcsSzYI6ogrV1LLMK6w/bVSXKXSZmBXAXOwG5EUxjfrQgd/elnDL3+B2SBSu3X+vg/ihFofhkR0trLR3F6JiRQbkF5xF3v7PGHmF2LZDyGaBOUpakVCj7+UggKNv7mqpz3klwHt4KtMPBzugvozXcWhqrFe0tDk64lchCkAaQ7Qm4keAeWDXnCyjenN3kl3M4yF16kKQU+CCtxPd6JDNbdaFF9VPmi+8o2t4L5GvkbyO/tEbn2Hu7nYGChjTlBLHOzjL4FN2C0QhHRzrD1cieT+DJMlJK1ZXH2bUOD7Jw8HN1qbdr9Sj0GVCbXxzoZMn8O2ypXVJaGfXxYlZ8OfOkw8UjnzENVUbsqKFc/7spSqq4iWaN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(4143699003)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djU0QjdjQVlLaENFMnRjYlJWMHRZYndldzVVeVIzUE1NbXo2RzN2YU9XYThm?=
 =?utf-8?B?emNibEt0M2FDcEZKeDJMd0t1bTRXbk5mcFFHdGo4VjdLVHhuWEpmNDc1dEpC?=
 =?utf-8?B?VDMwZU5rWU5yRlMrNGRDdFYyQmRtVStCYXUrRmNMYW82dE9vWnMwK2FRU3h4?=
 =?utf-8?B?TFdET0FZWXRqdlhMMjFGTkVVeGUzbzRMdlp5T3E0M0ZWdGdML2VsakdIUWxS?=
 =?utf-8?B?STVETFpKdytPMlRRNXpRRTFLVC9OVjRCRTJnNVJTOGRmaVZvb05uRWJMc0Ux?=
 =?utf-8?B?TG5sdUtCNitvQ1pZcnBXUDE0N2RDektDbTBiSU10SFNRc2lTbE12UlhIYXpD?=
 =?utf-8?B?RURqb1FFMUw2bThOR0cxWlorY2ZVTjhQQmMrREI4UFZITFA2OURyMHM4aVU1?=
 =?utf-8?B?SjFkTTZZRTdmUEVkUUF1NHM1c2g5UDZQVDlZTys4bkFPTzc3dVZYL2QvV1pE?=
 =?utf-8?B?VHNNQWNRZWcxcXdwdzlIeVh3SWtyUzhlMis1dG4zWUpMSTVLVEFlQzJTZzZQ?=
 =?utf-8?B?alptS3k5MjA4aGgrYW1ROEtvSlhOK3V0bStLV3UyK21TRzR5bVIxVUx6TnMx?=
 =?utf-8?B?dEwwb0l3dU00djU0WGQvQk5JVEs1VUtkNTNGUzVpWFJiSjdhRkk3NTZJQWM1?=
 =?utf-8?B?RFhoakVud3NvMk1TR0hiNUhPYjlXK3hmbThiRmp1eXF3WHhTMGNBZ0NzaDNB?=
 =?utf-8?B?cnRYWW9zNjJieXVyUzRhRW80OE05WnpOKzFGWWpBOE95QXFKRVhRb3ZDR1hQ?=
 =?utf-8?B?bkNBUFgxT1ZnVGU3anpmM0YvemJ2SzlOVjZ2bTIvcTRGcklLNUhYZ2dXV2Q3?=
 =?utf-8?B?cHN6UHFDSXRnOEt3VmhFNC9ES3FBQjYwemJyR0ZEb3BtaUpDWTdsOGZUN2Nl?=
 =?utf-8?B?bWxWTS9aNURzZE8yMUNwMEROYWphSlk3SUZ6dWQ4SzVLbFdPK0gzY3RtRjBq?=
 =?utf-8?B?Tkd6dDNlbUY5OVM1b1VFOVY0UU8vaHBDOS9PZHJ0V05QZUIzNlVEZFBEQzVV?=
 =?utf-8?B?VnhLcXNXTXFTcVhIMEgrU1JtL3lPSnRybHEvN0VGbFM4VDFqUTRKcVVxWDVk?=
 =?utf-8?B?YzZFdzhNNkVINnF3WXltcG5nMEZlT0ZMQUFKZ29RR1JHQytNWG1mcCtSM0Zn?=
 =?utf-8?B?QjFWMW85NkNTYndkU0xJbkt6ODZpQzBjQzNEN0FtenRmRmo1WGUrWmlkY1Fa?=
 =?utf-8?B?UHFuWStOUEU3cjRvMjNpQmJUS2xjT3NBNUZDOGswVFVqb0xRUTRlSVJZU0ts?=
 =?utf-8?B?aEc0U21pV1pSaUVGaitwSU9sSTEvVTdQUWRoQWdlVEJadzkwMVljTDc1SzlT?=
 =?utf-8?B?aW5CMGFSRzRyMEdRSS9VL01jRVNpakxFR1JTWnVCb29BQWNuWnlzN1h3QmUx?=
 =?utf-8?B?WXhrVVU3UzJvNkhmVjRQNjV3RjRRck5CemNtZWRJaW14WkpFSXRrTFhxcUdJ?=
 =?utf-8?B?RmVzVkd0SE93NUJ1T0lJYWlheHpUYTd4RXNuMkx4b1poNGZRSmJFUWhSMnA2?=
 =?utf-8?B?NU45dkxrUzhuSFQ3clByTlYxM0p5TmJ5Mmk4MzR6b1pYMVk2dE9WL2FqT2xY?=
 =?utf-8?B?cnhIVE5QZkVGSkRUMmVJb0RBd2NOUlRmaFp3RTdBaXQzZmlYMmJiN2VTRDYy?=
 =?utf-8?B?WTBhdUc4ekthaVBadHpiN3VseWVuUktpZjlEZTFIOEVHZGFtdldFejZLM1FR?=
 =?utf-8?B?K3dQZ1pMYVoxM0dIaUhzWGVZc3pMZXRDVER0YzZiNXpXWE16VkRXZ2QwVHEx?=
 =?utf-8?B?U3hNaTlpeG82bi94YnZrQ1lPbnlUSm1DR3NLK2RjSDR5UWJtSGhPeUFkckls?=
 =?utf-8?B?SmZmWmhwaXllNGwxK1BrVUFQbFpHcEVFa2xZbE1TejVBTDNmS2RobXFWdGF3?=
 =?utf-8?B?YXdJYzY3azRPSGdSaEtFVnNTS04ycHRERU1NTlBCL0Rid2NSbGllTUo2QlhH?=
 =?utf-8?B?cVd4SDhMUzJadEE5WTFxa2JBcUowc0RiZnVpSTNkdm9nK2xQSmh6YStRMFFS?=
 =?utf-8?B?OTdoRGd5MlhwQS82ZG9qdkdlNVhEUE1pbk5PWEdCdkIxcWl6aFJoR1RaYURB?=
 =?utf-8?B?czI4MWFuR2dXUm8rVDQxUENHZ2JnSE5MYjQvZ01TZktyN3E4V3hRVlQveGNG?=
 =?utf-8?B?M29CaHpyTlRyOE53Nk0rYU0vYUx5a2MwOTJGQnFIVDFDbjVmd3owRGR4dndw?=
 =?utf-8?B?OUVIa1JMNHdOOTAyQjNyN1hTM2ZHdmlUZzBtZWZ6MER0SjB4RmN6elJBSXhu?=
 =?utf-8?B?d2NtOVJrdFFFYlFPZ0dDU2lDOVRyMVFnUlVYRlg2dmNRK2Zid0FacEV4UFp3?=
 =?utf-8?B?bHpkb0d6eGFEUkRIWGFITW1TSGRhbk4vVDV0aGNDNmdoZWZyNDk0UXVBVzlI?=
 =?utf-8?Q?CUTur6MFed5Z/EXA=3D?=
X-Exchange-RoutingPolicyChecked: s0VmNKLxdhuhyJmgdXTbmzs4gXy4nMxAyl2iD0NebvC4hSN4F5ZEHphKVKgZmLfr/Htb0EROfa5oSw/wJfp9OU6HZpCwXSLQLLhU4vnOZLv6fKN9E+bBHsZW17u5z1jnnHMgcT4rMyqB3BugerrduldNHykEmyCWo4GMlnH4VHzccSNyjv7aNaI1j9Yl3x0+wrSb3K4ANaBDNdArJkWTw2XP4/ioe2W51DXW91RgClXJ3PrpY/nlOb/4z58b1yhYGsKveZCth9hv5Zn9j1RAl8I1PeWf9WUfNnUwUiXBgCyhd+wzfTKSEf8S/wINKUfMnD0mwvQmqk6Vi/4nIGo04g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 948c0542-b85e-4774-abe9-08debc33086a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:00:50.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQpJPheFCzEZzkDp4iq1JCzSpCEyc3557U13Bn4WSAgsyhWnrAh/tuzFBtWoSzjCklJBJlYU7kc2x3X8oCG8Zbieb69a5zfhcqCdAWy83Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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



On 5/26/2026 10:44 PM, Raag Jadav wrote:
> On Tue, May 26, 2026 at 05:04:54PM -0700, Daniele Ceraolo Spurio wrote:
>> On 5/16/2026 2:31 AM, Raag Jadav wrote:
>>> In preparation of usecases which require re-initializing firmware without
>>> reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
>>> already exists but since it's contents are on VRAM, they are lost on PCIe
>>> FLR. Copy the firmware back to it's bo and mark it as loadable as part of
>>> re-initialization.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>> v2: Add kernel doc (Matthew Brost)
>>> v6: Skip uC firmware selection during re-initialization (Daniele)
>>> ---
>>>    drivers/gpu/drm/xe/xe_uc_fw.c | 56 +++++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
>>>    2 files changed, 57 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index df2aa196f6f9..c23c35dc2a4d 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -834,6 +834,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>>>    	return err;
>>>    }
>>> +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
>>> +{
>>> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>> +
>>> +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
>>> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
>>> +}
>>> +
>>>    int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    {
>>>    	const struct firmware *fw = NULL;
>>> @@ -857,6 +865,54 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    }
>>>    ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
>>> +/**
>>> + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
>>> + * @uc_fw: uC firmware
>>> + *
>>> + * Returns: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
>>> +{
>>> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>> +	struct xe_uc_fw_version new_fw, old_fw;
>>> +	const struct firmware *fw = NULL;
>>> +	int err;
>>> +
>>> +	/* We shouldn't be here for the firmware which wasn't loaded */
>>> +	xe_assert(xe, xe_uc_fw_is_available(uc_fw));
>>> +
>>> +	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>> +
>>> +	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
>>> +	if (err)
>>> +		goto fail;
>>> +
>>> +	err = parse_headers(uc_fw, fw);
>>> +	if (err)
>>> +		goto fail;
>>> +
>>> +	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>> +	if (new_fw.branch != old_fw.branch || new_fw.major != old_fw.major ||
>>> +	    new_fw.minor != old_fw.minor || new_fw.patch != old_fw.patch ||
>>> +	    new_fw.build != old_fw.build || uc_fw->size != fw->size) {
>> Since we want an exact match, instead of comparing each version field
>> individually we could use
>>
>>   memcmp(&new_fw, &old_fw, sizeof(new_fw))
> Sure.
>
>>> +		drm_err(&xe->drm, "%s firmware mismatch on %s",
>>> +			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>>> +
>>> +		/*
>>> +		 * parse_headers() updates version details, so restore original
>>> +		 * version before bailing.
>>> +		 */
>>> +		uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;
>> parse_headers updates more than just the version, so IMO better to
>> save/restore the whole xe_uc_fw struct.
> Makes sense.
>
>>> +		err = -ENOEXEC;
>>> +		goto fail;
>>> +	}
>>> +
>>> +	uc_fw_reinit(uc_fw, fw->data);
>>> +fail:
>>> +	uc_fw_release(fw);
>> What state is the uc_fw struct left in if we exit here? Do we care, and if
>> so should we explicitly set it to some error state? might need a new state
>> for it.
> We'd want to make sure we don't reinit the fw which wasn't available earlier,
> so perhaps just reuse XE_UC_FIRMWARE_INIT_FAIL?

XE_UC_FIRMWARE_INIT_FAIL sounds good. That will make 
xe_uc_fw_is_loadable() return false, which will automatically block any 
attempts to use the image.

Daniele

>
> Raag
>
>>> +	return err;
>>> +}
>>> +
>>>    static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
>>>    {
>>>    	return xe_bo_ggtt_addr(uc_fw->bo);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>>> index bb281b72a677..9f469bf07d66 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>>> @@ -15,6 +15,7 @@
>>>    struct drm_printer;
>>>    int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
>>> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
>>>    size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
>>>    int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>>>    int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);

