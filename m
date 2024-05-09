Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4F3C04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80EB10E0AC;
	Thu,  9 May 2024 00:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhKQdWWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224010E0AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715212981; x=1746748981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sbg4hfQh0bnBtWIWD+10Es/gFh7gRMd9W2YhF0C8D8U=;
 b=VhKQdWWUijxKN3fr3peBg0zf6dnwFbHdTC+9dvFKD1V87orsZGd3s3Ue
 3NZAfPjLQUNwKBij3a7ajNuw6qZAC8rhixn6sAUSR4iLa1yF32vCACQ0P
 szFBK2Vs+tArFxn+vDkO+5RFc7l0xrOtcT3F9vpuiY5ediHMxeql3rstA
 NXzyMDrxi5faEKjgyXAoC55zkv6XRRh1aG1r4rb0EuPK6ONw5HS3apgEB
 Nk5QsIKFpJvBj1JPRmMgSkpXzXcsTUDwTo/0AkZP2npheNryZjaX20EFR
 IE2smcL1v1ZuPAlEERuB1HmBcxgPMi+g/fHCrOGsxT4acY2f62aSb7ble A==;
X-CSE-ConnectionGUID: u5ys0kI8Ty+BiVQF1BP5vw==
X-CSE-MsgGUID: xBfF9p6rRCCk4ZoT5oHgXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11044140"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11044140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:03:00 -0700
X-CSE-ConnectionGUID: DKVZ+8YwQ/+a7EqOeoH4aQ==
X-CSE-MsgGUID: JIS3G8hqTZS3LEnDXQCwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33743534"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:03:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:02:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:02:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:02:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZV8dpd13iZdM1lGwnjnisJZhjBGIj6eZgaWhxpTI7bSMmpcvUi1lDLpiNgbLQe8GYTd+WejNtUKb/gBFyzv9jbOCcLmtP3/b4Wk/1Qs43Iasd5Li5qHCum16vUJfeaqNjGp7T7JgVAIxCkcbQdJxJ435cS2bWRbmRnF8+uIuVkjDy877VbMkU+tRknkWDA8xiJi2Vavum+5KUsXcPgy0uXDtDcLABGIigPrJfZf1v8Ajk7NczDZidfOMD/IBrtUn6faq1XAWqtxDHoIPKZlNDoJWwvXdFbdI6sQFNdAXwmY3S4XMtejgrFjKo7DKZom/oGl0K6D9fjJCLkQ2bpiwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPDC66IdjTt9fYkgLbR38svaI2PS+6XEBp4OFVYWdDU=;
 b=AftavxjIdFlw5e3K87Z71dG26AyR2x6BbA/qHGchZARglfg8iTHc85DZucnj4D5YdQ5E3Zk+CjPBbmZ+rbjMih/EUIHNQqoP9NAxyjWhNuB2u7ngetmBmem2Xwhft2nbxYBMMp8n4cndvqV4qfmLzqf01lCfULz7tpuEjGDdPA5p4Ty1J9N6q4WKAxBdastjnddewasP+oSGi9rD24B/DSAZsVBgDKal3ju8U6n/RYBvol+TcuSlmpH1TNQiAZxd7ub+D1x+ezW2NlUMwRrO6tApRxUNti6a0WdCLqyzjjieHt6YXaFojOzJgm7dW+ChswkB8+9PiHOV0KsqMlRC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 00:02:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:02:50 +0000
