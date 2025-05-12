Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A56C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 20:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512C10E1DB;
	Mon, 12 May 2025 20:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUchPCJB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFAC10E1DB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747081005; x=1778617005;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+jIvYS7LA21QDhDJ1tpZEBrsbAHJc81c09V0c69hi6g=;
 b=HUchPCJBhV8baKU43/TvlYmhFp5WpD6vvnbhuekRUdM7aQtRJZKurrYH
 F9UNpihkX5g69ENNqyuGOmf3BdCULlzBmL3kEOLexhsa0pCdPkODJzr56
 dMrp2e04ytYxXafadWwihV/0o6t5quhYBGaGSMU3EwFnzwqWlDeq7x25E
 gN++B9t84dZ7nxM+oTTEBrXx7j+tFb9wXVF+pIecQPbknODYd9Qx1mSG1
 SrItJoPYygxTFtgWPbYPYOdCzZFggchKG+xpg25tUUfLJSr9ZLhUtrtnA
 w744VZPs3T1RslQzOMqMr+gPzUqy5ZaVtDFXdcepctHTorI1DVOiOlxa0 g==;
X-CSE-ConnectionGUID: dMWNXnXQRUGY0RDKNo5+Pw==
X-CSE-MsgGUID: DoIrSrViSZ+2SaI7kUlzUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66308749"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66308749"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 13:16:42 -0700
X-CSE-ConnectionGUID: L6oTuhJDQ82yUMzCP7cUAA==
X-CSE-MsgGUID: qYnFOX7MSAKw+dxN8NEsNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137947760"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 13:16:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 13:16:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 13:16:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 13:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3I12ZSJ2q3cFosZ9j0/38UbFus9QQBlcF8Fpgzg5wWNCEieLEaNA/jLtodniJOcbmILcIeeqkg/OPp++yC7H8AIbH4fgzeByUITF46Y0w2COT0sERfjyNrbp4UgAp8QByorPvN0lBgh7PfPZ06eTM6ahnT9p0JzzDuqbQh6Dz3g/4+Bd6tHEk4UF1C5njQ2YhL1KUWesnTbWgwNgDLUg30wT7T22KsiKq3z9ZV6bn5JV44ED1Q7sR3msxu+/tmno073NCTkVFy0vP2ejt1bRv0IJHovIzqnMwFWzRqIg2apMtUfs0SntDcq2B6HfnTiVTKnkNWoxTwAx6umoK9ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXfpjjTlUhv80Wqq+xCGCI/NDKsjF/0GW7Au0e/T5T4=;
 b=wI6l9SDv9ume2PvqoR7+bWVZVhdM9Ej6JbikBWjNW/G1CpbqNUZtHMFw0Yv7sXPO0/DpIiuhujJ+gMEUkVcqCEGj+huxnGvFIPpZULyaXBeCVRZQrT7xHfC5ijR7ZMG52UZjTVqOyAPMTlYAqsfQ1absawryj8NkWxMvO3SsiAiV4vi3OvqRhdK647sEAZoXaOpfS5bM+u8GHopV4eHTmAHMMfcevMtUyjt6BwJD6oOSiXyOo8/L9y1eOagurnjJe4ImuBpy3B0uOimI5dUiuEeF8gb4XNN51DPaFG1WUoWiT00QcYvM+IXg5Bog+kK4C545ug2sgJbiRRy71VOnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 20:16:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 20:16:24 +0000
