Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD7CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 13:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBC810E5AE;
	Wed, 13 May 2026 13:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qj0ATv12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E959110E5AE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778678859; x=1810214859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AfnOKBIkIoY6BRBQO0h82NSiMERZ9gQBcPB2GuVIeKw=;
 b=Qj0ATv127zpPYE7usjFYLe6gVf8MWvPM+yIPdePAWlTnU/Duuy32FxSf
 Qkpt6meoEbxdDQZYkoVS6CcX6JKmfVVYCvFM/3yOpO61hDGkbxrR8l+Hi
 VTglbCpPPtvpkJVOiawIXcLBzLyh3bTd/PaS46BOtYIlDOZltM9eo8vHx
 SFSpP7N97jomX39UC7l5bMuQjcDPwSsuVwzN1+C9NwLdKN5XBIQKBB8Nj
 KNfKogRk1ZNSAgG7QlS45GTH05deVWbU6ep8UKN/Ik+H4yW9RtyHJmJUS
 Kf3rOqSoNMMP3SB3wqofCTOP8Bdvn7wsPCZFXCjYv6zvFzZ0zuySGsxAV w==;
X-CSE-ConnectionGUID: aSh4z83YT6eKeXabIHPhSA==
X-CSE-MsgGUID: XyxO/KflQn+D7Gr584+v8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102272176"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="102272176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:27:38 -0700
X-CSE-ConnectionGUID: cPVuKifmQiCmmmSBFRoUzg==
X-CSE-MsgGUID: MqelMCTqRSGmP4tSPXrx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="261833192"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:27:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:27:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 06:27:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6HrsbHaWxZ70cBVbnDuNpnFQQy1R2fQ/5Mf3jLhp9ULlfDm6E1EksHsi369zO8jU2hlGWoaplVDcds+kc4ylU1PRVI+JUa7KoCk5HLwe0xRBcwsul+HLvWojJT4soeDsMmcESoZpqj358TtXdNa5Uto7aEVHgZOtYEMXzoIUpFlhztd5OKHCH+PZe+yrKImPX3V0C5Ji11B5is9RUMvwihB8V7y/1/bqHXv/fvzvO689sQUr8XURvuZ1NLj/3+/0lCDnErfXa6opiReQdz/QfQocQPrhw3moRS3zrn8acVRB0ezzvAn+YAynGZX6zn9e9GblMejNTS9Jl57H+LRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tg+CDgAE/P0qQhM0WwYmk1KYwSdu50huFP1BTVtMpU=;
 b=T34mb39Arl9Aun+OWA6EgTd5efewf3aW0sOxOydF314gFJDCc1j3Y4D+MtDRR+SNER0HNf5nn/6+pY7/MRJAU41MuYkUw81zaMA5148S9o8P52r1Q5CA7FEDDbg5mflPRDOjxjauTEzLyTGIMsMcXXTcgigKxCYGy1ooRKJEjN2HOHlKAVouZDZP9zfP9J0Z9WTlf8pKNtOU7JjxXmSYgB3h3LyKHOYiY46fKO6epuvQ+I0noUtvYBqu+N62HLdlBj4z0usaH/MtYVhwiQmr7b01S83DNsnIhOgO/A6kI2S4rALIWQY7avu/2tFplTolrAU0VmRpJkLgkq7lM+5l2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 13:27:35 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 13:27:35 +0000