Date: Thu, 9 May 2024 02:02:46 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <rikw6e4dvlzxjuqettrynpf5oycrc6cbzlrjecfxt4uwmen4dq@tp4l6vtmzn4w>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425182410.2705061-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: ff51fc2a-46c3-4f77-581e-08dc6fbb5dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkd5ZEtQRmtycEl4cUJ2U2dMUVJCWEZEV3lLS01JN0hhcFRaTUNrM0wyRkJP?=
 =?utf-8?B?ekhmSHpxQ04vb2hVQUFWTEZkdmhBd3lOZXFCWVNmVzdCcEZudDlBRzBuUGc4?=
 =?utf-8?B?SVQzRWpnOUFSK21RMThLZnlXWTRYZmNwTDExOTdrQ3JpaWJzbldrQW1kVndJ?=
 =?utf-8?B?Y0pDY0lBUnRtMHlldnJudGh4ckJSZ1dSOW1DL1MxbWhpSWEzekNIUDYrcmJy?=
 =?utf-8?B?SmttRUVscVFTTGhuTU40TDNTYm83QzJyMW13SG5SQjh6Qi9xdTI1SmZNQTU3?=
 =?utf-8?B?QUFwVFhpa3V5SXNTekRobWpDdkxQaGYvdGJBWU5LL0E5eGpjcS84TE9CV3ZG?=
 =?utf-8?B?MkxwckR1V3prQko5dklrOGhTaUZzVE5vTXM4ZFZGNTVYU1lDZWw1SDVMWWlU?=
 =?utf-8?B?WmlESFFtVDhsNzdPODBQSGtpWmNEYm9rV09WT3l6WSt4NHlWMUhzOUt3ek1U?=
 =?utf-8?B?bk95WlgrZW00TEQxenhVRmZreWVaYXNpZ2ttTVc3ckJXaTVNcnlwS05oN3k0?=
 =?utf-8?B?cm1zWmZ5RzlDbVBoUlM4YlR0enB0Ym9FNzlqSnkyRGRpTU8wU3lNc3Fqamk4?=
 =?utf-8?B?TitnamRNbXdUTVRsN2ErejFldURpVXd3U1FadmQ4L0dmRlJ4RzBtcVlPQVc5?=
 =?utf-8?B?MXFzVnljMEp2bXFSNVNZdllvME9vRVNBTFZUS1dLTExHK3FiZEYyajBucjZm?=
 =?utf-8?B?OXY3UlM5TVFtSDFDd2hjVmtFamdYbHNNK21Bc2VtaDRJWUQ0RGl2b3Z1cXkw?=
 =?utf-8?B?Q3FyQXVrLzdpMVZHakFwYkZnUHlXUkUrTzFFTVAxRXVoZEExSXFNekV1YXo4?=
 =?utf-8?B?TkFIcSsxS2FkRVAzazUvQUk2L1RFWlF6VFlPZHZDL1djeUFnTE54WWM4UHV0?=
 =?utf-8?B?RUNTdzdBY3FRaGpWb0V3SkkrQ0psMUZkajVVMEQ4bHV3M09vUEZxTmk2YjFU?=
 =?utf-8?B?ZDRjU0pXSHlWeWRYYXZNQ1BXeDNSbGZMczJ0Nk42bUcwKzU4VkV5QXI1MVZB?=
 =?utf-8?B?QWNoWnpsQ1BYb1ZHTytMc3Fob3dWV2piWG03OWJ0V0NkT1NVcnp1VU5FSlF2?=
 =?utf-8?B?aitSeGJ4NnRVTWZqUVArTThWSEdvUHlJYUZoZUZtbG5NZDlYUkJSczI1bFJ6?=
 =?utf-8?B?ZVJpdEdkSjV1K0pKaGtQSWdFbVdpaTNIY0tCYjV6VlJGVjBVMStFc3o4YmtL?=
 =?utf-8?B?MmhVdVNIM2lLWFZ3M3JqR1ovd1lBWW4vQWJsQUlQeFN2SUNDSUdMTGhPSU5U?=
 =?utf-8?B?ZDJvemwvN0E2RE9qeHhvaER1MGZpZEJEV0RXMzBVTExWK3hFbjhTZU9wK0c4?=
 =?utf-8?B?cmxidTB3WGc0cTFlMGUxeUpwNld5UEpvcEhNU0IvTXJtL2lzeTd4UHhpVzMw?=
 =?utf-8?B?THA2Y3hYNlVZR3dmejhYM2JvbmE4LzR6UnpHN0x3VUtFWk51TE9yUWlPNENQ?=
 =?utf-8?B?Zk9uWWQvMkg5VXFjVUxLWHZvbjJLZG9YSFovZExRMmFqZU9yU21qQzBhbXlN?=
 =?utf-8?B?Sm52VmM4d3AzdElDOUtwMVE5R0xmMCt5SjlKR0cvcVl1d2F0QkpWc1ZPby96?=
 =?utf-8?B?R05tdStESHd4blNwTmE5WVJ2MDFxWkhwVEhYc2RLUHhWc1JyNjVWUEIrakxq?=
 =?utf-8?B?OWhZbGE4R3k2T3gyU0RvVFdZRENNVHpIUStGdlgzTHlxUzlSdUlPM0FId3Zq?=
 =?utf-8?B?WGJTOW1LUkExSDFkQ0gxWlJNYmpaS3d1dU5pc21vNnVObDNINzZkWTdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWp2bjB1alFHQUdFeVNJL2FtTjFNZVQ1d0sveDZha0J5YTBNY05zUnlncTdq?=
 =?utf-8?B?dElscEdGVmFvU1gxb3Q2NGtyeTVVVlJLTWw1WE5iK09PYzJWc0FPaVB1Wlpx?=
 =?utf-8?B?WWJTZmppcnd4djZ0M2IvMW1Na0p3THZibmR1Mi9MME9aMkdtaUhUZE10UnZs?=
 =?utf-8?B?UituVTNCaXhUeDZHN2FlbXpTM1dnSUZFeXdmek90dUhwRVpScWtYZW4vMWJa?=
 =?utf-8?B?ZW1JY2pMT2xOajY1UG9GcVZjRFd0bi9HNHhORENreUhVVHdZWHFQaHArdHBj?=
 =?utf-8?B?c2ZkRUxhRDJ3MWRTTTRyVG92eGl2K1NXejd6dlBTWkU4eUJ1ZWsrNzRIQlR5?=
 =?utf-8?B?eFRTaE1iSWpjM0JGS3pjSDVkMWxtV1VYNE5UdUUxOVloTXYwcGtwL2Nic25Y?=
 =?utf-8?B?ejFnbmVjRWNKaFNRcGp4OG9neWJNRXo2RXBPME9pdmRrYnZvR1hIZ25Bd0M2?=
 =?utf-8?B?RUd4RzFqdk5hVWlPUUdlSTdrNTkwTTV3c3RqazNFRXV1VmEyN0R6TG9mYm5X?=
 =?utf-8?B?NW0xaXJ3WjYyODhiK3dlK1RDWkdUZTdmcldjS2dRZXpsbmZPdkpHU0RBenRk?=
 =?utf-8?B?aVNDSjdUakd3TXVsN2NWSEw5aUc5ZWdIbS9QNEg3ZXo0eWRORC84K0R1bll6?=
 =?utf-8?B?TFdXcEl3Sm00ajZTd1JJbmRzeWtPV3BYUHA1dlFyYnovUTRtNmpPNG9mdnhM?=
 =?utf-8?B?N1FuMjdiN0F0bHpvRG1lWi9IbndMdCs2UWVVQ0hRNVlMS1ArQzZtOWV6RE1t?=
 =?utf-8?B?WVNvRko0eklIcVAzNFh1SkxiVTVIdVkyR01xN1lVWXQ2ZDYyWmlRZnhNVWRl?=
 =?utf-8?B?R1FVZ0xkb2pwaUI4aG9FUmhqNytRZkJhcWJSM0ZZa0xNMGJ5ckpyNkhQQUdQ?=
 =?utf-8?B?emF5aXVGSHpHTU5kcXhDQ0xKM3I1T3U3bXpXOEFBUDUyOE5mdGI3NFNVV2po?=
 =?utf-8?B?QXZTbFdjWi93MTByZ2kvaEtPSnpPWDU4SmVMYzdLdWFnNWVXdHUrT2JxQUdv?=
 =?utf-8?B?MEJtZ1pvbEg5ZncvMGwwNGFNT2lnWWFMZEtmM2ZPTEpjSi90bGxiM0pBUExi?=
 =?utf-8?B?V1RNdmpDOVp0SDMwY2MxMEx4ZS9naEQrWDBLdEpKTlFCVTlxalZONC9jTy9a?=
 =?utf-8?B?UG5oSG0wKzBSYmdsd1o2QTZYN3Y1V25rT2tCMkxoNFRkQlpBQ3B6b0RRRjFK?=
 =?utf-8?B?WFJZQm5NMW1xbCtIWUNwRStFSzhLYS9rMDBTWWhIcGVab0tTaDNEZEJ3TmlS?=
 =?utf-8?B?NkczTDh4Z2hjWWs4bWZnK2NnMmxQMWZ6Y1QvMmt2SGhJbW5JNktDeDdaV283?=
 =?utf-8?B?WkZ2bWRmN1QrY3hLamdZQmZOTDcycEc4U3ZRVms5dnNFSFBTVjRuYStlSWh3?=
 =?utf-8?B?dGx4V1ZUTUxVNHg0OEJQSTVjYjNQK0hnN0Rtb2s2RXVlSUhPTFlSSDRMYXBk?=
 =?utf-8?B?aGZTYUd0allreFhuZEdBbjY2REhobjFuUHp6TmptaDRwUUkxc1lIZWk1d3ZI?=
 =?utf-8?B?bS93V3F5Zjc1eVpNYXhFNWR4NTQxVmJyNkpQbGtZSGwrYWtPYnR5RDFwUHNQ?=
 =?utf-8?B?M0kvTUVUekRtTWd1aU9DNUQ3Smc0QmwzU0xqUU14YTdJQi9QYUtUWVVNZS9Z?=
 =?utf-8?B?NzBUN2MxeHZ0aEY0NGhlS3FpenJYYWJHU3RlNWpzYzhMdjgwZ1J4Y2NMancz?=
 =?utf-8?B?Ujl2Vzk2NjZ1eWI2ZFpCdFlnbENYWkpYR092R2tDVjFzR1RWODAwU3hLL2lh?=
 =?utf-8?B?Rkx3MW9ocmtaTzlSV0xBQjZQQm1PV25oalVmcTduM3lyNVVISnk2ckFqb2J6?=
 =?utf-8?B?eExLeFNINjNKQVB5MkRhMHcwd3hwcjdKNFBIU3V5QXpiR3VEektxM0lzS2lL?=
 =?utf-8?B?dUZFWWx0UlNNY3laaTlESk1TdTRmVUNxUC9IU2JZSnFhbUx5Z3JwU3NCVUZM?=
 =?utf-8?B?aE9NL21KZHBwUnQ4YWhzbkczODR1cit3TkJhU1kydUUrUzVhUXczM1d2TUV4?=
 =?utf-8?B?bWJJNytTWDlpM0xZSEVJbkxyYzI3R04wa09VZVU0TUEwZ3NtN1NNeE1qM0R0?=
 =?utf-8?B?VkQvZzVZaE1SMUNyT0Y5RzcrMEdsaFVVQnA3MTA4TWN5RlZrdUF5dmtLYVJy?=
 =?utf-8?B?NWpFcEhPMDdlUHNpS1c0L0JadXB1UUZRYWN2U2dJZnI1N3N6SEliOC9pM0Ry?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff51fc2a-46c3-4f77-581e-08dc6fbb5dd4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:02:50.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IHZXOM/gL+HN0UH+xHGoRa0iTaxLcriuts2CAmZyNT6evOuPFR905paKUZJCCS+w9gShRIl9xSl38w4/DOHkAlpCweogKGv24wnnylvwP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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

On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
> Not really used, it's just a copy of engine_mask, which already reads
> the fuses to mark engines as available/not-available.
> 
> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>  4 files changed, 4 insertions(+), 14 deletions(-)
