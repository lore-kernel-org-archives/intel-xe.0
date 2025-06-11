Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF1C71141
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0328210E74E;
	Wed, 11 Jun 2025 23:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahFRcPER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7C910E74E
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749685890; x=1781221890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7CNDtldqYlvVVJTEEgiKH6Fqn3tevP6uCei5tInVaXc=;
 b=ahFRcPERPKhnZ9PGZ5YW3ZMf3RUnmn0DQqZ8FXwLsk/xqK5TukbHbIUw
 kjYFm9VBlc7B/QE8wS09pxrPdhDZeZCf7Hv3qWs/N0spTGQsIBfeE7zgY
 8v24ypCluVkN4DPka8nTLmdaAqgTv/vHWGZVj8VGdOWpDnUeP/CgExKdZ
 rk170Lu7cVk1b+qx9b4csEn6Yuo7+P2/dEk6EH1uuuG5T+VJWQ7S93ibq
 Y5ZASAK2GH4YBZAkrf7zLHcwoAWHu2HdVUZNUMGdK3O1fi0f8Us2E1Gs0
 mtEpKJD1cfsy9JCH/j50w8TwII7MzCdEZ91DjUo0JDg7dgC6hN8bSmSN5 g==;
X-CSE-ConnectionGUID: L5/o00W3QrSi33AhLzkiQw==
X-CSE-MsgGUID: R8MKIGonSkSRDY3LtdbPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62882104"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="62882104"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:51:30 -0700
X-CSE-ConnectionGUID: ImMqPGx7S1CxHQJfwvD7qw==
X-CSE-MsgGUID: iaLS1eipRtSa2Gbxljlo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152341638"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:51:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:51:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 16:51:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDQCv8GQK680iiFm+aArw3pT1lmwtiNg156vrTwDR0pO8VaLaT+7TE1G2fzGa17cnLflpkjh8RmPAFN/CGllnQN7L4OY3abBfZkMP/GmByd4C9ev9Qrysvj79Xva+4njqOM6v94V5IRSsV3gmjcA+KPIxJBwov4yU2t83OplDmRyV5lUDTFyysEAsVgfNutkOVPAzKTfy+5O42f8ikR5DWjklS2lTlwcCZxr/HyocEW+gileFaFIXNwTH91p5kloWE0N8K7M1Xvl84UDaxhpZX8LQ80UuoCuI3jWVveE8rYiaP1dJX+Akzxa4zlBQPcMB0/dEaDgCStgQXaUuKn1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK+Cqpvfxckmq5O9Q8eX7xKUPeFYve9vbr996IOEY9w=;
 b=H+Qa+2P4gsC6sZar+diX3otta/6TOIKihrbYyS4JuNRCGk4wR2A+OBdHsJccGh+yRPvu7vW0l6IsvqKyIiz1/QaMeY0o78CfCuRKdpVP6TCLul3uTVM6iqRLyCi0h3InSgGa9xaQXJ0hFFDDznXDcy0D9H5/5PGa0IoHN8iryw5KWlpq1guSC6gRIUqF4Iidz9dLf3JOIW96UCwKmzOLKsbB6yZJrKetOK0wYhLTwyGwFiLd2efQolQkKbg2FCwmpQ3kgP5vwZNV+dMNbD5LSODKdPiUnnjAbqAxda/jekcigG37gKdhap7ilOpCxhvJVz+YjTyNzSpkFU4URXod/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 11 Jun
 2025 23:51:27 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 23:51:27 +0000
