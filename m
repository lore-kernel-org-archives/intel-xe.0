Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C96C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 12:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D73410EB48;
	Tue, 18 Aug 2026 12:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HG3Ujz+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E810EB48
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787057734; x=1818593734;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vHpyRt5VRlHlamN9u9mBqUuLaHEgHe1QEnroybg9ECk=;
 b=HG3Ujz+zZrk4HJx3srMFsA+Qp58tFZ17rWdsW4tGiaySjuYJR4B9KKCB
 5r2S+MrCSZUUCN6SkwKlLadV9QKZyCwPNnX6xep5mrkpR7NO0QQeIqGVW
 jV7tnJpxAkwgRQ84maj42ayG8jjWLdQFs+HFGEHX5GmM6LPglx3Sk/oi3
 fIV+9nAqg5N/vjFBr0Aw1VVpWrDVC2wbVEPlAB34zpeMh1MNFyxY3HKuy
 D5vb18liKqPx/k4pGFkcYRRZ/lxtV8oMN521P4uqhlv5d9mP2UHTCT2Xo
 22RSjAX69jsc7WhQAv64cWtzTaKkj1IVKm/Byvl3oMBMMpHEUTjnLFYbX g==;
X-CSE-ConnectionGUID: c4CMfzZ5SOanL357BUUppg==
X-CSE-MsgGUID: yqQIfLA9TC+rfaB4Guj6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98912008"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98912008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:55:32 -0700
X-CSE-ConnectionGUID: zgRFEgN/S7eC6OwpG/oUQQ==
X-CSE-MsgGUID: lQnAE0VwTNCVKgD0rCBfbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263888954"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:55:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:55:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 05:55:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnF0JFX6f8Ng3zh8Ckx6dynYTFlccBpuktNJKNZKxvZwyRvyz5sWSlE3rIIY5NsC3Y51BDTkYiaQzfcmSQnOYKnyjNcc2fDf/4tOU4zcdgyOEauFnlG/hcRfoI8sss9fuC5qrqjDTW7U61r91I0b5NYU12POuRFv2/l+LUOnXENSaIRL53jjL1GbFq7J0D7S/tb/N9uV9/kf8kA6IIB7Xew6K1Rj3+bwortMAG6QSSNRiof+P5EeS9o8Ddeqh/u6XiV8j4/hm8kx5Medl0rStPjKj0arPrXbtoSepCHqxEzFYtZNzXo1N6rw39rLMQdA/7nb34z8Fp5/ovPTEsPh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31L614dokkLCyVJPbprmiQqmmWJsztx6R0AJ0LFjzmg=;
 b=VV/jnx+YTtq6X2fNaaoIRFl0SuuutgJ9u0PVwr5LMF0Wox7yzvBlDaX4pUCCCxe04gw+33dc4yFU9q+dMmb9CTWYfaIQzdAPIQo+tJrD4gNQfaEnNudCJS+ENRhlgedI4MYGi84Mf/vF4rhJYerjo2rGyNXXx8mTKz5SULRPp1Or1/T0fK8/uuhbXL7yoeElrgGwTXN9moA8ra1U8ayI0pofR/1z/Yi6Hn6zlr3CS3OKGY0q775GPP921FyVfpzFkutzh/NwsiBnf0F9e6moWnk8mBibmUZqu3Gp1a1SwzqXAF0zIoZrKxs0Hm7XmIyH+vAkIAmtawT+dW+5B4k5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:55:27 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 12:55:27 +0000
