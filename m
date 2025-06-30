Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C6CC83000
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 06:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACFE10E39A;
	Mon, 30 Jun 2025 06:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9uJQUC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42F10E39A
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751265744; x=1782801744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/xYyAaEdjUlONlTz7ROP9obk3TPzOgcm6dRFVcbPT5Y=;
 b=T9uJQUC/WlMbbNk0CNMn1NCZNbT1mOm1aD5frzrIr5Wsgh1DsrxYi3kG
 rVderWJsNAcg10OKbVPmDkw+dZccW3E7Q8xM6RIaVw6CdxkBoHzE9eLS5
 EgR6JyQiz/3cZnN5aj6HGV2XJm+PG1/GYmiz0+YNc2APUmByWgCnGqAFP
 E9PmP/PfAn8nGwRZ9KL5ThEfEOf4O2uLj8vxVDF4Irf/pp3JS9lN0zk2u
 Z2B++G+BrTHCOpzM0mVeT77ZFVL46akRT6RB5Pi2B2F8C9tiafeohJWlc
 sdhNegSpUw7sqiMTgKJLnymX6+X6ANxinMhor/GKPgb56A8N/CU1qNMFF g==;
X-CSE-ConnectionGUID: ByW7rdocSFywK2gLvzOY3w==
X-CSE-MsgGUID: HBMnDfmZQHWZMFH5G4BDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63735836"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="63735836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:42:21 -0700
X-CSE-ConnectionGUID: pa0OBA0wTy+tfevlsyLmFA==
X-CSE-MsgGUID: qTr9SdTcT9q1wAs/stXbXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153916289"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:42:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:42:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 23:42:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:42:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykuLEuPxqHFMMWZ0gukS7SM9z9FqJXAO8APxf25+aiGXRBKb47vRHLwoGi7J3JwfRbJa03tMy7v/qg+/EPxXrWRQbSXudN/MTtTtVFp/DGbz8RJMtcgQJwd4GbYOiEalSelycH+sTHxlz4lGvfgWHyBQYD5AjkeHvC8d75ZUJjUnwSrbBMhmLiIgY4eH31xCD4WbKCjwd8mfgSuKjSQLxoooP/aACF5B3KLSj094bmlaH36OTX1WO2ylZqn+I7s9dVDtOzlaE7+a11JEKM9AKCyRDYGnKzplxBazNkzCbiQ8pQKGF5JqbBxBQteOnUrCsEkNym2HO5LwMBB+baIRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3gvhOlzrzSRfL/j7+EL4D8V/rRgF4TSbAYpnLze6lM=;
 b=Ty25kKfJlSa/LHnff1c2FneJnD3OXs6rihS7AdWJKApfb3WM6R3h8FIKxmvtbiZmvQMJZj/3F3Uh0nKlJLCyEFp3kV2fH0BMHzvSSu/eTQZIfnbarhBh+QJJ0eCsTbvQHHcVi4npqO9uv590X0W9sMQiVOeGqD5g1tNtDl1bXpYaNf8CD0AcZHbPfekYkLGGRrXB2WKCqQzz8viQV93QVuYYoaYOxQCEkRMFX1818CVfeXCeCcUlGSuOgAMPCWByP1o25vEKCwLF07dVUMs4LJanIbe5nELvDLy53HKS4tvxuLGQrP0B6y+//LvlQn5QWDUL92FhLX9L5pDPLKSQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Mon, 30 Jun 2025 06:42:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 06:42:08 +0000
