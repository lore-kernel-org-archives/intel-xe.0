Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCC9C55184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25F010E7F5;
	Fri, 20 Feb 2026 10:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NObCivNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9904A10E159
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771583832; x=1803119832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+ITSDVUA1ci0CoBfw2Vg+s+bNaeyfAJvqkkiJ/0qUTM=;
 b=NObCivNKvHoBe9hNEnRHbVJsElbv+QmMKufS6+5M7MBvLC2bLdDbzuFH
 Gga9ZTgqLhD5WXDw3ooxkha2ARn3TuUBFlEvD0CpCCdMmBQiFINZFnl+2
 ESb9wHaZadbFmuPG8rRKK/SDt7mCpVywnbPUsMwyasqDiVT0FRjIAqwHm
 or75STHY45k9XxiaDdFEWNAQ144mor8oOBcUB2G5t29IY7dO+Xuy4R/JU
 +RL+iiiNht9ZTT9rC+dfiwMmPFuXs9U+qNWNngbBJ79vm3nx8jK0LqwMm
 byNnbF6QX5zmgLCYdqhLj8fUF9eRAmRC7A0mD8WMbfRfWCM1MIip70ejg g==;
X-CSE-ConnectionGUID: mLtEyJ4iTRmtq7rlPtOAkQ==
X-CSE-MsgGUID: eVDsK6LbRwyWWfScZh+eEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71701468"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="71701468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:37:12 -0800
X-CSE-ConnectionGUID: gDbb8xXlQyaHDpeXPZAKVw==
X-CSE-MsgGUID: t09yF9XGTbS1bLOrYFm9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="237793012"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:37:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:37:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 02:37:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:37:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD3dHn7An2gP8KQRiAcr8DOmHR/tugN/OOxaidXEu5Yt03OWLLiW9hkLm90MfK+GRBq4wEl7Vs3/0AAQLFMILd2GtYORPWKe6WqC0T5X0Hyje7VzniNRSLw+DEKPUJtN9LH5ZToIxMVis8c0pUi3D/FlJ4vWfwfagcIEYYLb1wGYHio31WNigbexiiOlZTNLdOmE65Onk1z/tItsf/ByKCVvUlW5fn8JsSfNEK76esg/c/Uf3OUOqKednWbInVdrCfUn8GM8WnsNmc8GT0vJfvltHvUFA15AgkKo1O0lUQCFDybza3otyCGGSNdEBSTlximKXeShko7ftDGw+SMidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLjMUcLXOsBQSnkRODyoCREzYJc2npzalrpaTTInkmo=;
 b=p55z6XIMNGYJ5jzhFbmwcolUe/LR7Vsy+MuWZxW/Wy7nyLTZItFVoemoL3OjptyiPvKkGej6zlBjAcKt61XfRlsB78hjCu8u4Bd0luxkNxPOZr7qgq+1HseiYaDDuk4K/jMfwrrn03CVTs+4ArWgCY64D+Y4xD+WikIs5PvG8TmIXgtV53dAH9Lz9tKHqZ+WUgQyhMivso0tM5JHyk5KubZnVonrJAjr0Q4UYBcz6iQkEqZeXyxegYpLypXXHqx2iWEGO3MHV+GRlfPeKfQ8Ue20fno+J6YONNOiOWODb9sl23xS8XppJ9DcdjJRQUtTAODtaBwl6e/9QICmZUtlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 10:37:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:37:06 +0000