Message-ID: <2b862e51-ff9d-453f-b444-5783df07c600@intel.com>
Date: Wed, 11 Jun 2025 16:51:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <mgjvnmzve36ippij5wgjc37iskd5zeughb6vaceatuf55md7eq@qdtfddo5bztv>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <mgjvnmzve36ippij5wgjc37iskd5zeughb6vaceatuf55md7eq@qdtfddo5bztv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: e28556e1-5edb-4db9-3baf-08dda942e130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEdvTVhYYTR3Ukl1c1p6RUM4TlROMXpHUjhPVUdNNTJjUXpnQWVwRklJczl3?=
 =?utf-8?B?RHlKbkFjZUtZSWV0R09YWDdjclQ4MTAwbUZUV0FMMHZKWGlqRGtIc0FKTkc1?=
 =?utf-8?B?TldoOG9aT3czQ2xxVzl1YzkxeCt4T1RySlRqSXFZMUw1Z1pkYXhRd2QySXNh?=
 =?utf-8?B?VFlZWHF2T0p2MjNJZ0hMOVFnSkNhZCtTWUY2WXJLeTlHRjRiUDVWTHpqbHFh?=
 =?utf-8?B?ZUpySVhDN1g2SjJsUjlpS09MYzFaRy9SSlQrL29QNFBCTFREMDZPOVdRcXBq?=
 =?utf-8?B?dE8wYVpjSXZvUW9vYWh6RllyL2Vlb3lvN0tWdzY0RkdINDRubmI4QkpkU3pM?=
 =?utf-8?B?VzErSVJKVlRPVlROcXd3NEpjOUM3NWQ4TnZYeG5zMzArTFRGbVYxck1SVHNS?=
 =?utf-8?B?NnE2TFB1bDl3SHZuQ1h6bHEzNUpXd2VoSE9ERmozeDE5SCtWbDltSkxGVVV2?=
 =?utf-8?B?WDlHMStpdC9CSkdaWVluSERwVmtka3hlSWJ3TVc1SlE0aEVuekw5ZCtLSVUz?=
 =?utf-8?B?MzNkZ1BsQTNZdzF3aHZOL1lmbUVGblp4YU0vdm85QlY5cTdBbXJ1UTZ1NUpK?=
 =?utf-8?B?dG1OeERxOWZYaDd4bER0ditaMER4UEZGeXk3RE9JUi9WblR5VzMzdmd5UzRV?=
 =?utf-8?B?NU95ak1KZGk0L0xVaTVhVUJ2RW9ja0VqR1cwSHErYitpaHVjQlFJOUdyZnpz?=
 =?utf-8?B?ZllrcjVGampaZTdQNTNuUG1hMDdERW9BYzByQWhJYzNOU3FCMjZwRjhNOVA5?=
 =?utf-8?B?dXZZOC9MdXJCSmZaMm5ObWhDSHhFbTgza0JaWGd4YzRlanpPMStxbnpWdGlZ?=
 =?utf-8?B?UjhjYzNSNjIvdytpc3UvYVBFZ1NyazMwa2ZGaDlid1BoUzFmbEdIUVQ5M2lZ?=
 =?utf-8?B?bmUrZnAvVlZGOUQ4OVgxdmQydCthRWFobjdRYUpCR1QyVmV1TUpwL1dWTURl?=
 =?utf-8?B?U2tmNUQzZnNocFhmcUt6cXRLbXVjNU5ZSDQ1Uy9aYWJtNTVXNExQNlBKZ2p6?=
 =?utf-8?B?RGdqMDM1bUFFV1RnS0hESDlRMElhTHdEKzdhNXo4Z1VzbUJZd2NOM29yajM4?=
 =?utf-8?B?MnpyNlprb3BCeG5ZalV0OXhuaTJ3OXd2SncrWTFhL08yQWxQUmhwSm1Kc2s3?=
 =?utf-8?B?bGpzTmdoeUpVeFFZN2R2dTZLVnZ5YUJYL01ER3lGZWUwY1hzSnVQL2JWc2NN?=
 =?utf-8?B?RThjQ0VlYkhSUTJwL1NvYUNLNVJxTXNLZzU3SmZrU2Z4UnYvQ0pOc0RqaG94?=
 =?utf-8?B?M1JzeVZzTnRKN2NGSjhSeG5JUEZEVjBLY3BBTWpZVEZPZThMUWVxU045N1NG?=
 =?utf-8?B?dGVkZ2NZVU9KMm1xeXkxaXQ2azhRclJCbG9Hek8wQVhIN1drMUZYVXNNak1N?=
 =?utf-8?B?Z0FqUDJ4Z09kYVpvUUZsN0RQY1VyZWpNb05VWXNhT0hXVElOajlDVmpaOGxK?=
 =?utf-8?B?Tk9QOG9ESHVIM0MxaTVEcjZGQW52NU9FeDZFTE9GeHdLaHFvS2dCMzR5L29k?=
 =?utf-8?B?V1BNMFNxcVBVdkxWMTRySTFQTHMzdXhNSHJJZlJoR2QxSzYwazRGcDdlMElp?=
 =?utf-8?B?UnZRdjBHaWFqeDhwdmdLZ1pjQk1JZnZIK0hwMHdGQUd1bVZwMllsL3BPeC8w?=
 =?utf-8?B?eXYwNCtSYlhEYjE4VVFQeVNVOTJCbWo0SmFzbFM5Um82R05VVzU5RE9iMTNr?=
 =?utf-8?B?aDVKSm94UGRkWGNQeDAyZnloQXV3K1lXbnRsMFZ2QTJhWCtpRVlNN041WmVr?=
 =?utf-8?B?MktXTWdNUlVZVUd1OGcyZ3RWOFRLR2wzT1RlTE4yMEhGRjNKSlZyRHZmOUJL?=
 =?utf-8?B?NHA3bTRpMXQvNWZDOW52andSTkFCTURNaG8rdktFQkpWU3ZSMUpmbmFyV1h2?=
 =?utf-8?B?cXdvQmIvbmJrcGh5aEpTenZoenQzVnJydG5UT1ZJVStPQW90T2dLZjlpRVZa?=
 =?utf-8?Q?Kv08XSkIMr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akxreHZLMEF4TU9hbzhibDg4aE5uaWZUdnk2TkpuYzhMeXNPT0tmSnNDcm1n?=
 =?utf-8?B?VE0yaXlMNjVGK2NSRDU4N1FLTVJqMXVjclg1L0VEdjc5WWZ2NWdqd3B2dTgz?=
 =?utf-8?B?MTRuNXVMOTR1NmtvVC8zOTU3TnpnVjlRS2FLbjhDa0hLQ3MvaGFZMVNUTFp6?=
 =?utf-8?B?NFY0RzlzSHlvRkdrOGhScFQ2c2JqT0xUNldHZnNMc3lSQWh1ZVpwcTlzWDF5?=
 =?utf-8?B?RG80NFZKMzNRZk9qbGg0S3dteW9sVTAvcWJSeGl5ZmlOdnVNVVl5RGptK0p6?=
 =?utf-8?B?Sm1pYUE0NDFoYmx6R2lFWUtqWTZRaVFnSW5oMUw0bkNTY2hUK3p5RVZ2ZCsx?=
 =?utf-8?B?S05hbkFmVEZQSkRQQ0s3dnk0K1RWSjJ3MTJ5bzV5OUlmeUs4WVlnVWQ3OUtl?=
 =?utf-8?B?NkpZNlA0RmErTGp1SGxwWEIvaExZZHU3TFU1eTJwZmRHUytPZVhJSzc2dk1o?=
 =?utf-8?B?N1VPQmlGVkY4OFlBQ0xqM0dtVzZNbzJtdWFsc0dFb1l3ekp2VWVnWG1Dem51?=
 =?utf-8?B?OHRhblV5K2Q5Wm1rMUJSNHgweEFzNFNDUVJtYzloOUJuK1pVeTZPbURVZEI3?=
 =?utf-8?B?TGhSR1BpSVNmS3ZBbWRlZWo3eUp3eFFzTEo1TTlqUURLcmxqakdjc0NkNEJ1?=
 =?utf-8?B?WkI4Rm1YVEFtV1JMUjZIcGg2NERXZCtDSXQwZ1dVeXpWSzBWcWQ1NUlMN2oz?=
 =?utf-8?B?OXExa2RVT0tJc2ZZTHJ3SmJmTGs1V0swTGZlbVhhcTJrNWw2cUlnN00vbis0?=
 =?utf-8?B?YjZBL3dtZ2J1RHpmM0d3dTR3aTJKUkR4dUVhcEl1aWVCL3pPTkh3UGt0M2xw?=
 =?utf-8?B?MGFXNHY3ZTZBLzZiTnc3TGNqV0M0QUgxemg5K1NJVTNuWFcwSkNZVWpqOEFm?=
 =?utf-8?B?cWtCeUUwLzdhc1Bxa2lFNjAvb2FZQnpralhZZE1mZUc2aXNOeEVreE53U0Vq?=
 =?utf-8?B?ZjdpdG9KVjFHNy9iV1ZVOEdoS0ZTc05seE1Iekp1ckVIbzlCSFRSYXFiTkxC?=
 =?utf-8?B?NUlLUldNTWwvdDRKSjlmNEtwT3pMbnR5cnlpM1dMR0JyVWxLRkE1NXJENFJX?=
 =?utf-8?B?SlVIMDV5UDhXN1ZPazdJZG9TWmZIcndkVFdBVEJ0ZzdRYU95dmZjLzBRNzlt?=
 =?utf-8?B?YkVucjBLTTVpbWpVdUtYQ1FWR0ZWRDFHTnN6SGM2cnZxRStzeHg3MElQUWNw?=
 =?utf-8?B?bng2SFFIR01Zd2hYajlSb1dvdUV2SXpYWEQvMVltc2lrOTltQzFPMW5ST1NC?=
 =?utf-8?B?SnR1SjF1R0p3RXVmQVRFaEQ0dm1yamorSyt6OW4zT2FZYmRVa1VrS0tzWkVJ?=
 =?utf-8?B?aGVnNzZEbWVTRUpYd2J3dDlmMDZaL2ZpMUhtRTN4b3NGTzdId25PdEpIMFBa?=
 =?utf-8?B?bnVpWFM3SkNHakt0MTduQVB0aVBkVFdOaUN5QnU1NDM3dlY3T016OUxaeThI?=
 =?utf-8?B?aC9FSVdrYXJjcXBkbWJ5ckZCVVpwemh3cnZSaWwrQnZidWppTVZGUDB5OTI2?=
 =?utf-8?B?bjdIMFlLNk0ySzVBanFQU3dzQmZSUnQvbDl4M0lmTDBDQ0hPbGZPQTR4UkU1?=
 =?utf-8?B?RENMZnQ3bzhxczY1WDZSS1g2N3RWMlc5TE90dFk2cFUwRkZnc2J3OGl0bXNJ?=
 =?utf-8?B?eFhtclZaWjcyWU0vRnhyS2RSZDNZNUh4SElpdGVsVXNrdEZKbno5YjUxcUtx?=
 =?utf-8?B?SkYvYWdsS0hqN0lXenpBamRFbGo0YldZRGo3bUNjYzdoci9CTFpseklCcW5u?=
 =?utf-8?B?ZEszYUdnVXAySjVvUjAzTkVEaVk5Q2tZdlA0SytlZHJFK0c0WWljaXBsYUJF?=
 =?utf-8?B?aE5zUUFCdUN3WnQwZHdwNndES1NRTG1iQUtHL3pZVGVnTEFnYnZlZ2hLTUZ3?=
 =?utf-8?B?eVMwbUtVOVBqdS9jVE4xajZLa05ENXRXeklJazlhcHhkNWdYbjRDQUhvMWtZ?=
 =?utf-8?B?N0ZkTmp5V29ZcDVJYXdhUnBpc3VUQklRck1CNENNZzJwS3J1WFNJWmJuUk5X?=
 =?utf-8?B?YndrM2tYQWdEMXZKaTRUTm1MWXR3cmR6WW81QXZaNlZzWXJMdjVQL3ZsTFJn?=
 =?utf-8?B?cFU2VFdUbnIzUURXQzNQTmU1T1NWUXQ0KytoNVVLcnNzOTZCR2ZES3RXc0pR?=
 =?utf-8?B?aFJqM0hoN01LSjk2TGowVzhsQ3d0WERna1A0U0pOTm9kRjhvV2ZtTG5mSkhN?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e28556e1-5edb-4db9-3baf-08dda942e130
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:51:27.0974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNHK/lZPq7OUQimdhnjTjljs6fhZdSntHYQxnvzZjIcOjOsP3jpImXSNp+8clNHAZP7zwbnnZ1L5zii4Q3icbz8nORn5PjdvidnWnpYNOXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
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

