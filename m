Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A160E8782D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 13:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0800410E662;
	Tue,  3 Feb 2026 13:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBd3iv5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725E10E65E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770126529; x=1801662529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R3qSfZglG6wk2HPqHyhUsImpHkkZz30HIQL7d2+khjo=;
 b=eBd3iv5kB5iNxqfRQQ+6jg6t5i4FnTYH9C+kDZ6vHfRUfRncuvTqE9xY
 pmea7/8gPTmjl9Op8ZjRDu+eW0p37DT+nBC9yxG1ECmHws2gcKopkK92z
 zoTOFfcXRNcpYLKd60ZznN2dvzh5R7WmNgCrgwEZA3lH+jQbwmBI4PoJ+
 cmb7Jt5uRs1h8oAeFyRLin2t5ElY/dz6JM4jVt8WumvsB80l+W2quMwrA
 c48e/EODVCg9pKlJh3kSZbYy6l6E1poWA29jzL4oAYwv9i7m71TfWWcu2
 G8LTlmwCvBygJUSvMHGI5/139cEvH3WPWLWnyfPV9bgnSBjcVCOQMaGHz Q==;
X-CSE-ConnectionGUID: APDZxQcMRquoRQw+PaaPPw==
X-CSE-MsgGUID: 8xwZHIiSSB+pmB0i16S33Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82722095"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82722095"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:48:48 -0800
X-CSE-ConnectionGUID: wuSbsFxOQC2xKOm5mysqmQ==
X-CSE-MsgGUID: mXn0nsx6T6W2k7QHW7SLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209965692"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:48:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 05:48:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 05:48:47 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 05:48:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p22JA7cIZw1Wk0AdslmdufJUh8VUCHdrFs9o5as1Udmg4NXjiCp2GABveTMHggHvnLvLvQLIqpy/lh7nkUqkzjfp2uUDQiSIJ7yXUsj0hQSM+72vBe/tg/Siu9NJT5vL62nkD0LSs01BZt3x/HgcRcM0vj+KEHXYQtu2QPLuM8qpBxdiRufSy1ztkGJxPbtvHU8zi4tLHR+vJWmFkt56L2UzbXO/SgsoQ0Tb3Dypoe6fUHHfECvu0eeuxZz+2hYFLL9WycaOR0nCU0vjQPRcyYtgD5XRrDHBNmQy9TC7XASIHJZq070jx2XhqDK9pDtc4yvozbD5ZwZKjN6zSwu63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BNu0I3DNP4oP4/lxwpdm/jPIAdh1UFm3VG+J6M86+4=;
 b=sQKZE468kW0DNbRFCJehv+SBI4TDNqkNH0rvsl3vvKZXbKeejBmVihZAB0ykkYkkTiIk/LRh2mI6t3i7SuURuUD1FaigcSnQC1e8oWeZoDaS74dZBULUJ5OCCNsMeVFfcj1Xv5xRE+UqYQCoHpEWgKTQiv1pRL87j1zzE924ayrmxwPbl8/q24SVqvcTK4u6C/ci7NxxIfsZiWfAZSGe1tb6ycnswKfQqtDQQhmf/CNb7qAjgkaACHbvz9ca/xnTBTrPK5pY9yKhrhy2t/IoI3l3rxkmXIj1JjcJa7YMMqJqiyx9X67JzvGR2Xs98Wi7Z0F31XJOWExpODfkeaQ0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 13:48:40 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 13:48:39 +0000
