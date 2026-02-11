Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7947CECD6C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 16:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1223C10E624;
	Wed, 11 Feb 2026 16:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoJKADfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AC810E624
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770825621; x=1802361621;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z6r6DMRxEEU2t0dvT3d2yJA1fsTVemeDGL23ahJ/3aM=;
 b=GoJKADfXnf1ZYdU4BjT37m3mC4Uy3oYouBoJAv5iNkttMP/ZVNMTbMHI
 vyrIY6xx0kqjRefnW5KoVsEMoXCsvYKZMeU8FqJk6m0kqu+cj3wngr3DN
 pnK75TIbrvJZq40qsYdS5BqbOQrAWc3qi+vuNVPv3TWUL6rqIjzcJ5w0F
 dR99o2Cn/QnbzKSyHdBvg8YBChtVStKvnzyuMaAnv+Rb3H3GJuFdzhhTs
 EU9XJx1+hmidsLEsQK49GTyx+y6x+BRZiLdFJQFk+CIrFOviPGXtKRncP
 AEYl1AOUdMLjWPZJUS3SWHUj6G8mNLeWo0CtKFcgbHKCveAmKckxkJoKw Q==;
X-CSE-ConnectionGUID: hmdMV4hdSAGXx6Qgc9pwKQ==
X-CSE-MsgGUID: kwlCBhLdSlWONrVGiShS3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83419800"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83419800"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:00:21 -0800
X-CSE-ConnectionGUID: KStDZ38RQDeA8BPmvWgVUQ==
X-CSE-MsgGUID: 4beedP2rTIC5s+uo8rI83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216794005"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:00:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 08:00:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 08:00:14 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 08:00:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBIXXhddHFWeOjLvfcOnJo6Fr9w/MbSOOdZnpD+cMucYnwjMLKJUz+qjYUejTdn0RaFJgQoDpQNnai9T21YM2OZbZT7Vv0si5kEnvUDqH8Nb+ofUQ5RRNHjm4/srOUAT6bxKn6o82Tkr3vutwKvtHpEX/x70ZEhuHCrqdFdYi6sbqQkhtm4NE7xB3pg25rv0nRdGxR4ykhaW76u3SiYPb6HuwUXhK7TJz87NGqwWSxvQASiuMlduB1P6mUr3QjGPjPwZa9fVftNg018uAOEdaIMAYssV9FiqwlUM7kMANjgTNkS2oEisNXJ4xQYr84JXyKRJN7qvLOyXd26BFC2vZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgGop2o/rEPKE87xTclTK9V0qpR3rYaTqnC3Q6D8PuI=;
 b=bFVWT6B7NwuD66JsItanc20lFWW0fAwb5kdaqXCwx0QsMyrsIygaV/wZPw604UL+Vgr8cZvfrhwGhgfDdMVhyAaiIasf5fFbnfHXRt9eYHWxwhFnCx4Jahq2w/kdu8NqXKgVjkraIOUXbDvVRLbIWRUpDwy6zS94Ks3FNA2mhuAzD8WZJpikwSCUfpQFPWAUL3mWU8S/RJCSr69CZuAC3KOIaFuxRwi09X8sdzVZMSOM2ndYjpqPdshytMNRxXy0p8EHx8vo4BM2+oh/UIPGzYrESoFbvU5Isk/i9VCSdZldh1XniK8M1d5VSAyOVr/mUnfTHgmEr+qokOMitwyTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 16:00:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 16:00:10 +0000