On 6/11/2025 2:49 PM, Lucas De Marchi wrote:
> On Wed, Jun 11, 2025 at 02:05:53PM -0700, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The GuC has an option to write log data via NPK. This is basically a
>> magic IO address that GuC writes arbitrary data to and which can be
>> logged by a suitable hardware logger. This can allow retrieval of the
>> GuC log in hardware debug environments even when the system as a whole
>> dies horribly.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>> drivers/gpu/drm/xe/xe_module.c | 4 ++++
>> drivers/gpu/drm/xe/xe_module.h | 1 +
>> 3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index e16d19b44bcc..9c0e3113f7d5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>> #include "xe_guc_submit.h"
>> #include "xe_memirq.h"
>> #include "xe_mmio.h"
>> +#include "xe_module.h"
>> #include "xe_platform_types.h"
>> #include "xe_sriov.h"
>> #include "xe_uc.h"
>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>     else
>>         flags |= FIELD_PREP(GUC_LOG_VERBOSITY, 
>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>
>> +    if (xe_modparam.guc_log_target)
>> +        flags |= FIELD_PREP(GUC_LOG_DESTINATION, 
>> xe_modparam.guc_log_target);
>
> is this supported across the board for all platforms and firmware
> versions? Otherwise, what'd happen if you have and old igfx and you are
> debugging a new dgfx? or vice-versa.
All platforms that have a GuC and all firmware builds that have been 
supported under Linux. North PeaK is part of the host chipset not the 
GuC or GT.

>
> We should probably need to sanitize the user input here?
Doesn't FIELD_PREP do that already? It will ensure the value written 
does not overflow the field. And if the user is setting a dumb value 
then that's their problem. It will have no effect beyond where the GuC 
log goes.

John.

>
> Lucas De Marchi
>
>> +
>>     return flags;
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 1c4dfafbcd0b..fc8c681819b9 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -21,6 +21,7 @@
>> struct xe_modparam xe_modparam = {
>>     .probe_display = true,
>>     .guc_log_level = 3,
>> +    .guc_log_target = 0,
>>     .force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> #ifdef CONFIG_PCI_IOV
>>     .max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar 
>> size (in MiB) - <0=disable-res
>> module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>> MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>> (0=disable, 1..5=enable with verbosity min..max)");
>>
>> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 
>> 0600);
>> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target 
>> (0=memory [default], 1 = NPK, 2 = memory + NPK)");
>> +
>> module_param_named_unsafe(guc_firmware_path, 
>> xe_modparam.guc_firmware_path, charp, 0400);
>> MODULE_PARM_DESC(guc_firmware_path,
>>          "GuC firmware path to use instead of the default one");
>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>> b/drivers/gpu/drm/xe/xe_module.h
>> index 5a3bfea8b7b4..4d978f6f26b6 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -14,6 +14,7 @@ struct xe_modparam {
>>     bool probe_display;
>>     u32 force_vram_bar_size;
>>     int guc_log_level;
>> +    int guc_log_target;
>>     char *guc_firmware_path;
>>     char *huc_firmware_path;
>>     char *gsc_firmware_path;
>> -- 
>> 2.49.0
>>

