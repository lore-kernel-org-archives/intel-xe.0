Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27738EEC2A7
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0A310E45C;
	Mon, 23 Feb 2026 22:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frGk3tk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03710E45C
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886656; x=1803422656;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=60w+f+TUgNbZYmU290NnqERhaVxqycuseN8jXGKb5OI=;
 b=frGk3tk+aWGg+1mQbQh0qTDN8JlS45ngmmChh10Ez9DoB+tzvaA2YV51
 lSI+TZOuA7QPFXIjmy89oxAvJD5SHI8COYs58piD2paQY0h0HFfVlSadf
 OwEjSXLo4M73hnLiCYaakYc7HLX50SEM9UNp5QSw0RiLxqKLZxc/ysQp4
 q5RrjilO3hnrQtTnawny9cxDEs6WJNJRzEvIMFprbg1eiBHF7WDC1OSFz
 Np+qkKpbJHMPvutXUOcW0XRI3isihl5q13clKBq8SfX2GqgulGfzFrcXU
 K6wMAAbvTmg5TvsvttZGaDnEHm9y8/Xi6DXQPub2Hp3HSCVpAg3zUGlz4 Q==;
X-CSE-ConnectionGUID: OY8FSX0pRHO47QLIeoxRYw==
X-CSE-MsgGUID: 6htdaJq/TGiqO6u7ciZbHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72797610"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72797610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:44:16 -0800
X-CSE-ConnectionGUID: 7xaSAa3NS0eo+Q6jInGrzQ==
X-CSE-MsgGUID: Sy37pQaBRNqTVHQL6Md96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215722464"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:44:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:44:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:44:15 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:44:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajNgwUarrh+xwejBRpgJHyxfhFz7e4AOwS5E1vY46qSyMfFeSW5J08U5eEO4/O8JbkGP1Mt+gcYdtHL7P8yB4ursQoRMmQPSzqH51AVixXijohcRS5oPEZKvkUkpZIEU8UQo9I+7ksHgbBVOokiSHfnm76fq/Vthilh8x5hMsowVuyn+XVPi8TOMib1Z0F7rbJGwYoA+RIzlCP45X1BGQD6uTmNTYjJGgPyqctHAFOD2VigrT6mm4dc7IvSf1jnRrGa24dPB57oHZ7K/lEBgOcg/BoGRrP+/GmQqm5Sdo5VasOQVSRa0Oup4rNpdWSpMNZIMal5vPEdlrwtMjGuL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60w+f+TUgNbZYmU290NnqERhaVxqycuseN8jXGKb5OI=;
 b=OFjqkHOVuPe2Pctx+VrSJ14KC8IGmA9HT4gGL8qf+3gNlvTRxQq8zowW2LHGYMKPx5/Hw/+FtWoS1yunW7ZfCvt/Vw57gv56B0kluyWmRsosTTZ4RaEVTz6DkuB2iRv1pwxgUWof9gDTUnp1lLlNypURNvzalmlPcbEC+qDykZXMCw7w0DrrjJqs4DsKNAZWZCd1pcg/9DTC2qpaaVoWaSKqzUMNBN1ypoG0bwsSLq3MyR4dl3y7cj6H2KC3/oXeB6wm9hiK8dStCXBOnuIevZ3WmwKfCNBtKh7I6T6rLHhObWw7uOAwXX2z6karm9Oa58g3BMCsqAzpttCeMcLT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:44:12 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:44:12 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 22/23] drm/xe/wa_oob: Consolidate some OOB rules
