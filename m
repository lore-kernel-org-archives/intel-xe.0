Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B652CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6099E10E4C9;
	Thu, 21 May 2026 14:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Er0sgHns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9004E10E4C9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779373702; x=1810909702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=whdYvdvpnGNbg7IoIxBOFPdFiUteVmSoAtSuwbdRhPk=;
 b=Er0sgHnsbbGHqgmRGMh1/pe3TVcyVQfdZqNBF0EosAQUvJ4J4IYUSRgJ
 be8D12tz1B8MXp6u4hKyKzkMS5rBQH8ueefca6sckk9l2puLrvq4UaB8u
 JGyRmN70WwlN2Kn02SKOyUH0/SKen3lN5/n8I7HxtZ2oWdCgdj908lZ+a
 m5CTUHbK8heWBNovsFGzHJ0e65WSY6lKisNWyGh4mhnaecEu77sDH5Hrk
 qTc3uL63pkUla6ltnwtg6F4eHEnJf8pYujDQifGs9Dj/3eRk2mx93JW3e
 J/wGIkLq5hHw5j2hUO9cd+f1KljV++5pAIJ9zdMB2fKQW4ALyW0MZfCqy A==;
X-CSE-ConnectionGUID: h5MN/PafSa2wgg3XisVa+A==
X-CSE-MsgGUID: bx9vdqwjTLCpvmiyKIT0vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="67816787"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="67816787"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:28:22 -0700
X-CSE-ConnectionGUID: k71hASgMSOe/C9z0fvwALA==
X-CSE-MsgGUID: vGHIpENoQ9KaduuztbWgZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="239691162"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:28:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:28:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 07:28:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cX64bMvw28P1e/i8RkkZ+yqfX1M9/+6bcHQO6CUcIYT/KCMY6Uhjbp3oMXawiB771myQcZl5c5sH1Jb8RhX6dvmuYcc38UI/u52/2B21WdJZ9cfr8g78TT+pqnCdMaCuVFYneYKEfq3rNJh7u9QKTogL9zqdutbhETulfF9VPwinR9+EN290q5sjsZriTARLjgu3OBQ7WzsEmq+h7v6y00sULOA8z2u3QUXN/lNH2JTDa82w+4i7DHw1ammT7NvH+9naIobaNr29bVb0juzRR64S2TSpe6IpVlFgyhzdsBxDzJOQMeHBhcQRFWnU55bMxZAqJaJL2JjRtOanajse6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRunaPxFuW+kl7yF94HztL96QpMLyI394iLBzTxiK0c=;
 b=PpAV0qf9FsA/6cxb0LX7b7tdAucSSisvIdjIPIJLWzgNjdS3mQ+JBltvYWg0q20VOUd3lmk/VIftQgHu/j7vYdJkAJzWIrxD1XtQhJFD+xg69QqlE/kzTAVk6GeWQ4ScJfR7PJiy4E/SjEkt51g9gOCyQDSl/h7eIcOv3mOVKbdtx4mTEcELOjmjiWjX8I5z/rhDDyojyy5SJDSg15b0IaR+6VbnvVsfMIK/yg7jKFmTJab/olQHwLLSr6vYFPbcdJ1ZME2LLAyWXKGmkjy0Tridh1hpkFLG4gVzbkRjtQ5xdOY1ZpPeIQvPRzRQdzm8NTBTmDoYkODPDuZDyhI4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:28:12 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 14:28:12 +0000
