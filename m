Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CC4EF99E0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656BE10E84C;
	Fri, 13 Feb 2026 22:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmBgFy+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852F910E84C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771023323; x=1802559323;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hbeZvfKpirNmqtt555AqL2CFS1//FZNa8uN5MYK9juY=;
 b=BmBgFy+nUQgPY5SFjA4MnCTatbP3xgvZFhacj6kxczmJJRzyO09S6CaI
 KeOO2qYwRzWUlNLD2/jhoAxGdD7CD/IEFvFn7AOKiDo29pZPOFGdvbSjO
 +QLCXBTL5a8T5rAWgFcbu6+jnBPIByvp6jVDZDTg6LwH2laJ1eMPNlf0H
 XBwEK/BrmWCwTj1a9ZnEXVV/OByfq9iY6sEEmqWwYdqVI5UGozBtyVePW
 fy7f6YLvb+koSt3BHpBpLGQoJU0lGXIVlEgvrIv5lmX5OcZMvjh7urLvu
 i4lJKuu9AtIRJaKcK2gZjzrp81fGuNpBT1zfbTAgy2RXuWvG5SCxCwOPv w==;
X-CSE-ConnectionGUID: PvrSPrlpRoCdCGAhlmW5Cg==
X-CSE-MsgGUID: tjbXdj8eSW6Clvv//iELCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72116165"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="72116165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:55:22 -0800
X-CSE-ConnectionGUID: T0QlToGYRSK2zMgvFDNCCg==
X-CSE-MsgGUID: 6vubxMXsSmS0OL/DdTsFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="217168956"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:55:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:55:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 14:55:21 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv8Nuz8PZ/rFo2zgIWR5QPS//CvH1KOA24JsFobuiAKFEU+o6MAKoEU2Uio3DNzZflCGC6uC/IcElY5uKKf2G9qFDDJIc6yIfSxf0398aMtnkaygerGqM5KlL3F+odfqtpJ2RT4jS7taIvwvIpGdDRqzFjunzu9LYHqrHsHRX/x8pmB1HtERDKBTIm+LkFRSvP2hBXsidiPCEmIQ8G1aBlKUSeYak90xE6sCw/FDDWpFZjnaNQmMTgSxYAIv9l4gnOwkBHmTQLcsKwMIUV2krmyZ7ZIYfPB+GSgLz+FEEObbrvxh+GwxjNBtp1byVXSnZKTposNWpBRPS0U018UQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkIYU5V+1OJP/clXJq8Lr8yyNTM1M4nPOyhvV7P+6N8=;
 b=RDNaKiGaEhrSgpZk1Gkz8+5aY5IqJljNAh/dVT6h53B2XPQhLgM/uFDpkMdY/BDachN7s1fHEt0uorsANIcd7YQexp3wWI39bZNLcTfgl/zSZeH8qpcrpQ0D2/kiPiqh0wpBL+pXIOth0mzP5IM3JGw/uGm1syOMSkNqYCk+Vp0UUibzHDcd3qmuGZ86yq9OGxpfTsdkk0QH4r+VIdviDzlJtJ00LEMhZM9K5oiJ22sMwyr/CjP/mpns7GSnefFxxM76+6kGCU1M2Ne8YHmQf3zTLFXNp2xISn8nUI4urZ9FdyQu4TXRXamuExPkOUw90r54Yoy4UlOSNP3SosGvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 22:55:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 22:55:18 +0000