Thread-Topic: [PATCH v2 22/23] drm/xe/wa_oob: Consolidate some OOB rules
Thread-Index: AQHcoo5hNqTvx4afbE6z8Qz9vpWt3rWQ5dPA
Date: Mon, 23 Feb 2026 22:44:12 +0000
Message-ID: <DM4PR11MB5456A5794DBFC6D945E6BA2EEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-22-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-22-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN2PR11MB4727:EE_
x-ms-office365-filtering-correlation-id: e080f461-6b42-4fb9-02d1-08de732d10d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Ulo5UGYzUjVReUVJQVRIR3RBQnpKbFFyS09venRzbzRJdjV4RzNwY2p4K2Ex?=
 =?utf-8?B?WGoxRTdDMzdVWVhIZGdiSDRZUzQrQUhLc2IrY1pMMmdndHIxY1J1R09idTlj?=
 =?utf-8?B?dlNscGJ1T0ZoU1hqcU5qc2ZyOXdWdlNUYXhGR0tJZnVFdjNPUjgyOGN5Qllu?=
 =?utf-8?B?Vy9nZVVyNHZTcXdTNXZaWFUyQW0vNW9zb0t5OGV6dG1jcGlVTHQ0dFlJemh6?=
 =?utf-8?B?REJHWHlmc2lueDhySXZZcUpKS0plajdSMllUM29RbS9XTnFnUytMcWxHbWto?=
 =?utf-8?B?b2FhcTVVZi92aFJaZEtiYU0wc3FISlRwcWhOTUxGTFYzQWFMemYyOHVyYTJH?=
 =?utf-8?B?Z0tDUGQ0KzdRVUhNREp5YTl2YSswanNRVEVZbVkvdnpwYTdmRURQZGEzbFFl?=
 =?utf-8?B?SmNuamREWlZmaENyRzZsSC9jTVpGMnlrenlXb2JnUlZ1L3NmbHFVT0dBMW1S?=
 =?utf-8?B?VU9zSURKN3BpVVo0cVR3NnYyV3RTcW5XTTY3Z1cyY09lTHlCbnRCYVdKVlBy?=
 =?utf-8?B?Y0g0REJ6YTVrMU5rSUpmdVlWNHJ5czBBWUtpb0l3REhudmlSZWdmRER0aWhN?=
 =?utf-8?B?ZEE4d2JuMEI2c0NPOHpjVzJxZDhJcFNocVlhczV3TjBLZE1rSXAzUDFIR09K?=
 =?utf-8?B?ZDdPRTdQb1FMb0xVVTI4NVEwdU16N3JoUWRBUmw3MnliS0U1bjY3aXZrRDlL?=
 =?utf-8?B?Znh2SW16bHNZMlZ5TUpVcExyTTJ3NHlPNDFvNVMzRXdvMkd5VHBYWk9JdkFw?=
 =?utf-8?B?amN5OGxON3RJam1mWU82TmY3QTZleFh4VmRuTkduTWNPSnV5SEt1QkNROEtG?=
 =?utf-8?B?NU9rZHZOZUE4T3N0UkNiODNUT0dXTkJqZDB6TExjWUJjbklDRHZvejFHenc3?=
 =?utf-8?B?bHJ3MUlBVWl6VmkyczRVcjJleXhUNXlOVWZoZzNQNlFxVDgwNi9TL0UxMThs?=
 =?utf-8?B?T0REb1BlZGcrcC9HK094NnpvUzdaY3RvV2U0VmVCVWNyRWVYaVVyVkVCMnNk?=
 =?utf-8?B?T1BWM1oxWmtQOFJJck1lY1FwNytsVUpuN2Y2MUcrb3orZ0ErMXVQc2JqWC82?=
 =?utf-8?B?cnJJSXFpZHRlRGdOczdmQnFmS2M5UUZQMFlIR2JFNHA0bk8xMmRyS0E2dDdj?=
 =?utf-8?B?QTB2MzZOWnczVUZoT1JpYXBDTk9sSStyanRVc0lHckw0SXptUVF2eTBlYVBn?=
 =?utf-8?B?d0s5VjkvK1ZqeGI3ZzVFN3RibUovMkdtZUFTdVR5ZHZpY1pYejZZcjdmeEpC?=
 =?utf-8?B?V3RMT0dTSVprcVhVa0NZdVhKNWZ1L0tXVWEwejVtaE1oU25VaU9OQXRBU0dD?=
 =?utf-8?B?c2VUU1ZLNTVqUmJZZzJ4elRNVjBReWFvUUg3dm1ueGNjbTNNZmNiSklJMUlU?=
 =?utf-8?B?UHVMbjNzaEdpODROS2NDblBNU1I4RSt1cXZMbGs3UW91S1JjcHRTeGdFWmxF?=
 =?utf-8?B?dlNBSnp5dUxQeDEwY1paT0hKRnRQVjJyNG9sWDNHZ3BYYUcrQjM5Y2RoZk1Y?=
 =?utf-8?B?SGJpMU1wNVdBbmloNWk1WS9UeHRnM3ZXNzBia1F1eVh1ZGR4TGxCNUNOS1Iy?=
 =?utf-8?B?dHBTWlBrMG9OelVha1pDTitXQ3o2T3lubVN1V0IwYnpTdjJLZzNyRkNZUm54?=
 =?utf-8?B?OENHWjRXSlNpWk9BRUxCQ0RacXN5ZmVtUkltY1djQWFBcitEbE40VEdDMlZS?=
 =?utf-8?B?ZWNiTjhibjFWOVozUUNTSFhmM1dMSXZ4Mm84aDN4TUpSS3pEUytzYTBKMWtz?=
 =?utf-8?B?WU9qVVV2TUhqcWxJbE1RcDZacEt6OWhlaUZVbU15RytMZVl0eXoybWpkT0sv?=
 =?utf-8?B?RWJtVkNOeUlSdHpEYWN2UWlJeDZMMEw3OUV0akpuTHdqb21memNhWGhnRFMy?=
 =?utf-8?B?WkcwaDU2SjkzKzlrZVBOZ0E5VnRBV3E2VkhsV0lEWFlHbEp2akM3SWR2aHFW?=
 =?utf-8?B?ZXAxbE9HUHlGNmhLQzhmQzUvWFc3eVNLY3RNVjd6c2VCLzZtZUZqSVBZYmNw?=
 =?utf-8?B?d3RWRG04Zmkza2p4eDNFOU13eTUwaitjNFZMbzB5MDF0MmF4eWZ3TENEQ0Y5?=
 =?utf-8?B?L1BuZ3NwSVpyT29adFlwdmhPcTRaZHZWWm40elY2aHNsSnA3QU84U0gwa0pV?=
 =?utf-8?B?SFU1aEpFbE55U1VLZG1oVFpvaVdqZVZBVmJBM3M3am9ucDg3bXdZbG5vWEZt?=
 =?utf-8?Q?vDK3AHL7/spvzjZqf6GLsRU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGdFN0srYkRPdXJwNXdhbmdzVjZFelZ3cDNGcS90Q2VGWGRQTis2NFVuVEF6?=
 =?utf-8?B?UEhPanpCVWZrSy8zQUZBN0pueUlDcHYxZVJCeS9RNTFnUkREaVByQ0x5QTRm?=
 =?utf-8?B?TXUycjJqQlR1SmQvYTlaclQxZ0twR3hXemZrdkRWaVVTa253eHpRbFlKUDUw?=
 =?utf-8?B?OEMyUUoveWhkWGZiTXFkK1pFNlFKUnpqZ1FjcDNEWXo5NTI1ZERaUThaY1By?=
 =?utf-8?B?eDl0UlpWY1dEUHVGN1JOSzgrYzdrckNMWnl0YXkzSHFFQlRqcVVEUzFKL2VX?=
 =?utf-8?B?OGhXWjNVWXgxenFsbm9PR3FNcnFIdnVQNHR4UUk4NGtCZFRXQ0hvNFcxZWNi?=
 =?utf-8?B?bnkzVzhNc3JBWWFrQUNKcGRIZE5oSlc1dm1zQUtLRjVqbVhLYXNkdENDV05p?=
 =?utf-8?B?d25qRmZzc3lMVUxkRzg5Q056c0NLRGd4d2VlbUowSU9jZFVqYWx2UkNNenVL?=
 =?utf-8?B?cllTdk4wZ1lKREVwZS91NjVHYzR3MEVjaDJ6eGRxWGN6K1VMTjNTZmwzblZP?=
 =?utf-8?B?djVQRDFTdk1Rdis0RlZkSWxteElwMTVjVVF6VDhHNzVsYTUxTnQxc3BDU3d0?=
 =?utf-8?B?N1NQTlVUbnZ1WFBYd3gremU4THlqemd3WHNZWEk3ci9RMWY2TmI0NEk0Tzht?=
 =?utf-8?B?ckVHYldNMlR1QnR0MXhsSDZNM2NnSnFwcEU5K1daZTJvMTNFVjlwV3JwUllz?=
 =?utf-8?B?L2ZHQ2xqSUorNlBuSDdqN2c3QnZSSFhmaHRCRVpTTGgxMXRpNmZqVjBzU0VQ?=
 =?utf-8?B?WUVGbzJCVFNNeEJvZ3hObjRISW53RzhUdjVHQ0Z0S3g5WW5NSFZ2OXM2OTM5?=
 =?utf-8?B?UmRZbU1hbTczTTRtdUxsZ3RzTExNbkg5eGNFT3RmbkwvM2Y0aEVxUHE2Z0NH?=
 =?utf-8?B?U0pqa3lTV0NiOVdNOVlrRkszVzNsZUkzMEFtWGZjQ3ZmVEpiZUYzd0k2YW54?=
 =?utf-8?B?NU0yMTZLcnlOeC8zRG81bWVUSTM4S09uQnY4K1o1RjVoaC9DZGRhTDNhNmlX?=
 =?utf-8?B?UGJ0eFZKWDdWNkVMMGJaMnNXcDcvSE9BNjZ1cU1WQklrV2JnU1VvMjBlQ1lo?=
 =?utf-8?B?amNNbnFydWZCWWlkNDJJMDlZTUtjY1RScnJvTDRBb3I4UFBML3kzSEY5eWxk?=
 =?utf-8?B?RXF1YnVBbTZGZ2xxanFIVC8ra2dmSXFobTUvKzRxZXYvaW4zUkp5TUxzMERm?=
 =?utf-8?B?RU82MTZkQkI3WkdrbDhhT3lXWUZjL0UzUGVobWdzR0ZpWEozc1NMVmJTMW5V?=
 =?utf-8?B?TkdORUNZa3E1d3hHeGlaem5NY3ZyQ2kvSzVjS3pBeDMxSFc1bzEzZDJwVFB4?=
 =?utf-8?B?eXQ0TlpuckEzODlWR3FkSUVyZDEzcGg4VkVIdnVUcUYzTm8renJ4YU1xSzFJ?=
 =?utf-8?B?T2NIdElkWS9ab2IrdjJQb3h1cWZoZURVaCtFTlk2Q2lEMWgrS0M0VC9HRGxG?=
 =?utf-8?B?TFUwZkZYdHg1em5kNkpmMzdibEd5WG9GZEZPYStTUjIyWWY2QnR3TE5BWEdX?=
 =?utf-8?B?UXovb3lIMVdsMFdGZnRoTUpmMHVLZTJ5d2pnMEd1MlJzVEpKT2VOUzFvTG1h?=
 =?utf-8?B?OWZYRFk4d1prTjNLQnZHaXlVc0VXV3VzYWhEa2tUelZuR1AzTU9PdFgwOG91?=
 =?utf-8?B?Z08yTFNnaisySWZiVjVOVkVFL2FNZHBxTVcyak9lR251YzlyQjlMT2JJdjYv?=
 =?utf-8?B?cjFLMXpCQ3ZJbVZCNWMxZWtsUjFOdDZLc29sLy9xSWJHcHlUSmNJUndKSmN3?=
 =?utf-8?B?UjM0U1g2eGg1dVh4VmFvVmNTN0k1a1NmNXRRNCtiWEo5Y0dCWFF5QVZEL0ln?=
 =?utf-8?B?NVpXUmJlUDZTdlQ1TEpwM1YvZ3hiRGRxMGlvMzY5Zk5aT0tPYkZOeEhTTmFS?=
 =?utf-8?B?Z0VVQ0w1aGVORDdydG1DQXdFaXFHOFlsVnJxTGRLRUxFMk1oS1RFUlVtZjhU?=
 =?utf-8?B?NUZIUThRN05qVE1iTk5NaEVVZ0JMRFVPQjRya25WaW9VRzJiY29WVnFpSG55?=
 =?utf-8?B?SVRUbHVnN003bXlpd04rT0VodUw1L05oOGtkUWp3bjMzVWtvTk9YMXF1dUpw?=
 =?utf-8?B?Nkp3NmFEelljQVdnYm1QMmRpcHppRFdZdmxYbzZ3dmxScHVKU1QvMDc3VGR2?=
 =?utf-8?B?c1BKWjVPdUk2V1Frdi9VTEIyNjE5WnpXQVB6NkZORngyUFdNOU1sNEJiYmxx?=
 =?utf-8?B?aGx0dlJlVUVoNkNhOFdvVTlrTCtSdTgydE1LZXFPS3ZIdDcvdnJUV3U3OExX?=
 =?utf-8?B?czJMNHJLWjdrditNWVYxbTNVQ2hlRG9IUFcvN2F4dS8wSmpNbzB5ZUZpbFA4?=
 =?utf-8?B?dTFBM2dKNUJvbVVGNWJlYmdhMjYrd2RxVnZJeC9YcDY3SFh0YlcrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e080f461-6b42-4fb9-02d1-08de732d10d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:44:12.5868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpCmVSHa68IyrwP4Aw1JOJYxJnU9fadsOSqhEcCkTEyRcJdPK4v6BN3OSD2G5l4DLjkrFHZSwlgolOzeBEyrRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBHaXZlbiB0