Message-ID: <5c22a9fa-9f35-40f9-b53f-508f58c94487@intel.com>
Date: Thu, 21 May 2026 19:57:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
 <20260323151331.4043749-2-karthik.poosa@intel.com>
 <IA1PR11MB641869B65AAAAC64304A5AADC14BA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <2963f582-f449-4b81-bd50-2a610ef3b072@intel.com>
 <IA1PR11MB64181A4C32B5CA5E97ADED90C157A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <IA1PR11MB64181A4C32B5CA5E97ADED90C157A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f7e114-f487-44a4-c175-08deb7452fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1NoCq9eAJM+IQ1Hqem7e0K/vFsOazGN1tMhY58pMGSTv8bp2VQcBXmJjGomPT9jS7IHkfAs/DRxs0QoKEKHpnEMv6hii6eiOKMdgjjuksrWH5ER9ibBp/qO52KSAK7FvShxC9IkxFB8Thl12r+JtrBL0TSriWP14+goZsYrniMrDg7TL9ctHPlAP64wtDxjlYi6JQmZDHShiEAGPBSy4XxcWahKi2t9Y64ey2+fSin3CR7LXIjTSmtKRcIo6UeZmNOLNUIbOdB2coBYX4LWLflpLI88O3a9hyUVbxRtbJdu+HbsXai6N6KJKUFNb1CoO5IzkSp1x0vxR8OQHVse0wiksnmJoavdHNGbcYXf6gGtr3SdiGDYcfrnf9JIlksTcx8DA5JFzDnUDo+KJ0oySsjjiPM/C0y/X4ovDbyhrTdaCuOngBJXHQnt9aZYLkQo/jJ+Pdz4q8SVuKIEss6rPksEPWgLmmdrqPMSssJz1bFRQPAztKMZq7VL3vlfTNwOjw7kAV2NILdSNqSWpLeCj1plvfFRXjXDCkFvooESEcEE/M2B2l1Lk2PY1st8B7MfgIe4uZe+3HvvGHBnn//tnXS8I6E1qC+T0/d+3G0KGFfwdmuOiJYJC749MISVMFys19ou4td82K15xocQZxkUV316nuOEycnQPp7aOmpJJ2lirOLsdAebJzWaPaiZpO0dFbzzmvDiCNTU99zDDdDgw1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmw5MVl3SzJ5UTlad0VQN2V2aEk3OThHTlVmZ0t4Q09OajlUQ1JNUE80ZFVm?=
 =?utf-8?B?citUbk9kRm92ME9aQjVhYTdFTmZFVWk3NVNLaTFOZHZGdHNMdjhsSWV6VkNR?=
 =?utf-8?B?c1UzWXgyczlaUVFUNWIrOXhmdG8vRjVwakplQzFmMjc4ZEh1dFhJT2ZKR1Rn?=
 =?utf-8?B?QnN1b2RnU2Y0MnYrazVaaEFOejRLZi82YytwV3dUWFpTWDlkZ25IU3AyalZD?=
 =?utf-8?B?MzNhL3V5bm50R1REd211Y2VDWFRicS9rTGlBWnZiYTdLeUFiY0lXcndCT2RP?=
 =?utf-8?B?eGE1MEJ1M05GZ0xFRFMvcWJOMmRFaW5qVCt0Vk9hdlo4bjVJRHdMMUFGQUVx?=
 =?utf-8?B?TkQ3NUprRGo2OElPbVE5UzNTR240MG9tY3o4Y3NMcDR4N0VMdDF0ay9RT0xt?=
 =?utf-8?B?MGNBbjJacVdnWU8xZkR2ZkJEVElwTkwvRjdIbzZHTWgxODBIVm1kT05Yak9n?=
 =?utf-8?B?STBJakdmSUJpL1pGazJLaUJHbTVzUmhpaWFHaGgwQ2orcVJkVXR4VkRMV3V0?=
 =?utf-8?B?MFNrcDRnR2UzSGhYU0JWVWk3eG5WZXFxZklGejJiYlhvT3pvNmptM05wZlhO?=
 =?utf-8?B?bXMxVG9URVlWRUMwN3lETXY0RkxlMEJkK00wSzdOZkVZUWZaT0pQWlZGbnNz?=
 =?utf-8?B?NUpHZTJSSXRqalVHYUlJeWMyN0IxVWt3b0lnZmc3MHAxWEppbzVvc1d5NW5C?=
 =?utf-8?B?ZThGczU3WlJaWjFVTXdtWW1ld2ZLV1RVK2UzaitLWkViWkVkQWxBOERYbVhn?=
 =?utf-8?B?RFBJSG9hZHIrR3c0d21yOGlhT1liMUg2aDVyaUw2V2grNmVtcFFGaXhVS09F?=
 =?utf-8?B?dnlqNFdjL3kzKzJNeCtFSTQ2bVkrTzdSakZ4MzQxU0pFdG55NUlRWHdMakx5?=
 =?utf-8?B?WWUyVHJnWStXYUgzSzdQd1BJOFRWRlU4OWI5WEc0SUg4eDUvR1pDRHNXczdU?=
 =?utf-8?B?RXd4U2RYclBaN3JPUHcwMTZnY1gzMVBWQUVyYVdzSkxrb3I5WVNFeDVBOHM0?=
 =?utf-8?B?YmoyVml1YkozZ01pSFBHLzI4eEpTOGdWN1N2YXdGOVh3TkJxZU5Gdm81dTNv?=
 =?utf-8?B?VlRRZXNpNUN2Ykx6cDBsL3g2eVRnUGs4K2h5YW5TRUdmczhLUEJzcVp6RllY?=
 =?utf-8?B?SXg0MFBSdWJiclF0YyttWU05QllyNDlPQUphSUUxbXpoMnB4RUh3V0gvMmFG?=
 =?utf-8?B?TkMrMHJGWENjdW82OFZhNSttczZRQVFpdzNVNjN2ZVpIN2Z2djhqbFZjenJp?=
 =?utf-8?B?dG02bzJRZ1FmUGZDaXJVaVZsV0lyNVpJWkJaTG1KSDY3V2IrV3U4QTdUVXBJ?=
 =?utf-8?B?b0ZJdURrZk5Odk51bnVGc2pKMTZETUh0WnZ4clJSOG5wV3IyQVNEdHhmZlN5?=
 =?utf-8?B?TWxEKzlNeGd6ZEhDcGRveUsrZU01WWE4MEdUdkpwL2wyZmtRbXlScSszTTZZ?=
 =?utf-8?B?NFZLbnhBQXdQOEZjL0tYcFJaRlpwYWp1OXRvdTB6OWRIdmE1ZDdKSXRYMGpS?=
 =?utf-8?B?TG50UWZObGJ3eEhReStmeDJWRGpTQjVXK3dOTm9HeFdBVHdqeC8ySUtSTmxz?=
 =?utf-8?B?cFZmeUZROURIeGdLUjF2TzNiMkhHM1UvdUdWQ3NOYVF4OGs5MTBDb0h5OWRW?=
 =?utf-8?B?bG16WGRNZkRyZW1keWxhTUZ4MEROc1JzRDUxWUh0STRMYS94UnJVWnlyOUZ0?=
 =?utf-8?B?UGxYRGZHTmZnZm0zY2M0UlpXU2tHWlhGa0dLWVZWbm9DR3gzZjZsTVJzWkMv?=
 =?utf-8?B?NnloY2ZQR2pzWG1xNDhqVGdOdnBGdTNWcHZwTVF6ZVI2TTZtVFB5bmZIUitP?=
 =?utf-8?B?TmpMT0NyaytyZUNZUStFS1RwdFA3S2ZkUStaTnljSVhiU1ZCTVNlYWtHMlph?=
 =?utf-8?B?OTFlZVVGOVNIRjVXMXc2Y1N3OGFkcTY3QWhtK1owanc3bFAvQ2FBZG1hclpj?=
 =?utf-8?B?ZmlVSUg4QWRtMEpmM01jem42L2ZOVDNWT24raTlOY2tQS0l2ZG9zMjhWNThZ?=
 =?utf-8?B?b2wzR0d1SGFMZWRLN3RBUGhNQUdkYmkzTktvV1RlcFgxNnVSV2tnY2NwcnVS?=
 =?utf-8?B?YzRPRmZqYmZNTUNjblpwMmZoYkF0VjY2d053dkdLVmRCc1FBaUJPTnJzbkx1?=
 =?utf-8?B?Ulo5WFJWS0llTW4zU2c5VmtnRy9QaTJabmY5eHdYVXRFUmhxZkFjZ1d2bVVE?=
 =?utf-8?B?NC9rUzhUZlg3aC9wU0YzczVzcnJkWjVpb1M2ZWgxTjhEWmM5RHYvbGtabldy?=
 =?utf-8?B?K1p4T2VKak1CMEt6S2pYTjBUeVM4NFhJTGkzakhoQU1sQlRjZXFKb1Z6WXdH?=
 =?utf-8?B?bzVRL1VDa2FOTG5FYlVFak9YR3lRd2hnZTUxL3lpcnFQLzZOMXFBQT09?=