Date: Wed, 13 May 2026 15:27:31 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/memirq: Enable GT_MI_USER_INTERRUPT only
Message-ID: <agR8JLDxnEkfYJ_I@nostramo>
References: <20260511172838.2299-1-michal.wajdeczko@intel.com>
 <20260511172838.2299-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511172838.2299-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA3PEPF0000051D.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::678) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 066fef81-97f3-442f-6538-08deb0f36525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2As0D+wBPnlbWWVNhurN9aBZ085Ri7OcMd3gSD4SKq+tRLFo4QhCj1YqUZXPMWJ4zd2KE4/SB+s1F5gB4ctsV4qsplVGbwJc4P8ARTjFzKRHYb/O40eNrsdqBDn+0PWW2cV8LNEpheSEHgMqnNdmOTx+h/HyVImmEnP97WvqVyJmWSSB8QKg1Gn8hb+3oyTUYTSYZ5dwShVkS1QrBu6ni6KUg9lI6z9prSLRrm7tFcXMRKckGaRfoOdFO5VMHiyN7NRwrFabJJBOOtzA/lR3xAqx4UeOMybXzvpoPqo+AFIJ8ssDduDeItWQ0CqK62u8pGMof8pN/cPEZzZn/FJGsBHrRfyP1zlhXnCYLkbVG4epSeEcf9VwV+Y1smkh1RqKMR62Be0CM5xeO2O0F4zk4AoLGMpglJNvwnOfyzvYnIMHzTiIqvQjCOlpUlrs4n6fXLfKqtDUE5228CkNUY4WkDCVQkAIXGBGAERVWOCbOhCc8yHfai+kb0mu0/BdoECt5zNb/JoqOjPIFMzwqwIBl2aEd+QOcWSmbUr0qzMPGGbObg6kGTz4IHbdgF5059bKM9w7hcMj2UeXKlsMpBsFyt/f8G7ylozIhNgVuJIwk6YoQemXsRqBHOV5B33xegqrmUECKd6Oi8fq/Qd/c1AncwnxyxrWKDFoGBfw1Y+X9VntbnQbJUEkImbm6pJyoGTh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFRHL1BFdEFScmFrMkg2NmRrN0hzWGsyZ1V6dkJUTzFoRGQ2ZTVFL2tEMkp0?=
 =?utf-8?B?ZlRFdWJrV0dCVlZHWXlUMjdLZnk3TUI2OHpzdVdETUlZalZrVThROTY4UVVJ?=
 =?utf-8?B?Q0g2TXlSQ3JxS3pmNmg5cU5VOHYvbUlkRS9LWHVJbldUeUpxMk5QRWNhS2p2?=
 =?utf-8?B?UTNUb1B4STBDNU1JY0xRZkZqRHc4NEVPa3Q2cmhsMkovS0dHVWd4Y29qSWNT?=
 =?utf-8?B?bFJmSVVwNzJrZ2s3LzhINU02SjFtQlpLQkdlMVhmWE9ZS2FhSWN6Q2t4cTVq?=
 =?utf-8?B?OExzRWtZU0YrTWpSSUZUQTBaWVZtcmFRSW8wUVNDQzEreE1Wa0xqYmI2dVky?=
 =?utf-8?B?WmdoMThmSVV4eExMekZVTi9xc2djUm1tZWlJaGVpK3JHM3NucXJUSXdlSGRL?=
 =?utf-8?B?bGtBMkhYSmgrblhVSFovZm04b2M5NHNxN0p3L3Bmc3gzTFVxbzhES3MxNVZG?=
 =?utf-8?B?VEhtcDJWb3VPMEpBYm01KzdYK2ZuL0NkUjJRRXQ5RGRVU1h3YytsWWcrMzZX?=
 =?utf-8?B?Zk93Slh4WHQ2a3RLNVdLWFdlSFJzcGI3eG5LUEw5K0pDcTlhOW1UZTZndSt3?=
 =?utf-8?B?NkhMNGt5Y3p0U3Q3MkRGSEovQlJoMHptbmJlY1Y5Rk11c1RoVUVGNGlCdzNC?=
 =?utf-8?B?MU05U3ZNYjRVV1Q3SFdiY0J3NEFScGZSWDlna0J3eWtFSXFlU1c2UURlWUxm?=
 =?utf-8?B?SkR5blR3RUtwWk1kUHNET29qb3ZWeTVGMiszK2tpOHdBeUkyUjRUL3lmT0RN?=
 =?utf-8?B?QXoxblZCOEhmQW1neXQ5Z1F3QTlaNE8rbFVlMnI5RVVoMnZEVUJaa1BlRXVX?=
 =?utf-8?B?M2tidXoxMHJsTW1ieUJTU1JFWUNGam42Y3pUa2hUbWkwRGVmTG84WkRSVmpr?=
 =?utf-8?B?V1AweUc1WTRSam1zTjJ4VGcwZFlYMzNKUFZGYkd2ZCtmMVZCb25BY1YraTVo?=
 =?utf-8?B?TjlVYkMzdzZXQm9IaU9KOEpUeExXaVBkd2Z5d2dqc3JMVkpMRFE2UHhyV1dW?=
 =?utf-8?B?TzZhVk1STjBVMUxENE4yQXMxeGtySzVnS3hmYlU0a0JIdXRRK0JnRndSQlQ0?=
 =?utf-8?B?Vkd2YUwrWTUzUnZlVlpnL1ZSS0o1OTRia2grWkg3MWJ3ems2ZXUreEFDKzRW?=
 =?utf-8?B?VUg5ZHk0MjFzallhNS9aWHZUOHFlNGN0NkFRKzIwNGZRODdaZ1pIQ1dqSGxD?=
 =?utf-8?B?Z2FWakFMSjJ3ODBoZ1VqYUlKbGRNaEdBZHg2clhLR2VSenplUlpkVWxqbU9W?=
 =?utf-8?B?UlVsaFFqeUdYMExIT3ZNWXdrbUtzeVRCY2FRQUxVUTFCeUhmS3Y3TmJGRXB6?=
 =?utf-8?B?cHVyS3hSU0xSc2t2UWllem0zNG9nTEorcWIxN1NCZklFQThpaldKWWRZVmY0?=
 =?utf-8?B?WVRTSkNROEh0MDkxNkNpYTE0TEtKbVQwNzN1L20vdTRhVDlCUWxRV2RVUEV5?=
 =?utf-8?B?Q0FOM3poUmh6Y1o2TzJwYkZ2RzdZZVV0MEtLNkxHNnlhU2tHelJ4Q1d5YUhT?=
 =?utf-8?B?NnhSeE01c0s4c1FydHZ3eGU1Q3dMdlhvR3Y0RWNoUnIrN3d6SnI1TCtUTUJO?=
 =?utf-8?B?ODhuYkQyVUtFRUowTUVQcjVsdmNzdUI3SDR3OGkxNVVKc2VjQkZvbmZ5M1dl?=
 =?utf-8?B?eVg1UjlVVFZnbnFvb2JDS0VHYThIblZSU3VDYjZmT0M3MnFMTTFjZXZXYWR3?=
 =?utf-8?B?SVJiaTl6UEt3MHhWOU5VdUMvWGo3REc2Yy9KUTQ1cGhpSnZQQ0VudHNrdDhF?=
 =?utf-8?B?ZTZPeVU3ZUR3NzN6Y3ZhR3d3RTVsc3IzeXRVNE5haVludmtxdHFZeHFIcTlz?=
 =?utf-8?B?QkprS1V2dFV0ZFdGQ1YxWlZabnR4ZER4ckZ4SGpJNThWLzRtbS9TL0ROTDV6?=
 =?utf-8?B?YXczRGp0SlJkbUNVcTJXSGxaRGcveTVvNHp5cHVCQm11bE9jVGNhZFo3NlFq?=
 =?utf-8?B?RmZHMjFkRkg1QWEzQXFPaFY1NlAzWDI1aEFaU0FicWo4RlV2b2x4bTZGc1Jr?=
 =?utf-8?B?c0dHc1pwV0lSKzVhU0dyMzZuNXR3bWRlOHdIY2pkczdRQUNTUVZ1OHQrVmVU?=
 =?utf-8?B?NUdpcDByNXZrcUQ5VUlmNy9YbSs4R1o5RTJyWFVkTS9GWDlxaHBmTmg0ZWZl?=
 =?utf-8?B?WXhyZmlRMFFGdEpMM0JESDJaSFl4aDZaWVdHaS92cDVHcS93dnduWllEbnpI?=
 =?utf-8?B?eGZuM3VHSndWOUpnNzhiTmFYRi9iL0Y0anhXQVFHdFgvRWljODlWNEZDMWNp?=
 =?utf-8?B?U253VEd1b010N2lEclVhb3AyMmloemp3MzliMCtOSUx4VDUwYmxOTlFWQUQ3?=
 =?utf-8?B?MzN6bXZXbHNoYnFub3hKNzNLNUlVaUQwdno0ajdEVnVkYkJreVBVSHpmQzNs?=
 =?utf-8?Q?Dz5+eg1L/QNkqw5I=3D?=
