Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88877EEC285
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4962C10E314;
	Mon, 23 Feb 2026 21:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9nhuAxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAECD10E314
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771882558; x=1803418558;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFTYPfB7vvlQebygazP5NjLyCu0JH0GPKT8XIc8q2pw=;
 b=N9nhuAxo3ArbyFrnLOwS7yYvjIyY706Gw+m3SUSRYK18iaYgMZMJ+bJN
 obZ7ItsCGYgJNXwSMhTTptHg6ef6KwDEDYF2D5XRHRurDQOad5qs/htcZ
 CJz3wl4td9J9ukofY1XjJtUE55nh08DxbzqJXltqqtrplx+Icn4fw5wXY
 P6sys7Mic760LDSTbylDz15NPJfcLHcEGM4O0cZDIS5pvnoDNmlvuKcaZ
 j+nD68kkmblM/PgEE5hmUlSqZ/NLJ5+Ny6Mt7fJBl26bJfr43hqypdqPG
 bJwB1ZVKWfy+VDSYFFWzASnlrGDjNSf3GIaJkdJ+Ullrb5t3cOYNqeIbA A==;
X-CSE-ConnectionGUID: qvNF0CaDSS6XlkO2Yrytog==
X-CSE-MsgGUID: 5NDI5ZmwQGK85yW4nl4t3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83211186"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83211186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:35:57 -0800
X-CSE-ConnectionGUID: CdAZdfQoR5y7Go2lRaccIQ==
X-CSE-MsgGUID: fNf07W3qRtioObTAvKPF3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220246987"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:35:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:35:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:35:51 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:35:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiR9kfySBGzMbfowpEnCdCqxyHlpfeY+UC2Chi/twOZt5lWxMqG7UV7trlaTDPTAXymj6b1kYbe4dBu5XDXRPwPz2JGTaXhf6i443hMf2H1L+J+pi+NLCPxv5dQe6wcMCCAZA9cA5EjP40u/E1Tpno4q/OzGpbWdWjAxpf7YgJ9H0qWBc2f2pKU/uqoCbu/Tc/FysRD8LLOZ9QwYFVamjpjbS85lpvNbkEHH7c5u/COxIw/sLNIM156cCPyFFKfoXczNJQdVCLBkr3QNQ27MvP7vTZTkx5IyjxKDvWZQIZFM1MQsICKqf0TQtL0EkEdL1te4g/elq/b1V5uQS9hSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We4cnNUWqfydlCGQaelAyISpQhDE6I8pFnEfOf1II2s=;
 b=SKKTFO/2AqL7D/sBCMs0AMNANv18VPQ95ysQHKihav7xcrWJoyUvrZppGk8ZzmGqACK6ucx6Vlj96t69CSYwEZT2jRFmASkTan4eQiNDLxZbVnSTR9nL63n6gplxMvtGYcbwojACEfsSAcm2X3JvIIeRG9EuzquXKD1I3szwItQJ1FufVOx8G7YoJ4aMF0Vaf7KpAO/JV/vu5EqpdydNWR1aPbiKZLTZ0ZF/PfyRqX8dn0/APyV7y3pUZFFN2bpnWgOEEmNpwqLdiRRjqrHFITUTPWrcSe+7g0cW1DQ5KDXppj0/3c/5p/UCvp+pjCl9Es3P2RdVsVwRZF0UlmQQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 21:35:45 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:35:45 +0000
