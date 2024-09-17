Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C11C3ABD4
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 05:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8C10E1E9;
	Tue, 17 Sep 2024 05:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY294qJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2710E1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726550521; x=1758086521;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9JbuRpKrWEu3VRJiX2kqaA/gyF0DqA55juQmCoqPIS4=;
 b=IY294qJtHi9HoraxIvUTGc8RtV1RtQSQiSZ8Tibwc6jcAMiDYcDB+MbL
 IS7x3K2ULeUbHsDeFizrd7cgOB1A+1kcxIV2/P3x6nCmdcEGMzX3f9HdC
 yjqVG7JxCx+vxhl1WoNwMNyZJ/5K+96pY77oyto70Rnl7QUfZyf+8lcDb
 x0GAKC0/VC7Qk+Lam1474Tr6YP4o4yLMZQb3pei/I3gKGbI22zjZ+MpAE
 lRJ6BrJDITQmHo0EwCrZcUncMaVOQoaQEtykZ20tqIiJuKTLTMS0Ou23g
 znUTvcQ1ek4EOcD1TSvOqCL0GYqvu10sf/88G5lVhGxj8ImeIdExfW9tu Q==;
X-CSE-ConnectionGUID: hw9pnUwlSweDl5w8EDdfJg==
X-CSE-MsgGUID: sytkZSoNS/6i59gdnNwX1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42869315"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42869315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:22:01 -0700
X-CSE-ConnectionGUID: JhAWBinlS1OxtOik4Y+QiQ==
X-CSE-MsgGUID: 2J/G8Pt0S4Ca27H+xO04lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69404812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:22:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:21:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:21:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz3iq+hBArBdNpOCHQhLGemKERukaGM7sVaWTeLVBXjf/xSRpNGjEEWgBUxmZgdfH6Irx1SgJDPml1uU58GwRkvlIruoMT1XbhHkjHrnCZ6AJD6lB2G1DiBrFnoIxfoS2B1I6r+iUIDBiiIYpTg3yt3T82yR72pTlELMIZ7wssVD7C/avIcG8eizFzQE8PnzkIdWuqN5UZz3gnmHTcLJdnw5Q4OEMfxW7qJgU8iWWQuYNna6AHbaTvgWRkpvgcQhwni/4cZaigT6f/B84OFQaRUiYBaPWh1aQIXFmkWRKw5Ze7dacxtdgGGDUmlvmtNXiii4hD3wt9HHh1SAg+kjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl8XM4SXU7bOlacwAd6ubzieWGQ+gFYrw7j+PbGLREU=;
 b=pqHQqHYdke9LiyysLSphuBzPpeBz8vsv3P7uOa+w2zRD0gLSh00guNDP7ADluChZPoij5f2bSDoVsBvmCEPR48B5JGqiWV7ffMd6dMbHZeqq4FoUWsg3lDO2taSh2JkiMLz+b0VPkvIz8dWYXIq/MyNkAhjL/JjUgusXOomAHvVqZLuz7LnnzVRpyooq41Xkog2w9AcVSV3++wHzJ7C1TMzuJIAg5Y17GKNl2h0hHPPPmvCJKpG9hFEM/udyc61iw9pJmA7WCgHBaIM8UutVEPCt24MgR+oII6u4byN62dx40JIxdZbSZR0pPZ6xVr8tpFuikCDqgAIXQt/QaE8vuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 05:21:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:21:57 +0000
Message-ID: <c22e92d9-7606-42a3-8442-88dcbbc92a19@intel.com>
Date: Tue, 17 Sep 2024 10:51:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
 <c93e3fcd-6648-4a07-8645-6e10310f0b41@intel.com>
 <326ecbd8-e5cb-40f5-b1d4-987339f49c6e@intel.com>
