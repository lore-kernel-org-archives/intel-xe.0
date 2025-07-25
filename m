Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EE5C87FCD
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 08:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925E710E14E;
	Fri, 25 Jul 2025 08:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERVjdjqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95A210E14E
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753432783; x=1784968783;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6GFrL5uvS1V/oPJ4fFzZnOY6i5pAhIvwlzGDyRFyt10=;
 b=ERVjdjqrNOzVFLU4TI4nIfpd9/ohw3YbDC2ug3KvtNxAIYkPj4hOeqyu
 TI6OGj2PfLMrj2JHFWobTDf5SrHJrOZi6uEpJsRezQaU6iC+EM2G1QglQ
 psRqvF9+RIDBj+fHO42KXPCjHR4PV+ZDKXsPovy/CbuQtJIP/6U2y/wgD
 9MVcEIymer2rlvJXoM+B8EbHMPMmY/stSzjBo9vsoH3B8BDftMDk57FgJ
 QILNQAUYUtOBW2hX4hR0K37zre3svGy945WT/2jN7iWJ/+RQZGNmRWkVG
 FTO33fdl6HPQIcxK+G38Ko0SoaXhrQtI/ob5D3Znmb1uhI6bVx04DT9j0 A==;
X-CSE-ConnectionGUID: wDBjjVsrSvCj8WKI+hyv3Q==
X-CSE-MsgGUID: QGov47bvQL+f6D5E4NUPng==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73345075"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="73345075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:39:39 -0700
X-CSE-ConnectionGUID: KzQnf2fpS7iez3ssUVUPoA==
X-CSE-MsgGUID: VWAsK9sBRFW2utUWnMmDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161540090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:39:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:39:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 01:39:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlM5C70r9wEVu8C0e6rsiKeVJOepVenuRHEtMZ+Aob1fvQuwDalK8i+vUnSiEUMvkEYCvDdZ+kWuRS5Y4DxWIizrWktsiiAt+Dhaa6rkvPALqaWIGKyJdBbNrQcP25k9NCybT5vwUCJEg521BNeNNq0NeWJQqxZbMfm0TDiVCMJWI616oMRwOj56RifT8rirC+n68qHhUQQqmHlRK99CQJu+0bN/feOIVBBYtK3Vu0uh4qo7Y7F/QrqDMR9edwSNCWBbOV3JHehkLVN274m7Io44N/XHhRGXroj+5TBt0KAqiGXgpOkKgtnnNbUcn2T6WmdiCYVZ8gQRerTE2wHTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDUgVBNZsSuGwAo8pxLbULvSEWH+r9TZwpIS3x/cXEM=;
 b=mDzsiOtykCUDZf3CNmHZG8ivchFczyZ7Jz48UZ4W5kpJBzJYDWJK5/8jNZUcDgNNll5edtebqSeD7IHxP/u+chjHFJtgXLOprPf8zn543sx0QJuu93aKedQwfV9LCiRNxANc9pHRhLYes5BpyU85N3ygdgtPTueI7JOOIkrv2tr0X5vi3JfJrEZJcg6ORtT+gWF+8PNJD5+B6nQzBTVzZ/JVfKctmZN6RzInR4wKc85PCPr6EpFK77zZ2Vdpogfk3UF9+fVujv+Yo2XVGO6E+h5auaUBWqUEf73cTkFzyIQJ/DDcRpEVB7a+DMlr65y1HAOh+wqMzxgALABoHgdfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 08:39:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 08:39:16 +0000