X-Exchange-RoutingPolicyChecked: t1/vmTPf2grgnYyr087GHLWEe4TdDS4TMIH7v9pbOLDi1/+cRutPxJhXSEY5HAvAUELZSWIIDh2JywYa3IXujgcrZMiWr6uCfqkGm627ft/k51ZG6UnufjJtJjpp8bspBACHESiC9iFS8OeZ05dBqo7xQCWmMZVCDXcV3s/R0ytk2ZYykYrigTrrwEENpxkwIIVayI14bQM+BxS2iIYY/1x/Zoo+fJqHlw1wGX66wg3OySf7wFwRiJgGFfffJHQTTPhWyWBT7u/1BmPN+ktrI606vCxJC4nRDcsObXg6hClAnjsp6IhGOpDkHyVxv6tIA3CfDwFb8Q4AVHxMl7m0VQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 066fef81-97f3-442f-6538-08deb0f36525
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 13:27:35.5235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG4LkgoJrAzGAHZgXKM2863eliIRq4GKFDdMfYH3jcvvofaGYrf1ozSSNU0fPy0vWxWphjH+vscU+PgRp2cuGRMHXHHB1x4E0BQKXNY4oi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

On Mon, May 11, 2026 at 07:28:38PM +0200, Michal Wajdeczko wrote:
> We only expect and handle the GT_MI_USER_INTERRUPT from the
> engines, there is no point in enabling other interrupts, like
> GT_CONTEXT_SWITCH_INTERRUPT, if we don't intent to handle them.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał
