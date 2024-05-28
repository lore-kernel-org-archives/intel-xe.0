Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3466C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 05:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEF410E3BF;
	Tue, 28 May 2024 05:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBSTfBd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C2E10E3BF
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716872926; x=1748408926;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cs1MzlIizD8tZ/wwe4iBpozuPn4Uzj3zpaSYdZEKEM8=;
 b=KBSTfBd0TBb4CbSjlGWDkb6K8HvcQl4eazkK//uD9vakzkSjaXC45SB5
 FEO1vW5anHKFCj8zr4Pa0LX1SiX7EkBdq6okI8DyuMGL2iSsHRsi3Vcvk
 c2qvmP10UM3gsya/GIgb7QAoyYQPj6hIJEU+y7u0oyX7Y/266zaf0c4/y
 eN3M6cqV7k6lYLakKO741wPzmR+H745Xy9SoDdJwIXIYehX8nz/+PnQeS
 WbFRtQR9Hc6nq2BvDKhtpPii1U4HrhSnxw0UrzrCPvIa8K1+JopjH7PdZ
 SReN0NIgpXna+Fm0ebPXtUlLoTuJmVwugQPjRitGXU3IYddf0m4ZlFnZq w==;
X-CSE-ConnectionGUID: l4WWJgyGRviUO7pMqAMHLw==
X-CSE-MsgGUID: DgO47v/oSJ6Yg6c0qlxfGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23754871"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="23754871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:08:45 -0700
X-CSE-ConnectionGUID: 4Sjq+Y7rSuytikTn017poA==
X-CSE-MsgGUID: RZ8W9YZEQHSSz+Z2spKBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35012783"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 22:08:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 22:08:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 22:08:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 22:08:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 22:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVqvss8/t6x/fNiB7wJue0A2qmilDHNuQUMCCkzbRBuOuL3MHK2NtWdqNarT+sOw7fHd3plbh58TuZWwRILFM0cvsC3w9sJW+MOknz97bUst2QijWNeHBKGbpFCvlkkE6iKEthIGnpxro25NgI9Kysn1EPF+FOtSFXiUlvLicUsfTE9HuqexaiRnPMmUAf/6yAOwmGJFwWsX+WZ/6bjE4E4X01eja7DA3AVAY6vO0aUGojERn81nN1gN+SAdOQsIPGytH7PHiqb+jMjDEIO7mZfWirzX1FnCMFs+AVaw5Oxxa24XLtrniTaOL9xOOCg1d7eNR6Apz3Jmtfnv1mwXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceFQUVKQL0WxKq67RRB+KjxunZ0uuFVUUAdl3EaYp0I=;
 b=Hci2iwKZIipOYANEQiyphXdo9osLdUupTuLm/OcVQqgtJGMOUZ6KBSPwVWTfcLZoTIgclPaeqkS3/aqk15DZxRX+IkFhkVHuHPQRnnChZA/kFdfzoLxcnuOFI/WhvOmS+Wa5e53gLBN3h0TMZBNq0ffqLqE5lCe5s/bsnucy6/uiUDVoQyrZ9DuvDNy5Dwd8G2QBVwCVMJyiNxuAZIXpEfsKKyZfSAzqRDv0nFIL4t7egkLSAN2R0UoQIjcIHGnW9V69zwqLNtmAqdFiT26NPH01VKJ65bXOz7Z1NUkqt1LL2MjDaKdUbDA7PF89UlJaU+9Bd+CeHJhezD7zimkvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 05:08:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 05:08:41 +0000
