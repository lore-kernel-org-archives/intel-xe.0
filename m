Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01098C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 19:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E39113636;
	Tue, 23 Apr 2024 19:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmI2AKtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAFA113636
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713901910; x=1745437910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VqCMyzV2x5sogvi36Xq6VhcXN7/iFB7lGTR7scQO0xo=;
 b=SmI2AKtT1IBfPKKbIn0qpbqJRef8lkwISpyBZcs69trSv5ZezGKN6qCd
 9An6UbnHiVQ+Fp+0CroFNr3uMgO0KQTEZtgU0Y8QR2u0o3gPbp/ipX0aC
 4bIL8LGRF4yyl4fy9wANiT3Rpo/4V8hBwod5IgcAzonaypBU7eQwm6Ulv
 lnkIcyhCkUXL8c9MDeLz5abP7DqVEoD6I2WWBQNGBhJdbKJo9O6KuErjc
 WmhYdfPDm5Jy9bqC3o4TgHLOyaLAya4CCd4CES1Ln+4bpzrhtCeJLfy2j
 An1TpIo2Mv5cYWo3jtaD7cAXkIgq4/auXCzccoHGXY5X3CQCyBwbcYqio w==;
X-CSE-ConnectionGUID: csTT5aFNQiCNhVzKGOyQrw==
X-CSE-MsgGUID: 52Q8Usy9QFSRCmXX5/O1Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13293394"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13293394"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:51:49 -0700
X-CSE-ConnectionGUID: tnTX1OhYQ0Kw+IyYlfP36w==
X-CSE-MsgGUID: 8bosR927TO2ZG4d5y+25nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24538469"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 12:51:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 12:51:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 12:51:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 12:51:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 12:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyiE6UHv1yOdypvxVeKnwtrNJI1JlTJkSh4JQMH5X1dWtF6FzkcAvPzzqXtuJOzzeS7Yg5A/ef+ywwIPScXICelgSUa3vW8c3UTFmFHMfFcgsJR9WGazCWHRveD8et2ElLCklXZiUM/Hq8au6Wyrbt15iILeXkJpnHJsFupwoX+TaBEJE7/LI4Cv4PzjnFi0Hn6IlttFi4HfZUYwiGecIBzgZOAdTM8CYj504c1tB8C2iVMIpaiN1VF/+NOu9KzFXSTDPuk5XJR1zv2Ji5P3gk0M1CroUrM6Fjb8LKnuZbgc/6AQAg6/egsKzguDO0bRlmg6meimzLTk4/i4pz5NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhU2KlyZh7Xx9fLThBj0n7u7oyGzhos+T6xEOh2Unpw=;
 b=e+ZYVq6TQ1lMCbOPU3u1pGwNERGSJc77GMtBYNyROb3fLdBuLI+B0Yo567FYKQBmA3hq6fsfCl9meEMRQ3ttw4rWg+kGrCtK7+C+AkVk7buAwv6MCR956/FksSWsDusR4v9Mymq5ocU12temdfAWcxVQs97c2GTbaj2Mrl38NEJ6QTxZzvJYmnEcaYO7efHYUzb4tlHJ7YMoWV0nMVZllk7ZTxoO+00gU6OJ0J1DoFrmLnPAZfxfVMoDnFatpgKtKfhVPt8qXhLBMm7vunvpDBEBTQucdfLxBuZFc9LLTvfIYA8TxFDBLVkQaWq+wXopK5wjYt67sEGdLESKh0fYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 19:51:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 19:51:46 +0000