aGUgbmV3IHBvbGljeSBvZiBhbGxvd2luZyBncmFwaGljcy9tZWRpYSBJUCByYW5nZXMgdG8gZXh0
ZW5kIG92ZXINCj4gdW51c2VkIElQIHZlcnNpb25zLCB3ZSBjYW4gY29uc29saWRhdGUgc29tZSBv
ZiB0aGUgT09CIHdvcmthcm91bmQgcnVsZXMNCj4gYW5kIHNpbXBsaWZ5IHRoZSB0YWJsZS4gIElm
IG5ldyBJUCB2YXJpYW50cyBldmVudHVhbGx5IHNob3cgdXAgdGhhdCB1c2UgdGhlc2UNCj4gdW51
c2VkIHZlcnNpb25zIChlLmcuLCBtZWRpYSB2ZXJzaW9uIDMwLjAxLCBncmFwaGljcyB2ZXJzaW9u
cw0KPiAyMC4wMyAvIDMwLjAyLCBldGMuKSwgYW5kIGlmIGFuIGV4aXN0aW5nIHdvcmthcm91bmQg
ZG9lcyBub3QgZXh0ZW5kIHRvIHRoYXQNCj4gbmV3IGludGVybWVkaWF0ZSB2ZXJzaW9uLCB0aGUg
cmFuZ2VzIHdpbGwgYmUgc3BsaXQgYmFjayBhcGFydCBhcyBwYXJ0IG9mIHRoZQ0KPiBlbmFibGVt
ZW50IHdvcmsgZm9yIHRoYXQgbmV3IElQIHZlcnNpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KDQpMR1RNLg0KUmV2aWV3ZWQt
Ynk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyB8IDMxICsrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9v
b2IucnVsZXMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+IGluZGV4
DQo+IGMzMjIyZDk1MDQ4ODliNTE3NWZkZmE3M2RiMGJmNGU5OTEwYTI3N2QuLjgwYjU0YjE5NWYy
MGMzNzJhNjgxDQo+IDZjZTk4OGI1ZTdlMGI3NTI3MGMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV93YV9vb2IucnVsZXMNCj4gQEAgLTI0LDE4ICsyNCw5IEBADQo+ICAJCU1FRElBX1ZFUlNJT04o
MjAwMCkNCj4gIDE2MDIyMjg3Njg5CUdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCj4gIAkJR1JBUEhJ
Q1NfVkVSU0lPTigyMDA0KQ0KPiAtMTMwMTE2NDU2NTIJR1JBUEhJQ1NfVkVSU0lPTigyMDA0KQ0K
PiAtCQlHUkFQSElDU19WRVJTSU9OX1JBTkdFKDMwMDAsIDMwMDEpDQo+IC0JCUdSQVBISUNTX1ZF
UlNJT04oMzAwMykNCj4gLQkJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgzMDA0LCAzMDA1KQ0KPiAt
MTQwMjIyOTM3NDgJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAyMDAyKQ0KPiAtCQlHUkFQ
SElDU19WRVJTSU9OKDIwMDQpDQo+IC0JCUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMzAwMCwgMzAw
NSkNCj4gLTIyMDE5Nzk0NDA2CUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMjAwMikNCj4g
LQkJR1JBUEhJQ1NfVkVSU0lPTigyMDA0KQ0KPiAtCQlHUkFQSElDU19WRVJTSU9OX1JBTkdFKDMw
MDAsIDMwMDEpDQo+IC0JCUdSQVBISUNTX1ZFUlNJT04oMzAwMykNCj4gLQkJR1JBUEhJQ1NfVkVS
U0lPTl9SQU5HRSgzMDA0LCAzMDA1KQ0KPiArMTMwMTE2NDU2NTIJR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgyMDA0LCAzMDA1KQ0KPiArMTQwMjIyOTM3NDgJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgy
MDAxLCAzMDA1KQ0KPiArMjIwMTk3OTQ0MDYJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAz
MDA1KQ0KPiAgMjIwMTkzMzg0ODcJTUVESUFfVkVSU0lPTigyMDAwKQ0KPiAgCQlHUkFQSElDU19W
RVJTSU9OKDIwMDEpLA0KPiBGVU5DKHhlX3J0cF9tYXRjaF9ub3Rfc3Jpb3ZfdmYpDQo+ICAJCU1F
RElBX1ZFUlNJT04oMzAwMCksIE1FRElBX1NURVAoQTAsIEIwKSwNCj4gRlVOQyh4ZV9ydHBfbWF0
Y2hfbm90X3NyaW92X3ZmKSBAQCAtNTIsMTggKzQzLDEyIEBADQo+ICAxODAxMzE3OTk4OAlHUkFQ
SElDU19WRVJTSU9OKDEyNTUpDQo+ICAJCUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTI3MCwgMTI3
NCkNCj4gIDE1MDg3NjE3NTUJR1JBUEhJQ1NfVkVSU0lPTigxMjU1KQ0KPiAtMTYwMjMxMDUyMzIJ
R1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAzMDAxKQ0KPiAtCQlNRURJQV9WRVJTSU9OX1JB
TkdFKDEzMDEsIDMwMDApDQo+IC0JCU1FRElBX1ZFUlNJT04oMzAwMikNCj4gLQkJR1JBUEhJQ1Nf
VkVSU0lPTl9SQU5HRSgzMDAzLCAzMDA1KQ0KPiAtMTYwMjY1MDg3MDgJR1JBUEhJQ1NfVkVSU0lP
Tl9SQU5HRSgxMjAwLCAzMDAxKQ0KPiAtCQlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDAsIDMwMDAp
DQo+IC0JCU1FRElBX1ZFUlNJT04oMzAwMikNCj4gLQkJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgz
MDAzLCAzMDA1KQ0KPiArMTYwMjMxMDUyMzIJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAz
MDA1KQ0KPiArCQlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDMwMDIpDQo+ICsxNjAyNjUwODcw
OAlHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIDMwMDUpDQo+ICsJCU1FRElBX1ZFUlNJT05f
UkFOR0UoMTMwMCwgMzAwMikNCj4gIDE0MDIwMDAxMjMxCUdSQVBISUNTX1ZFUlNJT05fUkFOR0Uo
MjAwMSwyMDA0KSwNCj4gRlVOQyh4ZV9ydHBfbWF0Y2hfcHNtaV9lbmFibGVkKQ0KPiAtCQlNRURJ
QV9WRVJTSU9OKDIwMDApLCBGVU5DKHhlX3J0cF9tYXRjaF9wc21pX2VuYWJsZWQpDQo+IC0JCU1F
RElBX1ZFUlNJT04oMzAwMCksIEZVTkMoeGVfcnRwX21hdGNoX3BzbWlfZW5hYmxlZCkNCj4gLQkJ
TUVESUFfVkVSU0lPTigzMDAyKSwgRlVOQyh4ZV9ydHBfbWF0Y2hfcHNtaV9lbmFibGVkKQ0KPiAr
CQlNRURJQV9WRVJTSU9OX1JBTkdFKDIwMDAsIDMwMDIpLA0KPiBGVU5DKHhlX3J0cF9tYXRjaF9w
c21pX2VuYWJsZWQpDQo+ICAxNjAyMzY4MzUwOQlNRURJQV9WRVJTSU9OKDIwMDApLCBGVU5DKHhl
X3J0cF9tYXRjaF9wc21pX2VuYWJsZWQpDQo+ICAJCU1FRElBX1ZFUlNJT04oMzAwMCksIE1FRElB
X1NURVAoQTAsIEIwKSwNCj4gRlVOQyh4ZV9ydHBfbWF0Y2hfcHNtaV9lbmFibGVkKQ0KPiANCj4g
DQo+IC0tDQo+IDIuNTMuMA0KDQo=