Date: Tue, 18 Aug 2026 08:55:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Message-ID: <aoRWO88_jtfv1V-g@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com>
 <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
 <aoNhZwRGQC2uh95n@intel.com>
 <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS0PR11MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bc5527-3c92-44f7-0ec3-08defd27f9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|5023799004|11063799006|10067099003|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XR/Waid92zVDI7LkDhvZmxWmOUnFpiJpAzwJ5/G4IREI4PAz6JBQrEh6CztI2y+Ud9ffTJU/BMHBq/gNa3FKkE5Ha6MkQQNdeosdt05tObi6FCxvm0jVTJtlgoqqdxsJ6mlm2ZKeK02oYKJQQSCWI40FFmyRt0xTfQzlUdmbMaxpTLF5YQVePLGF5lSO3LDAJAExkjmgH7MHy+uox3q3gsN3Gr1Kqr+ASOYe5/nbsQFQFoC5Seniuw4U35f8aRTSw+mde20TVOF2g8w3q94qW+Lisshx4qS+QVZZo5D2cHXdZje2ezL4njJ564pDX6kZrUIE/dXZI6prabDh5Lq3mSZnKT/jKIqIsWQEaCoCiK1RVFPODqsW7fxcTxjL15U28qUQdwWEbeLTWmoAZyRbdqSQTcOiU4xuFr3eM8wuWX34wPD4HpDilnb8eWFXq0FBGjFj8BSUW2f3a4TmHuMP/p5ZgGoM2T8cirNQUTvm+cOQ7KFAqQT3c3J/IdT2WVrPU+f0YfaqSXyVp2u+ziXcjnKIikwIkgn4jVhdAc79FZbycfQUq+l/iX/wbqFOOkHdBzLvabl9xnq33m5EIeY1oHJ4iHrsoTPU91JG5MbjbOpNBT5UkkemOI9vbODmuOVp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(5023799004)(11063799006)(10067099003)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm8vYUw0dzhqcHJVM1R4UDdSMnZQWVM1MmpIbEczUU5zaS8zK3I3eUQxWTJU?=
 =?utf-8?B?NjNkbnhyT3lGV3Q4R21JUmpFTmVYYjJ5ZUxiM1d0SDZxNFcxcDNRbDUvaFoy?=
 =?utf-8?B?MkhEYllVaEQ4bUlLVGlZbzFINmRuMkxYdTVvd1hLRDJxaVJwL3U5MkE5aENo?=
 =?utf-8?B?LzNWeTRWdnVKVHdDOUlVOTRlb1BDVkxxWXJPWTZ6NlZkbGZzZ0R0eXAwbHJS?=
 =?utf-8?B?bGNqMzFRLzJySGw2OFRMU0tQbWMwbmo3dVhXRzJvK2ZqRVV4VnA4aG85UEJr?=
 =?utf-8?B?MHNPNGQ5UmJlL1JSSmFDc2pJS1FVWCt4dzBxSjhIVFpUZGkxVXY4RzN6ck5E?=
 =?utf-8?B?YXRBZDVPRmZpbFdqOGJiRDhjL2JUQmRvdHh2VTNvME5XNXZzazNOYTF0bWg5?=
 =?utf-8?B?Ynh3U3RhcmFHdjM2VGJJVVJpUVdLM28xRlFaNzY0cEt0VXpHSytiRjNmY2V1?=
 =?utf-8?B?ZVQyVkFoOURvcDJFNFo1YVhtbjV3Zlo5S0pIdndJZFhLTE5rNnR0dER1bkhy?=
 =?utf-8?B?bmxaZ3R0Rml4WFlxd204MUpreFhWNHh5QjBPdXhHS1NPTXJFUUNGRE9PYXVk?=
 =?utf-8?B?VHBrVmtoLzVtWEFyakMvM0U5M1BvTE9mU3AyOU5xejNCWWpEc2c4WEdWS2dP?=
 =?utf-8?B?RmtLOXpxNmtrb1BBd1pNcmNoQUZZU1loNTZYMW5NdjFCRDdpOTBUMjNQUWJF?=
 =?utf-8?B?cGlWbkVyRWRnWmVqU1E5ZWloaXZnK3lNMk1QSjYyUDRxeVhCRzIzYlZCRzNi?=
 =?utf-8?B?V0RmKzA5RUEwakxBVmtmZTBOQkplRDFYVXM4Y2xhaUhxTk0vb2pibnEvdFVJ?=
 =?utf-8?B?MStVL0liVGxlZ05ER3Bha3JNNlJBeURadUc4Z3VVNmJ4eHdIdzhZMEdmdms4?=
 =?utf-8?B?eVRQTHUwcHIzanJGdlh2eVdsNUxDeDREMXQweW52aFlhZ3cyNDg5RElHdUlT?=
 =?utf-8?B?RHBnVm1NRDkzUm5SWlJtRWlxMGZ2aGEvRTgzQWhOcmQvbzBZSURpd1Z2anNx?=
 =?utf-8?B?OGNkUkU2cGRhdzU1WWp2MkwxNXdMd1VxbFN2VGVCcytabWVPakRCbWVEajYy?=
 =?utf-8?B?V1NmSnFaTVFYNGt3RndQZmRnU0Y3R2NuTy9YdWI0bzdlYUZGSEFQWmFlSHZ5?=
 =?utf-8?B?cC9tL043dThYZUJrNks0U3k0WGpuRlUzc3NRQUhTK1F6YTVzd0pKUUpjVzhh?=
 =?utf-8?B?c3l0bWRTYWx5S2FqM0x4WHhFUzY0aFQ3Y01sSWtNajlFeTQ3TnpKZ1lSTS9R?=
 =?utf-8?B?Z01jNG9TaDR2WWxEMTBLS2oxNmNTNXhBbUlEZVZBWFlSNVM3eGMxOU9PWWd5?=
 =?utf-8?B?MStuY01CUkttQUlkcTN3VEVlOHJyUXcrV0hJVCtjWjB6QlpCWjZUMklhaU93?=
 =?utf-8?B?cWVxV2ZHRWRzU3VzUnlDVmJpZ1JWamptaDA0OWpLZEJHODJXZEs2bGE5Y01t?=
 =?utf-8?B?TzZyUkZmL1laSmFJalpMQnVRZksvcEN0Um5Hc0JJd0hPZUZnYTM0NjRFNEFS?=
 =?utf-8?B?SUNtYk51QmwwSnE2YjN2V1RPdlBxZ3BJY2x4dW14QnI5NWxwVW52MU9jZHpt?=
 =?utf-8?B?REZRdnNFN1l1YVJnYnhhN2ZMSmRqSUlDWVhNYWt1bjlCNVF3Vm1xc3ZuVmdP?=
 =?utf-8?B?ejlpVkRRSmg0ZUNiVjZMQjlJTmwxcDRlSkFNS3lRa2FJZDY0OXhUZnlMZVp4?=
 =?utf-8?B?ZVRpSzArNCtvU3h2NWdmSFppR0FuZmtYcmFUaHF1eTRYVEQ2VGJHZTZtekpp?=
 =?utf-8?B?KzlhUHdlajNNczdCalBqNWZWa1AyTmNkQUNDLzA0Uit6QjVZR0tZeG9GUGZP?=
 =?utf-8?B?aUJibDdxbkhKMlhDem1IcUtBOTNLNUhaMXloc0IxVlpLdlJQc3NDTldCYkZ0?=
 =?utf-8?B?Um80dXowUW41aUF5c3NiQ0FMVmwzdWx5N1ZVTEw1NG1kL2laSGpiaWIvYm9F?=
 =?utf-8?B?TjFxcXRYUEZVTkdVbFAzZkxvM29qdE9JMW9tanh0L3gwc2hJUWZCQ3VaUVlB?=
 =?utf-8?B?QjJXWXZuMThXeThWK1dHaXNOM2wzVWJFeEl1czVGTTloTUtQT1pFVlhzL3JC?=
 =?utf-8?B?cDUyRFI4R1NFVFNjRC9UTmdodFZ0U2hLakwyY25US2dzMnU2WDZ6Mndlb2dF?=
 =?utf-8?B?TVlHOTVZcUdQaFVZbVhVUjVpNWgvT3R5S1cyY1IwYlR4K3d3WW1BbjhWU2hr?=
 =?utf-8?B?bGRIYnFBdWNSUzBQeDMreEh6TWgrc20vL0V1RksrRElsOUt0NFFiNXdpMXBa?=
 =?utf-8?B?Mko4ZFVWbmtySW5hYlhXNW5tT3k0NHA4cmlBOHVWWmN2VERldThITWNRSE9Q?=
 =?utf-8?B?dDIwWEw2RFhjZ1pwYmlLY3lkd0dvY3dzdFpPWklpekRaYU9BZmp0QT09?=