Content-Language: en-US
In-Reply-To: <326ecbd8-e5cb-40f5-b1d4-987339f49c6e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: be7bcbc1-0c43-40bc-743a-08dcd6d8a63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2RqUWlINjZTNzBOZk9mNjBzZjRvaG94eDUvcURzYW82S1lzVnlSQkV1dFFo?=
 =?utf-8?B?UGJnb3RpMllBYiszL3BLcHVrMGJnUVZSaEdyNGVRYzcxODN3Y1dJUWtlaFpw?=
 =?utf-8?B?bEVlODcvaXVvSk5OOElLTjBBUmNvTUI3aSt0ZCs5V3ozSmpTbmZiNC9kNFVX?=
 =?utf-8?B?M3ZkN1dzRzA5c0ZxK1RpbE1pN0FKdGowSGMwYzlld2l6L2p6alBxdG0zd2p6?=
 =?utf-8?B?c0Z2ZUMzTU9tMWsvbUl4R2FBRkhtNmxNQmhmL2FMMmNPRTNCNE1ZUCtTN3N6?=
 =?utf-8?B?djdQeGFDRndqcGVzUGtHV05rSlozZVdqMlAvclBDbDRxZUJnQ0tzWDQwMFBv?=
 =?utf-8?B?QXdGQ0ltaGdCRXFhQStXay9CRCttdXE5VlBmbWV5NmNuWFBrRU1xTEd5Z0JH?=
 =?utf-8?B?NDhhL3lKdGwvYzVtU2VkcE8rZERDb2NwL3Uxenk1RDRiSkxIYjdFZUw4c2x1?=
 =?utf-8?B?MDdQRWdMMFpKNnRDOUlvTmpmOXducTNtanhldDAvbytvSGN0SytYU3Q1ZEo5?=
 =?utf-8?B?d1FsQzdpd0txRkJoRTdlT1BvS0JLUHRTTjlQZHZGQnFPZXpNbEpjTUVwQXZs?=
 =?utf-8?B?RVBDc1JQenpKZmo3bkY1U1M3WTNXRGlwd1l4eDFGOE9pbHJETzhnaG13eHZF?=
 =?utf-8?B?VDZYaU1ZSStMV0V1eU1IeG1ZcUpNMlZwdzZUbzQ3UWl0a29Xdk4rQmRHcm1K?=
 =?utf-8?B?MkpQMHJYZGt6M0FmNWdWUWlCVDNuK09MM1VDcDJhZlZsby91WGVpNXRadEZh?=
 =?utf-8?B?UE5PTG02cFcvclBRSEszbExvL0ZxUkRHWUxOcUZFaVU3ZlVqejBsTFQ0ZzB6?=
 =?utf-8?B?RFFlTkRDSWVjYmlkWmp6ZXZqRSt1VFZjTTZsdDV1OEtrR1pKY0J1eFlUQU1W?=
 =?utf-8?B?U1B6U3pFVHlFcHhseUFiMnVEM2dPa2w3QzVOWVZhM1ptN1hXbW02OFBrM1F1?=
 =?utf-8?B?UXJMM29KeFRzSnd2NVZXREptZFlwbE1UZkxUdlFmcGR2ZnlJdnorUXRwSG0w?=
 =?utf-8?B?YThmdFNGN2lsaWZ6Y0lxYzVpRHJKdzNLYkVDUnd3dy9lQUlNWnBqZHZlOE9Q?=
 =?utf-8?B?TnYyM1V2ejFxdUV4TWFHWVZaZFF4NmpQVlhNdk05QTEwQVI2TVc3elprRkl2?=
 =?utf-8?B?Z3BiczJtNW1OY29TUituMi9SbnFnam1QOE1Bd2ZDc2h0d2c3RmtOUGdpUG5q?=
 =?utf-8?B?ZXNTbzZMdDB1OU93NGlVREpvdUFwQUdHQ2dZS1QzZnhzam9ab1JnRzZUVk5P?=
 =?utf-8?B?TTNjMUJ3YVpKZEMzSVVHeWcyZ1B6bzdQVFFTY1V3WUVKNEZEUnE5N09uRkZk?=
 =?utf-8?B?VmhaUWFZdmZ6SDhabFRVa0VCOS90UWlqTytPMlRZVkxnVzZwV3pPbzFRcFhV?=
 =?utf-8?B?cXVDOVdudFZQL3NrNXl4TVljd3RwOG4rUlJJVWpXczZsQy8xZUpSQzlYeGF5?=
 =?utf-8?B?OG1EbTBVc0hNSXVvNjhMS0YrbjhmMVRRM3BwOFlsL0t5cE9VRzYyalYvTjlu?=
 =?utf-8?B?SnlnM2wvK3kycUpoNWhqUG80RnpvSFhSQUovODczZWtiMW9QaGtGUEZJMVZo?=
 =?utf-8?B?ZktTNjRyVlVFRzBGZ01uNjVBZjNtcWJjUFdXd0ZmbWVGNHNYVjhMZm1yRW13?=
 =?utf-8?B?N3hsZHh3Rk91S2tJcFFkYmV1dGxWNDc1bWlQME1MNE9XakQ1NXhiVjVicitr?=
 =?utf-8?B?RVU5SXA4ZlNLVmx0VENBZzh0UWoyTzQ2K1FJNkRzS3hIVDB5UkRYcHgrSHVN?=
 =?utf-8?B?V0VpWDlHSWhUZEI5THVBT3hHeGVqUjRpKzFXQk1wTnI0SzZMaHRHS0wxcjlx?=
 =?utf-8?B?b2hyQjdwQ1AwYWQ3a0o0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1JtRFhyWm05Zk10WlVLL2NpUUhoWFRPRjZCWm1BWFc3YjZzNHlYWk92UGYx?=
 =?utf-8?B?a1lVcWNOMkpNVjNnVGJPeGx1d1dYSDg0OFZpaFgzQlFwNDl3dVRnOC9kMTR5?=
 =?utf-8?B?Si9NOGdscGZrZmNqQmtkVTd1Yms4QXdJYk53dDhZRlZhYzgvOUVTenorL2lq?=
 =?utf-8?B?SnZwYVBJNFZRek95ZlZQWFNKelBGbTNPb2JTLzUrMG9uZDhjRU9MekZ0NWZF?=
 =?utf-8?B?dGFPditkM0lkU2VFWTlucHdFeTBFSk0zZE1wRTNxZW9qWXJmbEdQU29hNUc0?=
 =?utf-8?B?dGZGdUNNdE51bDU4VEZRdXZMODMwa0dadjFCWUxkWW9TaHZlSUp6aHN5VSs4?=
 =?utf-8?B?d28ySE5WYzBKMzBwbjRXZ0RZR09zcEhYV0FoUXE1aUdtMUluaGR3aTVIOHVP?=
 =?utf-8?B?QURwelZhd1N4ZDRWTlVmbFNHWE94M0JXa09WdnpZYnp0M2JHZHBEV3lFU2VW?=
 =?utf-8?B?T1VMM2dvcFJjeTExWUx6cUlWUnJUMmdTbUFRcXdIWDNsQlpNaE9BbzRjR1JW?=
 =?utf-8?B?RHlzcE53RmRxcGJNTUZqMTVxbDMxSFc3ZHkzY0d3d3N6cVViOHpSZDM0UDdK?=
 =?utf-8?B?NDk1cWo1VDlJUllaRXkrcjgvKzVDV0F5NHFnOVU3YlJtOXV0OWhuT1FKcWdy?=
 =?utf-8?B?OEdwdWNzc1MxT2JYTTBhUy9KemhCTU9HdG5IaGdadm9hS0pTL0FVY1V0Yndh?=
 =?utf-8?B?aS9RMkJ5ZllCVVJqc1NyVE12NHEweTF6OVZ3QTZDQklxU1pqb3V6ako4NWpR?=
 =?utf-8?B?ekZGdmtWOXRBNS8wcmI0OEJjMHBlbXI3VkJzSU9HYzI4cTlzQXpiaWNBaHNK?=
 =?utf-8?B?alY2S1YwdFErOWxtZHcxSjBDbC9BTUhkRmFvYlFOSVNKOVA4MkRVT3YvZWxt?=
 =?utf-8?B?aUtBLzZJKzFmZU1Kb0VLMmR1eUVVM0FzZURGTXVycCtnRnJrdVNLejgyN0hR?=
 =?utf-8?B?WEN6eUhEbkc0emk2UEhocDBubS9TZ2dMMjJRT2Q4WlNPUHhxTTBCa0pQc1Q5?=
 =?utf-8?B?RllmdWlSWkZBOC9RT3ZrcUE1Tm1LeU9ZYUNDR1hiOHZ2S2E4Nk1ma3ZIZlBi?=
 =?utf-8?B?OFlIeDdnVXpFSmtxbkVhQzZ0YjJ1OVNEME9URHRDelNyYzFkTEpjSk5LaDhP?=
 =?utf-8?B?L082YkFUL0Z6VTl6anpWSmJPTHl4MVNlWVBQaUxONkVVeGJKSTUxY2puanJV?=
 =?utf-8?B?MTk2dW8vcjc0QVRZMGZEdEdoRERYUGlqMmxyV2JUZllTa2U1aVJKcklYamtE?=
 =?utf-8?B?T0xVNG8ySTNuRjhCMzUrVXExUUZIUmdRdHJSNGlXZDVrQTViMTkzR3pWNy8r?=
 =?utf-8?B?VGRKK2ZQbnZTdjkvZGhFSU5lUHkxVmNGangyQlNvODBwbEJkaUVnSmVsZ0d4?=
 =?utf-8?B?Q0JtcWd3RFNOUFoyTFZweEZ4eEZMMy9UZEp1RlMxK01WcjBvSkZHNFh4dUxT?=
 =?utf-8?B?Tys5bmpLQk9lVGV5MVN4RHVRK0NRUEkyM2lJWDZFRnBBdVZpMzJHMkVwMWM1?=
 =?utf-8?B?MHlaYkdaa2VQdW1ZMXFnaklCTUIxQ1VKQXZTZC9CQ3pSQ05VZGNqUFBYNWt6?=
 =?utf-8?B?bE91ZHBheURUOXRsdm1xMitsaUJ6cXZUeXZPc2RCNVd1WXJIRXh3YVQ1ZDlG?=
 =?utf-8?B?bktWRVBTSWtqMSsvVjJZTTErcGpvMkVjUFMrYmNhSDRMai9yYkh0ck1vNHE5?=
 =?utf-8?B?b0ZwU3hzNEFmQlBTOEZpZXBYbWJwK1hSTWkzS2VIL0o3NldmL29IWjZ2Q0dW?=
 =?utf-8?B?MktCWUtndTZPZ0E2djBWUy9yWU00SWtzVHJqT2M3VlFYTy9WR05NWEFkRWI4?=
 =?utf-8?B?ck9JNi9pallFOUgwaks1cGxOS3VBV1dHUXY1cEd3c1owTEwzZ1hKYmhNYlNr?=
 =?utf-8?B?c21IcXplNC8vbWNkc3NqM0U4bmIwc2NWcythRHJLMkhTbjUxU2VzUTFuL1FF?=
 =?utf-8?B?SmZYVmZSYmlpWVIxa1hyT24wVjZ6T3FCN2pCWWlwS0pOb0RhemlJdFlVODBu?=
 =?utf-8?B?ZFZsdEZGaXZQb3lHREZWdDNyakFaVndxQXd3STZYUi9CdVNTMVAwZmJJVnBt?=
 =?utf-8?B?REV0cnEzY1pPSmh4bXBxR04vSkdsQ0RBcXVLcG0rRk1SbG1vTE1GL1czNFhD?=
 =?utf-8?Q?l4s99OtLN3PGKE6eoANhRVB+V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be7bcbc1-0c43-40bc-743a-08dcd6d8a63c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 05:21:57.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoK3uw3YwWo67zovnGfN5ax5PhMXfyc++qve70vF/EBhfJPMyI8qvmr06w5VgBH29QwX1ncBvp29ldLJYNoyHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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