Message-ID: <dd2760be-e098-4e83-bb12-e7c86e124a23@intel.com>
Date: Tue, 23 Apr 2024 12:51:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
 <tjshefhgoeyfijf7k52fhag2xdfwsmysnn4sngh53ubittpljy@hhanuebvzide>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <tjshefhgoeyfijf7k52fhag2xdfwsmysnn4sngh53ubittpljy@hhanuebvzide>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL1PR11MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e64f24-e17f-4b6a-bb6a-08dc63cece8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGF2ZW9TdFZBTXp5TVdvdE5TTFRTd3l1RndyTzNRN1UvVWF6VmsvTFpWRlBj?=
 =?utf-8?B?VSthMU1tYmtXRkpxRGtWbmlEU0t0QnM4cStMUlRVS1JWRG84bGhUaDl4Z0lv?=
 =?utf-8?B?N25GWXhVVU9mZ1p6VVEwSkt5RHRzOE5yMU9GNG0zQU5oV1dndDhqY3d6WEI5?=
 =?utf-8?B?djhleDN1eGNIMDFoZkszMktuZVdzRmVpVHBzblN5OHFKUXE1NFhrYVhBMHNr?=
 =?utf-8?B?ZlhzWnhPeHludHpFOXhQNE1UYVFWbnZ3SkZCcStMVnNiUmhFalhUeWdDaFNC?=
 =?utf-8?B?UXlrdHMwdVc2VGs2SGREV3JpVFdtZmJ4ZnlmRjNvRXk0OFhlUTNrbG9iSkt1?=
 =?utf-8?B?RjdVWEF4NFg5MXdsVWUydTM0NzdCdVUvTlpScFNsdjVMOFVMMzFLZGxLK0JE?=
 =?utf-8?B?eEtWUXdvRkJpSlJWZjE3ZDdRelVmNEJzRjVXZzdYK1QvNEpqVVcraVRYZUpz?=
 =?utf-8?B?MUVRajNjWFlQOEFySDR5a3NqdzRFZGZhTTVocUh4UEl2Z0s0OEtiSGhpTzJR?=
 =?utf-8?B?NmdTUW1VaDZJZ1lMMnRMTFoxeWw5OTJWYkNwcTJCWDdmODJ4Z2E5TjlBMkxi?=
 =?utf-8?B?enFxTkVHQmxtMGxyL2YwaGdLR1hYK0drN2swM01aaEFsZllKRVA4WDhtaWZU?=
 =?utf-8?B?amZwUTBsd1Z2OFVsV0xGOUh3ZzFLVDJGNHlJNHFtRmNaZXVrRSs2UkFJRUQ0?=
 =?utf-8?B?ZnpqU1BLa2pob0pDT0drN0JTb0RZUEs2dXpKS3gzQk5mVXhvbmtVaE41c3d6?=
 =?utf-8?B?eURwUDZZbEFYL2VIdnUrbHBQODFRbjMyRXRIY3R6d3lWMGdZcFoxNDdHZHlS?=
 =?utf-8?B?a1lGVktDd2QyODRtQ2hhdmQvekxTN2E0d1FQVFpCSWZtUlgzMHlRYTJlV0tv?=
 =?utf-8?B?VjJBcVRSaWE5WExmTTRBUVNqM2xCUnFWSkl3WVF6emhhZlZwUC9hcGZPTjYr?=
 =?utf-8?B?WVlSQUJTNnVLc3lEVW9WUGc4SHBBbVczU093amZrR3MyMDBUVXpiOXNNdnNt?=
 =?utf-8?B?Y3RXQllBb3QwK0NDcmFyU09veENubG1ORlBRUTRmbGRNQUxkM2U4c3NyU1k5?=
 =?utf-8?B?MFZkZmpzaTJxRkJ0OUxMRVFseHRSR3pWbGxOU0p5QmlLV0NoZTFTc2NwVG9E?=
 =?utf-8?B?YU5hYzZnczdDUXdOa1NyWHMwOXFEd214UXJNQUY3MTZVVC90UDhxWjNHU1ow?=
 =?utf-8?B?Z2t5ZUpHZTc2VVY4bXFIQzdzSHRhVXdGT0V1NzBHZ2JDNVlVZlFDYWxLRDJM?=
 =?utf-8?B?aVg2bGpvVDErNm1ZS2JCZXpJRDFETGowVnNtKzlzOS9UVVNwOGZiZVBscnMr?=
 =?utf-8?B?WXNOandNZjJ0bXpvN0E0d3hlZUw0bFZaK2EvQU9uWkJsUndsMzFjL2E5Tjcv?=
 =?utf-8?B?UFdqWC80UWh0VEtETkxuZXA4cDJxVVhxbE5FN3BFMkl4bGFqelBPNUdVeW14?=
 =?utf-8?B?dVVROFdjQmZrdExnTCtzSVpFM2Q2V1NaZzVIZ2p6R2JUYncrRG8wTjZOTXpD?=
 =?utf-8?B?QUpocStTWkMxc050SUZ2L2NVQ0kzcFhVYlEyajl0bHNuSm1ROGtvLzFCWE00?=
 =?utf-8?B?RjlkNHA2TjFwM1F2aHBFcExzS1N3a2dQVHJYZVZLb3luMjV6RHo3dG0wTkJo?=
 =?utf-8?B?aFMyd3ZpN1V4dFUwSHcvalBoR1JDemxMUXkxTGtjdVBFc3FyWFppajg1d09L?=
 =?utf-8?B?N3l6MUd2emtDcWMvaGlSOWYxRkRNYWNOUWRXNi81eDdlbktzR3pWVW93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXg4YkphZTN4cnIyQ254UitqaXZIYTB3NS92b2hOVGFIdjlNR3ROaDdESXZr?=
 =?utf-8?B?M0dvZU9WNm90eUpLM0NVT3p2R1AyUXhLeVA0WE1Qak1YM0RsdWxlUlhXSktK?=
 =?utf-8?B?blRPMFFuMVFva3ViTi9rVGs0SkZZeTVWY1dVMVBPbEw1TnRlY2s1UGdGaHV2?=
 =?utf-8?B?N0xjTjRJQThIZVhFdG5lZmYzZ2FQdGFKVEd6NUdvMTFVaUFkY1BienY0UjZY?=
 =?utf-8?B?MkhKakl6SUUvYmtxVG5YRTV1R3QrZ2JvUEZQcm9EbEZMMjhpWUp0elQ4MmQz?=
 =?utf-8?B?Y2kwVzdwaHQ1c0hjWHRaYXVqKzkvTENXTDNpZTNLdFNCbXNHYm9MOFgwNWJj?=
 =?utf-8?B?ckRxRDY2NUVMaEduaXV0V2xHRGIwSW1zdEN0T0NaUVh0eVhaRG9yTkJwV0FK?=
 =?utf-8?B?MVBhdFE0QkRoemIxMkhlc1M5ZnVXWWVvWXlMbFNRVzN4eW9tVW9ERmhRRkVU?=
 =?utf-8?B?V3lxVG5CWFJQUkdNWUZCU25FQjd0eWU4UG1xWVJmSVJiSEhlQmcvNjZkSWh4?=
 =?utf-8?B?dEo0ckNqUjc4ZzhSWUZsOGplR0tZMTQ2Q0hyVTFzRW5tOGpGeU1HQ2NVZWln?=
 =?utf-8?B?N1pkUDZndVloREJzNitIdGJuZUVGYWVEeEpPdXZ2SDR0WkFCRWp5ZGFKTW5X?=
 =?utf-8?B?eTc2OHZkbVhueHFVaGNMU2kxR3M3QzkxYnY2NzJmKzVQYVZ4blQrRy9lQ09z?=
 =?utf-8?B?dmFUOE0wSWNyZU12c3d2OXpvYURkaExJWlpleFc4dUlsTXNKNFdxK2Z0Vk1i?=
 =?utf-8?B?RVkrSVZOZldjS2pMcXBPb0tKTzVqMXlNQjV2N2FDeFdqSXJpZkRYU1kzUURS?=
 =?utf-8?B?U1lqZG9CMUNrRWV1OVl1c1RNNi9hRWN6TTZha1UyZWl0RG9BUy9zS2dZSHVn?=
 =?utf-8?B?SDVVbHAzeFR5MEJlZ0FiZmxXUGgyck1jditRd0xMVWFyUHVveFZtQmhxaTJt?=
 =?utf-8?B?cmpBRUcrNTkyV0ROM2o5bndRZSsxR0JIeUlYZ25UVWhFelRSMlMxOHVmQWNj?=
 =?utf-8?B?Vm9tUFlZWGU2U1ZZMzVyd2RZOXBYck15REE1TjNmS2xZQ1V0L1dBY2pBNzk3?=
 =?utf-8?B?dG5pWnpDTndjUmNJdGVqUnU2bTRzaXlXMy9XcXFLRFVyN1QweWFKeTlnak1V?=
 =?utf-8?B?amo0Q0tXclJIN28ya3FwNkxBOHNZVk45VExVUllCSW5aWU9ldmFzWkhVek54?=
 =?utf-8?B?L1NES3dxMHVMVXZOZkc3MlAwcFVmWHA3bHg4SEpPOEgxb1lOUzFIVjJlWURW?=
 =?utf-8?B?YXREaU40bHZkKzlBVThQbU8wcituVWdESXRHYWxUY1gxWnRjM2hRSmZTdndl?=
 =?utf-8?B?NUp1SUlnZk82QVBMTjJ5TDZVNFlpU0dEUUhpVWREa3g4bXlqNXdBM0ZUQXFD?=
 =?utf-8?B?NUI2Q1VUclRKMHZYUDZhWUtkdVJhbUF1LzBNTmJUb0ZyaEVWbm9zcGVsZnlY?=
 =?utf-8?B?QzlZU3JvcXhSYTV0Sjl6blh1RTU0RnVxbzIwcTdPdFhwMURHYUVPeUxjZkd4?=
 =?utf-8?B?MTVuZkxhNTBpTEtMQzdzeXkrc1dnR2JGbUlPOTk4MXpzNkZWVnhHcnRkZnNp?=
 =?utf-8?B?Q1RzSVhlN1V0aWNVRld6MlZzanlGOFhJaVg1enNJOW1NcGtHV1FSZXByUnV1?=
 =?utf-8?B?ZjdyZS9kMDAydGhJdVhMYnhFTmltS3JNSjRjK1pJajBoY3doaC9rSnRWS1Zo?=
 =?utf-8?B?UXMwWUI4RkFrNVBJWWtHV0daRm5xT0txV1FROFYwL3gyaUlYbUpnZGcrQ2ZM?=
 =?utf-8?B?MkJMWGFvMjJJRGc4Z2V6M1FMK1R6eUg3VGNMTjBpbEdUNVptT1h2bWVwaDMw?=
 =?utf-8?B?K2NOQ2NDaTNHcmlWTWVNT0dOcXBKK05ndlFOREJqems0SExKcFcveWpKSE1Q?=
 =?utf-8?B?S3p6Z1lnUTZ0aitJRkdpemZkbmp5TjZOeG9CaVM1OUxNSlRYVzBNWUxPdWJP?=
 =?utf-8?B?Nm8yZ1JNTUhmYWlLaTY1T29XQ0FhaFFYZ1ZtL1B1ajVia1ZPeC9UckJMZTFs?=
 =?utf-8?B?MEgzR2JLS3U3T1BGU20rYjFOYmhIMndabnA5c210bTJlL3RFbHZqcEhZdjVl?=
 =?utf-8?B?c1VsZ3pDcVdVRy9mNjdnemNKQndqTDZBUFo1aWNZbDMrVDZXTXZRaFVobGc4?=
 =?utf-8?B?VVJsRkhVaGQxTU9lamZnL3dnNmEvNlBqV2M2Y2EzR0ZFdnU1K3VueGg0S0k3?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e64f24-e17f-4b6a-bb6a-08dc63cece8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 19:51:46.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwVqTfMs6Cd/umYCzeHpmqJof54YqCZ8a77f/gYAMInacMdE0NrXXZ/9FMFMeacTO3xQI889yd3MZ6GysuE7+Y8gRiQ++v4zMw3XnVQ4Sj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
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


