Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F71C8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 05:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E3C10E036;
	Tue,  1 Jul 2025 05:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrTMvRXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E4010E036
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 05:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751346578; x=1782882578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XfAM4lFSksHR7Phz2vp6o7J+LuudJGXQwkUzYkEgS2U=;
 b=KrTMvRXNSDEfdfm6Kxwe3CUKQ0ep7QQXuxfIGtb1E2PwMZ+gAXLU15Mc
 QV+MhVHOZ+QLalD0n/7wmUuQRuAIzFQyYGrrWQ7e0q1ArO/N6wEA85BlR
 hY0EfAIS+5hbk+Pj4Zj6PwfHKGlneAQWDQUjP5oaHh9dsoeM4wc7HJF8y
 UPyQHrxEh8kB9xrenFn+JpxORa8FnE9TOwV7aQwzBeLHV/w8kN8vnaAVr
 9unkia9OHRCq7xSQGHiqbARy4An/OIlzOC5c8PAy2YwtNpuNwXnvZDIu7
 7hoEtt08WJBY80rOedtDF8F0LTvsK5LSuO/1qW60PTKOQCxzcNy+gWNtB Q==;
X-CSE-ConnectionGUID: 9twWghuoSdSdmzolxe1Wpw==
X-CSE-MsgGUID: cNBhSuVnTSmWvw415VzrcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71018131"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71018131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 22:09:37 -0700
X-CSE-ConnectionGUID: hIrJIdbdTzm/WJhOJi+Dcg==
X-CSE-MsgGUID: p6blgoNMTVCH5CdzpVDWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153831585"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 22:09:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 22:09:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 22:09:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 22:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1CRCWW/GifRzDoUv566EjpgfWgyjuiWXDLZUSqTd4yi7l+Ctiqpnm35+ueAwwp/lcw5DrObgMot34wwuUJIQTSU7uUWpw1QdRIF4r2D5STKxDz6oXMCI4E8SKDKPydzfIXN1pt80B4Ynb+7OwTzkZTNBZKmjDdkC+IsCwhfTeF3iS+Ou99LOvcIUpNAPsngHGkOzzEM6URDQ0zODzp8mKTDdwxVrO05sQD7203QhyvMqmgMizCWuexvLF1wtjTyDOITVMZw6+dfIlrohV09lDXgez9xq71A/puE2Z+860zCmuWW2PqpYBeyx5TnI2PoJeM1AcM0jqPr7J+k+DPH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW8yTqaYavlFRTnq1IYA5yoZJDAIMT9xrxGDr3VXYok=;
 b=XfY88T33jopoxXFx4Rd7IRCQNdPMJh7NHFvLuOktZBpM7s1Ydi6L/HtM1pw2+XtWxQrKGI0IB/3VEBwS6MyG6X5mRD/MaIP4SfLAKXuz0IX9AKan6y+L0VUbSDdQJgwMhv7qO3MNqjeOhvc58jaeUxuDlp2yaIkLjxNQh1eeuWFQRAjiAbH+AZ1GFMvTO3NRZKM8swNeXhDeZIm+PYwO+n29Adz2hr7199Ri2o61MNEXPtYMQC6evBbx+UAj3K0+ypcLyzim3hRYFCTuVSqZ/TED0PDolHrjQcVwXOAikjx+1u8iy9riQ9pDF8aGJ2ec1JOmz04WfUE3YawOamH3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.30; Tue, 1 Jul 2025 05:09:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:09:03 +0000