Message-ID: <90ee2b17-5744-4e7e-88e2-d715946b056f@intel.com>
Date: Fri, 25 Jul 2025 10:39:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/guc: Add firmware build type to available info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250725002111.3906267-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6481a2-e65a-4e05-2089-08ddcb56bdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bytLdnhXZUpzeS9aUVZtTVhTbGYzd2szN1M4UjgwVk85L2EzME1BZ2FPaGZu?=
 =?utf-8?B?N1RUYVR5UlRzZnpCaWtCV0lmQjg2eCtQTjdwUUtmS0x3aTNhWTRZTVZKZVhG?=
 =?utf-8?B?Vk9IVUVOVmtPMU51QXdySkwxejNvL1ptSVc5L0E0VTZ2TUxjSVNiZ2xEZ3c0?=
 =?utf-8?B?YmlNTDEvUmtvY1JHUHM5V2hOUU1LZitvQVJSSTlyRDB2YWoyRFpOWS81R2JT?=
 =?utf-8?B?enRWV2V0My80VEpxclZ3bXFFMGFiTVU2aCtFN0pQdktJWmMvd1M4OEJnNGdk?=
 =?utf-8?B?TDBSaVpYR1lXY1daemVUR2lJRkUybGgwYVRsMXl5MlhQWEdmTDNtQmE5djFO?=
 =?utf-8?B?ZW90QjF5dGQ2Q2ZzV1pNOWFoTUVkUGhYZ3R3SEtNcTg5bDRwcUU5R05VQzBY?=
 =?utf-8?B?UEd2SXFBUDVQbzI3ZjBaOGtnaG1IZ0FuWEpJSFBOV1NwUC9ZazVOTlJMV1Fr?=
 =?utf-8?B?Um1RUnRzdHYwdnh5aHZQdk1IT041ZmlUWGw1Q0N6R05VWTFXRTdUR1RERFli?=
 =?utf-8?B?Qi9Nd3BmRmNzSmNKaXdLM2xRWjBaQmNOVHRGRyt4aWdHT0VXWGtjUmJjVkY2?=
 =?utf-8?B?aDRIbEhrZVR0M0plL0wwSmUycWhEWExZWUZqaXdpOHRLUVlvSmVLZC8vUFVj?=
 =?utf-8?B?clV3dEdwK091R1VQQmkxYjAwLzBLM1dUNzhFZHF4cWw5aWh3VzNUb09IR2xa?=
 =?utf-8?B?c2dJdWI4Qi8wdnoxTW4xSTJaMjBXc3QvRVN2MENaN1ZlTzAvZFlaQ0tJMzIx?=
 =?utf-8?B?WHJMQ3dHVHQrN2RTZkN5bDUvY05MMHF1YTdNYTk2M1RveEhxdkJ0MUphL1pV?=
 =?utf-8?B?bExJRUFaeWRWWFpJL1lJUTZNbmVOMVExcmYrR0RBU0pPaVhybU9YUEc0STlY?=
 =?utf-8?B?ZnBXZWZTeEVWUTlCM2FsdjRjS0ZqYnBEbWc2aUVsSTc4N2wwMlJFY3dvdFNX?=
 =?utf-8?B?QysrZlYxVk1NcmRqOHVHajdpRWlLRXh3RGUrM3dkZEdEbVc2SW5YYXNvanBB?=
 =?utf-8?B?VUFva0hKY2d1VFF6VU5mTGJ3VllhYXNzZmpUVGxYVHN1VTNKNnZlMjhObFBR?=
 =?utf-8?B?RU1nVzFTRzR1alcrdTJyazM4UnNEZ2VJR1lFbC8wOXEvcStqam1HSjA1VU9k?=
 =?utf-8?B?eEFoUE1ySG8vNWxjWmQ4ZFBFM1ljeTFMamFWTHlJQXhzRjljaDlacWRsekVH?=
 =?utf-8?B?UGUvQUo2N01rbHdtSVNsaTNYNW53WFFUN1JSVU1TbFRsZ0NDWDU4RitUck45?=
 =?utf-8?B?ZG04bU9MZm9rNndka2FtL1lwbk80MjRJbU9DWjBGcVhuZUx0TFdxVFdyNEJT?=
 =?utf-8?B?cWJkMnM0V3hjL3ZTMGxGMmZlWHdtSTEzUnVpRndiZ2hLeGxtTWloRGsrRGdo?=
 =?utf-8?B?ckJNSGY3OGFvM282dGM5ZmhRWFNrNUVCenRrdGxqc2gxUUhxQWtMWkU4bGty?=
 =?utf-8?B?SHd0WWdteXR5NlplMVVhbUFwWTBBK1ptZ0xjZE0rOERkOGc5SnVZZnlMdktz?=
 =?utf-8?B?QlMvOFhTcW1FUmt5OTdkN3YwMXlRVmVrdG1mem1rL21BZ3U3SFFNSDJCdTBQ?=
 =?utf-8?B?SnNxSW85SEFSNE1kc1VHT3o5RGhZVkxpTDF4TCtBdnhoa2hqZktsaDhnRFFn?=
 =?utf-8?B?OFI0aVpGSXpaeGs5WTdEazNXdElOOWFxd2xTWGUxLzl5TTdadlpWS2tBYWFa?=
 =?utf-8?B?cnIrZ3VMaFcrNjdLMmJDZ09IUkFBeS8rMUZVNDRkS0NsRkRaUG9PUHVtWnRO?=
 =?utf-8?B?ZUZTRzZvWUNBOCtyeFdjM1VMMDAzVkxIUjdIa3dWcDVFQVdyc2xMb2xPY0xV?=
 =?utf-8?B?d2UwRWlReWJ0VlhKencvRk11cjNsZkZzWDUrVjlHd3pmKzQ3VExxSndSc2hT?=
 =?utf-8?B?Z3llM2txbE9NbVcyRnNnUEVOMzNuYlVJMUx3cGhDZXFqUk5oNklFL2lpWUNy?=
 =?utf-8?Q?4qunjz9B3H4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dvRU1PWjNXUFoyd1VJTVB0bkZCN01ieERJaXR2YjNVREdWL1lXMlRSd2xy?=
 =?utf-8?B?OFpFUUdGZVJTVXMwemxhaDZGL2RleTYycHlDcGtCbWx6TmEwTHRMWEhNYzN0?=
 =?utf-8?B?Y3JPQ04vRkN6eUxJeDVSK2cyZGFVZCtBRFVPVnFMNTVYZUdINUlSZlQxZUMy?=
 =?utf-8?B?RkpWcjdZdmI1M2hPNGFCb2dXeGVQajVoSlhIVVVEdm14ZDR0UmlIcDRtZUIz?=
 =?utf-8?B?bFNkSEhBczh4NkZTUUljZWprR281TDZvNjNCUXU0TVYyNTR4TzdrMmRTVzdC?=
 =?utf-8?B?VUw2azd6UnFvR1pwd3hkWlRJb0F4Y0g5a3E0eHRvT0E2QnRnM0Q1Y3BRTXBH?=
 =?utf-8?B?K2YralhkdjRWYXdnMkhvVm5Ba0ZXNTlaS2ZvdXRUUGdYc29GSlBXc3dOWGN2?=
 =?utf-8?B?eDlFaVpSanovdHlyeklod092MS9LZi9Kait2THJVVUJkY2NaSmpVcDJ2WEVm?=
 =?utf-8?B?SnVpd3F5TGwwanV5WXhIWDNmRnZhVldEeEIxSEJOTWdlUDg5TVNqTkJuWnVv?=
 =?utf-8?B?YlU2RXNLWTFqR01xcEcrWTBOOVpHOUZucS9IemtKK2k0SFZESkV5QTZ6Z1o5?=
 =?utf-8?B?K3ozc3RpSUtqNW5kQUxjVGkvSHNRMWxvU1V0R1ZhL0dPUm1rTTNTcHRwcmdp?=
 =?utf-8?B?L2VzMUZtWC8zSS9Jb09iM0s5dzNDODByT1hDbk1sUkZ6b1NQRWRYK3REZTJv?=
 =?utf-8?B?dGRGaHdHQmh2c09KQmxrMHRNYjlJc3diYmhTT3NnVjZrMXdzck5tblJUazBB?=
 =?utf-8?B?MFZpemNJS0RkTFVWN2haK3U4dDY4ZWtrSnpvZHRsYmhmelRBRFZKQ3N6UG56?=
 =?utf-8?B?eDlsL1UrdW5JV2pqNitFakJFdkpISU1MS0lnbUtnUUR0WERFc212K0E4L2tz?=
 =?utf-8?B?bS9tYzZxVDNjdTdIcUF3VjhvVGV5Um9qRXR1MG9WdjZqYUdvZ2F1ek92Y1VW?=
 =?utf-8?B?T0g4UWhJKzBRbFVCUm1aQzk5M0M1Z1lURVJvWVRrTUpDZnlxWGI2a24xaU9V?=
 =?utf-8?B?WE41OHRPYndHRlJIN3RMdy9saGI4QXJzMUhKZzQ0M0kvTGR3UktNRm0rd3VD?=
 =?utf-8?B?d2dpT1pZdEVSL3NtekNFaTBzbDNBVy9INmRrM3VhYStwZWZJTnhhWmJuWDlk?=
 =?utf-8?B?Q09TQm1WUEcyb05WVml1Yk9VNTJobTdTWEUzR1E0aUU1a0ZMUUNGQStJN2cy?=
 =?utf-8?B?MHU3OGMySUhuSzlHdHV0Vy9aajRScEMwRTh2aGhXVUJtcU9KOXFNRWoxU2Jx?=
 =?utf-8?B?YkVvWDZpUDZPSkJqd3VzNTk2YXA1NTZmOXVBOUNaRGpNM00wTGZtZzFGaVNp?=
 =?utf-8?B?dGpYb0VIcFlxck1uYlhGWWN0QUF6OVJzL3JqWFVoVmwzajJOOCt6UmU5V3Ra?=
 =?utf-8?B?aHhsQTV2ZlhEV1RTVU1oMWFNZlpteWh2dUdEV2FpS0tCOFZhSWozQnE5eXhN?=
 =?utf-8?B?QzFjanJ2R0IvOEZ0a0FVNmI3M3RIa0lQTUNCQzBMdFY2VkZDRHMvM2VuL2xB?=
 =?utf-8?B?c2JxQXRhZ1pWQlpUWjZJS3VkVTFyMUNFcG42V0p3NXRnd0k3NWhGUFFVVURs?=
 =?utf-8?B?S0Vnb2NSbitKNE54ZUVUWGRydzlHdWZDc3YzWlN4U3JjODNoWmRiWklRbTRm?=
 =?utf-8?B?V0IrbUQxeXhFRWJOYXFVRmx1MjNUL1dEUGRSQld3elVNakJYamU5SHp1WmpL?=
 =?utf-8?B?eVZDSi9tUktVRUFkLzNoaDZXdHI0TEpIRTVkTmRJNTB3dzFFSUF2NXFWdVpS?=
 =?utf-8?B?ZjBMS0tLMmJrTk5jTnRMZ0xoTi95R2gxMGFLYnEwVnhodmpKM1Nzcyt5SHk0?=
 =?utf-8?B?TG0xT0dUQVlDNFVPcVh3MEZMb1VaVUYrMDF1SlFNUURKMG0yT0k0WXo1Zlk1?=
 =?utf-8?B?UG1rSHNrMlR6blRwa2lNMkY5WTVMWlpHMm5DZmhOcjIxb0RFM3ptN0Mwa3FD?=
 =?utf-8?B?V25OdHYzRXNoUmpJUVQvcjhnbnQ0TEh5TjRaalNyQ1dna2ROcGgvYWxZT0hI?=
 =?utf-8?B?VSs4UXZsaWRZZzJubGVqWEY4Q1ptWlpyYkVwMHErTkVmT0ZzS0ZlV09GdndE?=
 =?utf-8?B?cmNXL3preHFuSVdYcXJjZTBsbndPclJZQ3ptamJMSE90VGtTQ1Raa2VJazZI?=
 =?utf-8?B?UlB3WHVzVlR3R3JxUHJ5STlkbXAzRW53UWdabVg5U3BGR1RxcjRlOWNhMStE?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6481a2-e65a-4e05-2089-08ddcb56bdb1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 08:39:16.8359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tiRF1Djjk+6sWduAAE8ZC1fw3tTIWmGwqGF+JiLKOs8h9lBF0JBxPurmjqnWWFcXUcQPTzEHzr2Xkw5eoMdDvW535Qhgz0sbB5/pQQyJCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
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



