Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F339CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 09:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757188C11;
	Mon, 13 Oct 2025 09:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Im9JglK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752610E419
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760349067; x=1791885067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QzSQu3gauheIUNIGy/WacQ5U1ivVU+AsVkxqhdrGqC4=;
 b=Im9JglK0aHD0oqaZbHFnHk2ELVfGVKX8QmpZIzw1rzu327yiCKNkcXjO
 kYhM8rB9tIULU0s2I9p3kyIzsWQK6oMGg5+upo3yWD2MsCmexJ39STXiL
 XUh6baRJsrtuspvbafld3TbEXBEH6akny+l4pyXLXm5uG6iAnah4EtFeK
 JDRMv272ZBbFDqiYX6tyg4xTcJPfw+yMCDiZAv+DaT3rbc3MT/OAqcLmk
 O5ntxzNht71pyPMNC7Ww0d5n/iAKCbKev2n2+NHdK62mPb5JryhRQu+l5
 Uer8Jx3euYJZ6wpzRW1dS/HSFx/kDMEKBKb6jC5Wr25SbsS1560UWzpn0 Q==;
X-CSE-ConnectionGUID: wWO2vIejQU+POSRNZNnKjg==
X-CSE-MsgGUID: ioLdObSwSvOx1/J7SlTR1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62420940"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62420940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 02:51:05 -0700
X-CSE-ConnectionGUID: AWkKFpeRQMKx5j6bcV4Qsg==
X-CSE-MsgGUID: YuAsjGfUSp2nDl4HZcDPRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181568578"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 02:51:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 02:51:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 02:51:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 02:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaRPlhN50i5T/IKpEFw60J6wbDqY/y7KWLzeDFYmdD+iac0+mhR/s/xoDAjPU8oeEeDr4OYzvrQhS3i30+F1Vr+rMOQ+29yttMx1ITL1j8EOwRQvcCQPZsVzqZz/Sh3aodo9STI+kkG5g7QibN8gtAs9mau1xvqD2Id/DkcHFcsaokIP1f8HFjYmyjC40zsHLzvNIfaQIM3PGIsRPIInXQ8dbPVvdSszTeBTeB2dTHLpOa9O82xs8ExD2dYMa1Y0UDf0DSfLrA4+Emo5p77TJ/rEkk8JBpwq2LRhXQJWIfoKRMSU2PcXaASdWLFxvtNRKB5aTtHeb5v/0OMiYP3lOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Yi2xPUAkYZrSV+5XRpHoXqwWz2eHULVgS4sxQSLYs=;
 b=rJ2J8vBpAksJiG+0WYEkZU8DpfmMwhr7vGdbnCzL5TEujzI/CSk1FVQA8JwawHyTu9kHx0J2l2g3dSsxSXKrwk0FqZyzJFtyoVVahrZwlE9Nigjpm3mggW4/z/AUn3mVijVb289FMcBna4r70B1PG8bKevhExBzthPaurjHZtBFAWa8cL5uTcXhOWbyKYgADZZxQwGrByNegLljc2MKs9Fo0aFnHc+/5+PRYpp4hLR19GcNFlVXlPLDOs0RuWn8/AQjz+cevheT5NBBsiBwdzVTgOMVPiy6MN9shdkPXse4Ls2RDc/QDc3mhtH1sY2VCJ+aLTifO7Zw16c8LZwtOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:51:01 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:51:01 +0000