Message-ID: <7da8eddd-9fe9-4e7d-9133-34b7ed9605a5@intel.com>
Date: Fri, 13 Feb 2026 23:55:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Split H2G and G2H into separate buffer
 objects
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-2-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260213211625.3117729-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee720d8-5c44-4eda-46e6-08de6b52f53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDdhZXpOQnNNWWdmU2hXT3dWUktqeWxuLzhUQ3dXa0lOY0hrUkJzRHpxeTlw?=
 =?utf-8?B?M3Vkd0pTazk1QWNUc0QvUVY2dEJXeFVkSURwUVhvUC9JbWQreTNBUTN1T0Yr?=
 =?utf-8?B?ZmRhTER5NUhIK3UyamgxVko4cU1BT3lkNDZ5MzllWXpwL3NWL1B4Z2gyRTlP?=
 =?utf-8?B?RmpjYnRyOUNpaCt6YU1wdUhlZ21FYTRWZDhNM1BFcWRreVBnNjlmc0hCQUdZ?=
 =?utf-8?B?NXZnUXRaeFVnU3J2NFEva3VXTk4xOUFmRUlYOGpsckVaVzArSy9yZDhKeXJu?=
 =?utf-8?B?Szc2THRmM2xXUlAvZmppMU1tRFZSQlJoS0JLSW9oclRvT2pWMEEvbFZwR09a?=
 =?utf-8?B?bnJxSGtLTDh4QWRBQjU0UlpaZ0phZG02Nmtzc3ZWWE9hUmVZNmxoZ252bWtx?=
 =?utf-8?B?U3RKKzNJY0xaTC9kak41SmI2dk5DeG9OR0djMnU4dlJMYnBRTmhXa3FJMmVn?=
 =?utf-8?B?WEJtWW1IZGRqaW1CRXhZWDVxbXVmdDMvMTFxOTU2K05uOVZkTXJDRHp4ZnBY?=
 =?utf-8?B?alh0YlBmaWg5WllYUTJtVHcxdzI5elAvRVpsWkFlS05lNjRCMzE5akN2enhL?=
 =?utf-8?B?NDd3L0t5bk0vZlVLRXRjYWl5S2t3N0tCVkU5aksrKzFpVys3Sm8vNittak1K?=
 =?utf-8?B?d21WWmxEenZqVCtuOEVUdHl1a0V4b0tHMi9vSFpxSUIwenpwR1VnaW4vcklE?=
 =?utf-8?B?SjNGYkpReHFjMjBrT1NnQnY1bEh6ZWIwM243ZlkwakRZN3pPL0tqckRQS1pW?=
 =?utf-8?B?bFNVM0lKeFlPRmd3Qk9lTGxmVkluQXlrMGx3VlVLdXZ2SFFBQlVEdVF4UUdW?=
 =?utf-8?B?Yll6dmx4eDUrUWhKbHF3dG1sODFZWGNKc29LSEREdkdTaHFhRUxQRHA0TDBF?=
 =?utf-8?B?bURFSzl3eWRVRHlJdURETDdCL3RBNUUzYWRXUWtYWWIrUmZjQlZjWHNuZkpX?=
 =?utf-8?B?WXd5SXBUa3hJck00NDkyTEJaVTBoSDFaeHhjVVQrcFgxelM4V2MwS1hpRDBq?=
 =?utf-8?B?dU1ESmFpc2E1UStKVTBPR0VyWTRrNHVUWDVXNFRGRVJ5NHduUTFhQkdCZmli?=
 =?utf-8?B?Q1JYanlMZm1PSGdOaUJLQ093cUhjMnJ4blkvZzZMcTZML1FpZ1BFOUdpNmxX?=
 =?utf-8?B?MWVhNElsdUY1cGFVb2NkTjNOemxNVWVwUGpiK1RVbSs2bUNaNERkS3pCbmJR?=
 =?utf-8?B?OEdVVXlqSDFuc2ZoaVNZQjFKaHZCZjZscDB4Zm10N0l1WG5LTGliYjJhbVIv?=
 =?utf-8?B?ODBmNklvdm1VY3ZwMktMcHkySkpDNXYxVVFVdXgxQnJ0SFRPYnFneEt2cytl?=
 =?utf-8?B?V1JxcXVSNUVBVXlBM2MyU3UzRmVtU24zdEFpdjV6QjVnZlovT2VORmJNaEZG?=
 =?utf-8?B?RVdPejE1V3BnRzR1alhRbk12VENocGFLdngvbGZJc3hhYWtLcmNqbk1QNlli?=
 =?utf-8?B?UWxPQmlzVDJIM2RMYzlhU04vakdGL0FVRVd5NXp4R0gwbXJ6MG5LUWZXMUIx?=
 =?utf-8?B?ZlBQNmkyWnViaEUvR2UwaUI3UGhHOHI2Z1JxMFNGTk9maVp0a1JndjJhQ1Jj?=
 =?utf-8?B?UXZCak1XbFYrUzVFM1RxSFVzYmZmdkhTNGY2QnFlL3dJL1E5ZE1RUzVOUGs4?=
 =?utf-8?B?ZUtUTnRDUDdldmN3dXY5NWZBakFTUERSMS9jOGo0NGFJcnFiZmR3NEhRVUpD?=
 =?utf-8?B?SitIV1N6RnEzQ1NocjFROGhQZy94bnd5RGFXVDhKelZ2aW5SaTFrK2tZaGVS?=
 =?utf-8?B?a0FGeUtpc0tndzBYdjNhWjBQNndmRFQ0WU1iZkFDSXlWT2lCWkVXa0NpbVdD?=
 =?utf-8?B?Wm1RMjRFZGxHdkEzb0xBNFFxcFdZVU1aZFRjTzNlN3c1S3h4dVVTaGVLMktj?=
 =?utf-8?B?TDRjeUppTWEvNWh0VHBBSGtOUXh2TFVMZTFMM2VzZnlHQ2ZvckMwNERrRzYy?=
 =?utf-8?B?ZllnclJYTjRCNm9hTXJPT21GUm5IcDU3T0ZUcXNNcDR3RkhTSXZYMmY3RDNJ?=
 =?utf-8?B?ZU9CZ3J1b2ROVTM0MUNVU3VRM05XRWw2ZEkzM2JnZS9RSW5idzk0bDB6ZGhi?=
 =?utf-8?B?Z3FFTmRENlVUQmMvdzcwaDRHSmVRZ2NLYm5RbitEMlRFZVJTdkJrTDFoUWxI?=
 =?utf-8?Q?Zlso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdQU3JRQ1lTUWQ1bFY0VGdiNExSZlNrWjhuMTZTZFVLSW9MSk5VL0FHeS80?=
 =?utf-8?B?ajRSV1FyMml0VnBOMGtCak5mYjhxMHBPZ3g0K1krY1YwYjladEhOemFIZUZV?=
 =?utf-8?B?UGNYOWlta3U4UkFsNTZ5cDV5ZFlhd2hHZkJRYWhzREU3WEpYSnNkZUd2RmFm?=
 =?utf-8?B?U08rSU11OFF4YzE3dWlBZVVkK3QvV3pwTnlkOUNIRGE2WEFuSEFiTWhrZllk?=
 =?utf-8?B?YUdlalBlTTZrMUtJcnNHc0RJU3lsN3JiOThXbDNMRjllYUZOalBxdUVhN1BB?=
 =?utf-8?B?WFh3ckdTQ0JZbmh0RC84OVRvanVTbTlxeEd5bXQ4by8vRG9QRkhSTzFGbmcv?=
 =?utf-8?B?TDUzTjA2MnV2TzJ1YWVvTkJKdUN5SHQyZUZKL3VZcnROMjhlSkhyR09OUmJ1?=
 =?utf-8?B?a1ZBdzhobXVwTWtOcDRMVG5Kb1ZQdzhwV3FpMVhQdU8xNjE3cXRneERybHdQ?=
 =?utf-8?B?N3pWcEhFRDBKUFNjNDZaQTc0NjJTUWtJbmUyeS83NUJRYWlGcW5DZU1QWnJR?=
 =?utf-8?B?elZDSWRTQnFvc0d4YjBZOHdhNU1rSVgzUXFKeFZUZXhBdDZINEVaYytsTUVZ?=
 =?utf-8?B?TmUrOGk1Q3NWaGErV3BnUzU2QXFnWVJZbTFyVUhONGJScjJHaFJtL2NiOVh1?=
 =?utf-8?B?cisyc2pqOGNheko1SDYzQjlFR2QxVzhXR3RReWp2Wkprb0ppZytFL1ZDdGd2?=
 =?utf-8?B?ckxITFZHUU4zSFY1OElOQkFJekJyR1VKS3VoTEhZcGNuWTRQUDhCY1BBamcw?=
 =?utf-8?B?WVl0cjRGUDFQM1pWeGhqMWpkM1JZZHF5SFFOR2ZCbzFTZ3NLYWxXRFdHaHVI?=
 =?utf-8?B?aHlFOFlVZ08xQzc4Q2tZWXNiWklERXVaazRsS2FmUEN3ZVlkc0RZMVRFeGg4?=
 =?utf-8?B?bnFqMnFYOVN6QTJvV09zajhUc0JMNG9LM3JjMERSUWFUOUwzM1dJZ2M0Y1Zx?=
 =?utf-8?B?d0RvT1BsczFSejA4MkEzbDBXTDh5QkQ3a2Z5MDBLYk13ZXJwVDFKTCsvczBS?=
 =?utf-8?B?UkY3UkVvVlNWbnVIcDlwdVQ5Tm8wb2phZE9Da3N1UjVOVUMrM0M5cHlENEZL?=
 =?utf-8?B?MlZHVXJOUFRVMXR5ZlNXUkFCaWJOZFJiRW1TS2JOOGJTenI5OGdrdW9yd1Rx?=
 =?utf-8?B?Y3BFazg1d3VNR3JFUi9NVVNTNlFCYmplL3poUGMyM0tKMGV0ekxWTUNwUHpl?=
 =?utf-8?B?T1liK3paaEF5NXMrdldQdmFXOUEyRURZSzluRUptY2J6bFN6bGUxT3dPUnFN?=
 =?utf-8?B?VmY1WFZIUTJLNHVrZnFJcUpmVHpLL3puNTJYa25wbEJORjdwQjJJeFp1cXVM?=
 =?utf-8?B?ZCtIMzlkdjk1NHB2UnpZTkpGNTNFc1FDNGhYY2xOQVZUeGg3aXIwbFRmSUlY?=
 =?utf-8?B?VUdJM2lwenR2U1dzeE1mNzRCQTM4ZHRnT1A4dVZRS0ZrUFlFeU1odU03dDNM?=
 =?utf-8?B?Q3VjdDJ5TllzRXlqTjlGa2ZpdVVHUFZEejNvb0pXYzd6K1phUjlaZVU3V1kv?=
 =?utf-8?B?eDFXRnpTb2tTYnc4bmZnNkx4Z2ptallGZ1JZU1V1aGhiQ3pYQkRHOWd2UTVx?=
 =?utf-8?B?LysxOCt1d041UUc0S0wwZFdOS245THA3T3p3UWhKeEczYWJpaHRKRHl2UFlE?=
 =?utf-8?B?bXhTQk5YQmVzOUpnR3JKU0VmbHIwcU4yT2FXV3dRb3Bkei92WFp1Rkgvd2dz?=
 =?utf-8?B?cCtCUmJXMzAxR0RpdW5MeHI2K1MwUXFiMmZIVkpoNEtxelJlRWNwRFREY3ht?=
 =?utf-8?B?WnpnbVMyWWExV0tXWGh3aTZTQzNvWkR4Y1VTdjBoRGhHdGorc2xpUmV0V1dn?=
 =?utf-8?B?MFlwWnU3NC9seVQ0aVp1YnBCcjRNblV2L2s1Zm0xelBjYTRtemQ5a1JabXJq?=
 =?utf-8?B?TmIzZXhmL3plU0w3RTFldzhnQ3Q0UlI5bGF6djhTdzVrNnpMenZwM1ZSdkZP?=
 =?utf-8?B?cThiUWlwQkpaYmxaajJFZS9XUFk4UjFwd200T05HVlM4U2lpVkRsdFB5cStX?=
 =?utf-8?B?N2RJYXlVY2taMU01N1luK1Y1Y1N0clRCeXh1UWZ2akJUZDlrQ3REbnQ2NzVk?=
 =?utf-8?B?dVR2bjcvQjhQRU0ySjdDbWFvMGZtUGJPMkdhb3BzOVJhN1c3Tm9KSC9EN0ta?=
 =?utf-8?B?endGNk53YVZkUTBQL0ZiSlJGUDYxVGkyM2tRK0NrenVXWSt2dzlrK0RzbW01?=
 =?utf-8?B?cU5lNFBnalVwTThnTUEwMFNpQzRvUUEzeE92REkwK1pkNXg2dHNvTTFkaFoz?=
 =?utf-8?B?d1Bna1BpNWMyRkk2Vi9USEE0N0M3NHp2RmVhTEFYZGc5WGVCSEZHSVNFTzVk?=
 =?utf-8?B?OVlMK2lJM0dQT3RzT0w3NGxzSXYxUUJwZmdtaldzdnZ0OFIwc0JjeUFzbExz?=
 =?utf-8?Q?jJw4991jy3noPPDo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee720d8-5c44-4eda-46e6-08de6b52f53e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:55:18.0957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvxnsi4qLfnmwEwAHzIwrDLg7ZipRjuBUVttMXRff/LWZyfQNxP8X0tcLpXn+aurOxLoyIYxd6wK9sSoc+inzpmG6U6ddJyPAgm87zyAIGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
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