On 17-09-2024 10:22, Nilawar, Badal wrote:
> 
> 
> On 17-09-2024 10:18, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 17-09-2024 00:12, Nilawar, Badal wrote:
>>>
>>>
>>> On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
>>>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>>>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and 
>>>> return
>>>> void.
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>>>   drivers/gpu/drm/xe/xe_pat.c        | 30 ++++++++++++++ 
>>>> +---------------
>>>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>>> xe_device.c
>>>> index 5edb1cf51ea5..cce754801e8d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>>>           drm_dbg(&xe->drm,
>>>>               "Flat CCS has been disabled in bios, May lead to 
>>>> performance impact");
>>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    return 0;
>>>>   }
>>>>   int xe_device_probe(struct xe_device *xe)
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/ 
>>>> xe/ xe_drm_client.c
>>>> index 01f643f6aaba..e5defce08281 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer 
>>>> *p, struct drm_file *file)
>>>>           fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>>>           if (fw_ref != fw) {
>>>>               hwe = NULL;
>>>> -            XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +            xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>               break;
>>>>           }
>>>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>           break;
>>>>       }
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/ 
>>>> xe/ xe_force_wake.c
>>>> index 73d37e79da9c..01b8bfdd748f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -11,6 +11,7 @@
>>>>   #include "regs/xe_reg_defs.h"
>>>>   #include "xe_gt.h"
>>>>   #include "xe_gt_printk.h"
>>>> +#include "xe_macros.h"
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_sriov.h"
>>>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct 
>>>> xe_force_wake *fw,
>>>>    * and waits for acknowledgment for domain to sleep within 
>>>> specified timeout.
>>>>    * Ensure this function is always called with return of 
>>>> xe_force_wake_get() as
>>>>    * @domains_mask.
>>>> - *
>>>> - * Returns 0 in case of success or non-zero in case of timeout of ack