Date: Tue, 3 Feb 2026 19:18:30 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: Re: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Message-ID: <aYH8rv2k6rdVfoRO@bvivekan-mob1>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
 <DM4PR11MB54562AD6BF2CFA749F9341DAEA9AA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54562AD6BF2CFA749F9341DAEA9AA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: c544917d-a1b6-46fc-4168-08de632aef1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUxGQjIrcmdPekRqV2x5ZEk5UlpkWXpXRk5OVWowaWZvUFdSSk5GdFhmd2to?=
 =?utf-8?B?Z0JURk5jMDNqQ0dJSmVSbUpHL0VpS1YxU3NVMzBaZUlOTEQ4dXZzVWFZUmN3?=
 =?utf-8?B?ZHRJVityQ0NPa2ErSThSeitaRU1XN0pxcEVLdkJuVmQyZmlOWFl6M0hkR2s3?=
 =?utf-8?B?MWVoUm9KZjlVZTI3T1ZWMmhVUVhjRC92TjVjbkFOV283MHVXLzlmb2N3aWNO?=
 =?utf-8?B?TnBwZFFYdzU3alBYbmtSWEgxWkVjTXJvRXkzd0FkS0lBTFRFSWl1alZyclNR?=
 =?utf-8?B?cEkrRFRXRWdvZTZVNE90M09FdDV6N3NrdHdoUHFYcWJSNjIvODJubXNFUVRv?=
 =?utf-8?B?TzJ2RGYzZkRQRTlDN2x5OGhOdkhvYTJnZGpnTEcwaU96Sk1vSUtmVmtiNkUr?=
 =?utf-8?B?Nm9YS051OGNXcEZPN0RtYVIrNm0zWWZYd3luZlpNMjBId3hVSEgyVUdva1Nx?=
 =?utf-8?B?N2R0dDZFelllZmt0MXY5cmZDOFUwQ25MdGV1aDNlWGFWdEpoMjF6bEhCYlBU?=
 =?utf-8?B?TFFtaEp3NzRRenJMRTRkbWZOeTlpenE3YjZsR3NhRnBaSjVrR3BjRVRhOC9Q?=
 =?utf-8?B?cFM2UU16dmFTR0M1cDFaSDBFcTNrYXgzdm9uWDg4YkVlcS9xV09sYWpSRjFv?=
 =?utf-8?B?bnF3bURMTkVKNHN1aE4vZXdtTUUwM0xYcDF4WkxLNkRvbXNGVWRkR2RFZHA2?=
 =?utf-8?B?Ri9WWXZ2U2ttNnV5UW5FRDFSZEZab2dNaE5sREdyZW5wNjh3bDk2S2RqZzB3?=
 =?utf-8?B?SW1ncFNodFd3eWs3WlB0ZGJvM2t3ODFIVnh1UVRZU3QzVmJ2RUtkQ1o4WnZo?=
 =?utf-8?B?S2VLRVJ0K3J1dkhidXI3ZnBKRW4xVGRGUkhsdHd4WUtMYzJPWWxLMTZXaUho?=
 =?utf-8?B?TFJUY3Z6eDRLQ3k3YThTb2xIMVNhNDZBVFEwVlJSOVMrSHc3S1ExMEhjZ0VQ?=
 =?utf-8?B?dzA3MU1YRFpFUlVJdFVTb2NsZkdIanFDdHdwNGVGZTZNbnNqUnUxVndxVVlR?=
 =?utf-8?B?cDd0RlN2TWV2MGx0ODVDbitOaFZ3b3dkd1pyelpiL1VkK2kzRjdXa0EyejRG?=
 =?utf-8?B?aXRHS2ZobTBiZmJOWDB6L0JVMUNuQ0FmT1dwemhaTkN6bnBwclQ2NFVnZXhC?=
 =?utf-8?B?RmtSTSt1ZEltTEx0WlBNc1AwTmllcGxjejN4cUxYUHZTYkl0NGpETEcxOGJW?=
 =?utf-8?B?dGdNK3JJZHVHTkJEdVpGc3dqZzNFSWQvZnlpVDg5QVc3Z0lVUlVlc0U3Ui9Z?=
 =?utf-8?B?eXFKQ3JuMjBSZnFhNDlXOXo0d2RSYk5yWXlISHZSSFFHaGdZSEFSbFljbWJG?=
 =?utf-8?B?czAwNVhDRHNhdXNqRUdKR01PRDhvQzZRWS9ZRzkvdGtVbDRuZHZjRkp5anow?=
 =?utf-8?B?S1pUK2pDWnF6RGVQNnNjNUxPb0RmN0ROZVlYL1dRL1loUm9MSkZzcmNMd0NV?=
 =?utf-8?B?MEhZd3l2VFQwY0dwaU5SZi90UzZsODllTFJNL3pCK2lHS3l3ZVlwL0ViT0hC?=
 =?utf-8?B?Ulg2TTgwSFE2RHlDQkRMU2lMZnNXOUlncGpESlk3cU03amNvVVZUZm1NQVdj?=
 =?utf-8?B?bmlMSzJXeDFQTXpLcU5YcHpOZzdqdXpYOURra0V4Q2lvN2k1UFh4ZkgzM3N6?=
 =?utf-8?B?eXhCSGQ4ZjVVN1pTU0NQSG5BUGtSeW5HTjVLaDZ6UVhCem93ZGx4bG5SZ2VQ?=
 =?utf-8?B?SlFBU2VhL1ZyWXk3STdTRkk5dlJ1MnAyYkgyVy84NXNTN05NblpoNWhwcDlF?=
 =?utf-8?B?TEM5YTdJMHdudVR3a0crM2xrZTVNYm9ZejY1Y2prc052R0hncWJvU2RGRkI4?=
 =?utf-8?B?bEdlbFhMTGs4QkRVK2JQMDByT0lhOGNaK2M1WmlSSzhiWXhIbXhoQkFyeE5n?=
 =?utf-8?B?U3ZWK3dYcW9rUHBuQUV2VGdXTGNRNzQzT3pJZ0FOY2E2VVU1SUxVaFFPVlRG?=
 =?utf-8?B?WlhUdEhsMzNra2ZVVWhSem5paDFSSktYUWMySndoUlYvT2V2OUlheWRZUFV1?=
 =?utf-8?B?TTRQQ2ZHd1AzUGZCd0ZwVHNlNmNha1MxazI5RGxwK1ByMWtzdjU5SC9qdG8x?=
 =?utf-8?B?K2lBMTBxNWFQeVJ3Rm5WVXFXKzg1T2U3RjhWTWJhckdYQmlnNTRJSkcxdlhq?=
 =?utf-8?Q?WuQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRHcXh3d25mVzhHVTFvdCtXSTNzMVpMRXR0Ti9pcy9EWktIb0lIcVBHNFc3?=
 =?utf-8?B?OTlrOEI5QUhZZ1hQZm5KaHhPOUw2dDVOeWlsTHQzWWxzYXRsM3docUdrZk9I?=
 =?utf-8?B?cE9BWUFIdXJYM0QrOEdrci84L1pKRzVoakRaZEYxVTd1dmltU1VHZDdoZSt1?=
 =?utf-8?B?dEd5UGUrMWJ2TTYyZ3RsaWFveGVRdGFxejN2TlJKLzg5SStOZ1BWRnZlaFIv?=
 =?utf-8?B?REh1QktHaHlyazUxUmp1OStxRFZiYWkyOG5ta0RHa1hGTVVKMm5RbWEwbG1B?=
 =?utf-8?B?bUNDcHZ4SVZpOCs5blVVM0wwZ1JsK2M0U1JWU3p3MWxzeFlOV3U2TnhvOTRi?=
 =?utf-8?B?ajdzbE9UbFJwTmYxSGFaRTNPbEsrVldKNDBtbGhlNllhcW9iQVBOSmhXZGdo?=
 =?utf-8?B?WkpveHkwL1VkV1FvTkFSRVpiUUNVZ3Q4QkcyM1Z2NmlZQXlZRWZJdTIyVEwv?=
 =?utf-8?B?ZHF2bzgxQ280UElQTHhYak5UZkl0MzM0dmxvalNzRUVQLy8zU253N0ZoeTRy?=
 =?utf-8?B?NjJxcisxN2VVL2s1ZzNlT05wekhFSTc0Zm0wUEw4Y1JIMk5Tbmd1aWViaUV2?=
 =?utf-8?B?VTN0NWFLclBwSW0zVG1RU1pEL2tMei9ZUFlwWlkvNFNncE52VEdiL3QxN01z?=
 =?utf-8?B?Y0loREthei9rNFliSTlrNmNySW9YVEJzTGVyU0ZaaGlVNURob3daTmlIeDVh?=
 =?utf-8?B?MzUxc2dCQm5NNnU4VGx5dkxpWEV1YTN3S2J6RnJWd3A5L0FDTGlnT0dLUVFX?=
 =?utf-8?B?SWRYYnVPeEg4U3Y2ODJMaVBBTVl1d2pENzFtWGltVHZ5RkJ3N0hJQXRxbjVO?=
 =?utf-8?B?Ymx0dSt4emlzVEtnUUZELzNlM1NUNlNIKysyK25qUld4dHRJeWxQOW9xRk93?=
 =?utf-8?B?NGxaem4rcTBwN211OTliemFjems5RStRQkdCeE90ZHJSaUQ0ZmtEakpabEo1?=
 =?utf-8?B?MzlaVWtXdGxER0NqaU5kK0luRE4rdWFoR2VZMmVuM2c4RUZZUWgxSXRBVkZX?=
 =?utf-8?B?S1NlRVNHVW5EbEJrZjVLVkxsWW1mbTJSdnlKUlo2S0NnY01Xb2VEY3prdmFN?=
 =?utf-8?B?R29iOWYwd3RNeE1lZk43S2xEYWdEWVBERTFkWU82R1krVXBEMnFJT2FDdlNj?=
 =?utf-8?B?N3FNTVlOY01zM0JQL2lvS1kyK1R2UytkUkQwUk5RNHd6L3RDd1pYZGNRb2Yy?=
 =?utf-8?B?dFVJVFYralV0YVJaVXU1dDBUYXZycHI1TGdVdTFuUUs3ck9Ec0UwcEI2ZWc1?=
 =?utf-8?B?dU9mQ1ZDd2lMRFZCK08vamx0dXJnbW1EaysvNkpWUTZjY1oxWHp2RThsV3hM?=
 =?utf-8?B?QzdVc2d4QVBua2FEM0o2NDdQaGFNQjV1dVhONVVRY3ViY01WdE9yYjYzOTE3?=
 =?utf-8?B?SmJmRHdDQVgrcjZwWi85dTU2SjNERHBGVHFyQ3hveHdMWkxYNWlzN3pSMnJY?=
 =?utf-8?B?Rkd0azJxaWFTNWdQL2F1Mkx0WUptN2ZIeWNxcmxkcVNrSEEwamNqYjAzbnM3?=
 =?utf-8?B?aHE4WXVYaHFIZ1VtK3cvUmt6TzgvM2xHNm1QMnlybGxGV2dJcDFCalFwS01P?=
 =?utf-8?B?dnFtU3Z0aDYvbDVXcmJ2TVhkOHFpTmxlZTBPTjBOWnlRN0t3blRWQmUzVVNN?=
 =?utf-8?B?Vi9KVEsxU1duOHJkMWFvbk1TQ3RZZlUrY2ZFUStmVDg3dVBka2hHNFZ2bFY0?=
 =?utf-8?B?UnFPYmR3aEFON3cvb2pnUm0vVGJTaHUxMlN2M1NTSThTUVl0T3pqYTV2QnBK?=
 =?utf-8?B?T1pPbmVPcEc3dEE4ZFVNRDh2dVhQZi8xVndIaFIwRzgvOGIzaUllVzZocC9k?=
 =?utf-8?B?OGQwZUgyc2pGSXJRYm5RYWRrRmxkbHhoN09WK2l3THZFd0pqWUpXYjNWK29r?=
 =?utf-8?B?L3h5MmcrcDVkdGxWWWJ2R3BEcVo4a2dxNWc1UDZuR1MraGc0cWNtMFhPbUdu?=
 =?utf-8?B?aWZ3eDBJL1FWb3dlY2cxTmxENng1Z0lwNXl3RTg5YnE1ditYcUlBcDE0YmYv?=
 =?utf-8?B?NDZ2ZU9DQzZBYUVzWUhIVFZrVWdwU1k5bS83c3BtZWN3Znh5TlM0SjR5UUJE?=
 =?utf-8?B?Q2lnZ25VYXQ1bUE3NGZpSnQwNmF6bVRLbEFDNUVrUHB5NVB4U25tOG1Bb3Ix?=
 =?utf-8?B?Uzl0MkFiVjRCaG43ekovdEF0VFdYenhOcDZudlFxbEt3aVZNYVRUeUxMdnJz?=
 =?utf-8?B?MXN4RkQ0bkpkK0FDVHA4ZWo1N1hIMmVDemhMYVZqMUJFR1dUbE5oTHM5OE1W?=
 =?utf-8?B?aUQyeXJ0dmtmNjFtWXZaRkRreW8xNGtYdENuVzBNZW1nMzZjckt3Nnp2Vy9m?=
 =?utf-8?B?ZUozRlc1UWo5U1Z6QTBjTE5DK1NFRjUvRXNHSjd1SkFVMEc0Wkh6ME9YUit2?=
 =?utf-8?Q?UyWbVqOHrQ5WMVuL1W/B8oB7Us1+Sj2mFiBsI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c544917d-a1b6-46fc-4168-08de632aef1e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 13:48:39.8789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KAC//Hv6vzwSsNpFZJEatXcTCTZ2NXvMOMqQN5BiwP3IQ19L5ae2RCo+eCyoOjD4RYBLksavKrv3bJ9AAz07mqRSUWoomtOJ/sP8PMBBlKldn5BE/dn3En9L6YzaOn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
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