Date: Wed, 11 Feb 2026 08:00:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 2/9] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
Message-ID: <aYynhrT9E/CZ6f7o@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211152644.1661165-3-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b809e3f-2a8d-4188-de27-08de6986a17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjNCaU12dEQxU21YNzBYcG9GWG1JWHBjLytHYXh2NVI3bWRMQldrS0dsc3ZW?=
 =?utf-8?B?NU4zMHFuSktBRmExZmVQUFZWcUtrTURmVXJERWorTXprZ1VuR3RRcGUxQ2o4?=
 =?utf-8?B?QS93bk1tWmkwRThLMys0bHBFeVRlbmEzS201RzV6MEsxODlsU2xNc1ZJTDBL?=
 =?utf-8?B?blZQSUE3aDJxc2lRRTh6QjNWMmVSbUIzK3JzdVBBd3cyTmZmUVQzWGNXTmtv?=
 =?utf-8?B?RHV6eDlVb25icmk4RS9hSTRLN2pJdHlkQnZHZ0VZUWlIRnNoUVUzb0owbVJo?=
 =?utf-8?B?c2d6UlVmOHhRVGVOTWtKU1JCVzNNOHgxazNUY1VQT3ByTmVEdjJIT1Btc2tS?=
 =?utf-8?B?aDFDdUZqVzhuaGhYUHIwTitZNUVvajVJOUJvelVUUnlFMW1KVXc4UjBDMjFT?=
 =?utf-8?B?OVkzaGZrRy92azFvUzd2b3o4ZmZoRk5qUWdPSlB5UWkzUkhVQitJajg1d29U?=
 =?utf-8?B?UURzMFdFRi8yblBqT3NKSDZDaTZKc3EyZUl3OFpjQVpMUHFmNm51T3RpWHRq?=
 =?utf-8?B?S2NMRWhUaUdUdzh5ck91bHAvYzVuL0piU1NkWlp1NFZYVnNSRVBlT2hOQ2Rl?=
 =?utf-8?B?eWt1L09vdU1ESzBVSUZGSXNJa1VtbWdIOWIrTzdIN3NnRUxFcGZGNHk2QitC?=
 =?utf-8?B?d1RoY2xlakRRcFRoc0w2QUh0V1R5ZXlvazZldkZPSTBzdzZBeW5OancwbjQz?=
 =?utf-8?B?VFhOM0N2Z1NBa1AvSEtLcTRTSFpkOHZrSmNDNjVBb0tTb2ZTUldTbGlrZG00?=
 =?utf-8?B?dERTS1JDUWJxR1dZSCtzU1dHWjRkcmlXdmRmTThSOVVGa2g2NjdFSUhxUGxi?=
 =?utf-8?B?SWdkMzRENGFTdllCcVRFbmtlZkw2ZlRHc3A5QWFsQjB1UFJYOE9jTWZtcjkr?=
 =?utf-8?B?UDNUMHVta0hHRitqa1VLWUhlNVEyVWNXUzd1NHNuV1Rsb2svR1Z4TFhTK0NL?=
 =?utf-8?B?T3NieWZxREs0SnlsUlppWGJ1ZC8xTjY5K1Nqb0U0dDhPV1QwRis4R1VvVEdi?=
 =?utf-8?B?S2x0OGNPbFVLa0VRZThSMmhGQjlzNHd0VlhjZW4zMWlDL1duWFF1bVkxK2Z0?=
 =?utf-8?B?dmM3QUdBNDlTWGJHVFBLZ25kK2I4RG5tK3ltY3FwZEEzdlRJYjd4OUtXOUZl?=
 =?utf-8?B?Mi83OUp1SGcxTFl6d3FYOUVBNG9iTnhYSmtXR3FsOTNCRUpnL0xsaUJxMXYw?=
 =?utf-8?B?eWI2eCt3ZnNESEd0bUR3TkFPbW5DS1orSXRGV29mRzlpYUh1ZlJiaXlNaDF4?=
 =?utf-8?B?NXNPa2E0U3hiT1paTDR4K2t3ejM0SGp1aE9RZzdJRjFBeWNBbm5uUko4R05y?=
 =?utf-8?B?VWZOdlZ4aVovNUNzeENWazJUR09ycjdjREN0YXBXTUxqdnYwRVBVVlJyeERx?=
 =?utf-8?B?a2NtRS9LZER5cW5jUXJ4Zk01YVJrUVVtcnpaNmNlSzJRSEFHZnZ0dit5T0FP?=
 =?utf-8?B?KzJtM29YVEtXUTJRbWk0bW5nYkVZdjJBMUJUNHh6QU1sWG1sTXR0U1liQ0NE?=
 =?utf-8?B?U0dvamFmUG9saU4wWEZLRmhWZVBMWS9KeElaZTRUM0U0UEYwS3JwSWI2akRx?=
 =?utf-8?B?NkRVSGR0TzFFdXpZNUJvYjJqQjVPeU5mekxaYnBnak9SL1VBZmNrQUZkdExS?=
 =?utf-8?B?SlBOaDRuRFZIeTh5V2xDanRZdHh3UVBieXR4aWhXUlk4aFhyZWRiUjB0cEFy?=
 =?utf-8?B?TTlVS25GdlFwSFJWVUlNQSs2NVlldXZ3Mnh0Wms0WGVDMDZ3VFFNTU51R2JX?=
 =?utf-8?B?K3RVNmdLT3pQT0RPOXZtZXdWZTRUZ2tHa3RkVUMyTjFQcVRENEZPb3c5Wnla?=
 =?utf-8?B?c1lIWXJJa1gzUDBCV2liUGZ0WVRxRmtrK013NGRoRWNmVFJla1crc1VhZk5E?=
 =?utf-8?B?ZmwrcXJDSU1uM1VTNTV5UWYxSXRSbFljUXJCcEg5RjhSNTdIRUdMa2RTMHc3?=
 =?utf-8?B?eEdoSzRaeFRuMTdWVGJvTTlBK1JzQ0tJZm13bHhia1JXKzUwdmVSZnkrVjZE?=
 =?utf-8?B?QUZPaTlXUi9qdE9MNHMvbmdpSk9wcDFRbTRqVXRJQWdjanZIWmhPd1gyREt2?=
 =?utf-8?B?VEhweHFuWmNFWUxlVWhNVzBrVTFnSmxWV2pGVGR5NENGN1FvOVZVT2ExQUxX?=
 =?utf-8?Q?uu0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXB2L1piRXUvRW5nZUxMOE9naHVQQTJzbTJBZk5TNThVMEptUnJtT1p2eWQ3?=
 =?utf-8?B?TXNxS0ZwY1FNRmc0aDRqdlV0VW03YmlkbE1iK2M3YXRKQWoyUG9TSllkQ2dB?=
 =?utf-8?B?RzNscnpLWFNoaXdMZVlheEJEY2V4eVN1cEFYVUR6d2doQSt3Um40VXp2UGpt?=
 =?utf-8?B?ajVVNjJVTCswM3BmYzREZFVkVXNaYVdnTnZFbDNObWhYbk1kM1BEbXVhKzBN?=
 =?utf-8?B?TUt5M05mVnBRZWhUL0c2WWc3OGNqdExiblF6dVM0cEFMczduUWtCeURnd04x?=
 =?utf-8?B?Q0pVa3JMc3BTeStRVGxCQm4yT1NUZGNtcTU0V3g0bXFiMUMvbXJxWDZZT2t5?=
 =?utf-8?B?U3RlMk1SQUpBbEt5TnpidFlmeW4wNit2aEVtOFlqbG52TzY5aWhwb3pJUjdC?=
 =?utf-8?B?RVM3WElYcTQrWUYyMUVNNklNSDlnVFZxbUpCSHZ3MUhrUXNMK01nSzVqaHgr?=
 =?utf-8?B?S3o5TnhRb1d3elI2QnorK2xUNjNHbE1tdjhLWmVCclV0OWxIWlBQRGRHTzBz?=
 =?utf-8?B?T2xHV0M1UjYwVUJxbkp1dUJESElpSGVqeTFBRGhCc1NPTlQwOW5pVmE5a1pN?=
 =?utf-8?B?V212dHBWQm81UFBHV0xNTVNUNGJORnh6VTZEbTh3RnhlMnAzMExzNnJRdXFB?=
 =?utf-8?B?c0RtQjdVQmxPSjZsOVRPdVIzNjQxM011UGhCeE02RFdxUlZhL1VKbDVqTklw?=
 =?utf-8?B?TmZxL1dGbkVBRzZTMUpDNDFqWmxkbStTZ21YV0lRZ0hsM2RVMDZCOU53NjJF?=
 =?utf-8?B?TWtRMDBqbmJQeERoMk5nWHNWZGtWQnVHSFdINnZqS2FTeS9mSWcrSkEzZmpp?=
 =?utf-8?B?VHFxQmVjQjloWHhUMHVpRzlpUHFXam9CT3dieHU3VDhFakt4cEpab0V6OEdY?=
 =?utf-8?B?YVlPcWxqTFhlTVJYYXR2NEMreXFMbGh2QTVLWTdDbDZLdnMzQmIrRTFVdFRL?=
 =?utf-8?B?TEtFTXVVTEpKNDFMeGtiM200ZkdQVE9ueFJ2aVN0a2dQU0pJK2ZkZTI2RUlj?=
 =?utf-8?B?SWtLNVhQVU13Z2FDWG9zZDlBTDNkdDN2UkROQ1A3U05zaU5UcTNBS3hsbzlh?=
 =?utf-8?B?WnJCYVNkYXNtZEtKbjJMaFJnekFYS3F4V01EZDNQMnJYOGpoK3pZSWJOdjFX?=
 =?utf-8?B?WVdsRWswT0puR0FrZ1hqRE55MGpqcERzSWxZd0lOVnIwc1hSSjdzTDZaTFdO?=
 =?utf-8?B?Q0NXU3NFNEZkc29ObjhQSlFCNllmdjNUcmxnVXB6enpXVUV0cFcxS1RBbW9X?=
 =?utf-8?B?WnFYdU5abzJBdEtLVTNpaEU5Z3gzVTVwU2xnWDJVU0tWTXpGcDBTQ3MrUjFo?=
 =?utf-8?B?aU1XcHoxckhRTlZ1NnAvS05KdndUV3ptSTdYcWxKaExSb0xUNkQzWkNrSTVD?=
 =?utf-8?B?N3dabFlsclQrcytBQ1ROZnFrWnc1NFkrOW1EMEdEU3M4bWFWbHdiaWFwck8y?=
 =?utf-8?B?d2NsckNvYXJXeVRCSjljRVF1TTRHeXZ4QnlreStZNFB3bkdQSm1md0l3T3dP?=
 =?utf-8?B?TTQ0UDY5UXhhSnY4OVd4b2xQV3piUCttMURZRU5sZ3ZhQjlrQ1dvWTNIRTlS?=
 =?utf-8?B?cUlPVStLc3FmTWgxSU51WmxzN0ZIL0F3UWlLMTdKdXE5bnpmWlhROGFqazdM?=
 =?utf-8?B?cjlEMXczbFFUbGc0QUhLSlRjRmMzanIzT2IyS1cvNkZzWkJVQkJNeEh6czVC?=
 =?utf-8?B?S3RwRDhNdmMzSlA2RDZwZWIxWkNtYmUvNzFRTEx6Z1NZR1FTNWJwdlNLekoz?=
 =?utf-8?B?eXZZK2RDS2prd0NUR0llZ25TWHhrUXB1MXdTNnBSVjg1YWRrK1VzRUJRaE9u?=
 =?utf-8?B?ZkpScjNtMXNkOWl2Qk1PcHd1ck9HaVNQNmNKaWVpdHdVTStzVzMrYmZYNFky?=
 =?utf-8?B?Rld5aXNWMFdLYjM2WkRBTmtrZDkwRTk0dStVc2Zac2Z4UDhmZGx1aWRKb210?=
 =?utf-8?B?YnNUaGV1VHhaRnJ6dUNSb1djRXF3QWtnUkRLdEFmV3NFM2YvbHFIS3lDL3RN?=
 =?utf-8?B?WnhBMGY3WERORWw5MVROL29mcUhPTmcyd1VJY3F3NUp5aUY5a2hmNTNjMnNM?=
 =?utf-8?B?bGREczN6QUhOTDZNdUJRU2FpN1NrTDNyOWI2Z253dm5JbVNGcjM3c01oejFU?=
 =?utf-8?B?VkJhd2MzVENVcUdYRVYvenkwNlNjOWlIM3JSK3FyTE85VWVTcFNOTWZPSFBI?=
 =?utf-8?B?dUluVFZ4MDdrK29GbkQ3SzVHdm9iK1BGMGMrMjJrakx5K3ZEeGM0MVRGR3Fk?=
 =?utf-8?B?NE5ZQ0RHTUJCWG96bTdiaEZxdDlYQ2tJdnRhSkl2eGtFVHd0eGZIeEJXSWla?=
 =?utf-8?B?eVo1WjFvU1FxY0YrL1JScFNVNklZQkNwbzFtdHpkR3RZcGhrZlBEZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b809e3f-2a8d-4188-de27-08de6986a17d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 16:00:09.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dni1e2vvpx/136J6Vhi0hxu1ldDa8O/Yt/9rRLr8CCPIG/XllAV/PV0VM8teCylMy4vA+pcjmN3ww05SNUOkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Wed, Feb 11, 2026 at 08:56:31PM +0530, Arvind Yadav wrote:
> Add infrastructure for tracking purgeable state of buffer objects.
> This includes:
> 
> Introduce enum xe_madv_purgeable_state with three states:
>    - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>      purged. This is the default state for all BOs.
> 
>    - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>      can be purged by the kernel under memory pressure to reclaim
>      resources. Only non-shared BOs can be marked as DONTNEED.
> 
>    - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>      Accessing a purged BO results in error. Follows i915 semantics
>      where once purged, the BO remains permanently invalid ("once
>      purged, always purged").
> 
> Add madv_purgeable field to struct xe_bo for state tracking
>   of purgeable state across concurrent access paths
> 
> v2:
>   - Add xe_bo_is_purged() helper, improve state documentation
> 
> v3:
>   - Add the kernel doc(Matthew Brost)
>   - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant
>     patches (Matt)
> 
> v5:
>   - Add locking documentation to madv_purgeable field comment (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h |  6 ++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c914ab719f20..ea157d74e2fb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -87,6 +87,28 @@
>  
>  #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
> +/**
> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> + *
> + * This enum defines the possible purgeable states for a buffer object,
> + * allowing userspace to provide memory usage hints to the kernel for
> + * better memory management under pressure.
> + *
> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
> + * This is the default state.
> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
> + * purged by the kernel under memory pressure.
> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
> + *
> + * Accessing a purged buffer will result in an error. Per i915 semantics,
> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
> + */
> +enum xe_madv_purgeable_state {
> +	XE_MADV_PURGEABLE_WILLNEED,
> +	XE_MADV_PURGEABLE_DONTNEED,
> +	XE_MADV_PURGEABLE_PURGED,
> +};
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -215,6 +237,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  	return bo->pxp_key_instance;
>  }
>  
> +/**
> + * xe_bo_is_purged() - Check if buffer object has been purged
> + * @bo: The buffer object to check
> + *
> + * Checks if the buffer object's backing store has been discarded by the
> + * kernel due to memory pressure after being marked as purgeable (DONTNEED).
> + * Once purged, the BO cannot be restored and any attempt to use it will fail.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO has been purged, false otherwise
> + */
> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
> +}
> +
> +/**
> + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
> + * @bo: The buffer object to check
> + *
> + * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
> + * are not currently needed and can be discarded under memory pressure).
> + * This is used internally to decide whether a BO is eligible for purging.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO is marked DONTNEED, false otherwise
> + */
> +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..ff8317bfc1ae 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,12 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/**
> +	 * @madv_purgeable: user space advise on BO purgeability, protected
> +	 * by BO's dma-resv lock.
> +	 */
> +	u32 madv_purgeable;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