Message-ID: <44d9df63-bb4f-4bed-bc6d-3de47f232734@intel.com>
Date: Mon, 23 Feb 2026 13:35:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe: Document exec queue priority rules
To: Stuart Summers <stuart.summers@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.mrozek@intel.com>, <fei.yang@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260223212442.8923-1-stuart.summers@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260223212442.8923-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f31ee70-d509-4ae9-4147-08de732380a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1lxWDluN2k5VEsyaG1zUEJzN2FmS1NkdHo3MUJKdHJ3cy9qc0RvQjZWdllJ?=
 =?utf-8?B?VG5ZNU92L2ptWUppN3VDRjJVajJjemRXMWlCQ0M3dzlBQVM4RjArNlhURE9n?=
 =?utf-8?B?TjlGYkpRVElGemVJT3QwSmk0cXJuNnZ1VjVHelUyNzdUV0ZlZmlHSSt1UWRJ?=
 =?utf-8?B?UStjTElxSHZLVGlESFNTVVFkQzR3azNyemloUDhFU1FGU1cvaU9lQ283a21N?=
 =?utf-8?B?VVNQT3NCbW9LNE9OM2s0OURWV0RKelU1Vjc0RFJacmNST3ZIR1NPdUloZm9V?=
 =?utf-8?B?RnRxNjZQUVk0Z2RxWGI5Um1nTzZuQzJFRk9wWlZ1MHBFTlJSalFDZ3NkTDJQ?=
 =?utf-8?B?bjlld29XN0Z6bnZzZmNnREkxaWhyV0VVczNJUVE5czcwejl0em5qUlpmeWdK?=
 =?utf-8?B?Y2htLzNMeXRJcEJXSFczVVgrTW5yVWZLMjVMUWt5QklPY2tmM3hsclhHdXJG?=
 =?utf-8?B?R3N4NkhDMmZzTndLMWtsZDJab3VSNjNXTU1keFRFbmJxMEcrVlZGSC9maXdt?=
 =?utf-8?B?OGVCdU1Ud1RibE5HZWpXZkJWVEo0R0NsSjhMUytKYjNwK2VTbGdYYjY5L3lZ?=
 =?utf-8?B?dFdpZGpEY2ExRERmYXNPRjM5RUM4Rnl1UU03YVJITDJoUmI0aVEvM016UE4z?=
 =?utf-8?B?RVloRzlKcFN0TmF1Zm5RSFMwRlBJYTNCdmt6L0VnWktNYzdrYzRKYUhEbEJv?=
 =?utf-8?B?cVRXQVROMW8yRVRHOXVQY3Z1RFVMejBPRTZpWC85TklhcFhzQUtmTVdkSGV4?=
 =?utf-8?B?eUdyMm9VOHU3aWtBc1FmL3RzelZkalRoSFRDcUp3TUxFM2V6aXpEVjlJOERQ?=
 =?utf-8?B?dDVLUjROS2JLWDNXd0FOd29TNHluT21sMUtVbi9iYXhLd1I3T3pnTzVUK081?=
 =?utf-8?B?a1RGcmY0MmVIWnU3bFl0OEk5L0pNT2p4MjVTZXlmU1c0WC9CVUhnVkRsSmF3?=
 =?utf-8?B?ZEdmT3h1NU5CQkFqSmV6OXFzVll6ZFdxMkZSNGt4bW9YTnRxckcyS3hsWnlY?=
 =?utf-8?B?L0pCb1o5YXZVeDNhVmhreFlyS3VJWFlCWFFJYzNJR2VtbDFSMnJic0oxVk0r?=
 =?utf-8?B?cXU5Wi9HVkVSbVNwMDBoMTRETUZobGZic0Z3eWdDLzlQOENLOXdhZEZna2Ra?=
 =?utf-8?B?OTlKMkoza1QrTmp3VDlEanloZHdtRjFJL1Vxa2dsZ1ZOWVA5UVR1RTJEWFEv?=
 =?utf-8?B?elJ0VTdSUmNiVkwwQXJNRnVmY2ZCWDBTWDBVeGlIbnVzRkxPd3puc2czajVu?=
 =?utf-8?B?bUh3Nzd5bnlBYzhiUkgzaXBTM1lDRW4xbU1FLzRDTGFhYmowaDdpMmtXODla?=
 =?utf-8?B?Rkh6TlVSQVRMR0wwY0I0MXhueUppNlRBaXd6N0RSaEpram91UURzTTdDcmcr?=
 =?utf-8?B?SUU1U1NDNW5VOGFuc2pNT21Xdm9GQmlGK1B1MEFYcTJQTCs2ckx0VnYyMUFU?=
 =?utf-8?B?UkU5Z1RGcWloRnJoaThsTlZ4cnYwL3FZRXdINnM0cDl6UjhxS01DL0NRNFB3?=
 =?utf-8?B?SHdrdnltYkxCaTR4eXRNNkJBMERIVDFxVGwyK1RsQzFYSjlIYmwxbklIU3FD?=
 =?utf-8?B?VTRUMVpneHNVSlJldndZeG1KNEdndjE4R0FJd1F0QU1nVDB4NzIxSjNENSt0?=
 =?utf-8?B?RStKYW9UL2xOQnJXKzIzZFVGWGRHem1wTy9KUCt4K1ZjelVCQklGWlhYaU16?=
 =?utf-8?B?eXU3SHdVTXNsTDN6ZUJkY0l4L1RWL2U3b3cySUhhbklGRXg0QzA2WUFWem4v?=
 =?utf-8?B?c0VPQmh1SDB1cEM5MWpuaHJpN2FjS2xsQmpPanc5Wk96QUlZbTFOeXhvUFND?=
 =?utf-8?B?Ui9nQmFrSUtwczVXUlNDMG1WRUk2MVdEQ3JmbWxBZlZFbnJYdHA3dXFMdHdk?=
 =?utf-8?B?Wkgyb0VEM0pMUCtObjlrNGtJMC85NWtsdWJPZTVQTVpPTGdRRHhZdURyd1lT?=
 =?utf-8?B?K1p6TnNuQkRjNDlscW4ydTJtZVhDdHh2QUV6Z2w5RVd5RW96bkZudTZ3YkI0?=
 =?utf-8?B?ai9VVFpjWU51cVVFZGJSNVMyMC9mbUQ1bThRRHpUamtkeUh1VjdTUW0vWnJN?=
 =?utf-8?B?aW1qNkZXR1JlTktrWDNmcEZudTFGdGY2c3N4Qno4QUwwTWNESzB3ZTF0MU1o?=
 =?utf-8?Q?0Pd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNhcy9Ncm1lbWV6UG44WS9JNGgrbGtiMHVNVmxWRWdSVnM0MGNWbG1GOXUy?=
 =?utf-8?B?N3NsR0JJUUdwaFhCQ2pFaTA2ckp5bHFRa1JyQU1UdlNFOFlXdDk2N3BMblI5?=
 =?utf-8?B?Uzh5VmUwQktmT2svR2hBWU9XTjJ0YjVUUzlLRHVRZzc5c3NoVWJaa0tpZWZL?=
 =?utf-8?B?a3BnMDRxcUthV2lqVWd6Zk9yNCtUcXozQWQyazBOaG9xeUljcVo2OUlUN0V0?=
 =?utf-8?B?SEpuSGVYVXBxd1QxVWJreDFKOTRqN0JnemY3YXhqRnJCaVN5Y1kyd01EZkZQ?=
 =?utf-8?B?M25KcGxRM0d1YmRFSWE4V0RGeHRoRThDc2M1eUFzVEg3emN6TW80VkpQUDNj?=
 =?utf-8?B?WTc0bU9XMnpUZXN0OVI5cWRjbFB1eVpRcmQrdUtLVmlHMkNZYWgxVzlIazFL?=
 =?utf-8?B?VGpWSDJKNFRLOEE4ejlVYnQvZzFYMnhZUmFMUXlwcTZ3Q01JcGRSMURDYWhr?=
 =?utf-8?B?OHltS21MTkhXaXNDNXArRERPZGx1RTRqb3pYZlNtY0U0Q0lvOEpyR1drNE1F?=
 =?utf-8?B?SjY3d0VXdkZnNVV1c1ZTaDcrVlROeTU0SWJmcXZncUUxS2xhL0d3NGE4WXdK?=
 =?utf-8?B?TXJ5clVMcDRPRTVOeGdFbndKYlQyelk5WC8zZGtoVFIyVVdGSVdRdVoxWjZZ?=
 =?utf-8?B?YlB0cXFWSUNVYjVvc2JseGs3ZTRSV2UyTVBtcVBJUzIreU1za2xreEpmSCtX?=
 =?utf-8?B?YXYxRGpvRzR3UXhkdDQ5WFphV216bnhDbXBHTjNRc1hjZERuUHN0OVhPOFA4?=
 =?utf-8?B?VmdvUnNRckUxZUhIMm9keTlLazVMbitkNVl1ZWxxazZlQzBnNU0vQVdVNHNs?=
 =?utf-8?B?cjVUUnI0VFhGZEpTZ1h0dHZYWU12WXBGSCsxZG9vZE5KWmFRb1FnQnB1TGVB?=
 =?utf-8?B?czJyWFZBckI2YjMwUHBHUXRCTDNqekZZRVNyWXo3WkVKc0hNUDdOa21LVHp0?=
 =?utf-8?B?SWF0VFVnZ3JVUmZBaHdqeFhYa3d0Y01ZcGY3MkRFL29wN2Z1cmJkY1NUODcz?=
 =?utf-8?B?ZmpKZlMzWDYzYk9XZFp1UDdmamp0Y3RSMmh6MzhyQ0p4R0RrY1pCUjVhSHVw?=
 =?utf-8?B?WGhnL0pKTXBlMElhMklwYUt0dHZvKzRRaW9ybkJqWU9GK0pEZXZwanB0UmRH?=
 =?utf-8?B?Mi9HcjhiaEFMNGY4UlBZTGgrQUNnUVBhRjdTMlBEYllHQ0lITS9xQU5UWHBW?=
 =?utf-8?B?eFJNa3pIck1Rem9uV2VBYkpyRkJXRTlxWSt5S1c1TXc0NDFqckQ2QVZ2Qjc0?=
 =?utf-8?B?d2FNNkhsYjZ0K3llMkl5T3lhbVB1VWtVUDBPRElDYS9JcmZEQy9nMFZNOXpu?=
 =?utf-8?B?cFoyazBJTFJpSExtL252SllDQ0F1VEJHcmtxVER2dEVCNWw2R2pYYUVwQk9l?=
 =?utf-8?B?TUdoSGtTM2hSTWsrVzh6Z09Vd0loK1MwcWNneWMwblBhejdGUkFrUDJ2SWU3?=
 =?utf-8?B?WjhlMHlqelZtelBaaTdJa1hvU010Q3FuV2tvdk1DeVNSZU5tWk1yblFad2VV?=
 =?utf-8?B?WWo3WlM0dEREWnhJLzFMdC80UlB4K1RWeUtoQXlNeE96Zmc2WHoxdzJXNWZx?=
 =?utf-8?B?RC96YTBVQjhwdy9OK09kMkJuV1lvUy9Jd09WS1pFaXFVc3ZmMWZ4UWdrTG5t?=
 =?utf-8?B?dUw5WlljaUtRSzc3RDQ4dHFiSFJqOWcxSVF6NkZaRUZWaFB6MW9NbTlWaWk1?=
 =?utf-8?B?ZlZIZnBIRFk1ZmxZd1JsLzhuSmxrcERQSVRnbnAyckNmWFZYdWFZNGxzbHdL?=
 =?utf-8?B?YWF5UUN1ZUhqalA5RGJHRjVraGdEUnQ5aC9rS001OXI1eVE1U1BoZ2JJYktT?=
 =?utf-8?B?VjJVN1ZNTjhQSGExdTU4YzUzakZsZWU1QlByMGdFclFZOTRTRUpaaXJkUDdt?=
 =?utf-8?B?T3VmMkJ5ZEdSaXZtYURMNG5hK1FCTExzRW82UGIydEIrdnVNT3puc1RiT2hx?=
 =?utf-8?B?d1ZMMlZLWGtuSjUvTFQ2K2NtTzltMzdPSktoN282bS90WHgzSDRYYngwb1pK?=
 =?utf-8?B?ZU5MK0NkSnI2ZXZVWWFMUnJwV3BhazFvZ2pQN05JU08wdVZsWVloa0Y1dVo0?=
 =?utf-8?B?bUoyRmVXYWtzRWlHSG9ON1JuMjgrN3RYcVBqc2gwcFVvRWp4cWpIL0RnNE9Y?=
 =?utf-8?B?TThtUlRZUHF6Ky9TMW1LYW1JVWNKR2FocThJczlkZ0M4bi9UckdUMkNHNElV?=
 =?utf-8?B?QUsyT0xkRk5qaUtwbDQ0elpHUlBFYmt1ZE51NzhDOVRSREM0T0kxTnFQTlpR?=
 =?utf-8?B?RCtUOHRoWG0ySXIxT0FIOGRaVUJHUnhucTlJZ3lsRXdxMlhmUXBhVU1Tdlh0?=
 =?utf-8?B?elRWWmdFSHNTMHp0eHRnbGs4RjRPZE9PNllRMllTcTh4ZXUwdm9qSFNuZU5F?=
 =?utf-8?Q?UvBKdWcTA1DMFWYY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f31ee70-d509-4ae9-4147-08de732380a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:35:45.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2cLBjj76RygYqmELs+TosLBwLl9qwTfPYepD/2cZYAViimO2X6inWk1oJxJMUuYSb3zQDV7ggiQtnycOe5rRPRFSkB+Ro9FdcC1bVOqHYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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