X-Exchange-RoutingPolicyChecked: rxtnoGjIlLNDX4P/Hh7cZW61kX8IkZvC6QkTBPZpkTESOtkepQdArGe06oB+ZcGKIYiheXy5YstWIbpp7aAuj7QC55jkjx0V3hesyxDzkYsVfoof9ZUe0vd02c4FlicN3Jwfec8v5RewSMFhA06ylY3dPiyo8Q2LRsLP7j5hBRaPNKLJ3Izm+vZqb70RpsOisXedYCzpLBJR3V6H2Lgcvq3WiunU3HlDOG0kdEchN5vpG3+7ti6H8HIRu1PMs4vfbHuDq9l6/mjSItSTT8+65PYg+M3erVKzHc9erHIYLj9lCDTHahS6bO9SdEcPydqJz86ZzDNCXbS8gOP35ythng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f7e114-f487-44a4-c175-08deb7452fd0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:28:12.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0S5sWoTZYreoGrXi6u/ji8h1BYujF0K9dG/PdnM6nX3JCyvv+yEn47ordGKQ5WyjEVUFuKpkzm4kCt4P7Prvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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


On 27-03-2026 17:48, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Friday, March 27, 2026 12:05 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav, Raag
>> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>
>> Subject: Re: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
> >from PMT
>>
>> On 23-03-2026 22:11, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Karthik
>>>> Poosa
>>>> Sent: Monday, March 23, 2026 11:14 AM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav,
>> Raag
>>>> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>> Karthik
>>>> <karthik.poosa@intel.com>
>>>> Subject: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
>> from
>>>> PMT
>>>>
>>>> Add api get_pcode_version() to read pcode version
>>> >from PMT telemetry.
>>>
>>> I think that this patch will only support the currently define BMG
>> specification.
>>> Is this is for BMG only, the commit should say that.
>> This patch is intended for BMG and post BMG also.
>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
>>>> drivers/gpu/drm/xe/xe_pcode.c    | 18 ++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
>>>> 3 files changed, 27 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>>> b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>>> index 240d57993ea6..8a70e17912f3 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>>> @@ -15,6 +15,8 @@
>>>> #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>>>> #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>>>>
>>>> +#define PUNIT_VERSION_OFFSET		(0xA0)
>>> Is this the offset defined in the for the BMG PMT XML definitions?
>> Yes, here it is
>> https://github.com/intel/Intel-
>> PMT/blob/main/xml/BMG/PUNIT/bmg_punit_aggregator.xml#L1218
>>
>>>> #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>>>> #define BMG_TELEMETRY_OFFSET		(SOC_BASE +
>>>> BMG_TELEMETRY_BASE_OFFSET)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c
>> b/drivers/gpu/drm/xe/xe_pcode.c
>>>> index dc66d0c7ee06..1ebe622e947a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>>> @@ -15,6 +15,8 @@
>>>> #include "xe_device.h"
>>>> #include "xe_mmio.h"
>>>> #include "xe_pcode_api.h"
>>>> +#include "xe_vsec.h"
>>>> +#include "regs/xe_pmt.h"
>>>>
>>>> /**
>>>>    * DOC: PCODE
>>>> @@ -348,3 +350,19 @@ int xe_pcode_probe_early(struct xe_device *xe)
>>>> 	return xe_pcode_ready(xe, false);
>>>> }
>>>> ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See
>>>> xe_pci_probe */
>>>> +
>>>> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
>>>> +{
>>>> +	int ret = 0;
>>>> +
>>>> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
>>>> +				xe_mmio_read32(xe_root_tile_mmio(xe),
>> PUNIT_TELEMETRY_GUID),
>>>> +				(u64 *)version, PUNIT_VERSION_OFFSET,
>> sizeof(*version));
>>> If the XML definition (and GUID) are rev-ed, how can you verify that the
>> PUNIT_VERSION_OFFSET is also the
>>> same?
>>>
>>> It looks to me that this usage is locking this use case into the current BMG
>> definition.
>>> If you are not using a BMG, is this expected to work?
>>>
>>> Will all PUNIT_TELEM ALWAYS have this information at
>> PUNIT_VERION_OFFSET?
>>> M
>> I think so, let me confirm this.
> Karthick,
>
> How will this be used?
>
> This code will ONLY work for BMG (and possibly CRI).
>
> I would suggest that the code that you want to have here looks like this:
>
> 	if (xe->platform == BMG || xe->platform == CRI) {
> 		guid =xe_mmio_read32(punint_telem_guid);
> 		if (guid == EXPECTED_BMG_GUID || guid == EXPECTED_CRI_GUID)
> 			xe_pmt_telem_read(guid, &version, size);
> 	}
>
> Is there code in place to ensure that this will only be used for BMG/CRI?
>
> Thanks,
>
> M
No, I shall add this in next revision, we'll enable this debugfs only on 
supported platforms.
>>>> +	if (ret != sizeof(*version)) {
>>>> +		drm_warn(&xe->drm, "couldn't get pcode version from pmt,
>>>> ret %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n",
>>>> version->major,
>>>> +		version->minor, version->engg);
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h
>> b/drivers/gpu/drm/xe/xe_pcode.h
>>>> index 490e4f269607..8dd472049921 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>>>> @@ -12,6 +12,12 @@ struct drm_device;
>>>> struct xe_device;
>>>> struct xe_tile;
>>>>
>>>> +struct pcode_version {
>>>> +	u16 minor;
>>>> +	u16 major;
>>>> +	u32 engg;
>>>> +};
>>>> +
>>>> void xe_pcode_init(struct xe_tile *tile);
>>>> int xe_pcode_probe_early(struct xe_device *xe);
>>>> int xe_pcode_ready(struct xe_device *xe, bool locked);
>>>> @@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32
>>>> mbox, u32 val,
>>>> 			   int timeout_ms);
>>>> int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>>>> 			     u32 data1, int timeout);
>>>> +int get_pcode_version(struct xe_device *xe, struct pcode_version
>> *version);
>>>> #define xe_pcode_write(tile, mbox, val) \
>>>> 	xe_pcode_write_timeout(tile, mbox, val, 1)
>>>> --
>>>> 2.25.1