Message-ID: <a85bfdb5-21d2-4cd7-95c0-9b6984ee990d@intel.com>
Date: Mon, 30 Jun 2025 12:12:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250627190041.238015-1-soham.purkait@intel.com>
 <20250627190041.238015-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250627190041.238015-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 37418f33-d77b-470c-24b0-08ddb7a13c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1J4WSsrNkxLOU0rN0U4TFZvV1pIVVBxNUZiekk5cTR0TzBkV1ZBYVFnUlVR?=
 =?utf-8?B?UEZvUTAxUWRxRXkzUjlVV05Ja2FzWjMrcHY5Szg3aTlUT2o0dzU3V0Q2TDRD?=
 =?utf-8?B?OWZHSVhKQlU0a3d1am5ndUdsNXBwazJyc1ZqT0hKY0ptVktVU0M5SGhwMEFi?=
 =?utf-8?B?MDZYaWcrR053L0gwc1UrU2piMFczSVQ3UlhJNnE5Y1p1TlRneXNIV2x1Undh?=
 =?utf-8?B?TFdlSUNXa01xV0NQLzIvNVpraFRaTWRSMXI1c2tGSmN5eVRadVZIUjE0c0Qr?=
 =?utf-8?B?Z3RGemt6UWhqWFc4VFpiTnViUGZ4dVlhdTM4aDNQa1hMaGFxdVBrVEJ1a2Q4?=
 =?utf-8?B?SGtwcUpDelZnNVl3dzVlV3I3SS9Nd3VmbDF6MHpSRjM3UGg1SHFhT0E5SVMy?=
 =?utf-8?B?MGZpekdZQnFHUXJmWDg4NVRGcVpJZFlBRW1JVU9LNkRJS0ZqVGRrMVc2WDdo?=
 =?utf-8?B?Ym84WVk3bzg4QTM1anZnYVVnSzJRalZNaVJXdEtyUmxJenE4RWxORGgzaldr?=
 =?utf-8?B?MEpiMmlzbHpvZUVmRXVyajA1OXFrTndJWjJGRzcrVXhid2x5VlhiZ2FnTWFK?=
 =?utf-8?B?dUJnREl2Q2l2L1h0dHJtbUZQaFJsTXlJSnR5VUIzZW1jNERaVWd2TG1LbW14?=
 =?utf-8?B?ZjQzbkx3eWdpWUtpMVFyN1l6WXNsUHhlQWF6cm90RndQM1dDMVdobDZ0YTN2?=
 =?utf-8?B?anVwbW85b01IeWxEUThXR3pURER0R1JXL1B4enZhbHRiRWQ0UTVSQ2NISUZs?=
 =?utf-8?B?QlVHalV4SkNVSVduWG5JcG5zN25yM3hQbkFNdjJaVld5dFlRcmNjUWpOdzlD?=
 =?utf-8?B?VW1YSUdBczhleFZKeHpEbzVHbHJ4dk1xSEt4c0hzSzlmVlo1VENMQzlWTWhS?=
 =?utf-8?B?WVF5UlpMOHVvWG94VUFWYmY5NEpyRkoyaHNUSzZiWXlhdzduTDZ0aXFjRXZn?=
 =?utf-8?B?eTNDLzFYMGV4STZNcDU2RTZXT1ZaY2RyOVdBRlg0TUdPK3lqdHRTdGFnUHo4?=
 =?utf-8?B?NlNWUDdGdFllcDNaemt5MDhTc21lWHYzZ0pybWwySGVubjdCMnUxRWhUMUd5?=
 =?utf-8?B?U2JqQ3BLelZjT2FKRlNROVRZNm93SHNvaExCcmFXU0JUQWp3QTdmMEltVVhp?=
 =?utf-8?B?MFR6c1AxOVBIbnlnQ1lqSFdyazZDOGZKZVl1MVMxTm5QVGNUUldxMFZnOXVq?=
 =?utf-8?B?NG9ZT2ZuRUx5SzhucDhiMWxlRGhMMFFvcnBKZ2c3NmpHUEtjbTdGc2xvc2x6?=
 =?utf-8?B?VjErU0NYSDdiUFdwaERZZUI4N3BCOEx3SnF2bkNaUXFSVnh2dWd6aVF6d0pV?=
 =?utf-8?B?OTIrRjVvcjZpL0g3SXJiUHR2NktDOE5mbEZhRnkvaDhnMWs4RjIzc0U2Y3Zw?=
 =?utf-8?B?QUwrNDcyUStGVXp3aUZjQkJMTmRXL2E2MHBJTjY2YjRObzZDeGl4ajlSVDlN?=
 =?utf-8?B?Q0NmSndmbGJ1MmQ1aWxrZXV2SnAvb3FFTlBrcTR1TGN2ZHRMbmF2a3B6WjVu?=
 =?utf-8?B?VXFReU8zbjVjblJ1WlN4MG4rQ1JBLzZKTUdyUkZrN3lVU2lEeFV5QytjSXJl?=
 =?utf-8?B?dG5NcGlvSkk0Y2t5T1BmRFVaZnVrZU9jd0hWa2Y4d3ZqaElLZU1XMURNNzR6?=
 =?utf-8?B?R3B4cXJsc1Z5Nkl5MGp6VjlzMHh4MzA3V1FqbXl3S3BZTFo5T3ZMbjIxUUR1?=
 =?utf-8?B?Z2tIOEpuNHBLSnpwZ2M3QkpjZlpGSWQ1RWtwNDJzM0VjS3Iwd0xYMURILzRR?=
 =?utf-8?B?Smk3SFV6OG9oQWlWdlYwcTNDM0dCUWcxZGNjQkNTYUlSNG04eEg5d3FmRnk5?=
 =?utf-8?B?bEhkdkM4QnNWQ1k1dUNJU1VEMEV3RE5CdzBkUXNyUk5TOEZSU2JINGJ0b1po?=
 =?utf-8?B?blZlc2FVaTJrM2lTeFhucEhnR0g3MHo2THE2eWF4cU5GT1g4b3N1MEJqdHpJ?=
 =?utf-8?Q?xj453VMKZz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjF6L1BMUmJkT0h0SnNNQzBKYnBIWW02a3FhRVEzeURhYjFxUEQydXRidmpw?=
 =?utf-8?B?bTFyTHIvQ25iSnpMcXJoc0FOWElsS0dHVUtCTks5c0hjOG9wTEJDUURxcGNM?=
 =?utf-8?B?WEJnTmdJSnlqU3VMNmY1RDBsMDhGT1Y5Z045b3VROG9yWDFIT3lHMmhRU1ZU?=
 =?utf-8?B?OXU5MWdvWVAyUTR1TGJieXExSFlsQW1tTGxIcThvNkxPeWFmYTBjb1FSbWdw?=
 =?utf-8?B?RStudnNpbU9aZWRsZkdZTjdMK1dMdjNZNzlpdHZUR2Y0U3YxMkZHWk4zc21E?=
 =?utf-8?B?aWNjN0l3V0Zqc0Jvb3ZOZ0svcWNyWWJmMjdmb0txek9EMHkyZVpWUE1id1RL?=
 =?utf-8?B?MVNMREx3dU5jNm1VVCtTay8xTUdtdEVQSWRWVitLWHdoTUJLTlJOQ3lha2tn?=
 =?utf-8?B?OGFZRmV4U29TdWJmUEdteEduWmd6WG03TCtCSUR1cjFiVzcyaWszOUo5dVhl?=
 =?utf-8?B?WW50eWxwd1N0c1UxMDFHYnJqQjdUbmgrV0psSWxDQUl0ZEQyaG1ZMzBqU25P?=
 =?utf-8?B?aisyK0RuZXFuZVpVVTMxTWVMdjRxMnZuMzFkQWlHVWc3ZTNtS0pjWHhXUVFn?=
 =?utf-8?B?MDZ4cWUwQUxkNDlaRTZNNXNBTG1FVTJqWVJOTzVDOTFNWUd3SCszTE1JMXVK?=
 =?utf-8?B?b1ZKZlpFdTVFcDM3ck84OGZSMnNVT0FWNGVYSkNnWUN0TGRBMENQamlFR2Jt?=
 =?utf-8?B?aGNEYzVDMWt3bG5ralc5Wlc3WHJCWTVoSmdZVUM0UkkxcTNqMnJzMFJUVkdk?=
 =?utf-8?B?eDlWaGVndjQyc1ZHeS90bGU0VFU0SG1XSXdGRTdreTNRVVpwYjBKM1dQSEE3?=
 =?utf-8?B?K3B3elhFbWdJZzJ1WjRXRklhMmtybTgvR3pKT0kyaFVrNXpxQW1XbUpJclYy?=
 =?utf-8?B?UWV5SVNaQ0c5TWpwVWRMVmdlYUNyem1zZng2bjJHVW1HcXZXclBYdi9ONE9B?=
 =?utf-8?B?TFpwVzlQWjZZaXduVEliSjdSbmF5bmdTZSs4a2JkOWo0aEZkemxwL3pWcE1r?=
 =?utf-8?B?TjRVRG5EVWN4UzVUc2dWaUNMYWFhejF1UnZURlBrd3ZhcHZJM1dmYmgzampm?=
 =?utf-8?B?SHAxSXl4ZmVXZUlNM2p4RUVDTG1Eby82M1o3OGNpejk0cmtyNTR1Sll0ZS8y?=
 =?utf-8?B?b0h4RGFyMDdydEE5aUZ4UXNjNkFEd0VGdG8rR0czSldTT2FXV216aEJCblFl?=
 =?utf-8?B?ZUFZN1ZhNTFHeUpDRno3Qk96bTFMa3Q1U2tTdUJ0RGdKMENSN2hpOGI1NE4y?=
 =?utf-8?B?aWlndk1NaVo0S05pZTRkbEdjT2dDRlZhRTdHWEZRc0xFY0haV0lOMzAxOFFx?=
 =?utf-8?B?bm1uaCtTSXhEdEF2QVF6RTNGVHMwZFZ1ZEkvV1ZVWkk4U0VDa2pCeDVVdTlC?=
 =?utf-8?B?VU9FekNJRnZaS2QrUkRkU04ybDlTR3h2NEhJRjVxSmJhdWRNU2dzR2Y4RTZF?=
 =?utf-8?B?QWpLbyt2QTVuTXpIVGwyM201Q3ZZUUVjaVpkOVNsRXFIYjRhMWhMSXhMWW5r?=
 =?utf-8?B?dGdkQWlEdGw3TVczeUtDMHQ3N3M5USs3WnhNQm1DZDNHNEhoRXUrdUY2YTdv?=
 =?utf-8?B?SmNrR1M2SXlsWGxKVjMzMVk1YjdRakEweWxFMWFveTJVQ1J1enZ2RXVhc2Fl?=
 =?utf-8?B?NjR0dUNobmFJUTNzSUZKV2o4R1pvSms2dkEvZ3gxbVc1VnJKdHNyWmNldjBj?=
 =?utf-8?B?TWo0cnpnbklXYUhQK2hTSHYzZGFLQmdhbGFGTVZsTFR1QWgvTENjaXY0MFhz?=
 =?utf-8?B?TURNYkNDVFpNMG1xem9HSW1ldXR3QWw5TGIzUWlIMXJSYW1qbzJsdXp0NjZk?=
 =?utf-8?B?dlR0SkxmVGozU01IemN2NlVVaFA1NnR2anhXYUFUTmVKaldPczhOZ3krMGd4?=
 =?utf-8?B?YXZKcDFzNVROZFI3OW5qU3NZTnVOL0FlZXhBbUN3bW1WdDZuMlBvSld6NUVr?=
 =?utf-8?B?alU4S3VNc1ovbVJCakZWd0dwbWZ5NEg1ZUNPc0N6aitzT2hxbjdQK1A5SWg1?=
 =?utf-8?B?MnE0cXRxUWhSanFBS2dwNTRROFEyU1VYNlMvZ0RvRUcwblloRHVXSjZsa1pV?=
 =?utf-8?B?cE12L0daV29QSnRuOEwrWC9JTWY1aGZRbzNUVjFabDBOckFqZ1YvL0RrRVJT?=
 =?utf-8?Q?3nHjkXcxtE4MFYFveWoNYOuAl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37418f33-d77b-470c-24b0-08ddb7a13c30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:42:08.7593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy2bzR5dJm3Vx/03DqvWmgZVO1Zxfyff9Gje+g+O7YdVNR9BRTYuFk2iEp/cuDuFOwmgtRgobUKCNJP6vbSbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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



On 6/28/2025 12:30 AM, Soham Purkait wrote:
> Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
> 
> v1:
>   - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
> v2:
>   - Add BMG prefix to PCIe Link state residency
>     offset macros names. (Anshman)
> v3:
>   - Rearrange residency offsets in ascending order. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..038f34698206 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>   
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +
> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
> +
>   #endif