Date: Mon, 12 May 2025 13:16:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Support active context utilization (rev5)
Message-ID: <aCJXFiuPuZer7ma4@unerlige-desk.amr.corp.intel.com>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <174703046435.67540.7907652714269476118@c664b1dc75d1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174703046435.67540.7907652714269476118@c664b1dc75d1>
X-ClientProxiedBy: MW4PR04CA0272.namprd04.prod.outlook.com
 (2603:10b6:303:89::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3de17a-bbf4-48fa-197c-08dd9191de4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWF6S3F2NTI2UlNBUkRqVU94MFg0UTJnT3dmZjVsTDVIa2MxR0FrMHczZG90?=
 =?utf-8?B?QVVUOFN3NThQaEcxZmdiV1BVampVTDdnQnVhNG5OeXFVZFZMNG0xVHp2MktO?=
 =?utf-8?B?ZWp6R0p6VVBheU1uV2hzMUYyRk11RFJhREl5S01OUXZBM2oyRnNnZ1ZoSGRa?=
 =?utf-8?B?OXhhTXU1N1dVVWtKUHhVMExTTEFXYTNON2hTVGVjemU1NVJDSzRKbnBkQkRq?=
 =?utf-8?B?dVNnSFJxc0NXMHhHTGJZRnBuL0VEQTFzUHRieUh4S0lqYU5ya0dnWC9zdEhJ?=
 =?utf-8?B?cmd0T3puS2toNUZlVzVhTUJhaFNmbEdWbm9SbktUVk1jM1ZvMWtwK21RQUpX?=
 =?utf-8?B?elRjNkovQTA0RDE2Z05ia2JKa3YvdFc4TjRlZk9GT29PeFFYY2ZSZFZ2SnlZ?=
 =?utf-8?B?eTBGdEF0am1BMm5OWDQwVngrNUNUN09hMDFjekRMNW1wRFUyNXYyNzdOVXFC?=
 =?utf-8?B?UlNiVDlUdktCa3JMYmVqZTZYUTRHMk0xeVBjL09hOU1PSVEyMVZyZk1Ib01G?=
 =?utf-8?B?Ry9wakd1YzZ2RHMrZlJzRmczN2pLNTI1SnZLdmdYamxSTHBhTjJvdkVvdThi?=
 =?utf-8?B?WGxmaGdqd1lEQ1RLSkYrTk1pRXhRWDcrS2FtL1owR24wRGpuR1BYek51RXkv?=
 =?utf-8?B?dDFwcHdQeGh0MWpzZzZFOU1CbjhWL0ZYVG82V1FKWWZtU014dFNrQlNVV0JI?=
 =?utf-8?B?MElLTWJNcVJYbW9vTk5tRkU3SU1ITEppQ25sRStqRmw0QzlCSlhwdHg2VUZa?=
 =?utf-8?B?ZlJtaHFnOXp2RnV2UWZTZUo3NzQ3UWV0SjlyMDZnaDVkb3hzU2R4bTFZS0ZB?=
 =?utf-8?B?NXJ2YXZLM1dTaHVuL2t2UndzM1JKL3htNEZkQ3FQYlp0YUE4bmd5Y2R3WUhB?=
 =?utf-8?B?V0xtSEx2Qmd1SVBpajZ1aS9VT0YyR0RmOEpuM2FuN0JhdDViT3dLYXcrMDh3?=
 =?utf-8?B?cWlNMUNnWmY1LzdtV0hIdU1aZ3V1bGU1ODczanpnOEVlZUdoR2VPQ1VaRkV5?=
 =?utf-8?B?M2Q1bkFuUGNtTXZ2a2FBMG1lRzREdmFRUHpsRGpnaElYNkhQWTFHUENtckF2?=
 =?utf-8?B?RVdMblV1RkU1M1hWaEdNaGRLNXZRT3JEOHRyZUovcmRBN1o5czU4eWlla0xj?=
 =?utf-8?B?NE5UTmM0OXZaOVdUbXB3OURKemlPVHdwdzI4emFnUHJKRUVZaUN5NkdlZFR6?=
 =?utf-8?B?SXc0NVVkaWlrQ1M4R1orcUFuSG81aEdZcCtERVYzWm4rSVh2Q3lmaU9LSDRU?=
 =?utf-8?B?Qit1L1o5RmJ5UStuQWF0TXVWc1lFQnNaZU0yTWhTTHhBQzB5N2V6dDJJMnQ0?=
 =?utf-8?B?VmE0Y3dnSDdCbGlYYkJkV04yNHpEamR5Vm9jV1l1ejFWSlNaVWFHbUkwenRG?=
 =?utf-8?B?S2syakZ2ejBWdkwrZDV6cGFuVjZHN1htU3dOeUFNUDh6SldMMVdqdjZHRWNk?=
 =?utf-8?B?WnE4cHQxWDB5S1c5b05TRGREUkFiQ0tBMlByYUNYUU02T3c2SGlnT1R5ZkNB?=
 =?utf-8?B?VE43QVczbjhBcHlMYlhSVzc0cUh3bThGV0Y3MVFaSFhCTjQzZGFvcVdxUTB3?=
 =?utf-8?B?NzU0ZjcyQ3hlRkE3VW5sTTlnd2RhRmhRdjFYaXhlNFBTT0JrYXIxZkptNGMw?=
 =?utf-8?B?Y20xRHJqa0dwY3RibksyRFRVSmd3SzRhM3hHcHBPakpWVytoS1p0UjA4elFl?=
 =?utf-8?B?NVdGcm1SUFMxMWRlbDZqQ2tZL20yV0dkRVA4OEUrMGhybG5NSnpMTEgwRUF5?=
 =?utf-8?B?WVNlMm11Wkp1ZEJld2R5cEgvV3NMNWQ1K0ZNM2swcVpzVVhVSnBSbVlvMHFz?=
 =?utf-8?Q?ia+/SjgZv93XJZPLobi0BtLfuRvvcwz7dyYV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytlVXI5dlZlTkVjWWYwaDcvTFRoZUl6ZERiYVNqWlhDM1N5dVdKamQ4aWVJ?=
 =?utf-8?B?dThoSVdTc050b1F4L3FPVTNSNGhPQzFIR1JFT3BjTHM5a21xb1U2anI2ZE53?=
 =?utf-8?B?UkJwYktnd1JWcWZPeHpTOGlSNzA2aDVVdnhhK0Yxc0Q1RTg1ckNoeWkzYVVj?=
 =?utf-8?B?bEJWQ3g1djljaXlXSi92ayszZURhTnErMkdieU5OOUVFaUhrc0haREdJblQz?=
 =?utf-8?B?YkpPRDlwUWIzdlJ6bzRra3hiN01yN0ZjMDRXSUY4c3EwL1pnNXIzbllrOXZ2?=
 =?utf-8?B?Wkluem9CMHdobG5Pd24xUVVHZXZjb2tXTUtOdkt1SFdyZkVLSWlSQ2k0YlND?=
 =?utf-8?B?OGEvb1h6Q3ZLNi9OZ0xrV0JLU3pDSjRscmQzTGMxVG5UcWtUbVZtdW4yZmc5?=
 =?utf-8?B?Y0FFdDNid3FoVGtZSHdsU20rbG81TW9jbjNsOUZ4bmtjc1BUNStIMjhsaXlN?=
 =?utf-8?B?QXQ2ZEdaZkR0eEkzanBpbVFaSFQwajBCSy84TC9heHViTEVCTVRYaVQ5L1Jh?=
 =?utf-8?B?UFpSTTJZdVpidGc1NCtRV3lVcDlNeXpheTNKYkhmNlEvT1c5R2RnaTlHaDFX?=
 =?utf-8?B?K3hsRXIxb29MQzE2anp6bFdoT29MTWN4UWpTU1dHcGtlWVBSS21pcFlsT3lh?=
 =?utf-8?B?WDEvVmlQRWJ3eVBUZFdVUFlqcFpHNUZEYU9ROTF1eTBJZUVmUXpoOXpRMFBI?=
 =?utf-8?B?aUp2Y3h4YVdveXQxQmpFSXlEcFpteXh6VlNGek53OUVrT1VZRXpCQzVGeXRz?=
 =?utf-8?B?VDlaU0FENUR1NDZadjhPL2ZrQVJaYmdFVjAweXIwNWM4dVo1a2FKaFZxbkNM?=
 =?utf-8?B?SkJsTmlTU1BzU0xoV0dFOEZuZTJmSU5iS0tjTWVHN1YzanQ5RVRFbnBqUVQ1?=
 =?utf-8?B?ZitJUUhkMXR2dVBwQkF2YlhCUFVQQjRvaHc4SnJHejhXTytBUkQ2djdpc1k4?=
 =?utf-8?B?ZnBYcHlRblB6SDJuOFQ2dlVRY3FDNXBtZDdnNzBUMy9EaVRlOUtSSzczWGtx?=
 =?utf-8?B?YkM3RUg0YW9HS0N1WjVTaHc2ajBSUzJ6MW9RSTgzWVZFSis5Q0drUnNqdFZz?=
 =?utf-8?B?WkJoZ1dNRitHc0h0VVJpdnc0N2lqS0FzaHBGZ3F0T0NwdExhSVhtSG9Ic2tQ?=
 =?utf-8?B?eGVSLzNpeXh3MUIvTXZyU0xENzNYTEpHMHAwNmdXbTZwYWtLVitEYXhRT0NG?=
 =?utf-8?B?RWU3dzdWdUpOV2hQRktlZnplaHJiSEIrOS9QSjExN1ovU2RwQnRNdEhzMlpx?=
 =?utf-8?B?M0YrOVQ1U0RxeFAvREI2b1FFNWNXZW1pQVFWQnhtUmFsQ2tkSnorSVdPQ3VS?=
 =?utf-8?B?YUp2Rkc2a3lBaXlXNGE3QnhySGU4RTZ3SEpJYy9zR0UrbWpYMytxS2dDNVVW?=
 =?utf-8?B?VnRzUlkrbXFkUkZuQ2hQOTdkMm0yNjRwMjgrVytIKzE1R2dZV3o1ZlI2UXl2?=
 =?utf-8?B?Y0pxYWZaclc1QVdNREFOYjE2T2tVRFZpTk1rb3E4RkRFMlJPaks4dmJJVU9x?=
 =?utf-8?B?NSt4UXVjNHJJcUw3L2laSERmejg5MXpMMjlEMUwxR0M0UlpjZTcrYUdzZWV6?=
 =?utf-8?B?UkZidVlqemJsb0RTS29BYlIvOVpTOFBYZU1JL3dKWEgrZkt6bDNUTTlTWEtz?=
 =?utf-8?B?UCtnNUlRVzZjWHZtYytmK1dZUys0UmN6dER0RTU0ZUJHb0habGVLZTMram1h?=
 =?utf-8?B?RVQ4aElTZlNjWmYxMWlRcDVNanQzRUswdURXaTlNd2hUbmtOOCtPYjVjajQ5?=
 =?utf-8?B?M0dCUWdWa2RPRkMrNjRVOUp6U3hPS1crQnBQaFBvc3R6UTYzeWZFN1h6dDJZ?=
 =?utf-8?B?M2Y2NHRQR1JLb1dibkQyNHF2eGtvQTkva3lmMVpxellyK1RqMllxeTRPSnhH?=
 =?utf-8?B?Z1RvTG5jMDVzN2pjMmRzZVE2QnRueDllUHc3VWpQUUR2RmY1V0kvVFI1eXY2?=
 =?utf-8?B?RmppZU44L0VOQkR4NUtlYjhRSXo1QkVlaGZXdkxVNUlYU1M5UlJkSjVzNmEx?=
 =?utf-8?B?WXZOM2dMbU1uZ0piUVBqaHJETGZiN0lGRTJ6Q1poQlJsa2FlRTl0dEZZU3hr?=
 =?utf-8?B?WTFDdllOOEYzTXB0SmRJcy8xKzlzYU1EMUNucExRTENQNHY4QnlFZlgyUENw?=
 =?utf-8?B?SU9zVlVpRkVPYnROS3Q2ajJNcmp5dyswUFpRUDNqQXZyMU55dlpxN0hFSUdD?=
 =?utf-8?Q?LuV+eZ7Ubl3Gl7G3a1w/IHA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3de17a-bbf4-48fa-197c-08dd9191de4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 20:16:24.5199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCi1yp3t1lRzlKV0YbUhEFI/BXKdQxNFqJ7poj9JT0dkV3nlkJUAnC7UMDuj1aU0pUK/nX+LYx64yGsQ9EK8Wj+B+DO1Dmy8qn4brfqgGGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

On Mon, May 12, 2025 at 06:14:24AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  Support active context utilization (rev5)
> URL:     [1]https://patchwork.freedesktop.org/series/148302/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v5/index.html
>
>CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_FULL
>                             -> xe-pw-148302v5_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-148302v5_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148302v5_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-148302v5_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     • igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
>
>          • shard-adlp: NOTRUN -> [3]SKIP +1 other test skip

Opened device: /dev/dri/card0
Test requirement not met in function __igt_unique____real_main401, file ../tests/intel/xe_exec_fault_mode.c:476:
Test requirement: supports_faults
Last errno: 22, Invalid argument
Subtest many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch: 
SKIP (0.000s)

Skips due to a different reason on adlp PF.


>     • igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
>
>          • shard-adlp: [4]PASS -> [5]SKIP +12 other tests skip

Passes locally on adlp PF with this series.

>     • igt@xe_spin_batch@spin-basic:
>
>          • shard-lnl: [6]PASS -> [7]SKIP +10 other tests skip

Passes locally on lnl with this series.

>
>    Warnings
>
>     • igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>          • shard-adlp: [8]SKIP ([9]Intel XE#1124) -> [10]SKIP
>     • igt@kms_cursor_crc@cursor-onscreen-64x21:
>
>          • shard-bmg: [11]SKIP ([12]Intel XE#2320) -> [13]SKIP +1 other test
>            skip
>     • igt@kms_cursor_crc@cursor-sliding-max-size:
>
>          • shard-lnl: [14]SKIP ([15]Intel XE#1424) -> [16]SKIP +1 other test
>            skip
>     • igt@kms_dp_link_training@uhbr-mst:
>
>          • shard-adlp: [17]SKIP ([18]Intel XE#4356) -> [19]SKIP
>     • igt@kms_feature_discovery@display-3x:
>
>          • shard-lnl: [20]SKIP ([21]Intel XE#703) -> [22]SKIP
>          • shard-adlp: [23]SKIP ([24]Intel XE#703) -> [25]SKIP
>          • shard-bmg: [26]SKIP ([27]Intel XE#2373) -> [28]SKIP
>     • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
>
>          • shard-adlp: [29]SKIP ([30]Intel XE#653) -> [31]SKIP
>     • igt@kms_plane_lowres@tiling-yf:
>
>          • shard-adlp: [32]SKIP ([33]Intel XE#455) -> [34]SKIP +1 other test
>            skip
>          • shard-lnl: [35]SKIP ([36]Intel XE#599) -> [37]SKIP
>     • igt@kms_psr@fbc-psr-sprite-render:
>
>          • shard-adlp: [38]SKIP ([39]Intel XE#2850 / [40]Intel XE#929) ->
>            [41]SKIP
>     • igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>          • shard-lnl: [42]SKIP ([43]Intel XE#1127) -> [44]SKIP
>     • igt@kms_rotation_crc@sprite-rotation-90:
>
>          • shard-lnl: [45]SKIP ([46]Intel XE#3414 / [47]Intel XE#3904) ->
>            [48]SKIP
>     • igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>
>          • shard-lnl: [49]SKIP ([50]Intel XE#4837) -> [51]SKIP
>     • igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>
>          • shard-adlp: [52]SKIP ([53]Intel XE#688) -> [54]SKIP
>          • shard-lnl: [55]SKIP ([56]Intel XE#688) -> [57]SKIP
>     • igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>
>          • shard-adlp: [58]SKIP ([59]Intel XE#1392) -> [60]SKIP +1 other
>            test skip
>          • shard-lnl: [61]SKIP ([62]Intel XE#1392) -> [63]SKIP +1 other test
>            skip
>     • igt@xe_pmu@fn-engine-activity-sched-if-idle:
>
>          • shard-lnl: [64]SKIP ([65]Intel XE#4650) -> [66]SKIP

In local runs, I see these issues are SKIPPING as per the signature on 
the left hand side, so this is not related to this series.

Umesh
>
>Known issues
>
>   Here are the changes found in xe-pw-148302v5_FULL that come from known
>   issues:
>