On 03.02.2026 03:31, Lin, Shuicheng wrote:
> On Mon, Feb 2, 2026 8:54 AM Balasubramani Vivekanandan wrote:
> > From: Soham Purkait <soham.purkait@intel.com>
> > 
> > Add check to verify if CSC is a PCIe endpoint via pcode mailbox during xe
> > modprobe. If this mode is not supported, an auxiliary child device for the MEI
> > driver is created as a fallback flow.
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> > 
> > v2:
> >   - Use scoped based resource management for runtime pm (Shuicheng)
> >   - Initiliaze return value of xe_pcode_read (Shuicheng)
> >   - Assert when CSC is not supported as a PCIe endpoint
> > 
> > ---
> >  drivers/gpu/drm/xe/xe_heci_gsc.c  | 35
> > ++++++++++++++++++++++++++++++-  drivers/gpu/drm/xe/xe_pcode_api.h
> > |  1 +
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c
> > b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > index c1f15313f92e..48b830c99997 100644
> > --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > @@ -10,10 +10,14 @@
> > 
> >  #include <drm/drm_print.h>
> > 
> > +#include "xe_device.h"
> >  #include "xe_device_types.h"
> >  #include "xe_heci_gsc.h"
> >  #include "regs/xe_gsc_regs.h"
> > +#include "xe_pcode.h"
> > +#include "xe_pcode_api.h"
> >  #include "xe_platform_types.h"
> > +#include "xe_pm.h"
> >  #include "xe_survivability_mode.h"
> > 
> >  #define GSC_BAR_LENGTH  0x00000FFC
> > @@ -42,6 +46,29 @@ static int heci_gsc_irq_init(int irq)
> >  	return irq_set_chip_data(irq, NULL);
> >  }
> > 
> > +/**
> > + * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint
> 
> Nit: funcname() is preferred. Add () following the func name.

I will be changing this from a kernel-doc style comment to a simple
comment.

> 
> > + * @xe:  xe device
> > + *
> > + * This function queries whether CSC is exposed as a PCIe endpoint,
> > + * through pcode mailbox sub-command
> > PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
> > + *
> > + * returns true upon CSC as pci endpoint, false otherwise  */ static
> > +bool is_csc_pci_ep(struct xe_device *xe) {
> > +	int ret = 0;
> > +	u32 val = 0;
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	ret = xe_pcode_read(xe_device_get_root_tile(xe),
> > +			    PCODE_MBOX(DGFX_PCODE_STATUS,
> > +				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
> > +				       &val, NULL);
> > +
> > +	return (!ret && (val & 0x1U));
> 
> Nit: how about adding the definition of the 0x1U? It will help understand the code.
> 
> > +}
> > +
> >  /**
> >   * struct heci_gsc_def - graphics security controller heci interface definitions
> >   *
> > @@ -179,7 +206,13 @@ int xe_heci_gsc_init(struct xe_device *xe)
> > 
> >  	heci_gsc->irq = -1;
> > 
> > -	if (xe->info.platform == XE_BATTLEMAGE) {
> > +	if (xe->info.platform == XE_CRESCENTISLAND) {
> > +		if (is_csc_pci_ep(xe))
> > +			return 0;
> 
> One more question here, at the beginning of xe_heci_gsc_init(), there is: 
> 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi) 
> 		return 0; 
> And for CRI, both has_heci_gscfi and has_heci_cscfi are 0. So it seems the 
> function will return 0 already, and this code will not be executed. 
> Is there anything I missed? 
> Thanks
> 
> Shuicheng

New patch will be added to the series to enable the has_heci_cscfi flag.

Regards,
Bala

> 
> > +
> > +		xe_assert_msg(xe, false, "CSC not supported as a PCIe
> > endpoint\n");
> > +		def = &heci_gsc_def_dg2;
> > +	} else if (xe->info.platform == XE_BATTLEMAGE) {
> >  		def = &heci_gsc_def_dg2;
> >  	} else if (xe->info.platform == XE_PVC) {
> >  		def = &heci_gsc_def_pvc;
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> > b/drivers/gpu/drm/xe/xe_pcode_api.h
> > index 85cc7478b787..391a98c8b5fb 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > @@ -35,6 +35,7 @@
> >  #define     DGFX_GET_INIT_STATUS	0x0
> >  #define     DGFX_INIT_STATUS_COMPLETE	0x1
> >  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> > +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
> > 
> >  #define   PCODE_POWER_SETUP			0x7C
> >  #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> > --
> > 2.43.0
> 