On 2/13/2026 10:16 PM, Matthew Brost wrote:
> H2G and G2H buffers have different access patterns (H2G is CPU-write,
> GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> benefit from different memory placements: H2G in VRAM and G2H in system
> memory. Split the CT buffer into two separate buffers—one for H2G and
> one for G2H—and select the optimal placement for each.
> 
> This provides a significant performance improvement on the G2H read
> path, reducing a single read from ~20 µs to under 1 µs on BMG.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 66 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
>  2 files changed, 48 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8a45573f8812..6a96bea40720 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
>  }
>  
> -static size_t guc_ct_size(void)
> +static size_t guc_h2g_size(void)
>  {
> -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> -		CTB_G2H_BUFFER_SIZE;
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> +}
> +
> +static size_t guc_g2h_size(void)
> +{
> +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
>  }
>  
>  static void guc_ct_fini(struct drm_device *drm, void *arg)
> @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	int err;
>  
> -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));

nit: maybe it's time to use SZ_4K here instead of PAGE_SIZE?

>  
>  	err = drmm_mutex_init(&xe->drm, &ct->lock);
>  	if (err)
> @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;

nit: can we drop this local var and assign bo to ct struct members directly ?

>  
> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> +					  XE_BO_FLAG_SYSTEM |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	ct->bo_h2g = bo;
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE |
> @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	ct->bo = bo;
> +	ct->bo_g2h = bo;
>  
>  	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>  }
> @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>  	xe_assert(xe, !xe_guc_ct_enabled(ct));
>  
>  	if (IS_DGFX(xe)) {
> -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo_h2g);
>  		if (ret)
>  			return ret;
>  	}
> @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
> -					    CTB_H2G_BUFFER_SIZE);
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_G2H_BUFFER_OFFSET);
>  }
>  
>  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>  	u32 desc_addr, ctb_addr, size;
>  	int err;
>  
> -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> +	desc_addr = xe_bo_ggtt_addr(ct->bo_h2g);
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo_h2g) + CTB_H2G_BUFFER_OFFSET;
>  	size = ct->ctbs.h2g.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>  	u32 desc_addr, ctb_addr, size;
>  	int err;
>  
> -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> -		CTB_H2G_BUFFER_SIZE;
> +	desc_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_DESC_SIZE;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_G2H_BUFFER_OFFSET;
>  	size = ct->ctbs.g2h.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
>  	if (needs_register) {
> -		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +		xe_map_memset(xe, &ct->bo_h2g->vmap, 0, 0,
> +			      xe_bo_size(ct->bo_h2g));
> +		xe_map_memset(xe, &ct->bo_g2h->vmap, 0, 0,
> +			      xe_bo_size(ct->bo_g2h));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo_h2g->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo_g2h->vmap);
>  
>  		err = guc_ct_ctb_h2g_register(ct);
>  		if (err)
> @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  		ct->ctbs.h2g.info.broken = false;
>  		ct->ctbs.g2h.info.broken = false;
>  		/* Skip everything in H2G buffer */
> -		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +		xe_map_memset(xe, &ct->bo_h2g->vmap, CTB_H2G_BUFFER_OFFSET, 0,
>  			      CTB_H2G_BUFFER_SIZE);
>  	}
>  
> @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (ct->bo && want_ctb) {
> -		snapshot->ctb_size = xe_bo_size(ct->bo);
> +	if (ct->bo_h2g && ct->bo_g2h && want_ctb) {
> +		snapshot->ctb_size = xe_bo_size(ct->bo_h2g) +
> +			xe_bo_size(ct->bo_g2h);
>  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>  	}
>  
> @@ -2012,8 +2030,12 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
>  	}
>  
> -	if (ct->bo && snapshot->ctb)
> -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
> +	if (ct->bo_h2g && ct->bo_g2h && snapshot->ctb) {
> +		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo_h2g->vmap, 0,
> +				   xe_bo_size(ct->bo_h2g));
> +		xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct->bo_h2g),
> +				   &ct->bo_g2h->vmap, 0, xe_bo_size(ct->bo_g2h));
> +	}
>  
>  	return snapshot;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 09d7ff1ef42a..385a607e4777 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -126,8 +126,10 @@ struct xe_fast_req_fence {
>   * for the H2G and G2H requests sent and received through the buffers.
>   */
>  struct xe_guc_ct {
> -	/** @bo: Xe BO for CT */
> -	struct xe_bo *bo;
> +	/** @bo_h2g: Xe BO for H2G */
> +	struct xe_bo *bo_h2g;
> +	/** @bo_g2h: Xe BO for G2H */
> +	struct xe_bo *bo_g2h;

since we already have h2g and g2h:

	struct {
		/** @ctbs.send: Host to GuC (H2G, send) channel */
		struct guc_ctb h2g;
		/** @ctbs.recv: GuC to Host (G2H, receive) channel */
		struct guc_ctb g2h;
	} ctbs;

maybe just add .bo member to struct guc_ctb?


>  	/** @lock: protects everything in CT layer */
>  	struct mutex lock;
>  	/** @fast_lock: protects G2H channel and credits */