Instead of changing doc here, its better to add final doc here itself.

>>>> + * Warns in case of timeout of ack from domain.
>>>>    */
>>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>>> -              int domains_mask)
>>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>>> +               int domains_mask)
>>>>   {
>>>>       struct xe_gt *gt = fw->gt;
>>>>       struct xe_force_wake_domain *domain;
>>>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>>        * in error path of individual domains.
>>>>        */
>>>>       if (!domains_mask)
>>>> -        return 0;
>>>> +        return;
>>>>       spin_lock_irqsave(&fw->lock, flags);
>>>>       for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>>>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>>       fw->awake_domains &= ~sleep;
>>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>>> -    return ret;
>>>> +    if (ret)
>>>> +        XE_WARN_ON("Timedout for domain sleep acknowledgment");

Move this warn on to patch 2/23.

>>>
>>> This looks good to me. There is no need to propagate error if domain 
>>> failed to sleep, warn on is enough. Additionally we should see if fw 
>>> domain ack bit is not cleared due to PCIe read completion timeout. 
>>> i.e. if mmio read for fw ack reg returned value 0xFFFFFFFF. This 
>>> means device is in bad state. In this case should consider putting 
>>> device in wedged state.
>>>
>>
>>
>> This seems to be good check to have. On cross verifying, I see similar 
>> implementation in i915. If you are ok, How about taking this as 
>> seperate patch ?
> 
> Yes, i915 has similar implementation. Sure, lets handle it in seperate 
> patch.
> 
> Regards,
> Badal
>>
>> BR
>> Himal
>>
>>> Regards,
>>> Badal
>>>> +
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/ 
>>>> xe/ xe_force_wake.h
>>>> index e17fe316dc3c..c2c729371b2a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>                   struct xe_force_wake *fw);
>>>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>>                      enum xe_force_wake_domains domains);
>>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>>> -              int domains_mask);
>>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>>> +               int domains_mask);
>>>>   static inline int
>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index b0126daee359..5f5760b60eac 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>>        */
>>>>       gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> -    XE_WARN_ON(err);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);

