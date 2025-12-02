Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD131CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 05:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995DF10E50E;
	Tue,  2 Dec 2025 05:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwbOwB0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921B410E50E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 05:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764652372; x=1796188372;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=EBpuO+6i85J597jVPSGU15hRtjVR93cekNGfK+VqYmM=;
 b=mwbOwB0F74/cWDSBz2qfctdIUuWLZJ9HwLTqagNRvOrKRjSOOQoB2k6p
 i3JlpHLDPt1kuTV1+fN2d+Lcbo3XOWirKPvMXN9fW59t/Z4fuGFRTOydL
 wsVLgJnCc/beHurvpcZKAuf4GtSukbiywbs4I8stC4CgDed9+rZSaEqA4
 Mzphl9fE2/QXzIpiGIUeVtv9zLBETzk/+p6I711UlmFhXP38NEIBhYDpq
 T5CEI+//4GJCMcr6PoFGB7j9yZ7vBXlgAZ2T5qHFn+kcETCJ7TkHddJU3
 /BDsfZUnoCLNG2XDOA35HA6Om0vQNyahYGBZnpCKwLWAyRIiQxUGhPQ30 A==;
X-CSE-ConnectionGUID: Zo0kGJ4LTimZxPtZ4vYfoQ==
X-CSE-MsgGUID: ZJJ/5X0RRSOyDGbATdqCxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70467535"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208,217";a="70467535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:12:51 -0800
X-CSE-ConnectionGUID: +3I4mmuOS/WbWgi5KU7qZA==
X-CSE-MsgGUID: U6cuQdARSU2CTgfjDhv+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
 d="scan'208,217";a="199212891"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:12:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:12:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:12:50 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/62xt+QTLlYGNNjQO56LhR+AMn89c2/B7PvcXycUWvsFol5acMawVDNl1uO8mv6G0yPiWcZwyNk9MDuxdrIg+mW2e37xkD2cAE9uh1HZlOGHwM4KpEd4b23M85FhDOITziaUfrHRATI9zYyFdZnz3EJ0CRqQKUDpqZvL1BQdXcJZS507PQWEH8zGYYzz8RgVHcigM66G9Ik7+rcFHuDJl8LmEH4KJuJYM5FG1dVwj4I6c24gZCMmQOcYu5lDmfJX24YTeN1HwHuRujF1UgC4xNHMD7Ls02fMlgYIRvM35yobiosWm9gdyM48Cs4WVH/AH75qtE/CVrhkEBQOh8JVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3bkbnOaPN58hudlDubtnzJgmQQtzG91+vZnpeP5zFc=;
 b=UtYDKKjl7ZPwumMDGGiwhcFKZ3cJZtDo40Wjzs5IY6cMnOKGd+Mstedbu6aFEEGWGqFSmysKqB64O6AwQc2ctrvOsZU+sYcLrFPkrxFpwTeaHEdyuov3G5WmL9qmQh/lSjriytTWg71P2TxcnNI3HAZ1XvglNEwmVPkGvFc0C0k4tK+oEFkHOd7EWGxu8BKZ1P6iI5gG5kQfh18FW9rXXWkXk+PcjcozwtcXaf+XNjUxa1hrrzSKOq0rYR8yNbhhoHAfYr/gLQqzCi4d9my4y2MOjYvUig+DhPl9iBLMHA5BZnC3xgg0gWDg6T9gOsEkDYrgx5Q2VjugJxBnxwqxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ2PR11MB7473.namprd11.prod.outlook.com (2603:10b6:a03:4d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:12:33 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:12:22 +0000
Content-Type: multipart/alternative;
 boundary="------------0GYGPfMCzUibnaNzuOANDflE"
Message-ID: <ef427400-8e56-4529-a7f3-b6a28f04a606@intel.com>
Date: Tue, 2 Dec 2025 10:42:16 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_VF_double_m?=
 =?UTF-8?Q?igration_=28rev8=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
 <176458854801.42244.7897965550539954212@a3b018990fe9>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <176458854801.42244.7897965550539954212@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::9) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ2PR11MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 54cb85d6-3d6f-4221-a83f-08de31615f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG9UWkIyeDVnNXIydnNFM2JjVUo4b0xhY1FMcWxXV0FveHY3Q0NMRFhielJq?=
 =?utf-8?B?eHJ3MVQvaVlrdk5uRDUyNDhrTmYzQ2Zhc1Y0S3NEZ3l5R2JFMkFwYm9Hb21I?=
 =?utf-8?B?bWtSZVBWRGVjRlI0bjhkTHlRQmdiaWpCa3VmVTYxTGVBNUJqakRiZ084WmVw?=
 =?utf-8?B?VDBNOHhTUFk5bjhtejFsS3RxM3hYcWM0N1AxR1NQcjFhZjdzakR5ajZKTGdu?=
 =?utf-8?B?VnJpTFZnY1c1eHBBckJNUHd1c2JkV0lTcDZBbUZEUVdaUjFnM2x0U3REUzVP?=
 =?utf-8?B?WHBsbDQ0bFN1L3I2OElSS3hoakxqeERLbWtUTXRqZDA1UXVPVzJEZXphZWs5?=
 =?utf-8?B?cWhzcFB2ZHFqS0phVUo2R1FNZ3Job1JWSUhjK2haYklIR2hwRU5seG1CMnl4?=
 =?utf-8?B?WW0vSEpCZzRUZGtvb2JiMEdKYjZrMDlScnExNEZ1S3c5N3pTMXdvM3U5Nk5K?=
 =?utf-8?B?a2VhT1Z3WGVlTnJ2V3hNR3NFblgzTUg4TkZkcWZnalNvb1paTmU4TisvZTZw?=
 =?utf-8?B?b2lRZGJCQjJJaUlSUUFjRlJZYWx6eFlnamdtVzVRR2tiZGsvYUxPV1duY250?=
 =?utf-8?B?M1ZZZ0xYQjIxblI5NFpiV3FLT21obEFFdlJnNWJCUEt1M05sTHoycDJ0SHlM?=
 =?utf-8?B?M0NnNmdVbEZYRWFRK3dkaDdaMXdveHU5bTBLYkY3UlRpaGE4elM3alRzQzhZ?=
 =?utf-8?B?TEpiU3Z1NU13SllPS3phZDh1ZWNhZ2NxM0o3U1VqTjVsYnFoWW1yRmRHTVpR?=
 =?utf-8?B?Vmd4TUhyV2hnRldHN1JZNU9kQXVhd1VGWW9UZUlzcmZDSW82bGp4dUFIU1BF?=
 =?utf-8?B?dG41QnkzeG9HZVRzMXNzeXlLVHE3MUdDSFZETnhpbVNNMmxnUCtHcGJrU1RV?=
 =?utf-8?B?M0c3a25XZkZwUUUrVmZGdXFGTlBxTkl1MmtTQ3dzdmp5YnA2MUJ3dWlzcnZF?=
 =?utf-8?B?Zyt0ZGJkZUNFMk1yTWo1QlpkeGdxWnhGVUJpRGZBRW5kcXg5aWJFRmw2RG1S?=
 =?utf-8?B?eVBZYlFzYUcxTlVneWMxWG5kR3NLZmMzK1c5S05wTlgvS2JSaG1XSnJLUWlh?=
 =?utf-8?B?b25aTVVhTXh6eDZQRWMzNGN4VVYzYmxVbENGRTVIQnhQdlU0eCtsaXFJcWdT?=
 =?utf-8?B?QnBaK1dxRTlKYTRQbmh2ZzJ2N1FuSEJyY2RaYVFrN25GeHl0c3VwUmMrU3dG?=
 =?utf-8?B?NW9LczhERXpPWmVTWW1JV0hMZ0Y5aDBJSTRjNGVZYnRvQ0o4dGdEZVFISm1Y?=
 =?utf-8?B?Y2Vzb05zRXN2VisvR2Jnc3FONnVoS2tpWS9pSnd1dGVINW44eDBnaTYvWHFj?=
 =?utf-8?B?NER2bHJnNHZsYXo2Zkl3NFY4R3J2d2xBdkVTYVIrUmZxRnpOaDdiRU80WXc2?=
 =?utf-8?B?YzJna1JoWWhIeFhaYmlkeUV3VWc3dzZHNTdGYzl5YTd1MVBXQm1wRHZ3YXBr?=
 =?utf-8?B?U2szcGV0S1p0QW5MWGNCQ21ZWGc2azhRcVRrNWoxTVZYZS9xcWRNYnB4Vzho?=
 =?utf-8?B?QzFIc1NNNWU2RnFmOXdYOE5seTdORmR3TTRPek9saWpyNUNtakR5YjBEN0pV?=
 =?utf-8?B?aG1xaFY3clBjZXNpY2FlT2FlYkt6MjBHRFJJYXIwTG1Jdk5YZnU4T3gvWC8y?=
 =?utf-8?B?LzFjVG1yYlY2M1VWVEFPZjh5QWdBWHE5ZlNZV2tVc0JTck8vcmtDb2JzV0xZ?=
 =?utf-8?B?TWtteHZxank2K3UvQkJ4OVUwV05TR0tzZkpTamRDTEI1YzVWM29RV3JEcGMx?=
 =?utf-8?B?ZTdaSGdzR2dhVGROUlFsVUY3UEpPcXQ0a3ltSGFMaithYWR2c0pXMTkxMWFZ?=
 =?utf-8?B?QStCV1pocUliWWFWOThoN0U3UGd0cnoyeEo2ZG9yWUhBVmN5blVDVzBSZHpD?=
 =?utf-8?B?NHdvQjNHZm9JMWtxaXo0WjFDMHY1QkRWWlZudTYxYVZDNkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJkaXFEYWx1YkZsTlQ0WTBVSmxDMjRzVU5TcFNhdndpbzNJbzhOQnhrYUFi?=
 =?utf-8?B?WFVIclpueHZFQW5zbGcybW1NVGxTamh3RFNnbzFJbkNyeFB3OWpFQUhMUVQ3?=
 =?utf-8?B?RitqUjFiT280UFQvM3IrVHQzYUc4VTZhTmwrN3h4Tml0M3pmQjVPbldMUmVX?=
 =?utf-8?B?cm53cldvL2NrRXg3TEZoWWJGeFFWOHd2TCtmbHBsYnAxSVorZ1J6MmJmSkxH?=
 =?utf-8?B?eW5QWnVBWXZ1ZmpjVXAveCtpcE0ybGF6M1BIY0UyNjNobHNMbkgrTlRCaHNJ?=
 =?utf-8?B?UVNsZ05rMWU1VWFaZUJZbWppWHlwK3RaTjhSNkU1V3JjV254c3MwNkR4cFhs?=
 =?utf-8?B?ci9SWjdsb0dDS2lCU1hwRWhWV0VFU0lLajVMNmdDVndrOE1SUVRXS0pBZVJD?=
 =?utf-8?B?MEJzejhkY0Jxamw1RkVhazNDWmNwYWZwMkY1TXo1TUlKZkIrV2xwUkpMMGgr?=
 =?utf-8?B?VHFmZlFSUUhQdGg5b042ZG1iRFVEVTRmcFovOTFCM3ROanAxSjM0Z1VpS1Va?=
 =?utf-8?B?NVhzek8vdWVraEZodmFsUFVIWkZDQUcwOC9LcThIR1hwVHVURWF2blFJWGpF?=
 =?utf-8?B?aVhvdFdlMDcyRFBQSm0yWVZsanh3OCtUNXI5UnIrSnhhOHlIa1RvNUs5WFVy?=
 =?utf-8?B?TlViWHd6YlBGdHI1MEpNSmRnWTRsTk1YUVVSajFtWnZCekZPNDBZNVd6RzhX?=
 =?utf-8?B?WjZscUUya0dEN3prdHRZQ2I1N3JpbDFTeGdsc0IybWhDQlBSdHNQY2Y2ekl1?=
 =?utf-8?B?eVVhREpCaTFDNmQ1VlBOcTAvQ3JIVjI1V0QrV3JJTXV2aHltM3dpOUZqTExx?=
 =?utf-8?B?YUVaa2wzTGRqZDVRbWljWGN4T2JKNTRNeC9mTlVUb0hoTHpMUXBkcjBFTGlQ?=
 =?utf-8?B?OWFMVE9xei82TVcrazgxTytLWDJha2t5cWNNUXF5MG5UUWFkRzNMQVN0eTA0?=
 =?utf-8?B?dEdkRHpIWkhhVko1QUhSMEhER2N2WWhxSkM3b0xJK2FiTDVpZEkwQzg2Yjc4?=
 =?utf-8?B?YisrUnFwRTV1Z2R2R0VsQlQ3VDBub1gxc1p2M3FDVGpJT0lEN09jWFJYc3Zw?=
 =?utf-8?B?b0lZR1hRcUJhVmUzU3RjZlExWnRvZmpMWUxjTUZ6S1ppdGRCK0lLTWtQU2FW?=
 =?utf-8?B?UWRYaFRxZUlsakNpWWhRWEtmVXA0WFBySFBuWHFmeGJLU3BGRW5lb1N0eFU0?=
 =?utf-8?B?ZlUvMkViaEFORm8zNGdsNVF3OG41OTZnN2pjMVJPZ1dPMjVxdFFjWGdiV3pL?=
 =?utf-8?B?SHBYUGNnN0NiYzZxTW4wZWZDRHpWWk9JeEI0azM1SW5ublU5SUxsUUhLNFNx?=
 =?utf-8?B?c055MHgzejE5Yk9PWGFTUER4Tzh4TCt3NWVlMFgyMFBFamtuY09UdkdwaHhp?=
 =?utf-8?B?enhTNDJRY1FrU0NSbTVNeTNiSUdod29ETm5kWk1ZdVo0YVdFNHhuWGc4TVM5?=
 =?utf-8?B?YzAzUFJZYWIrazI0KzlqSUpjKzM5amxDM0pFWEJvWFBRQTRRTmtHM2Z5NmhG?=
 =?utf-8?B?cnRua1N4cEJBdmN1WFU2ZHBzc29OYkE2NDh0OVlSMVRjNWwxK2wwWk52MjdI?=
 =?utf-8?B?cE1tNFZlb1dPWUcycUdPWTQyVis0RUw5Z1A4MnR3WEUxdGFJY2JXTmRDRkVD?=
 =?utf-8?B?dk9hTXZ1UXJUS2J6dHBZNUFlWlVJU2Y4aENxdjd1YkE2QitwMlBMVTQ0dFBW?=
 =?utf-8?B?RTZoUythN2lzNTRMTllXNHBncUkwQlFMV0ZkN3JWVzV3THk1YVQwTGM5RDJk?=
 =?utf-8?B?YmlxR0xGZzFsaFl5SkFUanAxeUY5WnRZQVVTT1E0dUJBNHZuS3V1WGZGbTcz?=
 =?utf-8?B?SkdNN3BscWUrL3lPWUlNYWc3a1F3WUxEbnVqckdMQzROQlc4MDVuOVZnNklj?=
 =?utf-8?B?cHlwaktkOUVtMS9WQ0VoNmY2UGcwUU9paWNid2o0V1ZkcDFjdmF2WHhjTWRO?=
 =?utf-8?B?eENyQ0VjVUlaU3FwY1orWTBQV2lyM1Y0bjlIYWxOSTRqLzdwMDBud1YzVW12?=
 =?utf-8?B?WFRXcGxHWjFPcVE4TEx6TWh2cjBkZWlIRzIwMExrS1hEY1ovWTNGVGN1WGNF?=
 =?utf-8?B?aWJKWDQzbmtuZG9UUFA2MTVkZDlDb3RJdU9wU21XeFNWa25uVDY3UHQ2MDRx?=
 =?utf-8?B?NVhucjRtamNQUDVMY1BLNlhqUk9xemlreDhtcDh6ZVhPRHBTMzcyenR5OVdS?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cb85d6-3d6f-4221-a83f-08de31615f98
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:12:22.4662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPeYyscxA9ep26uvHnVI7ujKGLl8C37AMkJ8W18DVP8q71Qkigy2K7BnXaf0l76AUyI8LWnrkZWGqJQZNq9u/vYOzQi4YMwtNYGSMG8If1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7473
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