On 2/23/2026 1:24 PM, Stuart Summers wrote:
> Add some documentation around how the GuC will employ
> the xe_exec_queue priorities provided by userspace
> application.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa..aefebfc6996e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -22,6 +22,30 @@ struct xe_guc_exec_queue;
>   struct xe_hw_engine;
>   struct xe_vm;
>   
> +/**
> + * enum xe_exec_queue_priority - Exec Queue priority values
> + *
> + * XeKMD uses GuC as the primary submission vehicle to HW.
> + * GuC has 4 priority levels that roughly map to the 4 levels
> + * shown here but in reverse order. GuC scheduler uses time
> + * slicing to determine how long a queue should remain on the
> + * command streamer before issuing a preemption request to
> + * allow execution of another queue.
> + *
> + * The following rules should be considered by applications
> + * employing these queue priorities:
> + *  - A HIGH priority request will preempt a NORMAL and LOW
> + *    priority request when submitted and based on the time
> + *    slice quantum.
> + *  - A NORMAL priority request will preempt a LOW priority
> + *    request when submitted and based on that time slice
> + *    quantum but will not preempt a HIGH priority request
> + *    until that time slice quantum has been reached.
> + *  - A LOW priority request will never preempt either a
> + *    MEDIUM or HIGH priority context.
> + *  - Currently KERNEL level priority is reserved, as the name
> + *    suggests, for kernel-submitted queues only.
> + */

This looks good to me

Reviewed-by: Daniel Charles <daniel.charles@intel.com>

>   enum xe_exec_queue_priority {
>   	XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage only */
>   	XE_EXEC_QUEUE_PRIORITY_LOW = 0,