I recognize the logic behind implementing this change here since it 
won't disrupt the compilation process. By relocating XE_WARN_ON within 
force_wake_put, it's more appropriate to introduce this cleanup in 
respective patches. This particular patch will solely include the 
alteration of the return type and the documentation.

Regards,
Badal
>>>>       return 0;
>>>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>>>           xe_gt_sriov_pf_init_hw(gt);
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> -    XE_WARN_ON(err);
>>>> -
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return 0;
>>>>   err_force_wake:
>>>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>       if (err)
>>>>           goto err_out;
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> -    XE_WARN_ON(err);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_pm_runtime_put(gt_to_xe(gt));
>>>>       xe_gt_info(gt, "reset done\n");
>>>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>       return 0;
>>>>   err_out:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       XE_WARN_ON(xe_uc_start(&gt->uc));
>>>>   err_fail:
>>>>       xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>>       xe_uc_stop_prepare(&gt->uc);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   }
>>>>   int xe_gt_suspend(struct xe_gt *gt)
>>>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>       xe_gt_disable_host_l2_vram(gt);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_gt_dbg(gt, "suspended\n");
>>>>       return 0;
>>>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>   err_msg:
>>>>       err = -ETIMEDOUT;
>>>>   err_force_wake:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>>>       return err;
>>>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>       xe_gt_idle_enable_pg(gt);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_gt_dbg(gt, "resumed\n");
>>>>       return 0;
>>>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>   err_msg:
>>>>       err = -ETIMEDOUT;
>>>>   err_force_wake:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>>>       return err;
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/ 
>>>> xe/ xe_gt_debugfs.c
>>>> index 86146de1d31c..2ecf3c87c6b0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>       struct xe_hw_engine *hwe;
>>>>       enum xe_hw_engine_id id;
>>>> -    int fw_ref, err;
>>>> +    int fw_ref;
>>>>       xe_pm_runtime_get(xe);
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>       for_each_hw_engine(hwe, gt, id)
>>>>           xe_hw_engine_print(hwe, p);
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_pm_runtime_put(xe);
>>>> -    if (err)
>>>> -        return err;
>>>>       return 0;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/ 
>>>> xe_gt_idle.c
>>>> index 9af81b07ab7a..1a7ee5681da6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>>       }
>>>>       xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle- 
>>>> >powergate_enable);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   }
>>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>       XE_WARN_ON(!fw_ref);
>>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle- 
>>>> >powergate_enable);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   }
>>>>   /**
>>>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>           pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>>>           pg_status = xe_mmio_read32(&gt->mmio, 
>>>> POWERGATE_DOMAIN_STATUS);
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       }
>>>>       if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/ 
>>>> xe_guc_pc.c
>>>> index c7a00565216d..27ad412936f7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>>>> u32 *freq)
>>>>        */
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>           return -ETIMEDOUT;
>>>>       }
>>>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>>>> u32 *freq)
>>>>       *freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>>>       *freq = decode_freq(*freq);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return 0;
>>>>   }
>>>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, 
>>>> u32 *freq)
>>>>       *freq = pc_get_min_freq(pc);
>>>>   fw:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   out:
>>>>       mutex_unlock(&pc->freq_lock);
>>>>       return ret;
>>>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>           return -ETIMEDOUT;
>>>>       }
>>>>       xe_gt_idle_disable_c6(gt);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return 0;
>>>>   }
>>>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>           return -ETIMEDOUT;
>>>>       }
>>>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>       ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>>>   out:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return ret;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>>>> --- a/drivers/gpu/drm/xe/xe_oa.c
>>>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>>>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct 
>>>> xe_oa_stream *stream)
>>>>       xe_oa_free_oa_buffer(stream);
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>       xe_pm_runtime_put(stream->oa->xe);
>>>>       /* Wa_1509372804:pvc: Unset the override of GUCRC mode to 
>>>> enable rc6 */
>>>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct 
>>>> xe_oa_stream *stream,
>>>>   err_free_oa_buf:
>>>>       xe_oa_free_oa_buffer(stream);
>>>>   err_fw_put:
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_pm_runtime_put(stream->oa->xe);
>>>>       if (stream->override_gucrc)
>>>>           xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt- 
>>>> >uc.guc.pc));
>>>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>>> index 96d5ec1fbbd9..4372dd727e9f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, 
>>>> const struct xe_pat_table_entry ta
>>>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>> -    int i, err, fw_ref;
>>>> +    int i, fw_ref;
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>       if (!fw_ref)
>>>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>>       }
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   err_fw:
>>>> -    xe_assert(xe, (fw_ref && !err));
>>>> +    xe_assert(xe, !fw_ref);
>>>>   }
>>>>   static const struct xe_pat_ops xelp_pat_ops = {
>>>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>> -    int i, err, fw_ref;
>>>> +    int i, fw_ref;
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>       if (!fw_ref)
>>>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>>       }
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   err_fw:
>>>> -    xe_assert(xe, (fw_ref && !err));
>>>> +    xe_assert(xe, !fw_ref);
>>>>   }
>>>>   static const struct xe_pat_ops xehp_pat_ops = {
>>>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>> -    int i, err, fw_ref;
>>>> +    int i, fw_ref;
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>       if (!fw_ref)
>>>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>                  REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>>>       }
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   err_fw:
>>>> -    xe_assert(xe, (fw_ref && !err));
>>>> +    xe_assert(xe, !fw_ref);
>>>>   }
>>>>   static const struct xe_pat_ops xehpc_pat_ops = {
>>>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>> -    int i, err, fw_ref;
>>>> +    int i, fw_ref;
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>       if (!fw_ref)
>>>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>                  REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>>>       }
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   err_fw:
>>>> -    xe_assert(xe, (fw_ref && !err));
>>>> +    xe_assert(xe, !fw_ref);
>>>>   }
>>>>   /*
>>>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, 
>>>> const struct xe_pat_table_entry
>>>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>> -    int i, err, fw_ref;
>>>> +    int i, fw_ref;
>>>>       u32 pat;
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>              REG_FIELD_GET(XE2_COH_MODE, pat),
>>>>              pat);
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>   err_fw:
>>>> -    xe_assert(xe, (fw_ref && !err));
>>>> +    xe_assert(xe, !fw_ref);
>>>>   }
>>>>   static const struct xe_pat_ops xe2_pat_ops = {
>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>>>> xe_query.c
>>>> index 7c866b736f00..df7bdf3822cc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>       if (fw_ref != XE_FORCEWAKE_ALL)  {
>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>           return -EIO;
>>>>       }
>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/ 
>>>> xe_reg_sr.c
>>>> index 6ab6a48b1d29..874523f22f56 100644
>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr 
>>>> *sr, struct xe_gt *gt)
>>>>       xa_for_each(&sr->xa, reg, entry)
>>>>           apply_one_mmio(gt, entry);
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> -    XE_WARN_ON(err);
>>>> -
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return;
>>>>   err_force_wake:
>>>>       err = -ETIMEDOUT;
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>>   }
>>>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct 
>>>> xe_hw_engine *hwe)
>>>>           xe_mmio_write32(&gt->mmio, 
>>>> RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>>>       }
>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> -    XE_WARN_ON(err);
>>>> -
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       return;
>>>>   err_force_wake:
>>>>       err = -ETIMEDOUT;
>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>       drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/ 
>>>> xe_vram.c
>>>> index 3b5256d76d9a..1384c97a75c2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, 
>>>> u64 *vram_size,
>>>>       /* remove the tile offset so we have just the available size */
>>>>       *vram_size = offset - *tile_offset;
>>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>> +    return 0;
>>>>   }
>>>>   static void vram_fini(void *arg)
>>>
> 