--------------0GYGPfMCzUibnaNzuOANDflE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01-Dec-25 4:59 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	VF double migration (rev8)
> *URL:* 	https://patchwork.freedesktop.org/series/156339/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/index.html
>
>
>   CI Bug Log - changes from
>   xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5_FULL ->
>   xe-pw-156339v8_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-156339v8_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156339v8_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-156339v8_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test fail
>
This series is relevant only for SR-IOV save/restore flows and is 
unrelated to the reported issue. Kindly proceed with merging this series.

>
>     Known issues
>
> Here are the changes found in xe-pw-156339v8_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +2
>         other tests abort
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +12
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>  *
>
>     igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>  *
>
>     igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf.html>
>         (Intel XE#6704
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_flip@2x-plain-flip.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +6
>         other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms.html>
>         (Intel XE#6662
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662>) +1
>         other test abort
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428>)
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@pr-primary-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_psr@pr-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_setmode@basic.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) +5
>         other tests fail
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-strength:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_sharpness_filter@filter-strength.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-4/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html>
>         (Intel XE#4488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_vrr@max-min.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
>         other test fail
>  *
>
>     igt@xe_ccs@block-multicopy-inplace:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488> /
>         Intel XE#5607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_eudebug_online@single-step.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#5565
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_evict@evict-beng-mixed-threads-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-large-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_evict@evict-large-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#5564
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321> /
>         Intel XE#6606
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392> /
>         Intel XE#5575
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575>)
>  *
>
>     igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288> /
>         Intel XE#5561
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-huge.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>)
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +40 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +1
>         other test skip
>  *
>
>     igt@xe_oa@missing-sample-flags:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_oa@missing-sample-flags.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337> /
>         Intel XE#5572
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572>)
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1
>         other test abort
>  *
>
>     igt@xe_pm@s2idle-mocs:
>
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-6/igt@xe_pm@s2idle-mocs.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>  *
>
>     igt@xe_pm@s3-basic-exec:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-1/igt@xe_pm@s3-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +4
>         other tests fail
>  *
>
>     igt@xe_pmu@engine-activity-suspend:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-8/igt@xe_pmu@engine-activity-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-9/igt@xe_pmu@engine-activity-suspend.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +5
>         other tests abort
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>  *
>
>     igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168> /
>         i915#14968
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html>
>  *
>
>     igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-432/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html>
>         +2 other tests pass
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         +2 other tests pass
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_content_protection@legacy.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@suspend-resume:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_content_protection@suspend-resume.html>
>         (Intel XE#6705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_content_protection@suspend-resume.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#6715
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@xe_pm@s3-d3hot-basic-exec:
>
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#6255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5 ->
>     xe-pw-156339v8
>
> IGT_8645: 8645
> xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5: 
> 3b52d478232391a04b1de6c981cee6fc8f35dcd5
> xe-pw-156339v8: 156339v8
>
--------------0GYGPfMCzUibnaNzuOANDflE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-Dec-25 4:59 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176458854801.42244.7897965550539954212@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>VF double migration (rev8)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/156339/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/156339/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5_FULL -&gt;
        xe-pw-156339v8_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-156339v8_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-156339v8_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-156339v8_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>This series is relevant only for SR-IOV save/restore flows and is
      unrelated to the reported issue. Kindly proceed with merging this
      series.</p>
    <blockquote type="cite" cite="mid:176458854801.42244.7897965550539954212@a3b018990fe9">
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-156339v8_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) +2 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704" moz-do-not-send="true">Intel XE#6704</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704" moz-do-not-send="true">Intel XE#6704</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704" moz-do-not-send="true">Intel XE#6704</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send="true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662" moz-do-not-send="true">Intel XE#6662</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428" moz-do-not-send="true">Intel XE#3428</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393" moz-do-not-send="true">Intel XE#2393</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-send="true">Intel XE#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_psr@pr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-3/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-strength:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@kms_sharpness_filter@filter-strength.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-4/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488" moz-do-not-send="true">Intel XE#4488</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142" moz-do-not-send="true">Intel XE#2142</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488" moz-do-not-send="true">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607" moz-do-not-send="true">Intel XE#5607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599" moz-do-not-send="true">Intel XE#6599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-compute-kernel:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447" moz-do-not-send="true">Intel XE#1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_eudebug_online@single-step.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565" moz-do-not-send="true">Intel XE#5565</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_evict@evict-beng-mixed-threads-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_evict@evict-large-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564" moz-do-not-send="true">Intel XE#5564</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606" moz-do-not-send="true">Intel XE#6606</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575" moz-do-not-send="true">Intel XE#5575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561" moz-do-not-send="true">Intel XE#5561</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007" moz-do-not-send="true">Intel XE#5007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send="true">Intel XE#4915</a>) +40 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send="true">Intel XE#4915</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@missing-sample-flags:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_oa@missing-sample-flags.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send="true">Intel XE#3573</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337" moz-do-not-send="true">Intel XE#1337</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572" moz-do-not-send="true">Intel XE#5572</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@xe_pm@s2idle-basic.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-mocs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-6/igt@xe_pm@s2idle-mocs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-1/igt@xe_pm@s3-basic-exec.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@xe_pm@s3-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-suspend:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-8/igt@xe_pmu@engine-activity-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-9/igt@xe_pmu@engine-activity-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) +5 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send="true">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168" moz-do-not-send="true">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168" moz-do-not-send="true">Intel XE#6168</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968" moz-do-not-send="true">i915#14968</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" moz-do-not-send="true">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send="true">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-432/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_content_protection@legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@suspend-resume:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_content_protection@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705" moz-do-not-send="true">Intel XE#6705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_content_protection@suspend-resume.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715" moz-do-not-send="true">Intel XE#6715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633" moz-do-not-send="true">Intel XE#4633</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send="true">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v8/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255" moz-do-not-send="true">Intel XE#6255</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5
          -&gt; xe-pw-156339v8</li>
      </ul>
      <p>IGT_8645: 8645<br>
        xe-4171-3b52d478232391a04b1de6c981cee6fc8f35dcd5:
        3b52d478232391a04b1de6c981cee6fc8f35dcd5<br>
        xe-pw-156339v8: 156339v8</p>
    </blockquote>
  </body>
</html>

--------------0GYGPfMCzUibnaNzuOANDflE--