On 7/25/2025 2:21 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Some test features are not available in production builds of the GuC
> firmware. So add the build type field to the available information
> that tests can inspect to decide if they should skip or run.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c       | 1 +
>  drivers/gpu/drm/xe/xe_uc_fw_types.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c8378f3e0032..d51827c969b8 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -348,6 +348,7 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>  	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
>  	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
>  
> +	uc_fw->build_type = FIELD_GET(CSS_UKERNEL_INFO_BUILDTYPE, css->guc_info.ukernel_info);
>  	uc_fw->private_data_size = css->guc_info.private_data_size;>  
>  	return 0;

maybe we could extend our info message to include build type? instead

[drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0

something like:

[drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0 debug
[drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0 pre-production

or

[drm] GT0: Using GuC debug firmware from xe/ptl_guc_70.bin version 70.47.0
[drm] GT0: Using GuC pre-prod firmware from xe/ptl_guc_70.bin version 70.47.0


> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 914026015019..77a1dcf8b4ed 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -147,6 +147,9 @@ struct xe_uc_fw {
>  
>  	/** @private_data_size: size of private data found in uC css header */
>  	u32 private_data_size;
> +
> +	/** @build_type: Firmware build type (see CSS_UKERNEL_INFO_BUILDTYPE for definitions) */
> +	u32 build_type;
>  };
>  
>  #endif