Message-ID: <855160af-2d62-4f3d-aed7-623019248876@intel.com>
Date: Tue, 1 Jul 2025 10:38:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <sk.anirban@intel.com>,
 <soham.purkait@intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d1e575-f2dc-41c5-f53c-08ddb85d6572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXA0dEl1L0V2cDVWeEJTYmhETkFKZjZHbXBmRTlMb3VIaUR2R1lXWWpyV0xF?=
 =?utf-8?B?eTk3NDB0VHF4M21ZRHBLOXdNNE1mS3ZNaXpwSVhjS3BhdjJjOU8rYzZXODNu?=
 =?utf-8?B?UnZxeXdFY2krR29HUGhTeGxhaTJyQjZHM3VUb1F2SzMydFg1S2ZPUlZsTGRG?=
 =?utf-8?B?SW80cUZrY1V1N0grMXpUT0J4QzhUUUh0NHZ5eC9POTlFOGt1M1RZc1NrQ3A2?=
 =?utf-8?B?YTEySVlYQU0xRllYWXVYZHV5Ry9rcExsYVpxOHUrMUs4WWF5dUlvajdnV0RD?=
 =?utf-8?B?Mk8vb05YcG1jQzA1V3E4alEwbWxVVXpGQmtxZlV4MmxhY0Z2WWQrQmdSYzUr?=
 =?utf-8?B?NGVUR2RvdHRSZ1RueVRXRFF2MjNXR2tUVk9ScnBtdEpCN1cyb2U4VTlwSy9K?=
 =?utf-8?B?U01odTkvWmNIU2VkK1RUSzZ5ZVdqVDF4UlNVM2MzaVpMSnY3Zm1pZVF5NXNX?=
 =?utf-8?B?YTRCVkJSTEkrM2R4VWkwTnpzSlpqR0VUYnNGeDVkVFV6YVhxd25NelRWMUxY?=
 =?utf-8?B?Qm5Ra2xmK3VjdCs0NmhyNVZUVURCS29VOEFIdTJ4UG9wYUYxSTIybE1paG12?=
 =?utf-8?B?THNWMllLQTQ2Z0xKaTk5ckdYY1ZHMzJTc2FoZGRET1ZhZVpzRlR5ZFgzalV2?=
 =?utf-8?B?Y21zdlBnUnZYK2JaVWM1T0M0a3RJelFVdkZsK25QeDBDVFE3YjlycjF6a2hh?=
 =?utf-8?B?SzZzcUxNR284M08xZkJnS3ZXOFdRRkl2dWhqeUhLb09iWU51SWlQWnhVNG1p?=
 =?utf-8?B?NEJKcGRzVHBUdVk3ZlRUV1BQc3laY2JyN2RCL0hsdUFqOVZBQ0tDUzdqVytl?=
 =?utf-8?B?SHRDZEw5NVhTeTVvZGR5cFg4OGU4S3AraWZRdEVLVEdIM1JsOUVVQWJ5R1Jo?=
 =?utf-8?B?UHpOODVuSFZrUE9iQVZvTG81NnhpSFlUejc5aUpxbjBtaGZzU0E2dHBCL1hw?=
 =?utf-8?B?WWNHM0FGOUs1YWJIWC9PMExmZW9jckUrcTRmak5pSkwrZU4zUHJNcjZXRmRK?=
 =?utf-8?B?emEzdks0NVVVQjNuUStFeitINlZGekgxZ1c0czY0LzJndHZJM05BNUVGVHEy?=
 =?utf-8?B?Y2huRy8rUGkyZmRpK3V1MUV2cXN5YkVLTFdvMmtBdWRPSnNzdWRzbTc5Uzdk?=
 =?utf-8?B?cTdOYS9CM09oYzJyd3d4eE1YRjBjTk01eWhRMmN5SVlZTU5IV0wxMTgwODZQ?=
 =?utf-8?B?RnZLUGE3NlhOMmxPaUZ5M0tjWGkvRlo3SndaZGNOb2R6b2hXNGpoaStqYys2?=
 =?utf-8?B?UzdmbkRUT3M2VlNFcEFVaUd5WWNWdUlSOVVJcmU0YmhwcXd6NFhZa2NKb2Q2?=
 =?utf-8?B?ZEtTaW1BVlNZamZXM3VSNCsycitJY1pERWlrRVBMNXBsSi8zZHU0cVZGTGcw?=
 =?utf-8?B?Rm8vVTIwTXRvbm1ocFk4QlRrbDJjWUZtQWhhZ2tnbWxiQ1k0WEdsbnF2OUJ5?=
 =?utf-8?B?aG9mR01mcXFtNHhqQThCY01aOVVKY0NOR01IV0NaT0pZZ2VMb01oK2VpUmZH?=
 =?utf-8?B?OVpPN0JBUmcwWk1acUZILzVjNlY4QndZakJIUnM2S2ZnVUU5OHFHSTRiZU1W?=
 =?utf-8?B?Zll0ZExvalpXNjU0OXNJbXQzRHc2R2VxWC8vYmo3UEVteUFvMElLenhnaG4r?=
 =?utf-8?B?UnRZVGY5d3hXWCtPQm1Pb1pNclQ2OU5Yc3JYOFhCZHNMNjlYUlBrQ3d3V2M1?=
 =?utf-8?B?Z0JMaVdzLy9jWUQxdkhBUGx3YVFNWUp5SkcrNjlDaDJnd2dNL1lySHlZbWl3?=
 =?utf-8?B?ajNNL0E0ZnhnaVd3R3lSbFJLb0F0d1ZVMnoxeUljRlFzNXowaHNwRWsyMlBh?=
 =?utf-8?B?V0Vpb25kTm1iNkdtVmVLenVwZkJVcGJ2c29TaFJsUm1rRWUzYkh0M1dIMEpZ?=
 =?utf-8?B?UndjenZDK3NVK2Z5SE1US1dNenNzNVVhRWtJaXpsTm8xV1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVkd3h3SzdoU3JVRUZYTW1DS0FyR2NybHdheVdzd1BFYk9oa2dSRGFvaGVs?=
 =?utf-8?B?NzZKbDBUN25SV3J4YlMrbFh3UjBGazNwSktuOXFEcnFLWlQxWDBlaWxReVBi?=
 =?utf-8?B?d2sxSGV3a3JISU9sdDFwQXNxcVhsaDlpeERnMEZNN3NOT2l6eklTYkFkUk1D?=
 =?utf-8?B?d2d3Vnp2RG95c1hKN012WWhkVmtpbzZHUHF1bU9kR2syMk8vbkdXZWlWUmJr?=
 =?utf-8?B?a0N6K1oydXJ5T0ZyQ25SYkdvYXRaRlIzdDhPbmRFOVl4Y0RlOUVqN01JOERJ?=
 =?utf-8?B?WmNaRzdMWTFnUUpZVkhaR0NUWi83ZVZiR3J0M1ZmUUprMExocnRZZU5hbEZX?=
 =?utf-8?B?SS91ejZMdUdCVXd5N0FGWVhpVnViMTFzMlBXNHFJZWE1L1hqVWZQcW5LRXc0?=
 =?utf-8?B?R21DTHlKdlA0RU1VbmhUbTM2RUxmL3VzNTdZYVYxM2JZamlnc0xnOEVIWHhX?=
 =?utf-8?B?VDFJZHZITmNtRGg4M1lIMytrUzJrQW9wWlRvZHdHMDVNMzM2ZjBXMjliM2dG?=
 =?utf-8?B?K0ErWUIvcHJpQzhwOGYxcTl5NmdOQ1FWcWtheFV6V01KZjIwQ3EvVG8ySGNz?=
 =?utf-8?B?S0xhS240TTRyU25aclVSMFlhS3JlekNyeElOTDVhZXRZZUNDUWQrMmt0VUtm?=
 =?utf-8?B?aGxzYXArc3NIbjZGTUpGOHRqMzdTMWQzWjJyajFEZ2J2alVqczBSSUpTTUpB?=
 =?utf-8?B?c2M1UnVTSHVZVHRxZllrMllUU1habDRlWHo2RFNyd3ZJTU1uR0JCK1RWbVNx?=
 =?utf-8?B?OW1UR0NHcFRGRmhwSkUrZnZ2U3ZVTjNnRlRPamRMNzhmQnBaWm11YkVDbFBX?=
 =?utf-8?B?MEpPUWFYWFRYY2VmOEdpVHkzQW1hSjhaVjZFMUpYMWs4elRiLzRFZUMra1hE?=
 =?utf-8?B?N1hxNFN1a0lEeHMrK2RhSHlwZnA2SHpHNS8xd09Rc3JCRVFsOHVqeU53WXV1?=
 =?utf-8?B?T1VIRkdjUTRmNHFPSjNkMmRQRk1ibXp1b3ZUb2U2NE1ISnVzWGZ2ck9oRDRU?=
 =?utf-8?B?ZnhHM203djUvT0RJNFU1U3FMbGlWUGlPdTF6SG43eHVTdlFKNmZoRmRRRnBI?=
 =?utf-8?B?dGwySVRHQnRtUzdLYkErRW9PQ2lNdEpnK201cEU5K2F3Ym9rbDUrSjBKMEdG?=
 =?utf-8?B?NFBodWY2dEFGMU9udStiZTZLWE4rWE9IK0txb1JhY3pMWHJrLzJtNEEvTFJZ?=
 =?utf-8?B?ZXdZL2VYTTI2ajZXaVhVbDdOMFM5MkxCaHptUW0ydW9jR1lacC9ETDJxcU12?=
 =?utf-8?B?RG91K2pia3ZlaE80cVJjczRpRzBLOHNFN3lBdW5ObEhiTk5RZWF0Ny9TT3Nk?=
 =?utf-8?B?RzFYZE9aSW5pT0lRTmk4V0Q4ZldkUW9VTEJVclI1ZmhzTENIbmY2K1RmeWp3?=
 =?utf-8?B?RktJdVcvNkl3bVBLOW9ybTQ5WGx4dzhRZ3hMSm5lV1psT3J5MXlrUk44VDBy?=
 =?utf-8?B?WnhRV1FMbUwxM1hMZUxlbTZWSVNzU0tLeFhXQ0RFQkIrNjYxWHhtRWY3OFdT?=
 =?utf-8?B?ZHFkaEthbHNVN3hGTVNpYzhXazZmR0x2VysrWkdIQXFYb1BVZjF4cDZlV3pp?=
 =?utf-8?B?M1pNWk1oeWFpbmluRzFya3huS3V3UUtZS0JxQlZIamhBbWs1MHp1bVAyNTNK?=
 =?utf-8?B?eGV3VUJqV0REVFd0eFU1SVduU2xKa3dXaGhwdkNKZnFHcUcxcjhDdElGalF0?=
 =?utf-8?B?V2dQd0JLaXdmUWpuY0VPMmh1YWtVY0w0dS9GVGNDMVp1RlVCZU5KaTRneGFO?=
 =?utf-8?B?V1pNRnRiV09GUGw5MDFoUi9jd3NzZXhQUEJ5N2h1Zk4xZlg5czVYR0ZBcElZ?=
 =?utf-8?B?RXhnSmxtQm9PTC95bUlqRmlSYmNobUtkZ1JHbXh0am9UOHlCd25wem1pTkdl?=
 =?utf-8?B?OXliMTRDejVKWTVqWmd0LzBtSGQzS2xNSjI3dGNIdGd6YmJ2VVZtVGhUVWJB?=
 =?utf-8?B?NkVVbFZnemlmMjRzNVNoRkpVY1RCSWRpdE5DcFBNTVQ0RW5iNHZoa241MFRp?=
 =?utf-8?B?Sm1ra1hJcS8zOS9DejRBUU05UU14Mytoc3B3akhkWTc2SjIrcld5WkcxNmcy?=
 =?utf-8?B?OGc0bUlBbFRXZ0J0VGRva29pRkJFRVE1OFBSZm9BRmllOVdSaHpuamlMdlEw?=
 =?utf-8?B?SmZiUjE2OHZjSVA2ZDlCeDBIbDEveUgvaVBPQ2tpTlp4Si8zc1Nibm5jNGRh?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d1e575-f2dc-41c5-f53c-08ddb85d6572
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:09:03.4525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89eSbiot/pH7hzy/NEmIHxQAClcbU0gn7OrK/gPhX/+OexN1g39uWItCs2lP/GNc/Oqs00puPuDyH3tysoklIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
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

Hi Lucas

On 7/1/2025 3:58 AM, Lucas De Marchi wrote:
> On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
>> Validate gt instead of checking gt_id is lesser
>> than max gts per tile
> 
> I prefer the series from Matt Roper that is refactoring this part well.

Hadn't seen the series. That patch needs some modification too,
Replied on the patch.

Thanks
Riana

> 
> Lucas De Marchi