Date: Mon, 13 Oct 2025 15:20:55 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Message-ID: <aOzLf2YRbBc6Qj-8@bvivekan-mobl1>
References: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
 <20251013080900.1507609-6-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251013080900.1507609-6-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: c6bbb31f-879e-4703-15a0-08de0a3e04a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmxlUUhJTUxYeXFVZzk4YTdjNklWa0x3QWV1V0ZaYmYwZUxaU3pPUk9sYytI?=
 =?utf-8?B?MXArc0pJbWxZK2xybDNoL3oySXg1aTBFaUh0VXZTWmVMNXpCMDhBblo0TFFS?=
 =?utf-8?B?M1NNVnhRZk0rcmtsSmZRdTVaVkxBNUtrSnpkMStkbFVQSHpWenlubnpZV0hZ?=
 =?utf-8?B?THJDRUdhQlVWRlNhYkI4Y3VkMWI4Um96SFdtVnp5RDF6MWt6SE1QK2p3R0ZO?=
 =?utf-8?B?Ujc5TEdpaHV2SzM1T20vVUs0VG9IZGhPRHIxczVQYzRsNlhSYkRDdXQzUFRp?=
 =?utf-8?B?TFA2ejRrVXFQbk00ZWM3a1ZBam1WckdNeWlXOGc4UnVXRVJkM2tUbWJvR3pZ?=
 =?utf-8?B?VU5GR3ZIdTZ2VC9MRElWcVNHbkZodGtNMmhkd3dvRUZ3RXBoRnI4S1dqclFn?=
 =?utf-8?B?dUhQNGhxM2x6RUdSbmc5T2tmRW5wRFVVUGp3d0dRL0E4TlU3emI4UVhMUFVL?=
 =?utf-8?B?TzF1bnZ4RzExK3RnNW9IZXJKVGJTcGk3ajlyT1V1dUlsMi9GM3hJM3UxdXJT?=
 =?utf-8?B?NStWbFNKT2lsa3kvdUFNWW8xTFVBVktYcXZIYUY0UzZXVG9DNHhRUVJRbzdx?=
 =?utf-8?B?b0hwMEhyWHdZa3RRNHlMaldYWlJURnpGR0VEMklQMkFtODJKSkdKUjVLcTFu?=
 =?utf-8?B?QUZCOHRQN0pYaWtPbWJ4bmlRc1ptNTVHSFZoV29BTW9LTlBKemNmUkExT1ov?=
 =?utf-8?B?a0RtYzZpeXF4bjkySjc3bU1GVnBhWDduUEVFZlZ0UWdFSDhVY0VYT0VZSnQz?=
 =?utf-8?B?VEFPS3NBcFppNzNsNXNuQkdPdm1DVGFLSGpUakVlRjBZV0FTNmtoWG5xekpD?=
 =?utf-8?B?eVZZMzY3c0w5OFVNY3RNWXY5S3hJZTBlT2F1dk44TmgyMHNOelR1VWFWeSt5?=
 =?utf-8?B?VUZsalROUjFLQnh0ck1TTGs2MysrRDREbXpsa0JSZ1ZNWjBxQjNMWVpvVUlX?=
 =?utf-8?B?eFRzSVpOZGJvaFRlWWdhK3d4RDRla2tCRXd0ajQ4Q3hqNk96b3lhMjNONksx?=
 =?utf-8?B?Z0NvVmk3YWdOMndrVXBobnV2dHkyV0x6VzVxV0M1VmUvMGNFOVJxeHNhaWMx?=
 =?utf-8?B?VzFOK2ttdmhEN2Njc2ZPZUZhTHNXZ3NRTnhXc3IycHpFQ1pqM004REpDd25L?=
 =?utf-8?B?eHhzcjBYd3JOMnJGWXhRcUt5RTNiWHNBL3k4NWJqN09ZbHFTMlVHak9jNkp4?=
 =?utf-8?B?TUpFak16VDRwVkZhZWNnMHFiZ0oxMjJTL3R6Y3NVaS9NZ0puWmlIekUxeHFt?=
 =?utf-8?B?T0RsSmZFNEVkK3Bva1puS1JROGVVNDJxb1hJbnZCWWllcFViNE1aQTNVQ0dQ?=
 =?utf-8?B?SWd6UGY4NWZFeUZEQWVRcGxJVFIvWnM2Yk5BUkJhQW9sVVRUeE83VHhsMVdq?=
 =?utf-8?B?dFVoc2Y0NTNQM2dsQ3NzMXdiQ1ZjK091amxOZEo3ZWVFdkxBZ3hYRDFIenZr?=
 =?utf-8?B?WCtrMGV6NE1hM29qS1NjZ0QvZVg2UWlXa3NLRlhJSDJTZzVqbDVMUmNWalNT?=
 =?utf-8?B?VVViNmc4S1ZHZUU0TVRVdENZYWx0VTVXVndZTzdsejg1cWZVbVYzdFQyaTUx?=
 =?utf-8?B?MjIrdkNrMFhsdXhHMXVQME0rV3lZQk1OaTJoTjB4MktWcjBRd1VsVU8zd1I1?=
 =?utf-8?B?cTVQLzk5S3QxMU1DUHBXbUZTcU8zWGpVUmVhbjhtUTlJRWtVZWxZTHpoUFhM?=
 =?utf-8?B?SWc1YXg4RVNVaFNZVk9FcDY4NURwcUs3QkU1YXZYQ2VJMlBBSThzZG1QK2ZN?=
 =?utf-8?B?UE5EZUJYUHlaWmZUY1IvRkpVTmcyeXhPRzVFMmh6eTBYVDFORzNPVXY2dHho?=
 =?utf-8?B?azZUSytTcCtsRklIZFhXUDdLbGdZUTRuNzRxUXBMcnhBYVJXSzVRaXVtZzEy?=
 =?utf-8?B?ZmFZTVFoNE9kTnBTUWhDblVYaG1pc3FBa0JydGdnRkdvaS9aNDdmQUVjKzF5?=
 =?utf-8?Q?IkED2zad4VcjxSkCZWRDb9CebENtkpEw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZzWlZVRWQ5Qll2VDNaWmhTSTZTOE9UNUJrWkhQVHg4RzBnd013SWRMZlpa?=
 =?utf-8?B?aG80NFdDTVN5YjJ2VWNDQ1pzQ1BDSjI5cUNIUlJBdDFpWkNhUXBmdkF2ekpx?=
 =?utf-8?B?M3JvTXJGY2NiU1puZ05QZUsvYkpJbUZZNWlreVh0WTZRdU95UUFzUUFEblBm?=
 =?utf-8?B?dEIzWmM2VUNnbldwcGo1NFZsb2dQWDRaRGp0ek83anZWbzBrQjlqV2lnNk9S?=
 =?utf-8?B?MTNqbVlZdTFVa0k1RUMvOHZXQ0NkcGF2M3p0aTU0WHkvdVVEbXYvaS83bUJk?=
 =?utf-8?B?UWRkU2VyU3orV1hUVUdueU0wNU04ZExrZkE0UHVkTElqRjRSZ3BNY0llRWht?=
 =?utf-8?B?WFFOejZMbHQwZCtKUzE2dmZ2dzFhWnRNaFBYT2drRU80cVErcjUrVUdtZlBO?=
 =?utf-8?B?T3NZWDVDbmRUVnZ5eitRc2dLK2ZMKzVWNGQrM2tVZ05GNDllZE5raDVJdWE1?=
 =?utf-8?B?T0ZVRkFTN0M2UFdGSER3b2F3Mm01Mm5QcFJ1MnE4Ni9tbDU3N2pOQXc5Ykhw?=
 =?utf-8?B?TE56SDlEamxNQzkzVEFTLzgvQmQweXE5Rk15TWkxTlgxYjBwb2h2a0RHMFhN?=
 =?utf-8?B?UkxHNzhRalIzcGN3U2pJdnU2V3RHVnhtVlNMclNoOTdSK3IwQ1JmZmpvWktm?=
 =?utf-8?B?Nml2b2UraUkweHh1UEMyYnZ0WkJVNU9DUWdxTHdLTHI4QnBFTkJiOFV5Qmth?=
 =?utf-8?B?aDZkRUdCbXIwWHJnOGw3UHdWbFlFdmlVS0NkdDA3NEpBZkl3VW03Z3VHV3BF?=
 =?utf-8?B?RnA2YXpaWmR4eVpjeTUycFVtajdtYnVaL3R3NWV5NGFScHNUZFBnY1JBOXFl?=
 =?utf-8?B?aVBoNWlGSjY1UWRwRGV6MGpmTXRzdGRFK25JcXN6eGx3ZktkM0tFUTlvNXVE?=
 =?utf-8?B?UWFXY3N5WG51TmRxc2FqUUJIZXpoZlRuSDNwbU1YN2lpdEtUWXJMMDZzbjdn?=
 =?utf-8?B?VG1YYnkwejdGbE5sdWVqZDBhRndKaFIrbW1YUFk1RUgvVXFocU5QM2p2cC9z?=
 =?utf-8?B?bGgzU1hjUFIyeEhFOHVNNjVIQmxoZVpJVXVTeE5NdWJzWU9KTTVUYk9nYVV4?=
 =?utf-8?B?MWpmUEFZVFRLaFhQNnRIdktSK0YrZmEyZUJJMVpsYzRTNm9BYWlSdnljbXFZ?=
 =?utf-8?B?MnBsWnFOcTMvUnVqSU5jOGhJeWZHd3Y3Wk43ODgyaERSc3pCSTN3WFMrd3Jh?=
 =?utf-8?B?VlFXT1RhS1orYjVqUFFRRjd6K01TekZ6a2wvVTF5RXJlbXlFbzJPUU4rU2Ra?=
 =?utf-8?B?SkF1cGRSTGpKUEEyUXJJaWNYYzR4T2VCRmxibVJlNGRXVG9WNzVCejh0a1Nr?=
 =?utf-8?B?RGxZSllBRzNFaXgzQ0d3cUxIZ2hnU3VyaFkrc2lMWno3eVFPTWl5VW5JZFhE?=
 =?utf-8?B?VTFzZVI1aGRBanRuTis5bVZRWWNlU1l4Y2JGcGRJSjROZndROEhBaDVrWXcw?=
 =?utf-8?B?bEtyTDQyTlZzUldFOVdZZW9jSjZEUGxVcHNieWgzNWRZL1NTTGtPUjNKYkVD?=
 =?utf-8?B?eHlZcHNybDltNGFTSTFIVHVPUEZvMnlncHp5N2VFc0lPMXZlcVo3a0NaZjIw?=
 =?utf-8?B?bTBqeXNPWWh1QmJVQlhsaDJCYWZ6eHBCZ1pqdmhKcnNNQnJzN2xYU2xEQmZE?=
 =?utf-8?B?RWNmekhta0Nzd0lwSTArZjIvbHNsWlZGU1pjWHNRQjQ4OXhCT0p1OW5ISFQr?=
 =?utf-8?B?OStCYW5uUXEvdDFIWXBSNjlZWjk4ZnloUlNXN1czQkdIU3ZZdmRSL3VFai9w?=
 =?utf-8?B?eWJqZXhqc2trTVlNTk55WnIwRWhjUXBxMURwRlQyajAwUXdCQVpPRXRnaW8x?=
 =?utf-8?B?NFhEcGdOU3UzTlVUU3hMVlNHdVgrN0luSGVadkFCUit2VUhOb2dVZ1JVTlFq?=
 =?utf-8?B?VjZqSVNmSkVCc2xWdi9nbzJTZVVVZjZqWWViOVZDWHNSZmJaNlQzMFR2UGFn?=
 =?utf-8?B?TTE4eEZVdzNzTmh3WjlvNGpVZ2MyU3dWNDNmM2x6SDF6cjU5SzFvbXNyNkJF?=
 =?utf-8?B?ZVJIM0g5NTBrZHhCWHJQVGZ4dVd2NXh5WjBabE5iS3hvdzZwUjJoUWovZ1NU?=
 =?utf-8?B?azhrVXRUMmZYcUJxejlMaSs4Q0ZXTmxkaEwzM20zenN2TGN5cll3SVpwSmwz?=
 =?utf-8?B?ZkdMUERQbVJnSU5Balc5Z29scGc2S2VkUE1ka2xaYngzeVpOK2R3b2VuSkJu?=
 =?utf-8?Q?KqedE5rfjZL+9D0aXSlQlqI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bbb31f-879e-4703-15a0-08de0a3e04a7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:51:01.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cgw/KNAx+/l7LrJlb5+cY3nS5Q6fTVj2EdY4jnI/9y8EkYu2SB7WzKPCxfntIVkXp606Uvw+QMeWzgwgU/QN6fTtW5AjAzAOvidTPvhtE0f7VHxocw8bpzHi2NV2Vdrm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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

Corrected email address of John Harrison.

Regards,
Bala

On 13.10.2025 13:39, Balasubramani Vivekanandan wrote:
> Cancel and wait for any Dead CT worker to complete before continuing
> with device unbinding. Else the worker will end up using resources freed
> by the undind operation.
> 
> Fixes: d2c5a5a926f4 ("drm/xe/guc: Dead CT helper")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 47079ab9922c..d1a994c5ad02 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -197,6 +197,9 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_ct *ct = arg;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	cancel_work_sync(&ct->dead.worker);
> +#endif
>  	ct_exit_safe_mode(ct);
>  	destroy_workqueue(ct->g2h_wq);
>  	xa_destroy(&ct->fence_lookup);
> -- 
> 2.43.0
> 