X-Exchange-RoutingPolicyChecked: JSvZgR6xxBCnykg6+nY5cU94yx1l5VGgSvdo9ItEEXZfNehafOOj0jlT8jIylF1byr01wBc5ViBxJ54nJ44idfrVfs52bsPD/BLBWrEGDNMb0+IlqDlf9+42pm4v7FSOcb/Gsb1QyBC59gCO6fdbiNYgzRKbKxvBvtqKJSe2RUiRd2HvK2sYsEpjoHdx0ZdcR7MEF08oEIAuQGH772Y7RCzUbX1AIssDlkBSD3UB/7ankyC0uRs41Q4jUwFyMF3LU/waB6q1s5tc95J3dKXVCL9L3csjOVbnZlkDDC1kqzu+mzMWLckcaFolDCC1WILDiPlaHhkVY8DhBOLNj8yyvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bc5527-3c92-44f7-0ec3-08defd27f9a0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:55:26.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqr4I/YC/kzjZHCW1GEcWZEpVLzD+aAYmIx0RTG+GcMfy1EGr3gpHkS5gLvVgIf3P0E8GGPZnpqJUoUsht8vCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
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

On Tue, Aug 18, 2026 at 09:08:46AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: 18 August 2026 01:01
> > To: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
> > pages
> > 
> > On Mon, Aug 17, 2026 at 07:09:46PM +0200, Michal Wajdeczko wrote:
> > >
> > >
> > > On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
> > > > On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
> > > >>
> > > >>
> > > >>> -----Original Message-----
> > > >>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> > > >>> Sent: 17 August 2026 16:57
> > > >>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > >>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > > >>> Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > >>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > >>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad
> > > >>> gpu vram pages
> > > >>>
> > > >>>
> > > >>>
> > > >>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> > > >>>> Include a sysfs interface designed to expose information about
> > > >>>> bad VRAM pages — those identified as having hardware faults
> > > >>>> (e.g., ECC errors). This interface allows userspace tools and
> > > >>>> administrators to monitor the health of the GPU's local memory
> > > >>>> and track the status of page retirement. Details on bad gpu vram
> > > >>>> pages can be found under
> > /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> > > >>>
> > > >>> since those new files are xe driver specific, shouldn't we refer
> > > >>> to them using
> > > >>>
> > > >>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
> > > >>>
> > > >>>>
> > > >>>> The format is: pfn : gpu_page_size : flags
> > > >>>
> > > >>> kernel documentation [1] says
> > > >>>
> > > >>> 	"Mixing types, expressing multiple lines of data, and doing
> > > >>> 	fancy formatting of data is heavily frowned upon"
> > > >>>
> > > >>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
> > > >>>
> > > >>> so to follow the guidelines maybe we expose the separate files:
> > > >>>
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
> > > >>>
> > > >>> or
> > > >>>
> > > >>> /sys/bus/pci/drivers/xe/<bdf>
> > > >>> |
> > > >>> +-- vram/
> > > >>>     +-- page_size	u64
> > > >>>     +-- bad_pages/
> > > >>>         +-- count	u64
> > > >>>         +-- reserved	u64[]
> > > >>>         +-- pending	u64[]
> > > >>>         +-- failed	u64[]
> > > >>>
> > > >>> then
> > > >>>
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
> > > >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
> > > >>>
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x0000000000
> > > >>> 00
> > > >>> 0000
> > > >>>
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> > > >>> 34
> > > >>> 000
> > > >>>
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> > > >>> 35
> > > >>> 000
> > > >>>
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> > > >>> 36
> > > >>> 000
> > > >>>
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> > > >>> 37
> > > >>> 000
> > > >>
> > > >> Thanks for comment, this is documented format by design doc. Sysman
> > also depending on this format. So I don’t see this can be done without design
> > being changed for everyone.
> > > >
> > > > Internal design docs don't superseed upstream documentation.
> > > > It is the other way around.
> > > >
> > > > But also, the files will be there one way or another. Both paths are
> > > > valid, so I don't believe that change in here force changes in the
> > > > userspace. Although, yes consistency is good...
> > > >
> > > > That said, I don't have a strong feeling for one way or the other.
> > > >
> > > > Since we are adding to the device level anyway, I believe it should
> > > > be okay. But Michal, do you know any doc or any precedence that kind
> > > > of force us to go the other way?
> > >
> > > hmm, are we talking here about the attribute format or folder layout?
> > >
> > > if about the latter, no strong feeling either ("files will be there
> > > one way or another")
> > >
> > > but if about the former, then the same documentation [1] earlier says:
> > >
> > > 	"Attributes should be ASCII text files, preferably with only
> > > 	"one value per file. It is noted that it may not be efficient
> > > 	"to contain only one value per file, so it is socially acceptable
> > > 	"to express an array of values of the same type.
> > >
> > > and my proposal with separate files meets that expectations (there
> > > will be either single value in the file or array of values of the same
> > > type), opposed to original idea of array of offset:page_size:flag
> > > tuples
> > 
> > doh! I'm sorry... my comment was purely driven by the other sentence above:
> > "since those new files are xe driver specific, shouldn't we refer to them using"
> > 
> > But now I looked at the content o the patch itself. This patch as is is a BIG NO!
> > It is against the sysfs rules. Period. Internal spec and other components need
> > to adjust.
> > 
> > Also please do not repeat the same PVC mistakes with tenths of lingering sysfs
> > entries. Organize this per directory as Michal told.
> > 
> > Another thing, make a design that is future ready, use 'vram0/' as the name of
> > the directory with vram0 stuff. Like we have freq0/ for instance.
> > 
> > Perhaps even
> > 
> > +-- vram0/
> >   +-- pages/
> >      +-- size u64
> >      +-- bad_pages/
> >          +-- count u64
> >          +-- reserved      u64[]
> >          +-- pending       u64[]
> >          +-- failed        u64[]
> 
> Currently information shown under vram_bad_pages(looks similar to what other competitor's  bad pages info shows), actual gives data which consumer can extract directly meaningful info out of it. With above approach, consumer need to make one, which we need to discuss with other folks. Lets discuss in a group.

2 wrongs don't make 1 right!

If you don't believe in the reviewers check the documentation yourself:

https://www.kernel.org/doc/html/latest/filesystems/sysfs.html

"Mixing types, expressing multiple lines of data, and doing fancy formatting
of data is heavily frowned upon. Doing these things may get you publicly
humiliated and your code rewritten without notice."

> 
> Tejas
> > 
> > Thanks,
> > Rodrigo.
> > 
> > >
> > > >
> > > >>
> > > >> Tejas
> > > >>>
> > > >>>>
> > > >>>> flags:
> > > >>>>   R: reserved, this gpu page is reserved.
> > > >>>>   P: pending for reserve, this gpu page is marked as bad, will be
> > > >>>>      reserved in next window of page_reserve.
> > > >>>>   F: unable to reserve, this gpu page can't be reserved due to some
> > > >>>>      reasons.
> > > >>>>
> > > >>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> > > >>>>   max_pages : 10000
> > > >>>>   0x0000000000000000 : 0x0000000000001000 : R
> > > >>>>   0x0000000000001234 : 0x0000000000001000 : P
> > > >>>>
> > > >>>> The sysfs binary attribute is created under the PCI device
> > > >>>> kobject when the platform supports it and the configfs
> > > >>>> bad_page_reservation policy is enabled. Uses RCU-protected list
> > > >>>> traversal so reads never block normal VRAM allocation operations.
> > > >>>>