On 4/23/2024 10:43 AM, Lucas De Marchi wrote:
> On Mon, Apr 22, 2024 at 11:10:43AM GMT, Belgaumkar, Vinay wrote:
>>
>> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>>> On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>>> This WA requires us to limit media GT frequency requests to a certain
>>>> cap value during driver load as well as after driver unload. Freq 
>>>> limits
>>>> are restored after driver load completes, so perf will not be
>>>> affected during normal operations.
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>>> drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>>> drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>>>> drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>>> 4 files changed, 55 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index d85a2ba0a057..e29c152a6c4e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -30,6 +30,7 @@
>>>> #include "xe_gsc_proxy.h"
>>>> #include "xe_gt.h"
>>>> #include "xe_gt_mcr.h"
>>>> +#include "xe_guc_pc.h"
>>>> #include "xe_hwmon.h"
>>>> #include "xe_irq.h"
>>>> #include "xe_memirq.h"
>>>> @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>>> {
>>>>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend 
>>>> a 3s wait */
>>>>     struct xe_gt *gt = xe_root_mmio_gt(xe);
>>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>     int ret;
>>>>
>>>>     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>>>> @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>>>         return;
>>>>     }
>>>>
>>>> +    /* Set requested freq to mert_freq_cap before FLR */
>>>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>>>> pc->rpe_freq));
>>>> +
>>>>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>>
>>>>     /*
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>> index 60202b903687..556e73fca813 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>> @@ -19,6 +19,7 @@
>>>> #include "xe_gt.h"
>>>> #include "xe_gt_mcr.h"
>>>> #include "xe_gt_printk.h"
>>>> +#include "xe_guc_pc.h"
>>>> #include "xe_huc.h"
>>>> #include "xe_map.h"
>>>> #include "xe_mmio.h"
>>>> @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>>>     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>>>     struct xe_gt *gt = gsc_to_gt(gsc);
>>>>     struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>     u32 actions;
>>>>     int ret;
>>>>
>>>> @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>>>     if (actions & GSC_ACTION_SW_PROXY)
>>>>         xe_gsc_proxy_request_handler(gsc);
>>>>
>>>> +    /* Revert the min/max freq limits as we're done with 
>>>> GSC/driver load */
>>>> +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>>> +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>>> +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>>> +    }
>>>> +
>>>> out:
>>>>     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>>>     xe_pm_runtime_put(xe);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 521ae24f2314..7f82b6c2ad3c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -40,6 +40,8 @@
>>>> #define GT_FREQUENCY_MULTIPLIER    50
>>>> #define GT_FREQUENCY_SCALER    3
>>>>
>>>> +#define LNL_MERT_FREQ_CAP    800
>>>> +
>>>> /**
>>>>  * DOC: GuC Power Conservation (PC)
>>>>  *
>>>> @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct 
>>>> xe_guc_pc *pc, bool enable)
>>>>     xe_mmio_write32(gt, RP_CONTROL, state);
>>>> }
>>>>
>>>> -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>> {
>>>>     struct xe_gt *gt = pc_to_gt(pc);
>>>>     u32 rpnswreq;
>>>> @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct 
>>>> xe_guc_pc *pc)
>>>>         tgl_init_fused_rp_values(pc);
>>>> }
>>>>
>>>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>>> +{
>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +
>>>> +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>>
>>> that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>>> function that won't allow debugfs/.../workarounds to match reality?
>>
>> The workarounds are not initialized at this point, this is early in 
>> the driver load process.
>
> ugh... the _early() variant was supposed to be the sw part with
> minimal hw. Now we added a few super_early(),
> no_I_mean_earlier_than_super_early() variants... but with other names.
>
> How do we call xe_force_wake_init_gt() and xe_pcode_init() passing the
> gt without the gt even be initialized? Are we trying to create a house
> of cards? This init order is in an awful state :(. We should stop
> pretending we are getting the engine info from hwconfig and just fix the
> ordering so we can call xe_gt_init_early() and it really happens before
> things like loading guc.

Yup, doesn't look like an easy fix here. the GMDID is populated 
somewhere in xe_gt_init() which comes way after the early_init(). Cannot 
check for WAs unless we have that.

Thanks,

Vinay.

>
> Lucas De Marchi