Message-ID: <611c7af5-d958-447e-ad10-509c8ccedda5@intel.com>
Date: Fri, 20 Feb 2026 11:37:02 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Allow_to_change_VFs_VRAM_quota_using_sysfs_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <177145676937.264667.3618116347409902495@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177145676937.264667.3618116347409902495@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0d8e42-6fab-4d63-452e-08de706bfe2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkZSR1JIRm5hbEthcHcxTjgrQitDeVBFTjUyRUcrcTEzSjVTd1BCMGx3NEZp?=
 =?utf-8?B?S2V5Z2dTUlU3S1hVa3BSWEw3anhOc0NnNXUyVWVuYVBoQ2thc1FGdEQvVU50?=
 =?utf-8?B?cTFGUm5la2FwY29IdTMwMjcxam95WjJWKzE1aDFuSks5OXNxT0QrbTBXRlVQ?=
 =?utf-8?B?RkpXYzNFQ2l0dUpVdzRLd0ZkL1hyNXczQkZrYzA1V3dobzRKMDJHN0twbmkr?=
 =?utf-8?B?YytxKzhubVJraHFvT3c1Ky9YY2dEWGgyNVQrNWZuUHRIZkFCd2wwSnpUSjhs?=
 =?utf-8?B?WXJtZEZ0c3VQaHZGbWNXMW9mVW5WVlhlNjBOU2dzYW9aL2ZybFV2OWRjRlM4?=
 =?utf-8?B?ZVoyZTNDRUxud0FHUWlZa01xYmpPL1pDY3dnOXhHendXNVUyY3RVVFZQTUlB?=
 =?utf-8?B?eDJmMVhwM2xtUmlVTGJPK0dvUkdXT0hpTDFKRUFOeU5SM1JFMjZtMFRSMGtC?=
 =?utf-8?B?R0RpTEtFYjBqVXNiT2wvWFVaVFpabzhrd0s2OHR4Z1VCN0UzbG9rNFROTlBX?=
 =?utf-8?B?ckJTcFdXVDFyMWdmcmo0eHMrSjhqZ3p5TVlSMXYrbEtjTXdINktLcGVNdlFW?=
 =?utf-8?B?d0xxR09aKzg1aDJ2RHMzbHBjd0tJU0xzdW1wMTNHOUdwZ1pBWWwyNWx6dzVL?=
 =?utf-8?B?cVJJRW0rWWZMMzlqLzJxUDd1Q1RubGJXMkxDancxKytBUkZ4OGoyYSt4SHkv?=
 =?utf-8?B?SXJMSDFLNERpUTI4ZHhFV0N1ckFjNFdYSkpsb2ZEQUdxMk5hNUNoUkJ3N3Zn?=
 =?utf-8?B?U3VranVsaVBlbWFSTm15ZUFneThNejdkS09xUFVRSjZjckNkRVlFbFcvaEQz?=
 =?utf-8?B?OWJManpJcXpmWkpURGQ4YlVpcWF5UGx1ZGt5UHAvOTBUVHhsajdyZUc5Q1oy?=
 =?utf-8?B?cW1nWHBSbVdxN3lNMmttdXgrVURmNCtVZ0NoQlJrY21qdEkvdVlDTjdZNSsx?=
 =?utf-8?B?TUhnUmRZalMwMmdzd2xOb2J5emM5Y0xGT2pETUMzdnF3a25PdXVtSWlPSGY3?=
 =?utf-8?B?eHk3TE1EN1NOSnJQQ0hONW9BUFVkVzlZWGVGamtXVzdGbC9CQWRlU2NZbC9G?=
 =?utf-8?B?SHg5Y1kxaW90ckFIbnVNbzlCQkFIYlNCVXJVODdaVDVncHJyMkUrWS9XWVhH?=
 =?utf-8?B?REo3REpJTnNRdlBKM1BLUFhWV1FXRmNnQ3djR3ZUQkxYWGxhZDBnc1dpMm91?=
 =?utf-8?B?QVZ5VFhQbktONHIwaUtvME5UTzlFN2VieU1mUDk5UWVGdVZLU1U2SlMzTExw?=
 =?utf-8?B?VVVXTXhBTUJaUmE4emxINXRRU0cyWVhZNStFajE5ZGxWcG5ReHNpUDMwQkN0?=
 =?utf-8?B?UGxBa1d3b3Fpb3FtYklWVHRybFp3bzNkSlM2OXFmR3JQdDR1emozNG5VMnUw?=
 =?utf-8?B?V0dRZHpzY0lnYzJDUDlFTUR2ellZWnlPNVNLQldtY3MxSnBGUVRHWUtIUnNo?=
 =?utf-8?B?eDczS29PeHhBQlBrZHFIR2VqcTU4WVhPQlZlZHpGdnJHU2RETU4rdDdVQ0V2?=
 =?utf-8?B?QmJJYWlYWHFJREN4MUJGZUsweHY2L2doWW5zZ21tTDBjMW9EVk1hM2JGaTFk?=
 =?utf-8?B?ZHVZUnozTXNJS3ZrM2ZnRDIrUWVyNzVYR0VhQXVieVFGMzhqNld0TzNsQm9l?=
 =?utf-8?B?ZjdIVmxUYXB4cnROS2ZPOUxrMU5teElSRmdXcUQvSkdJejlsSkd3dDZ2enN0?=
 =?utf-8?B?WWRTN1pVOGROWDExRHVCVng4enMrTGlpaThxZXVyVDNaTGk1QXp4dVZQcmtw?=
 =?utf-8?B?clEvZ3dsZWpyT1NrZlN4WlZaVU9HNjBXOXdJVTRwUGVkNWFweXlBOERnZTNp?=
 =?utf-8?B?am12RlFSdU9MMk1nczIrY1Nna3Z1dWxPSEppTElqbXk4azdKNkZmN1hwOW9m?=
 =?utf-8?B?VmRXMGYraFUwTFpBbitmQWdlMExpME5EOXE0YXBSVXBMOEVIN3FPdEVyQXBP?=
 =?utf-8?B?QlMzN1pONGxKTDVBeTBabFVUUmtoTUpnZHMrcmhwNW1UWEhnY2E3RzlWdzdr?=
 =?utf-8?B?S1lyZXcvclBrUTdPRzA4ZDB6MVNsT2Q0Rk5iMXlqbzZwL2J5VjRaa2pmVlBQ?=
 =?utf-8?Q?yDjSBG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0hxUlNlbFNzSXRoTG9ZSGZoWWRjSncwRjRKZlJETG1OT0dBZFFFc2pxWW9W?=
 =?utf-8?B?WVpLV0VRVHplUFA4QUNnZUZ3MkVURmk1Vzd6ZGdzc2lta1l5c2JNbmFiSWpv?=
 =?utf-8?B?NnFWaURudFlKZ1ZwTHZrSzdjemR6S2lock5lUTZ0TUowNk45czArS3NNb1NN?=
 =?utf-8?B?c0VMdVBDSHRlc3B6K3VCWlROR05ydk8yekhOZytVcUJMQUIzWC9laGV5c2lK?=
 =?utf-8?B?aVl2a2p4RVhCVUEvNmNKL25tWFlkODl4ckFhejJobW1HY1NzWG16d3ptaURL?=
 =?utf-8?B?QWJmMEJzYjMxUkFaZHR1ODVuY2xmK3JaM3p4RzdxNmh0Q3Q1WHBvdVNhUnlB?=
 =?utf-8?B?OUVLUmxiT0NSMSs4WTN4dTdtTWZpclJKQjBLc2Q1dGZKVDB5aENWdi9Oai9Z?=
 =?utf-8?B?d0pOYy8yT1p5OVRWdWF5cTVnVWNoNm4vU2trSnVCM0Z6cFA2YzV3NmNkbktq?=
 =?utf-8?B?MEoyWTdlZDBmdStXZWI5TzJTNnRVUXhZR2ZSdXFlenltYmNHL1UvMFZhSWdj?=
 =?utf-8?B?QTZUY3U2NHNxcVNLY3lJT05WVTNueE1TSmIzS0kyVjAxRnJVQWczSzhzUmg1?=
 =?utf-8?B?WWlPM3QyVUl3dnc0UVZwN0d4QUxpUjNSeDZPeFlPaHd6YXBKcUovWmlTdjN6?=
 =?utf-8?B?K2x1VVpPZVE1dE5YUWc0OEdQQ2RaOUZIdGtqSmJDaVk0bXl3WUtNNXBhM2Zn?=
 =?utf-8?B?V1Zlek5QY3I4cHJrUFdrUXVOd1pES3ZpK3BlVzlZd0hWN0RNQklOV0M4Vktm?=
 =?utf-8?B?WXFzY0FiNk9YVWVyS3l6cEJSY2o3bjg2aTArYi9mcXBEbnd4VTkrb2xpeWwz?=
 =?utf-8?B?eDFLNWl2aSs4aUJ6VWgrZDdIYXpEandzSXN6VTdlSjdWRU54STJSMlNDcHpP?=
 =?utf-8?B?cWZSWm5MQmFyZXVXMm56OEM0R0FtczdlNG1FMTlybGIwbzVHS1dMUnFZenZC?=
 =?utf-8?B?UFRxMGh0Nk1yMHN5ZWJDczV5Ym9uS0RkVHpiMUdoS1BQRkhBVms1N0VSOExs?=
 =?utf-8?B?TTdGK3dqK2pUcDJjam9FTEpmdEl0d2YzaEoyYU9xOFcrWnU1U01oRW5wOEtP?=
 =?utf-8?B?d2FmZkI2OTB0SFExaXlZZDhiK3RIbmlhWFRGZWNHcURuVU9jWCtIQ3BWYjdC?=
 =?utf-8?B?REd0cncxTm9tVzRVMmRRYy9QSUpKeGFvUzFHdjQ1bjZOSDArRG5Uc2VFcWFx?=
 =?utf-8?B?VExaOEF2YzZ6UkpXa0FWTHZTaTRHQmhTcDNnUEJMZWFxVGpFcXc2R1JvYUc3?=
 =?utf-8?B?MXFjU0VOVEFnTlg0Y1FCV25OMUhiVnZaeTJDNUh4WGM4OStidTRBVFQ1ZVhx?=
 =?utf-8?B?NFJsWlFqaHJiK3JLWURZT1AyVG5MUXNOWm94Qk5yUWFxbjdWNS9TdWFTbzQw?=
 =?utf-8?B?eWpXajJZQys4SnJPL3B6UFdmcG56UDRIdG9yb0RGbWlsbkR6NEJXMVBTd2N1?=
 =?utf-8?B?ckRjakl1VVNFckhUSkVhK2ZINWV1aXJEYWNPYmJSRXg3bHdEQW9zUVkydGNt?=
 =?utf-8?B?MURVcjZ2bmxGaFBMdmkvQzNRK01nbFZiTVE2a2tDd3Y3OHdoMDRVVFR4RXYw?=
 =?utf-8?B?OW43YjIwdEdPSDJ0dVEwWHRwUGIyVnVpNk5pMi9YRXFCK1VVeFRiOU5qeU9h?=
 =?utf-8?B?dmVSVWxid3JNZStwU2RKZVpaYnN0Z2U1S0ptNXJXZ2NDZ0dzc1JTU0xTNjBZ?=
 =?utf-8?B?Tmp4M3RIOEZQTytoVGxIVXFFU0pqVzVNaU01U3pOdk9kQTR0T3NzdnA2SFdk?=
 =?utf-8?B?MlI5ZnBQc2pPdmlOZzhWODU3WWxaaUlaT2V6alhTVzJVMi91T0tJeDg2d28z?=
 =?utf-8?B?azVxbkRxcVNIeXBLc01ZcmZ3UzVSSEI5b3p0bEFWNWdZZjM2aGRNZmdDZzIw?=
 =?utf-8?B?ZEFLZDFXS3hiSlhMbVdTVFpxWkk3aHFkZis5VWgvMDcvNXZvQjdrZEk3MDhW?=
 =?utf-8?B?TTlXUm1IODYzYTQwMm1kSmh6bjNWZWF5WTg0QXlPU1l0aHhua2wxWFVic3N4?=
 =?utf-8?B?cUVPQW5OK3dTQmhxYnk2UGlRaVlZd2ljVGkrRFJZMFo2MWhFMUpIUG9mZ3l1?=
 =?utf-8?B?V2ZQR0NZZG9yQWNwRUdLejIvUk93SFJBaEtIZ1JMRURHYnI5Z1N2b1ZkSGdH?=
 =?utf-8?B?MEFCUkdYbXJtWUQ0MEd2MVZmMHMvRHMyK3grY1gxM1k1bE1FNWwxWFE5VDJI?=
 =?utf-8?B?VDdtT3U5MkRab0VReWV1dFAzd0F4QzdJam55WUY3VTR3N0tjYnlkRFoxd1pz?=
 =?utf-8?B?UndERTBvb3dqRDFTcVFjV2hVdTFuWEs1dHhtUkNJYmp2TGZxcW5RY0c1bFJp?=
 =?utf-8?B?WFhtNk43N0JZTk9ubWxNcjFEakk5b1hLQUpEbjNTT3hIcTFzME9XMERKWkMv?=
 =?utf-8?Q?i3o2+wGMAMNFwOp4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0d8e42-6fab-4d63-452e-08de706bfe2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:37:06.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1m8IrhXzQL9HmvF13sDCdm0wLL24Rmj6R21o8V4edYakEPORrUICxWLGxxtUUj2KKm0J7iDZznXW/+5NxWwzE4Z2XO6wieyPZATrckHgNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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



On 2/19/2026 12:19 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Allow to change VFs VRAM quota using sysfs (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/161625/ <https://patchwork.freedesktop.org/series/161625/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5_FULL -> xe-pw-161625v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-161625v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161625v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-161625v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/shard-bmg-10/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html>

must be unrelated, again, looks like a CI glitch