Message-ID: <dbaf3188-0770-43ad-a352-d9bdc9242f2b@intel.com>
Date: Tue, 28 May 2024 10:38:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Add HWMON support for BMG
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
 <20240523144351.4040131-2-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240523144351.4040131-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 4443e1da-0d4d-4fce-9623-08dc7ed43dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em8yclZ2Nzd0TzRQL0xkMEtSdEZYdVRZS0g4RkZEWlVlS2YwZGg1cUNCcmNz?=
 =?utf-8?B?Ry92NVpQTXBsZlYwWFZVRU02YlMyZlY3OCs2NHA1UUh0YTNjSllxeGRXeGlp?=
 =?utf-8?B?bTBTSUIxaThVbTVFQklOb3FudTEvSUNhd093T2FBS0ozVVU3Zm5walpmemR2?=
 =?utf-8?B?Y0ZDREVSTkVDTXlab1YwRXc5bzJMVTh6THYzZVN0eFdQN05uUEhMYXc4UXM3?=
 =?utf-8?B?Q0syNjZaMkxYZHBZZTB0Rndsa0piajUxLzhmaVQ5dkh5cG40UTVjdG1qdGF4?=
 =?utf-8?B?eTdja2s4c3Bhd0RvYVoxQTlHVkpEY3QybGd2dlppMlJ2RHI4WXNCYlZXTU1K?=
 =?utf-8?B?WGV5WmVVdFhxdjFScXZ6Z3RCaGp4VnBlbURYNXJzRG5nenVjTmxyczZoOHdD?=
 =?utf-8?B?NkRJc1Z6dzlJeWRTVDRxRitGOGliY1R2ZUJ6NDU1Sk1lYlVTbm9Rc0x2c1B4?=
 =?utf-8?B?dkJzaFlnTlBEWXY3ekRuNm8yVHhJYjZPQVUxbitkOFppeUVlODJOVTgrWVJw?=
 =?utf-8?B?cFhNYkhxcWplUnYrSHlmR3lydGc1ekc4ci8wNFQreXdtY3Awa1hTWVF4K0Vu?=
 =?utf-8?B?LzFsNlFyZEhwQUVsMVp2QVpHOSsvMndrYUNqZWhQeEZndVNITmZQRlh4SThY?=
 =?utf-8?B?OXlMdTM2OUw5OU1nUG5YWEJpbFJsc1k4ZXJFUHhIeENNWmVXZlcwVXl1N3Rh?=
 =?utf-8?B?RExvVnFtVDcwc29jNTBJZlV0N1lNdHg4dkovZXYwUWE4MVdjOEJMTDZvQUdD?=
 =?utf-8?B?aDRORVFUVU9hMVl3ZWQzeWM2Q1VPR0hwTlpuMW1FdjZicTlYdFRxbkY4YmdN?=
 =?utf-8?B?NEJIR2M2NlQ0YXcwN1REd1M1UkVCQTdCOTgvenFUNGJzbnB1bTBjT3c1VTZh?=
 =?utf-8?B?S3Q0am41cGw0WUdQeVA4T2NKZk1WdDhBTG83bjNCeVpDRUdKOS9ZUEpVazVv?=
 =?utf-8?B?RVltdWtDREFMRWw4d2Znbkk5S01RRUl5eVBCNWZqaWNYSzNBN05KZ1A0Z2Z4?=
 =?utf-8?B?T1dRSXBTTWRINzdpWExCb3M4Y0RJdTdGQTZvd29OUWNyM2VvbW1mUFUzUW9m?=
 =?utf-8?B?NDE5NFRjN1BxWkFhOGVRd1g0ZElLa2ZZd0NldlBncDd1VFJaa3o3K2l1THB2?=
 =?utf-8?B?NjQxRGh4SjBRNkx0NXJ0SGhFT0FBYkxMa3V6T0RJc04vUmNDdkV4WDh3Z3Ju?=
 =?utf-8?B?QnBpaHZQVVl0U3ErRURwbWhFY2RtNmhsRTdXdEtsNml5YnM5WnBsd29vNHRH?=
 =?utf-8?B?US93akQ3UTVHWEI3MHhQZzBnSEUzUHY0bVhNVnB4cjlXa0o1Y0FybUZvQkpS?=
 =?utf-8?B?bUw0WXYxTVpGRlpkbndKSjQ2V0htS1pEUUNETWYxSzY2T20vdmdSd05INHA2?=
 =?utf-8?B?Q0N3OVRMY2hrRXNTSXN2Tm9BMVR0RVJMMmpNR1N5SWhJWFJTa0lTT1gxVG83?=
 =?utf-8?B?VGZTbU5EaVgxeTRqUm0rcy9LdWV4dGp3Q3Vqdm1mMnpTcTFnSnhsdW5DRGhX?=
 =?utf-8?B?RkRGcUh2NWsyUmdHb1RhQW9tRmE3Y2o5Ym94cUlaQk80S09CVUN4eVV5ZjRl?=
 =?utf-8?B?bHVGNERUa1B6UlZleC9HajZFVTkvVVZ3SEZrWUMyc3RFQ0FoRE9XN0hSbmdB?=
 =?utf-8?B?ZXZaNmNBNktrcUUzeFFuQ0I4MVdyUnRYSnlFVzFIRnhVclo1OFhCaFZGcFJQ?=
 =?utf-8?B?YjdHeW1pcTRqai9GVDhXWkJPbFRuS2xLZnFJNEQ3Rk9pR05tOG9YVXBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFZMCtRd1poNGlKcnR4enE0OW1NQlBLMEd2OHRMaVB1c2hYcHlHWG4xNS96?=
 =?utf-8?B?RXRCMk85d2xEQWZPajZvMjAwNjJHMGFSTE1zaDhNR2VKOTlVS0Z5VWQ4ZUNn?=
 =?utf-8?B?eCt0dytTTlVkZSsvWmtuR3hEejh3akRxVVN0eGViSjdCWDdYZEJ3VTN1MUZR?=
 =?utf-8?B?VThTcnNsUnNycXlBQTA1VVJnZml0T3RBR2NEZEEyMGtScnhTWUw0NzFzc3h5?=
 =?utf-8?B?NnB6blJmTWNrSWVEbDV5RXpTVVJIejV6K3VZVXlZVExaZUMwZVMyeUxlTk1h?=
 =?utf-8?B?OWZvc2pIS2lLWjc2NUc2eDBWMlExQVQwUGRjL0tyUXE1K01RS2ZBOFBwaWNa?=
 =?utf-8?B?REVMc0dUTmRvanhVM2grVXdxS0kralNWQjNPZWxNTU5zK3h6alhhOTE2eFA3?=
 =?utf-8?B?V0FQblVBZWhlTmx5OW5BVjMrcEVrTndQTEFNSjdyUFZqcGRPWDdIRUFTclBX?=
 =?utf-8?B?dG1oU1hYVjE5cThqaUNsTTFIaEJQZno0YmxIUWpsQWFHbk4xRS95SDFkKzk4?=
 =?utf-8?B?cVpDMmh6VWtpNTluYXZwaXhxVEdrUUtrNCs3YTVqNU5DK01ZOUtmN3hMR2RL?=
 =?utf-8?B?TVE4Z3hTaVowdFRsWXFXa2ZHVWVHazJraWJjd0lGRm5xcWdmYmpFbUduTkRk?=
 =?utf-8?B?d2lNOFFnUVJGUkdGZXNXV0kyVXk0UGsveE9nNVpIa0hsWm10K3J1cWxZSGty?=
 =?utf-8?B?NG9NdlZaSk9pN3ZsYXAwaXk4NXJVMFZ3RkpjbW82MzROVmV4dWFLenZiVTh3?=
 =?utf-8?B?M28wazRMdDRUa1NaSzdGMElvQWVLaklEZkN5ZHRFRkNnQWxDSm9KREdPamM3?=
 =?utf-8?B?ZEtiOStmemQ1S0IyZEVIT2tVSkFHV3owUmhCcmFiT0cvU1Rma3ZSZVYxcXpW?=
 =?utf-8?B?U3dNSVBKTjZmcit3blhZa2VVV2RUcGVwWHNnY0dYRHFPTU9hQkdmYzdsY2xJ?=
 =?utf-8?B?Y01XVHpraHdLeTljVDBhTGhacjVKYTcxcUw3dmlhS20yU3gvVnI1YzRwUTVT?=
 =?utf-8?B?UmtvbU5naDJ1OUx3RkVSVXVxU1ZVbUNEZWI4b0tZeFhrME1OYlhQSE94OGdo?=
 =?utf-8?B?cmpnL0J0MTc5a0hMYTFNYThFTkxKZEFTbXlPVVF6YzRsWlVFa0hnT2ZwMlhD?=
 =?utf-8?B?RjJCY3Q3UVl6MWV4TmNsdG5JNGh4QUx1alVLbkkrUHFqUlY0UHpPZ2ViSDJ5?=
 =?utf-8?B?cHloVzZJNjNNNU0xTGsvM0FVS3hTZ3lBNkpSczVmUzZ6LzlFZmRocmVWUTN1?=
 =?utf-8?B?ZDBicHlRbmY4enBDcnZNY1lxbkh3WHk1eVFJWElGRWJ3MzNyZHJuZko0WlZV?=
 =?utf-8?B?WVczeGp4b2ZHeUtsWnZEYm1yVFJDK0VZZzVTbjJ1TGZpSzBVTzExZ0Mrb1Rl?=
 =?utf-8?B?RzIrdUQ0MFlLZHpadzMxQzRDbEFJanUyY0dnNVgyN1hFRDRlVVFoOVU5djhx?=
 =?utf-8?B?SXZPdjNsSlpHdnZIWDB4UmZyNEJ4NGZzUXQzRXpzSjhudGhDUndTbXBlUXBB?=
 =?utf-8?B?Y1hNZE4xOURKVlh4SVhoV2IyZ2tpU1BwUW8vSE1IVTI3dVVwWndlbXZ6Y3Ex?=
 =?utf-8?B?bVpNeGNNNE5FNGtBVnVsK0hBWU5zcENTbTN3ZXZrVnRlWXJzc1NEREtJRG05?=
 =?utf-8?B?ZTdKUHRLSThvUldINmdNbFIxSlhsNHUyZEVHbVpCN0Vld29WaVF2WHRPSVVu?=
 =?utf-8?B?L0pSNnBTMEozNERwTXl1c0l0VVJtWFg1RFJpV1hSWjRmTnpvMnVaS3lBRURn?=
 =?utf-8?B?ZU4vNlBVMC9tSHROaHhhSXo2N0JQNmluMStuaWg2dS82dlFqdlJpL3FyOWVi?=
 =?utf-8?B?L0Q5MWIyU1M1YldQay9KNGhjSmxrcEc1VjNWbHBGN2M5emhuQU9HQytZQzEw?=
 =?utf-8?B?RWQybGl6aG80dnpvemV6ZTFORkhrblZJUERNVFZXTHl4eUI5Q2o5RFQ5c3pO?=
 =?utf-8?B?WlViZmF3S0lyS0h6dmZaZUJWaUdLdGRmODFib0JRempzc1ZBc1dLRDlNeTd4?=
 =?utf-8?B?T3oxRjQ4ZExVZktqb2RyZXEzQWpTU3ZRM3pXRG9rZDlMakRLcElkdVZ1ODly?=
 =?utf-8?B?UzN3OFVBeE83Y3dwUDFZSkJIV2laVkNRV1VlSHBsRS9QZnlXdWRlMGFEUy9D?=
 =?utf-8?B?R01NbDVTRlFBaHZUZDFWaDVwQWhLdmxKN1FrWXN3OEQ4YjZKTVJaLzdYSDl2?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4443e1da-0d4d-4fce-9623-08dc7ed43dc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:08:41.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x23+m2iNbKrSIldnMOU8qQlj5Cwp+7kqVCxidyMIHF/huDx3uTvNiVcn7Bp1qZXmnuImjJKdJ1bWjrxLK+El2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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



On 23-05-2024 20:13, Balasubramani Vivekanandan wrote:
> From: Karthik Poosa <karthik.poosa@intel.com>
> 
> Add HWMON support for BMG. Exposing the pkg power, current,
> energy info.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
> ---
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  5 +++++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 16 ++++++++++++----
>   2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 3dae858508c8..beba16d592fc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -18,4 +18,9 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
>   
> +#define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> +#define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> +#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> +
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index dca275117232..8daa070d7b1a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -86,19 +86,25 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> +			return BMG_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			return PVC_GT0_PACKAGE_RAPL_LIMIT;
>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			return PCU_CR_PACKAGE_RAPL_LIMIT;
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE)
> +			return BMG_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			return PVC_GT0_PACKAGE_POWER_SKU;
>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			return PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_BATTLEMAGE)
> +			return BMG_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_PVC)
>   			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>   		else if (xe->info.platform == XE_DG2)
>   			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> @@ -108,7 +114,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> +			return BMG_PACKAGE_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
